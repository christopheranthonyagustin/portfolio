-- Mindora Operational Database: migration 0001 (Milestone 1 - Knowledge Foundation)
-- Authority: MIN-PODR-M1-001 v0.1 (M1-D01 SQLite, M1-D03 scope), MIN-AUTH-M1-001 v0.1.
-- Aligned to SDD v1.4.2 vocabularies (section 10.2a). Nothing here selects an open decision:
--   * no entity or relationship type vocabulary, no extraction schema, no confidence column,
--   * no Markdown record format, no vault location (approved_change.content_ref and target_ref are opaque text).
-- Conventions
--   * Timestamps are TEXT, ISO-8601 UTC, fixed width 'YYYY-MM-DDTHH:MM:SS.fffZ' (lexical order = time order).
--   * Every connection MUST run: PRAGMA foreign_keys=ON; PRAGMA busy_timeout=<bounded>; and every write transaction
--     MUST start with BEGIN IMMEDIATE (see verification/sqlite-spike results).
--   * This file is applied once, in one transaction, by the migration runner, which records its SHA-256 in schema_migration.
--   * Forward-only: an applied migration file is never edited; change = a new numbered file.

CREATE TABLE schema_migration (
  version         INTEGER PRIMARY KEY,
  name            TEXT NOT NULL,
  checksum_sha256 TEXT NOT NULL,
  applied_at      TEXT NOT NULL
);

-- ---------------------------------------------------------------- sources and evidence
CREATE TABLE source (
  source_id        TEXT PRIMARY KEY,
  adapter_family   TEXT NOT NULL CHECK (adapter_family IN ('SA-1','SA-2','SA-3','SA-4','SA-5','SA-6')),
  locator          TEXT NOT NULL,
  source_state     TEXT NOT NULL DEFAULT 'requested'
                   CHECK (source_state IN ('requested','authorized','suspended','revoked','archived')),
  monitoring_state TEXT NOT NULL DEFAULT 'off'
                   CHECK (monitoring_state IN ('off','authorized','suspended')),
  registered_at    TEXT NOT NULL,
  updated_at       TEXT NOT NULL
);

CREATE TABLE evidence (
  evidence_id     TEXT PRIMARY KEY,
  source_id       TEXT NOT NULL REFERENCES source(source_id),
  item_locator    TEXT NOT NULL,
  fingerprint     TEXT NOT NULL,
  excerpt         TEXT,
  evidence_status TEXT NOT NULL DEFAULT 'current'
                  CHECK (evidence_status IN ('current','relocated','source_changed','ambiguous_move',
                                             'unavailable','missing','unverifiable','purged')),
  captured_at     TEXT NOT NULL,
  UNIQUE (source_id, item_locator, fingerprint)
);
CREATE INDEX evidence_source_ix ON evidence(source_id);

-- ---------------------------------------------------------------- learning jobs (SDD run states) and fencing
-- job = the durable unit of dispatch of a learning run. State tokens are the SDD run states (section 3.8a).
-- A claim is NOT a state: it is (claim_owner, lease_expires_at, claim_token). claim_token only increases.
CREATE TABLE job (
  job_id           TEXT PRIMARY KEY,
  job_type         TEXT NOT NULL,
  trigger_kind     TEXT NOT NULL CHECK (trigger_kind IN ('on_demand','change_driven','session_driven')),
  pipeline_version TEXT NOT NULL,
  config_version   TEXT NOT NULL,
  priority         INTEGER NOT NULL DEFAULT 0,
  state            TEXT NOT NULL DEFAULT 'planned'
                   CHECK (state IN ('planned','running','checkpointed','interrupted','completed','failed')),
  not_before       TEXT,
  attempt_count    INTEGER NOT NULL DEFAULT 0,
  claim_token      INTEGER NOT NULL DEFAULT 0,
  claim_owner      TEXT,
  lease_expires_at TEXT,
  checkpoint_json  TEXT,
  last_error       TEXT,
  created_at       TEXT NOT NULL,
  updated_at       TEXT NOT NULL,
  -- a claim exists exactly while the job is running or checkpointed
  CHECK ((state IN ('running','checkpointed')) = (claim_owner IS NOT NULL AND lease_expires_at IS NOT NULL))
);
CREATE INDEX job_dispatch_ix ON job(state, not_before, priority);
CREATE INDEX job_lease_ix    ON job(lease_expires_at);

CREATE TABLE job_state_transition (
  from_state TEXT NOT NULL,
  to_state   TEXT NOT NULL,
  PRIMARY KEY (from_state, to_state)
);
-- SDD 3.8a transitions, plus checkpointed -> interrupted (a crash between items must be detectable; SDD gap recorded
-- in docs/implementation/M1-IMPLEMENTATION-NOTES.md). 'failed' is terminal: a new run is a new job row.
INSERT INTO job_state_transition(from_state,to_state) VALUES
  ('planned','running'),
  ('running','checkpointed'),
  ('checkpointed','running'),
  ('running','interrupted'),
  ('checkpointed','interrupted'),
  ('interrupted','running'),
  ('running','completed'),
  ('running','failed');

CREATE TRIGGER job_state_guard BEFORE UPDATE OF state ON job
WHEN NEW.state <> OLD.state
 AND NOT EXISTS (SELECT 1 FROM job_state_transition t WHERE t.from_state = OLD.state AND t.to_state = NEW.state)
BEGIN
  SELECT RAISE(ABORT, 'illegal job state transition');
END;

CREATE TRIGGER job_claim_token_monotonic BEFORE UPDATE OF claim_token ON job
WHEN NEW.claim_token < OLD.claim_token
BEGIN
  SELECT RAISE(ABORT, 'claim_token must not decrease');
END;

CREATE TABLE job_execution (
  execution_id  INTEGER PRIMARY KEY AUTOINCREMENT,
  job_id        TEXT NOT NULL REFERENCES job(job_id),
  attempt_no    INTEGER NOT NULL,
  claim_token   INTEGER NOT NULL,
  claim_owner   TEXT NOT NULL,
  started_at    TEXT NOT NULL,
  ended_at      TEXT,
  outcome       TEXT NOT NULL DEFAULT 'running'
                CHECK (outcome IN ('running','completed','failed','interrupted','fenced')),
  error_summary TEXT,
  UNIQUE (job_id, claim_token)
);

-- per-item checkpoints and idempotency (SDD 6.3): key = adapter + locator + fingerprint + pipeline + configuration version
CREATE TABLE job_item (
  job_id                TEXT NOT NULL REFERENCES job(job_id),
  item_key              TEXT NOT NULL,
  idempotency_key       TEXT NOT NULL,
  item_status           TEXT NOT NULL DEFAULT 'pending' CHECK (item_status IN ('pending','done','failed')),
  stage                 TEXT,
  completed_claim_token INTEGER,
  completed_at          TEXT,
  PRIMARY KEY (job_id, item_key)
);

CREATE TABLE item_ledger (
  idempotency_key  TEXT PRIMARY KEY,
  adapter_id       TEXT NOT NULL,
  locator          TEXT NOT NULL,
  fingerprint      TEXT NOT NULL,
  pipeline_version TEXT NOT NULL,
  config_version   TEXT NOT NULL,
  first_job_id     TEXT NOT NULL REFERENCES job(job_id),
  completed_at     TEXT NOT NULL,
  UNIQUE (adapter_id, locator, fingerprint, pipeline_version, config_version)
);

-- ---------------------------------------------------------------- provider calls (provenance)
-- M1-D02: only a local deterministic stand-in. The CHECK below blocks any hosted call at the data layer;
-- relaxing it requires a deliberate new migration approved by the Product Owner.
CREATE TABLE provider_call (
  call_id             INTEGER PRIMARY KEY AUTOINCREMENT,
  job_id              TEXT NOT NULL REFERENCES job(job_id),
  item_key            TEXT,
  provider_kind       TEXT NOT NULL CHECK (provider_kind = 'local'),
  provider_name       TEXT NOT NULL,
  operation           TEXT NOT NULL,
  request_fingerprint TEXT NOT NULL,
  decision            TEXT NOT NULL CHECK (decision IN ('allowed','denied')),
  outcome             TEXT NOT NULL CHECK (outcome IN ('success','invalid_output','empty_output','failure','denied')),
  error_summary       TEXT,
  called_at           TEXT NOT NULL
);

-- ---------------------------------------------------------------- candidates, human approval, approved changes
CREATE TABLE candidate (
  candidate_id            TEXT PRIMARY KEY,           -- deterministic identity computed by the application (SDD 6.3)
  job_id                  TEXT NOT NULL REFERENCES job(job_id),
  claim_text              TEXT NOT NULL,
  candidate_kind          TEXT NOT NULL,              -- opaque in M1: no vocabulary is approved
  origin                  TEXT NOT NULL CHECK (origin IN ('user_provided','source_extracted','ai_inferred','agent_submitted')),
  payload_json            TEXT,
  candidate_status        TEXT NOT NULL DEFAULT 'pending_review'
                          CHECK (candidate_status IN ('pending_review','invalid','approved','rejected','deferred',
                                                      'clarification_requested','correction_requested','stale','failed_retry')),
  produced_by_claim_token INTEGER NOT NULL,           -- the claim under which the candidate was committed (fencing evidence)
  created_at              TEXT NOT NULL,
  updated_at              TEXT NOT NULL
);
CREATE INDEX candidate_job_ix ON candidate(job_id);

CREATE TABLE candidate_evidence (
  candidate_id TEXT NOT NULL REFERENCES candidate(candidate_id),
  evidence_id  TEXT NOT NULL REFERENCES evidence(evidence_id),
  span_json    TEXT,
  PRIMARY KEY (candidate_id, evidence_id)
);

-- Human decisions only (PO-D02). actor_kind is constrained to 'human': no AI component can record an approval.
CREATE TABLE approval (
  approval_id      TEXT PRIMARY KEY,
  candidate_id     TEXT NOT NULL REFERENCES candidate(candidate_id),
  decision_outcome TEXT NOT NULL CHECK (decision_outcome IN ('approved','rejected','deferred','clarification_requested','superseded')),
  decided_by       TEXT NOT NULL,
  actor_kind       TEXT NOT NULL CHECK (actor_kind = 'human'),
  rationale        TEXT,
  decided_at       TEXT NOT NULL
);

CREATE TRIGGER candidate_terminal_guard BEFORE UPDATE OF candidate_status ON candidate
WHEN OLD.candidate_status IN ('approved','rejected') AND NEW.candidate_status <> OLD.candidate_status
BEGIN
  SELECT RAISE(ABORT, 'approved or rejected candidates are terminal');
END;

CREATE TRIGGER candidate_approved_requires_human_approval BEFORE UPDATE OF candidate_status ON candidate
WHEN NEW.candidate_status = 'approved'
 AND NOT EXISTS (SELECT 1 FROM approval a
                 WHERE a.candidate_id = NEW.candidate_id AND a.decision_outcome = 'approved' AND a.actor_kind = 'human')
BEGIN
  SELECT RAISE(ABORT, 'candidate cannot be approved without a human approval record');
END;

-- Foundation of the controlled-write mechanism. This table records the authorization to change canonical knowledge;
-- it does NOT write the vault. Vault location and record format are open decisions (no vault write exists in M1).
CREATE TABLE approved_change (
  change_id     TEXT PRIMARY KEY,
  candidate_id  TEXT NOT NULL REFERENCES candidate(candidate_id),
  approval_id   TEXT NOT NULL REFERENCES approval(approval_id),
  target_ref    TEXT NOT NULL,
  base_version  TEXT,
  content_ref   TEXT NOT NULL,
  change_state  TEXT NOT NULL DEFAULT 'approved' CHECK (change_state IN ('approved','applying','applied','blocked','failed')),
  created_at    TEXT NOT NULL,
  applied_at    TEXT,
  error_summary TEXT
);

CREATE TRIGGER approved_change_requires_human_approval BEFORE INSERT ON approved_change
WHEN NOT EXISTS (SELECT 1 FROM approval a
                 WHERE a.approval_id = NEW.approval_id AND a.candidate_id = NEW.candidate_id
                   AND a.decision_outcome = 'approved' AND a.actor_kind = 'human')
BEGIN
  SELECT RAISE(ABORT, 'approved_change requires an approved human decision for the same candidate');
END;

CREATE TABLE approved_change_transition (
  from_state TEXT NOT NULL,
  to_state   TEXT NOT NULL,
  PRIMARY KEY (from_state, to_state)
);
INSERT INTO approved_change_transition(from_state,to_state) VALUES
  ('approved','applying'),('approved','blocked'),
  ('applying','applied'),('applying','blocked'),('applying','failed'),
  ('failed','applying');

CREATE TRIGGER approved_change_state_guard BEFORE UPDATE OF change_state ON approved_change
WHEN NEW.change_state <> OLD.change_state
 AND NOT EXISTS (SELECT 1 FROM approved_change_transition t WHERE t.from_state = OLD.change_state AND t.to_state = NEW.change_state)
BEGIN
  SELECT RAISE(ABORT, 'illegal approved_change state transition');
END;

-- ---------------------------------------------------------------- audit (append-only)
CREATE TABLE audit_event (
  audit_id    INTEGER PRIMARY KEY AUTOINCREMENT,
  occurred_at TEXT NOT NULL,
  actor_kind  TEXT NOT NULL CHECK (actor_kind IN ('human','system','worker','stand_in_provider')),
  actor_id    TEXT NOT NULL,
  action      TEXT NOT NULL,
  entity_type TEXT NOT NULL,
  entity_id   TEXT NOT NULL,
  detail_json TEXT
);
CREATE INDEX audit_entity_ix ON audit_event(entity_type, entity_id);
CREATE TRIGGER audit_no_update BEFORE UPDATE ON audit_event BEGIN SELECT RAISE(ABORT, 'audit_event is append-only'); END;
CREATE TRIGGER audit_no_delete BEFORE DELETE ON audit_event BEGIN SELECT RAISE(ABORT, 'audit_event is append-only'); END;

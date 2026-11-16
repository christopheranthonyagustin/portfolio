# Architecture Decision Register — Stage One (Learning)

**ID:** MIN-ASM-ADR-001 | **Version:** 0.8 | **Date:** 2026-11-15
**Rule:** Every recommendation is a **proposal**. No ADR is approved. Only the Product Owner can approve. **The Product Owner decisions PO-D01…PO-D08 (v0.6) fix directions only: they do not approve any ADR** (see the status note in §3).
**Terminology:** "operational store" in earlier records means the **Operational Database** (PO-D01); the technology is still open.
**Scope:** Stage One decisions come first. Decisions that belonged to CareerOps or later stages are listed in section 2 as **Deferred (FUT)** and are not blockers. Nothing in section 1 waits on the CareerOps repository.

Each Stage One record: **Context · Drivers · Options (+/−) · Implications (technical / operational / security & privacy / cost) · Recommendation (proposal) · Approval · Evidence still needed.**

## 1. Stage One decisions

| ID | Decision | Status | Depends on |
|---|---|---|---|
| ADR-001 | Canonical knowledge storage | Proposed direction | PO-D01 direction approved; open: DR-21, DR-08, DR-22, DR-27; ADR approval pending |
| ADR-002 | Runtime, implementation stack and component boundaries (re-scoped) | Open | PO-D06 direction approved; open: DR-07, DR-21; ADR approval pending |
| ADR-003 | Search and retrieval | Open | ADR-006, evaluation data |
| ADR-005 | AI provider abstraction and data handling | Open | PO-D03 direction approved; open: DR-05, DR-23; ADR approval pending |
| ADR-006 | Knowledge schema | Open | ADR-001 |
| ADR-007 | Local vs cloud execution (re-scoped to Stage One) | Open | ADR-005; PO-D03 and PO-D07 directions approved; open: DR-05, DR-22; ADR approval pending |
| ADR-008 | Ingestion and learning-trigger architecture | Open | ADR-020 |
| ADR-009 | Identity, agent authorization (Stage One baseline) | Open | none |
| ADR-010 | Environments and deployment (Stage One: local/dev/test) | Open | ADR-002 |
| ADR-011 | Versioning and backup | Open | ADR-001, ADR-007; PO-D07 direction approved; open: DR-22, DR-20, DR-08, DR-11; ADR approval pending |
| ADR-017 | Repository documentation layout | Open | none |
| ADR-018 | Automatic-update ("permitted rule") policy | Open | PO-D02 direction approved; open: DR-04, DR-27; ADR approval pending |
| ADR-019 | Extraction, entity resolution and validation approach (new) | Open | ADR-005, ADR-006 |
| ADR-020 | Source types, parsing scope and source-store policy | Open | none |
| ADR-021 | Entity identity and relationship storage (new in v0.3) | Open | ADR-001, ADR-006 |
| ADR-022 | Learning-configuration governance and correction feedback (new) | Open | ADR-018 |
| ADR-023 | Technical inspection scope and live introspection (new) | Open | ADR-005, ADR-009 |
| ADR-024 | AI session capture mechanisms (new) | Open | DR-14 verification |
| ADR-025 | Evidence retention and snapshot policy (new) | Open | ADR-007, ADR-011 |

**Reading the "Depends on" column.** A cited Product Owner decision (PO-D0n) is an approved *direction* only. "ADR approval pending" means the ADR stays open and still needs its own technical approval. No ADR is closed by a direction.

### ADR-001 Canonical knowledge storage
- **Context:** SRS §4.5 lists Markdown, JSON, SQLite and indexes; SDD makes the vault the source of truth (conflict C-01).
- **Drivers:** SRS §4.4 (provenance, versioning), portability (package NFR-PORT-001), human readability, Design Input diagram (unverified).
- **Options:** (A) Vault only. + simple, portable. − no home for the ingestion ledger, review queue and audit, and weak querying. (B) Database as source, Markdown exported. + transactions. − weakens the human-readable source-of-truth intent. (C) Hybrid: vault is canonical for approved knowledge; an operational store holds ledger, review queue and audit; a derived index is rebuildable.
- **Implications:** Tech: rebuild-from-vault procedure and schema versioning. Ops: two things to back up (vault and operational store). Security: the audit log and approvals must not be writable by agents. Cost: low if the operational store is local.
- **Recommendation (proposal):** Option C with three data classes: canonical, operational, derived. The Product Owner has approved this as a **direction** (PO-D01); the technical design remains a proposal.
- **Product Owner-approved direction (PO-D01, PO-D07):** hybrid persistence: Knowledge Vault (authoritative for approved canonical knowledge; Markdown, Obsidian-compatible), Operational Database (authoritative for operational records), derived indexes (rebuildable, never authoritative); no silent synchronization that overwrites approved knowledge; consistent backup of vault and database. This settles the high-level choice among options A to C.
- **Remaining technical choices requiring ADR approval:** Operational Database and index technology (DR-21); vault location and synchronization mechanism (DR-08); backup consistency mechanism (DR-22); how direct human edits to the vault are reconciled (SDD §7.13, promotion policy DR-27). The ADR stays open until these are approved.
- **Approval:** Product Owner. **Needed:** approval of the remaining technical choices above. Confirmation of the Design Input wording is still outstanding (the Design Input diagrams were not supplied).

### ADR-002 Runtime, implementation stack and component boundaries (re-scoped)
- **Context:** v0.1 tied this to extending CareerOps; that no longer applies. Stage One needs its own process model and stack.
- **Drivers:** SRS §7.2–7.3 (ASP.NET Core/C# proposed, modular, testable, no unnecessary infrastructure), local-first, solo/small-team maintainability.
- **Options:** (A) Local modular application or library plus CLI, no network service. (B) Local service (HTTP) with a thin client. (C) Cloud service.
- **Implications:** (A) is the least infrastructure and eases a later MCP or API adapter. (B) adds a port and auth surface. (C) conflicts with local-first privacy.
- **Recommendation (proposal):** (A) as a local modular monolith with logical background workers and strict internal component interfaces so (B) can be added. The language is no longer a proposal to confirm: **.NET / C# is the Product Owner-approved primary language (PO-D06)**, independent of any CareerOps code.
- **Product Owner-approved direction (PO-D06):** local-first modular monolith; .NET / C# primary language; logically separated background workers initially in the same deployment; background learning must not block interactive operations; independently testable components; no premature microservices or unnecessary multi-language complexity. This settles the language and the process-model direction.
- **Remaining technical choices requiring ADR approval:** the .NET version, UI framework, hosting model, database and worker execution technology (DR-07, DR-21). The ADR stays open until these are approved.
- **Approval:** Product Owner. **Needed:** approval of the remaining technical choices above. Confirmation of the language is no longer needed.

### ADR-003 Search and retrieval
- **Options:** (A) Filesystem and frontmatter filters. (B) Full-text search in the derived index. (C) Embeddings and vector search. (D) Hybrid of B and C. SRS §7.2: vector search "when justified".
- **Implications:** C/D add model cost, privacy exposure if embeddings use a cloud provider, and rebuild time.
- **Recommendation (proposal):** stage A→B; adopt C only if a retrieval evaluation on the Product Owner's real corpus shows a gain. SRS gives no relevance metric.
- **Approval:** Product Owner. **Needed:** evaluation corpus and metric (gap S1-G7).

### ADR-005 AI provider abstraction and data handling
- **Context:** Stage One extraction needs an AI model. The CareerOps Gemini integration is not used (SRS §6.5: provider independence).
- **Options:** (A) A single provider chosen now. (B) Provider adapter interface with one first implementation; provider choice is configuration. (C) Multi-provider routing.
- **Implications:** Privacy: a rule is needed for which sensitivity classes may be sent to which provider (S1-G6). Cost: token metering per provider (SRS §6.4). Security: the extraction call has no tools and no write access.
- **Recommendation (proposal):** (B). Provider not selected here. Routing (C) only on measured need.
- **Approval:** Product Owner. **Needed:** first provider, and the data-handling rule.

### ADR-006 Knowledge schema
- **Options:** (A) Markdown with YAML frontmatter. (B) Frontmatter plus structured projection. (C) Graph model.
- **Recommendation (proposal):** A/B with stable IDs, typed relations, `recorded_at`, `valid_from`, `valid_to`, separate `origin`, `review_status`, `temporal_status` (conflict C-08), sensitivity, version and supersession. Graph queries come from the derived index.
- **Approval:** Product Owner. **Needed:** ADR-001; decision on all 26 SRS entity types vs a phased subset.

### ADR-007 Local vs cloud execution (Stage One)
- **Options:** (A) Local-only except calls to a hosted AI provider or an authorized external backup. (B) Local plus cloud-hosted components. (C) Cloud-hosted knowledge.
- **Recommendation (proposal):** (A), refined by the Product Owner directions PO-D03 and PO-D07: local-first; local providers add no egress; hosted providers and external backup storage only with explicit Product Owner authorization. Cloud components are FUT.
- **Implications:** (C) raises privacy and breach exposure. Under (A), the only egress is a hosted provider call or an authorized external backup, governed by ADR-005 and ADR-011.
- **Product Owner-approved direction (PO-D03, PO-D06, PO-D07):** hybrid provider-independent AI with sensitive information local unless explicitly authorized; local-first runtime; external backup storage only with explicit authorization.
- **Approval:** Product Owner. **Needed:** data classification (G-10); the sensitivity rule and authorization process (DR-05, DR-23); external backup authorization (DR-22).

### ADR-008 Ingestion and learning-trigger architecture
- **Options:** (A) File-based, hash-driven incremental pipeline triggered manually or by a local watcher. (B) Connector services. (C) Event-driven pipeline.
- **Recommendation (proposal):** (A) with the manual trigger first. A scheduler is FUT. Connectors are plug-in sources behind one interface.
- **Approval:** Product Owner. **Needed:** trigger model (S1-G9).

### ADR-009 Identity and agent authorization (Stage One baseline)
- **Context:** SRS §13.3 asks for role- or policy-based authorization (ambiguity A-03).
- **Options:** (A) Local user context only. (B) Capability tiers: read, propose, approve, administer; agents get read and propose only. (C) Central identity service.
- **Recommendation (proposal):** (B). Only a human identity holds approve. Every denial and approval is audited. The full agent permission model remains an SRS Stage 5 item.
- **Approval:** Product Owner.

### ADR-010 Environments and deployment (Stage One)
- **Recommendation (proposal):** local development and a test/CI environment only. No cloud deployment, no staging, no production service in Stage One. Rollback means previous build plus restore of vault and operational store.
- **Approval:** Product Owner.

### ADR-011 Versioning and backup
- **Options:** (A) Git only. (B) Vault sync service. (C) Git plus independent encrypted backup of the vault and the operational store.
- **Recommendation (proposal):** (C), refined by PO-D07: automatic local backups; independent encrypted backups of the vault and the Operational Database; external backup storage (including a private Git remote) only with explicit Product Owner authorization; consistent backup sets; backup integrity and restores tested.
- **Implications:** Git history keeps deleted content, so a deletion policy (SRS §2.5) needs either history rewrite or a documented exception. A private remote counts as external storage and needs a recorded Product Owner authorization.
- **Product Owner-approved direction (PO-D07, PO-D01):** the backup principles above. Rotation, retention periods, key management, RPO, RTO, tombstone retention and erasure procedures are not decided.
- **Approval:** Product Owner. **Needed:** DR-22 (key management, external-backup authorization process), DR-08, DR-20 (rotation, tombstones, erasure), DR-11 (retention periods, RPO, RTO).

### ADR-017 Repository documentation layout
- **Options:** (A) SRS §9.5 layout. (B) Package layout plus `07-assessment`.
- **Recommendation (proposal):** (B) and amend SRS §9.5 (SRS-CR-05).
- **Approval:** Product Owner.

### ADR-018 Automatic-update policy
- **Options:** (A) Every authoritative update reviewed. (B) Closed list of low-risk automatic updates (formatting, index refresh, link repair). (C) Open "permitted rules".
- **Recommendation (proposal):** (B), narrowed by PO-D02: automation only under Product Owner-approved rules for non-semantic, reversible operational processing. Never automatic: new or changed authoritative knowledge, profile changes, architecture decisions, scope, status, governance policy. **Promotion of a user's direct statements is not settled and no option is recommended (DR-27).**
- **Product Owner-approved direction (PO-D02):** risk-based hybrid governance; explicit Product Owner approval for new or changed authoritative knowledge and for governance policy; uncertain, conflicting or significant changes enter a review queue; approval, rejection, deferral, clarification and supersession are auditable; AI cannot change governance policy.
- **Open question (DR-27).** Four stages are distinct: (1) a user's direct statement or manual submission (evidence); (2) AI interpretation or extraction of it (a candidate, never authoritative); (3) a proposed knowledge assertion or change (a candidate); (4) promotion into approved authoritative knowledge (explicit Product Owner approval, PO-D02). The unresolved question is how stage 4 applies to the user's own direct statements, manual submissions and direct vault edits. Options for the Product Owner, **none recommended or assumed**: (P1) a direct statement stays evidence only until the user explicitly promotes it; (P2) the user marking a submission "record as knowledge" counts as the explicit approval, and only the AI interpretation is reviewed afterwards; (P3) direct statements go through the same review queue as extracted candidates. Implications: governance tier and batch approval; provenance of the approval act; review-queue load; audit paths; treatment of agent-submitted statements, of technical-fact statements and of direct vault edits (SDD §4.9a, §7.13).
- **Approval:** Product Owner. **Needed:** DR-04 (approved-rules list), DR-27 (direct-statement promotion).

### ADR-019 Extraction, entity resolution and validation approach (new)
- **Context:** The learning engine core is undefined (gaps S1-G2, G3, G4).
- **Options:** Extraction: (A) AI structured output validated against a schema, with an evidence span for every claim; (B) rules-only; (C) hybrid rules for structured files (JSON, frontmatter) and AI for prose. Resolution: exact keys first, then fuzzy match, with merges below a threshold sent to review.
- **Implications:** Evidence spans make claims checkable and reject hallucinated ones. Thresholds and metrics are missing and must come from evaluation, not guesses.
- **Recommendation (proposal):** (C) with mandatory evidence spans; no claim without a span can become a candidate; unresolved matches go to review.
- **Approval:** Product Owner. **Needed:** evaluation set.

### ADR-020 Source types, parsing scope and source-store policy (new)
- **Options:** Source types: Markdown, JSON, PDF, DOCX, repositories, conversation transcripts; OCR and audio in or out. Store: copy originals, or reference plus content hash.
- **Recommendation (proposal):** start with Markdown, JSON, text-layer PDF, DOCX and Git repositories; conversation import from exported text; OCR and audio out of Stage One. Reference plus hash by default, with copy for non-persistent sources.
- **Approval:** Product Owner. **Needed:** which sources the Product Owner wants first.

### ADR-021 Entity identity and relationship storage (new)
- **Context:** The confirmed direction requires a connected model across sources (PO-E). v1.1 listed entities without identity or relationship provenance.
- **Drivers:** Stable identity across renames and moves; relationships with evidence and validity; Obsidian readability; rebuildable graph queries.
- **Options:** Identity: (A) ids derived from names or paths. − break on rename or move. (B) Opaque minted ids with aliases and identity keys. + stable, supports merge and split redirects. Relationships: (R1) in the `from` entity's frontmatter list. + compact, readable. − evidence per relationship makes frontmatter heavy. (R2) one note per relationship. + evidence and history per relationship. − many small files. (R3) hybrid: simple relationships inline, evidenced ones as notes.
- **Implications:** Technical: Identity Registry and redirect handling; graph adjacency built in the derived index. Operational: id minting must be stable across devices. Security and privacy: relationships may reveal sensitive structure; inherit sensitivity. Cost: low.
- **Recommendation (proposal):** (B) with a resolution ladder that auto-links only on strong keys; relationship form R1 or R3, decided after trying both on a fixture corpus.
- **Approval:** Product Owner. **Needed:** DR-13.

### ADR-022 Learning-configuration governance and correction feedback (new)
- **Context:** Corrections should improve learning without unapproved AI-generated policy changing behaviour (PO-F).
- **Options:** (A) No learning from corrections. (B) Corrections drive deterministic mechanisms only (suppression, aliases, approved examples, regression set) and configuration is human-approved vault records. (C) Automatic prompt or threshold tuning.
- **Implications:** (C) allows silent drift and is excluded. (B) needs an evaluation step before approval and a version record per run.
- **Recommendation (proposal):** (B).
- **Approval:** Product Owner. **Needed:** DR-17; regression set.

### ADR-023 Technical inspection scope and live introspection (new)
- **Context:** Authorized read-only inspection of technical environments (PO-D).
- **Options:** (A) Static, file-based inspection only. (B) Static plus approved live introspection with read-only credentials, per target. (C) Plus executing builds or tests.
- **Implications:** (B) adds credentials, network egress and sensitive data; (C) executes untrusted code and is excluded.
- **Recommendation (proposal):** (A) in Stage One; (B) only after explicit Product Owner approval; (C) not in Stage One.
- **Approval:** Product Owner. **Needed:** DR-15.

### ADR-024 AI session capture mechanisms (new)
- **Context:** Whether AI coding tools can export or submit sessions is unverified.
- **Options:** (A) File import of exports. (B) Agent-assisted submission through IF-05 and IF-09. (C) Manual paste. (D) Direct integration with a tool's session store.
- **Recommendation (proposal):** A, B and C supported from the start; D only after the capability is verified and approved.
- **Implications:** Agent-submitted content is untrusted and cannot raise its own trust.
- **Approval:** Product Owner. **Needed:** DR-14 verification of each agent's capabilities.

### ADR-025 Evidence retention and snapshot policy (new)
- **Context:** Evidence must stay verifiable when sources change or move (PO-G) without hoarding sensitive content.
- **Options:** (A) Reference and fingerprint only. (B) Reference, fingerprint and bounded excerpt. (C) Full snapshot of every source.
- **Implications:** (C) duplicates sensitive material and enlarges backups; (A) leaves claims uninspectable after change.
- **Recommendation (proposal):** (B) by default; snapshot only for non-persistent sources; evidence flagged `unverifiable` where a source forbids copying.
- **Approval:** Product Owner. **Needed:** DR-16.

### Additions to existing Stage One ADRs in v0.3
- **ADR-003:** retrieval also needs graph adjacency and a timeline in the derived index; embeddings remain optional.
- **ADR-006:** schema adds `assertion_kind`, `epistemic_class`, `lifecycle_state`, `project_ids`, `merged_from`, `split_from` and the configuration version.
- **ADR-008:** triggers are on-demand, change-driven and session-driven; runs have checkpoints and deterministic item and candidate keys.
- **ADR-009:** adds IF-09 under the propose tier; agent-submitted content marked.
- **ADR-011:** backup includes the operational store (evidence, feedback, audit).
- **ADR-018:** the question whether a user's own typed statement needs review of the statement or only of its interpretation is superseded in v0.7 by the four-stage distinction and decision request DR-27; it remains unresolved.
- **ADR-019:** extraction output must carry evidence references and an assertion kind; promotion rules are enforced by governance, not by the model.
- **ADR-020:** six adapter families; SA-5 inspector list.


### Additions in v0.4 and v0.5 (SDD v1.3 and v1.3.1 corrections; all remain proposals)
- **ADR-020:** adds Source Registry ownership: registration, authorization metadata and source lifecycle belong to C-04; adapters (C-10) compute fingerprints; the item ledger and change classification belong to C-02. Needs DR-19.
- **ADR-021:** adds the canonical state vocabularies (SDD §10.2a), including the single relationship state set `candidate`, `asserted`, `disputed`, `stale`, `under_review`, `superseded`, `retired`, `rejected`, with `confirmation` and `epistemic_class` as separate attributes.
- **ADR-025:** extended to evidence identity, move resolution (automatic only when unambiguous), identical-fingerprint handling, `unavailable` vs `missing`, excerpt and snapshot policy, reference-rule deletion with provenance tombstones and historical provenance. Needs DR-20.
- **ADR-019:** extraction promotion rules now distinguish `user_reported_*` assertions from independently evidenced `implemented_change` and `verified_result`.
- **ADR-019 and ADR-021 (v0.5):** conflict-resolution authority (SDD §5.3.5, §10.5): the user's authority over their own matters is distinguished from independent verification of technical or external facts; no one can promote a claim to `verified` without qualifying independent evidence; contradictory evidence and provenance are preserved.
- **ADR-011:** backup and deletion notes now name existing backups and Git history as residual copies (rotation Open).

### Additions in v0.7 (SDD v1.4.1 corrections; all remain proposals)
- **ADR-001, ADR-002:** the "Depends on" and Needed statements no longer imply that the Product Owner directions PO-D01 and PO-D06 await confirmation; approved direction and remaining technical choices are listed separately. Both ADRs stay open.
- **ADR-005, ADR-007, ADR-011, ADR-018:** "Depends on" columns and records refreshed with PO-D03, PO-D07 and PO-D02. ADR-007: hosted providers and external backup only with explicit authorization. ADR-011: automatic local and independent encrypted backups; external storage (including a Git remote) only with authorization.
- **ADR-001, ADR-018:** direct human edits to the vault and the promotion of direct user statements are tracked by DR-27 (SDD §7.13, §4.9a). The vault ownership model is: C-01 is the sole application-controlled writer of approved canonical content; the Product Owner may edit directly.

### Additions in v0.8 (SDD v1.4.2 consistency pass; all remain proposals)
- **ADR-018:** DR-04 is the general knowledge approval and governance policy; the promotion of direct user statements, manual submissions and direct vault edits is the separate decision DR-27. DR-04 does not decide DR-27.
- **ADR-002:** DR-07 covers runtime and process specifics only (.NET version, hosting model, UI framework, worker technology and details, other runtime choices; database technology with DR-21). The primary language (.NET / C#) and the process-model direction are approved by PO-D06 and do not await confirmation. ADR-002 stays open.

## 2. Deferred to future stages (FUT; not blockers)

| ID | Decision | Why deferred | What changed from v0.1 |
|---|---|---|---|
| ADR-004 | MCP interface | Design Input places MCP in a later phase | Stage One retrieval interface is designed so a thin MCP adapter can be added. Proposal retained: custom server, read/search/propose only, depends on ADR-009 |
| ADR-012 | CareerOps data compatibility (`profile.json`) | CareerOps is not Stage One | Not blocked on a repository now; reopened when CareerOps integration is scheduled |
| ADR-013 | Gmail integration method and scopes | Gmail is FUT | Retained proposal: read-only OAuth scope, tokens in a secret store |
| ADR-014 | Job discovery providers | FUT | Needs target sources and a terms-of-service review |
| ADR-015 | Background jobs and cloud scheduling | FUT. Stage One trigger model is in ADR-008 | — |
| ADR-016 | Chrome Extension changes | FUT | No longer waits for a repository audit in Stage One |
| ADR-010 (cloud part) | Cloud Run and cloud topology | FUT | Not validated, not assumed |

## 3. Alignment with the Product Owner decisions (v0.6)

Full per-ADR mapping, including open technical detail and whether explicit technical approval is still required: `docs/02-requirements/PRODUCT-OWNER-DECISION-REGISTER.md` §5.2. **Every ADR keeps its ID and its status (Proposed or Open). None is approved or closed.**

| ADR | Direction resolved by | Revision made in SDD v1.4 (proposal) | Conflict with an earlier proposal |
|---|---|---|---|
| ADR-001 | PO-D01, PO-D07 | Operational Database term; no silent synchronization; consistent backup sets | C-P8, C-P13 |
| ADR-002 | PO-D06 | .NET / C#, modular monolith, workers recorded as approved direction; version, UI, hosting, worker technology Open | none |
| ADR-003 | PO-D01, PO-D05 | Indexes rebuildable and non-authoritative; graph index; deletion propagation | C-P6 |
| ADR-005 | PO-D03 | Local and hosted providers; authorization gate; provenance record; authorized-only fallback | C-P5 |
| ADR-006 | PO-D01, PO-D05 | Globally unique ids; relationship direction | C-P12 |
| ADR-007 | PO-D03, PO-D06, PO-D07 | Hosted providers and external backup only by authorization | C-P5, C-P7 |
| ADR-008 | PO-D04, PO-D06 | Monitoring needs authorization; non-blocking workers | C-P4, C-P10 |
| ADR-009 | PO-D02, PO-D04 | Agents submit candidates only; policy approval Product Owner only | none |
| ADR-010 | PO-D06 | Local-first; hosting model Open | none |
| ADR-011 | PO-D01, PO-D07 | Backup sets, encryption, external authorization, tested restore; Git remote is external storage | C-P7, C-P13 |
| ADR-018 | PO-D02 | Risk-based tiers; approved rules only for non-semantic vault edits | **C-P1** |
| ADR-019 | PO-D02, PO-D03, PO-D05, PO-D08 | Candidates until approved; evaluation dimensions | C-P2, C-P11 |
| ADR-020 | PO-D04 | Four modes; monitoring authorization | C-P3, C-P4 |
| ADR-021 | PO-D05 | Global ids; direction; no auto-assertion | **C-P2**, C-P12 |
| ADR-022 | PO-D02, PO-D08 | Guard covers governance and data-sharing policy | none |
| ADR-023 | PO-D04 (read-only default) | Not resolved; live introspection stays default off | none |
| ADR-024 | PO-D04 | Agent-assisted capture required; mechanism per tool Open | none |
| ADR-025 | PO-D07 | Minimal tombstone subject to erasure; propagation to indexes | **C-P6** |

Not affected (FUT, deferred): ADR-004, ADR-012, ADR-013, ADR-014, ADR-015, ADR-016. ADR-017 not affected.

Technology decisions the Product Owner left open and that have **no ADR of their own** are tracked as new decision requests DR-21 to DR-26 (database and index technology; encryption keys and external-backup authorization; provider selection details; connectors, watchers and scheduling; graph traversal and resolution algorithms; evaluation framework).

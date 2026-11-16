# SRS Change-Request Register

**ID:** MIN-ASM-CR-001 | **Version:** 0.7 draft | **Date:** 2026-11-15
**Supersedes:** v0.6 (v0.5 and earlier before it). v0.7 only updates current-version references to SDD v1.4.2 and the registers' current versions; no CR changed, no CR is approved and no status changed. History of v0.5 and v0.6 is in §9 and §10.

## 1. Rules

1. **MIN-SRS-001 v2.0 is not modified by this document or by the SDD.** A revised SRS will be prepared **only after explicit Product Owner approval** of the change requests.
2. CR-08…CR-17 are **Product Owner-directed design inputs**: SDD v1.4.2 is designed to them now. Their **SRS status remains proposed and unapproved**.
3. No requirement IDs are assigned and no measurable targets are set. "CR-nn" identifies a change request, not a requirement. Wording below states intent, not approved requirement text.
4. Nothing here changes scope: CareerOps, Gmail, job discovery and Sheets stay out of Stage One.

## 2. Status vocabulary

| Status | Meaning |
|---|---|
| Proposed | Raised by the assessment; awaiting Product Owner decision |
| Aligned, design input | Product Owner confirmed alignment; SDD is designed to it; SRS change not yet approved |
| Approved | Product Owner approved the SRS change (none yet) |
| In revised SRS | Included in a re-issued SRS (none yet) |

## 3. Register

| CR | Subject | Status | Rationale | Depends on | Decision needed |
|---|---|---|---|---|---|
| CR-01 | Stable requirement IDs for the whole SRS | Proposed | SRS §10.1 requires traceability; the SRS has no IDs | none | DR-01 |
| CR-02 | Measurable targets in §13 and §18 | Proposed | Acceptance cannot be demonstrated without them | CR-01 | DR-11 |
| CR-03 | Clarify canonical store vs derived index | Proposed | Conflict C-01. **PO-D01 approved the hybrid direction** (Knowledge Vault, Operational Database, derived indexes); the SRS wording is still to be aligned | none | DR-03 |
| CR-04 | Define "permitted rule" or remove the no-approval branch | Proposed | Conflict C-03. **PO-D02 approved risk-based governance**: only low-risk reversible operational processing may be automated; new or changed authoritative knowledge needs explicit approval. The SRS §5.1 branch still has to be aligned | none | DR-04 |
| CR-05 | Align repository layout (§9.5) | Proposed | Conflict C-05 | none | ADR-017 |
| CR-06 | Reconcile stage and phase numbering; define "Stage One — Learning" | Proposed | Conflict C-04 | none | DR-02 |
| CR-07 | Move CareerOps-specific items to a later stage | Proposed | Not a Stage One dependency (C-07) | none | DR-10 |
| CR-08 | AI interaction learning with typed assertions; AI never auto-verified; a user's report or confirmation is recorded as user-confirmed and is distinct from independent verification | Aligned, design input | PO-B; SRS names conversations but not AI sessions or claim typing | CR-14, CR-17 | DR-12, DR-14 |
| CR-09 | Project intelligence and cross-source project attribution | Aligned, design input | PO-C; SRS lacks project evolution model | CR-08, CR-11 | DR-13 |
| CR-10 | Authorized read-only technical inspection; documented / configured / observed / verified, where verified requires independent evidence and a user's confirmation does not qualify | Aligned, design input | PO-D; SRS lacks fact classes and inspection scope | CR-11, CR-14 | DR-15 |
| CR-11 | Entity and relationship model (strengthened, §4.1), including one canonical state vocabulary and conflict-resolution authority; **extended by PO-D05**: globally unique stable ids, directional relationships, AI-discovered relationships remain candidates until approved | Aligned, design input | PO-E, PO-D05; SRS lists types only | CR-14 | DR-13, DR-17, DR-25 |
| CR-12 + CR-13 | One continuous-learning and correction-feedback lifecycle (§4.2); **a design input to CR-16, not dependent on it**; **extended by PO-D02 and PO-D08**: AI may recommend but cannot change learning or governance policy | Aligned, design input | PO-F, PO-D02, PO-D08; SRS §5.3 and §5.5 do not define triggers, recovery or governed feedback | CR-08, CR-11, CR-14, CR-17 | DR-17 |
| CR-14 | Persistence classes; evidence identity, move resolution, retention, deletion and historical provenance (strengthened, §4.4) | Aligned, design input | PO-G; provenance cannot survive source change, ambiguous moves or deletion otherwise | none | DR-16, DR-20 |
| CR-15 | Connected context retrieval | Aligned, design input | PO-H; SRS §6 describes retrieval, not connected understanding | CR-11, CR-14 | DR-11 (relevance metric) |
| CR-16 | Learning acceptance and quality scenarios (strengthened, §4.3); **verifies CR-08…CR-15 and CR-18…CR-21; none of them depends on it**; **extended by PO-D08**: all six source categories, eight evaluation dimensions, human-reviewed baseline, Product Owner-approved thresholds | Aligned, design input | PO scenarios, PO-D08; SRS tests are lists without scenarios | CR-08…CR-15 and CR-18…CR-21 (as design inputs), CR-02 (thresholds) | DR-11, DR-26 |
| CR-17 | Capture modes, source authorization lifecycle and monitoring authorization (§4.5); **extended by PO-D04**: four required modes including direct integration, read-only default, monitoring only for explicitly authorized sources, agents submit evidence and candidates only | Aligned, design input | PO-A, PO-D04 | none | DR-06, DR-14, DR-19, DR-24 |
| CR-18 | Risk-based governance: automated low-risk operations under approved rules; explicit approval of authoritative knowledge and policy; auditable approve, reject, defer, clarify and supersede decisions; AI cannot change policy | Proposed | PO-D02 (approved direction; CR wording is a proposal) | CR-08 | DR-04, DR-17, DR-27 |
| CR-19 | Provider-independent AI: local and hosted providers behind one adapter; sensitive data local unless explicitly authorized; data minimization; secret filtering; provider, model, operation and authorization provenance; AI cannot change data-sharing policy | Proposed | PO-D03 (approved direction; CR wording is a proposal) | none | DR-05, DR-23 |
| CR-20 | Hybrid persistence and protection: Knowledge Vault, Operational Database, rebuildable indexes; no silent overwrite; consistent, automatic and independent encrypted backups; external storage only with authorization; classification and purpose retention; deletion propagation; tested restore; direct human edits to the Knowledge Vault are detected and reconciled, never silently overwritten | Proposed | PO-D01, PO-D07 (approved directions; CR wording is a proposal) | CR-14 | DR-03, DR-08, DR-20, DR-21, DR-22, DR-27 |
| CR-21 | Runtime and process architecture: local-first modular monolith, .NET / C#, logical background workers, non-blocking learning, independently testable components | Proposed | PO-D06 (approved direction; CR wording is a proposal) | none | DR-07, DR-21 |

**Dependency order for the SRS revision (acyclic):** CR-01 (IDs) first; then CR-14 and CR-17 (foundations); then CR-11; then CR-08, CR-09, CR-10, CR-15; then CR-18 (after CR-08), CR-19, CR-20 (after CR-14) and CR-21; then CR-12/13 (which depends on CR-08, CR-11, CR-14 and CR-17 only); then CR-16 with CR-02 (thresholds), which verifies all of them. **No cycle exists:** CR-16 depends on the others, and none depends on CR-16. CR-03…CR-07 can be decided independently.

## 4. Strengthened and merged change requests

### 4.1 CR-11 Entity and relationship model (strengthened)

Intent, as directed: the SRS should require that Mindora maintain a connected knowledge model in which:

1. **Entity identity and lifecycle.** Every entity has a stable identity that survives renames and moves; entities pass through governed lifecycle states (proposed, active, disputed, retired by merge or split with redirects, historical, archived, deleted). *SDD §5.3.1, §5.3.8, §3.16a.*
2. **Relationship lifecycle.** Relationships are first-class and pass through governed states, and only these eight (the canonical set in SDD §10.2a, field `rel_status`): `candidate`, `asserted`, `disputed`, `stale`, `under_review`, `superseded`, `retired`, `rejected`. User confirmation (`confirmation`) and independent verification (`epistemic_class=verified`) are attributes of an `asserted` relationship, not states. *SDD §5.3.3, §5.3.9, §3.16b, §10.2a.*
3. **Temporal validity.** Entities and relationships carry valid time separate from record time; ending, correction and supersession follow explicit rules; queries support current, as-of and history. *SDD §5.3.6 (rules T1–T7).*
4. **Cross-project connections.** Entities have one identity across projects; project-to-project links are explicit and evidenced; retrieval across projects is bounded and marked; sources can be isolated. *SDD §3.10b, §5.3.10 (rules X1–X7).*
5. **Traceable evidence.** Every lifecycle transition of an entity or relationship carries recorded evidence and a review decision. *SDD §5.3.11.*
6. Cross-domain relationship discovery produces candidates only; weak-key matches are never merged automatically. *SDD §5.3.2, §5.3.4.*
7. **Canonical state vocabulary.** One set of lowercase state values is used everywhere an object has a state. For relationships the single set is `candidate`, `asserted`, `disputed`, `stale`, `under_review`, `superseded`, `retired`, `rejected` (`rel_status`). User confirmation (`confirmation`) and independent verification (`epistemic_class=verified`) are attributes, not states. Entities, candidates, records, sources, items, evidence and runs use the vocabularies in SDD §10.2a. *SDD §10.2a, §3.16b.*
8. New entity and relationship types required by project and technical intelligence are added to the SRS lists (Requirement, Milestone, Issue, Change, Lesson, Idea, Observation, Correction, Session, Conversation, Dependency, Configuration, Build/Test run, Deployment; relationships such as `INFORMED_BY`, `SUPERSEDES`, `CONTRADICTS`, `POSSIBLY_SAME_AS`). *SDD §3.15b.*
9. **Conflict-resolution authority.** Contradictory claims and their provenance are always preserved. The user's authority over their own statements, preferences, plans, decisions and accepted knowledge is distinguished from independent verification of technical or external facts. A user may provide new evidence, correct a claim or make an authoritative decision that accepts one claim as current; neither a user nor an AI can change the epistemic class of existing evidence or promote a claim to `verified` without qualifying independent evidence. *SDD §5.3.5 (rules R1–R8), §10.5; AS-29, AS-51, AS-61.*

### 4.2 CR-12 + CR-13 one lifecycle (merged)

Intent, as directed: the SRS should describe **one** recurring lifecycle, not two features: trigger (on-demand, change-driven, session-driven) → plan → change detection → incremental processing → candidate → review → persist and supersede → feedback capture → improvement proposal → evaluation and human approval → application in the next run. Corrections improve future learning only through four mechanisms (suppression of exact repeats, approved aliases and identity keys, approved examples, evaluation set). Behaviour-changing learning configuration (prompts, rules, thresholds, examples, promotion table) changes only with human approval, and each run records the configuration version. Run recovery and idempotency apply throughout. *SDD §6.0–6.7, §3.8, §3.13.*

| Original | Covers | Now |
|---|---|---|
| CR-12 | Triggers, change detection, incremental reprocessing, recovery, idempotency | Stages 1–5 and 7 of the lifecycle |
| CR-13 | Correction learning, configuration guard | Stages 8–11 of the lifecycle |

The two keep their numbers for traceability but should become **one SRS section**. The lifecycle owns its evaluation mechanism (regression set; evaluation before any configuration approval; named measures). CR-16 owns the acceptance scenarios and, with CR-02, the thresholds; it tests the lifecycle and is not an input to it.

### 4.3 CR-16 Learning acceptance and quality scenarios (strengthened)

The SRS should require testable scenarios with a fixture, binary properties and reported measures. Thresholds are set by the Product Owner (CR-02, DR-11); none are invented.

| Area | Scenarios (SDD §15.2a) |
|---|---|
| Extraction | AS-39 (evidence-backed extraction), AS-40 (assertion typing, AI never self-verifies), AS-41 (secrets, injection, unsupported input) |
| Entity resolution | AS-42 (strong keys), AS-43 (ambiguity, no weak-key merge), AS-44 (merge and split reversibility), AS-45 (corrections change later learning) |
| Relationship accuracy | AS-46 (precision by discovery method), AS-47 (lifecycle and validity), AS-48 (cross-project) |
| Source changes | AS-49 (new, changed, moved, removed, unchanged, appended), AS-50 (rewritten history), plus AS-27, AS-32, AS-33 |
| Conflict detection | AS-51 (document vs configuration; contradictory decisions), plus AS-29 |
| Connected retrieval | AS-52 (labelled task set), AS-53 (honesty and degradation), plus AS-30, AS-31 |
| End-to-end connected learning | AS-23…AS-26 |
| Evidence identity and retention | AS-54 (ambiguous move), AS-55 (identical fingerprints), AS-56 (unavailable vs missing), AS-57 (excerpt policy and revocation), AS-58 (deletion and shared evidence), AS-59 (historical provenance) |
| Source authorization | AS-60 (Source Registry ownership and lifecycle) |
| User confirmation vs verification | AS-61 |
| Vocabulary conformance | AS-62 |

### 4.4 CR-14 Persistence and evidence (strengthened)

Intent, as directed: the SRS should distinguish original source material, extracted evidence, AI interpretations, candidate knowledge, approved canonical knowledge, operational records and derived indexes, and should require that **evidence has a stable identity and stays verifiable**: items keep one identity across renames and moves; an ambiguous move is never resolved automatically; identical fingerprints do not make identical items and copies do not count as independent corroboration; a changed source produces new evidence and leaves the old; an unreadable source is not treated as a missing item; excerpts, snapshots and Mindora-held originals follow stated retention rules; deletion follows a reference rule and leaves a content-free provenance tombstone; historical provenance stays answerable. *SDD §3.11, §3.11a, §7.2–7.10.*

### 4.5 CR-17 Capture modes and source authorization lifecycle (clarified)

Intent: besides naming the four capture modes, the SRS should assign **one owner per source responsibility**: the Source Registry (registration, authorization metadata and source lifecycle) with Knowledge Governance; adapter implementation and fingerprint computation with Source Adapters; the item ledger and change classification with the Learning Engine. *SDD §3.4a, §4.10.*

### 4.6 Product Owner decisions and the register (v0.5)

The eight decisions PO-D01…PO-D08 fix directions. They are the source for CR-18 to CR-21 and extend CR-11, CR-12/13, CR-16 and CR-17. Their effect on the older requests:

| CR | Effect of the Product Owner directions | Status |
|---|---|---|
| CR-03 | PO-D01 approved the hybrid direction; SRS wording to align | Still Proposed |
| CR-04 | PO-D02 limits automatic handling to low-risk reversible operational processing; SRS §5.1 to align | Still Proposed |
| CR-18…CR-21 | New; requirement wording is a proposal derived from the approved direction | Proposed |
| CR-11, CR-12/13, CR-16, CR-17 | Extended as stated in the register | Aligned, design input (wording of the extensions is proposed) |

The Product Owner reviewed CR-08…CR-17 earlier. The new and extended wording above has **not** been reviewed as SRS text. A revised SRS is prepared only after explicit approval.

## 5. Traceability: change request → SDD v1.4.2

| CR | SDD sections | Components | Interfaces | Verified by (scenarios) |
|---|---|---|---|---|
| CR-08 | 2.2, 3.9, 3.22, 4.6, 5.1, 5.2, 13.11 | SA-3, C-02, C-04, C-05, C-08, C-09 | IF-03, IF-05, IF-09 | AS-24, 40, 41, 21, 61 |
| CR-09 | 3.10, 3.10a, 3.10b, 5.4, 5.3.10 | C-02, C-01, C-03 | IF-03, IF-04 | AS-23, 25, 48 |
| CR-10 | 3.5, 4.8, 5.5, 13.10 | SA-5, C-02 | IF-01, IF-02 | AS-26, 29, 35, 36, 41, 51, 61 |
| CR-11 | 3.7, 3.15, 3.16a, 3.16b, 5.3, 10.2, 10.2a, 10.5 | C-01, C-02, C-03, C-04, C-11 | IF-03, IF-04 | AS-29, 37, 38, 42, 43, 44, 46, 47, 48, 51, 61, 62, 72 |
| CR-12 + 13 | 3.8, 3.13, 6.0–6.7, 7.6–7.7 | C-07, C-02, C-04, C-06, C-10 | IF-02, IF-03, IF-09 | AS-27, 28, 32, 34, 45, 49, 50, 54, 56 |
| CR-14 | 3.11, 3.11a, 5.3.11, 7 | C-01, C-02, C-04 | IF-03, IF-04 | AS-33, 47, 49, 50, 54, 55, 56, 57, 58, 59 |
| CR-15 | 3.12, 8 | C-03, C-11 | IF-04 | AS-30, 31, 51, 52, 53 |
| CR-16 | 15.2, 15.2a, 15.3, 6.8 | all, C-14 | all, IF-12 | AS-01…AS-72 |
| CR-17 | 3.4, 3.4a, 4.1, 4.10, 6.1 | C-10, C-08, C-04, C-07 | IF-01, IF-05, IF-09, IF-13 | AS-10, 23, 60, 65, 66 |
| CR-18 | 3.16c, 4.9a, 5.3.5, 13.13 | C-04, C-01, C-03, C-05 | IF-03, IF-13 | AS-64 |
| CR-19 | 3.21a, 13.14 | C-09, C-04, C-02 | IF-06, IF-13 | AS-63 |
| CR-20 | 3.11b, 3.11c, 3.20a, 7.8–7.13, 10.7 | C-13, C-01, C-02, C-04, C-11 | IF-10, IF-11 | AS-22, 67, 68, 70 |
| CR-21 | 3.2a, 12.1 | C-07, all | internal | AS-69 |

The scenario column is verification traceability, not dependency. CR-01…CR-07 trace to the assessment documents (Documentation Assessment §5, Gap Analysis §1) and not to new SDD sections.

## 6. Approval path

1. Product Owner decides on the register (accept, amend or reject each CR), including DR-18.
2. On explicit approval, a revised SRS is **prepared** (IDs per CR-01, new text per CR-08…17, thresholds per CR-02) and returned for review.
3. Only after the Product Owner approves the revised SRS are IDs final and the traceability matrix re-keyed.
4. Until then, SDD v1.4.2 cites CR numbers and PO letters, and every status stays "proposed" or "draft".

## 7. Changes in this version (v0.3)

| Change | Reason |
|---|---|
| Removed CR-16 from the dependencies of CR-12/13; stated that CR-16 verifies the lifecycle | Circular dependency (finding 3) |
| CR-11: added the canonical state vocabulary and the single relationship state set | Relationship states differed between data model, diagram and text (finding 2) |
| CR-08, CR-10: separated user confirmation from independent verification | Self-reported results were treated like verified results (finding 4) |
| CR-17: added source authorization lifecycle and ownership | Source Registry ownership was ambiguous (finding 5) |
| CR-14: added evidence identity, move resolution, retention, deletion and historical provenance | Evidence rules were incomplete (finding 6) |
| Traceability re-pointed to SDD v1.3 and AS-01…AS-62 | Synchronization (finding 1) |

**No CR is approved.** Status values are unchanged: CR-01…CR-07 *Proposed*; CR-08…CR-17 *Aligned, design input*. The SRS v2.0 is unmodified.

## 8. Changes in this version (v0.4, final consistency corrections)

| Change | Reason |
|---|---|
| Rebuilt the CR-11 row and restored CR-14 as its own row in §3 | A v0.3 edit had merged part of CR-14 into the CR-11 row and left a stale CR-14 row |
| §4.1 item 2 now lists exactly the eight canonical relationship states with `under_review`; the obsolete `confirmed` state is removed | Vocabulary mismatch with SDD §10.2a |
| §4.1 item 9 and the CR-11 traceability row add conflict-resolution authority | Alignment with SDD v1.3.1 §5.3.5 and §10.5 |
| Versions and SDD references updated to v1.3.1 | Synchronization |

Statuses, dependencies and decision references of CR-01…CR-17 are unchanged. **No CR is approved.**

## 9. Changes in this version (v0.5, Product Owner decision consolidation)

| Change | Reason |
|---|---|
| Added CR-18, CR-19, CR-20, CR-21 as **Proposed** | PO-D02, PO-D03, PO-D01/PO-D07 and PO-D06 introduce requirements the SRS does not state |
| Extended CR-11, CR-12/13, CR-16, CR-17 | PO-D05, PO-D02/PO-D08, PO-D08 and PO-D04 |
| Updated the rationale of CR-03 and CR-04 | PO-D01 and PO-D02 give a direction; status unchanged |
| Added §4.6, traceability rows and dependency order | Traceability to PO-D01…PO-D08 |
| SDD references updated to v1.4 | Synchronization |

Statuses: CR-01…CR-07 *Proposed*; CR-08…CR-17 *Aligned, design input*; CR-18…CR-21 *Proposed*. **No CR is approved.** The SRS v2.0 is unmodified.

## 10. Changes in this version (v0.6, SDD v1.4.1 corrections)

| Change | Reason |
|---|---|
| CR-18 and CR-20 decision references now include DR-27 | The promotion of direct user statements and direct vault edits into authoritative knowledge is an unresolved Product Owner policy (SDD §4.9a, §7.13) |
| CR-20 wording extended: direct human edits to the vault are detected and reconciled, never silently overwritten | Vault write-ownership clarification (SDD §7.13). Wording is a proposal |
| CR traceability: CR-18 adds §4.9a; CR-20 adds §3.11c, §7.13 and AS-22 | Traceability |
| SDD references updated to v1.4.1 | Synchronization |

Statuses are unchanged: CR-01…CR-07 *Proposed*; CR-08…CR-17 *Aligned, design input*; CR-18…CR-21 *Proposed*. **No CR is approved.** The SRS v2.0 is unmodified.

## 11. Changes in this version (v0.7)

| Change | Reason |
|---|---|
| Current-version references updated to SDD v1.4.2 (header, §2, §5, §6) | Synchronization. Rows in §9 and §10 that describe earlier versions are kept as history |

CR rows, statuses, dependencies and decision references are unchanged. **No CR is approved.** The SRS v2.0 is unmodified.

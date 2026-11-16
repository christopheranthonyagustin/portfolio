# Architecture Gap Analysis — Stage One (Learning)

**ID:** MIN-ASM-GAP-001 | **Version:** 0.9 | **Date:** 2026-11-15
Sections 1 to 6 compare MIN-SRS-001 v2.0 (working), MIN-SDD-001 v1.0 (the historical baseline for those sections), the Engineering Package v0.1 and the Product Owner's Stage One scope. The current design, MIN-SDD-001 v1.4.2, is assessed in sections 7 and 8 (tags S1 / S1-C / FUT defined in DOCUMENTATION-ASSESSMENT §0). Future-stage items appear only in section 6.

## 1. Conflicts (Product Owner decision required)

| ID | Conflict | SRS | SDD / package | Proposed resolution (not approved) | Stage |
|---|---|---|---|---|---|
| C-01 | Canonical store | §3.2 L4, §4.5, §7.2: structured knowledge in a database (SQLite suggested) plus Markdown and JSON | §2.1, §6: Markdown vault is source of truth; index derived | Three data classes: canonical (vault), operational (ledger, review queue, audit; not rebuildable from the vault), derived (index). ADR-001 | S1 |
| C-02 | ~~Initial interface~~ | §3.2 L1 names the CareerOps Assistant and Chrome Extension | SDD: Obsidian + agent sessions | **Withdrawn.** Chrome Extension is FUT. Stage One interface = vault + agent sessions + local interfaces. SRS amendment SRS-CR-07 | FUT |
| C-03 | Approval policy | §5.1: "permitted rule" may persist without review | §2.1(5), package: all authoritative updates reviewed | Closed list of low-risk automatic updates only. ADR-018 | S1 |
| C-04 | Numbering | §8 six SDLC phases, §2.6 Phases 6–10, §17 Stages 0–10 | SDD §17 Phases 0–6; Product Owner term "Stage One" | One scheme with a crosswalk (SDD v1.4.2 Appendix A); confirm DR-02 | S1 |
| C-05 | Repo/doc layout | §9.5 `docs/00-vision…13-progress` | Package `00-governance…06-operations`; brief adds `07-assessment` | Adopt package layout, amend SRS §9.5. ADR-017 | S1-C |
| C-06 | Who calls a model | §3.2: Reasoning Orchestrator calls the provider | SDD §5.1 Orchestrator→LLM but §12.1 Agent→LLM | Separate two paths: (a) development agents call their own models; (b) Mindora's extraction/reasoning calls go only through the Provider Adapter. ADR-005 | S1 |
| C-07 | Acceptance criterion | §18 last foundation criterion requires CareerOps functionality preserved or migrated | Stage One scope excludes CareerOps | Move to FUT acceptance list (SRS-CR-07). Stage One carries only a "do not modify CareerOps" constraint | FUT |
| C-08 | Knowledge-state vocabulary | §5.4 mixes origin (explicitly provided, source-extracted, AI-inferred) with status (user-confirmed, temporary, historical, superseded) | SDD §6.4 uses verified / extracted / inferred / disputed / stale | Model origin, review status and temporal status as separate fields with a mapping table. ADR-006 | S1 |

## 2. Stage One gaps against the SRS

| Gap | SRS § | Severity | Needed SDD change |
|---|---|---|---|
| G-03a Learning from user corrections and confirmations | §5.5 (first part), §14.2 | High | Correction path in lifecycle; rejected/corrected items feed re-extraction and an examples store |
| G-04a Request interpretation and intent/domain resolution; knowledge-gap reporting | §2.4, §6.2 | Medium | Specify inside Context Router |
| G-05 Entity Resolver, Relationship Manager, Version Manager, Document Processing, Content Extraction | §3.2 L3 | High | Specify as sub-components of Ingestion Engine and Memory Engine |
| G-06 Validity period (when true vs when recorded) | §4.4 | Medium | `recorded_at`, `valid_from`, `valid_to` |
| G-07 26 entity types | §4.2 | Medium | Extend ERD or record phased subset |
| G-08 13 named relationships | §4.3 | Medium | Typed relationships |
| G-09 Business and Operations domains | §4.1 | Low | Add to domain list |
| G-10 Retention, deletion, data classification | §2.5 | High | Define classes; mechanism; Git-history deletion risk |
| G-11 Scalability | §13.5 | Medium | Section with open targets |
| G-14 Interface contracts for Stage One services | §16 | High | SDD §5.5 |
| G-15 Test specification and knowledge model documents | §16 | Medium | Create under the approved layout |
| G-16 Token baseline and measurement method | §6.4 | Medium | Define before claiming savings |
| G-17 Migration control for the operational store | §15.2 | Medium | Required once a store is chosen |

## 3. Stage One gaps that the SRS and SDD do not address (identified by this review; design questions, not requirements)

| ID | Gap | Why it matters |
|---|---|---|
| S1-G1 | Supported source types and parsers (PDF, DOCX, Markdown, JSON, repositories, conversation transcripts); OCR and audio out or in | SRS §2.1 names CVs, portfolio documents, PDFs, JSON, Markdown. "Conversations" (§2.2) has no defined input format |
| S1-G2 | Segmentation and preservation of source text so every claim cites an evidence span | Provenance (§2.5, FR-LN-004) cannot be verified without it |
| S1-G3 | Extraction method: structured output, schema validation, confidence meaning | AI output must not become fact (§5.4) |
| S1-G4 | Entity resolution policy: match keys, merge thresholds, when to ask the user | Duplicates vs wrong merges |
| S1-G5 | Concurrent writes: user edits vault in Obsidian while engine proposes changes | Lost or conflicting edits |
| S1-G6 | Provider data-handling rule: what content may be sent to which provider | Privacy (SRS §2.5, NFR-PRV-001) |
| S1-G7 | Evaluation datasets and metrics for extraction accuracy, retrieval relevance, dedup | SRS §14.2–14.3 list tests with no data or metric |
| S1-G8 | Source-store policy: copy originals into a store or reference with hash | Reproducibility vs storage and privacy |
| S1-G9 | Trigger model for "continuous" learning in a local-first system (manual, watch, scheduled) | Determines runtime shape |
| S1-G10 | Secret detection on ingestion | Documents may contain credentials that must not enter the vault (NFR-SEC-001) |

## 4. SDD elements without clear requirement justification (Stage One)

- **Workflows and Skills**: only the unverified Design Input diagram supports it as a runtime component.
- **Handoff Manager**: SRS §16 treats a handoff as a document; session continuity is still a Product Owner Stage One capability, so the component is justified by scope, not by SRS text.
- **Task / Workflow Orchestrator**: merges SRS "Reasoning Orchestrator" (S1) and "Automation Orchestrator" (FUT). Only the first belongs to Stage One.
- Obsidian specifically: SRS §4.5 says "Obsidian-compatible".

## 5. Defects in SDD v1.0 diagrams and text

| ID | Location | Defect | Treatment in v1.1 |
|---|---|---|---|
| D-01 | §5.1 | `SRC --> VAULT` bypasses Governance approval | Candidates go to the review queue; only Memory Engine writes the vault after approval |
| D-02 | §5.1 | MCP Adapter shown as a normal component | Drawn as FUT |
| D-03 | §4 | Undefined inline node `M[...]` | Replaced |
| D-04 | §10.1 | Sources feed Context Router directly | Sources enter through connectors and ingestion |
| D-05, D-06 | §10.1, §10.2 | CareerOps drawn as already integrated, `API <--> CTX` unlabeled | CareerOps removed from Stage One diagrams; one FUT boundary view only |
| D-07 | §6.4 | Lifecycle: Rejected is terminal though §7.1 routes to a feedback queue; no Disputed, Stale, Deleted | Redrawn |
| D-08 | §6.2 | ERD lacks many SRS entities; no typed relationships | Extended |
| D-09 | §12.1 | Agent→LLM vs Orchestrator→LLM | C-06 resolution drawn |
| D-10 | §11.1 | Cloud Run and database nodes drawn as facts | Removed from Stage One |
| D-11 | All | 13 of the 15 required views exist; missing: Knowledge and Data Architecture view and a Component Architecture view separate from the logical view; no legend | Added |
| D-12 | File | Two copies (`.md`, `.docx`) with Mermaid as raw text | One canonical `.md`; `.docx` to be regenerated on request |

## 6. Moved to future stages (retained, not designed)

| Item | SRS § | Boundary rule for Stage One |
|---|---|---|
| Gmail / email intelligence | §11.1 | Stage One treats an email, if a user provides one as a file, as an ordinary document. No connector, no scopes |
| Job discovery, matching, application tracking, Google Sheets sync, CareerOps automation | §11.2–11.5 | No entities, connectors or workflows in Stage One |
| Recommendation-outcome learning | §5.5 (second part) | Needs a recommending capability |
| Automation Orchestrator, Response Validator | §3.2 | FUT |
| Chrome Extension changes, CareerOps adapter | §3.2 L1, §19 | One named extension point (C-12) with no design |
| Cloud Run deployment, scheduling in the cloud | §15, §19 | Stage One is local-first |
| MCP server | §3.2 L5 | Later phase per Design Input; Stage One retrieval interface is designed so a thin adapter can be added |
| Full governance hardening (access policies, agent permission model beyond tiers, recovery drills) | SRS Stage 5 | Stage One keeps S1-C baseline only |

## 7. SDD v1.2 review and change list (added in v0.3)

### 7.1 Review of SDD v1.1 against the confirmed learning direction

The Product Owner confirmed the full Stage One learning scope after v1.1. The v1.1 architecture was document-centric. Findings R-01…R-12 are recorded in SDD v1.2 §2.5. In summary:

| Finding | Gap in v1.1 | Addressed in v1.2 |
|---|---|---|
| R-01 | Four of six source categories had no acquisition design | §4, six adapter families, four capture modes |
| R-02 | No claim typing; AI statements could look like facts | §5.1–5.2 assertion kinds, epistemic classes, promotion rules |
| R-03 | No project model | §5.4 identity, attribution, decision lifecycle, timeline |
| R-04 | Technical sources were generic Git | §5.5 inspectors, fact classes, drift detection |
| R-05 | No identity or relationship design | §5.3 identity, resolution ladder, first-class relationships |
| R-06 | Manual trigger only; no correction learning | §6 triggers, runs, feedback, configuration guard |
| R-07 | Five data classes; evidence unverifiable after change | §7 seven classes, evidence verification |
| R-08 | Retrieval returned records, not understanding | §8 traversal and connected context package |
| R-09 | Verification missed connected-learning proofs | §15.2 AS-23…AS-38 |
| R-10 | ERD limited to SRS types | §3.15b proposed additions |
| R-11 | Components lacked learning roles | §9 |
| R-12 | Stale diagrams | §3 (26 diagrams) |

### 7.2 Status of earlier gaps after v1.2 (design only; nothing approved)

| Gap | Status |
|---|---|
| G-03a corrections | Designed (§6.4, §6.5) |
| G-04a request interpretation, gaps | Designed (C-03, §8) |
| G-05 resolver, relationship and version managers | Designed (C-01, C-02) |
| G-06 validity period | Designed (§10.2) |
| G-07, G-08 entity and relationship types | 26 SRS types and 13 relationships shown; additions **proposed**, need SRS-CR-11 and DR-13 |
| G-09 Business, Operations | Still open |
| G-10 retention, classification | Mechanism designed (§10.6, §13); policy and periods still open (DR-11, DR-16) |
| G-11 scalability | Still open (no figures) |
| G-14 interface contracts | Designed (§11, IF-01…IF-09) |
| G-15, G-16, G-17 | Open |
| S1-G1 source types | Designed (§4); selection open (DR-06) |
| S1-G2 evidence spans | Designed (§7.2) |
| S1-G3 extraction method | Designed (ADR-019); evaluation data missing |
| S1-G4 resolution policy | Designed (§5.3.2); thresholds open |
| S1-G5 concurrent writes | Designed (C-01) |
| S1-G6 provider data rule | Open (DR-05) |
| S1-G7 evaluation data | Measures defined (§6.6); data and targets missing (DR-11) |
| S1-G8 source store | Proposal (ADR-025); open (DR-16) |
| S1-G9 trigger model | Designed (§6.1); watcher open |
| S1-G10 secret detection | Designed (§4.3, §13.10) |

### 7.3 New open gaps found in v1.2

| ID | Gap | Why it matters |
|---|---|---|
| N-01 | Which AI coding tools can export or submit sessions, and how, is unverified | Determines how automatic AI-session learning can be (DR-14) |
| N-02 | Live introspection of databases and systems: allowed or not | "Observed" facts beyond static inspection (DR-15) |
| N-03 | Diagrams that exist only as images are not interpreted | Part of architecture documents |
| N-04 | Privacy handling for third parties in conversations | Consent and minimization rules |
| N-05 | Size of repositories and histories to process | Performance and cost; no figures |
| N-06 | Meaning and calibration of `confidence` | Needed for review thresholds |
| N-07 | Resolution thresholds, temporal-proximity window, traversal depth and weights | Come from evaluation, not guessing |
| N-08 | Relationship storage form (frontmatter vs separate notes) | Obsidian usability vs evidence per relationship (ADR-021) |
| N-09 | Cost and rate of AI extraction on large histories | Budget undefined |
| N-10 | Review workload: volume of candidates a single user can review | May need auto-accept classes (DR-17) |

### 7.3a After Product Owner review of the CR register

CR-08…CR-17 were confirmed as design inputs. Added to SDD v1.2: entity and relationship lifecycles, temporal rules, cross-project rules and evidence per transition (CR-11); one unified learning lifecycle (CR-12+13); learning-quality scenarios AS-39…53 with fixture design (CR-16); CR traceability (Appendix D). Remaining open: N-06, N-07 and N-08 above; cross-project isolation default (DR-13); labelled data and thresholds (DR-11).

### 7.3b Corrections in SDD v1.3 (documentation consistency; no new scope)

| Finding | Gap | Resolution (design only; open decisions remain) |
|---|---|---|
| Relationship states differed between model, diagram and text | Five state lists | One set in SDD §10.2a and §3.16b; confirmation and verification are attributes |
| `verified` could be reached by user confirmation | Self-report treated as independent verification | `user_reported_*` kinds; only independent evidence yields `verified` (§5.2) |
| Source Registry owned by both C-02 and C-10 | Ambiguous ownership | Registry with C-04; ledger with C-02; fingerprint computation with C-10 (§4.10) |
| Evidence identity and retention incomplete | Ambiguous moves, copies, missing vs unavailable, deletion | §7.2–7.10, AS-54…AS-59 |
| CR-12/13 and CR-16 cyclic dependency | Circular register | Lifecycle is a design input; CR-16 verifies it |
| New open parameters | Excerpt length, scans before `missing`, retention periods, backup rotation, tombstone erasure | DR-20 |

### 7.3c Corrections in SDD v1.3.1 (documentation consistency; no new scope)

| Finding | Resolution |
|---|---|
| Conflict resolution mixed user authority with verification | SDD §5.3.5 (R1–R8) and §10.5 distinguish the user's own matters from technical or external facts; AS-61, AS-29, AS-51 aligned |
| CR register rows malformed; obsolete relationship wording | CR register v0.4: CR-11 and CR-14 rows restored; eight canonical states in CR-11 §4.1 |

### 7.4 SDD change list (v1.2 and v1.3)

Executed in `docs/03-design/SYSTEM-DESIGN-DOCUMENT.md` v1.2 (draft). Preserved from v1.1: scope and legend, principles, lifecycle, agent and MCP view, CareerOps boundary view, deployment, trust boundaries, error scenarios, AS-01…AS-22, security tiers. Replaced: ingestion pipeline, data architecture view, retrieval pipeline, C-10, component specifications. C-01…C-11 are expanded. C-12 remains FUT. Decisions C-01, C-03, C-06 and all ADRs remain proposals.

## 8. Product Owner directions PO-D01…PO-D08 (added in v0.7)

Source: `docs/02-requirements/PRODUCT-OWNER-DECISION-REGISTER.md`. The directions fix *what* the design must do. They approve no ADR, DR, SRS change or technology. Earlier sections of this document are kept as history.

### 8.1 Effect on earlier conflicts

| Conflict | Effect of the Product Owner direction | Remaining |
|---|---|---|
| C-01 canonical store | PO-D01 approved the hybrid direction (Knowledge Vault; Operational Database; derived indexes) | SRS wording (CR-03, CR-20); ADR-001; technology (DR-21); DR-03 open |
| C-03 approval policy | PO-D02: only low-risk reversible operational processing is automated; new or changed authoritative knowledge needs explicit approval | SRS §5.1 wording (CR-04, CR-18); approved-rules list (DR-04); ADR-018 |
| C-06 who calls a model | PO-D03: one provider-independent adapter, local and hosted | ADR-005; providers (DR-05, DR-23) |
| C-04, C-05, C-08 | Not affected | Open as before |

### 8.2 Conflicts between earlier proposals and the directions (PODR §6)

Thirteen earlier proposals were corrected in SDD v1.4 (C-P1 to C-P13): automatic vault edits; auto-assertion of derived relationships; "direct integration not assumed"; monitoring without authorization; "local-only except provider calls"; default tombstones and lagging index removal; optional Git remote without authorization; the term "operational store"; missing defer and clarify actions; no worker model; missing evaluation dimensions; ids without a global uniqueness rule; separate backup of vault and database.

### 8.3 Gaps found and their status in SDD v1.4

| ID | Gap | Status in SDD v1.4 | What remains |
|---|---|---|---|
| GP-01 | No separate authorization for monitoring | Designed: `monitoring_state`, `triggered_by` (§4.10) | Technology and policy (DR-24) |
| GP-02 | Direct integration excluded as a mode | Corrected: required mode, connectors undecided (§4.1) | Connectors (DR-24) |
| GP-03 | No external-processing authorization or provider-call provenance | Designed (§13.14, §3.21a, IF-13) | Sensitivity rule; providers (DR-05, DR-23) |
| GP-04 | Backup of vault and database not tied to one consistency point | Designed: backup sets (§7.12) | Mechanism (DR-21, DR-22) |
| GP-05 | Index removal lagged deletion; tombstone by default | Corrected (§7.9) | Tombstone retention, erasure procedures (DR-20) |
| GP-06 | No worker model or non-blocking rule | Designed (§3.2a, §12.1) | Worker technology, limits (DR-07, DR-11) |
| GP-07 | Evaluation dimensions incomplete; no dataset or service | Designed: eight dimensions, C-14 (§6.8) | Framework, format, thresholds (DR-26, DR-11); the dataset does not exist yet |
| GP-08 | Global uniqueness of entity ids not required | Added (§5.3.1) | Id format (ADR-021) |
| GP-09 | Relationship direction not explicit | Added (§5.3.3) | Direction table per type |
| GP-10 | Auto-assertion of derived relationships | Removed (§5.3.4) | None |
| GP-11 | Governance tiers and decision outcomes not defined | Designed (§13.13, §3.16c, IF-03 actions) | Rules list (DR-04) |
| GP-12 | External storage authorization (Git remote, backup target) | Added (§7.12, IF-10, IF-13) | Authorization process (DR-22) |
| GP-13 | Encryption-key management | Not designed | **Open** (DR-22) |
| GP-14 | Backup rotation, retention periods, RPO, RTO | Not set | **Open** (DR-11, DR-20) |
| GP-15 | No human-reviewed baseline dataset exists | Process designed | Dataset must be built (DR-26) |
| GP-16 | Database and index technology | Abstraction kept | **Open** (DR-21) |

### 8.4 Consistency review against the eight directions (document review)

| Area | Reviewed | Result |
|---|---|---|
| Storage and synchronization | Vault ownership; Operational Database ownership; index rebuildability; safe sync; provenance | Consistent after C-P6, C-P8, C-P13; rules S1–S7; gaps GP-04, GP-16 |
| Governance | Automation vs canonical updates; review queue; explicit approval; user authority vs verification; policy protection | Consistent after C-P1, C-P2, C-P9; gap GP-11 (rules list) |
| Provider abstraction | Local and hosted; authorization; secret filtering; minimization; provenance; failure and fallback | Consistent after C-P5; gaps GP-03 (details open) |
| Source acquisition | Six categories; four modes; authorization; read-only; monitoring; agent candidates | Consistent after C-P3, C-P4; gap GP-01, GP-02 |
| Knowledge graph | Ids; relationship provenance; validity; resolution; lifecycle; candidates; retrieval | Consistent after C-P2, C-P12; gaps GP-08, GP-09 |
| Runtime | Modular monolith; .NET / C#; workers; non-blocking; testable | Consistent after C-P10; gap GP-06 |
| Protection and recovery | Encrypted backups; external authorization; retention; deletion; recovery tests | Consistent after C-P6, C-P7; gaps GP-12 to GP-14 |
| Evaluation | Baseline; regression; eight dimensions; reviewed references; thresholds; controlled improvement | Consistent after C-P11; gaps GP-07, GP-15 |

This was a review of the documents. Automated checks are reported in `CORRECTION-LOG.md`.

### 8.5 Corrections in SDD v1.4.1 (documentation consistency; no decision changed)

| ID | Gap | Status in SDD v1.4.1 | What remains |
|---|---|---|---|
| GP-17 | Vault write ownership was ambiguous: "only the Memory Engine writes the vault" could be read as forbidding or ignoring the Product Owner's own edits | Clarified: C-01 is the sole application-controlled writer of approved canonical content; the Product Owner may edit directly; direct edits are detected, recorded with provenance and history, and never silently overwritten (§7.13, §3.11c; §3.2a, §3.11b, §3.21, S1, C-01 aligned; AS-22, AS-70) | Promotion or confirmation of a direct edit (DR-27); whether the vault is monitored (DR-24) |
| GP-18 | Direct user input: a single proposal ("review confirms the interpretation") blurred four different things | Four stages separated: direct statement (evidence), AI interpretation (candidate), proposed assertion or change (candidate), promotion into approved knowledge (§4.9a). The promotion policy is **unresolved** | DR-27 (new); no option recommended or assumed |
| GP-19 | SDD §16 and the ADR register still described ADR-001, 002, 007, 011 and 018 as awaiting directions already given by PO-D01, PO-D06, PO-D03, PO-D07 and PO-D02 | §16 rebuilt with approved direction, technical proposal and still-open columns; ADR register "Depends on" and records corrected. All ADRs stay open | ADR approvals |

### 8.6 Decision-request separation in SDD v1.4.2 (documentation consistency; no decision changed)

| ID | Gap | Status in SDD v1.4.2 | What remains |
|---|---|---|---|
| GP-20 | DR-04 was titled "Approval policy, including direct user input", so it appeared to cover the promotion of direct user statements as well as general governance | DR-04 is the general knowledge approval and governance policy; it does not decide direct-input promotion, which is DR-27 | DR-04 and DR-27 remain open |
| GP-21 | DR-07 was titled "Language, runtime, process model", so it appeared to await confirmation of a language and process model that PO-D06 already approved | DR-07 covers runtime and process specifics only (.NET version, hosting model, UI framework, worker technology and details, other runtime choices); database technology is decided with DR-21 | DR-07 remains open |
| GP-22 | Current-version references in the readiness assessment, Decision Register and other documents still named superseded versions | Aligned to SDD v1.4.2 and the current register versions; historical rows kept | none |

# Requirements Traceability Matrix

**ID:** MIN-ASM-RTM-001 | **Version:** 0.9 draft | **Date:** 2026-11-15
**Scope:** re-scoped to **Stage One — Learning**. The **Stage** column uses S1 / S1-C / FUT (see DOCUMENTATION-ASSESSMENT §0). FUT rows are kept for completeness and are not Stage One requirements.

## How to read this

- **MIN-SRS-001 v2.0 has no requirement IDs.** Rows are keyed by **SRS section locator** (e.g. `§6.4`), not by invented IDs. A bullet within a section is cited as `§x.y-n` (n-th bullet).
- **Historical vs current.** In Part A the columns up to "Status / note" record the **SDD v1.0 baseline assessment** and are kept for history. The last column, **Current status (SDD v1.4.2)**, is the current design assessment against MIN-SDD-001 v1.4.2 (draft). Parts B to E map to v1.4.2. "Designed" means a design element exists in the draft SDD; it is not approved and nothing is implemented.
- Verification methods refer to SRS §14 test levels. Test cases do not exist yet.
- **Status:** `Covered` (design element exists, details may be open) | `Partial` (some elements missing) | `Not covered` | `Conflict` (SRS and SDD disagree; needs Product Owner) | `Ambiguous`.
- All rows are against a **working** SRS (not approved).

## 1. SRS → SDD traceability

| Locator | Stage | Requirement (summary) | Source | SDD v1.0 § | Architecture component | Verification | Status / note | Current status (SDD v1.4.2) |
|---|---|---|---|---|---|---|---|---|
| §1.4-1 | S1 | Establish comprehensive understanding of the user | SRS | 6.1, 6.3 | Memory Engine, Vault | Initial-profile test (§14.2) | Partial: no Skill/Experience/Organization entities in ERD | **Partial**: §3.15a, 5.1; relationships for several SRS types undefined (G-08) |
| §1.4-2 | S1 | Learn continuously from new information | SRS | 7 | Ingestion Engine | Knowledge tests (§14.2) | Partial: no outcome feedback loop | **Designed**: §6 |
| §1.4-3 | S1 | Understand personal, professional, business, technical environments | SRS | 6.1 | Memory Engine | Domain coverage | Partial: Business, Operations domains absent | **Partial**: §10.1; Business and Operations relationships undefined (G-09) |
| §1.4-4 | S1 | Connect information across projects, documents, systems, communications | SRS | 6.2 | Memory Engine | Relationship extraction test | Partial: relationships generic, not the named SRS set | **Designed**: §5.3 |
| §1.4-5 | S1 | Auto-retrieve relevant knowledge for new tasks | SRS | 8 | Context Router | Retrieval relevance eval | Covered (algorithm open) | **Designed**: §8; traversal parameters open |
| §1.4-6 | S1 | Reduce repetitive prompting and token use | SRS | 8.2 | Context Router | Token measurement | Partial: no baseline or metric defined | **Partial**: §8.3; token baseline missing (G-16) |
| §1.4-7 | S1 (adapter) / FUT (MCP) | Support multiple AI models and agents on shared knowledge | SRS | 5.2, 9, 10.1 | Provider Adapter, MCP Adapter | Provider fallback test | Partial | **Designed**: C-09, C-08; MCP is FUT |
| §1.4-8 | FUT | Foundation for intelligent operations/automation | SRS | 10.2, 17 | Future operational domains | FUT | Deferred to a later stage; Stage One must not be shaped by it | **FUT**: deferred |
| §1.4-9 | S1-C | Security, traceability, user control | SRS | 12, 6.3 | Governance | Security tests | Covered (concept level) | **Designed**: §13 baseline |
| §1.4-10 | S1-C | Disciplined SDLC with AI-assisted engineering | SRS | none in SDD | Package docs (AI-ASSISTED-SDLC, QUALITY-GATES) | Gate review | Covered outside SDD | **Outside SDD**: engineering package |
| §2.1 | S1 | Evidence-based initial profile from CVs, portfolio, PDFs, JSON, Markdown | SRS | 6.1, 7 | Ingestion, Memory, CareerOps Adapter | Profile generation test | Partial: parsers per format unspecified | **Designed**: §4.4; source-type selection open (DR-06) |
| §2.2 | S1 (documents, conversations) / FUT (email, meeting connectors) | Learn from conversations, email, meetings, documents; distinguish facts/plans/assumptions | SRS | 6.4, 7 | Ingestion, Governance | Knowledge tests | Partial | **Designed**: §4.5, 4.6, 4.9; email and meeting connectors FUT |
| §2.3 | S1 | Technical ecosystem: software, AI, infrastructure, database | SRS | 6.1, 6.2 | Memory Engine | Domain coverage | Partial: AI Model, AI Agent, Server, Database Schema, Business Process missing from ERD | **Partial**: §3.15, 5.5; relationships for several types undefined; additions need CR-11 |
| §2.3 (closing) | S1 | Understand relationships, not just store docs | SRS | 6.2 | Memory Engine | Relationship test | Partial | **Designed**: §5.3 |
| §2.4 | S1 | Context Engine: intent, task class, domain, selection, semantic + relationship retrieval, source priority, confidence, history, prompt construction, token optimization, gap identification | SRS | 8 | Context Router | Retrieval eval | Partial: prompt construction not designed; semantic vs relationship retrieval not distinguished | **Partial**: §8; prompt/token optimizer not designed beyond budgets; response validation FUT |
| §2.5 | S1-C (baseline) / FUT (hardening) | Governance: provenance, versioning, access control, classification, approvals, audit, backup, sensitive data, AI provider permissions, controlled actions, retention/deletion | SRS | 6.3, 6.4, 12 | Governance | Security tests | Partial: retention/deletion, provider permissions undefined | **Partial**: §13, 10.6, 7.8–7.9; classification policy and retention periods open (DR-11, DR-20) |
| §2.6 | FUT | MVP Phases 6–10 (email, jobs, career ops, E2E, release) | SRS | 17 | n/a | FUT | Deferred | **FUT**: deferred |
| §3.1 | S1-C | Not an isolated chatbot; must not distort Stage One with other apps | SRS | 2, 3 | Boundary rule | Review | Covered: Stage One stays independent of CareerOps | **Designed**: §1.4, Appendix B |
| §3.2 L1 | S1 (vault, agent sessions) / FUT (Chrome Extension) | Initial interface = CareerOps Assistant + Chrome Extension; corrections and approvals | SRS | 5.1, 11.2 | User/Agent Access | UAT | Stage One interface is vault + agent sessions + local review interface; Chrome Extension is FUT. SRS sentence needs amending (SRS-CR-07) | **Designed**: §3.1, 3.2; SRS wording to amend (CR-07) |
| §3.2 L2 | S1 (retrieval, orchestration) / FUT (response validation) | Request Interpreter, Intent Classifier, Context Engine, Retrieval, Reasoning Orchestrator, Prompt/Token Optimizer, Provider Adapter, Response Validator | SRS | 5.2 | Context Router, Orchestrator, Provider Adapter | Unit/Integration | Partial: 4 of 8 not present | **Partial**: C-03, C-07, C-09; Prompt/Token Optimizer and Response Validator not designed |
| §3.2 L3 | S1 | Source Registry, Ingestion Manager, Document Processing, Content Extraction, Knowledge Extraction, Entity Resolver, Relationship Manager, Learning Engine, Validation, Version Manager, Indexing | SRS | 5.2, 7 | Ingestion, Memory, Governance, Source Ledger | Unit/Integration | Partial: Entity Resolver, Relationship Manager, Version Manager only implied | **Designed**: §3.3, 4.10, C-01, C-02 |
| §3.2 L4 | S1 | Persistent foundation: originals, extracted content, structured knowledge, entities, history, provenance, indexes | SRS | 5.1, 6 | Vault, Index, Ledger | Persistence tests | **Conflict**: DB-as-store (SRS) vs vault-as-truth (SDD) | **Designed**: PO-D01 approved the hybrid direction (vault authoritative for approved knowledge; Operational Database for operational records); SRS wording to align (CR-03, CR-20); DR-03 and ADR-001 still open |
| §3.2 L5 | S1 (Git, documents, AI provider) / FUT (Gmail, Sheets, jobs, MCP, automation) | Gmail, Sheets, Job connectors, Document, Git, AI provider, MCP Server, Automation Orchestrator, API adapters | SRS | 9, 10 | Connectors, Provider Adapter | Integration | Partial for S1: Git, document and AI-provider integration specified in v1.1; Gmail, Sheets, job connectors, MCP, automation are FUT | **Partial**: Git, document and AI-provider integration designed; Gmail, Sheets, job, MCP, automation are FUT |
| §3.2 cross-cutting | S1-C | AuthN, AuthZ, secrets, audit, monitoring, error handling, backup, config | SRS | 11–13 | Governance | Security/Reliability | Partial: monitoring, configuration thin | **Partial**: §13, 14; monitoring thresholds and configuration management thin |
| §4.1 | S1 | 11 knowledge domains | SRS | 6.1 | Memory Engine | Coverage | Partial | **Partial**: §10.1; Business, Operations |
| §4.2 | S1 | 26 entity types | SRS | 6.2 | Memory Engine | Schema review | Partial: roughly half represented | **Partial**: §3.15a, 3.15b; additions need CR-11 |
| §4.3 | S1 | 13 named relationships with evidence and history | SRS | 6.2 | Memory Engine | Relationship test | Partial | **Partial**: §3.15a, 5.3.3; relationships for several types undefined |
| §4.4 | S1 | Knowledge record fields; **validity period** distinct from recorded time | SRS | 6.3 | Memory Engine | Schema tests | Partial: validity period missing | **Designed**: §5.3.6, 10.2, 10.2a |
| §4.5 | S1 | Originals preserved; Markdown; JSON; SQLite option; search indexes | SRS | 5.1, 14, ADR-001/006 | Vault, Index | ADR review | **Conflict** (see F-03) | **Designed**: PO-D01 hybrid direction; SRS wording to align (CR-03); DR-03 and ADR-001 still open |
| §5.1 | S1 | Learning lifecycle incl. "permitted rule" auto-persist | SRS | 6.4, 7.1 | Ingestion, Governance | Knowledge tests | **Conflict** with always-approve (F-05) | **Designed**: PO-D02 limits automation to low-risk reversible operational processing; SRS §5.1 to align (CR-04, CR-18); DR-04 and ADR-018 still open |
| §5.2 | S1 | Initial profile learning inputs/outputs | SRS | 7 | Ingestion | Profile test | Partial | **Designed**: §3.6, 6 |
| §5.3 | S1 | Update existing knowledge, avoid duplicates | SRS | 7.1 (dedup) | Ingestion | Duplicate test | Covered | **Designed**: §6.2, 10.4 |
| §5.4 | S1 | Seven knowledge states incl. explicitly provided, user-confirmed, superseded | SRS | 6.3, 6.4 | Governance | Classification tests | Partial: SDD state names differ; mapping needed | **Designed**: §10.2, 10.2a mapping; DR-12 |
| §5.5 | S1 (corrections) / FUT (recommendation outcomes) | Learning from outcomes: user corrections and confirmations (S1); recommendation outcomes (FUT) | SRS | none | none | Knowledge tests | Partial for S1: correction path missing; recommendation outcomes deferred | **Designed**: S1 corrections §6.4–6.5; recommendation outcomes FUT |
| §6.2 | S1 | Context flow incl. response validation and feedback capture | SRS | 8.1 | Context Router | Retrieval eval | Partial: no validation or feedback steps | **Designed**: S1 feedback §6.4; response validation FUT |
| §6.3 | S1 | Retrieve relevant only; do not load unrelated info | SRS | 8.2 | Context Router | Relevance eval | Covered (concept) | **Designed**: §8 |
| §6.4 | S1 | Token optimization; record usage; measure not assume | SRS | 8.2, 15.2 | Context Router | Token measurement | Partial: no metric | **Partial**: §8.3, 14.1; token baseline missing |
| §6.5 | S1 | Model independence via provider adapters | SRS | 5.2, ADR-005 | Provider Adapter | Provider fallback | Covered (concept) | **Designed**: C-09 |
| §7.1–7.4 | S1 (stack choice) / FUT (existing-system reuse) | Stack: ASP.NET Core, SQLite, FTS, embeddings, MCP, Gemini, Codex/Claude Code | SRS | 14.1 | various | n/a | Stack is a Stage One decision (ADR-002/003/005). "Existing" CareerOps technology is not a dependency | **Partial**: ADR-002, ADR-003, ADR-005 open |
| §9.4 | S1-C | Codex and Claude Code share instructions and Git-controlled work | SRS | 9.1 | Agent Instructions | Fresh-session test | Covered (package AGENTS.md/CLAUDE.md) | **Designed**: C-08; package instruction files |
| §9.5 | S1-C | Repository structure `docs/00-vision…13-progress` | SRS | n/a | n/a | n/a | **Conflict** with package layout (F-07) | **Conflict**: C-05 / ADR-017 |
| §10.1 | S1-C | Feature → requirement ID → component → task → test → result | SRS | this matrix | n/a | Review | **Ambiguous**: SRS has no IDs | **Ambiguous**: SRS has no IDs (DR-01) |
| §10.2–10.3 | S1-C | Quality gates and change management | SRS | 20 | n/a | Gate review | Partial | **Partial**: §19; change control |
| §11.1 | FUT | Gmail read-only email intelligence | SRS | 10.3 (generic) | Email Connector | Integration/E2E | Deferred (FUT). An email supplied as a file is an ordinary document in Stage One | **FUT**: deferred |
| §11.2 | FUT | Job discovery, matching, gaps, duplicates | SRS | 17 only | none | E2E | Deferred (FUT) | **FUT**: deferred |
| §11.3 | FUT | Career operations: Sheets sync, interview extraction, follow-ups | SRS | 10.2, 10.3 | CareerOps Adapter | E2E | Deferred (FUT) | **FUT**: deferred |
| §11.4 | FUT | 12 integration scenarios (Gmail, jobs, applications) | SRS | 16 | n/a | Integration | Deferred (FUT) | **FUT**: deferred |
| §11.5 | FUT | MVP demonstration list | SRS | 17 | n/a | UAT | Deferred (FUT) | **FUT**: deferred |
| §13.1 | S1 | Performance (incremental, bounded memory, efficient retrieval) | SRS | 15.2 | Ingestion, Context Router | Performance tests | Partial: no targets | **Partial**: §14.1; targets missing |
| §13.2 | S1 | Reliability (recoverable, idempotent, backup/restore) | SRS | 15.1 | Ingestion, Connectors | Reliability tests | Partial: no targets | **Partial**: §6.3 idempotent, resumable runs; §7.7; targets missing |
| §13.3 | S1-C | Security | SRS | 12 | Governance | Security tests | Partial | **Partial**: §13; classification and policies open |
| §13.4 | S1 | Maintainability (modular, documented APIs, ADRs) | SRS | 15.3 | all | Review | Partial: no API specs | **Partial**: §11 interfaces IF-01…IF-09 proposed; ADRs open |
| §13.5 | S1 | Scalability (volume, domains, providers, connectors) | SRS | none | none | n/a | **Not covered** in SDD | **Not covered**: no scalability design; no figures |
| §14.1 | S1 | 9 test levels | SRS | 16 | n/a | n/a | Partial: API, regression, E2E levels absent in SDD §16 | **Partial**: §15.1; test levels defined, API/regression detail missing |
| §14.2–14.4 | S1 (14.2, 14.3) / FUT (14.4 automation) | Knowledge, AI, automation test lists | SRS | 16.1 | n/a | n/a | Partial | **Partial**: §15.2, 15.2a: AS-01…AS-62 defined; labelled data and thresholds missing (DR-11) |
| §15.1–15.3 | S1-C (local) / FUT (cloud) | Environments, deployment, monitoring | SRS | 11.3 | n/a | Smoke/rollback | Partial: Stage One local/test environments; cloud deployment FUT | **Partial**: §12 local environments; cloud FUT |
| §16 | S1-C | 11 required project records | SRS | n/a | Package | Review | Partial: API specs, Knowledge Model, Test Spec, Changelog, Implementation Status absent | **Partial**: Knowledge Model and Test Specification still to be created |
| §18 (foundation) | S1 (8 of 9) / FUT (CareerOps criterion) | 9 acceptance criteria; the last ("CareerOps preserved or migrated") is FUT | SRS | 16.1 | n/a | UAT | Partial: 8 S1 criteria not mapped one-to-one; CareerOps criterion deferred (C-07) | **Partial**: AS-01…AS-08 map criteria 1–8; thresholds missing; criterion 9 FUT |
| §18 (MVP) | FUT | 6 further criteria (email, jobs, tracking, automation, E2E, reliability) | SRS | 17 | n/a | UAT | Deferred (FUT) | **FUT**: deferred |
| §19 | S1 (6 of 12) / FUT (6 of 12) | 12 decisions needing validation | SRS | 14.2 | ADRs | ADR approval | 6 are Stage One decisions (database, vector search, local-first boundary, Obsidian structure, AI provider/fallback, agent permission model); MCP implementation, Gmail method, job providers, background jobs, cloud boundaries and frontend changes are FUT | **Partial**: ADR-001…ADR-025 proposed; none approved |

## 2. Package-derived IDs (provisional, non-SRS)

The package file `REQUIREMENTS-BASELINE.md` uses FR-/NFR- IDs authored by the package. Until the SRS is re-issued with IDs, these map to SRS as follows. They are **not** approved IDs.

| Package IDs | SRS locator | Note |
|---|---|---|
| FR-KN-001…006 | §4.4, §5.4, §2.5 | FR-KN-006 (review/approval) conflicts with §5.1 "permitted rule" path |
| FR-LN-001…006 | §5.1–5.5 | FR-LN-006 (learn from corrections) overlaps §5.5, which has no SDD coverage |
| FR-TI-001…004 | §2.3, §4.2 | |
| FR-CE-001…006 | §2.4, §6 | |
| FR-AG-001…005 | §9, §7.4, §13.3 | |
| FR-CO-001…006 | §11 | **FUT.** CareerOps-specific; not Stage One. Package uses "should"; SRS uses "shall" for some. Wording differs |
| NFR-SEC/PRV/REL/DAT/MNT/PORT/PERF/OBS/REC | §13, §15 | Package NFRs contain no numbers either. NFR-PORT-001 has no direct SRS counterpart. |

## 3. Reverse trace: SDD components with weak or no requirement justification

| SDD component / element | Requirement basis | Finding |
|---|---|---|
| Handoff Manager | Product Owner scope ("session continuity"); SRS §16 (Handoff record); Design Input diagram (unverified) | Justified by scope; SRS defines handoff as a document, not a component |
| Workflows & Skills | Design Input diagram only (SRS §9.2/§16 mention workflows and prompts only as engineering practice) | No SRS requirement for it as a runtime component. Justified only by the unverified diagram |
| Task / Workflow Orchestrator | SRS §3.2 L2 "Reasoning Orchestrator" (S1); L5 "Automation Orchestrator" (FUT) | Stage One keeps only the first |
| Source Ledger | SRS §3.2 L3 "Source Registry" | Name differs |
| Derived Search / Metadata Index | SRS §3.2 L4 "Search indexes" | Justified |
| MCP Adapter | SRS §3.2 L5 "MCP Server" | Justified |
| C-13 Data Protection and Recovery | PO-D07, PO-D01; SRS §13.2 (recoverability), §2.5 | Justified by the Product Owner decisions; SRS text covers backup and recovery only in general terms |
| C-14 Evaluation and Regression Service | PO-D08; SRS §14.2–14.4 | Justified by PO-D08 |
| Source Registry (C-04) | SRS §3.2 L3 "Source Registry"; PO-A | Justified; ownership assigned to C-04 in v1.3 (SDD §4.10) |
| Evidence Store (C-02) | PO-G; SRS §2.5 provenance | Justified |
| Obsidian vault as canonical | Design Input diagram (unverified); SRS §4.5 says "Markdown provides a human-readable workspace" | SRS does not say source of truth |

## 4. Stage One summary

**Current status against SDD v1.4.2** (computed from the last column of Part A): 60 rows; 8 are FUT only (§1.4-8, §2.6, §11.1–11.5, §18 MVP); **52** are S1 or S1-C (mixed rows count by their S1 part).

| Status | Count of the 52 |
|---|---|
| Designed (proposed) | 23 |
| Partial | 25 |
| Conflict (open decision) | 1: §9.5 (C-05, ADR-017) |
| Not covered | 1: §13.5 |
| Ambiguous | 1: §10.1 |
| Outside SDD | 1: §1.4-10 |

Three rows moved from Conflict to Designed because the Product Owner approved the direction that resolves the disagreement (PO-D01 for §3.2 L4 and §4.5; PO-D02 for §5.1). That does not approve the SRS wording, DR-03, DR-04, ADR-001 or ADR-018; those stay open.

**Historical baseline (SDD v1.0, matrix v0.4):** Covered 9, Partial 37, Conflict 4, Not covered 1, Ambiguous 1 of 52. Those figures describe the old baseline and are **not** the current status.

## 5. Part B — Confirmed Product Owner direction → SDD v1.4.2

Source rank 1 (Product Owner instruction). Keys PO-S, PO-A…PO-H are the Product Owner's own groupings, not requirement IDs. Status is the status of the **design in SDD v1.4.2**; nothing is approved or implemented. Section numbers refer to v1.3.

| Key | Direction (summary) | SDD v1.4.2 § | Components | Scenarios | Status | Open decisions |
|---|---|---|---|---|---|---|
| PO-S1 | Learn from documents and files | 4.4 | SA-1, C-02 | AS-01, 09, 23 | Designed (proposed) | DR-06 |
| PO-S2 | Learn from conversations and discussions | 4.5 | SA-2, C-02 | AS-23 | Designed (proposed) | Third-party consent handling |
| PO-S3 | Learn from AI interactions, incl. coding sessions | 3.9, 4.6, 5.2 | SA-3, C-08, C-05, C-02 | AS-24, 31 | Designed (proposed) | DR-14 capture mechanism |
| PO-S4 | Learn from project work and evolution | 4.7, 5.4 | SA-4, C-02, C-01 | AS-23, 25 | Designed (proposed) | DR-13 |
| PO-S5 | Learn from technical environments | 4.8, 5.5 | SA-5, C-02 | AS-26, 35, 36 | Designed (proposed) | DR-15 |
| PO-S6 | New information, observations, ideas, plans, decisions, corrections, outcomes | 4.9, 5.2, 6.4 | SA-6, C-02, C-04 | AS-23, 28 | Designed (proposed) | DR-27 (direct-input promotion policy, unresolved); DR-04 is the general governance policy |
| PO-S7 | Connected understanding, not just ingestion or Markdown storage | 2.2, 5.3, 8 | C-01, C-02, C-03 | AS-23, 31 | Designed (proposed) | DR-12, 13 |
| PO-A | Distinct source adapters; acquisition, authorization, extraction, evidence, change detection, incremental processing, failure, security; distinguish direct, file import, agent-assisted, manual; one owner per source responsibility (Source Registry in C-04, adapters in C-10, ledger in C-02) | 3.4, 3.4a, 3.5, 4, 4.10 | C-10, C-04, C-02 | AS-09, 10, 23, 60 | Designed (proposed) | DR-06, 14, 19 |
| PO-B | AI interaction learning with typed assertions; AI never auto-verified; user-reported results kept apart from independently verified results; entry via exports, handoffs, agent capture | 3.9, 5.1, 5.2, 4.6 | SA-3, C-02, C-04, C-05 | AS-24, 34, 40, 61 | Designed (proposed) | DR-12, 14 |
| PO-C | Project intelligence and cross-source project attribution | 3.10, 5.4 | C-02, C-01, C-03 | AS-23, 25 | Designed (proposed) | DR-13 |
| PO-D | Technical environment intelligence; documented/configured/observed/verified (verified only from independent evidence) | 3.5, 3.10, 5.5, 4.8 | SA-5, C-02 | AS-26, 29, 35, 36, 61 | Designed (proposed) | DR-15 |
| PO-E | Stable identity, typed relationships, provenance, validity, resolution, discovery, conflicts, history, relationship-aware retrieval, entity and relationship lifecycles, cross-project connections | 3.7, 3.15, 3.16a, 3.16b, 5.3 | C-01, C-02, C-03, C-11 | AS-29, 30, 37, 38, 42–48, 51, 61, 62 | Designed (proposed) | DR-13, DR-17 |
| PO-F | Recurring learning: triggers, change detection, incremental, corrections, conflicts, recovery, evaluation; configuration guard | 3.8, 3.13, 6 | C-07, C-02, C-04, C-06 | AS-27, 28, 32, 34 | Designed (proposed) | DR-11, 17 |
| PO-G | Seven persistence classes; evidence identity, ambiguous moves, identical fingerprints, source change, missing sources, retained excerpts, snapshots, deletion, historical provenance | 3.11, 3.11a, 7 | C-01, C-02, C-04 | AS-33, 54–59 | Designed (proposed) | DR-16, 20 |
| PO-H | Context retrieval: intent, projects, entities, decision history, current/historical, evidence, confidence, contradictions, gaps | 3.12, 8 | C-03, C-11 | AS-29, 30, 31 | Designed (proposed) | DR-11 (relevance metric) |

## 6. Part C — SRS rows whose status changed from the v1.0 baseline (current: SDD v1.4.2)

| Locator | Design reference (SDD v1.4.2) | Current status |
|---|---|---|
| §3.2 L3 (Entity Resolver, Relationship Manager, Version Manager, Document Processing, Content Extraction) | §3.3, §5.3, C-01, C-02 | Designed (proposed) |
| §3.2 L2 (Request Interpreter, Intent classification) | §3.12, C-03 | Partial: request interpretation and intent designed; Prompt/Token Optimizer not designed beyond budgets; Response Validator FUT |
| §4.2 entity types | §3.15a (26 SRS types), §3.15b (proposed additions) | Partial: relationships for 13 types undefined; additions need SRS-CR-11 |
| §4.3 relationships | §3.15a (13 SRS), §5.3.3, §3.16b | Partial: 13 named relationships shown and relationship states defined; relationships for other types undefined; additions proposed |
| §4.4 validity period | §5.3.6, §10.2, §10.2a | Designed (proposed) |
| §5.1 approval vs "permitted rule" | ADR-018, §13.13 | Designed (proposed): PO-D02 direction resolves the disagreement; SRS wording to align (CR-04); DR-04 and ADR-018 still open |
| §5.2, §5.3 | §3.6, §6.2, §10.4 | Designed (proposed) |
| §5.4 states | §10.2, §10.2a mapping and canonical vocabularies | Designed (proposed); resolves C-08 pending DR-12 |
| §5.5 learning from outcomes | §6.4 (corrections), §5.2 (outcome, lesson) | S1 part designed; recommendation outcomes FUT |
| §6.2 feedback capture | §6.4, §3.13 | Designed (proposed); response validation FUT |
| §6.3, §6.4 | §8, §14.1 | §6.3 Designed; §6.4 Partial (token baseline still missing) |
| §13.2 reliability | §6.3, §7.7 | Partial: idempotent runs and resume designed; targets missing |
| §14.2, §14.3 test lists | §15.2, §15.2a AS-01…AS-62 | Partial: scenarios defined, data and thresholds missing |

## 7. Part D — Change request → SDD v1.4.2

The CR register (`SRS-CHANGE-REQUESTS.md` v0.3) holds the full traceability (CR → SDD sections, components, interfaces, scenarios). CR-08…CR-17 are Product Owner-directed design inputs with unapproved SRS status. **Dependency direction:** CR-12/13 (one lifecycle) is a design input to CR-16; CR-16 scenarios verify it and nothing depends on CR-16. Scenario range: **AS-01…AS-72**. CR-18 to CR-21 (proposed) cover PO-D02, PO-D03, PO-D01/PO-D07 and PO-D06; see Part E.

| Key | Content (SDD v1.4.2) | SDD § | Scenarios |
|---|---|---|---|
| PO-E / CR-11 | Canonical vocabularies including one relationship state set; entity and relationship lifecycles; temporal rules T1–T7; cross-project rules X1–X7; evidence per transition; conflict-resolution authority (rules R1–R8) | 10.2a, 3.16a, 3.16b, 3.10b, 5.3.5–5.3.11, 10.5 | AS-29, 42…48, 51, 61, 62 |
| PO-F / CR-12+13 | One lifecycle table with 11 stages; move and change handling | 6.0, 7.6–7.7 | AS-27, 28, 32, 34, 45, 49, 50, 54, 56 |
| PO-G / CR-14 | Evidence identity, move resolution, retention, deletion, historical provenance | 3.11a, 7.2–7.10 | AS-33, 54–59 |
| CR-16 | Fixture-based quality scenarios and evidence, registry, verification and vocabulary scenarios | 15.2a, 15.3 | AS-39…62 |
| CR-17 / PO-A | Capture modes and source authorization lifecycle; Source Registry owned by C-04 | 3.4a, 4.1, 4.10 | AS-10, 23, 60 |
| CR-08, CR-10 | User-reported vs independently verified results; user authority distinguished from independent verification | 5.2, 5.3.5, 5.5, 3.10a, 10.5 | AS-24, 40, 61 |

## 8. Part E — Product Owner decisions → requirements, design, decisions and verification

Source rank 1 (Product Owner). Keys PO-D01…PO-D08 are decision IDs from `docs/02-requirements/PRODUCT-OWNER-DECISION-REGISTER.md`, not requirement IDs. Status is the status of the **design** in SDD v1.4.2: every item is a proposal and **not implemented**. No ADR, DR or CR is approved or closed by this table.

| Decision | Related SRS locators | SDD v1.4.2 § | Components | Interfaces | Scenarios | CRs | ADRs | DRs | Design status |
|---|---|---|---|---|---|---|---|---|---|
| PO-D01 Storage and persistence | §3.2 L4, §4.5, §7.2 | 3.11b, 3.11c, 7.11, 7.13, 10.7 | C-01, C-02, C-04, C-11, C-13 | IF-04, IF-07, IF-10 | AS-14, 18, 20, 22, 67, 70 | CR-03, CR-14, CR-20 | ADR-001, 003, 006, 011, 025 | DR-03, 08, 21, 22, 27 | Designed (proposed); technology Open |
| PO-D02 Knowledge approval and governance | §5.1, §5.4, §2.5, §13.3 | 3.16c, 4.9a, 5.3.5, 13.13 | C-04, C-01, C-03, C-05, C-06 | IF-03, IF-08, IF-13 | AS-04, 08, 13, 24, 28, 34, 61, 64 | CR-04, CR-08, CR-12/13, CR-18 | ADR-018, 022, 009, 019 | DR-04, 12, 17, 27 | Designed (proposed); rules list and direct-input promotion Open |
| PO-D03 AI providers and data handling | §6.5, §7.4, §13.3, §14.3 | 3.21a, 13.14 | C-09, C-04, C-02, C-10, C-14 | IF-06, IF-13 | AS-16, 17, 21, 35, 41, 63 | CR-19 | ADR-005, 007, 019 | DR-05, 23 | Designed (proposed); providers Open |
| PO-D04 Source acquisition and integrations | §2.2, §3.2 L5, §9.4 | 4.1, 4.10, 6.1 | C-10, C-04, C-07, C-08, C-02 | IF-01, IF-02, IF-05, IF-09 | AS-10, 23, 60, 65, 66 | CR-17, CR-08, CR-10 | ADR-008, 020, 024, 009, 023 | DR-06, 14, 15, 19, 24 | Designed (proposed); connectors Open |
| PO-D05 Entity and relationship intelligence | §4.1–4.5 | 3.7, 3.16a, 3.16b, 5.3 | C-01, C-02, C-03, C-11 | IF-03, IF-04 | AS-37, 38, 42–48, 72 | CR-11, CR-09 | ADR-021, 006, 019, 003 | DR-13, 17, 25 | Designed (proposed); algorithms Open |
| PO-D06 Runtime, technology and process | §7.1–7.4 | 3.2a, 12.1 | C-07, all | internal | AS-15, 32, 69 | CR-21 | ADR-002, 010, 008, 007 | DR-07, 21, 24 | Designed (proposed); versions and hosting Open |
| PO-D07 Data protection, backup and recovery | §13.2, §2.5 | 3.20a, 7.9, 7.12 | C-13, C-01, C-02, C-04, C-11 | IF-10, IF-11 | AS-20, 57, 58, 67, 68 | CR-20, CR-14 | ADR-011, 025, 007, 001 | DR-08, 11, 16, 20, 22 | Designed (proposed); parameters Open |
| PO-D08 Learning quality and evaluation | §14.2–14.4, §18 | 3.13a, 6.8, 15.3 | C-14, C-02, C-03, C-04, C-06 | IF-12, IF-03 | AS-39…53, 71 | CR-16, CR-12/13 | ADR-019, 022, 003 | DR-11, 17, 26 | Designed (proposed); thresholds Open |

## 9. Open items

1. Product Owner approves an ID scheme and the SRS is re-issued with IDs (DR-01).
2. Per-row acceptance criteria and measurable targets are missing for all rows. SRS §18 criteria are qualitative.
3. Test cases do not exist; the Verification column names a method, not evidence. SDD v1.4.2 §15.2 and §15.2a propose scenario IDs (AS-01…AS-62).
4. Confirm the Stage One boundary crosswalk (DR-02).

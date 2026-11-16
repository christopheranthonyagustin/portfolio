# Product Owner Decision Register

**Document ID:** MIN-PODR-001
**Version:** 0.3 (draft)
**Date:** 2026-11-15
**Status:** Draft for Product Owner review of the consolidation. The eight **directions** recorded here are Product Owner-approved. This document does **not** approve any ADR, decision request, SRS change request or implementation.
**Canonical location:** `docs/02-requirements/PRODUCT-OWNER-DECISION-REGISTER.md`

### Revision history

| Version | Date | Description |
|---|---|---|
| 0.1 | 2026-11-15 | Initial register. Consolidates PO-D01 to PO-D08, maps them to ADRs, DRs, CRs, components, interfaces and scenarios, and records conflicts with earlier proposals |
| 0.2 | 2026-11-15 | Documentation corrections only; the eight directions are unchanged. PO-D01 consequence reworded: C-01 is the sole *application-controlled* writer of approved canonical vault content and the Product Owner may edit vault Markdown directly (detected and reconciled, never silently overwritten). Direct-user-input promotion recorded as unresolved: DR-27 added to PO-D01 and PO-D02, §5.3, §7, §8. ADR-018 row corrected. Version references updated to SDD v1.4.1 |
| 0.3 | 2026-11-15 | Documentation corrections only; the eight directions are unchanged. §5.3: DR-04 clarified as the general governance policy (it excludes direct-input promotion, DR-27); DR-07 clarified as runtime and process specifics (language and process-model direction already approved by PO-D06). Current references updated to SDD v1.4.2 and the registers' current versions |

---

## 1. Purpose and authority

This register is the canonical record of the Product Owner's eight architectural directions for Mindora Stage One — Learning. It exists so that the SDD, the ADR register, the decision requests, the change-request register and the traceability matrix all cite one source.

**Authority.** The decisions are Product Owner decisions (highest source rank in the SDD authority precedence). They are **product and architectural directions**. They do not, by themselves, approve a technology, an ADR, a decision request, an SRS change or the start of implementation. Each of those needs its own explicit Product Owner approval.

**Decision date.** The directions were provided to this engagement for consolidation on 2026-11-15. The original dates on which they were decided were not supplied and are not invented here.

**Scope guard.** Stage One remains: build Mindora's foundational Learning Engine and persistent connected knowledge capabilities, across the six confirmed source categories. CareerOps, Gmail and email intelligence, job discovery and tracking, Google Sheets, cloud deployment, MCP server implementation and any integration not explicitly approved for Stage One stay outside Stage One. The CareerOps repository was not requested or inspected.

## 2. Status vocabulary used in this register and in SDD v1.4.2

| Label | Meaning |
|---|---|
| **PO-approved direction** | Decided by the Product Owner (PO-D01…PO-D08) |
| **Technical proposal** | A design suggestion made by the architecture work to realise a direction. Not approved |
| **Assumption** | Something taken as true for now and needing confirmation |
| **Unresolved decision** | Left open on purpose; recorded as an open item, ADR or DR |
| **Implementation status** | For every item: **not implemented**. No code, schema, configuration or infrastructure exists |

A direction being approved never makes a named technology, algorithm or parameter approved.

## 3. Decision summary

| ID | Title | Approved direction (short) | Approval status | Implementation status |
|---|---|---|---|---|
| PO-D01 | Storage and persistence | Hybrid: Knowledge Vault, Operational Database, derived indexes | PO-approved direction | Not implemented |
| PO-D02 | Knowledge approval and governance | Risk-based hybrid governance | PO-approved direction | Not implemented |
| PO-D03 | AI providers and data handling | Hybrid, provider-independent AI architecture | PO-approved direction | Not implemented |
| PO-D04 | Source acquisition and integrations | Hybrid acquisition: four modes, read-only by default | PO-approved direction | Not implemented |
| PO-D05 | Entity and relationship intelligence | Hybrid knowledge graph | PO-approved direction | Not implemented |
| PO-D06 | Runtime, technology and process architecture | Local-first modular monolith, .NET / C# | PO-approved direction | Not implemented |
| PO-D07 | Data protection, backup and recovery | Automatic local and independent encrypted backups, tested recovery | PO-approved direction | Not implemented |
| PO-D08 | Learning quality, evaluation and continuous improvement | Continuous evaluation against a human-reviewed baseline | PO-approved direction | Not implemented |

## 4. Decision records

Each record separates what the Product Owner approved from what the architecture proposes. "SDD" sections refer to MIN-SDD-001 v1.4.2.

### PO-D01 — Storage and Persistence

**Approved direction (PO).** Hybrid architecture with three persistence responsibilities:
1. **Knowledge Vault**: Markdown-based and Obsidian-compatible; authoritative for approved canonical knowledge; human-readable and portable.
2. **Operational Database**: authoritative for operational records; stores evidence, observations, candidates, review queues, learning runs, checkpoints, corrections and audit records.
3. **Derived Indexes**: search, relationship and timeline indexes; rebuildable; never authoritative.

**Product Owner conditions.** No silent synchronization that overwrites approved knowledge. The Knowledge Vault and the Operational Database must be backed up consistently. Database technology, vault location, synchronization mechanism and index technology remain undecided.

**Architectural consequences (technical proposals).** The earlier term "operational store" is replaced by "Operational Database" (same concept; technology still open). The Memory Engine (C-01) is the **sole application-controlled writer of approved canonical vault content**; the Product Owner may edit vault Markdown directly, and Mindora must detect and reconcile such edits and never silently overwrite them (SDD §7.13). No other component writes approved canonical content; the Operational Database never writes the vault; indexes are rebuilt from the vault and the Operational Database and write to neither. A consistency checker reports vault/database mismatches and never auto-repairs. Backup sets carry a manifest tying a vault snapshot to a database snapshot (SDD §7.11, §7.12).

**Affected components.** C-01, C-02, C-04, C-11, C-13 (new, proposed).
**Related requirements.** SRS §3.2 L4, §4.5, §7.2 (SQLite suggested, not decided); SRS-CR-03; CR-14; CR-20.
**Related ADRs / DRs.** ADR-001, ADR-003, ADR-006, ADR-011, ADR-025 / DR-03, DR-08, DR-21, DR-22, DR-27.
**Remaining technical decisions (unresolved).** Database technology; vault location; synchronization mechanism; index technology; backup consistency mechanism; how a direct human edit of the vault is promoted into, or confirmed as, approved knowledge (DR-27).
**Assumptions.** A single user and one active vault at a time in Stage One.
**Approval status.** Direction approved. ADR-001 and the technology choices are not approved.

### PO-D02 — Knowledge Approval and Governance

**Approved direction (PO).** Risk-based hybrid governance. Low-risk, reversible operational processing may be automated under approved rules. New or changed authoritative knowledge requires explicit Product Owner approval. Governance policy changes require explicit Product Owner approval. Uncertain, conflicting or significant knowledge changes enter a review queue. Approval, rejection, deferral, clarification and supersession decisions must be auditable. User approval must never be confused with independent evidence verification.

**Product Owner conditions.** The user remains the final authority over personal decisions and approved canonical knowledge. AI cannot independently change governance policies.

**Architectural consequences (technical proposals).** Three governance tiers (SDD §13.13): automated operational processing; review-queue approval for canonical changes; significant or contentious changes flagged and excluded from batch approval. IF-03 gains `defer` and `clarify` actions and the candidate vocabulary gains `deferred` and `clarification_requested`. Governance policies become versioned, Product Owner-approved records changed only through IF-13. Relationships derived deterministically still enter as candidates; there is no auto-assertion of canonical knowledge.

**Affected components.** C-04, C-01, C-03, C-05, C-06.
**Related requirements.** SRS §5.1, §5.4, §2.5, §13.3; SRS-CR-04; CR-08, CR-12/13, CR-18.
**Related ADRs / DRs.** ADR-018, ADR-022, ADR-009, ADR-019 / DR-04, DR-12, DR-17, DR-27.
**Remaining technical decisions.** Which operations count as low-risk and reversible; the approved-rules list; the definition of "significant". **Unresolved Product Owner policy (DR-27):** how a user's own direct statements, manual submissions and direct vault edits are promoted into approved authoritative knowledge. PO-D02 requires explicit approval for authoritative knowledge but does not settle this.
**Approval status.** Direction approved. ADR-018 and ADR-022 are not approved.

### PO-D03 — AI Providers and Data Handling

**Approved direction (PO).** Hybrid, provider-independent AI architecture. Support local and hosted AI providers. Use a common Provider Adapter. Sensitive information must remain local unless the Product Owner explicitly authorizes external processing. Apply data minimization and secret filtering. Record provider, model, processing operation and authorization provenance. Provider replacement must not require redesigning the Learning Engine.

**Product Owner conditions.** AI cannot change external data-sharing policies. Providers, models, embeddings, fallback strategies and costs remain undecided.

**Architectural consequences (technical proposals).** The Provider Adapter (C-09) must obtain an allow/deny decision from Governance (C-04) before any call, after classification, secret filtering and minimization. Every call writes a provider-call record (provider, model, operation, data class, authorization id). A fallback may only use a provider authorized for that data class; a local-to-hosted fallback is never automatic for sensitive data. Embedding generation is a provider operation under the same rules (SDD §13.14, §3.21a).

**Affected components.** C-09, C-04, C-02, C-10, C-14 (when AI scoring is used).
**Related requirements.** SRS §6.5, §7.4, §14.3, §2.5, §13.3; CR-19.
**Related ADRs / DRs.** ADR-005, ADR-007, ADR-019 / DR-05, DR-23.
**Remaining technical decisions.** Actual providers and models; embeddings; fallback strategy; costs; which sensitivity classes count as "sensitive".
**Assumptions.** The proposed four-level sensitivity scale (SDD §10.2) is a starting point; "sensitive" means any class above `public` until the Product Owner decides.
**Approval status.** Direction approved. ADR-005 is not approved.

### PO-D04 — Source Acquisition and Integrations

**Approved direction (PO).** Hybrid acquisition. All four acquisition modes are required: direct integration; file-based import; agent-assisted capture; manual submission.

**Product Owner conditions.** Read-only access by default. Background monitoring only for explicitly authorized sources; no monitoring without explicit authorization. AI agents submit evidence and knowledge candidates. Agents cannot directly modify approved canonical knowledge. Source registration, authorization, monitoring and capture must be traceable. Specific connectors, agent protocols, file watchers and scheduling technologies remain undecided.

**Architectural consequences (technical proposals).** Monitoring becomes a separate, explicit authorization attribute in the Source Registry (default off); a registration alone authorizes reads during an explicit run. SDD v1.3.1 said direct integration with live external tools was "not assumed"; v1.4 records direct integration as a required mode whose connectors are undecided and whose Stage One baseline is direct read of local sources. Agent submissions are candidates or evidence only.

**Affected components.** C-10, C-04, C-07, C-08, C-02.
**Related requirements.** SRS §2.2, §3.2 L5, §9.4; CR-17, CR-08, CR-10.
**Related ADRs / DRs.** ADR-008, ADR-020, ADR-024, ADR-009, ADR-023 / DR-06, DR-14, DR-15, DR-19, DR-24.
**Remaining technical decisions.** Specific connectors; agent protocols; file watchers; scheduling; whether any live introspection is allowed.
**Approval status.** Direction approved. The related ADRs are not approved.

### PO-D05 — Entity and Relationship Intelligence

**Approved direction (PO).** Hybrid knowledge graph. Mandatory: connected knowledge graph across all domains; stable globally unique entity IDs; typed and directional relationships; provenance for entities and relationships; historical and temporal validity; entity resolution and duplicate detection; conflicting relationships preserved and surfaced; AI-discovered relationships remain candidates until approved; relationship-aware retrieval and traversal; derived graph indexes remain rebuildable and non-authoritative.

**Product Owner conditions.** A separate graph database is not mandated. Graph storage technology, traversal strategy and entity-resolution algorithms remain undecided.

**Architectural consequences (technical proposals).** Entity ids must be globally unique without central coordination (format open). Each relationship type has a defined direction; reverse views are derived. v1.3.1 allowed relationships "auto-asserted for technical derivations if approved"; v1.4 removes that: all new relationships are candidates until approved (batch approval is an explicit approval).

**Affected components.** C-01, C-02, C-03, C-11.
**Related requirements.** SRS §4.1–4.5; CR-11, CR-09.
**Related ADRs / DRs.** ADR-021, ADR-006, ADR-019, ADR-003 / DR-13, DR-17, DR-25.
**Remaining technical decisions.** Graph storage form; traversal strategy; entity-resolution algorithms; id format.
**Approval status.** Direction approved. ADR-021 is not approved.

### PO-D06 — Runtime, Technology and Process Architecture

**Approved direction (PO).** Local-first modular monolith. Primary language: .NET / C#. Logically separated background workers, initially within the same application deployment. Independently testable components. Background learning must not block interactive operations. Avoid premature microservices and unnecessary multi-language complexity.

**Product Owner conditions.** The specific .NET version, UI framework, hosting model, database and worker execution technology remain undecided.

**Architectural consequences (technical proposals).** One deployable with an interactive host and logical workers (learning, indexing, protection, evaluation, monitoring). Components sit behind interfaces so they can be tested with stand-ins. Any non-.NET component needs an explicit decision (SDD §12.1).

**Affected components.** C-07 and all components.
**Related requirements.** SRS §7.1–7.4 (ASP.NET Core / C# proposed); CR-21.
**Related ADRs / DRs.** ADR-002, ADR-010, ADR-008, ADR-007 / DR-07, DR-21, DR-24.
**Remaining technical decisions.** .NET version; UI framework; hosting model; database; worker technology.
**Approval status.** Direction approved. ADR-002 is not approved.

### PO-D07 — Data Protection, Backup and Recovery

**Approved direction (PO).** Automatic local backups. Independent encrypted backups. Explicit Product Owner authorization required before using external backup storage. Classification- and purpose-based retention. Protect the Knowledge Vault and the Operational Database. Deleted content must disappear from active systems and retrieval indexes. Preserve only permissible minimal provenance and audit records, subject to applicable erasure requirements. Backup integrity and restoration must be tested.

**Product Owner conditions.** Unresolved: backup rotation, retention periods, encryption-key management, RPO and RTO, tombstone retention, detailed erasure procedures.

**Architectural consequences (technical proposals).** A Data Protection and Recovery module (C-13) creates consistent backup sets, verifies integrity, runs restore tests, enforces retention and orchestrates deletion across the vault, the Operational Database and the indexes. Deletion is tracked as a job; deleted ids are excluded from retrieval until propagation completes; restores re-apply deletions. v1.3.1 left removal from indexes to "the next refresh"; v1.4 requires propagation as part of the deletion operation (SDD §7.9, §7.12).

**Affected components.** C-13, C-01, C-02, C-04, C-11.
**Related requirements.** SRS §13.2, §2.5; CR-14, CR-20.
**Related ADRs / DRs.** ADR-011, ADR-025, ADR-007, ADR-001 / DR-08, DR-11, DR-16, DR-20, DR-22.
**Remaining technical decisions.** The six listed above.
**Approval status.** Direction approved. ADR-011 and ADR-025 are not approved.

### PO-D08 — Learning Quality, Evaluation and Continuous Improvement

**Approved direction (PO).** Continuous evaluation and regression testing. All six confirmed source categories must be evaluated. Build a human-reviewed baseline evaluation dataset. Evaluate: (1) extraction accuracy, (2) entity resolution, (3) relationship accuracy, (4) provenance integrity, (5) conflict detection, (6) temporal accuracy, (7) retrieval relevance, (8) learning and recovery reliability. The Product Owner approves measurable quality thresholds after reviewing baseline results. AI may recommend improvements.

**Product Owner conditions.** AI cannot change learning policies or governance behavior without explicit Product Owner approval. The evaluation framework, dataset format, sample sizes, scoring methods and numerical thresholds remain undecided.

**Architectural consequences (technical proposals).** An Evaluation and Regression Service (C-14) holds the reviewed dataset, runs regression on any change of extractor, prompt, model, provider, configuration or schema, and reports per dimension and per source category. AI recommendations are inert proposals (SDD §6.8).

**Affected components.** C-14, C-02, C-03, C-04, C-06.
**Related requirements.** SRS §14.2–14.4, §18; CR-16, CR-12/13.
**Related ADRs / DRs.** ADR-019, ADR-022, ADR-003 / DR-11, DR-17, DR-26.
**Remaining technical decisions.** Framework; dataset format; sample sizes; scoring; thresholds.
**Approval status.** Direction approved. No threshold is approved.

---

## 5. Traceability and mapping

IDs below are the existing IDs in the ADR register (MIN-ASM-ADR-001 v0.8), the decision requests (SDD §18 and the readiness assessment) and the change-request register (MIN-ASM-CR-001 v0.7). New IDs raised by this consolidation are marked **new** and are proposals.

### 5.1 Decision → change requests, components, interfaces, scenarios

| Decision | SRS change requests | Components | Interfaces | Verification scenarios |
|---|---|---|---|---|
| PO-D01 | CR-03 (rationale updated), CR-14, **CR-20 (new)** | C-01, C-02, C-04, C-11, **C-13 (new)** | IF-04, IF-07, **IF-10 (new)** | AS-14, 18, 20, 22, 67, 70 |
| PO-D02 | CR-04 (rationale updated), CR-08, CR-12/13, **CR-18 (new)** | C-04, C-01, C-03, C-05, C-06 | IF-03, IF-08, **IF-13 (new)** | AS-04, 08, 13, 24, 28, 34, 61, 64 |
| PO-D03 | **CR-19 (new)** | C-09, C-04, C-02, C-10, C-14 | IF-06, IF-13 | AS-16, 17, 21, 35, 41, 63 |
| PO-D04 | CR-17 (extended), CR-08, CR-10 | C-10, C-04, C-07, C-08, C-02 | IF-01, IF-02, IF-05, IF-09 | AS-10, 23, 60, 65, 66 |
| PO-D05 | CR-11 (extended), CR-09 | C-01, C-02, C-03, C-11 | IF-03, IF-04 | AS-37, 38, 42–48, 72 |
| PO-D06 | **CR-21 (new)** | C-07 and all components | all internal | AS-15, 32, 69 |
| PO-D07 | CR-14, CR-20 | C-13, C-01, C-02, C-04, C-11 | IF-10, **IF-11 (new)** | AS-20, 57, 58, 67, 68 |
| PO-D08 | CR-16 (extended), CR-12/13 | **C-14 (new)**, C-02, C-03, C-04, C-06 | **IF-12 (new)**, IF-03 | AS-39…53, 71 |

### 5.2 Every ADR

"Direction resolved" means the Product Owner decision settles the high-level direction only. **No ADR is approved or closed by this table.** All ADRs keep their IDs and their status "Proposed" or "Open" until the Product Owner approves them individually.

| ADR | Title | Existing status | Related decision | Direction resolved? | Technical detail still open | ADR revision needed? | Explicit technical approval still required? |
|---|---|---|---|---|---|---|---|
| ADR-001 | Canonical knowledge storage | Proposed direction | PO-D01, D07 | **Yes** (hybrid, three responsibilities) | DB technology, vault location, sync mechanism, index technology, backup consistency mechanism | Yes: name Operational Database; consistency; no silent sync | Yes |
| ADR-002 | Runtime, stack and component boundaries | Open | PO-D06 | **Yes** (modular monolith, C#/.NET, workers in one deployment) | .NET version, UI framework, hosting model, database, worker technology | Yes | Yes |
| ADR-003 | Search and retrieval | Open | PO-D01, D05 | Partly (derived, rebuildable, non-authoritative; no graph database mandated) | Index technology, traversal strategy, embeddings | Yes: graph index, deletion propagation | Yes |
| ADR-004 | MCP interface | Deferred (FUT) | PO-D04 (boundary) | Not affected (MCP server implementation stays future-stage; agent protocols undecided) | Everything | No | Yes, at the future stage |
| ADR-005 | AI provider abstraction and data handling | Open | PO-D03 | **Yes** (hybrid, local and hosted, common adapter) | Providers, models, embeddings, fallback, costs, sensitivity rule | Yes | Yes |
| ADR-006 | Knowledge schema | Open | PO-D01, D05 | Partly | Id format, relationship direction semantics, new records | Yes | Yes |
| ADR-007 | Local vs cloud execution | Open | PO-D03, D06, D07 | **Yes** (local-first; hosted providers and external backup only by explicit authorization) | none beyond linked DRs | Yes (wording) | Yes |
| ADR-008 | Ingestion and learning-trigger architecture | Open | PO-D04, D06 | Partly (four modes; monitoring only when authorized; non-blocking workers) | Watchers, scheduling | Yes | Yes |
| ADR-009 | Identity and agent authorization | Open | PO-D02, D04 | Partly (agents cannot modify canonical knowledge) | Agent identity mechanism | Minor | Yes |
| ADR-010 | Environments and deployment | Open | PO-D06 | **Yes** (local-first, no cloud in Stage One) | Hosting model | Minor | Yes |
| ADR-011 | Versioning and backup | Open | PO-D01, D07 | Partly (automatic local and independent encrypted backups; external only by authorization; consistency; tested restore) | Rotation, keys, RPO/RTO, Git remote use | Yes | Yes |
| ADR-012 | CareerOps data compatibility | Deferred (FUT) | none | Not affected | — | No | At the future stage |
| ADR-013 | Gmail integration method | Deferred (FUT) | none | Not affected | — | No | At the future stage |
| ADR-014 | Job discovery providers | Deferred (FUT) | none | Not affected | — | No | At the future stage |
| ADR-015 | Background jobs and cloud scheduling | Deferred (FUT) | PO-D06 (note) | Not affected: Stage One workers are in-process; cloud scheduling stays FUT | — | No | At the future stage |
| ADR-016 | Chrome Extension changes | Deferred (FUT) | none | Not affected | — | No | At the future stage |
| ADR-017 | Repository documentation layout | Open | none | Not affected | Layout choice | No | Yes |
| ADR-018 | Automatic-update policy | Open | PO-D02 | **Yes** in direction (risk-based hybrid) | Low-risk list, "significant" definition; promotion of direct user statements (DR-27) | **Yes: conflict C-P1** | Yes |
| ADR-019 | Extraction, entity resolution and validation approach | Open | PO-D02, D03, D05, D08 | Partly (AI relationships stay candidates; policy protection; evaluation) | Algorithms, thresholds | Yes (minor) | Yes |
| ADR-020 | Source types, source store and Source Registry ownership | Open | PO-D04 | Partly (four modes; traceable registration) | Connectors, source types, watchers | Yes: monitoring authorization, direct integration | Yes |
| ADR-021 | Entity identity, lifecycles, vocabulary, relationship storage | Open | PO-D05 | **Yes** in direction (hybrid graph) | Storage form, algorithms, id format | **Yes: conflict C-P2** | Yes |
| ADR-022 | Learning-configuration governance and correction feedback | Open | PO-D02, D08 | **Yes** in direction | Guard details, evaluation gating | Yes: cover governance and data-sharing policy | Yes |
| ADR-023 | Technical inspection scope and live introspection | Open | PO-D04 (read-only default) | **No** (live introspection not decided) | Whether live introspection is ever allowed | Clarify only | Yes |
| ADR-024 | AI session capture mechanisms | Open | PO-D04 | Partly (agent-assisted capture required; agents submit candidates) | Mechanism per tool | Minor | Yes |
| ADR-025 | Evidence identity, retention, deletion and snapshot policy | Open | PO-D07 | Partly (classification and purpose retention; deletion propagation; minimal provenance subject to erasure) | Tombstone retention, periods, procedures | **Yes: conflict C-P6** | Yes |

### 5.3 Every decision request

**Closure rule used here (proposed; the Product Owner may amend it).** The existing decision-request table defines the decision needed but no separate acceptance conditions. A DR is treated as closable only when (a) every element of its stated decision is decided and recorded by the Product Owner, and (b) its linked ADR, if any, has a Product Owner approval record. **No DR is closed by this consolidation.** "Direction received" means a Product Owner direction bears on the DR without satisfying the rule.

| DR | Existing title | Existing status | Related decision | Result after consolidation | What remains open |
|---|---|---|---|---|---|
| DR-01 | Requirement ID scheme; re-issue SRS | Open | none | Not affected. Open | Everything |
| DR-02 | Stage One boundary crosswalk | Open | scope guard | Not affected. Open | Crosswalk confirmation |
| DR-03 | Canonical storage model | Open | PO-D01 | **Direction received.** Open: (b) unmet (ADR-001 not approved); SRS-CR-03 pending | ADR-001 approval; technology via DR-21 |
| DR-04 | General knowledge approval and governance policy (originally: Approval policy, including direct user input) | Open | PO-D02 | **Direction received.** Open | Low-risk operations list and approved rules; definition of "significant"; conflict and uncertainty handling details; procedure for governance-policy changes. **Direct-input promotion is not part of DR-04: it is DR-27** |
| DR-05 | Provider model, first provider, data-handling rule | Open | PO-D03 | **Direction received** (provider model). Open | First provider; sensitivity rule (details in DR-23) |
| DR-06 | Stage One source types and source store | Open | PO-D04 | Partly. Open | Source types; source store policy |
| DR-07 | Runtime and process architecture specifics (originally: Language, runtime, process model) | Open | PO-D06 | **PO-D06 approved the primary language (.NET / C#) and the process-model direction; neither awaits confirmation.** DR-07 stays open for the specifics | .NET version; hosting model; UI framework; background worker technology and implementation details; other runtime-specific choices. Database technology is decided with DR-21 |
| DR-08 | Vault location, sync, backup | Open | PO-D01, D07 | Partly. Open | Vault location; sync mechanism; rotation |
| DR-09 | MCP in or out of Stage One | Open | task boundary | Consistent with the Product Owner's stated boundary (MCP server implementation is future-stage). **Left open** pending a formal recorded decision | Formal confirmation |
| DR-10 | Move SRS §18 CareerOps criterion and SRS Stage 0 to future stages | Open | scope guard | Consistent with the stated boundary. Left open | Formal confirmation; CR-07 |
| DR-11 | Measurable targets, thresholds, retention periods | Open | PO-D07, D08 | **Direction received** (thresholds approved after baseline review). Open | Thresholds; retention periods |
| DR-12 | Assertion kinds, epistemic classes, promotion rules | Open | PO-D02 | Direction consistent (approval is not verification). Open | Approval of the specific rules |
| DR-13 | Relationship storage form, types, vocabularies, isolation default | Open | PO-D05 | Partly. Open | Storage form; isolation default |
| DR-14 | Which AI agents can export or submit sessions | Open | PO-D04 | Partly (agent-assisted capture required). Open | Mechanism per agent |
| DR-15 | Live technical introspection default off | Open | PO-D04 | Not resolved (read-only default only). Open | Whether ever allowed |
| DR-16 | Evidence excerpt retention and snapshot policy | Open | PO-D07 | Partly. Open | Policy values |
| DR-17 | Learning-configuration governance; auto-accept classes | Open | PO-D02, D05, D08 | **Direction received** (AI cannot change policy; relationships stay candidates). Open | Any auto-accept class for entity resolution |
| DR-18 | Approve the SRS revision (CR-01…) | Open | none | Not affected. Open; now spans CR-01…CR-21 | Approval |
| DR-19 | Source Registry ownership, lifecycle, IF-01 | Open | PO-D04 | Direction consistent (traceable registration). Open | Confirmation |
| DR-20 | Evidence identity, move, retention, deletion rules; parameters | Open | PO-D07 | Partly. Open | Rotation, tombstone retention, erasure procedures |
| DR-21 (**new**) | Operational Database and index technology | Open (new) | PO-D01, D06 | Raised | Technology selection |
| DR-22 (**new**) | Encryption-key management and the external-backup authorization process | Open (new) | PO-D07 | Raised | Keys; authorization record |
| DR-23 (**new**) | Provider selection details: models, embeddings, fallback, cost limits | Open (new) | PO-D03 | Raised | Selections |
| DR-24 (**new**) | Connectors, file watcher and scheduling technology; monitoring authorization policy | Open (new) | PO-D04, D06 | Raised | Selections and policy |
| DR-25 (**new**) | Graph traversal strategy and entity-resolution algorithms | Open (new) | PO-D05 | Raised | Strategy; algorithms |
| DR-26 (**new**) | Evaluation framework, dataset format, sample sizes, scoring methods | Open (new) | PO-D08 | Raised | Framework details |
| DR-27 (**new**) | Promotion of a user's direct statements, manual submissions and direct vault edits into approved authoritative knowledge | Open (new) | PO-D02, PO-D01, PO-D04 | Raised: PO-D02 requires explicit approval but does not settle how the user's own direct statements are promoted | The policy; options are recorded in ADR-018 (none recommended) |

## 6. Conflicts between existing proposals and the eight directions

Each conflict is a proposal in an earlier SDD or ADR that no longer fits. The corrections were made in SDD v1.4 (and carry forward unchanged in v1.4.2) as **proposals**; none of them approves an ADR.

| ID | Earlier proposal | Direction it conflicts with | Resolution in SDD v1.4 (proposal) |
|---|---|---|---|
| C-P1 | ADR-018 option B and SDD §13.3: automatic "formatting, link repair" edits to vault files | PO-D02, PO-D01: changed authoritative knowledge needs explicit approval; no silent change to the vault | Such edits are allowed only under Product Owner-approved rules, only if non-semantic, versioned and reversible; the list is Open (DR-04) |
| C-P2 | SDD §5.3.4: technical-derivation relationships "may be auto-asserted if approved" | PO-D05: AI-discovered relationships remain candidates until approved; PO-D02 | Removed. All new relationships are candidates; batch approval is explicit approval |
| C-P3 | SDD §4.1: direct integration with a live tool "not assumed for any source" | PO-D04: direct integration is a required mode | Direct integration recorded as a required mode; connectors undecided; read-only default; Stage One baseline is direct read of local sources |
| C-P4 | SDD §6.1: change-driven trigger by start-up scan or optional watcher with no separate authorization | PO-D04: monitoring only for explicitly authorized sources | `monitoring` becomes a separate authorization on the Source Registry, default off |
| C-P5 | ADR-007 and SDD: "local-only except provider calls" | PO-D03: local and hosted providers; sensitive data local unless authorized | Local providers add no egress; hosted calls need an authorization decision per data class and purpose |
| C-P6 | SDD §7.9: tombstone remains by default; removal from indexes "on the next refresh" | PO-D07: deleted content disappears from active systems and retrieval indexes; only permissible minimal provenance kept | Tombstone is minimal, subject to erasure, retention Open; deletion propagates to indexes within the deletion operation; deleted ids are excluded from retrieval meanwhile |
| C-P7 | ADR-011: optional private Git remote | PO-D07: external storage needs explicit authorization | A remote counts as external storage and needs a recorded authorization |
| C-P8 | SDD terminology "operational store" | PO-D01: Operational Database | Renamed; technology still open |
| C-P9 | IF-03 actions lacked deferral and clarification | PO-D02: deferral and clarification must be auditable | `defer` and `clarify` added; vocabulary extended |
| C-P10 | No logical worker model; runtime described only as one application | PO-D06: workers, non-blocking learning | Worker model and non-blocking rule added (SDD §12.1) |
| C-P11 | Evaluation measures did not name provenance integrity, conflict detection and temporal accuracy as dimensions | PO-D08: eight dimensions | Eight dimensions named, mapped to scenarios (SDD §6.8, §15.3) |
| C-P12 | Entity ids "opaque, minted once" without a global uniqueness requirement | PO-D05: stable globally unique ids | Global uniqueness added as a requirement; format Open |
| C-P13 | Backup of vault and database described separately | PO-D01, D07: consistent backup; tested restore | Backup sets with a consistency point and tested restore (SDD §7.12) |

## 7. New items raised (all proposals, none approved)

| Kind | IDs |
|---|---|
| Decision requests | DR-21, DR-22, DR-23, DR-24, DR-25, DR-26 (from the first consolidation) and DR-27 (v0.2) |
| SRS change requests | CR-18 (risk-based governance), CR-19 (provider-independent AI and data handling), CR-20 (hybrid persistence, protection, backup, retention and deletion), CR-21 (runtime and process architecture). CR-11, CR-12/13, CR-16 and CR-17 extended; CR-03 and CR-04 rationale updated |
| Components (logical) | C-13 Data Protection and Recovery; C-14 Evaluation and Regression Service |
| Interfaces | IF-10 protection operations; IF-11 delete and erase; IF-12 evaluation; IF-13 governance policy and external-processing authorization |
| Scenarios | AS-63…AS-72 |

## 8. Unresolved technical decisions, prioritized by dependency and impact

1. **Foundations:** DR-07 (.NET version, hosting model, worker technology) and DR-21 (Operational Database and index technology). Most other decisions depend on them.
2. **Persistence and protection:** DR-08 (vault location, synchronization) and DR-22 (encryption keys, external-backup authorization), then DR-20 and DR-16 (tombstone retention, retention periods, erasure procedures).
3. **Governance and learning model:** DR-04 (risk tiers and approved automation list), DR-27 (promotion of direct user statements) and DR-12 (assertion and promotion rules), because ADR-018, ADR-019 and ADR-022 depend on them.
4. **AI providers:** DR-05 (sensitivity rule, first provider), then DR-23 (models, embeddings, fallback, costs).
5. **Acquisition:** DR-06, DR-14, DR-15, then DR-24 (connectors, watchers, scheduling).
6. **Knowledge graph:** DR-13, then DR-25 (traversal and resolution algorithms), DR-17.
7. **Evaluation:** DR-26 (framework), then DR-11 (thresholds, after the baseline results exist).
8. **Housekeeping:** DR-01, DR-02, DR-09, DR-10, DR-18.

## 9. Implementation statement

Nothing in this register is implemented. No code, schema, package, provider configuration, key, connector, job or infrastructure exists. The readiness verdict is **NOT READY FOR IMPLEMENTATION**. Implementation needs a separate explicit Product Owner authorization after the technical decisions and the architecture review.

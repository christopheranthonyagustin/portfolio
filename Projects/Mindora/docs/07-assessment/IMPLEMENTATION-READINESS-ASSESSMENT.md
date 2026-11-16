# Implementation Readiness Assessment — Stage One (Learning)

**ID:** MIN-ASM-RDY-001 | **Version:** 0.9 draft | **Date:** 2026-11-15
**Assesses:** MIN-SDD-001 **v1.4.2** (draft) with the Product Owner Decision Register v0.3 (MIN-PODR-001), CR register v0.7 and RTM v0.9. Nothing is approved and nothing is implemented.

## Verdict

**NOT READY FOR IMPLEMENTATION.** The eight Product Owner decisions (PO-D01…PO-D08) fix architectural directions; they approve no ADR, no decision request, no SRS change and no technology, and they do not authorize implementation. The design is ready for **Product Owner review**: the consolidation, decisions DR-01…DR-27, the CR register and the SDD. No claim of implementation readiness is made. No SRS change request and no ADR is approved, and no blocker depends on CareerOps or its repository. Implementation needs a **separate explicit Product Owner authorization** after the technical decisions and the architecture review.

## Part A — Historical findings (kept for history; do not read as current)

| Version assessed | Finding | Current treatment |
|---|---|---|
| v0.1 (SDD v1.0) | CareerOps repository not supplied, listed as a blocker | **Withdrawn.** CareerOps is not a Stage One dependency |
| v0.1 | Gmail, job discovery and Sheets gaps (G-01, G-02) | Moved to future stages |
| SDD v1.1 baseline | Document-centric architecture; findings R-01…R-12 (SDD §2.5): four of six source categories without acquisition design, no claim typing, no project model, generic technical sources, no identity or relationship design, manual-only learning, five data classes, record-level retrieval, 22 scenarios | **Addressed in the v1.2 design** (see Part B). Not current findings |
| SDD v1.2 | Findings 1–7 of the v1.3 correction request: stale readiness and matrix counts, relationship state vocabulary mismatch, CR-12/13 ↔ CR-16 cycle, user-confirmed vs verified, Source Registry ownership, evidence identity and retention | **Corrected in v1.3.** Log: `CORRECTION-LOG.md` |
| SDD v1.3 / CR register v0.3 | Malformed CR-11 and CR-14 rows; obsolete `confirmed` and "under review" relationship wording in CR-11; conflict-resolution authority not distinguished from verification; correction log reported the CR vocabulary check as passed in error | **Corrected in v1.3.1 / CR register v0.4.** Log: `CORRECTION-LOG.md` |
| SDD v1.3.1 | Thirteen earlier proposals conflicted with the eight Product Owner directions (PODR §6: for example auto-assertion of derived relationships, "direct integration not assumed", monitoring without authorization, default tombstones, "operational store") | **Corrected in SDD v1.4 as proposals.** Log: `CORRECTION-LOG.md` |
| SDD v1.4 | Stale ADR dependency statements for ADR-001 and ADR-002; outdated §16 ADR summary; ambiguous Knowledge Vault write ownership; direct-user-input governance blurred | **Corrected in SDD v1.4.1** (direct-input promotion kept unresolved as DR-27). Log: `CORRECTION-LOG.md` |
| Readiness v0.8 / SDD v1.4.1 | Gate evidence still named SDD 1.4, PODR 0.1, CR register 0.5 and RTM v0.7; DR-04 and DR-07 descriptions blurred approved direction with open detail (DR-04 appeared to cover direct user input; DR-07 appeared to await the language) | **Corrected in SDD v1.4.2 and readiness v0.9.** Log: `CORRECTION-LOG.md` |

Figures from earlier versions (for example "22 scenarios", "0 of 14 ADRs", "AS-01…AS-53", "Covered 9, Partial 37" for the v1.0 baseline) are historical and are not repeated as current.

## Part B — Current assessment (SDD v1.4.2)

### Counts

| Item | Current value |
|---|---|
| Architecture diagrams (Mermaid; syntax valid; **none rendered or visually inspected**) | 39 |
| Components | C-01…C-11, C-13 and C-14 specified (C-13 and C-14 are new, proposed); C-12 FUT (boundary only) |
| Interfaces (proposed) | IF-01…IF-13 |
| Verification scenarios | **AS-01…AS-72 (72)** |
| Stage One ADRs (all proposals) | **19**: 001, 002, 003, 005, 006, 007, 008, 009, 010, 011, 017, 018, 019, 020, 021, 022, 023, 024, 025 |
| Deferred (FUT) ADRs | 6: 004, 012, 013, 014, 015, 016 |
| Product Owner decisions | PO-D01…PO-D08: approved **directions**; none implemented |
| Decision requests | **DR-01…DR-27 (27)**; none closed |
| SRS change requests | CR-01…CR-07 *Proposed*; CR-08…CR-17 *Aligned, design input*; CR-18…CR-21 *Proposed* (SRS unapproved) |
| RTM Part A rows | 60; 8 FUT-only; **52** Stage One. Current status of the 52: Designed 23, Partial 25, Conflict 1, Not covered 1, Ambiguous 1, Outside SDD 1 |

### Gates (package `QUALITY-GATES.md`, applied to Stage One)

| Gate | Criterion | Status | Evidence |
|---|---|---|---|
| 0 | Correct source versions identified | Pass | SRS 2.0 (unchanged), SDD 1.4.2, PODR 0.3, package 0.1, CR register 0.7, RTM 0.9, ADR register 0.8, gap analysis 0.9 |
| 0 | Design Input and SRS traceable | **Fail** | SRS has no IDs and is a working baseline; Design Input diagrams not supplied; CR-08…17 not approved |
| 0 | Repository and environment inspected | **Not applicable** | CareerOps is not a Stage One dependency |
| 0 | No hidden source conflict | Pass (surfaced) | C-01…C-08 and C-P1…C-P13 (PODR §6). Directions received for C-01, C-03 and C-06; C-04, C-05 and C-08 open; the SRS wording and the ADRs are still to be approved |
| 0 | Product Owner decisions consolidated | Pass for the draft | PODR v0.3 records PO-D01…PO-D08; SDD v1.4.2 §1.6 and Appendix E show which elements are approved directions, proposals, assumptions or unresolved |
| 1 | Requirements linked to components | Partial | RTM v0.9 (Part E maps PO-D01…PO-D08) |
| 1 | Data flows and trust boundaries documented | Pass for draft | SDD §3, §13 |
| 1 | ADRs approved for material choices | **Fail** | 0 of 19 approved |
| 1 | Risks and failure modes considered | Pass for draft | SDD §14.2, §17 |
| 1 | Verification approach defined | Partial | SDD §15: 72 scenarios and a fixture design; the human-reviewed baseline dataset does not exist and thresholds are missing (DR-11, DR-26) |
| 1 | Internal consistency of the document set | Pass for the draft | Re-run on the revised files and reported in `CORRECTION-LOG.md` (v1.4.2 section); CR register table, relationship vocabulary, dependency graph, versions and cross-references checked |

### Decision requests for the Product Owner

| ID | Decision | Needed for |
|---|---|---|
| DR-01 | Requirement ID scheme; re-issue the SRS with IDs (CR-01) | Traceability |
| DR-02 | Stage One boundary crosswalk (SDD Appendix A) | Scope |
| DR-03 | Canonical storage model (ADR-001, C-01) | Data and component design |
| DR-04 | General knowledge approval and governance policy (ADR-018, C-03): risk-based governance; low-risk reversible operational processing; approval requirements for authoritative knowledge changes; conflict and uncertainty handling; approval, rejection, deferral, clarification and supersession; governance policy changes needing explicit Product Owner approval. **It does not decide the promotion of direct user statements, manual submissions or direct vault edits; that is DR-27** | Governance |
| DR-05 | Provider model, first provider, data-handling rule (ADR-005) | Extraction, privacy |
| DR-06 | Stage One source types and source store (ADR-020) | Ingestion scope |
| DR-07 | Runtime and process architecture specifics (ADR-002): .NET version; hosting model; UI framework; background worker technology and implementation details; other runtime-specific choices (database technology is decided with DR-21). **Not open, already approved by PO-D06:** local-first modular monolith; .NET / C# as primary language; logically separated background workers in the same deployment; independently testable components; non-blocking background learning; no premature microservices or unnecessary multi-language complexity | Runtime |
| DR-08 | Vault location, sync, backup | Deployment |
| DR-09 | MCP in or out of Stage One (proposed: out) | Interfaces |
| DR-10 | Move the SRS §18 CareerOps criterion and SRS Stage 0 to future stages (CR-07) | Acceptance |
| DR-11 | Measurable targets, thresholds and retention periods | Verification |
| DR-12 | Assertion kinds (incl. `user_reported_change`, `user_reported_result`), epistemic classes, promotion rules; only independent evidence yields `verified`; user confirmation recorded separately | Core learning model |
| DR-13 | Relationship storage form, new entity and relationship types, canonical state vocabularies, cross-project isolation default | Knowledge model |
| DR-14 | Which AI agents can export or submit sessions, and how | AI interaction learning |
| DR-15 | Live technical introspection: default off confirmed? | Technical intelligence |
| DR-16 | Evidence excerpt retention and snapshot policy | Provenance, privacy |
| DR-17 | Learning-configuration governance; any auto-accept entity-resolution class | Continuous learning |
| DR-18 | Approve the SRS revision (CR-01…CR-17); the revised SRS is prepared only after explicit approval | Requirements |
| DR-19 | Source Registry ownership by C-04, source lifecycle states, IF-01 as a management interface | Source authorization |
| DR-20 | Evidence identity, move resolution, retention and deletion rules; open parameters: excerpt length limit, scans before `missing`, retention periods, backup rotation, erasure of tombstones and audit entries | Provenance, privacy |
| DR-21 | Operational Database and index technology (ADR-001, ADR-003) | Persistence, runtime |
| DR-22 | Encryption-key management and the external-backup authorization process (ADR-011) | Protection and recovery |
| DR-23 | Provider selection details: models, embeddings, fallback strategy, cost limits (ADR-005) | AI providers |
| DR-24 | Connectors, file watcher and scheduling technology; monitoring authorization policy (ADR-008, ADR-020) | Acquisition |
| DR-25 | Graph traversal strategy and entity-resolution algorithms (ADR-021, ADR-019) | Knowledge graph |
| DR-26 | Evaluation framework, dataset format, sample sizes and scoring methods (ADR-019, ADR-022) | Evaluation |
| DR-27 | Promotion of a user's direct statements, manual submissions and direct vault edits into approved authoritative knowledge (ADR-018; SDD §4.9a, §7.13) | Governance, provenance, approval workflow |

**Status after PO-D01…PO-D08.** DR-21 to DR-26 were raised by the consolidation and DR-27 by the v1.4.1 corrections. **No decision request is closed.** DR-04 (general governance policy), DR-07 (runtime and process specifics) and DR-27 (direct-input promotion policy) are separate: DR-04 does not decide DR-27, and DR-07 does not await confirmation of the language or the process-model direction, which PO-D06 approved. A Product Owner direction has been received for DR-03, DR-04, DR-05, DR-07, DR-11 and DR-17, but none of them meets the closure rule (every element decided and the linked ADR approved). DR-09 and DR-10 are consistent with the Product Owner's stated Stage One boundary but remain open pending a formal recorded decision. Per-DR status: `docs/02-requirements/PRODUCT-OWNER-DECISION-REGISTER.md` §5.3.

### What the Product Owner decisions change for readiness

| Decision | What it settles | What still blocks implementation |
|---|---|---|
| PO-D01 Storage | The three persistence responsibilities and the no-silent-overwrite rule | Database and index technology (DR-21); vault location and synchronization (DR-08); ADR-001 approval |
| PO-D02 Governance | Automation boundary; explicit approval; policy protection | Low-risk list and "significant" (DR-04); promotion of direct user statements (DR-27); ADR-018 and ADR-022 approval |
| PO-D03 Providers | Provider independence; local and hosted; authorization for sensitive data | Providers, models, embeddings, fallback, costs (DR-05, DR-23); ADR-005 approval |
| PO-D04 Acquisition | Four modes; read-only; monitoring only when authorized | Connectors, agent protocols, watchers, scheduling (DR-24, DR-14, DR-06) |
| PO-D05 Graph | Required graph capabilities; no graph database mandated | Storage form, traversal, resolution algorithms (DR-13, DR-25) |
| PO-D06 Runtime | Modular monolith; .NET / C#; workers | .NET version, UI framework, hosting, database, worker technology (DR-07, DR-21) |
| PO-D07 Protection | Backup, encryption, authorization, deletion principles | Rotation, retention periods, keys, RPO, RTO, tombstones, erasure (DR-11, DR-20, DR-22) |
| PO-D08 Evaluation | Dimensions, categories, baseline, threshold authority | Framework, format, sample sizes, scoring, thresholds; the dataset must be built (DR-26, DR-11) |

### Before implementation could begin

1. The Product Owner decides DR-01…DR-27 or explicitly accepts the proposals.
2. Design Input diagrams are supplied or confirmed as faithfully described.
3. Measurable targets are set and the human-reviewed baseline evaluation dataset exists (S1-G7, DR-11, DR-26).
4. The 19 Stage One ADRs are approved.
5. The SDD is reviewed and approved by the Product Owner.
6. A revised SRS is prepared **after explicit approval** of the CRs, with IDs, and the RTM is re-keyed.

### What can start without code

Vault structure, `CLAUDE.md` / `AGENTS.md`, handoff and decision templates and the capture inbox convention (Phase 1 of the package plan). They need only ADR-017 and DR-08. This is not a claim of implementation readiness.

### Top Stage One risks

| Risk | Why it matters |
|---|---|
| Storage model undecided | Drives schema, backup and component design |
| Extraction quality unmeasured; no thresholds | AI output could pollute knowledge |
| Wrong entity merges or ambiguous moves | Silent corruption or false provenance |
| AI session capture unverified | Limits automatic session learning |
| Sensitive content sent to a provider; secrets ingested | Privacy and credential exposure |
| Deletion vs Git history and backups | Retention promise cannot be met by default |
| Encryption-key loss | Backups unreadable; recovery impossible (DR-22) |
| Vault and Operational Database drift apart | Dangling evidence; mitigated by consistent backups and the consistency checker |
| Background workers starve interactive use | Poor responsiveness; limits Open |
| Scope too large for one stage | Delay; mitigated by Appendix A increments |
| Scope creep from future stages | Mitigated by FUT boundary rules (Appendix B) |

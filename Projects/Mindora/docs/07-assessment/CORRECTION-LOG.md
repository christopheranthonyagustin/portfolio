# Correction Log — SDD v1.3, v1.3.1, v1.4, v1.4.1 and v1.4.2

Sections 1–4 record the v1.3 revision as it was reported at the time. **One result in section 4 was reported in error and is withdrawn in section 8** (relationship vocabulary in the CR register). Sections 5–9 record the v1.3.1 corrections and the re-run checks. Sections 10–15 record the v1.4 Product Owner decision consolidation. Sections 16–22 record the v1.4.1 documentation corrections. Sections 23–30 record the v1.4.2 consistency pass. Section 31 records one final header correction.

## v1.3 record (historical)

**ID:** MIN-ASM-COR-001 | **Date:** 2026-11-14
**Scope:** a focused correction of the v1.2 documentation set. **No architecture redesign, no scope change, no implementation.** Stage One — Learning is unchanged; CareerOps, Gmail, job discovery, Google Sheets, cloud deployment and MCP remain outside Stage One.

## 1. Versions after this revision

| Document | Before | After |
|---|---|---|
| `docs/03-design/SYSTEM-DESIGN-DOCUMENT.md` (MIN-SDD-001) | 1.2 draft | **1.3 draft** (revision history preserved; new row added) |
| `SRS-CHANGE-REQUESTS.md` (MIN-ASM-CR-001) | 0.2 | **0.3** |
| `REQUIREMENTS-TRACEABILITY-MATRIX.md` | 0.4 | **0.5** |
| `IMPLEMENTATION-READINESS-ASSESSMENT.md` | 0.4 | **0.5** |
| `ARCHITECTURE-DECISION-REGISTER.md` | 0.3 | 0.4 (addenda only) |
| `ARCHITECTURE-GAP-ANALYSIS.md` | 0.4 | 0.5 (section 7.3b added) |
| `DOCUMENTATION-ASSESSMENT.md` | 0.3 | 0.4 (version and reference only) |
| `REPOSITORY-ASSESSMENT.md` | 0.2 | 0.2 (references updated) |

No competing copy was created. The v1.2 content was edited in place. This log is the only new file.

## 2. What changed, by finding

| # | Finding | Change | Where |
|---|---|---|---|
| 1 | Readiness and traceability out of sync with the SDD | Readiness rewritten in two parts: **Part A historical** (v0.1, v1.1 baseline, v1.2 findings) and **Part B current** (v1.3). Counts corrected: 62 scenarios (AS-01…AS-62), 19 Stage One ADRs plus 6 deferred, DR-01…DR-20, 31 diagrams. RTM Part A kept the v1.0 baseline columns as history and gained a **Current status (SDD v1.3)** column; the summary is recomputed (52 Stage One rows: Designed 20, Partial 25, Conflict 4, Not covered 1, Ambiguous 1, Outside SDD 1) and the old figures are labelled historical. Parts B–D re-pointed to v1.3 | Readiness; RTM §4–§7 |
| 2 | Relationship state vocabulary inconsistent | One canonical set: `candidate`, `asserted`, `disputed`, `stale`, `under_review`, `superseded`, `retired`, `rejected` (`rel_status`). Removed the `confirmed` state. State diagram, relationship table, lifecycle text, evidence-per-transition table, metadata, ER diagram, IF-03/IF-04, scenarios AS-47 and AS-62, CR-11 and ADR-021 now use the same tokens. New §10.2a lists every canonical vocabulary and maps the record lifecycle diagram to fields; entity states made lowercase to match | SDD §3.16a/b, §5.3.3, §5.3.9, §5.3.11, §10.2, §10.2a, §3.15c, §11 |
| 3 | CR-12/13 ↔ CR-16 circular dependency | CR-12/13 now depends on CR-08, CR-11, CR-14, CR-17 only; CR-16 depends on CR-08…CR-15 and CR-02 and **verifies** the lifecycle. The lifecycle owns its evaluation mechanism; CR-16 owns the scenarios and, with CR-02, the thresholds. SDD §6.0 states the direction; Appendix D column renamed "Verified by". Dependency graph checked acyclic | CR register §3, §4.2; SDD §6.0, App. D |
| 4 | User-confirmed vs independently verified | `confirmation` (`none` / `user_confirmed`) is separate from `epistemic_class`. New assertion kinds `user_reported_change` and `user_reported_result`. `verified_result` and `epistemic_class=verified` require independent evidence (test or build report, independent observation) and can never be set by a user, AI or agent. User authority preserved: user statements decide conflicts and display as "user-confirmed (self-reported)". Decision lifecycle: Implemented may be reached by a user report (`implementation_basis=user_report`); Verified only by independent evidence. Scenario AS-61 added | SDD §5.2, §5.4, §5.5, §3.10a, §8.3, §10.2, §10.5 |
| 5 | Source Registry ownership | **C-04** owns the Source Registry (registration, authorization metadata, source lifecycle) and IF-01; **C-10** implements adapters and *computes* fingerprints, with no state; **C-02** owns the item ledger, change classification and move resolution; C-07 dispatches only for `authorized` sources. Diagrams 3.2, 3.3 and 3.5 corrected; new source lifecycle diagram 3.4a; IF-01 redefined as a management interface; scenario AS-60 added | SDD §4.10, §3.2–3.5, §9 (C-02, C-04, C-07, C-10), §11 |
| 6 | Evidence identity and retention | New identity levels (source, item, capture, evidence unit); evidence id definition; identical fingerprints are distinct items and copies count as one source; move resolution acts automatically only when unambiguous; `unavailable` distinguished from `missing`; evidence statuses renamed to avoid collision with epistemic `verified` (`current`, `relocated`, `source_changed`, `ambiguous_move`, `unavailable`, `missing`, `unverifiable`, `purged`); excerpt and snapshot retention; reference-rule deletion with content-free provenance tombstones; historical provenance rules. New diagram 3.11a; ER updated; scenarios AS-54…AS-59 added | SDD §7.2–7.10, §6.2, §3.11a, §3.15c, §14.2 |
| 7 | Consistency of diagrams, components, interfaces, data, ADRs, traceability, scenarios | Automated and manual review (section 4). Stale terms removed; references re-pointed | all four documents |
| 8 | Future-stage items | Audited: CareerOps, Gmail, job discovery, Google Sheets, Cloud Run, cloud and MCP appear only as FUT nodes, dashed extension points or explicit exclusions. None added as a dependency | SDD §1.4, §3, App. B |
| 9 | Structure and history | Document identities, section structure and the revision history are preserved; v1.3 row added; in-place edits | SDD |
| 10 | No approvals, no readiness claim | All CRs and ADRs keep their proposed or "design input" status; the readiness verdict stays "Not ready for implementation" | CR register, ADR register, Readiness |

## 3. Unresolved decisions (none were resolved by this revision)

| ID | Decision | New or changed in this revision |
|---|---|---|
| DR-12 | Assertion kinds, epistemic classes and promotion rules | **Extended:** `user_reported_*` kinds; only independent evidence yields `verified` |
| DR-13 | Relationship storage form, entity and relationship types, cross-project isolation | **Extended:** canonical state vocabularies |
| DR-19 | Source Registry ownership by C-04, source lifecycle, IF-01 | **New** |
| DR-20 | Evidence identity, move, retention and deletion rules; open parameters (excerpt length limit, scans before `missing`, retention periods, backup rotation, erasure of tombstones and audit entries) | **New** |
| DR-01…DR-11, DR-14…DR-18 | Unchanged | — |

All 19 Stage One ADRs and all 17 CRs remain unapproved.

## 4. Consistency review across the four documents

Documents: SDD v1.3, CR register v0.3, RTM v0.5, Readiness v0.5. Checks were run by script on the files and reviewed by hand.

| Check | Result |
|---|---|
| Version strings consistent; later documents cite SDD v1.3 | Pass |
| Scenario IDs AS-01…AS-62 unique and contiguous; every AS id cited in the CR register, RTM and Readiness exists in the SDD | Pass |
| ADR count: SDD §16 table, ADR register and Readiness all list the same 19 Stage One ADRs | Pass |
| DR-01…DR-20 identical in SDD §18 and Readiness | Pass |
| Relationship state set identical in diagram 3.16b, the `rel_status` field, the CR register and the ADR register; no `confirmed` or `UnderReview` relationship state remains | ~~Pass~~ **Reported in error; withdrawn in v1.3.1.** The CR register §4.1 item 2 still listed `confirmed` and "under review"; the check was case-sensitive and did not inspect the CR register's lowercase wording. Corrected and re-checked in section 8 |
| Entity, source, evidence, item-status and decision vocabularies match their diagrams and tables | Pass (diagram state names equal table values; decision labels are capitalized renderings) |
| `verified` is never reachable by user confirmation or AI statement (text, rules, diagrams, scenarios) | Pass |
| Source Registry owned by C-04 in SDD, IF-01, CR register and ADR-020; C-10 holds no state; C-02 owns the ledger | Pass |
| CR dependency graph acyclic; CR-16 is not a dependency of CR-12/13 | Pass |
| Every CR cited in the SDD exists in the register; explicit "SDD §x" references in other documents resolve to existing headings; internal SDD section references resolve | Pass |
| 31 Mermaid diagrams parse | Pass (syntax only; not rendered) |
| Future-stage terms confined to FUT, exclusions or extension points | Pass |

**Known residual items, not defects:** the historical v1.0 columns in RTM Part A intentionally keep old statuses; Readiness Part A and Gap Analysis §7 intentionally mention v1.1 and v1.2 figures as history; "UnderReview" survives only in the candidate and record lifecycle diagram (3.16), where it maps to `candidate_status=pending_review` (§10.2a). Diagram rendering and wording were not reviewed visually.

## 5. v1.3.1 — versions after this revision

| Document | Before | After |
|---|---|---|
| `SYSTEM-DESIGN-DOCUMENT.md` (MIN-SDD-001) | 1.3 draft | **1.3.1 draft** (revision history 0.1 to 1.3.1 preserved; new row) |
| `SRS-CHANGE-REQUESTS.md` | 0.3 | **0.4** |
| `REQUIREMENTS-TRACEABILITY-MATRIX.md` | 0.5 | **0.6** |
| `IMPLEMENTATION-READINESS-ASSESSMENT.md` | 0.5 | **0.6** |
| `ARCHITECTURE-DECISION-REGISTER.md` | 0.4 | 0.5 (addendum) |
| `ARCHITECTURE-GAP-ANALYSIS.md` | 0.5 | 0.6 (section 7.3c) |
| `DOCUMENTATION-ASSESSMENT.md` | 0.4 | 0.5 (version; one historical reference made explicit as "SDD v1.0 §20") |
| `REPOSITORY-ASSESSMENT.md` | 0.2 | 0.2 (version references only) |

No competing document was created. This log was extended in place.

## 6. v1.3.1 — what changed, by finding

| # | Finding | Change |
|---|---|---|
| 1 | CR-11 / CR-14 table integrity | A v1.3 edit had matched the text "| CR-14 |" inside the CR-11 row's dependency cell and overwritten the rest of that row, leaving a stale CR-14 row. Rebuilt the CR-11 row (six cells; PO-E; depends on CR-14; DR-13, DR-17; Aligned, design input) and rewrote CR-14 as its own row (PO-G; depends on none; DR-16, DR-20; Aligned, design input). All 16 register rows verified to have six cells |
| 2 | Relationship vocabulary | CR register §4.1 item 2 now lists exactly the eight canonical states (`candidate`, `asserted`, `disputed`, `stale`, `under_review`, `superseded`, `retired`, `rejected`), removes `confirmed`, uses `under_review`, and states that confirmation and verification are attributes. All other CR-11 references were scanned for obsolete values; none remained. The CR register explains the change in its §8 |
| 3 | Conflict-resolution authority | SDD §5.3.5 now separates matters within the user's own authority (statements, preferences, plans, decisions, accepted knowledge) from technical or external facts, and adds rules R1–R8: contradictions and provenance always preserved; a user may add new evidence, correct a claim or make an authoritative decision; a user's resolution decides which claim is accepted as current but never changes an epistemic class; no user, AI, agent or Extractor can promote to `verified` or reclassify evidence without qualifying independent evidence; AI may only propose. §10.5 gives separate presentation orders for the two kinds of question. §5.2 rule 6 and the `confirmation` field wording aligned. AS-61 rewritten as five cases; AS-29 and AS-51 aligned. CR register gains §4.1 item 9 and updated CR-11 traceability |
| 4 | Log accuracy | The v1.3 result for the CR register vocabulary is marked withdrawn (section 4 above). The checks were rewritten to be case-insensitive and to inspect state lists in every document, and were re-run on the revised files (section 8) |
| 5 | Final package validation | Section 8 |

Scope, architecture, counts (62 scenarios, 19 Stage One ADRs, DR-01 to DR-20) and the readiness verdict are unchanged. No scenario was added; AS-61, AS-29 and AS-51 were edited.

## 7. Unresolved decisions (unchanged; none resolved by this revision)

DR-01 to DR-20 remain open. DR-12 now also covers the conflict-authority rules R1–R8 in SDD §5.3.5 (the user's authority versus independent verification), in addition to the user-reported assertion kinds. All 17 CRs and all 19 Stage One ADRs remain unapproved.

## 8. v1.3.1 — consistency checks re-run on the revised files

Run on the files as saved (SDD v1.3.1, CR register v0.4, RTM v0.6, readiness v0.6, ADR register v0.5, gap analysis v0.6, documentation and repository assessments). **41 checks, 41 passed, 0 failed** in the final run. One check (D9) initially reported a failure because it treated an explicit reference to "SDD v1.0 §20" as a reference to the current SDD; the reference was made explicit in the documentation assessment and the check was narrowed to current-version references.

| Group | Checks | Result |
|---|---|---|
| A. CR register table structure: header has 6 columns; all 16 rows have 6 cells; rows are CR-01…CR-11, CR-12 + CR-13, CR-14…CR-17 once each; CR-11 and CR-14 rows independent with correct PO key, dependencies and decisions; statuses only Proposed or Aligned, design input; none approved; decision references (DR, ADR) exist | A1–A7 | Pass |
| B. Dependency graph: every dependency names an existing CR; acyclic; acyclic with CR-12/13 merged; CR-16 is nobody's dependency | B1–B3 | Pass |
| C. Relationship vocabulary: every enumerated state list in all seven supporting documents and the SDD uses only the canonical eight (6 lists inspected); no obsolete wording in live text; diagram 3.16b states equal the canonical set; §10.2 and §5.3.3 values equal the set; the ER data model has `rel_status` and `confirmation` and no bare `status`; IF-04 example uses `rel_status`; no `relationship_status`; ADR register and CR §4.1 item 2 list the set | C1–C8 | Pass |
| D. Versions and cross-references: SDD 1.3.1 with revision rows 0.1…1.3.1; supporting versions as listed in section 5; no current reference to "SDD v1.3" without ".1"; AS-01…AS-62 unique and contiguous and every AS id cited elsewhere exists; 19 Stage One ADRs identical in the SDD, ADR register and readiness; DR-01…DR-20 identical in the SDD and readiness; every CR id cited in the SDD exists; explicit "SDD §x" references and CR traceability section numbers resolve; internal SDD § references resolve | D1–D11 | Pass |
| E. Conflict authority: R1–R8 present with two kinds of authority; no promotion to `verified` or reclassification without independent evidence; provenance preserved; AS-61 covers five cases; AS-29, AS-51 and §10.5 aligned; CR register cites the rules | E1–E6 | Pass |
| F. Scope: CareerOps, Gmail, job discovery, Google Sheets, Cloud Run and MCP appear only as future-stage items, exclusions or extension points | 6 checks | Pass |
| 31 Mermaid diagrams parse | 1 check | Pass (syntax only; not rendered) |

**Exclusions stated openly:** check C2 excludes two historical lines that describe the removed wording as obsolete (CR register §8 change table; readiness Part A). Check D3 excludes the one readiness Part A row that names the v1.3 findings. Check D10 excludes three SRS section lists (9.4, 14.3, 14.4) that cite the SRS, not the SDD.

**Not checked:** diagram appearance, prose quality, and any content outside the patterns above.

## 9. Readiness and approvals

Readiness verdict: **Not ready for implementation.** No CR and no ADR is approved. No implementation is authorized.

## 10. v1.4 — Product Owner decision consolidation: versions

| Document | Before | After |
|---|---|---|
| `docs/02-requirements/PRODUCT-OWNER-DECISION-REGISTER.md` (MIN-PODR-001) | none | **0.1 draft (new)** |
| `docs/03-design/SYSTEM-DESIGN-DOCUMENT.md` (MIN-SDD-001) | 1.3.1 | **1.4 draft** (revision rows 0.1 to 1.3.1 unchanged; 1.4 added) |
| `SRS-CHANGE-REQUESTS.md` | 0.4 | **0.5** |
| `REQUIREMENTS-TRACEABILITY-MATRIX.md` | 0.6 | **0.7** |
| `ARCHITECTURE-GAP-ANALYSIS.md` | 0.6 | **0.7** |
| `ARCHITECTURE-DECISION-REGISTER.md` | 0.5 | **0.6** |
| `IMPLEMENTATION-READINESS-ASSESSMENT.md` | 0.6 | **0.7** |
| `DOCUMENTATION-ASSESSMENT.md` | 0.5 | 0.6 (authority row and version references) |
| `REPOSITORY-ASSESSMENT.md` | 0.2 | 0.2 (version references only) |
| `CORRECTION-LOG.md` | v1.3.1 sections | extended in place |

**Revision numbering.** The history uses major.minor for substantive design changes (1.0 to 1.3) and a patch number for corrections (1.3.1). Consolidating eight architectural directions into the design is substantive, so the next revision is **v1.4**.

**Inspection findings that shaped the work.** (a) There is no separate Decision Request Register file: the decision requests live in SDD §18 and in the readiness assessment. No new competing register was created; per-DR mapping is in PODR §5.3 and the DR tables in SDD §18 and the readiness assessment were extended. (b) The working tree had no `docs/02-requirements/` folder (it exists in the original package); the folder was created for the new register. (c) The dates on which the eight decisions were made were not supplied; the register records the date they were provided for consolidation.

## 11. v1.4 — what changed

| Task | Change |
|---|---|
| A. Decision register | New PODR: purpose and authority, status vocabulary, eight decision records (approved direction, conditions, consequences, components, requirements, ADRs and DRs, remaining decisions, approval status), mapping tables, thirteen conflicts (C-P1 to C-P13), new items, prioritized unresolved decisions, implementation statement |
| B. ADR and DR mapping | PODR §5.2 maps all 25 ADRs; §5.3 maps all 26 DRs. **No ADR was approved or closed and no DR was closed.** Six new DRs (DR-21 to DR-26) raised for technology decisions with no existing DR. Existing IDs preserved |
| C. SDD | v1.4: §1.6; principles 12 to 18; Operational Database terminology; §4.1, §4.10, §6.1 (acquisition and monitoring authorization); §5.3 (global ids, direction, no auto-assertion); §6.8 and §15.3 (evaluation); §7.9, §7.11, §7.12 (persistence, backup, deletion); §12.1 (runtime); §13.13 to §13.15 (governance, providers, protection); components C-13 and C-14; interfaces IF-10 to IF-13 and extended IF-01, IF-03, IF-06; data-model fields and vocabularies; scenarios AS-63 to AS-72; seven new diagrams and revised existing ones; Appendices E (status matrix) and F (readiness statement) |
| D. Consistency review | Gap analysis §8.4 (document review) and the checks in section 13 |
| E. Supporting documents | CR register (CR-18 to CR-21 proposed; CR-11, CR-12/13, CR-16, CR-17 extended; CR-03 and CR-04 rationale), RTM (three rows moved from Conflict to Designed; Part E), gap analysis §8, ADR register §3, readiness assessment |

**Earlier proposals corrected because they conflicted with the directions** (PODR §6): automatic vault edits; auto-assertion of derived relationships; "direct integration not assumed"; monitoring without authorization; "local-only except provider calls"; default tombstones with lagging index removal; optional Git remote without authorization; the term "operational store"; missing defer and clarify actions; no worker model; incomplete evaluation dimensions; ids without a global uniqueness rule; separate backup of vault and database. These are proposals; they do not approve any ADR.

## 12. v1.4 — approvals and boundaries

- All eight decisions are recorded as **approved directions only**. No technology, ADR, DR, CR or SRS change is approved. No DR is closed.
- Stage One scope and the six source categories are unchanged. CareerOps, Gmail, job discovery, Google Sheets, cloud deployment and MCP server implementation remain outside Stage One. The CareerOps repository was not requested or inspected.
- No code, schema, configuration, connector, job or infrastructure was created. The deliverable tree contains Markdown files only.
- Readiness verdict: **NOT READY FOR IMPLEMENTATION**.

## 13. v1.4 — validation results

Run on the saved files (SDD v1.4, PODR v0.1, CR register v0.5, RTM v0.7, readiness v0.7, ADR register v0.6, gap analysis v0.7, documentation and repository assessments, this log). **57 checks passed, 0 failed, 1 not verified** in the final run.

| Required check | Result | Basis |
|---|---|---|
| All eight decisions present, accurately worded, unique IDs | Pass | PODR has PO-D01…PO-D08 once each; each record has every required field; direction wording matched |
| No approved direction shown as an approved technology or implementation | Pass | Each record separates approved direction, proposals and unresolved items; all show "Not implemented"; SDD Appendix E |
| Every mapped ADR and DR exists | Pass | 25 ADRs and 26 DRs in PODR; DR-01…DR-26 identical in the SDD, readiness assessment and PODR |
| No ADR approved or DR closed | Pass | No Approved, Accepted or Closed status in the ADR register, PODR or DR tables |
| CR register structure and graph | Pass | 20 rows with six cells each; CR-18…CR-21 Proposed; none approved; dependency graph acyclic; every cited CR exists |
| Requirement and scenario references resolve | Pass | AS-01…AS-72 unique and contiguous; every AS id cited in the PODR, CR register, RTM, readiness, ADR and gap documents exists. SRS locators cited in the PODR: 15 of 18 match RTM rows directly; §7.2, §7.4 and §14.3 fall inside the RTM range rows §7.1–7.4 and §14.2–14.4 |
| Component and interface references resolve | Pass | C-01…C-14 specified; IF-01…IF-13 defined; every cited id exists |
| Section references resolve | Pass | Internal SDD references and "SDD §x" references in the other documents (three SRS-list citations excluded) |
| Six source categories and future-stage exclusions intact | Pass | SA-1…SA-6 and the six-category list present; §6.8 covers all six; CareerOps, Gmail, job discovery, Google Sheets, Cloud Run and MCP appear only as future-stage items, exclusions or extension points |
| Historical revision records intact | Pass | SDD revision rows 0.1 to 1.3.1 identical to the previous file; earlier log sections preserved; AS-01…AS-62 and §5.3.5, §7.5–7.10, §10.2a still present |
| Relationship vocabulary unchanged | Pass | Diagram 3.16b equals §10.2 equals the canonical eight; new `deferred` and `clarification_requested` candidate states and the five decision outcomes are in the vocabulary |
| Readiness stays Not ready for implementation | Pass | Stated in the SDD Appendix F, the readiness assessment and the PODR; no document claims readiness |
| No new requirement IDs or numeric targets | Pass | None in the PODR; no numeric RPO, RTO or threshold in the SDD |
| RTM counts | Pass | 60 rows, 52 Stage One: Designed 23, Partial 25, Conflict 1, Not covered 1, Ambiguous 1, Outside SDD 1; matches the summary and the readiness assessment |
| No code or infrastructure created or changed | Pass | The deliverable tree holds `.md` files only |
| 38 Mermaid diagrams parse | Pass | Syntax only; not rendered |
| New diagrams contain the required elements | Pass | Automated checks for 3.2, 3.2a, 3.11b, 3.13a, 3.16c, 3.20a, 3.21a |
| **Architecture diagrams fully agree with the written design** | **Not verified** | Only the required elements of new and changed diagrams were checked automatically. A semantic and visual review of all 38 diagrams was not done, and nothing was rendered |

**Checker corrections during this run.** The first run reported four failures that were errors in the checks, not in the documents: a regular expression read "CR-00" out of the document ID "MIN-ASM-CR-001"; a bold-text pattern did not match "NOT READY FOR IMPLEMENTATION." followed by a full stop; a historical sentence in the PODR ("SDD v1.3.1 said…") was counted as a stale version reference; and the scenario-range parser did not read "39…53" and "42–48". The patterns were fixed and the checks re-run; no document text was changed to satisfy them.

**Disclosure on tooling.** A Mermaid parser (the `mermaid` and `jsdom` npm packages) was installed in a scratch folder outside the documentation tree earlier in this engagement for syntax checking, and was reused here. Nothing was installed into, or added to, the Mindora deliverables.

## 14. v1.4 — unresolved decisions

DR-01 to DR-26 are all open. The Product Owner left the technology and parameter decisions open on purpose; they are prioritized in PODR §8. First in dependency order: runtime specifics (DR-07) and the Operational Database and index technology (DR-21).

## 15. v1.4 — readiness

**NOT READY FOR IMPLEMENTATION.** Implementation needs a separate explicit Product Owner authorization after the technical decisions and the architecture review.

## 16. v1.4.1 — files inspected and path check

The task named `docs/03-design/` and `docs/02-requirements/` for several documents. The actual locations are:

| Document | Actual path |
|---|---|
| SDD | `docs/03-design/SYSTEM-DESIGN-DOCUMENT.md` |
| Product Owner Decision Register | `docs/02-requirements/PRODUCT-OWNER-DECISION-REGISTER.md` |
| ADR register, SRS change-request register, traceability matrix, gap analysis, readiness assessment, correction log | `docs/07-assessment/` (ARCHITECTURE-DECISION-REGISTER, SRS-CHANGE-REQUESTS, REQUIREMENTS-TRACEABILITY-MATRIX, ARCHITECTURE-GAP-ANALYSIS, IMPLEMENTATION-READINESS-ASSESSMENT, CORRECTION-LOG) |

No file exists at the other paths; none was created. All ten files in `docs/` were inspected.

## 17. v1.4.1 — versions and files modified

| Document | Before | After |
|---|---|---|
| SDD (MIN-SDD-001) | 1.4 | **1.4.1 draft** (patch number for corrections; revision rows 0.1 to 1.4 unchanged) |
| Product Owner Decision Register (MIN-PODR-001) | 0.1 | **0.2** |
| ADR register | 0.6 | **0.7** |
| SRS change-request register | 0.5 | **0.6** |
| Requirements traceability matrix | 0.7 | **0.8** |
| Architecture gap analysis | 0.7 | **0.8** |
| Implementation readiness assessment | 0.7 | **0.8** |
| Documentation and repository assessments | — | version references only |
| Correction log | — | extended in place |

No document was duplicated and no register was created.

## 18. v1.4.1 — exact sections corrected and how each finding was addressed

| # | Finding | Sections changed | Result |
|---|---|---|---|
| 1 | Stale ADR dependency statements | ADR register: table rows for ADR-001, 002, 005, 007, 011, 018; records ADR-001, 002, 007, 011, 018; new "Additions in v0.7" | The "Depends on" column and records now separate the **Product Owner-approved direction** (PO-D01, PO-D06, PO-D03, PO-D07, PO-D02) from the **remaining technical choices requiring ADR approval**. "PO answer to C-01" and "confirmation of language and runtime" are gone. ADR-001 and ADR-002 stay open; no ADR closed |
| 2 | Outdated SDD §16 | SDD §16 table rebuilt (19 rows; columns: approved direction, technical proposal, still open); intro; §16.1 ADR-001 and ADR-018 rows | ADR-002 shows .NET / C# approved with version, UI, hosting, database and worker technology open. ADR-007 shows provider-independent local and hosted AI with authorization for sensitive data. ADR-011 shows automatic local backups, independent encrypted backups and external storage only with explicit authorization. ADR-018 shows explicit approval for authoritative changes and the **unresolved** direct-input promotion policy. §16, §16.1, the ADR register and PODR §5.2 now cite the same Product Owner decisions per ADR (this check found four real mismatches, corrected) |
| 3 | Vault write ownership | SDD §3.2 rules, §3.2a (diagram, rules), §3.11b (diagram), §3.11c (new diagram), §3.21 (diagram), §7.11 S1, new §7.13 (rules V1 to V8), §10.2a (`reconciliation_state`), §12.1 worker rule, §13.2 tiers, C-01 (purpose, responsibilities, security), AS-22, AS-70; PODR PO-D01 consequences | One model everywhere: **C-01 is the sole application-controlled writer of approved canonical content; the Product Owner may edit vault Markdown directly; direct edits are detected, recorded with provenance and history, preserved, conflict-checked, and never silently overwritten**. Nothing forbids direct editing; C-01 is not described as owning every filesystem write |
| 4 | Direct user input governance | SDD §4.9a (new: four stages, the precise question, implications), §5.3.5 (user-authority row, rule R6), AS-61 case (1), §13.13, §18 (DR-27), Appendices E and F; ADR-018 record; PODR PO-D01, PO-D02, §5.2, §5.3, §7, §8 | Four stages separated: direct statement (evidence); AI interpretation (candidate, never authoritative); proposed assertion or change (candidate); promotion into approved knowledge (explicit approval under PO-D02). How stage 4 applies to the user's own statements is **left unresolved** and recorded as **DR-27**. Three options (P1 to P3) are listed in ADR-018 with none recommended or assumed |

## 19. v1.4.1 — decision requests

| ID | Status | Note |
|---|---|---|
| **DR-27** (new) | **Open** | Promotion of a user's direct statements, manual submissions and direct vault edits into approved authoritative knowledge (ADR-018). Added to SDD §18, the readiness assessment and PODR §5.3. Referenced by CR-18, CR-20, RTM Part E and the gap analysis |
| DR-04 | Open, definition unchanged | Its direct-input part is now tracked by DR-27 |
| All other DRs | Unchanged | **No DR is closed.** DR-01 to DR-27 are open |

## 20. v1.4.1 — cross-document consistency results

Final run on the saved files (SDD v1.4.1, PODR v0.2, ADR v0.7, CR v0.6, RTM v0.8, gap v0.8, readiness v0.8, documentation and repository assessments, this log): **74 passed, 0 failed, 1 not verified.**

| Area | Result |
|---|---|
| Decisions, mappings, statuses | Pass: PO-D01 to PO-D08 intact; 25 ADRs and DR-01 to DR-27 mapped and identical across SDD, readiness and PODR; no ADR approved or closed; no DR closed |
| ADR consistency (finding 1 and 2) | Pass: ADR-001 and ADR-002 records separate approved direction from open choices and stay open; §16 rows for ADR-002, 007, 011, 018 contain the required content; §16 and §16.1 agree with PODR §5.2 on cited decisions |
| Vault ownership (finding 3) | Pass: no remaining "only writer", "single writer", "sole vault-write path" or similar statement; diagrams 3.2a, 3.11b, 3.21 show the sole application-controlled writer and a Product Owner direct-edit path; §7.13, C-01 and S1 agree; nothing prohibits direct editing |
| Direct input (finding 4) | Pass: §4.9a, R6, the user-authority row and AS-61 no longer imply automatic promotion; DR-27 present in SDD, readiness and PODR; ADR-018 carries the options as "none recommended" |
| CR register | Pass: 20 rows with six cells; statuses unchanged; none approved; dependency graph acyclic; DR-27 in CR-18 and CR-20 |
| References | Pass: scenarios AS-01 to AS-72, components C-01 to C-14, interfaces IF-01 to IF-13, section references and CR references resolve |
| Versions | Pass: supporting-document versions as intended; no supporting document names SDD v1.3, v1.3.1 or v1.4 as current |
| Scope and history | Pass: future-stage items stay outside Stage One; SDD revision rows 0.1 to 1.4 unchanged; earlier log sections preserved |
| Readiness | Pass: **NOT READY FOR IMPLEMENTATION** in the SDD, readiness assessment and PODR |

**Checker issues in the first run (errors in the checks, not in the documents):** two diagram checks still expected the old wording "single/only writer of the vault"; a numeric RPO/RTO check matched the text "RTO (DR-22"; a decision-citation check did not read the register's shorthand "PO-D01, D05"; a DR-27 check read register traceability rows. The patterns were fixed. The decision-citation check also exposed **four real mismatches** between SDD §16 and PODR §5.2 (ADR-001, 006, 011, 019); the SDD rows were corrected.

## 21. v1.4.1 — diagram validation, reported separately

| Level | Result |
|---|---|
| **Syntax** | **Pass.** All 39 Mermaid diagrams parse with the Mermaid 10.9.1 parser. This includes the new diagram 3.11c and the edited 3.2a, 3.11b and 3.21 |
| **Semantic consistency** | **Partly reviewed.** Text-level checks and a manual read of 3.2a, 3.11b, 3.11c and 3.21 found them consistent with §7.13 and the ownership model (a detection edge was added to 3.2a and 3.11b). The other 35 diagrams were not re-reviewed beyond their prior checks, and no check compares diagram semantics with prose in general |
| **Visual rendering and inspection** | **Not done.** No diagram was rendered or visually inspected. The earlier limitation stands for all 39 diagrams (the earlier 38 plus new 3.11c) |

## 22. v1.4.1 — readiness, implementation, next step

- **Readiness: NOT READY FOR IMPLEMENTATION.** Unchanged.
- **No software implementation occurred.** The deliverable tree holds `.md` files only: no code, schema, migration, configuration, connector, job or infrastructure. No SRS change request or ADR was approved, SRS v2.0 was not changed, and none of the eight Product Owner decisions was changed. No new technology was chosen.
- **Remaining unresolved decisions:** DR-01 to DR-27, including the new DR-27. Prioritized order in PODR §8: runtime specifics and database and index technology first (DR-07, DR-21), then vault location, synchronization, keys and retention (DR-08, DR-22, DR-20, DR-16), then governance rules and the promotion policy (DR-04, DR-27, DR-12).
- **Recommended next step:** hold the technical decision session on DR-07 and DR-21, and decide DR-27 alongside DR-04 since both shape the review-queue design. This task did not begin that session.

## 23. v1.4.2 — files inspected and baseline

Actual paths (unchanged from section 16): `docs/03-design/SYSTEM-DESIGN-DOCUMENT.md`; `docs/02-requirements/PRODUCT-OWNER-DECISION-REGISTER.md`; and in `docs/07-assessment/`: ARCHITECTURE-DECISION-REGISTER, IMPLEMENTATION-READINESS-ASSESSMENT, CORRECTION-LOG, SRS-CHANGE-REQUESTS, REQUIREMENTS-TRACEABILITY-MATRIX, ARCHITECTURE-GAP-ANALYSIS, DOCUMENTATION-ASSESSMENT, REPOSITORY-ASSESSMENT. All ten files were read. Versions found before editing: SDD 1.4.1, PODR 0.2, ADR register 0.7, CR register 0.6, RTM 0.8, gap analysis 0.8, readiness 0.8, documentation assessment 0.6, repository assessment 0.2. The SRS v2.0 file is not in the working tree and was not touched.

## 24. v1.4.2 — versions after this pass

| Document | Before | After |
|---|---|---|
| SDD (MIN-SDD-001) | 1.4.1 | **1.4.2 draft** (patch number: documentation corrections only; revision rows 0.1 to 1.4.1 unchanged; row 1.4.2 added). A patch is justified because §18 text changed |
| Product Owner Decision Register | 0.2 | **0.3** |
| ADR register | 0.7 | **0.8** |
| SRS change-request register | 0.6 | **0.7** |
| Traceability matrix | 0.8 | **0.9** |
| Gap analysis | 0.8 | **0.9** |
| Readiness assessment | 0.8 | **0.9** |
| Documentation assessment | 0.6 | **0.7** |
| Repository assessment | 0.2 | **0.3** |

## 25. v1.4.2 — stale current-source references corrected

| Document and place | Was | Now |
|---|---|---|
| Readiness, Part B gate "Correct source versions identified" | SDD 1.4, PODR 0.1, CR register 0.5 | SRS 2.0 (unchanged), SDD 1.4.2, PODR 0.3, package 0.1, CR register 0.7, RTM 0.9, ADR register 0.8, gap analysis 0.9 |
| Readiness, gate "Requirements linked to components" | RTM v0.7 | RTM v0.9 |
| Readiness, "Assesses" line, Part B heading, "Product Owner decisions consolidated" gate | SDD v1.4.1, PODR v0.2, CR register v0.6, RTM v0.8 | SDD v1.4.2, PODR v0.3, CR register v0.7, RTM v0.9 |
| Decision Register, §2 heading and the "SDD sections refer to" sentence | SDD v1.4 | SDD v1.4.2 (these two were missed in v0.2) |
| Decision Register, ADR and CR register version citations | ADR v0.7, CR v0.6 | ADR v0.8, CR v0.7 |
| Traceability matrix (current-status column heading, Part B to E headings, header note, open items) | SDD v1.4.1 | SDD v1.4.2 |
| CR register (header note, §2 rule, §5 heading, §6 text) | SDD v1.4.1 | SDD v1.4.2 |
| Gap analysis, conflict row C-04 crosswalk citation | SDD v1.4 Appendix A | SDD v1.4.2 Appendix A |
| Documentation assessment, §0 crosswalk citation | SDD v1.4.1 Appendix A | SDD v1.4.2 Appendix A |
| Repository assessment (two citations) | SDD v1.4.1 | SDD v1.4.2 |

**Historical references preserved, and three earlier distortions restored.** Earlier global replacements had changed three historical statements to a later version. They were put back: readiness Part A ("Corrected in SDD v1.4 as proposals"), and two CR register change-table rows (v0.3: "re-pointed to SDD v1.3"; v0.4: "Alignment with SDD v1.3.1 §5.3.5"). All revision histories and change tables remain.

## 26. v1.4.2 — decision-request clarifications (identity and numbering preserved)

| DR | Clarification |
|---|---|
| **DR-04** | Now states the **general knowledge approval and governance policy** (ADR-018, C-03): risk-based governance; low-risk, reversible operational processing; approval requirements for authoritative knowledge changes; conflict and uncertainty handling; approval, rejection, deferral, clarification and supersession; governance policy changes needing explicit Product Owner approval. It expressly **does not decide** the promotion of direct user statements, manual submissions or direct vault edits, which is DR-27. The original title is kept as "originally: Approval policy, including direct user input" in the Decision Register. Applied in SDD §18, the readiness assessment and PODR §5.3 |
| **DR-07** | Now states **runtime and process specifics** (ADR-002): .NET version; hosting model; UI framework; background worker technology and details; other runtime-specific choices; database technology is decided with DR-21. It lists as **already approved by PO-D06, not open**: local-first modular monolith; .NET / C# primary language; logically separated background workers in one deployment; independently testable components; non-blocking background learning; no premature microservices or multi-language complexity. The original title is kept as "originally: Language, runtime, process model". DR-07 stays open. The repository assessment no longer calls the language a proposal |
| **DR-27** | Unchanged and independent: promotion of direct user statements, manual submissions and direct vault edits. The four-stage distinction (SDD §4.9a, ADR-018) is intact; no option is selected or recommended. Its row in SDD §18 is identical to v1.4.1. It is referenced consistently in the SDD, readiness assessment, Decision Register, ADR register, CR register, traceability matrix and gap analysis |

No DR was closed. ADR register v0.8 and gap analysis §8.6 (GP-20 to GP-22) record the separation.

## 27. v1.4.2 — cross-document consistency

| Subject | Result |
|---|---|
| PO-D01 to PO-D08 | Unchanged. This pass did not edit the decision records (PODR §4); key approved-direction wording was re-checked |
| DR-04, DR-07, DR-27 | Separate and consistent across SDD §18, readiness, PODR §5.3 and the supporting documents |
| ADR-001, ADR-002 | Approved directions distinguished from unresolved technical choices in the ADR register, SDD §16 and PODR §5.2; both stay open |
| SDD | 1.4.2 is the current draft; revision history preserved |
| SRS v2.0 | Not modified. The file is not in the working tree, so this is by construction (no edit was made), not verified by comparison |
| Implementation readiness | **NOT READY FOR IMPLEMENTATION** in the SDD Appendix F, readiness assessment and PODR |

## 28. v1.4.2 — validation results

Script `check_v142` executed on the saved files: **86 checks executed: 85 passed, 0 failed, 1 not verified.** (Not verified: visual rendering of diagrams. Also not verified by comparison: that SRS v2.0 is unchanged, as above.)

The final results rest on these checks being corrected. **First-run and intermediate failures, by cause:**

| Check | Failure | Cause | Fixed by |
|---|---|---|---|
| 13b current-version references | Flagged SDD v1.0 mentions in the matrix header, readiness Part A and gap-analysis headings | **Checker pattern**: genuine historical baseline references | Checker: treat SDD v0.1 and v1.0 mentions as historical |
| 13b | Gap analysis header named MIN-SDD-001 v1.0 only; crosswalk citation said SDD v1.4 | **Document defects** (stale or ambiguous current reference) | Documents corrected (section 25) |
| 13b | Gap analysis §7 headings and documentation-assessment findings naming v1.1, v1.2 and v1.0 | **Checker pattern**: historical review sections | Checker: gap analysis §7 treated as history |
| 13b | Decision Register: "The corrections are made in SDD v1.4" | **Document wording** (ambiguous tense) | Reworded to "were made in SDD v1.4 (and carry forward unchanged in v1.4.2)"; checker marker added for that sentence |
| G2c no "awaiting confirmation" of language | Matched two rows that describe the former defect ("appeared to await the language") | **Checker pattern** | Checker: exclude rows describing the earlier appearance |
| G3c direct input tied to DR-04 without DR-27 | Matched the traceability row "DR-04, 12, 17, 27" (shorthand) and one readiness history row | **Checker pattern** (shorthand IDs not expanded; history row) | Checker: expand shorthand DR lists; exclude history rows |

**Checker corrections vs document corrections.** Checker corrections: the rows above whose cause is "Checker pattern" (plus the marker for the reworded Decision Register sentence). Document corrections: the stale current references in section 25, the Decision Register wording, the gap-analysis header and crosswalk citation, and the DR-04 and DR-07 clarifications. The prior DR-04 check ("definition unchanged") was **replaced**, because this pass deliberately changes DR-04's description.

## 29. v1.4.2 — diagrams

| Level | Result |
|---|---|
| Syntax | Executed: all 39 Mermaid diagrams parse. The SDD diagrams were not edited in this pass |
| Semantic consistency | Not extended in this pass; the earlier text-level checks and the manual read of four diagrams (section 21) stand |
| **Visual rendering and inspection** | **Not done.** No diagram was rendered or visually inspected. Syntax validity does not establish visual correctness |

## 30. v1.4.2 — readiness and boundaries

- **Readiness: NOT READY FOR IMPLEMENTATION.**
- No implementation, code, schema, connector, job or infrastructure was created; the tree holds `.md` files only. No ADR was approved or closed, no DR closed, no SRS change request approved, SRS v2.0 not modified, the eight Product Owner decisions not changed, Stage One scope not expanded, and CareerOps not introduced. No technical decision on DR-07 or DR-21 was discussed or made.
- **Next step:** the technical decision session on DR-07 and DR-21, with DR-27 taken together with DR-04. This pass did not start it.

## 31. v1.4.2 — final header correction (no version change)

| Item | Detail |
|---|---|
| Defect | SDD line 9 (`Depends on`) cited Product Owner Decision Register MIN-PODR-001 **v0.1**; the current register is **v0.3**. It was missed by the v1.4.2 pass |
| Correction | Line 9 now reads MIN-PODR-001 **v0.3** (PO-D01…PO-D08) |
| Second stale item found in the header | Line 8 (`Scope`) said the learning direction was "unchanged in v1.3 and v1.3.1", which no longer covers the current revision. Now "unchanged from v1.3 through v1.4.2". The meaning is the same: scope did not change |
| Checked and left as is | Version 1.4.2; date; `Supersedes` v1.4.1; the terminology note ("used in v1.0 to v1.3.1"), which is historical; all nine revision-history rows (0.1 to 1.4.2), which are byte-identical to before |
| Versioning | SDD stays **1.4.2**. The change is two metadata references; no content, architecture, decision, ADR, DR, CR or requirement changed. Earlier practice gave each correction pass a patch number; this was judged not to need one because it fixes a reference defect inside the current revision's own header. If the Product Owner prefers a strict patch increment for any SDD text change, it would be 1.4.3 |
| Not changed | SRS v2.0; Product Owner decisions; ADRs; DRs; CRs; readiness |

**Checks executed:** a diff of the SDD before and after (exactly two lines changed); a scan of the header and Document Control for version references; a comparison of the nine revision rows before and after (identical); a search of all ten documents for Decision Register version citations (all current ones say v0.3; the log's v0.1 and v0.2 citations are historical); the full `check_v142` suite (85 passed, 0 failed, 1 not verified: visual rendering); and the Mermaid syntax parse (39 diagrams, 0 errors). No check failed in this pass. Diagrams were not rendered or visually inspected.

**Readiness: NOT READY FOR IMPLEMENTATION.** Nothing was implemented.

# Documentation Assessment

**Assessment ID:** MIN-ASM-DOC-001 | **Version:** 0.7 (draft for Product Owner review) | **Date:** 2026-11-14
**Scope:** Review of the documents actually supplied, **re-scoped to Mindora Stage One — Learning**. Nothing here is approved.

## 0. Stage One scope baseline (Product Owner instruction, rank 1)

The Product Owner corrected the scope: the current work is **Stage One — Learning**. This replaces the earlier assumption (v0.1) that CareerOps integration was a dependency.

**Stage One capabilities (in scope):** knowledge acquisition, source ingestion, extraction, entity and relationship identification, classification, validation, provenance, knowledge persistence, continuous learning, retrieval, session continuity.

**Not Stage One dependencies (future stages):** the CareerOps repository, Chrome Extension, ASP.NET backend, Gemini integration, Google Sheets, Gmail, job discovery, job application tracking, CareerOps workflows.

**Classification used in all assessment documents:**

| Tag | Meaning |
|---|---|
| **S1** | Stage One capability: designed and verified in Stage One |
| **S1-C** | Stage One cross-cutting baseline: only the minimum controls Stage One needs (e.g. secrets rules, audit of knowledge changes, backup of the vault) |
| **FUT** | Future stage: not designed beyond a named extension point; must not shape Stage One components |

**Assumption needing confirmation (DR-02):** "Stage One" is the Product Owner's term. The SRS §17 uses "Stage 1 — Detailed System Design" and its Stage 0 is a CareerOps assessment. I treat Stage One as the learning-centred content of SRS §17 Stages 1–4 (design, knowledge foundation, continuous learning, retrieval), with only baseline governance from Stage 5, and Stage 0 and Stages 6–10 as FUT. Crosswalk is in SDD v1.4.2 Appendix A.

**Confirmed learning direction (added in v0.3).** The Product Owner confirmed that Stage One must learn from documents and files; conversations; AI interactions including AI coding sessions; project work and its evolution; technical environments (software, repositories, APIs, databases, infrastructure, configurations); and new information, observations, ideas, plans, decisions, corrections and outcomes, building a continuously updated connected understanding. This is a rank-1 source. **The SRS 2.0 states parts of this (§2.1–2.3, §5) but not AI-session learning, assertion typing, project intelligence, technical fact classes, relationship provenance, correction-governed learning or connected retrieval.** The resulting change requests are in `SRS-CHANGE-REQUESTS.md` (SRS-CR-08…17). The Product Owner reviewed them and confirmed CR-08…17 as aligned design inputs (register v0.2); their SRS status stays proposed and the SRS was not modified. A revised SRS will be prepared only after explicit approval.

**What changed from v0.1:** the CareerOps repository is no longer requested or a blocker; former findings that depended on it were reclassified (see section 6).


## 1. What was supplied and what was read

| Source | Read? | Notes |
|---|---|---|
| `MINDORA_SRS_2_0.docx` (MIN-SRS-001 v2.0) | Fully (2,194 extracted lines) | Status line reads **"Working Baseline — Architecture and Implementation Validation Pending"**. It is not an *approved* SRS. |
| `Mindora_System_Design_Document_MIN-SDD-001_v1_0.md` / `.docx` | Fully | Same content in both (13 Mermaid blocks, same ADR table). The .docx holds diagrams as Mermaid source text, not rendered images. Two copies exist; only one may become canonical. |
| `Mindora_Engineering_Specification_Package_v0_1.zip` (20 files) | Fully | Includes README, CLAUDE.md, AGENTS.md, manifest, governance, product, requirements baseline, SDD v0.1, engineering, delivery, operations, templates. |
| Existing CareerOps / portfolio repository | **Not required for Stage One** | Out of scope by Product Owner instruction. Not requested. See REPOSITORY-ASSESSMENT.md. |
| `Mindora Persistent Memory Architecture.png`, `Mindora AI Knowledge System Infographic.png` | **Not supplied** | Only second-hand descriptions in the package. Design-input claims cannot be verified against the originals. |
| 13 screen recordings | **Not supplied** | No audio or video analysis was performed. No requirements are attributed to them. |
| Approved Design Input / review record | **Not supplied** | The package also states it was not located. |

## 2. Authority assignment

Using the precedence in the task brief:

| Rank | Source | Assessed standing |
|---|---|---|
| 1 | Product Owner decisions | Recorded: the Stage One scope correction, the confirmed learning direction, and **eight architectural directions PO-D01…PO-D08** (`docs/02-requirements/PRODUCT-OWNER-DECISION-REGISTER.md`). They fix directions only. No approval record for the SDD, any ADR, any DR or any CR exists (SDD v1.0 §20 approval table is blank). |
| 2 | Approved Design Input | Not available. Diagrams are described only second-hand. This still matters for Stage One, because the vault, approval loop and handoff design come from them. |
| 3 | Approved SRS | **Does not exist as approved.** SRS 2.0 is a working baseline. |
| 4 | Approved ADRs | None. All 12 ADRs in SDD §14.2 are Open/Proposed/Deferred. |
| 5 | Working SDD / engineering docs | SDD v1.0, package v0.1, SRS 2.0 (treated here as a working document). |
| 6 | Recommendations | Everything in this assessment set. |

**Consequence:** Every requirement in the traceability matrix is "working", not "approved". Gate 0 (source readiness) in `QUALITY-GATES.md` is not met.

## 3. Key findings

**F-01. The SRS has no requirement identifiers.** `grep` finds only the document ID `MIN-SRS-001`. The FR-/NFR- identifiers in the package's `REQUIREMENTS-BASELINE.md` (FR-KN-001 … NFR-REC-001) were authored by the package, not the SRS. SRS §10.1 itself requires each feature to map to a "Requirement identifier", so the SRS is internally non-compliant. This assessment therefore traces by **SRS section locator** and does not invent IDs. Decision needed: Product Owner to approve an ID scheme (DR-01).

**F-02. SRS contains no measurable acceptance thresholds.** SRS §13 (NFRs) is qualitative only (e.g. "Efficient context retrieval"). §18 acceptance criteria are qualitative. No latency, accuracy, recovery-time, retention-period or cost figures exist anywhere. None are invented here.

**F-03. The SRS and SDD v1.0 disagree on canonical storage.** SRS §3.2 Layer 4, §4.5 and §7.2 describe structured knowledge in a database (SQLite suggested) alongside Markdown, with storage "determined after the existing system audit". SDD §2.1 and §6 and the package make the Markdown vault the single source of truth and treat any database as derived. Both are drafts. See Gap Analysis C-01.

**F-04. (Withdrawn as a conflict.)** v0.1 flagged SRS §3.2 Layer 1 ("Initial interface: existing CareerOps AI Assistant and Chrome Extension") against the SDD's local Obsidian/Claude Code foundation. Under the Stage One scope the Chrome Extension is FUT, so there is no Stage One conflict. The SRS sentence should be amended (SRS-CR-07).

**F-05. The SRS allows an automatic persistence path the SDD forbids.** SRS §5.1 flowchart: "Requires Approval? No, permitted rule → Persist". SDD §2.1 principle 5 and the package say updates are proposed, reviewed and approved before becoming authoritative. A "permitted rule" policy is undefined.

**F-06. Three incompatible phase numberings.** SRS §8 uses six SDLC phases and §2.6 uses "Phases 6–10" for the MVP; the SRS §17 uses Stages 0–10; SDD §17 and the package plan use Phases 0–6. Names and numbers do not align.

**F-07. Two incompatible repository layouts.** SRS §9.5 proposes `docs/00-vision … 13-progress`. The package and the task brief use `docs/00-governance … 07-assessment`. The task brief mandates the latter, but the SRS has not been amended.

**F-08. Package status wording is stale.** The package README and `SOURCE-REGISTER.md` say the SRS source "was not located". It has now been supplied; the package should be updated and re-versioned.

**F-09. SDD v1.0 diagrams have internal defects.** Listed in Gap Analysis section 5.

## 3a. SRS content with no explicit home in SDD v1.0

**Stage One gaps (S1):** learning from user corrections (SRS §5.5, first part), response/intent components of the context engine, entity resolver, relationship manager, version manager, validity period (when-true vs when-recorded), the SRS entity list and named relationships, Business and Operations domains, retention and deletion, source-type parsing scope.

**Moved to FUT (previously listed as gaps):** Gmail integration, job-discovery connectors, recommendation-outcome learning, Automation Orchestrator, CareerOps adapter detail, Chrome Extension changes, Google Sheets sync. Details in the Gap Analysis.

## 4. What this means

The SRS and SDD agree on vision and principles. For Stage One they still differ on storage, approval policy and numbering, and the SDD under-specifies the learning engine itself (extraction, entity resolution, validation, correction handling). The Product Owner must resolve those differences before the SDD can be approved. No repository access is needed for that.

## 5. Corrections required to controlled documents (for Product Owner review, not applied)

| # | Document | Proposed correction | Reason |
|---|---|---|---|
| SRS-CR-01 | MIN-SRS-001 | Add stable requirement IDs for every "shall/should" statement | SRS §10.1 requires traceability |
| SRS-CR-02 | MIN-SRS-001 | Add measurable targets for §13 and §18 | Verification impossible otherwise |
| SRS-CR-03 | MIN-SRS-001 §3.2/§4.5 | Clarify canonical store vs derived index | F-03 |
| SRS-CR-04 | MIN-SRS-001 §5.1 | Define "permitted rule" or remove the no-approval branch | F-05 |
| SRS-CR-05 | MIN-SRS-001 §9.5 | Align repo layout with approved docs structure | F-07 |
| SRS-CR-06 | MIN-SRS-001 §2.6/§8/§17 | Reconcile phase and stage numbering | F-06 |
| PKG-CR-01 | MIN-ENG-PKG-001 | Update SOURCE-REGISTER and README after SRS received | F-08 |
| SRS-CR-07 | MIN-SRS-001 §3.2 L1, §17 Stage 0, §18 (last foundation criterion: "existing CareerOps functionality is preserved or migrated") | Mark as FUT or move to a later-stage acceptance list | Not a Stage One dependency |
| PKG-CR-02 | MIN-ENG-PKG-001 `IMPLEMENTATION-PLAN.md` Phase 0 exit and `REPOSITORY-AUDIT-PLAN.md`; `BASELINE-AND-STATUS.md` | Remove the CareerOps repository audit from the Stage One entry gate; keep it as a FUT activity | Package currently makes it a Phase 0 gate |
| SRS-CR-08…17 | MIN-SRS-001 | See `SRS-CHANGE-REQUESTS.md`: AI interaction learning, project intelligence, technical inspection, entity identity and relationships, learning triggers and recovery, correction-governed configuration, evidence verifiability, connected retrieval, acceptance scenarios, capture modes | Confirmed learning direction not fully in SRS |
| PKG-CR-03 | MIN-ENG-PKG-001 `REQUIREMENTS-BASELINE.md` FR-CO-001…006, the CareerOps constraint in `CLAUDE.md` | Label FR-CO-* as FUT; keep the "do not modify CareerOps" rule as a harmless constraint | Avoid distorting Stage One |

## 6. Findings from v0.1 that were reclassified

| v0.1 finding | Now |
|---|---|
| Repository not supplied (blocker) | Withdrawn: not a Stage One dependency |
| F-04 interface conflict | Withdrawn for Stage One (FUT) |
| Gaps G-01, G-02, G-12, G-13, G-17 (Gmail, jobs, scheduling, extension, migrations) | FUT, or reworded for Stage One (see Gap Analysis) |
| ADR-002/010/012/013/014/015/016 blocked on repository | Re-scoped or deferred (see ADR Register) |

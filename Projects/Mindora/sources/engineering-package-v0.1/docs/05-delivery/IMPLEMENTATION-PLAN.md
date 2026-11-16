# Mindora Implementation Plan — Proposed Sequence

This is a gated plan, not authorization to execute all phases immediately.

## Phase 0 — Engineering baseline and source reconciliation
- Locate and version the approved Design Input and review record.
- Reconcile the complete SRS v2.0.
- Review all reference videos and extract relevant workflow/engineering principles.
- Inspect the current CareerOps repository and deployment.
- Approve this package's baseline and open decisions.

**Exit:** source register complete; repository assessment complete; scope and architecture direction agreed.

## Phase 1 — Obsidian + Markdown + Claude Code foundation
- Confirm vault location and folder structure.
- Create project context, architecture, decisions, handoffs, lessons and workflow templates.
- Establish CLAUDE.md and AGENTS.md.
- Define session startup and handoff routine.
- Connect Claude Code to the project repository and vault using the approved access method.

**Exit:** a fresh Claude session can resume a test project without manual recap, using the approved vault records.

## Phase 2 — Session handoffs and review/approval
- Standardize handoff format.
- Generate proposed session summaries and updates.
- Add human review and approval steps.
- Preserve approved decisions and lessons.
- Test rejected/corrected updates.

**Exit:** session continuity works with controlled persistence.

## Phase 3 — Mindora Memory Tools / MCP
- Define MCP threat model and authorization.
- Define read/search/retrieve/propose-update tools.
- Add audit and validation.
- Test agent access and denied actions.

**Exit:** approved agents can access scoped knowledge through controlled tools.

## Phase 4 — Core knowledge and context intelligence
- Define canonical knowledge schema and entity relationships.
- Add incremental ingestion and provenance.
- Add search and context ranking.
- Evaluate retrieval quality and context/token efficiency.
- Add contradiction, correction and stale-knowledge handling.

**Exit:** measurable context retrieval works across selected knowledge domains.

## Phase 5 — CareerOps operational intelligence
- Audit and reuse existing CareerOps capabilities.
- Add email intelligence (read-only first).
- Add job discovery and opportunity extraction.
- Match messages/opportunities to application records.
- Add human review for ambiguous matching.
- Add controlled tracking automation.

**Exit:** end-to-end CareerOps scenarios pass with auditability and regression coverage.

## Phase 6 — Hardening and expansion
- Security, privacy and access review.
- Backup/restore and recovery testing.
- Performance and reliability testing.
- Monitoring and operational procedures.
- Multi-project and additional source integrations.

## Prioritization rule

Prove session continuity and governed knowledge updates before building broad automation. Add complexity only when the prior phase has measurable acceptance evidence.

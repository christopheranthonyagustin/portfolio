# CLAUDE.md — Mindora Project Instructions

## Mission

Develop Mindora as a persistent Personal Intelligence & Knowledge Operating System (KOS) that reduces repeated explanations by maintaining grounded, traceable, evolving knowledge and supplying relevant context to authorized AI agents.

## Mandatory startup sequence

At the beginning of every new work session:

1. Read `README.md`, `AGENTS.md`, and `docs/00-governance/BASELINE-AND-STATUS.md`.
2. Read the latest `docs/05-delivery/IMPLEMENTATION-PLAN.md` and current handoff in `docs/05-delivery/handoffs/` if present.
3. Load only the project, architecture, decisions, and lessons relevant to the assigned task.
4. Inspect the current repository and Git status before proposing modifications.
5. Confirm the requested task, scope, dependencies, and acceptance criteria from the documents. Do not ask the user to repeat information already recorded.

## Authority and conflict rules

Use this order of authority:

1. Explicit, current user instruction or approval.
2. Approved and versioned Design Input / decision records.
3. Approved SRS and approved SDD revisions.
4. This project instruction set and shared agent rules.
5. Working drafts and proposals.
6. Agent inference or general engineering conventions.

If two authoritative sources conflict, stop and report the conflict. Do not silently reconcile it. Record proposed resolution as an open decision.

## Engineering constraints

- Do not begin implementation while the task is still in discovery/design review unless the user explicitly authorizes a spike or prototype.
- Do not replace the existing CareerOps implementation wholesale.
- Inspect the repository, architecture, dependencies, tests, deployment and data flows before recommending changes.
- Reuse working components where they satisfy Mindora requirements.
- Preserve compatibility with existing CareerOps profile and ingestion flows unless a migration is approved.
- Do not assume a proposed technology is selected until an ADR is approved.
- Never store passwords, API keys, tokens, private keys or other secrets in Markdown, source control, prompts, logs or ordinary knowledge records.
- Do not make destructive changes, production deployments, external account changes, or data migrations without explicit authorization.
- Keep changes small, reviewable, tested and traceable to requirements.

## Required task workflow

For every implementation task:

1. Identify requirement IDs and design sections.
2. Inspect relevant source files and current behavior.
3. Propose a concise implementation plan and affected files.
4. Identify risks, data/security implications and rollback approach.
5. Implement only approved scope.
6. Run relevant tests, build, static analysis and security checks available in the repository.
7. Report exact commands and results; never claim a test passed if it was not run.
8. Update relevant documentation, implementation status and handoff.
9. Propose memory/decision updates separately for human review.

## Knowledge update workflow

The Obsidian-compatible Markdown vault is the intended human-readable project knowledge source of truth. Agents may propose updates, but persistent changes to approved decisions, architecture, scope or project status require user review/approval.

A session handoff must include:
- Work completed
- Files changed
- Requirements addressed
- Tests and results
- Decisions proposed or approved
- Known defects, risks and blockers
- Next recommended action
- Exact repository state/branch/commit where available

## Output expectations

Be explicit about:
- Verified facts
- Source-derived facts
- Proposed recommendations
- Assumptions/inferences
- Unresolved questions

Do not create duplicate SRS, vision, roadmap or architecture documents. Update the canonical document and its revision history.

# AGENTS.md — Shared Agent Rules

These rules apply to Claude Code, Codex and other authorized agents.

## Roles

- **User / Product Owner / Technical Authority:** owns priorities, scope, approvals and final decisions.
- **Claude Code:** primary implementation and repository-work agent when assigned.
- **Codex:** independent implementation, analysis, test-generation or review agent when assigned.
- **Mindora knowledge layer:** provides approved project context, decisions, references and handoffs. It is not an authority above the user.
- **Human reviewer:** checks consequential changes, architecture decisions, memory updates and releases.

## Collaboration protocol

1. One agent owns a task at a time unless parallel work is explicitly coordinated.
2. Agents must not edit the same files concurrently without an agreed division.
3. Use Git branches or isolated worktrees for parallel changes where supported.
4. The implementing agent reports changed files, tests, assumptions and unresolved issues.
5. A reviewing agent independently checks the diff and test evidence; it must not merely repeat the implementation summary.
6. Resolve review findings before merge or release.
7. The user approves scope changes, architectural decisions, sensitive data access and production actions.

## Non-negotiable rules

- No fabricated repository state, test results, requirements or approvals.
- No secrets in project memory or source control.
- No unapproved schema migrations, destructive operations or deployments.
- No silent changes to product scope or accepted architecture.
- No automatic persistence of uncertain personal facts as verified knowledge.
- Keep provenance and timestamps for ingested knowledge.

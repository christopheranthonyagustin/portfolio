# Engineering Quality Gates

## Gate 0 — Source readiness
- Correct source versions identified.
- Design Input and SRS references traceable.
- Repository and environment inspected.
- No unresolved source conflict hidden.

## Gate 1 — Design readiness
- Requirements linked to components.
- Data flows and trust boundaries documented.
- ADRs approved for material choices.
- Risks and failure modes considered.
- Verification approach defined.

## Gate 2 — Task readiness
- Definition of Ready satisfied.
- Dependencies identified.
- Acceptance criteria measurable.
- Task sized for a reviewable increment.

## Gate 3 — Implementation quality
- Coding conventions followed.
- No secrets committed.
- Error handling and logging appropriate.
- Changes limited to approved scope.
- Tests added/updated.

## Gate 4 — Verification and review
- Build succeeds.
- Relevant tests pass.
- Static analysis/security checks run where available.
- Independent review findings resolved.
- Requirement traceability updated.

## Gate 5 — Release readiness
- Release notes and version identified.
- Migration/rollback plan reviewed.
- Backup and restore implications assessed.
- Deployment authorized.
- Post-deployment validation defined.

## Gate 6 — Knowledge continuity
- Implementation status updated.
- Decisions and lessons proposed.
- Handoff prepared.
- User approval obtained for authoritative memory changes.

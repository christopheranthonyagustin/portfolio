# Existing Repository Audit Plan

## Objective

Determine what should be reused, extended, modularized or replaced before implementation.

## Required inspection

1. Repository tree, solution/project files and Git history.
2. Frontend extension structure, UI flows and permissions.
3. Backend API, service boundaries, dependency injection and configuration.
4. Persistence, data model, migrations and file storage.
5. Profile/portfolio ingestion and file filtering.
6. Gemini provider integration and AI prompt orchestration.
7. Deterministic profile resolver and AI fallback.
8. Google Sheets integration and CareerOps tracker synchronization.
9. Authentication, authorization, secrets and privacy controls.
10. Logging, telemetry, error handling and retries.
11. Automated tests, build pipeline and deployment workflow.
12. Cloud Run configuration, environment variables and operational costs.

## Required audit report

For each subsystem record:
- Current behavior
- Relevant files and entry points
- Dependencies and external services
- Data inputs/outputs
- Test coverage and observed gaps
- Security/privacy risks
- Operational risks
- Reuse recommendation: keep / extend / refactor / replace / retire
- Evidence supporting recommendation

## Prohibited conclusions

Do not recommend a rewrite based only on age, style preference or a proposed architecture diagram. Do not infer that a feature is absent until the repository has been searched.

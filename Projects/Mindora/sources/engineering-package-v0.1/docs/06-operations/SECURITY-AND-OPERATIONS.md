# Security and Operations — Design Checklist

This document is a checklist for detailed design, not a claim that controls are already implemented.

## Identity and access
- Define user identity and authentication.
- Define agent identity and tool permissions.
- Default to least privilege and read-only access.
- Require explicit approval for writes to external systems and production environments.

## Secrets
- Use environment variables or a secret manager appropriate to the deployment.
- Exclude secret files from Git and the Obsidian vault.
- Rotate exposed credentials.
- Redact secrets from logs and agent outputs.

## Data protection
- Classify personal, confidential and public information.
- Define local/cloud data boundaries.
- Encrypt data in transit and at rest where supported.
- Define backup, restore, retention and deletion.
- Ensure exports remain portable and controlled.

## Reliability
- Use idempotency for retried ingestion/integration jobs.
- Track job state and failure reason.
- Implement bounded retries and dead-letter/manual-review paths where appropriate.
- Monitor provider quotas and failures.
- Validate backups through restore tests.

## Operational readiness
- Environment inventory and configuration ownership.
- Deployment and rollback procedures.
- Logging, metrics and alerting.
- Incident and recovery procedures.
- Dependency and vulnerability updates.
- Release checklist and change log.

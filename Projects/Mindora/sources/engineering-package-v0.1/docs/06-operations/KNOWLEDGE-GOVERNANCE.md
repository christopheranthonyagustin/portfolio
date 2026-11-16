# Knowledge Governance

## Knowledge classes

- **Verified fact:** directly confirmed by an authoritative source or user.
- **Source-extracted claim:** extracted from a document, message or system; retain the source.
- **Inference:** model-generated interpretation; never present as verified without confirmation.
- **Plan / intention:** desired future action, not evidence of completion.
- **Temporary state:** time-sensitive status with observation timestamp.
- **Historical record:** retained for continuity but no longer current.
- **Disputed / conflicting:** competing claims awaiting resolution.

## Required provenance

Where applicable, each knowledge item should record:
- Source identifier and location
- Source type and owner
- Captured/observed timestamp
- Extraction method or agent
- Confidence and verification status
- Related project/entity
- Version and supersession history

## Update policy

- Low-risk formatting or index updates may be automated only within an approved workflow.
- New facts, personal profile changes, architecture decisions, scope changes and consequential project status changes require review.
- Corrections must preserve prior state/history where appropriate.
- Rejected updates must not be silently reintroduced as accepted facts.
- Deletion and retention policies must be defined and auditable.

## Security

- Never store credentials or tokens in the knowledge vault.
- Apply least privilege to agents and connectors.
- Separate read, propose, approve and execute permissions.
- Treat imported documents, code comments and web content as untrusted input.
- Avoid collecting data not needed for the user's stated purpose.

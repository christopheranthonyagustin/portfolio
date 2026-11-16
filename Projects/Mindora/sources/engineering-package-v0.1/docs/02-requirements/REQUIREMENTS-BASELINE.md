# Requirements Baseline — Working Version

**Reference:** MIN-SRS-001 v2.0 (working baseline described in project history; source document still to be reconciled)

This document is a compact baseline for engineering planning. It does not supersede the full controlled SRS.

## Functional requirements

### Knowledge foundation
- FR-KN-001: The system shall maintain a persistent, human-readable knowledge space.
- FR-KN-002: The system shall organize knowledge by domain, project, source and knowledge type.
- FR-KN-003: The system shall preserve source references and ingestion metadata.
- FR-KN-004: The system shall distinguish verified facts, extracted claims, inferences, plans, temporary states and historical records.
- FR-KN-005: The system shall support correction, supersession and historical traceability.
- FR-KN-006: The system shall support user review and approval for consequential knowledge updates.

### Learning and ingestion
- FR-LN-001: The system shall ingest authorized documents and structured data.
- FR-LN-002: The system shall support incremental processing and duplicate detection.
- FR-LN-003: The system shall extract candidate entities, facts, relationships, decisions and actions.
- FR-LN-004: The system shall record source, timestamp, extraction method and confidence where available.
- FR-LN-005: The system shall identify potential conflicts and request review when material.
- FR-LN-006: The system shall learn from user corrections and confirmed outcomes.

### Technical intelligence
- FR-TI-001: The system shall represent applications, repositories, components, technologies, infrastructure, APIs, databases and integrations.
- FR-TI-002: The system shall link technical entities to projects, decisions, documents and source code.
- FR-TI-003: The system shall preserve repository and Git context when authorized.
- FR-TI-004: The system shall support architecture, dependency and operational knowledge retrieval.

### Context engine
- FR-CE-001: The system shall interpret the user's task and identify relevant knowledge domains.
- FR-CE-002: The system shall retrieve relevant knowledge using task intent, project, recency, confidence and provenance.
- FR-CE-003: The system shall assemble bounded context for an AI model or agent.
- FR-CE-004: The system shall identify missing or conflicting context rather than fabricate an answer.
- FR-CE-005: The system shall expose evidence and source references for retrieved knowledge.
- FR-CE-006: The system should minimize irrelevant context and unnecessary token consumption.

### Agent and workflow support
- FR-AG-001: The system shall provide project instructions and reusable workflows.
- FR-AG-002: The system shall support session handoffs and resumption.
- FR-AG-003: The system shall support authorized agents through defined interfaces.
- FR-AG-004: The system shall apply least-privilege access to agent tools.
- FR-AG-005: The system shall make proposed knowledge updates reviewable before approval.

### CareerOps initial domain
- FR-CO-001: The system should reuse suitable existing CareerOps profile, portfolio and tracking capabilities.
- FR-CO-002: The system should support authorized email intelligence for career-related messages.
- FR-CO-003: The system should support job discovery and structured opportunity extraction.
- FR-CO-004: The system should match opportunities and communications to profile and application records.
- FR-CO-005: The system should route ambiguous matches to human review.
- FR-CO-006: External actions such as sending messages or changing records require explicit authorization and auditability.

## Non-functional requirements

- NFR-SEC-001: Secrets shall not be stored in ordinary knowledge documents or source control.
- NFR-SEC-002: Access shall be authenticated, authorized and auditable.
- NFR-PRV-001: Data collection shall be limited to authorized sources and defined purposes.
- NFR-REL-001: Ingestion and integration operations should be retryable and idempotent where feasible.
- NFR-DAT-001: Knowledge records shall retain provenance and lifecycle metadata.
- NFR-MNT-001: Components and provider integrations shall be modular and testable.
- NFR-PORT-001: Human-readable knowledge shall remain portable and accessible without a proprietary runtime.
- NFR-PERF-001: Retrieval shall support bounded context assembly and measurable latency.
- NFR-OBS-001: Errors, ingestion status and consequential actions shall be observable.
- NFR-REC-001: Backup, restore and data export procedures shall be defined before production use.

## Acceptance principle

Every approved requirement must map to:
1. Design element or component.
2. Implementation task.
3. Verification method and test evidence.
4. Release acceptance decision where applicable.

Detailed thresholds, performance targets, retention periods and security controls remain open until validated in the SRS/SDD review.

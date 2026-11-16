# Traceability and Decision Register

## Traceability matrix

| ID | Design / requirement statement | Source | Current classification | SDD destination | Verification evidence |
|---|---|---|---|---|---|
| DI-001 | Obsidian vault is the human-readable project source of truth | Persistent Memory Architecture diagram | Confirmed design input | 4, 8 | Vault structure and agent read/write workflow review |
| DI-002 | Markdown is durable, portable and versionable memory | Persistent Memory Architecture diagram | Confirmed design input | 4, 8 | Files remain readable without a proprietary database |
| DI-003 | Project context, architecture/ADRs, decisions, handoffs, lessons are organized knowledge areas | Persistent Memory Architecture diagram | Confirmed design input | 5, 8 | Required folder/templates exist |
| DI-004 | Claude Code reads project instructions and relevant memory at session start | Persistent Memory Architecture diagram | Confirmed design input | 6, 9 | Fresh-session continuation test |
| DI-005 | Existing repository and Git history provide engineering context | Persistent Memory Architecture diagram | Confirmed design input | 6, 9 | Agent can inspect repository state and history |
| DI-006 | Agent proposes session summaries and memory updates | Persistent Memory Architecture diagram | Confirmed design input | 7, 9 | Proposed update generated in reviewable form |
| DI-007 | User reviews and approves persistent memory updates | Persistent Memory Architecture diagram | Confirmed design input | 7, 10 | Unapproved changes are not persisted as approved facts |
| DI-008 | Fresh session resumes from relevant context without manual recap | Both Mindora diagrams | Confirmed product intent | 6, 9, 11 | Cross-session continuity scenario |
| DI-009 | Mindora Core includes Memory Engine, Context Router, Workflows & Skills, Handoff Manager | AI Knowledge System infographic | Confirmed conceptual model | 5, 6, 7 | Component responsibilities documented |
| DI-010 | Mindora Memory Tools / MCP are a later phase | Persistent Memory Architecture diagram | Confirmed sequencing | 11 | Phase boundary documented |
| REQ-001 | Personal and project knowledge must be persistent and traceable | Product baseline | Confirmed direction; detailed criteria open | 5, 7 | Knowledge lifecycle tests |
| REQ-002 | Technical knowledge must include repositories, code, infrastructure, APIs, data and AI workflows | Product baseline | Confirmed direction | 5, 6 | Domain coverage tests |
| REQ-003 | Context retrieval should select relevant knowledge for a task | Product baseline | Confirmed direction; ranking design open | 6 | Retrieval relevance evaluation |
| REQ-004 | Knowledge must distinguish verified facts, inferences, plans and stale information | Product baseline | Confirmed direction | 7 | Classification and correction tests |
| REQ-005 | User controls consequential memory changes and access | Product baseline + diagram approval loop | Confirmed direction | 7, 10 | Authorization and approval tests |
| REQ-006 | CareerOps functions should be reused where suitable | Existing-system baseline | Proposed constraint pending repository audit | 3, 8 | Code audit and regression tests |

## Open architecture decisions

| ADR | Decision | Options / validation needed | Status |
|---|---|---|---|
| ADR-001 | Canonical knowledge storage | Obsidian/Markdown vault as source of truth; determine whether structured index/database is needed as derived projection | Proposed direction |
| ADR-002 | Runtime and service boundaries | Audit current ASP.NET Core API, extension and deployment before deciding whether to extend or split services | Open |
| ADR-003 | Search and retrieval | Filesystem search, full-text index, metadata index, embeddings/hybrid retrieval; benchmark against real corpus | Open |
| ADR-004 | MCP interface | Select or build Mindora MCP server; define read/write tools and authorization boundary | Deferred design |
| ADR-005 | AI provider abstraction | Preserve Gemini integration while evaluating provider-neutral adapter and model routing | Open |
| ADR-006 | Knowledge schema | Define entities, relationships, provenance, confidence, lifecycle and versioning | Open |
| ADR-007 | Local vs cloud execution | Decide which data and operations remain local vs cloud; threat-model privacy and availability | Open |
| ADR-008 | Ingestion strategy | Incremental ingestion, hashing, file filters, deduplication, OCR/transcription and connectors | Open |
| ADR-009 | Identity and access | Define user identity, agent authorization, least privilege and audit | Open |
| ADR-010 | Deployment and operations | Validate current Cloud Run architecture and target environments | Open |

## Decision rule

No option in this table becomes an approved architecture decision until the user explicitly approves an ADR.

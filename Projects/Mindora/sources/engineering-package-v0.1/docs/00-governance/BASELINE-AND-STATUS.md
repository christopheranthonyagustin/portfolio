# Baseline and Document Status

## Current project state

Mindora is a new project direction connected to, but not identical with, the existing CareerOps system. The immediate goal is to establish a durable engineering knowledge and continuity workflow, then evolve toward a broader personal KOS.

## Confirmed source-derived design elements

From the available Mindora architecture diagrams:

- Obsidian vault is labelled the **source of truth**.
- Markdown is the durable, human-readable and versionable memory format.
- Project knowledge includes project context, architecture and ADRs, decisions, handoffs and next steps, lessons and corrections.
- Claude Code uses project instructions such as `CLAUDE.md` and `AGENTS.md`.
- Existing code repository and Git history are inputs to engineering work.
- A development session loads relevant memory, implements and tests, proposes updates, obtains human approval, and persists approved updates.
- Mindora Memory Tools / MCP are represented as a later phase, not a prerequisite for the initial manual workflow.
- The broader infographic depicts Mindora Core concepts: Memory Engine, Context Router, Workflows & Skills, Handoff Manager, and an Obsidian knowledge space.

## Existing CareerOps baseline (from prior project context; verify against repository)

- Chrome Extension frontend.
- ASP.NET Core / C# backend deployed to Google Cloud Run.
- Gemini provider integration.
- Existing CV/portfolio ingestion and structured `profile.json`.
- Existing deterministic profile question resolver with AI fallback.
- Google Sheets used as a career/application tracker.
- Existing portfolio folder selection and recursive ingestion.

These are baseline facts to verify in code, not permission to preserve every implementation detail unchanged.

## Source availability and limitations

| Source | Current status | Use |
|---|---|---|
| Mindora Persistent Memory Architecture infographic | Located and inspected via extracted visual description | Design input |
| Mindora AI Knowledge System infographic | Located and inspected via extracted visual description | Design input |
| 13 uploaded Facebook screen recordings | Files located; sampled visually | Reference material; full audio transcription remains outstanding |
| SRS v2.0 (MIN-SRS-001) | Described in prior project context; source file not located as a readable document | Working requirements baseline only |
| Approved Mindora Design Input and formal review/sign-off record | Not located as a separate readable controlled document | Must be reconciled before SDD approval |
| Existing CareerOps source repository | Not attached/inspected in this package preparation | Repository audit required |

## Status labels

- **Confirmed:** directly represented in available source or explicitly established project context.
- **Proposed:** recommended design direction, not yet approved.
- **Open:** requires user decision, source inspection or technical validation.
- **Deferred:** intentionally outside the current foundation phase.

## Current gate

This package may be used for repository discovery, source reconciliation and preparation of the detailed SDD. It is **not authorization to implement the complete Mindora product**.

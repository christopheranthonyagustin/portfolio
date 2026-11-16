# Milestone 1 Implementation Notes: Knowledge Foundation

**Authority:** MIN-PODR-M1-001 v0.1; MIN-AUTH-M1-001 v0.1 (2026-11-16). **Status:** working notes, updated per increment. Not a controlled baseline document.
**Last updated:** 2026-11-16, after increment 0 (TFM-independent foundation).

## 1. First execution checkpoint

### 1.1 Actual repository structure
- **No code repository existed.** The only repository material found was the documentation tree (`docs/02-requirements`, `docs/03-design`, `docs/07-assessment`) and the handover ZIP. There was no `.git`, solution, project or `global.json` anywhere.
- I therefore created a **new working repository** (`mindora`, git, `main`). It is **separate from the documentation tree**. If a real Mindora repository exists elsewhere, tell me its location and the contents will be moved there.
- The documentation tree was **not modified**. `MINDORA-COMPLETE-DOCUMENTATION-BASELINE.zip` was used only as reading material, not as the repository.
- Git does not work on the mounted output volume (a "dubious ownership" error on that file system), so work was done on local disk and delivered as a folder copy plus a git bundle. One empty folder `outputs/mindora/` with an unremovable `.git` stub was left behind by that failed first attempt; it is harmless and can be deleted.

### 1.2 .NET SDK and runtime availability
- **No .NET SDK or runtime is installed** in this environment (`dotnet` not found).
- Obtainable from the Ubuntu package archive (not installed, because installing one would imply a version choice): **`dotnet-sdk-10.0` 10.0.115** and `dotnet-sdk-8.0` 8.0.134. (.NET 8 is out of support since 2026-11-10 per the official policy page; see MIN-DP-007 v0.3 §5.) Microsoft's own download hosts are not reachable from here.
- SQLite is available as the library inside Python (3.45.1); the `sqlite3` command-line tool is not installed.

### 1.3 Tasks that can proceed immediately (and were done)
SQL schema and controlled migration; verification of SQLite's transaction and concurrency behaviour against the conditional-commit operations; synthetic fixtures; deterministic-provider scenario data; the persistence contract; the acceptance mapping.

### 1.4 Tasks blocked, and by exactly what

| Blocked task | Blocking decision |
|---|---|
| Create the .NET/C# solution and projects; persistence abstraction; migration runner; stand-in provider implementation; vault-boundary code; every C# automated test; any build or test command | **The .NET target framework (DR-07 D07-A).** MIN-AUTH-M1-001 section 3: "Specific target framework: requires a separate decision; not approved by this record" |
| Any persistent Knowledge Vault write; final record format | Vault location and the write format (open); the canonical-write authorization mechanism must be designed **and tested** first |
| Any host or UI code | An approved runtime decision (not needed for M1 scope; no host or UI is planned in M1) |

**The one decision that unblocks all C# work:** *approve the .NET target framework for Milestone 1.* The documented recommendation is `net10.0` (.NET 10 LTS, supported to 2028-11-14; MIN-DP-007 v0.3 D07-A, which is itself unapproved). Alternatives: `net11.0` (STS, same end-of-support date, released 2026-11-10); `net8.0` and `net9.0` are out of support. I have **not** selected one, and I will install the matching SDK only after the decision.

### 1.5 Interpretation I need confirmed
The authorization allows implementing the "Knowledge Vault write-boundary foundation" and requires tests for "protection against unauthorized canonical writes", yet forbids persistent Vault writes before the location is agreed. My plan: write-boundary tests will use a **throwaway temporary directory created and deleted per test run**, never a real vault. Please confirm that this is acceptable. If not, the boundary will be implemented against an in-memory file abstraction only.

### 1.6 Smallest first coding increment (once the target framework is approved)
Increment 1: the solution skeleton, the SQLite connection factory that enforces the connection rules (`db/README.md`), the migration runner, and their tests (apply, idempotent re-run, checksum refusal, atomic rollback). Then, in order: job store (claim, conditional commit, recovery, fencing); evidence and candidate repositories with idempotency; provider abstraction and stand-in; vault boundary and approved-change application; the completion report.

## 2. What was done in increment 0

| Artifact | Purpose |
|---|---|
| `db/migrations/0001_foundation.sql` | 15 tables and 8 guard triggers: sources, evidence, jobs, executions, per-item checkpoints, item ledger, provider calls, candidates, human approvals, approved changes, audit |
| `tests/fixtures/` | 3 synthetic sources and 9 deterministic provider scenarios (success, duplicate claims, three kinds of invalid output, empty output, transient and permanent failure) |
| `verification/sqlite-spike/run_spike.py` | 54 checks on SQLite behaviour and the schema |
| `db/README.md` | The persistence contract the C# layer must reproduce |
| `docs/implementation/` | These notes, the acceptance matrix |

## 3. Verification results (actual)

`python3 verification/sqlite-spike/run_spike.py` on SQLite 3.45.1, Python 3.12.3, Linux, 1 CPU. Final state: **54 passed, 0 failed**, and the same result on three consecutive runs.

What it demonstrated:
- **Migrations:** applied once, idempotent, edited migrations refused by checksum, a failing migration leaves no partial schema (E0).
- **Claim exclusivity:** 120 jobs attempted simultaneously by 6 processes were each claimed exactly once, with claims spread across all 6 workers (E2).
- **The check-then-act race is real:** an early token check did **not** stop a stale worker from publishing after the lease moved (E3.1 reproduces the hazard). A **conditional commit inside the transaction** rejected the stale worker, left none of its rows, preserved the current claim, and attributed the current worker's results to its own token (E3.2 to E3.6).
- **Crash safety:** a process killed mid-transaction left no partial rows; a commit before the kill was durable; orphaned claims were found by recovery; the job was re-claimed with a higher token and completed (E4).
- **Locking:** a deferred transaction that later writes fails after another writer commits; `BEGIN IMMEDIATE` with a busy timeout waits and succeeds; a timeout of zero fails at once (E5).
- **Idempotency under concurrency:** 6 processes inserting the same 20 keys stored each exactly once (E6).
- **Guards:** illegal job transitions, a decreasing claim token, approval by a non-human, approval-less approved changes, hosted provider calls, unknown statuses, bad foreign keys, edits to the audit log are all refused (E7). Without `PRAGMA foreign_keys=ON` the bad foreign key is accepted, so the pragma is mandatory per connection.
- **Fixtures:** an independent validator agrees with every scenario's expected result (E9).

**First-run defects found and fixed (in the spike, not in the schema):**
1. **E3.3** failed because my expectation was wrong: recovery had already closed the stale execution as `interrupted`, so it cannot be relabelled `fenced`. The design now records a rejected attempt as an **audit event** `commit_fenced`.
2. **E2 and E6 had almost no real contention** (one process won everything). I noticed this from the per-worker distribution, added contention checks that failed, and rewrote the workers to attempt each job together behind a barrier. The contention checks now pass.

## 4. Decisions made inside the authorization (for review)

| # | Decision | Why |
|---|---|---|
| D1 | Timestamps stored as fixed-width ISO-8601 UTC text | Lexical order equals time order; portable |
| D2 | No SQLite `STRICT` tables | Avoid depending on the SQLite version bundled by the future .NET provider (STRICT needs 3.37 or later); CHECK constraints cover values |
| D3 | `job.state` uses the SDD run-state tokens exactly; a claim is `(claim_owner, lease_expires_at, claim_token)`, not a state | No new state vocabulary; SDD 10.2a respected |
| D4 | Added transition `checkpointed -> interrupted` | A crash between items must be detectable. **SDD 3.8a omits it** (recorded as a gap for later reconciliation) |
| D5 | `failed` is terminal; a new run is a new job row | Matches SDD 3.8a ("new run, same inputs") |
| D6 | `approval.actor_kind` is constrained to `human`; approved changes and candidate approval require a human approval record by trigger | PO-D02: no AI component approves or writes canonical knowledge |
| D7 | `provider_call.provider_kind` constrained to `local` | M1-D02: no hosted calls, enforced at the data layer; relaxing needs a deliberate migration |
| D8 | No `confidence` column; `candidate_kind` and `payload_json` are opaque | Confidence semantics, entity vocabulary and extraction schema are open decisions |
| D9 | `job_item` and `item_ledger` carry the SDD 6.3 idempotency key parts | Idempotency and duplicate-processing tests |
| D10 | Recovery treats a claim owned by another host instance as interrupted even if its lease has not expired | A restarted host must not wait out a dead host's lease |
| D11 | Rejected (fenced) commits are audited | Visibility without letting a stale worker change job state |
| D12 | The job model follows MIN-DP-007 v0.3 §8.3 (durable records as source of truth, conditional commit, lease, startup recovery) | M1 scope and engineering controls require durable jobs, recovery and fencing. **That paper is itself unapproved**; this is a flagged basis, not an approval of it |
| D13 | The `approved_change` table is a foundation only; it records the authorization and writes nothing to a vault | The write mechanism needs the vault decisions and must be designed and tested first |

## 5. Deviations and flags

- **No deviation from MIN-PODR-M1-001 or MIN-AUTH-M1-001.**
- **Flag:** Python appears in the repository as **verification evidence only**. It is not product code and is not shipped (PO-D06 concerns the product). It exists because the condition on M1-D01 could be verified before a C# toolchain was permitted.
- **Flag:** the work is in a new repository, not an existing one (section 1.1).
- **Not done, by instruction:** no hosted provider, no real documents, no CareerOps, no controlled-document edits, no ADR, DR or CR approved or closed, no target framework selected.

## 6. Known limitations

- **No C# exists and nothing in M1 acceptance is met.** The spike is not an acceptance test (see the matrix).
- **Linux only.** The product's default platform is Windows 11 (MIN-DP-007 v0.3). SQLite file locking, process-kill behaviour and WAL on Windows were **not** tested; the C# tests must run on Windows too.
- **SQLite version:** 3.45.1 here; the version bundled by the .NET SQLite provider is unknown and must be re-verified.
- **Process-kill crashes only.** Power-loss durability (`synchronous=FULL`) was not tested.
- **One CPU.** Contention was real but small; heavier parallelism was not measured.
- **The migration runner and job operations verified here are Python reference implementations**; the C# versions must be tested separately.

## 7. Next concrete step

Product Owner: approve the .NET target framework for Milestone 1 (and confirm section 1.5). Then install the matching SDK and implement increment 1 with its tests.

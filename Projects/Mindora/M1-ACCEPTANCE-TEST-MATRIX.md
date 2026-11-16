# Milestone 1 Acceptance Test Matrix

**Source:** MIN-AUTH-M1-001 section 6. **Important:** acceptance requires **demonstrated automated tests in the product**. The SQL-level evidence below is preliminary and **does not count as acceptance**. No C# test exists yet.

| # | Required demonstration | Planned automated test (C#, once the target framework is approved) | Evidence so far (SQL level, throwaway) | Status |
|---|---|---|---|---|
| 1 | Database initialization and migration | Runner applies 0001 to an empty file, is idempotent, refuses an edited migration, rolls back a failing one | E0.1 to E0.5, E1.1 to E1.3 | Evidence only; C# test pending |
| 2 | Evidence and candidate persistence | Repositories persist evidence with unique fingerprint and candidates linked to evidence; deterministic candidate identity | Rows exercised inside E3, E4, E8; schema constraints E7 | Schema exists; repository tests pending |
| 3 | Transactional state changes | Each state change atomic; failure leaves prior state; illegal transitions refused | E3.5, E4.1, E4.3, E7.1, E8.1 | Evidence only; pending |
| 4 | Idempotent processing | Re-running a completed item and duplicate dispatch create nothing new; duplicate-claim fixture collapses to 2 candidates | E2, E3.6, E6.1, E6.2; fixture `duplicate_claims_brief` validated in E9 | Evidence only; pending |
| 5 | Interrupted-job detection and recovery | Kill-and-restart simulation; interrupted job re-claimed and completed; no duplicates | E4.4 to E4.8 | Evidence only; pending |
| 6 | Deterministic provider behaviour | Same input always yields the same scenario result; all 9 scenarios reproducible | E9.1 (the fixtures are consistent with an independent validator) | Contract data only; implementation pending |
| 7 | Invalid provider output handling | Missing span, out-of-range span, malformed JSON, empty output, transient and permanent failures handled per scenario `expected`; no candidate persisted for invalid output; run paused or item failed as specified | E9.1 (expected outcomes); job effect untested | Contract data only; pending |
| 8 | Stale-worker fencing | Stale commit rejected inside the transaction; no rows persisted; audit event recorded; current claim intact | E3.1 to E3.6 | Evidence only; pending |
| 9 | Protection against unauthorized canonical writes | No candidate approval or approved change without a human approval; the vault boundary refuses any write without an applicable approved change; no AI component can approve | E7.3 to E7.5, E7.10 to E7.12 (record level only) | **Partial:** record-level guards verified; vault boundary code and tests pending |
| 10 | Reproducible synthetic test execution | Fixtures are static; full suite repeatable | Spike run three times consecutively, 54 of 54 each time | Evidence only; C# harness pending |

**Not claimed:** production AI extraction, real-document extraction, review UI, retrieval, or any user-facing end-to-end learning capability (MIN-AUTH-M1-001 section 6).

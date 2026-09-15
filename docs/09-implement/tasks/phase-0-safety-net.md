# Phase 0 — Safety Net & Decisions

Foundation work and decisions required before/alongside the security fixes.

**Plan references:** [`security-plan.md`](../../08-refactoring/security-plan.md), [`performance-plan.md`](../../08-refactoring/performance-plan.md), [`backend/02-migration-plan.md`](../../08-refactoring/backend/02-migration-plan.md)
**Decisions:** [`../decisions.md`](../decisions.md)

| ID | Task | Plan ref | Status | Notes |
|---|---|---|---|---|
| PH0-01 | Resolve decisions D-01…D-09 | [`decisions.md`](../decisions.md) | 🟡 | D-02/03/04/05/07 resolved; D-01/06/08/09 open |
| PH0-02 | Add `.env.example` and document variables | P0-14 | ✅ | `backend/.env.example` |
| PH0-03 | Add structured logger + request-id middleware | P2-8 | 🟡 | logger added; request-id middleware pending |
| PH0-04 | Log 5xx in `errorHandler` | P2-8 | ✅ | logs status/method/path/stack |
| PH0-05 | Establish performance baseline with seed data | perf §2 | ⬜ | See [`performance-baseline.md`](./performance-baseline.md) |
| PH0-06 | Back up database before any schema change | db §8 | ⬜ | |

# Phase 3 — P2 Maintainability

Maintainability improvements.

**Plan references:** [`backend-plan.md`](../../08-refactoring/backend-plan.md) §3, [`api-refactor-plan.md`](../../08-refactoring/api-refactor-plan.md) §3.5, [`performance-plan.md`](../../08-refactoring/performance-plan.md), [`frontend-audit.md`](../../08-refactoring/frontend-audit.md)

| ID | Task | Plan ref | Status | Notes |
|---|---|---|---|---|
| P2-01 | Centralize ownership assertion helper | backend §3 | ⬜ | |
| P2-02 | Centralize response helper | api §3.5 | ⬜ | |
| P2-03 | Extract shared aggregate CTE | perf B8 | ⬜ | |
| P2-04 | Remove frontend hook shim tree | frontend §4 | ⬜ | Deferred |
| P2-05 | Fix query-key bugs | frontend §4 | ⬜ | Deferred |
| P2-06 | Unify duplicated `utils/` across apps | frontend §1 | ⬜ | Deferred |
| P2-07 | Remove dead code + unused deps | frontend §15–16 | ⬜ | |
| P2-08 | Unify admin API client | frontend §5 | ⬜ | Deferred |
| P2-09 | Admin forms: adopt RHF or remove dead deps | frontend §7 | ⬜ | Deferred |
| P2-10 | Add structured logging | P2-8 | ⬜ | |
| P2-11 | Add tests + typing incrementally | backend §8 | ⬜ | |
| P2-12 | Standardize loading/error/empty states | frontend §9 | ⬜ | Deferred |

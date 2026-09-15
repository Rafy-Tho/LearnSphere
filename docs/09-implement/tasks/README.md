# Task Index

All implementation tasks, grouped by area. **Status lives in the task files**; the rollup dashboard and history live in [`../progress-tracking.md`](../progress-tracking.md).

**Status legend:** ⬜ Not started · 🟡 In progress · ✅ Done · ⛔ Blocked · ⏭️ Deferred/Skipped

## Files

| Area | File | Tasks |
|---|---|---|
| Phase 0 — Safety net & decisions | [`phase-0-safety-net.md`](./phase-0-safety-net.md) | PH0-01…PH0-06 |
| Phase 1 — P0 security & data integrity | [`phase-1-security.md`](./phase-1-security.md) | P0-1…P0-15 |
| Phase 2 — P1 performance & architecture | [`phase-2-performance.md`](./phase-2-performance.md) | P1-1…P1-12 |
| Phase 3 — P2 maintainability | [`phase-3-maintainability.md`](./phase-3-maintainability.md) | P2-01…P2-12 |
| Phase 4 — P3 cleanup | [`phase-4-cleanup.md`](./phase-4-cleanup.md) | P3-1…P3-8 |
| Backend module migration | [`backend-modules.md`](./backend-modules.md) | 10 modules |
| Database migrations | [`database-migrations.md`](./database-migrations.md) | 0001+ |
| API endpoint refactors | [`api-refactor.md`](./api-refactor.md) | 9 phases |
| Security verification | [`security-verification.md`](./security-verification.md) | checklist |
| Performance baseline | [`performance-baseline.md`](./performance-baseline.md) | metrics |
| Frontend (deferred) | [`frontend.md`](./frontend.md) | deferred |
| Documentation | [`documentation.md`](./documentation.md) | DOC-01…DOC-03 |

Decisions that block tasks: [`../decisions.md`](../decisions.md).

## Plan References

- [`../../08-refactoring/codebase-audit.md`](../../08-refactoring/codebase-audit.md) — P0–P3 register
- [`../../08-refactoring/backend-plan.md`](../../08-refactoring/backend-plan.md) — backend execution
- [`../../08-refactoring/architecture-plan.md`](../../08-refactoring/architecture-plan.md) — target architecture
- [`../../08-refactoring/backend/01-structure.md`](../../08-refactoring/backend/01-structure.md) — target structure
- [`../../08-refactoring/backend/02-migration-plan.md`](../../08-refactoring/backend/02-migration-plan.md) — DB migrations
- [`../../08-refactoring/api-refactor-plan.md`](../../08-refactoring/api-refactor-plan.md) — API refactor
- [`../../08-refactoring/performance-plan.md`](../../08-refactoring/performance-plan.md) — performance
- [`../../08-refactoring/security-plan.md`](../../08-refactoring/security-plan.md) — security

## How To Update

1. Change the task's status **in its task file**.
2. Update the rollup counts in [`../progress-tracking.md`](../progress-tracking.md).
3. Add a row to the changelog in [`../progress-tracking.md`](../progress-tracking.md).
4. Record decisions in [`../decisions.md`](../decisions.md) before dependent work.
5. Link the commit/PR when a task is ✅.

> Scope note: backend is the current focus; frontend work is deferred ([`frontend.md`](./frontend.md)).

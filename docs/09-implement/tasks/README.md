# Task Index

All implementation tasks, grouped by area. **Status lives in the task files**; the rollup dashboard and history live in [`../progress-tracking.md`](../progress-tracking.md).

**Status legend:** ⬜ Not started · 🟡 In progress · ✅ Done · ⛔ Blocked · ⏭️ Deferred/Skipped

## Files

| Area | File | Tasks |
|---|---|---|
| Backend module migration | [`backend-modules.md`](./backend-modules.md) | 10 modules + BM-1…BM-5 |
| Database migrations | [`database-migrations.md`](./database-migrations.md) | 0001+ / DM-1…DM-5 |
| API refactor | [`api-refactor.md`](./api-refactor.md) | AP-1…AP-6 |
| Endpoint naming refactor | [`endpoint-refactor.md`](./endpoint-refactor.md) | ER-1…ER-12 |
| Backend naming & OOP refactor | [`naming-oop-refactor.md`](./naming-oop-refactor.md) | NO-1…NO-5 |
| Security hardening | [`security-hardening.md`](./security-hardening.md) | SH-1…SH-8 |
| Frontend refactor (learner app) | [`frontend-refactor.md`](./frontend-refactor.md) | FE-1…FE-20 |
| Frontend components (learner app) | [`frontend-components.md`](./frontend-components.md) | FC-1…FC-16 |
| Frontend performance (learner app) | [`frontend-performance.md`](./frontend-performance.md) | FP-1…FP-14 |
| Frontend API & state (learner app) | [`frontend-api-state.md`](./frontend-api-state.md) | FS-1…FS-10 |

Decisions that block tasks: [`../decisions.md`](../decisions.md).

> The phase 0–4, performance baseline, and documentation task files were
> removed — that work is deferred. Backend module migration, database migrations, the
> API refactor, security hardening, and the learner frontend refactor are the active areas.
> Admin is out of scope for the frontend refactor.

## Plan References

- [`../../08-refactoring/codebase-audit.md`](../../08-refactoring/codebase-audit.md) — P0–P3 register
- [`../../08-refactoring/backend-plan.md`](../../08-refactoring/backend-plan.md) — backend execution
- [`../../08-refactoring/architecture-plan.md`](../../08-refactoring/architecture-plan.md) — target architecture
- [`../../08-refactoring/backend/01-structure.md`](../../08-refactoring/backend/01-structure.md) — target structure
- [`../../08-refactoring/backend/02-migration-plan.md`](../../08-refactoring/backend/02-migration-plan.md) — DB migrations
- [`../../08-refactoring/backend/03-api.md`](../../08-refactoring/backend/03-api.md) — API refactor
- [`../../08-refactoring/backend/04-endpoint-naming.md`](../../08-refactoring/backend/04-endpoint-naming.md) — endpoint naming refactor
- [`../../08-refactoring/api-refactor-plan.md`](../../08-refactoring/api-refactor-plan.md) — API refactor (origin audit)
- [`../../08-refactoring/performance-plan.md`](../../08-refactoring/performance-plan.md) — performance
- [`../../08-refactoring/security-plan.md`](../../08-refactoring/security-plan.md) — security
- [`../../08-refactoring/backend/06-security.md`](../../08-refactoring/backend/06-security.md) — backend security hardening (supersedes backend sections of the above)
- [`../../08-refactoring/frontend/01-architecture.md`](../../08-refactoring/frontend/01-architecture.md) — frontend target structure
- [`../../08-refactoring/frontend/02-migration-plan.md`](../../08-refactoring/frontend/02-migration-plan.md) — frontend migration plan
- [`../../08-refactoring/frontend/03-components.md`](../../08-refactoring/frontend/03-components.md) — frontend component standard
- [`../../08-refactoring/frontend/04-performance.md`](../../08-refactoring/frontend/04-performance.md) — frontend performance standard
- [`../../08-refactoring/frontend/05-api-state.md`](../../08-refactoring/frontend/05-api-state.md) — frontend API & state standard

## How To Update

1. Change the task's status **in its task file**.
2. Update the rollup counts in [`../progress-tracking.md`](../progress-tracking.md).
3. Add a row to the changelog in [`../progress-tracking.md`](../progress-tracking.md).
4. Record decisions in [`../decisions.md`](../decisions.md) before dependent work.
5. Link the commit/PR when a task is ✅.

> Scope note: backend module migration, database migrations, the API refactor, security
> hardening, and the learner frontend refactor are the active areas; all other phases are deferred.

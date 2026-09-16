# Backend Progress

**Status:** 🟡 In progress — structure and hardening done; a few module cleanups left.

## Done

| Area | What landed |
|---|---|
| Module structure | `backend/src/` is fully module-based: `app/`, `config/`, `db/`, `common/`, `modules/` (auth, users, categories, courses, content, learning, reviews, certificates, subscriptions, admin). Legacy `controllers/`, `routes/`, `repositories/`, `validators/` removed. |
| Database migrations | `db/migrations/0001`–`0012` + `db/migrate.js` runner (`npm run db:migrate` / `db:status`) + `schema_migrations`. `0001`–`0011` applied to the live DB and verified. |
| API refactor | Response/status standardization, validators on all writes, pagination on growing lists, auth/ownership fixes, data-exposure cleanup, null semantics. |
| Endpoint naming | REST resource names across `/api/v1` (`/auth/*`, `/users/me/*`, `/admin/*`, `/courses/:courseId/*`, `/reviews/:reviewId/helpful-vote`, `/webhooks/stripe`). Frontend + admin consumers updated. |
| Naming & OOP | Kebab-case filenames, controllers/services/repositories as classes with constructor DI + default singletons, god services split, `Answer`→`Option`. |
| Security hardening | Server-side quiz grading, CSRF, helmet headers, session invalidation on password change, per-account login lockout, generic registration, audit logging, 24h idle timeout. |

## Remaining

| # | Task | Status | Notes |
|---|---|---|---|
| BM-1 | Route cross-module calls through the other module's **service**, not its repository | 🟡 | Modules still import each other's repositories directly (e.g. `courses/course.service.js` → `content/*.repository.js`, `learning/enrollment.service.js` → `content/lesson.repository.js`). |
| BM-3 | Confirm/complete ownership checks | ⬜ | Mark N/A where not applicable (auth, users, categories, learning, reviews, certificates, subscriptions). |
| BM-4 | Confirm/complete validators | ⬜ | certificates, subscriptions, admin write endpoints. |
| Ops | Apply migration `0012_login_lockout.sql` to the live DB | ⬜ | `npm run db:migrate`; adds `users.failed_login_attempts` / `users.locked_until`. |

## Notes / Residuals

- Live DB only: pre-existing legacy `lesson_content*` child object names (index/trigger/constraint) remain alongside the canonical ones — harmless; a fresh install converges.
- No automated tests, no CI.
- `loginLimiter` is applied; per-account lockout is the primary control.

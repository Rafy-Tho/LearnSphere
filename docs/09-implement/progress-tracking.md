# Implementation Progress Tracking

Rollup dashboard and history for the refactor. **Task definitions and their statuses live in [`tasks/`](./tasks/); decisions live in [`decisions.md`](./decisions.md).**

**Status legend:** ⬜ Not started · 🟡 In progress · ✅ Done · ⛔ Blocked · ⏭️ Deferred/Skipped

## Where Things Live

| What | Where |
|---|---|
| Tasks + status | [`tasks/`](./tasks/) (index: [`tasks/README.md`](./tasks/README.md)) |
| Decisions (D-01…D-09) | [`decisions.md`](./decisions.md) |
| Progress rollup + history | this file |
| Audits & plans | [`../08-refactoring/`](../08-refactoring/) |

> Scope note: backend module migration and database migrations are the active areas. All other phases are deferred and their task files were removed.

---

## Rollup Dashboard

Counts are a rollup of the task files — update them when a task's status changes.

| Area | Total | ✅ | 🟡 | ⬜ | ⛔ |
|---|---|---|---|---|---|
| Foundation — shared infra migration | 6 | 6 | 0 | 0 | 0 |
| Backend module migration | 15 | 10 | 2 | 3 | 0 |
| DB migrations | 21 | 15 | 0 | 6 | 0 |

> Deferred (task files removed): phase 0–4, API endpoint refactors, security
> verification, performance baseline, frontend, documentation.

## Task Files

| Area | File |
|---|---|
| Backend module migration | [`tasks/backend-modules.md`](./tasks/backend-modules.md) |
| Database migrations | [`tasks/database-migrations.md`](./tasks/database-migrations.md) |

---

## Changelog / Session Log

| Date | Item | Status change | Notes |
|---|---|---|---|
| — | Tracking file created | — | Initial plan; nothing implemented |
| 2026-09-15 | Foundation — shared infra migration | ⬜ → ✅ | Moved `configs/`→`config/`, shared middleware/utils/services/constants/helper→`common/`, `schema.sql`→`db/`; added `app/` (app.js/middleware.js/routes.js) and `src/server.js`; added `common/http/response.js`, `common/auth/ownership.js`, `common/logger.js`, `withTransaction` in `config/database.js`; updated all imports; `node` import smoke test OK; `npx eslint .` 0 errors. |
| 2026-09-15 | ESLint config ordering fix | — | `js.configs.recommended` moved before custom rules so `no-unused-vars`/`no-console` are `warn` as intended (was overriding to `error`). |
| 2026-09-15 | Module migration — `auth` | ⬜ → ✅ | Created `modules/auth/` (routes/controller/service/repository/validation). Moved register, login, logout, getMe, update-password, password-reset trio; moved `PasswordResetCodeRepository` → `modules/auth/repository.js`; moved auth validators; mounted at `/api/v1/users` alongside the legacy users router. `userControllers.js`/`userRoute.js`/`userValidators.js` trimmed to users-only. Import smoke test OK; `npx eslint .` 0 errors. Transitional: auth service imports legacy `repositories/UserRepository.js`; auth validation imports legacy `validators/common.validator.js`. |
| 2026-09-15 | Module migration — `users` | ⬜ → ✅ | Created `modules/users/` (routes/controller/service/repository/validation). Moved profile (GET/PATCH), xp-earned; moved `UserRepository` → `modules/users/repository.js` and updated 6 importers + auth service; deleted `validators/userValidators.js`. Legacy `userControllers.js`/`userRoute.js` now hold only payment-stripe + dashboard-data (pending subscriptions/admin modules). Import smoke test OK; routes mounted; `npx eslint .` 0 errors. Transitional: users service imports legacy `repositories/CourseRepository.js`; users validation imports legacy `validators/common.validator.js`. |
| 2026-09-15 | Module migration — `categories` | ⬜ → ✅ | Created `modules/categories/` (routes/controller/service/repository/validation). Moved `CategoryRepository`, controller, route, validators; deleted the legacy files. Fully isolated (no other module depended on it). Import smoke test OK; `npx eslint .` 0 errors. |
| 2026-09-15 | Module migration — `courses` | ⬜ → ✅ | Created `modules/courses/` (repository.js, objectives.repository.js, service.js, controller.js, routes.js, objectives.routes.js, validation.js). Moved `CourseRepository` (11 importers updated) + `CourseObjectiveRepository`; extracted service with ownership via `assertOwnership`; dropped dead `getCoursesByCategoryId`/`getCoursesByInstructorId`; moved `learningProgressValidator` to `validators/learningValidators.js`; deleted legacy course controller/route/validator files. Import smoke test OK; `npx eslint .` 0 errors (warnings 23→20). Transitional: service imports content/learning/subscription/users repositories. Extra files (objectives.*) justified by the two entities. |
| 2026-09-15 | Module migration — `content` | ⬜ → ✅ | Created `modules/content/` (6 repositories, service.js, controller.js, validation.js, 6 route files). Moved Module/Chapter/Lesson/LessonContent/Question/Answer repositories + controllers + routes + validators; extracted service with ownership via `assertOwnership`; deleted 16 legacy files; updated `app/routes.js` and `courses/routes.js` to the new routers. Also fixed the answer update/delete responses (were 201 "created") to 200 with correct messages. Import smoke test OK; `npx eslint .` 0 errors (warnings 20→19). Transitional: service imports subscription repository; lesson route imports legacy `lessonCompletionRoute`. |
| 2026-09-15 | Module migration — `learning` | ⬜ → ✅ | Created `modules/learning/` (repository.js, progress.repository.js, completion.repository.js, service.js, controller.js, validation.js, enrollment/progress/completion route files). Moved Enrollment/LearningProgress/LessonCompletion repositories + controllers + routes + validator; extracted service; deleted 7 legacy files; rewired `app/routes.js`, `courses/routes.js`, and `content/lesson.routes.js` (removed the last cross-module legacy route import). Import smoke test OK; `npx eslint .` 0 errors (warnings 19→18). Transitional: service imports courses/content repositories. |
| 2026-09-15 | Module migration — `reviews` | ⬜ → ✅ | Created `modules/reviews/` (repository.js, service.js, controller.js, validation.js, routes.js). Moved `ReviewRepository` + controller + route + validators; deleted 3 legacy files; rewired `app/routes.js` and `courses/routes.js`. Import smoke test OK; `npx eslint .` 0 errors. Transitional: service imports courses/users repositories. |
| 2026-09-15 | Module migration — `certificates` | ⬜ → ✅ | Created `modules/certificates/` (repository.js, service.js, controller.js, routes.js exporting both the nested and standalone routers). Moved `CertificateRepository` + controller + route; deleted 2 legacy files; rewired `app/routes.js` and `courses/routes.js`. Import smoke test OK; `npx eslint .` 0 errors (warnings 18→16). Transitional: service imports courses/learning repositories. |
| 2026-09-15 | Module migration — `subscriptions` | ⬜ → ✅ | Created `modules/subscriptions/` (repository.js, service.js, controller.js, admin.controller.js, routes.js, payment.routes.js, admin.routes.js, webhook.routes.js) and `config/stripe.js`. Moved `SubscriptionRepository`, user + admin subscription controllers/routes, Stripe webhook, and `createStripeSession` (from userControllers); deleted 6 legacy files and the `routes/admin/` folder (restored `adminUserRoute.js` which is pending the admin module). Added `findUserSubscriptionById`/`findPaymentById` to replace load-all-then-find (audit P1-6). Import smoke test OK; 22 routers; `npx eslint .` 0 errors (warnings 16→8). Transitional: service imports users repository. |
| 2026-09-15 | Module migration — `admin` + final cleanup | ⬜ → ✅ | Created `modules/admin/` (service.js, users.service.js, controller.js, users.controller.js, routes.js, users.routes.js) for dashboard stats + admin user management; deleted the last legacy files (`adminControllers`, `adminUserControllers`, `userRoute`, `adminUserRoute`). Removed the now-empty `controllers/`, `routes/`, `repositories/`, `validators/`, and stray `src/uploads/` folders. Moved `validators/common.validator.js` → `common/validation.js` and updated all module validation imports. Used `HashService` in admin user creation. Rewrote `app/routes.js` for the final module layout. Import smoke test OK; 22 routers; `npx eslint .` 0 errors (warnings 8→7). **All 10 modules migrated; backend `src/` is fully module-based.** |
| 2026-09-15 | Fix: multer upload path after move | — | `common/middleware/multer.js` computed `../../uploads` (→ `src/uploads`) after moving from `src/middlewares`; corrected to `../../../uploads` (→ `backend/uploads`) to match the static-serve path in `app/middleware.js`. Removed the stray `src/uploads`. |
| 2026-09-15 | Phase 1 — P0 security fixes (batch 1) | ⬜ → 🟡 | Implemented: login rate limiting (P0-12); login status check + constant-time dummy bcrypt + generic reset responses + register 409 (P0-7 partial, P0-11); stop password-hash leaks (P0-3); env fail-fast validation + remove `Origin`-based Stripe redirects (P0-14); quiz-option authorize+ownership (P0-4); validators for options/enroll/progress/completions/payment/admin routes (P0-10); `withTransaction` for register/enroll/admin-create-user/reset (P0-8); webhook idempotency + transaction + payment_status + email amount fix (P0-5); subscription check on enroll and enrollment checks on completion/review (P0-6); `.env.example` (PH0-02); 5xx logging (PH0-04). Verified: app import OK; `npx eslint .` 0 errors. Remaining P0: quiz answer key, reset hashing, temp password, CSRF/helmet, schema drift, session invalidation, per-account throttling. |
| 2026-09-15 | Schema/DB decisions (D-02/03/04/05/07) + P0-2 + P0-15 | ⬜ → ✅ | Canonical `lesson_contents` (plural); added `lessons.access_type`; widened `password_reset_codes.code` to VARCHAR(255); dropped `quizzes.lesson_id` UNIQUE. Updated `db/schema.sql` (fresh installs) and added `db/migrations/0001_drift_fixes.sql` (idempotent) + `db/migrate.js` runner with `schema_migrations` tracking and npm scripts `db:migrate`/`db:status`. Reset codes now use `crypto.randomInt` and HMAC-SHA256 keyed with `SESSION_SECRET`. Verified: app import OK; `npx eslint .` 0 errors. |
| 2026-09-15 | Docs restructure — tasks split from progress | — | Moved all task definitions into [`tasks/`](./tasks/) (one file per area, status kept in the task files); moved the decisions log to [`decisions.md`](./decisions.md); this file is now a rollup dashboard + changelog only. |
| 2026-09-15 | DB migrations — full baseline suite | ⬜ → ✅ | Added `db/migrations/0001`–`0010` (extensions/enums, trigger function, identity, catalog, content, learning, billing, reviews, indexes, triggers); renamed `0001_drift_fixes.sql` → `0011_drift_fixes.sql` and extended (D4 composite unique, D6 drop `helpful_count`). Synced `schema.sql` (`pg_trgm`, D7 indexes, no `helpful_count`) and added `db/README.md`. |
| 2026-09-15 | Drift decisions D-01/D-07/D-08 | ⬜ → ✅ | D-01 soft delete; D-07 plain-SQL runner; D-08 drop `course_reviews.helpful_count`; D5 obsolete. Implemented D8 (P1-7) and D7 (P1-5): `Course.delete` soft-deletes and all course read paths filter `deleted_at IS NULL`; added missing indexes. Apply `npm run db:migrate` to the live DB still pending. |
| 2026-09-15 | Tasks kept in progress | 🟡 | `backend-modules.md` and `database-migrations.md` marked 🟡 In progress; remaining work (cross-module service calls, nested routers, ownership/validator gaps, admin invite; DB apply + verification) recorded in those task files. Rollup updated. |
| 2026-09-15 | Deferred tasks removed | ⏭️ | Deleted `phase-0-safety-net`, `phase-1-security`, `phase-2-performance`, `phase-3-maintainability`, `phase-4-cleanup`, `api-refactor`, `security-verification`, `performance-baseline`, `frontend`, `documentation`. Rollup and task index trimmed to backend-modules + database-migrations. |

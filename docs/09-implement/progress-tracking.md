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

> Scope note: backend is the current focus. Frontend work is deferred ([`tasks/frontend.md`](./tasks/frontend.md)).

---

## Rollup Dashboard

Counts are a rollup of the task files — update them when a task's status changes.

| Area | Total | ✅ | 🟡 | ⬜ | ⛔ |
|---|---|---|---|---|---|
| Foundation — shared infra migration | 6 | 6 | 0 | 0 | 0 |
| Phase 0 — Safety net & decisions | 6 | 2 | 2 | 2 | 0 |
| Phase 1 — P0 security & data integrity | 15 | 10 | 2 | 3 | 0 |
| Phase 2 — P1 performance & architecture | 12 | 0 | 0 | 12 | 0 |
| Phase 3 — P2 maintainability | 12 | 0 | 0 | 12 | 0 |
| Phase 4 — P3 cleanup | 8 | 0 | 0 | 8 | 0 |
| Backend module migration | 10 | 10 | 0 | 0 | 0 |
| DB migrations | 5 | 4 | 0 | 1 | 0 |
| API endpoint refactors | 9 | 0 | 0 | 9 | 0 |
| Documentation | 3 | 0 | 0 | 3 | 0 |

## Task Files

| Area | File |
|---|---|
| Phase 0 — Safety net & decisions | [`tasks/phase-0-safety-net.md`](./tasks/phase-0-safety-net.md) |
| Phase 1 — P0 security & data integrity | [`tasks/phase-1-security.md`](./tasks/phase-1-security.md) |
| Phase 2 — P1 performance & architecture | [`tasks/phase-2-performance.md`](./tasks/phase-2-performance.md) |
| Phase 3 — P2 maintainability | [`tasks/phase-3-maintainability.md`](./tasks/phase-3-maintainability.md) |
| Phase 4 — P3 cleanup | [`tasks/phase-4-cleanup.md`](./tasks/phase-4-cleanup.md) |
| Backend module migration | [`tasks/backend-modules.md`](./tasks/backend-modules.md) |
| Database migrations | [`tasks/database-migrations.md`](./tasks/database-migrations.md) |
| API endpoint refactors | [`tasks/api-refactor.md`](./tasks/api-refactor.md) |
| Security verification | [`tasks/security-verification.md`](./tasks/security-verification.md) |
| Performance baseline | [`tasks/performance-baseline.md`](./tasks/performance-baseline.md) |
| Frontend (deferred) | [`tasks/frontend.md`](./tasks/frontend.md) |
| Documentation | [`tasks/documentation.md`](./tasks/documentation.md) |

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

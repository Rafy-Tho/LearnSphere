# Implementation Progress Tracking

Single source of truth for the status of every refactor task. Update this file as work proceeds.

**Status legend:** ⬜ Not started · 🟡 In progress · ✅ Done · ⛔ Blocked · ⏭️ Deferred/Skipped

**Plan references:**
- [`../08-refactoring/codebase-audit.md`](../08-refactoring/codebase-audit.md) — P0–P3 register
- [`../08-refactoring/backend-plan.md`](../08-refactoring/backend-plan.md) — backend execution
- [`../08-refactoring/architecture-plan.md`](../08-refactoring/architecture-plan.md) — target architecture
- [`../08-refactoring/backend/01-structure.md`](../08-refactoring/backend/01-structure.md) — target structure
- [`../08-refactoring/backend/02-migration-plan.md`](../08-refactoring/backend/02-migration-plan.md) — DB migrations
- [`../08-refactoring/api-refactor-plan.md`](../08-refactoring/api-refactor-plan.md) — API refactor
- [`../08-refactoring/performance-plan.md`](../08-refactoring/performance-plan.md) — performance
- [`../08-refactoring/security-plan.md`](../08-refactoring/security-plan.md) — security

> Scope note: backend is the current focus. Frontend work is deferred (§12).

---

## 0. Overall Dashboard

| Area | Total | ✅ | 🟡 | ⬜ | ⛔ |
|---|---|---|---|---|---|
| Foundation — shared infra migration | 6 | 6 | 0 | 0 | 0 |
| Phase 0 — Safety net & decisions | 6 | 2 | 2 | 2 | 0 |
| Phase 1 — P0 security & data integrity | 15 | 10 | 2 | 3 | 0 |
| Phase 2 — P1 performance & architecture | 12 | 0 | 0 | 12 | 0 |
| Phase 3 — P2 maintainability | 12 | 0 | 0 | 12 | 0 |
| Phase 4 — P3 cleanup | 8 | 0 | 0 | 8 | 0 |
| Backend module migration | 10 | 10 | 0 | 0 | 0 |
| DB migrations | 11 | 0 | 0 | 11 | 0 |
| API endpoint refactors | 10 | 0 | 0 | 10 | 0 |
| Documentation | 3 | 0 | 0 | 3 | 0 |

Update the counts when statuses change.

### Foundation Snapshot

| Deliverable | Status | Location |
|---|---|---|
| `app/` layer (app, middleware, routes) | ✅ | `backend/src/app/` |
| `config/` (Env, database + `withTransaction`, cloudinary, stripe) | ✅ | `backend/src/config/` |
| `db/` (schema baseline) | ✅ | `backend/src/db/` |
| `common/` (errors, http, middleware, auth, query, constants, helper, services, validation, logger) | ✅ | `backend/src/common/` |
| `common/http/response.js` (`sendSuccess`) | ✅ | new |
| `common/auth/ownership.js` (`assertOwnership`) | ✅ | new |
| `common/logger.js` (structured logger) | ✅ | new |
| `src/server.js` entry point | ✅ | moved from `backend/server.js` |
| `modules/` (all 10 feature modules) | ✅ | `backend/src/modules/` |
| Legacy `controllers/`, `repositories/`, `routes/`, `validators/` | ✅ | removed (migrated) |


---

## 1. Decisions Log

Record decisions before implementing dependent work.

| # | Decision | Options | Status | Chosen | Date | Notes |
|---|---|---|---|---|---|---|
| D-01 | Course delete semantics | Hard delete vs soft delete (`deleted_at`) | ⬜ | | | Blocks P1-7 |
| D-02 | Canonical lesson-content table name | `lesson_content` vs `lesson_contents` | ✅ | `lesson_contents` | 2026-09-15 | Matches code; schema.sql + migration 0001 |
| D-03 | `lessons.access_type` | Add column vs remove code usage | ✅ | Add column | 2026-09-15 | `access_course_type DEFAULT 'FREE'` |
| D-04 | `quizzes.lesson_id` unique | Drop constraint vs keep one-question model | ✅ | Drop constraint | 2026-09-15 | Keep `(lesson_id, position)` unique |
| D-05 | Reset-code hashing | bcrypt vs HMAC-SHA256 + pepper | ✅ | HMAC-SHA256 + pepper | 2026-09-15 | Pepper = `SESSION_SECRET`; code via `crypto.randomInt` |
| D-06 | CSRF strategy | Same-site + `sameSite=lax` vs CSRF tokens | ⬜ | | | P0-13 |
| D-07 | Migration tooling | Plain SQL runner vs `node-pg-migrate` | ⬜ | | | Needs dependency approval |
| D-08 | `course_reviews.helpful_count` | Maintain vs drop | ⬜ | | | Drift D6 |
| D-09 | Admin temp password | Email invite vs keep | ⬜ | | | P0-9 |

---

## 2. Phase 0 — Safety Net & Decisions

| ID | Task | Plan ref | Status | Notes |
|---|---|---|---|---|
| PH0-01 | Resolve decisions D-01…D-09 | §1 | 🟡 | D-02/03/04/05/07 resolved; D-01/06/08/09 open |
| PH0-02 | Add `.env.example` and document variables | P0-14 | ✅ | `backend/.env.example` |
| PH0-03 | Add structured logger + request-id middleware | P2-8 | 🟡 | logger added; request-id middleware pending |
| PH0-04 | Log 5xx in `errorHandler` | P2-8 | ✅ | logs status/method/path/stack |
| PH0-05 | Establish performance baseline with seed data | perf §2 | ⬜ | |
| PH0-06 | Back up database before any schema change | db §8 | ⬜ | |

---

## 3. Phase 1 — P0 Security & Data Integrity

| ID | Task | Plan ref | Status | Notes |
|---|---|---|---|---|
| P0-1 | Strip `is_correct`/explanations from learner quiz responses | security §4 | ⬜ | Needs server-side grading (frontend uses `is_correct`) |
| P0-2 | Fix password reset (secure random, salted/HMAC, column width) | security §2 | ✅ | `crypto.randomInt` + HMAC-SHA256 pepper; column widened to VARCHAR(255) |
| P0-3 | Stop returning password hashes (dashboard, admin update) | security §4 | ✅ | `getInstructors`/`updateById` now select explicit columns |
| P0-4 | Add `authorize` + ownership to quiz options POST/PATCH/DELETE | security §3 | ✅ | `authorize` + `assertOwnership` via question instructor |
| P0-5 | Webhook: idempotency + transaction + amount/payment_status fix | security §6 | ✅ | idempotent by payment intent; transactional; email amount fixed |
| P0-6 | Enforce subscription/enrollment on enroll, completion, review | security §3 | ✅ | subscription check on enroll; enrollment check on completion/review |
| P0-7 | Session invalidation on password change/reset; status check | security §2 | 🟡 | status check done; session invalidation pending |
| P0-8 | Add `withTransaction`; wrap multi-step writes | backend §5 | ✅ | register, enroll, admin create user, reset |
| P0-9 | Remove hardcoded admin temp password | security §6 | ⬜ | Needs invite flow (frontend) |
| P0-10 | Add validators to all unvalidated write endpoints | security §4 | ✅ | options, enroll, progress, completions, payment, admin routes |
| P0-11 | Fix account enumeration + login timing | security §2 | ✅ | generic reset responses; dummy bcrypt; register 409 |
| P0-12 | Wire `loginLimiter`; add per-account throttling | security §5 | 🟡 | `loginLimiter` wired; per-account throttling pending |
| P0-13 | CSRF strategy + security headers (`helmet`) | security §5 | ⬜ | `helmet` = new dependency; CSRF needs D-06 |
| P0-14 | Env validation; remove `Origin`-based Stripe redirects | security §6 | ✅ | env fail-fast; redirects use `CLIENT_URL_1` |
| P0-15 | Resolve schema drift (D1–D4) | db §6 | ✅ | `lesson_contents`, `lessons.access_type`, reset-code width, quizzes unique — schema.sql + migration 0001 |

---

## 4. Phase 2 — P1 Performance & Architecture

| ID | Task | Plan ref | Status | Notes |
|---|---|---|---|---|
| P1-1 | `getCourseDetailsDashboard`: consolidate queries + ownership | perf B3 | ⬜ | 8 → 1–2 queries |
| P1-2 | Rewrite `getAllCourses` (count, alias filters, soft-delete, cap) | perf B2 | ⬜ | |
| P1-3 | Simplify popular/recommended/in-progress/completed | perf B4 | ⬜ | |
| P1-4 | Dedupe duration subquery + ownership SQL | perf B8 | ⬜ | |
| P1-5 | Add missing indexes | perf B1 | ⬜ | |
| P1-6 | Admin load-all-then-find → `findById` | perf B5 | ⬜ | |
| P1-7 | Decide + apply soft-delete consistency | P1-7 | ⬜ | Depends D-01 |
| P1-8 | Frontend QueryClient defaults + `enabled` guards | perf F1/F2 | ⬜ | Deferred to frontend phase |
| P1-9 | Standardize response envelope + pagination | api §3 | ⬜ | |
| P1-10 | Route-level code splitting | perf F5 | ⬜ | Deferred to frontend phase |
| P1-11 | Fix stale localStorage auth | P1-11 | ⬜ | Deferred to frontend phase |
| P1-12 | Fix `PaymentSuccess` param/crash | P1-12 | ⬜ | Deferred to frontend phase |

---

## 5. Phase 3 — P2 Maintainability

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

---

## 6. Phase 4 — P3 Cleanup

| ID | Task | Status | Notes |
|---|---|---|---|
| P3-1 | Fix folder/naming inconsistencies | ⬜ | |
| P3-2 | Remove dead assets + Font Awesome CDN + `date-fns` misuse | ⬜ | |
| P3-3 | Remove leftover `console.log` | ⬜ | |
| P3-4 | Rename colliding `package.json` names | ⬜ | |
| P3-5 | Fix comment/route drift + `AdvaceQuery` typo | ⬜ | |
| P3-6 | Remove/whitelist `AdvancedQuery.limitFields()` | ⬜ | |
| P3-7 | Remove unused schema columns | ⬜ | |
| P3-8 | Move devtools to devDependencies | ⬜ | |

---

## 7. Backend Module Migration

Per-module checklist from [`../08-refactoring/backend-plan.md`](../08-refactoring/backend-plan.md) §10.

| Module | Scaffolded | Controller thin | Service extracted | Repo isolated | Validators | Ownership | Verified | Status |
|---|---|---|---|---|---|---|---|---|
| common/ (shared infra) | ✅ | — | — | — | — | — | ✅ | ✅ |
| auth | ✅ | ✅ | ✅ | ✅ | ✅ | — | ✅ | ✅ |
| users | ✅ | ✅ | ✅ | ✅ | ✅ | — | ✅ | ✅ |
| categories | ✅ | ✅ | ✅ | ✅ | ✅ | — | ✅ | ✅ |
| courses | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| content | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| learning | ✅ | ✅ | ✅ | ✅ | ✅ | — | ✅ | ✅ |
| reviews | ✅ | ✅ | ✅ | ✅ | ✅ | — | ✅ | ✅ |
| certificates | ✅ | ✅ | ✅ | ✅ | — | — | ✅ | ✅ |
| subscriptions | ✅ | ✅ | ✅ | ✅ | — | — | ✅ | ✅ |
| admin | ✅ | ✅ | ✅ | ✅ | — | ✅ | ✅ | ✅ |

---

## 8. Database Migrations

From [`../08-refactoring/backend/02-migration-plan.md`](../08-refactoring/backend/02-migration-plan.md).

Approach adopted: `db/schema.sql` remains the baseline for fresh installs; incremental migrations are applied to existing databases via `db/migrate.js`.

| Migration | Status | Notes |
|---|---|---|
| `0001_drift_fixes.sql` | ✅ | `lesson_contents`, `lessons.access_type`, reset-code width, `quizzes` unique |
| `migrate.js` runner | ✅ | `npm run db:migrate` / `npm run db:status` |
| `schema_migrations` tracking | ✅ | |
| Baseline for fresh installs | ✅ | `db/schema.sql` (updated to canonical schema) |
| Full from-scratch baseline migrations | ⏭️ | Not needed; `schema.sql` is the baseline |

---

## 9. API Endpoint Refactors

From [`../08-refactoring/api-refactor-plan.md`](../08-refactoring/api-refactor-plan.md) §6.

| Phase | Endpoints | Status | Notes |
|---|---|---|---|
| 1 | Shared helpers (`sendSuccess`, ownership, `withTransaction`) | ⬜ | |
| 2 | Auth + users + password reset | ⬜ | |
| 3 | Courses + catalog list/detail | ⬜ | |
| 4 | Content + learn + dashboard-details | ⬜ | |
| 5 | Learning (enroll/progress/completions) | ⬜ | |
| 6 | Reviews + certificates | ⬜ | |
| 7 | Subscriptions + webhook | ⬜ | |
| 8 | Admin | ⬜ | |
| 9 | Global API cleanup | ⬜ | |

---

## 10. Security Checklist

From [`../08-refactoring/security-plan.md`](../08-refactoring/security-plan.md) §8.1.

- [ ] Suspended user cannot log in.
- [ ] Login response/time identical for unknown vs wrong-password.
- [ ] `loginLimiter` triggers 429.
- [ ] Password reset works end to end; code hashed.
- [ ] Password change/reset invalidates sessions.
- [ ] Learner cannot POST/PATCH/DELETE options.
- [ ] Learner cannot read another course's dashboard-details.
- [ ] SUBSCRIPTION course requires active subscription to enroll.
- [ ] Completion/review require enrollment.
- [ ] Quiz responses contain no `is_correct`.
- [ ] No endpoint returns `password`.
- [ ] Unvalidated writes return 422.
- [ ] CSRF blocked (or same-site enforced).
- [ ] Security headers present.
- [ ] Env validation fails fast.
- [ ] Stripe redirect ignores spoofed `Origin`.
- [ ] Webhook idempotent.
- [ ] Uploads validate content; `/uploads` not enumerable.

---

## 11. Performance Baseline & Results

From [`../08-refactoring/performance-plan.md`](../08-refactoring/performance-plan.md) §2.2.

| Metric | Endpoint / page | Before | After | Delta |
|---|---|---|---|---|
| p95 latency | `GET /courses` | | | |
| Query count | `GET /courses` | | | |
| p95 latency | `GET /courses/:id/learn` | | | |
| Query count | `GET /courses/:id/dashboard-details` | | | |
| Payload bytes | `GET /admin/subscriptions/payments` | | | |
| Requests/page | `/courses` (learner) | | | |
| Bundle KB | `frontend` | | | |
| Bundle KB | `admin` | | | |

---

## 12. Frontend (Deferred)

Not in scope yet. Tracked here so nothing is lost.

| Area | Status | Notes |
|---|---|---|
| Learner frontend refactor | ⏭️ | Awaiting backend completion |
| Admin frontend refactor | ⏭️ | Awaiting backend completion |
| Shared API client | ⏭️ | |
| Dead code/deps removal | ⏭️ | |

---

## 13. Documentation

| ID | Task | Status | Notes |
|---|---|---|---|
| DOC-01 | Keep `docs/08-refactoring/` in sync with decisions | 🟡 | Ongoing |
| DOC-02 | Update current-state docs after migration (folder-structure, architecture, ai rules, spec, README) | ⬜ | After code moves |
| DOC-03 | Update this tracker after every completed item | 🟡 | Ongoing |

---

## 14. Changelog / Session Log

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

---

## 15. How To Update This File

1. Change the item's status in its table.
2. Update the §0 dashboard counts.
3. Add a row to §14 for significant changes.
4. Record decisions in §1 before dependent work.
5. Link to the commit/PR when an item is ✅.

# Endpoint Naming Refactor

REST resource naming + scalability refactor of all `/api/v1` routes. See
[`backend/04-endpoint-naming.md`](../../08-refactoring/backend/04-endpoint-naming.md) for the
plan and full route map, and [`../decisions.md`](../decisions.md) for D-14.

> **Status:** ✅ Done (2026-09-15). ER-1…ER-12 complete. Residual: the Stripe dashboard
> webhook URL must be updated to `/api/v1/webhooks/stripe` (external, out of repo).

**Legend:** ⬜ Not started · 🟡 In progress · ✅ Done · ⛔ Blocked · ⏭️ Deferred/Skipped

## ER-1 — Correctness + param names

| # | Task | Status | Notes |
|---|---|---|---|
| ER-1.1 | `GET /subscriptions/:id` → `GET /plans/:planId` (was returning a plan) | ✅ | `subscriptions/plans.routes.js`, `controller.js`, `service.js` |
| ER-1.2 | Remove broken top-level collections | ✅ | removed `/objectives`, `/chapters`, `/contents`, `/questions`, `/lessons/first` |
| ER-1.3 | Descriptive params everywhere (no `:id`) | ✅ | `:courseId`, `:moduleId`, `:chapterId`, `:lessonId`, `:contentId`, `:questionId`, `:optionId`, `:objectiveId`, `:categoryId`, `:reviewId`, `:certificateId`, `:planId`, `:subscriptionId`, `:paymentId`, `:userId` |

## ER-2 — Auth & users

| # | Task | Status | Notes |
|---|---|---|---|
| ER-2.1 | Split `/users` into `/auth/*` | ✅ | register/login/logout/password-resets/password |
| ER-2.2 | Move profile/xp/password to `/users/me/*` | ✅ | |
| ER-2.3 | dashboard-data → `GET /admin/dashboard`; payment-stripe → `POST /subscriptions/:planId/checkout` | ✅ | |
| ER-2.4 | Keep `GET /users/me`; drop `/users/profile` alias | ✅ | |

## ER-3 — Catalog + objectives

| # | Task | Status | Notes |
|---|---|---|---|
| ER-3.1 | `/courses/:courseId`, `:categoryId` | ✅ | |
| ER-3.2 | User-scoped course lists under `/users/me/courses/*` | ✅ | recommended, recently-viewed, in-progress, completed |
| ER-3.3 | `/courses/dashboard` + `/:id/dashboard-details` → `/admin/courses` | ✅ | `courses/admin.routes.js` |
| ER-3.4 | `/courses/:courseId/curriculum`, `/:courseId/completions` | ✅ | |
| ER-3.5 | Objectives collection + `/objectives/:objectiveId` item | ✅ | |

## ER-4 — Content

| # | Task | Status | Notes |
|---|---|---|---|
| ER-4.1 | Modules/chapters/lessons collection-item split + params | ✅ | collection+item routers |
| ER-4.2 | `GET /courses/:courseId/first-lesson` | ✅ | |
| ER-4.3 | Contents/questions/options item params | ✅ | `:contentId`/`:questionId`/`:optionId` |
| ER-4.4 | Remove deep nested mounts | ✅ | max 1 level now |

## ER-5 — Learning

| # | Task | Status | Notes |
|---|---|---|---|
| ER-5.1 | `/courses/:courseId/enrollments` | ✅ | |
| ER-5.2 | `/progresses` → `/courses/:courseId/progress` | ✅ | singular |
| ER-5.3 | `/completions` → `/lessons/:lessonId/completions` only | ✅ | |

## ER-6 — Reviews

| # | Task | Status | Notes |
|---|---|---|---|
| ER-6.1 | Course reviews + summary under `:courseId` | ✅ | |
| ER-6.2 | `/reviews/me` → `/courses/:courseId/reviews/me` | ✅ | course-scoped (actual semantics) |
| ER-6.3 | Helpful vote → `PUT`/`DELETE /reviews/:reviewId/helpful-vote` | ✅ | idempotent; frontend sends desired state |
| ER-6.4 | Reports under `:reviewId`; remove top-level `/reviews` collection | ✅ | |

## ER-7 — Certificates

| # | Task | Status | Notes |
|---|---|---|---|
| ER-7.1 | Course certificates under `:courseId` | ✅ | |
| ER-7.2 | `/users/me/certificates` | ✅ | |
| ER-7.3 | `GET /certificates/:certificateId` | ✅ | |

## ER-8 — Subscriptions / billing / webhook

| # | Task | Status | Notes |
|---|---|---|---|
| ER-8.1 | `GET /plans/:planId` | ✅ | |
| ER-8.2 | `GET /users/me/subscription` | ✅ | |
| ER-8.3 | `POST /webhooks/stripe` before `express.json()` | ✅ | update Stripe dashboard URL (external) |

## ER-9 — Admin flatten

| # | Task | Status | Notes |
|---|---|---|---|
| ER-9.1 | `/admin/users/:userId` | ✅ | |
| ER-9.2 | `/admin/plans`, `/admin/plans/:planId` | ✅ | |
| ER-9.3 | `/admin/subscriptions`, `/:subscriptionId` | ✅ | |
| ER-9.4 | `/admin/payments`, `/:paymentId` | ✅ | |

## ER-10 — Frontend consumer migration

| # | Task | Status | Notes |
|---|---|---|---|
| ER-10.1 | Update `frontend/src/api/*` paths | ✅ | auth/users/courses/lessons/reviews/subscriptions + `client.put` |
| ER-10.2 | Update hooks/query keys; build passes | ✅ | `useSubscriptionDetails` reads `planId`; `ReviewCard` sends next vote state |

## ER-11 — Admin consumer migration

| # | Task | Status | Notes |
|---|---|---|---|
| ER-11.1 | Update `admin/src/services/*` paths | ✅ | AuthApi `/auth`; UserApi `/users/me/*`, `/admin/dashboard`; CourseApi `/admin/courses`; SubscriptionApi `/admin/{plans,subscriptions,payments}` |
| ER-11.2 | Update hooks/pages; build passes | ✅ | no hook changes needed |

## ER-12 — Verification + docs

| # | Task | Status | Notes |
|---|---|---|---|
| ER-12.1 | Backend lint + import; frontend/admin build; grep for old paths | ✅ | 0 errors; import OK; both builds pass |
| ER-12.2 | Sync `docs/04-design/api-design.md` | ✅ | full route map rewritten |

## Definition of Done

No route uses `:id`; no route is mounted twice; no deep nesting; paths are nouns
(max 1-level nesting); user-scoped data under `/users/me`; admin flattened; all consumers
updated in the same change; lint + builds pass; docs synced.

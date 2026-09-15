# Endpoint Naming & Scalability Refactor

Plan to standardize the `/api/v1` route surface to REST resource naming and remove
structures that do not scale. Part of the backend refactor series under
`docs/08-refactoring/backend/`. See also [`./03-api.md`](./03-api.md) (contract/validation)
and [`../api-refactor-plan.md`](../api-refactor-plan.md).

> **Status:** ✅ Implemented (2026-09-15). ER-1…ER-12 complete — see
> [`../../09-implement/tasks/endpoint-refactor.md`](../../09-implement/tasks/endpoint-refactor.md).
> Residual: update the Stripe dashboard webhook URL to `/api/v1/webhooks/stripe` (external).

---

## 1. Problem Statement

The endpoint surface grew module-by-module and mixed UI concepts into paths. Review of
all 97 endpoints found correctness bugs, a god router, deep nesting, and dual-mounted
routes (some broken). The surface is not cleanly scalable.

### 1.1 Findings

| # | Issue | Examples | Severity |
|---|---|---|---|
| N-1 | Action/verb paths instead of resources | `POST /users/password-reset-code`, `/verify-password-reset-code`, `/reset-password`, `PATCH /users/update-password`, `POST /users/payment-stripe/:subscriptionId`, `POST /stripe-webhook` | High |
| N-2 | Non-resource suffixes | `GET /courses/:id/dashboard-details`, `/users/dashboard-data`, `/courses/dashboard` | High |
| N-3 | Misnamed resource (correctness) — `GET /subscriptions/:id` returns a **plan** | `/subscriptions/:id` | High |
| N-4 | Inconsistent "current user" convention | `/reviews/me`, `/certificates/mine`, `/subscriptions/user-active`, `/users/profile` | Medium |
| N-5 | Uncountable/awkward plurals | `/progresses`, `/contents`, `/completions` | Medium |
| N-6 | Generic top-level collections with no parent | `/objectives`, `/contents`, `/options`, `/completions` | Medium |
| N-7 | Route vs code mismatch | route `/options` vs code "Answer" | Low |
| N-8 | Deep nesting up to 5 levels | `/courses/:id/modules/:id/chapters/:id/lessons/:id/contents` | High |
| N-9 | `:id` collision at every level (child shadows parent) | all nested routers | High |
| N-10 | Dual mounting; top-level collections are **broken** | `GET /objectives`, `/chapters`, `/contents`, `/questions`, `/lessons/first` read `req.params.id === undefined` | High |
| N-11 | God router `/users` (auth + users + admin + payments) | `app/routes.js` mounts 4 routers on `/users` | High |
| N-12 | Admin resources nested under an unrelated parent | `/admin/subscriptions/plans`, `/admin/subscriptions/payments` | Medium |
| N-13 | Filtered collections as pseudo-resources | `/courses/in-progress`, `/completed`, `/recommended`, `/popular`, `/recently-viewed` | Medium |
| N-14 | Non-idempotent toggle via POST | `POST /reviews/:id/helpful-votes` | Low |
| N-15 | Collection-level PATCH with no identifier | `PATCH /progresses` | Medium |

### 1.2 Scalability impact

- Dual mounts double the route surface; the top-level copies are broken (N-10).
- Deep nesting + `:id` collisions make ownership checks and new levels fragile (N-8/N-9).
- The god `/users` router blocks independent evolution of auth/users/admin/billing (N-11).
- `/admin/subscriptions/*` does not match the data model (plans/payments are peers) (N-12).
- Paths encode UI concepts, making new clients (mobile/partner) harder.

---

## 2. Naming Standard

- Plural nouns, kebab-case.
- **Max 1 level of nesting.** Collection is nested (`/courses/:courseId/modules`); item is top-level (`/modules/:moduleId`).
- **Descriptive params**: `:courseId`, `:moduleId`, `:chapterId`, `:lessonId`, `:contentId`, `:questionId`, `:optionId`, `:reviewId`, `:certificateId`, `:planId`, `:subscriptionId`, `:paymentId`, `:userId`, `:objectiveId`, `:categoryId`.
- Caller's own data lives under `/users/me/...`.
- Namespaces: `/auth`, `/users`, `/admin`, `/webhooks`.
- Actions become sub-resources or correct methods (`PUT`/`DELETE` for idempotent toggles).
- No verbs in paths; no `-details`/`-data` suffixes.
- Base stays `/api/v1`.

### 2.1 Migration strategy (D-14)

- **In-place rename** with all consumers updated in the same change (frontend + admin + Stripe webhook URL).
- No `/api/v2`; no legacy aliases. Confirm no other consumers before executing.

---

## 3. Target Route Map

### 3.1 Auth & Users

| Current | Target |
|---|---|
| `POST /users/register` | `POST /auth/register` |
| `POST /users/login` | `POST /auth/login` |
| `POST /users/logout` | `POST /auth/logout` |
| `GET /users/me` | `GET /users/me` |
| `GET /users/profile` | `GET /users/me/profile` |
| `PATCH /users/profile` | `PATCH /users/me/profile` |
| `GET /users/xp-earned` | `GET /users/me/xp` |
| `PATCH /users/update-password` | `PATCH /users/me/password` |
| `POST /users/password-reset-code` | `POST /auth/password-resets` |
| `POST /users/verify-password-reset-code` | `POST /auth/password-resets/verify` |
| `POST /users/reset-password` | `PATCH /auth/password` |
| `POST /users/payment-stripe/:subscriptionId` | `POST /subscriptions/:planId/checkout` |
| `GET /users/dashboard-data` | `GET /admin/dashboard` |

### 3.2 Catalog

| Current | Target |
|---|---|
| `/categories`, `/categories/:id` | `/categories`, `/categories/:categoryId` |
| `/courses`, `/courses/:id` | `/courses`, `/courses/:courseId` |
| `GET /courses/popular` | `GET /courses/popular` |
| `GET /courses/recommended` | `GET /users/me/courses/recommended` |
| `GET /courses/recently-viewed` | `GET /users/me/courses/recently-viewed` |
| `GET /courses/in-progress` | `GET /users/me/courses/in-progress` |
| `GET /courses/completed` | `GET /users/me/courses/completed` |
| `GET /courses/dashboard` | `GET /admin/courses` |
| `GET /courses/:id/dashboard-details` | `GET /admin/courses/:courseId` |
| `GET /courses/:id/learn` | `GET /courses/:courseId/curriculum` |
| `GET /courses/:id/lesson-completions` | `GET /courses/:courseId/completions` |
| `GET /objectives` (broken) | **removed** |
| `GET/POST /courses/:id/objectives` | `GET/POST /courses/:courseId/objectives` |
| `PATCH/DELETE /objectives/:id` (+ nested copy) | `PATCH/DELETE /objectives/:objectiveId` |

### 3.3 Content

| Current | Target |
|---|---|
| `POST /courses/:id/modules`; `GET/PATCH/DELETE /modules/:id` | `POST /courses/:courseId/modules`; `GET/PATCH/DELETE /modules/:moduleId` |
| `GET /chapters` (broken) | **removed** |
| `GET/POST /modules/:id/chapters`; `GET/PATCH/DELETE /chapters/:id` | `GET/POST /modules/:moduleId/chapters`; `GET/PATCH/DELETE /chapters/:chapterId` |
| `POST /courses/:id/lessons`; `PATCH/DELETE /lessons/:id` | `POST /chapters/:chapterId/lessons`; `PATCH/DELETE /lessons/:lessonId` |
| `GET /lessons/first` (+ nested) | `GET /courses/:courseId/first-lesson` |
| `GET /contents` (broken) | **removed** |
| `GET/POST /lessons/:id/contents`; `PATCH/DELETE /contents/:id` | `GET/POST /lessons/:lessonId/contents`; `PATCH/DELETE /contents/:contentId` |
| `GET /questions` (broken) | **removed** |
| `GET/POST /lessons/:id/questions`; `PATCH/DELETE /questions/:id` | `GET/POST /lessons/:lessonId/questions`; `PATCH/DELETE /questions/:questionId` |
| `POST /questions/:id/options`; `PATCH/DELETE /options/:id` | `POST /questions/:questionId/options`; `PATCH/DELETE /options/:optionId` |
| Deep `/courses/:id/modules/:id/chapters/:id/lessons/:id/...` | **removed** |

### 3.4 Learning

| Current | Target |
|---|---|
| `POST/GET /courses/:id/enrollments` | `POST/GET /courses/:courseId/enrollments` |
| `POST/GET/PATCH /progresses` (+ nested) | `POST/GET/PATCH /courses/:courseId/progress` |
| `POST/GET /completions` (+ nested) | `POST/GET /lessons/:lessonId/completions` |

### 3.5 Reviews

| Current | Target |
|---|---|
| `GET /courses/:id/reviews`; `GET .../summary` | `GET/POST /courses/:courseId/reviews`; `GET /courses/:courseId/reviews/summary` |
| `GET /reviews/me` (course-scoped in practice) | `GET /courses/:courseId/reviews/me` |
| `POST /reviews/:id/helpful-votes` | `PUT /reviews/:reviewId/helpful-vote` (+ `DELETE`) |
| `POST /reviews/:id/reports` | `POST /reviews/:reviewId/reports` |
| Top-level `GET /reviews` | **removed** |

### 3.6 Certificates

| Current | Target |
|---|---|
| `GET /courses/:id/certificates/check` | `GET /courses/:courseId/certificates/check` |
| `POST/GET /courses/:id/certificates` | `POST/GET /courses/:courseId/certificates` |
| `GET /certificates/mine` | `GET /users/me/certificates` |
| `GET /certificates/:id` | `GET /certificates/:certificateId` |

### 3.7 Subscriptions / billing / webhook

| Current | Target |
|---|---|
| `GET /subscriptions/:id` (returns a plan) | `GET /plans/:planId` |
| `GET /subscriptions/user-active` | `GET /users/me/subscription` |
| `POST /stripe-webhook` | `POST /webhooks/stripe` |

### 3.8 Admin

| Current | Target |
|---|---|
| `/admin/users`, `/admin/users/:id` | `/admin/users`, `/admin/users/:userId` |
| `/admin/subscriptions/plans`, `/plans/:id` | `/admin/plans`, `/admin/plans/:planId` |
| `/admin/subscriptions/user-subscriptions`, `/:id` | `/admin/subscriptions`, `/admin/subscriptions/:subscriptionId` |
| `/admin/subscriptions/payments`, `/:id` | `/admin/payments`, `/admin/payments/:paymentId` |

---

## 4. Execution Phases

| Phase | Scope |
|---|---|
| ER-1 | Correctness: `/plans/:planId`; remove broken dual-mounted collections; descriptive params |
| ER-2 | `/auth/*` + `/users/me/*` split |
| ER-3 | Catalog + objectives |
| ER-4 | Content nesting + dual mounts |
| ER-5 | Learning |
| ER-6 | Reviews + helpful-vote idempotency |
| ER-7 | Certificates |
| ER-8 | Subscriptions/billing + `/webhooks/stripe` |
| ER-9 | Admin flatten |
| ER-10 | Frontend consumer migration |
| ER-11 | Admin consumer migration |
| ER-12 | Verification + `api-design.md` sync |

Per phase: update route files → controllers/services/validators for new params →
lint + import smoke → update consumers → verify.

---

## 5. Verification

- [ ] Backend `npx eslint .` → 0 errors; route import smoke test OK.
- [ ] `frontend` + `admin` `npm run build` pass.
- [ ] `rg`/grep proves no old paths remain in either app.
- [ ] Stripe webhook URL updated to `/api/v1/webhooks/stripe` in the Stripe dashboard.
- [ ] No route defines `:id` more than once; no route is mounted twice.
- [ ] `docs/04-design/api-design.md` synced.

---

## 6. Risks

| Risk | Mitigation |
|---|---|
| Broad rename (~97 routes + 2 apps) | Phase order; lint/build per phase |
| Stripe webhook is the only out-of-repo URL | Update in Stripe dashboard; test in test mode |
| Unknown external client | Confirm none in-repo before executing (D-14) |
| Params renamed in controllers/services | Search `req.params.id` per phase and update |

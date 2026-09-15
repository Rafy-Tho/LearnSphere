# API Refactor Plan

Execution plan for standardizing and simplifying the `/api/v1` surface. Based on [`backend-audit.md`](./backend-audit.md) §12 (traces) and [`codebase-audit.md`](./codebase-audit.md).

> **Status:** Proposed. No endpoints changed. Implementation begins only after approval.

---

## 1. Goals

- Standardize API behavior
- Simplify endpoint logic
- Improve validation and error handling
- Reduce unnecessary database operations
- Improve security and maintainability

---

## 2. Endpoint Structure

Each endpoint should follow:

```text
Route
  ↓
Middleware
  ↓
Controller
  ↓
Service
  ↓
Repository
  ↓
Database
```

Rules:
- Routes only wire middleware and controllers.
- Controllers read input, call one service method, and return the standard response. No business logic, no SQL.
- Services own business rules, authorization decisions, and transactions; no `req`/`res`.
- Repositories own parameterized SQL only.
- Cross-module calls go through the other module's service.

---

## 3. API Standards

Standardize:

### 3.1 URL naming
- Resource-oriented, plural nouns: `/courses`, `/reviews`, `/subscriptions`.
- Nested resources express ownership: `/courses/:id/modules`, `/lessons/:id/contents`.
- Keep existing paths stable; do not rename public routes without a migration.

### 3.2 HTTP methods
| Action | Method |
|---|---|
| List / read | `GET` |
| Create | `POST` |
| Partial update | `PATCH` |
| Delete | `DELETE` |

### 3.3 Status codes
| Situation | Code |
|---|---|
| Read | 200 |
| Create | 201 |
| No body | 204 |
| Bad input (FK, not-null, invalid) | 400 |
| Not authenticated | 401 |
| Wrong role/ownership | 403 |
| Not found | 404 |
| Conflict (unique) | 409 |
| Validation error | 422 |
| Rate limited | 429 |
| Server error | 500 |

> Fix current inconsistencies: updates/deletes returning 201, not-found returning 400 (`subscriptionControllers.js:12`), `/users/me` returning 200 `null`.

### 3.4 Request validation
- Every write endpoint: validator → `validateResult`.
- Validate path params as UUIDs.
- Sanitize free text; HTML via DOMPurify.
- Add validators currently missing: options PATCH/DELETE, enrollments, progresses, completions, certificates, payment, all admin routes.

### 3.5 Response structure
```json
{ "success": true, "statusCode": 200, "message": "OK", "data": {}, "pagination": { "page": 1, "limit": 10, "total": 42, "totalPages": 5 } }
```
- Lists always include `pagination`.
- Mutations include `data` (or `data: null`).
- Remove `status` (vs `statusCode`), `{ users, total }`, `query` echo, missing `data`.

### 3.6 Error structure
```json
{ "success": false, "statusCode": 422, "message": "..." }
```
- Central handler maps SQLSTATE; stacks only in development.

### 3.7 Authentication / authorization
- Every protected route: `requireAuth` → `authorize(...)` → ownership assertion.
- Ownership centralized in a shared helper.
- Learner quiz responses exclude `is_correct`/explanations.

### 3.8 Pagination / filtering / sorting
- Use `AdvancedQuery` for lists.
- Params: `page`, `limit` (capped), `sort` (`-field` desc), `search`, `fields`, domain filters with `[gte]/[gt]/[lte]/[lt]`.
- Alias filters must not be placed in `WHERE` (fix `rating`/`duration` → 500).

---

## 4. Endpoint Review

For each important endpoint, check:
- Does it have a clear responsibility?
- Is validation correct?
- Is authorization enforced?
- Does it return unnecessary data?
- Does it make unnecessary database calls?
- Does it need pagination?
- Does it have consistent errors?
- Does it follow the target architecture?

### 4.1 Review matrix

| Endpoint | Clear responsibility | Validation | Authorization | Over-fetch | Unneeded calls | Pagination | Errors | Target arch |
|---|---|---|---|---|---|---|---|---|
| `POST /users/register` | ⚠ service-worthy | ✅ | n/a | ✅ | ⚠ no tx | n/a | ⚠ 400 vs 409 | ⚠ |
| `POST /users/login` | ⚠ | ✅ | n/a | ⚠ selects password | ⚠ 3 calls | n/a | ✅ | ⚠ |
| `POST /users/logout` | ✅ | n/a | ✅ | ✅ | ⚠ redundant lookup | n/a | ✅ | ⚠ |
| `GET /users/me` | ✅ | n/a | ⚠ public | ⚠ password | ⚠ | n/a | ⚠ 200 null | ⚠ |
| `PATCH /users/profile` | ⚠ service-worthy | ⚠ loose date/phone | ✅ | ⚠ `RETURNING *` | ⚠ 3+ calls, no tx | n/a | ⚠ | ⚠ |
| `POST /users/password-reset-code` | ⚠ | ✅ | n/a | ✅ | ⚠ | n/a | ⚠ enumeration | ❌ broken |
| `POST /users/verify-password-reset-code` | ⚠ | ✅ | n/a | ✅ | ⚠ 4 calls | n/a | ⚠ enumeration | ⚠ |
| `POST /users/reset-password` | ⚠ | ✅ | n/a | ✅ | ⚠ 5 calls, no tx | n/a | ⚠ | ⚠ |
| `POST /users/payment-stripe/:id` | ⚠ service-worthy | ❌ no UUID | ✅ | ✅ | ⚠ 3 calls | n/a | ⚠ | ⚠ |
| `GET /courses` | ✅ | ✅ | n/a | ⚠ `c.*` | ⚠ 2 queries | ✅ | ⚠ alias filters 500 | ⚠ |
| `GET /courses/:id` | ✅ | ⚠ no UUID | n/a | ⚠ `*` | ⚠ redundant query | n/a | ⚠ | ⚠ |
| `GET /courses/:id/learn` | ⚠ | ⚠ | ❌ cosmetic gating | ⚠ unbounded | ⚠ 2–3 | ❌ | ⚠ | ❌ broken |
| `GET /courses/:id/dashboard-details` | ⚠ too much | ⚠ | ❌ no ownership | ⚠ unbounded | ⚠ 8 queries | ❌ | ⚠ | ❌ broken |
| `POST /courses/:id/enrollments` | ⚠ | ❌ | ⚠ no sub check | ✅ | ⚠ 5 calls, no tx | n/a | ⚠ | ⚠ |
| `PATCH /courses/:id/progresses` | ✅ | ✅ | ⚠ no lesson/course check | ✅ | ⚠ redundant lookup | n/a | ⚠ 201/200 | ⚠ |
| `POST /lessons/:id/completions` | ✅ | ❌ | ❌ no enrollment | ✅ | ⚠ 3 calls | n/a | ⚠ 409 | ⚠ |
| `GET /courses/:id/reviews` | ✅ | ✅ | n/a | ✅ | ⚠ redundant lookup | ✅ | ⚠ | ⚠ |
| `POST /courses/:id/reviews` | ✅ | ⚠ float rating | ❌ no enrollment | ✅ | ⚠ redundant lookup | n/a | ⚠ 409 | ⚠ |
| `GET /courses/:id/reviews/summary` | ✅ | n/a | n/a | ✅ | ⚠ redundant lookup | n/a | ⚠ | ⚠ |
| `POST /reviews/:id/helpful-votes` | ⚠ | ✅ | ✅ | ✅ | ⚠ 4–5 calls | n/a | ⚠ no data | ⚠ |
| `POST /reviews/:id/reports` | ✅ | ⚠ free text | ✅ | ✅ | ⚠ 4 calls | ❌ list | ⚠ | ⚠ |
| `GET /subscriptions/user-active` | ✅ | n/a | ✅ | ⚠ wide row | ⚠ duplicate query | n/a | ✅ | ⚠ |
| `GET /admin/users` | ✅ | ⚠ NaN limit | ✅ | ✅ | ✅ | ⚠ no envelope | ⚠ | ⚠ |
| `POST /admin/users` | ⚠ | ❌ | ✅ | ✅ | ⚠ 4–5, no tx | n/a | ⚠ | ⚠ |
| `PATCH/DELETE /admin/users/:id` | ✅ | ❌ | ✅ | ⚠ hash | ⚠ | n/a | ⚠ | ⚠ |
| Admin plans/subs/payments | ✅ | ❌ | ✅ | ✅ | ⚠ load-all-then-find | ❌ | ⚠ | ⚠ |
| `POST /stripe-webhook` | ⚠ inline | ❌ | signature ✅ | ✅ | ⚠ 4 writes, no tx | n/a | ⚠ 500 loops | ❌ |

Legend: ✅ good · ⚠ needs work · ❌ missing/broken.

### 4.2 Highest-priority endpoint changes
1. `POST /stripe-webhook` — idempotency + transaction + amount fix; move logic into `subscriptions` service.
2. `GET /courses/:id/learn` + `.../dashboard-details` — resolve schema drift, enforce ownership, consolidate queries.
3. `POST /courses/:id/enrollments`, `POST /lessons/:id/completions`, `POST /courses/:id/reviews` — enforce enrollment/subscription.
4. `POST /options`, `PATCH/DELETE /options/:id` — authorization/ownership + validators.
5. `GET /lessons/:id/questions` — strip `is_correct`.
6. `GET /courses` — fix alias filters, soft-delete, cap `limit`, single count strategy.
7. `GET /users/dashboard-data` — stop returning password hashes; paginate instructors.
8. Password reset trio — fix storage, enumeration, transactions.
9. Admin update subscriptions/payments — replace load-all-then-find with `findById`.
10. All admin writes — add validators + pagination envelope.

---

## 5. Compatibility

Before changing an endpoint:
- Identify frontend consumers
- Check request/response dependencies
- Avoid breaking existing features
- Update frontend consumers when necessary
- Remove deprecated endpoints only after migration

### 5.1 Consumer map (representative)

| Endpoint | Learner consumer | Admin consumer |
|---|---|---|
| `/users/register`, `/users/login`, `/users/logout` | `frontend/src/api/auth.js` | `admin/src/services/AuthApi.js` |
| `/users/me` | `frontend/src/api/users.js` | `admin/src/services/UserApi.js` |
| `/users/profile` | `frontend/src/api/users.js` | `admin/src/services/UserApi.js` |
| `/courses` | `frontend/src/api/courses.js` | `admin/src/services/CourseApi.js` (`/dashboard`) |
| `/courses/:id/learn` | `frontend/src/api/courses.js` | — |
| `/courses/:id/dashboard-details` | — | `admin/src/services/CourseApi.js` |
| `/courses/:id/enrollments` | `frontend/src/api/courses.js` | — |
| `/courses/:id/progresses` | `frontend/src/api/courses.js` | — |
| `/lessons/:id/completions` | `frontend/src/api/lessons.js` | — |
| `/courses/:id/reviews` (+summary) | `frontend/src/api/courses.js` | — |
| `/reviews/:id/helpful-votes`, `/reports` | `frontend/src/api/reviews.js` | — |
| `/subscriptions/user-active` | `frontend/src/api/subscriptions.js` | — |
| `/users/payment-stripe/:id` | `frontend/src/api/users.js` | — |
| `/admin/*` | — | `admin/src/services/*Api.js` |
| `/stripe-webhook` | Stripe (external) | — |

### 5.2 Compatibility rules
- Preserve the response envelope and field names unless both consumers are updated in the same change.
- The frontend API client unwraps `result.data` and `pagination`; changing the envelope requires a client update.
- Admin services return the **full envelope**; changing it requires updating admin callers.
- Quiz responses: confirm `frontend/src/components/courseLearning/quiz/*` does not rely on `is_correct` before removing it.
- Payment/webhook changes must be validated in Stripe test mode.
- Deprecated endpoints (e.g. unmounted `getCoursesByCategoryId`) may be deleted once confirmed unreferenced.

---

## 6. Implementation

Refactor endpoints incrementally.

```text
Analyze
  ↓
Refactor
  ↓
Test
  ↓
Update frontend
  ↓
Verify
```

Per-endpoint procedure:
1. **Analyze** — trace route → middleware → controller → repository → SQL → consumers (use `backend-audit.md` §12).
2. **Refactor** — move logic into the module service; keep path and response shape stable; add validators/authorization; reduce DB calls; add transactions where needed.
3. **Test** — lint (`npx eslint .`) and, once tooling exists, integration tests for the endpoint.
4. **Update frontend** — adjust consumers only if the contract changed; update both apps if shared.
5. **Verify** — smoke-test the flow end to end; confirm no regressions in other consumers.

### Sequencing

| Phase | Endpoints | Rationale |
|---|---|---|
| 1 | Shared helpers (`sendSuccess`, ownership, `withTransaction`) | Enables all later work, no behavior change |
| 2 | Auth + users + password reset | Highest security value |
| 3 | Courses + catalog list/detail | Fix broken filters/soft-delete; public-facing |
| 4 | Content + learn + dashboard-details | Fix schema drift, ownership, query count |
| 5 | Learning (enroll/progress/completions) | Enrollment enforcement + transactions |
| 6 | Reviews + certificates | Business rules + response cleanup |
| 7 | Subscriptions + webhook | Highest risk, last |
| 8 | Admin | Depends on domains above |
| 9 | Global API cleanup | Response/error/pagination consistency |

### Non-negotiables
- No endpoint path changes without a consumer migration.
- No behavior changes bundled with structural moves unless in scope.
- Preserve middleware order and the webhook's position before `express.json()`.
- Keep `.env` untracked; never expose secrets.
- Run lint after every change and build the frontends when their consumers change.

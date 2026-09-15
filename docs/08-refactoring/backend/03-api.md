# Backend API Refactor Plan

Plan to standardize and simplify the `/api/v1` surface. Part of the backend refactor
series under `docs/08-refactoring/backend/`. See also [`./01-structure.md`](./01-structure.md),
[`./02-migration-plan.md`](./02-migration-plan.md), and the origin audit-based plan
[`../api-refactor-plan.md`](../api-refactor-plan.md) (traces in [`../backend-audit.md`](../backend-audit.md) §12).

> **Status:** ✅ Implemented (2026-09-15). AP-1…AP-6 complete — see
> [`../../09-implement/tasks/api-refactor.md`](../../09-implement/tasks/api-refactor.md).
> Residual: admin subscriptions UI pagination controls are deferred (lists bounded at 100).

---

## 1. Goals

- Standardize API behavior (URLs, methods, status codes, envelope).
- Complete request validation on every write endpoint.
- Make pagination/filtering/sorting predictable and safe.
- Confirm authorization/ownership on protected resources.
- Stop exposing internal errors or unnecessary data.
- Reduce duplicated endpoint logic and keep controllers thin.
- Do not break existing consumers without a migration plan.

---

## 2. API Standards

All APIs should use:

- Consistent URL naming
- Correct HTTP methods
- Appropriate status codes
- Request validation
- Consistent response structure
- Consistent error structure

### 2.1 Request flow

```text
Request
  ↓
Validation
  ↓
Authentication / Authorization
  ↓
Controller
  ↓
Service
  ↓
Repository
```

Rules:
- Routes wire middleware and controllers only.
- Controllers read input, call one service method, and return the standard response. No business logic, no SQL.
- Services own business rules, authorization decisions, and transactions; no `req`/`res`.
- Repositories own parameterized SQL only.
- Cross-module calls go through the other module's **service** (see [`./01-structure.md`](./01-structure.md) §4).

### 2.2 URL naming

- Resource-oriented, plural nouns: `/courses`, `/reviews`, `/subscriptions`.
- Nested resources express ownership: `/courses/:id/modules`, `/lessons/:id/contents`.
- Keep existing paths stable; **do not rename public routes without a consumer migration.**

### 2.3 HTTP methods

| Action | Method |
|---|---|
| List / read | `GET` |
| Create | `POST` |
| Partial update | `PATCH` |
| Delete | `DELETE` |

### 2.4 Status codes

| Situation | Code |
|---|---|
| Read | 200 |
| Create | 201 |
| No body | 204 |
| Bad input (FK, not-null, invalid) | 400 |
| Not authenticated | 401 |
| Wrong role/ownership | 403 |
| Not found (missing parent resource) | 404 |
| Conflict (unique) | 409 |
| Validation error | 422 |
| Rate limited | 429 |
| Server error | 500 |

> **Delete caveat:** the admin service layer calls `res.json()` unconditionally, so a
> successful delete must return `200` with the standard envelope — **not `204`** — unless
> the admin services are updated in the same change.

### 2.5 Response structure

```json
{
  "success": true,
  "statusCode": 200,
  "message": "OK",
  "data": {},
  "pagination": { "totalItems": 42, "currentPage": 1, "totalPages": 5, "limit": 10 }
}
```

- Built by `sendSuccess` (`common/http/response.js`).
- Lists include top-level `pagination`; mutations include `data` (or `data: null`).
- No `status` (vs `statusCode`), no `{ users, total }` wrappers, no `query` echo, no nested `data: { data, pagination }`.
- Protocol exceptions: the Stripe webhook returns Stripe's expected `{ received: true }`; the error handler owns the failure envelope.

### 2.6 Error structure

```json
{ "success": false, "statusCode": 422, "message": "..." }
```

- Services throw `ApiError`; controllers never hand-craft errors.
- The central handler maps SQLSTATE codes (`error-handler.js`) and hides stacks outside development.
- 5xx responses are logged; 4xx are not.

### 2.7 Null semantics (intentional)

`200` with `data: null` is a valid "not present yet" state for learner sub-resources,
and must not be double-wrapped (`data: { data: null }`) or turned into `404` (D-13):

| Endpoint | `data: null` means |
|---|---|
| `GET /users/me` (guest) | Not authenticated; guest session (D-10) |
| `GET /courses/:id/enrollments` | Not enrolled yet |
| `GET /courses/:id/progresses` | No progress started |
| `GET /lessons/:id/completions` | Lesson not completed |
| `GET /courses/:id/reviews/me` | No review written |
| `GET /courses/:id/certificates` | No certificate claimed |
| `GET /subscriptions/user-active` | No active paid subscription |

`404` is reserved for a missing **parent** resource (e.g. course or lesson not found).

---

## 3. Query APIs

Use pagination, filtering, and sorting where appropriate.

- Lists use `AdvancedQuery` (`common/query/advanced-query.js`) with **field whitelists only** (`filterMap`/`sortMap`).
- Params: `page`, `limit` (capped), `sort` (`-field` desc), `search`, domain filters with `[gte]/[gt]/[lte]/[lt]`.
- `limit` must be capped and must reject non-finite values (`NaN`, `Infinity`).
- Alias filters must resolve to valid SQL in both `WHERE` and `ORDER BY` (e.g. course `rating`/`duration`).
- Count strategy must not re-run the aggregate base unnecessarily.

**Rollout scope (D-12):** paginate lists that can grow (courses, reviews, admin users,
admin subscriptions, `certificates/mine`); small bounded child collections
(chapters, lesson contents, questions, objectives) stay unpaginated and documented.

---

## 4. Current-State Audit

Static review of `backend/src` (2026-09-15). 97 endpoints across 22 routers.

### 4.1 Validation gaps (write endpoints)

| Gap | Endpoints | Evidence |
|---|---|---|
| DELETE without `:id` validator + `validateResult` | all 13 DELETEs (categories, courses, objectives, modules, chapters, lessons, contents, questions, options, admin users, admin plans/user-subs/payments) | route files (`*.routes.js`) |
| POST without any validator | `POST /courses/:courseId/certificates` (claim) | `modules/certificates/routes.js:10` |

Public auth/reset writes, self-service learner writes (enroll/progress/completion/review/vote/report),
and the Stripe webhook are intentionally without `authorize`; their validators already exist.
See `api-refactor-plan.md` §3.4 for the historical list (most P0 items are now implemented).

### 4.2 Response-contract issues

| Issue | Location |
|---|---|
| Pagination nested inside `data` (`data.data` + `data.pagination`) | `modules/courses/controller.js:89-102` (`/in-progress`, `/completed`) |
| `{ users, total }` instead of `pagination` | `modules/admin/users.controller.js:6-10`, `admin/users.service.js:12-21` |
| Unbounded raw-array lists | `categories`, `certificates/mine`, admin plans/user-subscriptions/payments |
| PATCH returns `201` + "created" | `modules/learning/controller.js:44-57` (`PATCH /progresses`) |
| Wrong delete/plural messages | `content/controller.js:24,167-176`, `courses/controller.js:156-164` |
| Inconsistent delete payload (row vs `null`) | `content/controller.js:43,90,121,220` |

No controller hand-writes the success envelope; `status` vs `statusCode` is resolved.

### 4.3 Pagination/filter issues

| Issue | Location |
|---|---|
| `limit` uncapped; `Infinity` → invalid SQL | `common/query/advanced-query.js:144-176` |
| `parseInt` `NaN`/negative page → 500 | `admin/users.service.js:15-16` → `users/repository.js:159-177` |
| Alias filter guard absent (object/plain-key values) | `advanced-query.js:34-76`, `courses/repository.js:130-131` |
| Dead `limitFields()` raw-concatenation injection surface | `advanced-query.js:131-139` (never called) |
| Hardcoded `LIMIT`, no page metadata | `courses/repository.js:326-436` (`recently-viewed`/`recommended`/`popular`) |

### 4.4 Authorization / ownership

- Ownership is enforced in the service layer via `assertOwnership` (`common/auth/ownership.js`), called from `content/service.js` and `courses/service.js`.
- `GET /lessons/:id/questions` is **public** and returns `is_correct` + `explanation` (`content/lesson.repository.js:120-141`).
- Confirm ownership on `/courses/:id/dashboard-details` and `/courses/:id/learn`.
- Modules still marked `—` for ownership: auth, users, categories, learning, reviews, certificates, subscriptions (overlaps BM-3).

### 4.5 Data exposure

- Latent: `auth/service.js:63-65` `getUserById` returns `User.findById` without stripping `password`.
- `GET /users/dashboard-data` returns instructors; confirm no hash and bound the list.
- `GET /lessons/:id/questions` answer key (see §4.4).

### 4.6 Null semantics

Endpoints returning `200 data:null` when the sub-resource is absent: `/users/me` (guest),
`/courses/:id/enrollments`, `/courses/:id/progresses`, `/lessons/:id/completions`,
`/courses/:id/reviews/me`, `/courses/:id/certificates`, `/subscriptions/user-active`.
Frontend guards treat these as valid "not present yet" states (D-13).

---

## 5. Endpoint Review Matrix

Legend: ✅ good · ⚠ needs work · ❌ missing/broken · N/A not applicable.
Status is the **current** code, not the original audit.

| Endpoint | Validation | Auth/ownership | Envelope | Pagination | Status | Notes |
|---|---|---|---|---|---|---|
| `POST /users/register` | ✅ | N/A | ✅ | N/A | ✅ | Transaction + 409 in place |
| `POST /users/login` | ✅ | N/A | ✅ | N/A | ✅ | Limiter wired |
| `GET /users/me` | N/A | ⚠ guest 200/`null` | ✅ | N/A | ✅ | Intentional (D-10) |
| `POST /users/logout` | N/A | ✅ | ✅ | N/A | ✅ | |
| `PATCH /users/update-password` | ✅ | ✅ | ✅ | N/A | ✅ | |
| Password reset trio | ✅ | N/A | ✅ | N/A | ✅ | HMAC + generic responses |
| `GET /users/profile` | N/A | ✅ | ✅ | N/A | ✅ | |
| `PATCH /users/profile` | ✅ | ✅ | ✅ | N/A | ✅ | |
| `GET /users/xp-earned` | N/A | ✅ | ✅ | N/A | ✅ | |
| `GET /users/dashboard-data` | N/A | ✅ | ✅ | ⚠ instructors unbounded | ⚠ | AP-5.2 |
| `POST /users/payment-stripe/:id` | ✅ | ✅ | ✅ | N/A | ✅ | |
| `GET /categories` | N/A | N/A | ✅ | ⚠ unbounded (small) | ✅ | D-12 |
| `POST/PATCH /categories` | ✅ | ✅ | ✅ | N/A | ✅ | |
| `DELETE /categories/:id` | ❌ | ✅ | ✅ | N/A | ⚠ | AP-2.1 |
| `GET /courses` | ✅ | N/A | ✅ | ✅ | ⚠ | Alias-filter guard (AP-3.7) |
| `POST/PATCH /courses` | ✅ | ✅ | ✅ | N/A | ✅ | |
| `DELETE /courses/:id` | ❌ | ✅ | ✅ | N/A | ⚠ | AP-2.1 |
| `GET /courses/:id` | N/A | N/A | ✅ | N/A | ✅ | |
| `GET /courses/:id/learn` | N/A | ⚠ | ✅ | N/A | ⚠ | AP-4.2 |
| `GET /courses/:id/dashboard-details` | N/A | ⚠ ownership | ✅ | N/A | ⚠ | AP-4.2 |
| `GET /courses/dashboard` | N/A | ✅ | ✅ | ✅ | ✅ | |
| `GET /courses/in-progress` | N/A | ✅ | ❌ nested pagination | ⚠ | ⚠ | AP-1.1 |
| `GET /courses/completed` | N/A | ✅ | ❌ nested pagination | ⚠ | ⚠ | AP-1.1 |
| `GET /courses/recently-viewed` | N/A | ✅ | ✅ | N/A (bounded) | ✅ | D-12 |
| `GET /courses/recommended` | N/A | ✅ | ✅ | N/A (bounded) | ✅ | D-12 |
| `GET /courses/popular` | N/A | N/A | ✅ | N/A (bounded) | ✅ | D-12 |
| Objectives writes | ✅ | ✅ | ✅ | N/A | ✅ | DELETE missing validator |
| `DELETE /objectives/:id` | ❌ | ✅ | ✅ | N/A | ⚠ | AP-2.1 |
| Content writes (modules/chapters/lessons/contents) | ✅ | ✅ | ⚠ messages | N/A | ⚠ | AP-1.3, AP-2.1 |
| `GET /lessons/:id/questions` | N/A | ❌ public | ✅ | ⚠ unbounded | ❌ | AP-4.1 (D-11) |
| Option writes | ✅ | ✅ | ✅ | N/A | ✅ | DELETE missing validator (AP-2.1) |
| Enrollment/progress/completion writes | ✅ | ⚠ ownership | ⚠ PATCH 201 | N/A | ⚠ | AP-1.2, AP-4.3 |
| Reviews writes | ✅ | ⚠ ownership | ✅ | ✅ list | ⚠ | AP-4.3 |
| Certificates | ⚠ claim | ✅ | ✅ | ⚠ `mine` unbounded | ⚠ | AP-2.2, AP-3.5 |
| Subscriptions user routes | N/A | ✅ | ✅ | N/A | ✅ | |
| Admin users | ✅ writes | ✅ | ❌ `{users,total}` | ⚠ NaN limit | ⚠ | AP-3.2/3.3 |
| Admin subscriptions | ✅ writes | ✅ | ❌ raw arrays | ⚠ | ⚠ | AP-3.4 |
| `POST /stripe-webhook` | N/A | signature ✅ | protocol | N/A | ✅ | Idempotent + transactional |

---

## 6. Compatibility

Before changing an endpoint:
- Identify frontend consumers (see §6.1).
- Check request/response dependencies.
- Avoid breaking existing features.
- Update frontend consumers when necessary.
- Remove deprecated endpoints only after migration.

### 6.1 Consumer map

| Endpoint | Learner consumer | Admin consumer |
|---|---|---|
| `/users/register`, `/users/login`, `/users/logout` | `frontend/src/api/auth.js` | `admin/src/services/AuthApi.js` |
| `/users/me` | `frontend/src/api/users.js` + `hooks/queries/useAuth.js` | `admin/src/services/UserApi.js` + `hooks/user/useGetMe.js` |
| `/users/profile` | `frontend/src/api/users.js` | `admin/src/services/UserApi.js` |
| `/courses` | `frontend/src/api/courses.js` | `admin/src/services/CourseApi.js` |
| `/courses/:id/learn` | `frontend/src/api/courses.js` | — |
| `/courses/:id/dashboard-details` | — | `admin/src/services/CourseApi.js` |
| `/courses/in-progress`, `/courses/completed` | `frontend/src/pages/InprogressDashboard.jsx`, `CompletedCourseDashboard.jsx` | — |
| `/courses/recently-viewed`, `/recommended`, `/popular` | `frontend/src/components/LearningDashBoard/*` | — |
| `/lessons/:id/questions` | `frontend/src/components/courseLearning/quiz/Quiz.jsx` | `admin/src/components/courseDetail/QuizItem.jsx` |
| `/courses/:id/reviews` (+ summary) | `frontend/src/api/courses.js` | — |
| `/reviews/:id/helpful-votes`, `/reports` | `frontend/src/api/reviews.js` | — |
| `/subscriptions/user-active` | `frontend/src/api/subscriptions.js` | — |
| `/users/payment-stripe/:id` | `frontend/src/api/users.js` | — |
| `/admin/*` | — | `admin/src/services/*Api.js` |
| `/stripe-webhook` | Stripe (external) | — |

### 6.2 Consumer risk notes (verified)

| Change | Risk | Mitigation |
|---|---|---|
| Guest `/users/me` 200/`null` | Admin treats 200/`null` as guest | Keep (D-10) |
| Quiz `is_correct`/`explanation` | Learner scores client-side; removing breaks scoring | Gate route, keep fields (D-11) |
| `/in-progress`, `/completed` pagination | Client normalizes both shapes | Low risk (D-12) |
| Admin users `{users,total}` | Admin reads `data.data.users`/`total` | Update admin in same change |
| Admin subscriptions raw arrays | Admin reads `data.data` as array | Update admin in same change |
| Adding pagination to bounded lists | `client.js` wraps `{data,pagination}` | Only paginate growing lists (D-12) |
| Deletes → `204` | Admin services call `res.json()` | Keep `200` + envelope |
| Absent sub-resources → `404` | Frontend guards rely on `null` | Keep 200/`null` (D-13) |

### 6.3 Compatibility rules

- Preserve the response envelope and field names unless **both** consumers are updated in the same change.
- Frontend `api/client.js` unwraps `{ data, pagination }` when `pagination` is present; admin services return the full envelope.
- Payment/webhook changes must be validated in Stripe test mode.
- No endpoint path changes without a consumer migration.

---

## 7. Execution Phases

| Phase | Work | Rationale |
|---|---|---|
| 1 | Response/status standardization (AP-1) | Low risk, no consumer breakage |
| 2 | Validation completeness (AP-2) | Security + consistency |
| 3 | Query/pagination standardization (AP-3) | Requires consumer updates |
| 4 | Authorization/ownership (AP-4) | Correctness |
| 5 | Data exposure + null semantics (AP-5) | Security + documentation |
| 6 | Compatibility verification + docs (AP-6) | Close-out |

Per-endpoint procedure: **Analyze → Refactor → Lint → Update consumers → Verify.**
Task definitions and statuses live in [`../../09-implement/tasks/api-refactor.md`](../../09-implement/tasks/api-refactor.md).

---

## 8. Verification

- [ ] Backend: `npx eslint .` → 0 errors.
- [ ] Frontends touched: `npm run lint` + `npm run build`.
- [ ] Every write endpoint has a validator + `validateResult` (or a documented exception).
- [ ] No response uses `status`, nested pagination, `{users,total}`, or `query` echo.
- [ ] `limit` is capped and rejects `NaN`/`Infinity`; no 500 from pagination params.
- [ ] Protected resources enforce `requireAuth` + `authorize` + ownership.
- [ ] No endpoint returns password hashes or the quiz answer key to anonymous callers.
- [ ] Changed contracts smoke-tested end to end in both apps.
- [ ] `docs/04-design/api-design.md` synced.

---

## 9. Rules

- One logical change at a time; keep controllers thin.
- Do not break existing consumers without a migration plan.
- Remove duplicated endpoint logic.
- Keep route paths, envelope shape, and middleware order stable unless intentionally changing them (with consumer updates).
- Keep the Stripe webhook before `express.json()`.
- No new frameworks, ORMs, or dependencies.
- Never commit `.env` or secrets.
- Update the task file and `progress-tracking.md` after each completed item.

---

## 10. Decisions

| # | Decision | Chosen | Date |
|---|---|---|---|
| D-10 | Guest `GET /users/me` semantics | Keep `200` + `data:null` (intentional) | 2026-09-15 |
| D-11 | Quiz answer-key exposure | Gate `GET /lessons/:id/questions` to authenticated enrolled learners; keep `is_correct`/`explanation`; server-side scoring deferred | 2026-09-15 |
| D-12 | Pagination rollout | Growing lists only; small child collections intentionally unpaginated | 2026-09-15 |
| D-13 | Absent sub-resource semantics | `200` + `data:null` is a valid "not present" state; `404` only for missing parent resources | 2026-09-15 |

Full log: [`../../09-implement/decisions.md`](../../09-implement/decisions.md).

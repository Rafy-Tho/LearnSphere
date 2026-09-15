# Backend Plan

Execution plan for refactoring `backend/` to the target architecture in [`architecture-plan.md`](./architecture-plan.md), based on findings in [`backend-audit.md`](./backend-audit.md) and [`codebase-audit.md`](./codebase-audit.md).

> **Status:** Proposed. No code migrated. Implementation begins only after approval.

---

## 1. Goals

- Improve backend maintainability
- Reduce coupling between layers
- Improve API performance
- Strengthen security
- Make features easier to test
- Keep existing business behavior unless intentionally changed

---

## 2. Target Structure

Use **module-based architecture + shared infrastructure**.

```text
backend/src/
├── app/                      # express app, middleware pipeline, route registry
├── config/                   # env (validated), database pool, cloudinary, stripe
├── db/                       # migrations + schema baseline (see backend/02-migration-plan.md)
├── modules/
│   ├── auth/                 # register, login, logout, session, password reset
│   ├── users/                # profiles, roles, status, admin user management
│   ├── categories/           # catalog categories
│   ├── courses/              # courses + objectives
│   ├── content/              # modules, chapters, lessons, lesson contents, quizzes, options
│   ├── learning/             # enrollments, progress, lesson completion, XP
│   ├── certificates/         # eligibility, claim, lookup
│   ├── reviews/              # reviews, helpful votes, reports
│   ├── subscriptions/        # plans, user subscriptions, payments, Stripe webhook
│   └── admin/                # admin orchestration across modules
├── common/                   # errors, responses, validation, auth, query, transactions, logging
└── server.js                 # bootstrap + graceful shutdown
```

Each module contains:

```text
modules/<feature>/
├── routes.js
├── controller.js
├── service.js
├── repository.js
├── validation.js
└── constants.js     # optional
```

> The template's `notes`/`notebooks` do not exist in this project; the modules above are the actual domains.

---

## 3. Layer Responsibilities

### Routes
- Define endpoints
- Apply required middleware
- Connect routes to controllers

### Controllers
- Read request data
- Call services
- Return responses
- No business logic
- No direct database access

### Services
- Contain business logic
- Coordinate repositories
- Handle business rules
- Do not depend on Express `req`/`res`
- Own transactions and authorization decisions
- Are the only cross-module entry point

### Repositories
- Handle database operations
- Keep SQL/database logic isolated
- Return application-level data
- Never import Express or services

### Middleware
Handle cross-cutting concerns such as:
- Authentication (`requireAuth`)
- Authorization (`authorize`)
- Rate limiting
- Request validation (`validateResult`)
- Error handling
- Request logging / request id

### Common infrastructure
- `ApiError` + SQLSTATE → HTTP mapping
- `sendSuccess` response + pagination helper
- Reusable `express-validator` builders
- Ownership assertion helper
- `withTransaction(fn)` helper
- `AdvancedQuery` (safe field whitelists only)
- Structured logger

---

## 4. API Improvements

Standardize:
- Request validation
- Response format
- Error format
- HTTP status codes
- Pagination
- Filtering
- Sorting
- Authentication/authorization

Remove duplicated endpoint logic where possible.

Concrete actions (from the audit):

| Action | Evidence |
|---|---|
| Add validators to every write endpoint (options, enrollment, completions, payment, all admin routes) | `backend-audit.md` §6 |
| Enforce one response envelope; remove `status` vs `statusCode`, `{ users, total }`, `query` echo, missing `data` | `codebase-audit.md` §3.5 |
| Standardize pagination via `AdvancedQuery` for all list endpoints; add pagination to admin lists and dashboard-details | `backend-audit.md` §8.3 |
| Fix alias filters placed in `WHERE` (course `rating`/`duration`) | `backend-audit.md` §12.8 |
| Cap `limit`; reject `NaN` pagination params | `backend-audit.md` §12.17 |
| Centralize ownership checks (remove ~18 copies) | `codebase-audit.md` §3.3 |
| Add `authorize` + ownership to quiz options; ownership to dashboard-details | `backend-audit.md` §5 |
| Strip `is_correct`/explanations from learner quiz responses | `backend-audit.md` §14 |

---

## 5. Database & Performance

Review:
- Slow queries
- Missing indexes
- N+1 queries
- Unnecessary database calls
- Large result sets
- Repeated queries
- Transactions
- Pagination

Only optimize based on evidence from the audit.

Prioritized work (from `backend-audit.md` §13):

| # | Item | Evidence |
|---|---|---|
| 1 | Add indexes: `courses(category_id,instructor_id,status,deleted_at)`, `lesson_completion(user_id,course_id)`, `password_reset_codes(user_id)`, trigram on course name/description | PERF-4 |
| 2 | Consolidate `getCourseDetailsDashboard` from 8 queries to 1–2 aggregate queries + ownership check | PERF-2 |
| 3 | Rewrite `getAllCourses` (single count strategy, fix alias filters, soft-delete, cap limit) | PERF-1 |
| 4 | Simplify `getPopular` (use `enrollments`), `getRecommended`, in-progress/completed aggregates; extract shared aggregate CTE | PERF-3 |
| 5 | Replace admin load-all-then-find with `findById` | PERF-5 |
| 6 | Remove redundant existence queries | PERF-6 |
| 7 | Add `withTransaction`; wrap register/enroll/admin-user/reset/webhook | `backend-audit.md` §9 |
| 8 | Resolve schema drift (`lesson_content`, `lessons.access_type`, reset-code width, quiz unique) | `codebase-audit.md` §3.1 |
| 9 | Decide hard vs soft delete; make `deleted_at` consistent | `backend-audit.md` §8.5 |

---

## 6. Security

Improve:
- Authentication and session handling
- Authorization
- Input validation
- Rate limiting
- CORS
- CSRF protection where applicable
- Sensitive data exposure
- Error responses
- Security headers
- File uploads
- Secrets and environment configuration

Prioritized work (from `backend-audit.md` §14):

| # | Item | Evidence |
|---|---|---|
| 1 | Stop exposing `is_correct`/answer keys | Critical |
| 2 | Fix password reset (secure random, salted/HMAC hash, schema width) | High |
| 3 | Stop returning password hashes (dashboard, admin update); remove hardcoded temp password | High |
| 4 | Options authorization/ownership; add missing validators | High |
| 5 | Wire `loginLimiter`; add per-account throttling/lockout | High |
| 6 | Session invalidation on password change/reset; status check on auth | Medium |
| 7 | CSRF strategy + `sameSite` decision; add `helmet` | High |
| 8 | Env validation; remove `Origin`-based Stripe redirects | High/Medium |
| 9 | Enforce subscription/enrollment on enroll, completion, review | High |
| 10 | Webhook idempotency + transaction + `payment_status`/amount verification | Medium |
| 11 | Upload validation (magic bytes), stop serving `/uploads` publicly, remove committed file | Low/Medium |

Security work is coordinated with `security-plan.md` (to be created) and the frontends.

---

## 7. Error Handling & Logging

Use centralized error handling.

```text
Controller
    ↓
Service
    ↓
AppError
    ↓
Central Error Handler
    ↓
Consistent API Response
```

- Services throw `ApiError`; controllers never hand-craft error responses.
- The central handler maps SQLSTATE codes and hides internals in production.
- Logging should provide useful debugging information without exposing sensitive data.

Actions:
- Log 5xx errors in `errorHandler` (currently no logging).
- Add structured logging with request ids; enable access logging in all environments (currently dev-only).
- Map multer/upload errors to 400 (currently 500).
- Add `unhandledRejection`/`uncaughtException`/`SIGTERM` handling in `server.js`.

---

## 8. Testing

Add or improve:
- Unit tests for services
- Repository tests where useful
- Integration tests for important APIs
- Authentication/authorization tests
- Validation and error tests

No test tooling exists today. Recommended: Vitest + Supertest against a PostgreSQL test database provisioned from `schema.sql`. See `docs/06-testing/test-strategy.md` and `docs/06-testing/test-cases.md`.

Priority order:
1. Auth + session middleware.
2. Authorization (role + ownership).
3. Validation and error mapping.
4. Stripe webhook signature/idempotency.
5. Enrollment/progress/completion.
6. Subscription single-active invariant.

---

## 9. Refactoring Rules

- Refactor incrementally
- Preserve existing behavior unless intentionally changed
- Avoid unnecessary abstractions
- Avoid rewriting working code without a clear reason
- Test after each significant change
- Do not mix unrelated refactoring with feature changes

Additional project rules:
- Keep route paths, response shapes, and middleware order stable.
- Keep the Stripe webhook before `express.json()`.
- No new frameworks, ORMs, or dependencies without approval.
- Never commit `.env` or secrets.
- Run `npx eslint .` after backend changes.

---

## 10. Implementation Order

```text
Audit
  ↓
Shared backend infrastructure
  ↓
Auth
  ↓
Users
  ↓
Categories
  ↓
Courses
  ↓
Content
  ↓
Learning
  ↓
Reviews
  ↓
Certificates
  ↓
Subscriptions
  ↓
Admin
  ↓
API cleanup
  ↓
Performance optimization
  ↓
Security hardening
  ↓
Testing & final cleanup
```

Each module should be migrated and verified before moving to the next one.

> The template's `Notes`/`Notebooks` steps are replaced by this project's actual modules. `Subscriptions` (payments) is sequenced late because it carries the highest risk; `Admin` follows the domains it orchestrates.

### Per-module checklist

1. Create `modules/<feature>/` with routes/controller/service/repository/validation.
2. Move SQL into the repository; move business logic into the service.
3. Make the controller thin.
4. Add/complete validators and ownership checks.
5. Keep the public route path and response shape unchanged.
6. Run `npx eslint .` and smoke-test the affected endpoints.
7. Delete the old files only after verification.

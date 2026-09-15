# Architecture Plan

Target architecture for the Learning Online Platform (PERN), to be introduced incrementally. This plan is based on the findings in [`codebase-audit.md`](./codebase-audit.md), [`backend-audit.md`](./backend-audit.md), and [`frontend-audit.md`](./frontend-audit.md).

> **Status:** Proposed. No code has been migrated. See §7 for the migration principle.

---

## 1. Goals

- Improve maintainability
- Reduce coupling
- Improve backend and frontend performance
- Improve security
- Make features easier to develop and test
- Keep existing business behavior

---

## 2. Architecture Principles

- Feature-oriented organization
- Clear separation of responsibilities
- Thin controllers
- Business logic in services
- Database access isolated in repositories
- Validate input at system boundaries
- Consistent error handling
- Avoid unnecessary abstractions and dependencies

---

## 3. Backend Architecture

Use a **module-based architecture + shared infrastructure**.

```text
backend/src/
├── app/                      # app wiring: express app, middleware pipeline, route registry
├── config/                   # env, database pool, cloudinary, stripe
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
│   └── admin/                # admin-only orchestration (dashboard, cross-module management)
├── common/                   # cross-cutting: errors, response, pagination, ownership, validation builders, logger
└── server.js                 # process bootstrap, graceful shutdown
```

### Module internal shape

Each module owns its slice end to end:

```text
modules/<feature>/
├── routes.js                  # route definitions only
├── controller.js              # thin: parse request, call service, send response
├── service.js                 # business logic, authorization decisions, transactions
├── repository.js              # parameterized SQL, no HTTP/Express knowledge
├── validation.js              # express-validator schemas
└── constants.js               # feature-local constants (optional)
```

> **Scope note:** `admin/` is a cross-cutting module because admin endpoints orchestrate several domains (users, courses, subscriptions). It should call other modules' services, not duplicate their SQL.

### Backend dependency flow

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

- Controllers do not access the database directly.
- Services contain business logic.
- Repositories contain database operations.
- Services do not depend on Express `req`/`res`.
- Shared code must remain generic.
- Cross-module calls go through the other module's **service**, never its repository.
- Transactions are owned by services via a shared `withTransaction` helper.

### Shared infrastructure (`common/`)

| Concern | Contents |
|---|---|
| Errors | `ApiError`, SQLSTATE → HTTP mapping |
| Responses | `sendSuccess` / envelope helper + pagination metadata |
| Validation | reusable `express-validator` builders, `validateResult` |
| Auth | `requireAuth`, `authorize`, ownership assertion helper |
| Query | `AdvancedQuery` builder (with safe field whitelists) |
| Transactions | `withTransaction(fn)` client checkout/commit/rollback |
| Logging | structured logger + request id middleware |
| Config | validated env loader |

---

## 4. Frontend Architecture

Use a **feature-based architecture + shared components + application infrastructure**.

### Learner app (`frontend/src/`)

```text
frontend/src/
├── app/                      # providers, router, guards, query client
├── features/
│   ├── auth/                 # login, signup, password reset
│   ├── catalog/              # course browse, filters, course detail
│   ├── learning/             # learning layout, lesson player, quiz, progress
│   ├── reviews/              # review list, summary, votes, reports
│   ├── subscriptions/        # pricing, checkout, active subscription
│   ├── dashboard/            # learner dashboard sections
│   └── settings/             # profile, password, subscription settings
├── components/
│   ├── ui/                   # primitives (spinner, dialog, rating, pagination, skeletons)
│   └── common/               # shared composed components (cards, layout chrome)
├── layouts/                  # AppLayout, LearningLayout
├── pages/                    # route entry components (thin, compose features)
├── lib/                      # api client, query client, auth storage
├── hooks/                    # generic reusable hooks only
├── utils/                    # pure helpers
├── constants/                # app-wide constants
└── main.jsx
```

### Admin app (`admin/src/`)

```text
admin/src/
├── app/                      # providers, router, protected routes, theme
├── features/
│   ├── auth/
│   ├── dashboard/
│   ├── categories/
│   ├── courses/              # list + content builder (modules→chapters→lessons→content/quiz)
│   ├── subscriptions/        # plans, user subscriptions, payments
│   └── users/                # users + instructors
├── components/
│   ├── ui/                   # retained shadcn primitives (delete unused)
│   └── common/               # DataTable, FormModal, StatsCard, StatusBadge, confirm dialogs
├── layouts/                  # AdminLayout, sidebar
├── pages/
├── lib/                      # shared api client (mirrors learner client)
├── hooks/
├── utils/
├── constants/
└── main.jsx
```

Rules:

- Feature-specific code stays inside its feature.
- Reusable UI goes into `components/`.
- Application infrastructure goes into `app/` and `lib/`.
- Generic hooks go into `hooks/`.
- Avoid unnecessary global state.
- Avoid duplicated API logic.
- No `fetch` in components; hooks → services → single API client.
- One API client per app with consistent `data`/pagination unwrapping and shared 401 handling.

---

## 5. API Architecture

```text
Frontend
  ↓
API Client
  ↓
Backend API
  ↓
Controller
  ↓
Service
  ↓
Repository
```

APIs should have:

- Consistent validation
- Consistent responses
- Consistent errors
- Proper authentication/authorization
- Pagination/filtering where needed

### Response contract (single standard)

```json
{ "success": true, "statusCode": 200, "message": "OK", "data": {}, "pagination": { "page": 1, "limit": 10, "total": 42, "totalPages": 5 } }
```

- Lists always include `pagination`.
- Mutations include `data` (or `data: null`).
- No endpoint-specific shapes (e.g. `{ users, total }`, `query` echo, `{ received: true }` except the Stripe webhook).
- Status codes follow the existing mapping (`422` validation, `401/403` auth, `409` conflict, `404` not found).

### Authorization

- Every write endpoint: validator → `validateResult` → `requireAuth` → `authorize` → ownership assertion.
- Ownership checks centralized in a shared helper (removes ~18 duplicated copies).
- Learner-facing quiz responses must not include `is_correct`/answer explanations.

---

## 6. Security & Performance

Security and performance improvements should be handled based on findings from:

- [`security-plan.md`](./security-plan.md) *(to be created)*
- [`performance-plan.md`](./performance-plan.md) *(to be created)*

Until those exist, the authoritative findings are in [`backend-audit.md`](./backend-audit.md) §13–§14 and [`frontend-audit.md`](./frontend-audit.md).

Do not optimize or add security mechanisms without understanding the existing implementation and its impact.

Guiding constraints:

- Preserve existing middleware order; keep the Stripe webhook before `express.json()`.
- Security changes (CSRF, cookies, headers, rate limiting) must be coordinated across both frontends.
- Performance changes must preserve response shapes consumed by the frontends.
- Payment and schema changes require extra verification and a rollback path.

---

## 7. Migration Principle

The new architecture will be introduced **incrementally**.

```text
Audit
  ↓
Design
  ↓
Migrate one feature
  ↓
Test
  ↓
Verify
  ↓
Next feature
```

Do not rewrite the entire codebase at once.

### Per-feature migration checklist

1. Create the `modules/<feature>/` (or `features/<feature>/`) folder.
2. Move route/controller/service/repository/validator into the module shape.
3. Extract business logic from the controller into the service.
4. Centralize ownership/response/transaction helpers in `common/`.
5. Update imports; keep the public route path and response shape unchanged.
6. Run lint (`npx eslint .` backend; `npm run lint` frontends) and build frontends.
7. Smoke-test the feature against the API.
8. Remove the old files only after the new path is verified.

### Suggested migration order (lowest risk first)

1. **Shared infrastructure** — `common/` helpers (`ApiError`, response, validation, `withTransaction`, ownership) with no behavior change.
2. **auth** — highest security value; pair with the P0 fixes.
3. **categories** — small, isolated module.
4. **courses** — includes objectives and list/query paths.
5. **content** — modules/chapters/lessons/contents/quizzes/options.
6. **learning** — enrollments/progress/completions.
7. **reviews**.
8. **certificates**.
9. **subscriptions** — plans/payments/webhook (high risk, last among domain modules).
10. **admin** — orchestration module once domains are stable.
11. **Frontend features** — align each feature folder with the same sequence; start with `auth`, then `catalog`, then `learning`.

### Non-negotiables during migration

- No behavior changes bundled with structural moves unless explicitly in scope.
- No new frameworks, ORMs, state managers, or UI kits.
- Keep the response envelope and route paths stable.
- Preserve middleware order and the webhook placement.
- Never commit secrets; keep `.env` untracked.
- Run lint for every app touched and build the frontends.

---

## 8. Success Criteria

- Each feature is self-contained under `modules/` or `features/`.
- Controllers are thin; services hold business logic; repositories hold SQL only.
- Response and error shapes are consistent across the API.
- Ownership/authorization is enforced centrally and uniformly.
- Duplicated logic (duration subquery, ownership checks, response shaping, utils) is consolidated.
- Lint/build pass; behavior is unchanged for existing flows.

# Test Strategy

## 1. Current State

**There is no automated testing in this repository.**

- No test framework (Jest, Vitest, Mocha, etc.) in any `package.json`.
- No test files (`*.test.*`, `*.spec.*`) or `__tests__` directories.
- No `test` script in `backend`, `frontend`, or `admin`.
- No CI configuration.

Quality is currently enforced only by ESLint configs in all three apps. This document defines the strategy to adopt.

## 2. Testing Goals

| Goal | Description |
|---|---|
| Verify business rules | Ensure authorization, enrollment, subscription, and review rules hold. |
| Protect API contracts | Keep the response envelope and endpoint behavior stable. |
| Prevent regressions | Cover critical learner and admin flows. |
| Enable safe refactoring | Catch schema/query drift at build time. |

## 3. Recommended Tooling

| Layer | Tool | Rationale |
|---|---|---|
| Backend unit/integration | **Vitest** + **Supertest** | Fast, ESM-friendly, works with the existing `app` export. |
| Database | Test PostgreSQL schema/database | Repositories use raw SQL; test against a real Postgres. |
| Frontend components | **Vitest** + **React Testing Library** | Matches Vite; tests behavior over implementation. |
| Frontend hooks/API | **MSW** (Mock Service Worker) | Mock `/api/v1` at the network layer. |
| End-to-end | **Playwright** | Covers auth, enrollment, learning, admin CRUD. |
| Coverage | Vitest `c8`/`v8` coverage | Track coverage per app. |

## 4. Test Pyramid

```text
        /\
       /  \      E2E (Playwright)        ~10%
      /----\
     /      \    Integration/API         ~30%
    /--------\
   /          \  Unit (services/utils)   ~60%
  /------------\
```

## 5. What to Test by Layer

### 5.1 Backend Unit

- `HashService` (hash/verify), `HashCode` (deterministic SHA-256), `SessionService`.
- `AdvancedQuery` builder (filters, operators, sort, pagination).
- Validators (`common.validator.js` builders and domain schemas).
- `errorHandler` SQLSTATE mapping.

### 5.2 Backend Integration (API)

- Route + middleware + controller + repository against a test database.
- Authentication/session behavior.
- Authorization (role and ownership).
- Validation error responses (422).
- Pagination/filter/sort behavior.
- Webhook signature verification with mocked Stripe events.

### 5.3 Frontend Unit/Component

- API client (`credentials`, 401 handling, pagination unwrapping).
- Form validation and submission states.
- Guards (`ProtectRoute`, `IsAuthenticate`, `RedirectToFirstLesson`).
- Key components (course card, quiz state machine, review summary).

### 5.4 Frontend Integration

- Hooks with MSW-mocked endpoints.
- Query invalidation on mutations.

### 5.5 End-to-End

- Register → login → browse → enroll → complete lesson → review.
- Quiz attempt.
- Subscription checkout (Stripe test mode).
- Admin: create category → create course → add content → publish.
- Admin: manage users/subscriptions/payments.

## 6. Test Environments

| Environment | Purpose | Database |
|---|---|---|
| Local | Developer runs | Local Postgres test DB |
| CI | Automated | Ephemeral Postgres service container |

Each test run should apply `backend/src/db/schema.sql` to a fresh database. Because there are no migrations, the schema file is the source of truth for tests.

## 7. Coverage Targets

| Area | Target |
|---|---|
| Backend services/utils | 90% |
| Backend controllers/routes | 75% |
| Frontend API client + hooks | 70% |
| Critical E2E flows | 100% of documented flows |

## 8. Naming Conventions

- Test files colocated or in `__tests__`, named `<subject>.test.js` / `<subject>.test.jsx`.
- Describe blocks by unit (`describe("CourseRepository")`).
- Test names state behavior: `it("returns 403 when a learner edits a course")`.

## 9. CI Recommendation

```yaml
# .github/workflows/ci.yml (proposed)
name: CI
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    services:
      postgres:
        image: postgres:16
        env:
          POSTGRES_PASSWORD: postgres
        ports: ['5432:5432']
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: '22.22.2'
      - run: cd backend && npm ci && npx eslint .
      - run: cd frontend && npm ci && npm run lint && npm run test
      - run: cd admin && npm ci && npm run lint && npm run test
```

## 10. Priority Order for Adoption

1. Backend integration tests for auth, authorization, and validation.
2. `AdvancedQuery` and error-handler unit tests.
3. E2E smoke test (login + enroll + lesson).
4. Frontend API client and guard tests.
5. Admin CRUD E2E.
6. Payment webhook tests.

## 11. Known Risks Tests Should Cover

- Schema drift (`lesson_contents`, `lessons.access_type`, reset-code length).
- One-active-subscription invariant.
- Ownership checks on content mutations.
- Option POST authorization gap.
- HTML sanitization.

See `test-cases.md` for concrete cases.

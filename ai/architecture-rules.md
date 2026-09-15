# Architecture Rules (for AI Agents)

These rules define the architectural boundaries you must preserve. Violations should be treated as bugs.

> **Backend refactor (structure complete):** the backend now uses the module-based structure (`app/`, `config/`, `db/`, `common/`, `modules/`). Target: [`docs/08-refactoring/backend/01-structure.md`](../docs/08-refactoring/backend/01-structure.md), status: [`docs/09-implement/progress-tracking.md`](../docs/09-implement/progress-tracking.md).

## 1. Backend Layering

```
routes → validators → middlewares → controllers → services / repositories → pg pool
```

- **Routes** may only wire middleware and controllers. No business logic, no SQL.
- **Controllers** orchestrate: validate ownership, call repositories/services, shape responses. No raw SQL.
- **Repositories** own all SQL. They must not know about HTTP, `req`, or `res`.
- **Services** hold reusable cross-cutting logic (session, hashing, email).
- **Never** bypass layers (e.g. a route calling a repository directly, or a repository reading `req`).

## 2. Request Pipeline

- Preserve middleware order in `backend/src/app/app.js`:
  1. `trust proxy`
  2. CORS
  3. **Stripe webhook (raw body) before `express.json()`**
  4. body parsers
  5. logging
  6. global rate limiter
  7. session
  8. static uploads
  9. routers
  10. 404
  11. error handler
- Do not move the webhook router after JSON parsing; it will break signature verification.

## 3. Routing

- Nested routers use `express.Router({ mergeParams: true })` and rely on the parent `:id`.
- Routers that only define `/` and use a parent `:id` must not be relied upon at the top level.
- Apply router-level guards for admin routers (`requireAuth`, `authorize(ADMIN)`).

## 4. Responses & Errors

- Always return `{ success, statusCode, message, data }`; add `pagination` for lists.
- Throw `ApiError` for expected failures; let the central `errorHandler` format them.
- Wrap async controllers with `asyncHandler`.
- Do not catch-and-swallow errors; forward to `next`.

## 5. Data Access

- Parameterized SQL only (`$1`, `$2`). Never string-concatenate user input.
- Repositories are singletons exported as default.
- Map camelCase inputs to snake_case columns explicitly.
- Filter soft-deleted courses (`deleted_at IS NULL`).
- Use `AdvancedQuery` (`backend/src/common/query/AdvaceQuery.js`) for paginated/filtered/sorted lists.
- Keep SQL in repositories even when it spans multiple tables.

## 6. Schema

- `backend/src/db/schema.sql` is the source of truth.
- There are **no migrations**. Any schema change must be reflected in `schema.sql` and documented.
- When changing schema, check all repositories for the affected columns/tables.
- Do not add a migration tool without explicit approval.

## 7. Frontend Boundaries

- Components do not call `fetch`; they use hooks, which use services.
- Server state lives in React Query; do not duplicate it in Context.
- Auth state lives in `AuthContext`; theme in `ThemeContext`.
- Filters/pagination live in the URL.
- Reuse existing UI primitives; do not add a new component library.
- Admin mutations must invalidate the relevant query keys.

## 8. Integrations

- Stripe, Cloudinary, and Brevo are accessed only from the backend.
- Never expose server keys to the frontend. Only `VITE_*` variables are client-visible.
- Email is sent via the Brevo REST API (`EmailService`); `nodemailer`/`resend` are unused.

## 9. Do Not

- Introduce an ORM or query builder library.
- Introduce Redux/Zustand/MobX.
- Add a second UI kit.
- Change the response envelope.
- Remove or reorder critical middleware.
- Hardcode secrets, URLs, or environment values.

## 10. When Unsure

- Follow the closest existing pattern in the same layer.
- Prefer minimal, additive changes.
- Ask before changing cross-cutting behavior (auth, sessions, payments, schema).

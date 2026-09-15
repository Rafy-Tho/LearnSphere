# Backend Structure

Target folder structure for `backend/`. Part of the backend refactor series under `docs/08-refactoring/backend/`. See also [`../architecture-plan.md`](../architecture-plan.md) and [`../backend-plan.md`](../backend-plan.md).

> **Status:** Proposed. No code moved.

---

## 1. Target Structure

```text
backend/src/
├── app/
│   ├── app.js
│   ├── routes.js
│   └── middleware.js
├── config/
├── db/
│   ├── migrations/
│   ├── migrate.js
│   ├── schema.sql
│   └── README.md
├── modules/
│   ├── auth/
│   ├── users/
│   ├── categories/
│   ├── courses/
│   ├── content/
│   ├── learning/
│   ├── certificates/
│   ├── reviews/
│   ├── subscriptions/
│   └── admin/
├── common/
└── server.js
```

> The template's `notes/` and `notebooks/` are placeholders; the modules above are this project's actual domains. `admin/` is a cross-cutting module that orchestrates users, courses, and subscriptions.

### 1.1 `app/`

| File | Responsibility |
|---|---|
| `app.js` | Create the Express app; register middleware and routes; attach the error handler. |
| `routes.js` | Central route registry: mount each module router under `/api/v1`. |
| `middleware.js` | Compose the global middleware pipeline in the required order. |

### 1.2 `config/`

| File | Responsibility |
|---|---|
| `env.js` | Load and **validate** environment variables; fail fast on missing values. |
| `database.js` | PostgreSQL pool + `withTransaction` helper. |
| `cloudinary.js` | Cloudinary configuration. |
| `stripe.js` | Stripe client and webhook secret wiring. |

### 1.3 `db/`

| File | Responsibility |
|---|---|
| `migrations/` | Ordered, versioned SQL migrations (see [`02-migration-plan.md`](./02-migration-plan.md)). |
| `migrate.js` | Minimal migration runner (uses the existing `pg` pool, no new deps). |
| `schema.sql` | Canonical baseline schema for fresh installs. |
| `README.md` | How to run migrations. |

### 1.4 `modules/`

One folder per feature domain. Each owns its routes, controller, service, repository, and validation.

| Module | Owns |
|---|---|
| `auth/` | register, login, logout, session, password reset |
| `users/` | profiles, roles, status, admin user management |
| `categories/` | catalog categories |
| `courses/` | courses + objectives |
| `content/` | modules, chapters, lessons, lesson contents, quizzes, options |
| `learning/` | enrollments, progress, lesson completion, XP |
| `certificates/` | eligibility, claim, lookup |
| `reviews/` | reviews, helpful votes, reports |
| `subscriptions/` | plans, user subscriptions, payments, Stripe webhook |
| `admin/` | admin-only orchestration across modules |

### 1.5 `common/`

| Area | Contents |
|---|---|
| Errors | `ApiError`, SQLSTATE → HTTP mapping |
| Responses | `sendSuccess` + pagination envelope |
| Validation | reusable `express-validator` builders, `validateResult` |
| Auth | `requireAuth`, `authorize`, ownership assertion helper |
| Query | `AdvancedQuery` builder (safe field whitelists) |
| Middleware | rate limiters, upload (multer), request id, logging |
| Utils | shared helpers used across modules |

### 1.6 `server.js`

Process entry point: connect/verify the database, start listening, and handle graceful shutdown (`SIGTERM`/`uncaughtException`/`unhandledRejection`).

---

## 2. Module Structure

Each feature module follows:

```text
module/
├── controller.js
├── service.js
├── repository.js
├── routes.js
└── validation.js
```

Add `constants.js` only when the module needs feature-specific constants.

### 2.1 Layer responsibilities inside a module

| File | Responsibility |
|---|---|
| `routes.js` | Endpoint definitions and middleware wiring only. |
| `controller.js` | Read request input, call one service method, return the standard response. No business logic, no SQL. |
| `service.js` | Business rules, authorization decisions, transactions, cross-module calls. No `req`/`res`. |
| `repository.js` | Parameterized SQL only. Returns application-level data. No HTTP/Express. |
| `validation.js` | `express-validator` schemas for the module's endpoints. |
| `constants.js` | Optional module-local constants. |

### 2.2 Example: `categories/`

```text
modules/categories/
├── routes.js
├── controller.js
├── service.js
├── repository.js
└── validation.js
```

```js
// routes.js
router.get("/", controller.getAll);
router.post("/", requireAuth, authorize(ADMIN), validation.create, validateResult, controller.create);

// controller.js
export const create = asyncHandler(async (req, res) => {
  const category = await service.create(req.body);
  return sendSuccess(res, category, { statusCode: 201, message: "Category created" });
});

// service.js
export const create = async (payload) => {
  const existing = await repository.findBySlug(payload.slug);
  if (existing) throw new ApiError(409, "Category already exists");
  return repository.create(payload);
};
```

---

## 3. Folder Responsibilities

- `app/` — application setup and global routes
- `config/` — configuration and infrastructure setup
- `db/` — migrations and schema baseline
- `modules/` — feature-specific backend code
- `common/` — shared utilities, middleware, errors, and constants
- `server.js` — application entry point

---

## 4. Structure Rules

- Feature-specific code stays inside its module.
- Shared code belongs in `common/`.
- Do not create folders without a clear responsibility.
- Avoid unnecessary abstraction layers.
- Keep the structure consistent across modules.

Additional rules for this project:
- Cross-module calls go through the other module's **service**, never its repository.
- Only `app/routes.js` mounts routers; modules do not mount each other.
- The Stripe webhook route is registered before `express.json()` (preserve this when wiring `app/middleware.js`).
- Keep route paths and response shapes unchanged during migration.
- No new frameworks, ORMs, or dependencies.

---

## 5. Current → Target Mapping

| Current | Target |
|---|---|
| `src/app.js` | `src/app/app.js` + `src/app/routes.js` + `src/app/middleware.js` |
| `src/configs/Env.js` | `src/config/env.js` |
| `src/configs/database.js` | `src/config/database.js` (+ `withTransaction`) |
| `src/configs/cloudinary.js` | `src/config/cloudinary.js` |
| `src/controllers/*.js` | `src/modules/<feature>/controller.js` |
| `src/services/*.js` | `src/modules/<feature>/service.js` or `src/common/` (cross-cutting) |
| `src/repositories/*.js` | `src/modules/<feature>/repository.js` |
| `src/routes/*.js` | `src/modules/<feature>/routes.js` |
| `src/validators/*.js` | `src/modules/<feature>/validation.js` |
| `src/middlewares/*.js` | `src/common/` (shared) |
| `src/utils/*.js` | `src/common/` (shared) |
| `src/constants/*.js` | `src/common/` or module-local `constants.js` |
| `src/helper/createRadomCode.js` | `src/common/` |
| `src/configs/schema.sql` | `src/db/schema.sql` (+ `src/db/migrations/`) |

### Suggested migration order

Shared infrastructure (`common/`, `config/`, `app/`) → `auth` → `users` → `categories` → `courses` → `content` → `learning` → `reviews` → `certificates` → `subscriptions` → `admin`.

Migrate and verify one module before starting the next. See [`../backend-plan.md`](../backend-plan.md) §10.

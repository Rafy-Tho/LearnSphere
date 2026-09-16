# Coding Standards

Conventions derived from the existing codebase. New code should match these patterns.

## 1. General

- JavaScript only (no TypeScript). JSDoc types may be used for clarity.
- Backend is ESM (`"type": "module"`); use `import`/`export`, not `require`.
- No comments unless they add real value; the codebase is written to be self-explanatory.
- Keep functions small and single-purpose; controllers orchestrate, repositories query.
- Never hardcode secrets or environment-specific values; use `environment.js` / `import.meta.env`.

## 2. Naming

| Element | Convention | Example |
|---|---|---|
| Files (backend) | camelCase or PascalCase by role | `courseControllers.js`, `CourseRepository.js` |
| Files (frontend components) | PascalCase | `CourseCard.jsx` |
| Files (hooks) | kebab-case | `use-get-courses.js` (admin), `useCourses.js` (frontend) |
| Classes | PascalCase | `ApiError`, `AdvancedQuery` |
| Functions/variables | camelCase | `getCourseDetails` |
| Constants | UPPER_SNAKE_CASE | `FILE_SIZE_LIMIT` |
| DB tables/columns | snake_case | `lesson_completion`, `xp_points` |
| Query keys | kebab/array | `['course-details', courseId]` |

## 3. Backend

### 3.1 Layering

- Routes define URL, middleware chain, and controller only.
- Controllers validate ownership, call repositories, and shape responses.
- Repositories contain all SQL and know nothing about HTTP.
- Services hold cross-cutting logic (session, hashing, email).
- Never call the database directly from a controller; always go through a repository.

### 3.2 Async & Errors

- Wrap async controllers with `asyncHandler` so rejections reach `errorHandler`.
- Throw `ApiError(statusCode, message)` for expected failures.
- Do not send error responses manually; rely on the central handler.

### 3.3 Responses

- Always return the envelope: `{ success, statusCode, message, data }`.
- List endpoints include `pagination`.
- Use status constants from `backend/src/common/constants/status-code.js`.

### 3.4 SQL

- Always use parameterized queries (`$1`, `$2`); never interpolate values.
- Map camelCase inputs to snake_case columns explicitly.
- Use `RETURNING *` / `RETURNING <cols>` on writes.
- Filter soft-deleted courses with `deleted_at IS NULL`.
- Prefer `LEFT JOIN` aggregates, `json_agg`/`jsonb_build_object`, and `COALESCE(..., 0)`.
- For list endpoints, use `AdvancedQuery` with `filterMap`/`sortMap` rather than hand-building pagination.

### 3.5 Validation

- Define validators in `backend/src/modules/<module>/validation.js` using shared builders from `backend/src/common/validation.js`.
- Always follow a validator with `validateResult`.
- Sanitize HTML through `htmlValidator`.

### 3.6 Authorization

- Apply `requireAuth` before `authorize`.
- Verify resource ownership in the controller using repository `getInstructor` lookups; allow `ADMIN` override.
- Do not trust client-supplied role/id fields.

## 4. Frontend (Learner & Admin)

### 4.1 Components

- Function components with hooks; no class components except error boundaries.
- One component per file; PascalCase filenames.
- Keep presentational components free of data fetching where practical.
- Use existing primitives (`ui/` in admin, `components/ui` in frontend) before adding new ones.

### 4.2 Data Fetching

- Use TanStack React Query for all server state.
- Define query/mutation hooks with their domain under `features/<domain>/hooks/` (frontend) or domain folders (admin).
- Mutations invalidate the relevant query keys.
- Access the API only through service modules; never call `fetch` directly in components.

### 4.3 Forms

- Use `react-hook-form` + `zodResolver` for forms that already follow that pattern.
- Show field errors from `formState.errors`.
- Disable submit while a mutation is pending.

### 4.4 Styling

- Tailwind utility classes only; no CSS modules or styled-components.
- Use the project's dark-mode variant (`@custom-variant dark` in frontend; `darkMode: ["class"]` in admin).
- Use `cn()` (admin) for conditional classes.

### 4.5 State

- Server state: React Query.
- Auth: server-derived via the `["me"]` query (no localStorage mirror).
- UI state: local `useState`; filters/pagination in the URL (`useSearchParams`).

### 4.6 Auth & Errors

- Send `credentials: "include"` on every request (handled by the API client/service).
- On 401, clear auth state and redirect to login (frontend API client already does this).

## 5. Linting

| App | Config | Notable rules |
|---|---|---|
| backend | `backend/eslint.config.mjs` | `no-unused-vars: warn`, `no-console: warn`, `no-undef: error` |
| frontend | `frontend/eslint.config.js` | react-hooks + react-refresh; `no-unused-vars` (ignore `^[A-Z_]`), `no-console: warn` |
| admin | `admin/eslint.config.js` | same as frontend |

Run `npm run lint` in `frontend/` and `admin/`. Backend has an ESLint config but **no lint script** — run `npx eslint .` in `backend/`.

## 6. File/Function Documentation

- No comment headers required.
- Prefer clear names over comments.
- Document only non-obvious decisions.

## 7. Anti-Patterns to Avoid

- Direct `fetch` calls in components.
- SQL string interpolation.
- Manually formatting error responses.
- Bypassing validators for write endpoints.
- Trusting the client for role/ownership.
- Adding a new state library (Redux/Zustand) — use React Query + Context.
- Adding a new UI kit — extend the existing primitives.

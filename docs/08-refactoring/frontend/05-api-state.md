# Frontend API & State

Standard for API communication and state management in the learner app (`frontend/`). The admin
dashboard (`admin/`) is **out of scope**. Part of the frontend refactor series under
`docs/08-refactoring/frontend/`.

See also [`01-architecture.md`](./01-architecture.md) §4–§5 and
[`../tasks/frontend-api-state.md`](../../09-implement/tasks/frontend-api-state.md).

> **Status:** Implemented. The learner app now follows this standard; see
> [`../../09-implement/tasks/frontend-api-state.md`](../../09-implement/tasks/frontend-api-state.md)
> for task-level status.

---

## 1. API

All backend communication flows through one path:

```text
Component
  ↓
Hook
  ↓
Feature Service
  ↓
API Client (lib/apiClient.js)
  ↓
Backend
```

### 1.1 API client responsibilities

`lib/apiClient.js` is the **single** transport owner. It owns:

- Base URL, credentials, and default headers (`Content-Type`, `X-Requested-With`).
- JSON serialization and `FormData` handling.
- Safe response parsing (empty/`204`/non-JSON bodies do not throw).
- Error normalization (`ApiError` carrying `statusCode`, `message`, and payload).
- The response contract (see §1.3).
- Global `401` handling (`clearUserQueries` + redirect, skipping auth routes).
- Request cancellation via `AbortSignal`.

It must not know about features, endpoints, or domain payload shapes.

### 1.2 Feature services

`features/<feature>/services/*.js` own endpoint paths and payload shapes.

- One service module per feature.
- Services call the shared `api` client only; they never call `fetch`.
- Services return the client result unchanged (no re-wrapping).
- Query strings are built by the client from a params object, not concatenated by callers.

### 1.3 Response contract

The client normalizes the backend envelope `{ success, statusCode, message, data, pagination }`:

| Call | Returns |
|---|---|
| `api.get/post/patch/put/delete/upload` | the unwrapped `data` (always) |
| `api.getPaginated` | `{ data, pagination }` (for list endpoints) |

- The default methods **never** return the pagination envelope; callers always receive `data`.
- Pagination is opt-in via `getPaginated`, so a list consumer always knows the shape.
- Empty responses resolve to `null`; they do not throw.

### 1.4 Errors

- Non-2xx responses throw an `ApiError` with `statusCode`, `message` (server message when
  present), and `data` (parsed payload when present).
- `401` (outside auth routes) clears user-scoped queries and redirects to `/login`.
- Components surface `error.message`; they never inspect raw response objects.

---

## 2. Query keys

All TanStack Query keys come from a single factory, `lib/queryKeys.js`.

- No inline key literals in hooks or components.
- Keys are grouped per feature; the first element is the stable root.
- Mutations invalidate through the factory, never by hand-built arrays.
- User-scoped roots are derived from the factory and used by `clearUserQueries`, so the two cannot
  drift.

---

## 3. State

Separate state by purpose:

| Type | Owner | Examples |
|---|---|---|
| **Server state** | TanStack Query | courses, curriculum, progress, reviews, profile, subscription |
| **Global client state** | React context | theme (localStorage); auth (derived from the `["me"]` query) |
| **Local state** | Component | form drafts, open/closed toggles, filters, pagination UI |

### 3.1 Rules

- Prefer server-state management for server data.
- Keep local state local when possible.
- Avoid putting everything into global state.
- Avoid duplicating server data in client state.
- The only global client state is **theme** (genuine client preference) and **auth** (a thin,
  server-derived projection of `["me"]`). Do not add more global state.
- No new state managers.

### 3.2 Local state rules

- A local mirror of server data is allowed only as a short-lived **form draft** while editing, and
  must be discarded on save/cancel.
- Mutation pending/error state comes from the mutation, not a parallel `useState`.
- Optimistic UI updates go through the query cache (`onMutate`/`onError`/`onSettled`), not a local
  mirror that can go stale on refetch.

---

## 4. Mutations & cache

- Invalidate or update cached data after every successful mutation.
- Prefer targeted invalidation via the key factory over broad invalidation.
- Invalidate every affected list/detail (e.g. completing a lesson affects progress, completions,
  dashboard, and certificate eligibility).
- Auth identity changes (`update profile`, `logout`, `401`) must keep `["me"]` coherent.
- Optimistic updates are used only where the interaction is immediate (helpful vote, report) and
  must roll back on error.

---

## 5. Loading, error, and empty states

- Query-driven views handle all three states explicitly.
- Loading uses `components/ui/SpinnerLoader`; errors use `components/ui/ErrorMessage`; empty uses
  `components/ui/EmptyState`.
- Do not render `null` in place of a loading state on a route-level view.
- Keep state handling consistent across features.

---

## 6. Current → Target

| Current | Target |
|---|---|
| `apiClient.request` returns `data` or `{ data, pagination }` depending on response | `data` by default; `{ data, pagination }` only from `getPaginated` |
| `response.json()` unconditional | safe parse (`null` on empty/`204`) |
| bare `Error(message)` | `ApiError` with `statusCode` + payload |
| services build `?${queryString}` | params object + client `buildQuery` |
| inline query-key literals (40) | `lib/queryKeys.js` factory |
| `USER_SCOPED_QUERY_ROOTS` hand-maintained in `queryClient.js` | derived from the key factory |
| several mutations invalidate nothing | every mutation invalidates affected keys |
| `ReviewCard` mirrors vote/report in `useState` | cache-backed optimistic update |
| `Subscription`/`PricingCard` local `isLoading` | `mutation.isPending` |
| loading/error/empty partially adopted | adopted consistently |

---

## 7. Definition of Done

- One API client; no `fetch` in components or services.
- Consistent response contract; normalized errors with status codes.
- All query keys come from the factory; no inline literals.
- Every mutation invalidates its affected keys.
- No duplicated server data in client state; the only global state is theme + server-derived auth.
- Loading/error/empty states use the shared primitives.
- `npm run lint` and `npm run build` pass in `frontend/`.
- Existing flows behave the same, except the explicitly scoped FS fixes.

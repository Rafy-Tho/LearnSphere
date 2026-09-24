# LearnSphere — Learner Frontend

The learner-facing React single-page application for [LearnSphere](../../README.md). It consumes the shared Express/PostgreSQL API (`/api/v1`) via cookie sessions.

## Tech Stack

- React 19, Vite 7, React Router 7
- TanStack React Query 5 (server state)
- React Hook Form + Zod (forms/validation)
- Tailwind CSS 4 (CSS-first, `@theme` tokens, class-based dark mode)
- React Toastify, Swiper, Lucide React, DOMPurify

## Structure

- `src/app/` — App composition (`App.jsx`, `providers.jsx`, `router.jsx`), providers (`AuthProvider`, `ThemeProvider`), guards (`RequireAuth`, `RedirectIfAuthenticated`, `RedirectToFirstLesson`).
- `src/features/<domain>/` — feature domains (`auth`, `catalog`, `learning`, `reviews`, `subscriptions`, `dashboard`, `settings`, `activity`, `saved`) with `pages/`, `components/`, `hooks/`, `services/`.
- `src/components/` — `ui/` primitives and `common/` composables.
- `src/lib/` — `apiClient.js` (envelope unwrapping, 401 auto-logout), `queryClient.js`, `queryKeys.js` (central key factory).
- `src/hooks/`, `src/constants/`, `src/utils/`, `src/layouts/` — cross-cutting infrastructure.

Data flow: components → hooks → feature services → `lib/apiClient.js` → backend. Components never call `fetch` directly; query keys are centralised in `lib/queryKeys.js` and invalidated after mutations.

## Commands

| Command | Description |
|---|---|
| `npm run dev` | Start Vite dev server |
| `npm run build` | Production build to `dist/` |
| `npm run lint` | ESLint (flat config) |
| `npm run preview` | Preview the production build |

## Environment

| Variable | Purpose |
|---|---|
| `VITE_BASE_URL` | Backend API base, e.g. `http://localhost:5000/api/v1` |

## Docs

- Root [`README.md`](../../README.md)
- [`docs/05-development/folder-structure.md`](../docs/05-development/folder-structure.md) §2
- [`docs/progress/frontend-user.md`](../docs/progress/frontend-user.md)
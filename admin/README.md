# LearnSphere — Admin Dashboard

The administrative React single-page application for [LearnSphere](../../README.md), serving platform **administrators** and **instructors** (role-gated) against the shared Express/PostgreSQL API (`/api/v1`).

## Tech Stack

- React 19, Vite 7, React Router 7
- TanStack React Query 5
- Tailwind CSS 3.4 + shadcn-style Radix UI primitives
- Lucide React, clsx + tailwind-merge, sonner-style toasts

## Structure

- `src/app/` — App composition (`App.jsx`, `router.jsx`), `AuthProvider`, guards (`RequireAuth`, `RedirectIfAuthenticated`, `RequireRole`), lazy-loaded routes inside `Suspense`.
- `src/features/<domain>/` — feature domains (`auth`, `dashboard`, `categories`, `users`, `courses`, `subscriptions`, `instructor`, `payouts`) with `pages/`, `components/`, `hooks/`, `services/`.
- `src/components/` — `ui/` shadcn-style primitives and `common/` composables (DataTable, FormModal, ConfirmDialog, StatusBadge, ...).
- `src/layouts/` — `AdminLayout` + `AdminSidebar` (role-filtered navigation).
- `src/lib/` — `apiClient.js`, `queryClient.js`, `queryKeys.js`, `utils.js`.
- `src/pages/` — `RoleHome.jsx` (admin vs instructor dashboard), `NotFound.jsx`, `NoAccess.jsx`.
- `src/constants/navItems.js` — role-filtered sidebar items.

## Roles

- **Admin** — Dashboard, Categories, Courses, Course Reviews, Subscriptions, Instructors, Users, Payouts.
- **Instructor** — Dashboard, My Courses, Earnings (ownership-scoped; cannot self-publish).

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
- [`docs/05-development/folder-structure.md`](../docs/05-development/folder-structure.md) §3
- [`docs/04-design/instructor-dashboard.md`](../docs/04-design/instructor-dashboard.md)
- [`docs/progress/frontend-admin.md`](../docs/progress/frontend-admin.md), [`docs/progress/instructor-dashboard.md`](../docs/progress/instructor-dashboard.md)
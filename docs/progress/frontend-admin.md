# Admin Dashboard Progress

**Status:** 🟢 Done (v1) — module-based backend plus feature-based frontend refactor complete and verified.

The `admin/` app is a separate React SPA (React 19, Vite 7, TanStack Query 5, Tailwind 3, shadcn/Radix) talking to the same API. It now mirrors the learner `frontend/` architecture: feature folders (`features/<feature>/{pages,components,hooks,services}`) backed by a shared `@/lib/apiClient` layer.

## Completed

### Architecture & infrastructure
- Feature-based layout: `lib/` (apiClient, queryClient, queryKeys, utils), `app/` (App, router, providers, guards), `layouts/`, `features/`, `components/` (shared + ui), `constants/`.
- `@/` alias (Vite + jsconfig) throughout; all feature pages/hooks/components import via `@/` — no relative `../` cross-feature imports.
- Response unwrapping centralized in `lib/apiClient.js` (`api.get/post/patch/delete` → `payload.data`; `api.getPaginated` → `{ data, pagination }`; `ApiError`; 401 auto-redirect). Feature services call `apiClient` only; no `fetch` in components.

### Features extracted (Phases 1–3.6)
- `features/auth/` — login + session (`useLogin`, `useGetMe`).
- `features/dashboard/` — `DashboardPage` + `StatsCard` + `use-get-dashboard-data`.
- `features/categories/` — CRUD page + 4 hooks, TanStack-Query-managed state.
- `features/users/` — Users/Profile pages + 6 hooks (list/create/update/delete, profile, password).
- `features/courses/` — Courses + CourseDetail pages, 14 course-detail components, composer/entity/question/option hooks, renamed option/question hooks (`use-create-option.js`, etc.).
- `features/subscriptions/` — Plans/Tabs/Page aligned with the **prepaid billing API**:
  - Plans: full CRUD (unchanged).
  - Subscriptions: read-only list + audited `POST /admin/subscriptions/override` (`use-subscription-override.js`) with required reason.
  - Payments: read-only list + refund issuance (`POST /admin/payments/:id/refunds`, `use-refund.js`); edit/create/delete payment UI removed.
  - Coupons (new): CRUD + activate/deactivate toggle (`/admin/coupons`, `PATCH /:id/status`) — `use-coupons.js`, `CouponsTab`, `CouponModal`.
  - Billing stats (new): `GET /admin/billing/stats` drives the `SubscriptionStats` cards (`use-billing-stats.js`); duplicate subscription hooks (`use-create/update/delete-subscription.js` with conflicting `['subscriptions']` query keys) removed.

### Verification
- `npm run lint`: 15 pre-existing errors only (PaginationTable, ui/badge/button/calendar/chart/sidebar/skeleton/sonner/toggle, CategoriesPage setState-in-effect, use-course-data setState-in-effect, CoursesPage unused `isDeleting`, StatsCard unused `Icon`) — no new violations.
- `npm run build`: passes (1889 modules; ~575 kB JS / ~169 kB gzip — unchanged chunk-size warning).

### Billing UI - refund workflow
- Six tabs: Plans, User Subscriptions, Payments, Refund Requests, Refunds, Coupons.
- Refund Requests tab: server filters (search/status) + review modal with approve (note) / reject (reason); approval is separate from the actual Stripe refund.
- Payment detail modal: full payment fields, refundable balance, refund history, and Create Refund (opens the refund modal showing amount / already refunded / remaining + confirmation).
- Refunds tab: refund history from `GET /admin/refunds`.
- Plans tab: activate/deactivate via `PATCH /admin/plans/:planId/status`; delete is reference-safe (soft-deactivates when history exists).
- Subscriptions tab: paid-vs-override source badge and a detail modal.
- Hooks/services/query keys consolidated in `features/subscriptions/` and `lib/queryKeys.js`; broken hook imports from the refactor repaired (users, courses, categories, `use-course-detail` relative paths) so `npm run build` passes.
- Server-side filters + pagination (`PaginationTable`, 20/page) on Subscriptions, Payments, Refund Requests, and Refunds tabs; Refund Requests shows refund-window eligibility; Plans shows usage counts; Payment detail shows checkout snapshot/session + refund requests; Subscription detail shows refunds.

## Remaining (out of scope, not scheduled)
- Pagination controls for admin lists (`plans`, `subscriptions`, `payments`, `coupons` currently request `limit=100`).
- Tailwind 3 → learner `@theme` token migration (decision deferred; staying on Tailwind 3).
- Consolidating toast providers (shadcn `Toaster` is the sole provider; `use-toast.js` is a re-export of the feature source).
- React Hook Form + zod adoption (deferred by decision; manual `useState` forms remain).
- Fix the 15 pre-existing lint errors.
- Learner app: Phase 5 work (auth/session alignment post-refactor).

## Notes
- Auth/routes/services work against `/auth/*` and `/admin/*`.
- Legacy `src/pages/` now holds only `NotFound.jsx`; `src/hooks/` holds `use-toast`, `use-theme`, `use-mobile`; `src/components/` holds shared `DataTable`, `StatusBadge`, `FormModal`, ui kit, and common components.
- Design exception: `StatsCard` lives in `features/dashboard/components/` (not `components/common/`) to avoid a `PropsWithChildren` circular-import lint error; `subscriptions` reuse it via `@/features/dashboard/...`.
# Frontend: Admin Dashboard

**Status:** ✅ Done.

The `admin/` SPA (React 19, Vite 7, TanStack Query 5, Tailwind 3, shadcn/Radix)
serves both platform administrators and instructors (role-gated).

## Done

| Area | What landed |
|---|---|
| Feature architecture | `features/<domain>/` (auth, dashboard, categories, users, courses, subscriptions, instructor, payouts) with `pages/`, `components/`, `hooks/`, `services/`. |
| Data access | `lib/apiClient.js` (fetch wrapper, envelope unwrapping, `ApiError`, 401 auto-logout), central `lib/queryKeys.js` (with `userScopedQueryRoots`), `lib/queryClient.js` defaults. |
| Routing | `app/router.jsx` with lazy pages, `RequireAuth` + `RedirectIfAuthenticated`, and `RequireRole` for ADMIN-only routes; role-aware `/` home. |
| Navigation | `constants/navItems.js` exposes role-based lists; `AdminSidebar` filters by `user.role` and switches brand/role label. |
| Admin features | Dashboard, categories, courses + course builder, subscriptions (plans/subscriptions/payments/refunds/coupons), users/instructors, course review queue, payouts + revenue-share setting. |
| Instructor features | Instructor dashboard, my courses (submit-for-review), course-detail tabs (students/analytics/reviews/certificates), earnings. |
| Billing UI | Admin billing/refund workflow aligned with the prepaid API. |

## Remaining

| # | Task | Status | Notes |
|---|---|---|---|
| — | Manual browser QA of role-gated flows | ⬜ | Verify admin vs instructor nav/routes and empty/error states. |
| — | Skeleton rollout for new pages | 🟡 | New instructor/payouts pages reuse existing skeletons; add finer-grained ones if needed. |
| Lint | `npm run lint` baseline | 🟡 | 6 pre-existing errors in untouched UI primitives (`badge`, `button`, `sidebar`, `skeleton`, `StatsCard`). Not introduced by this work. |

## Notes

- No automated tests/CI.
- `admin/package.json` is still named `frontend` (legacy).

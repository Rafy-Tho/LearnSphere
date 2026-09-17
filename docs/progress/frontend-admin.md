# Admin Dashboard Progress

**Status:** ⬜ Not started — learner app refactor came first.

The `admin/` app is a separate React SPA (React 19, Vite 7, TanStack Query 5, Tailwind 3, shadcn/Radix) talking to the same API. It is **functionally working** and its services were updated in lockstep with the backend endpoint renames; no structural/design refactor has been done.

## Planned Scope

| Area | Notes |
|---|---|
| Architecture | Align folder structure/patterns with the learner app where it makes sense. |
| Design tokens | Tailwind 3 config-based today; decide whether to adopt the learner `@theme` token approach. |
| Components | Audit shadcn primitives and page components for duplication/consistency. |
| API & state | Align service/query-key patterns; add pagination controls for admin subscriptions (currently bounded at 100). |

## Notes

- Auth/routes/services work against `/auth/*` and `/admin/*`.
- Out of scope until explicitly scheduled.
- **Billing backend changed (prepaid refactor):** admin payment create/edit/delete and manual subscription create/update/delete endpoints were removed. Admin payments are now read-only (`GET /admin/payments`, `GET /admin/payments/:paymentId`) with refund issuance at `POST /admin/payments/:paymentId/refunds`; subscriptions are read-only with an audited `POST /admin/subscriptions/override`; coupons (`/admin/coupons`) and stats (`/admin/billing/stats`) are new. The current admin `SubscriptionsPage` Payments/Subscriptions tabs will break until the admin UI is refactored.

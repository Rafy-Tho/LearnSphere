# Learner Payment & Subscription — Production Refactor (Plan & Task)

## Scope

Refactor only the learner flow
`Plan → Checkout Order → Stripe Checkout → Webhook → Payment → Subscription → Access`,
plus the learner **refund request** workflow (stops at `PENDING`).

**Out of scope (must remain untouched):** admin payment/refund/subscription
management, admin billing UI, admin manual/offline payments, admin refund
approval/processing, recurring billing, auto-renewal, Stripe Subscriptions,
new frameworks/ORMs.

## Confirmed decisions

| Topic | Decision |
|---|---|
| Billing | Prepaid, one-time, `mode:"payment"`, no renewal, one ACTIVE subscription/user |
| Coupon concurrency | Reserve capacity at checkout; finalize to redemption on payment; release on abandon/cancel/expire |
| Refund window | `REFUND_WINDOW_DAYS` env, default `14`, measured from `payment.paid_at` |
| Duplicate checkout | Reuse open `CHECKOUT_STARTED` order for the same purchase context; return its existing Stripe URL |
| Refund UI | Full refund only; API accepts `requested_amount` |
| Order/session TTL | 30 minutes; `checkout_orders.expires_at` aligned with Stripe session `expires_at` |
| Legacy webhook | Keep metadata fallback when no `checkout_orders` row matches the session |
| `reserved_count` | Maintained explicitly in the repository inside the same transaction |
| Refund reason | `reason` required; `user_note` optional |

## Architecture

```text
Plan → Checkout Order → Stripe Checkout → Webhook → Payment → Subscription ACTIVE → Access
Payment → Refund Request → PENDING → [admin workflow — separate task]
```

---

## 1. Database — `0022_learner_checkout_refunds.sql` (+ mirror `schema.sql`)

Additive only; no data destruction.

- Enums: `checkout_order_status`
  (`CREATED, CHECKOUT_STARTED, PAID, FAILED, EXPIRED, CANCELLED`);
  `refund_request_status` (`PENDING, APPROVED, REJECTED, CANCELLED`).
- `checkout_orders`: `id, user_id→users CASCADE, plan_id→subscription_plans
  RESTRICT, coupon_id→coupons SET NULL, plan_name, duration_days, subtotal≥0,
  discount_amount≥0, total_amount≥0, currency, status,
  stripe_checkout_session_id UNIQUE, stripe_payment_intent_id UNIQUE,
  expires_at, created_at, updated_at`; indexes `(user_id)`, `(status)`.
- `coupon_reservations`: `id, coupon_id→coupons CASCADE, user_id→users CASCADE,
  checkout_order_id→checkout_orders CASCADE, expires_at, released_at,
  created_at`; `UNIQUE(checkout_order_id)`, partial
  `UNIQUE(coupon_id, user_id) WHERE released_at IS NULL`, index `(coupon_id)`.
- `coupons`: add `reserved_count INT NOT NULL DEFAULT 0 CHECK (reserved_count >= 0)`.
- `subscription_payments`: add `provider VARCHAR(20) NOT NULL DEFAULT 'STRIPE'`,
  `payment_method VARCHAR(30) NOT NULL DEFAULT 'card'`, `checkout_order_id UUID
  → checkout_orders(id) ON DELETE SET NULL`.
- `refund_requests`: `id, payment_id→subscription_payments CASCADE,
  user_id→users CASCADE, requested_amount>0, currency, reason, user_note,
  status DEFAULT 'PENDING', reviewed_by→users SET NULL, admin_note,
  requested_at, reviewed_at, created_at, updated_at`; partial
  `UNIQUE(payment_id) WHERE status='PENDING'`; indexes `(payment_id)`,
  `(user_id)`, `(status)`.
- `set_updated_at()` triggers on `checkout_orders`, `refund_requests`.
- Update `docs/04-design/database-design.md` §4.4/§6/§7 accordingly.

## 2. Backend files (`backend/src/modules/subscriptions/`)

| File | Responsibility |
|---|---|
| `checkout-order.repository.js` (new) | create, find by session id, find open for user, mark status, expire overdue, update intent id, find for webhook. No business logic. |
| `coupon-reservation.repository.js` (new) | conditional reserve (atomic `reserved_count+redemption_count < max_redemptions`), find active, release, finalize; explicit `reserved_count` updates in the caller's transaction. |
| `checkout.service.js` (new) | plan/user/coupon validation, snapshot, reuse/expire logic, reserve, Stripe session, persist session id. |
| `subscription.service.js` | delegate checkout to `checkout.service`; retain subscription state, active lookup, lazy expiration, access checks. |
| `webhook.service.js` | refactor `handleCheckoutCompleted` to order-snapshot provisioning (below). |
| `coupon.service.js` | keep `validate`/`calculateDiscount`; add reservation-aware finalize helper. |
| `refund-request.repository.js` (new) | insert/list/find, pending lookup, refundable sum (reuses `refund.repository`). |
| `refund-request.service.js` (new) | learner eligibility + create/list/detail; never calls Stripe. |
| `refund-request.controller.js`, `me-refund-requests.routes.js` (new) | routes + ownership. |
| `payment.repository.js` | add `refundable_amount`, `refund_request_status`, `provider`, `payment_method` to my-payment reads. |
| `validation.js` | refund-request body validator (`reason` required, `user_note`/`requested_amount` optional). |
| `config/environment.js` | add `REFUND_WINDOW_DAYS` (default 14). |
| admin `refund.service.js` | unchanged. |

## 3. Checkout flow (`POST /api/v1/subscriptions/:planId/checkout`)

1. Load plan; 404/400 if missing/inactive.
2. Lazy-expire overdue subscriptions; reject if active paid subscription.
3. Expire overdue orders for the user (mark `EXPIRED`, release reservations).
4. Find open `CHECKOUT_STARTED` order for same `(plan_id, coupon_id)`; if valid,
   retrieve Stripe session — if open return its URL; if expired mark order
   `EXPIRED`, release, continue.
5. Snapshot `plan.price`/`plan.duration_days`.
6. Validate coupon → discount clamped to `≤ subtotal`.
7. Insert order (`expires_at = now + 30m`).
8. Reserve coupon (transactional conditional update + insert reservation).
9. Create Stripe session `mode:"payment"`, `expires_at` aligned, metadata
   `{ orderId, userId, planId, couponCode }`, idempotency key
   `checkout_order_<orderId>`.
10. Persist session id, set `CHECKOUT_STARTED`.
11. Return `{ order_id, session_url }`.

**No payment/subscription created here.**

## 4. Webhook (`checkout.session.completed`)

Find order by `stripe_checkout_session_id` (legacy fallback to metadata) →
verify `payment_status === 'paid'` → idempotency (`stripe_webhook_events`
insert + order not already `PAID` + unique intent) → in one `withTransaction`:
expire overdue subs → create subscription from `order.duration_days`/`plan_id`
→ create payment from order snapshot (`provider=STRIPE`,
`payment_method=card`, `checkout_order_id`, `paid_at=now`) → finalize coupon
reservation → mark order `PAID` → audit → email.

**Delayed webhook:** provision even if order was `EXPIRED`/`CANCELLED`, since
Stripe confirms payment. Duplicate/retried delivery is a no-op.

## 5. Coupon finalization

On confirmed payment, in the same transaction: create `coupon_redemptions` row
(unique `payment_id` makes it idempotent) → set reservation `released_at=now`
→ decrement `reserved_count` → increment `coupons.redemption_count`. If no
active reservation (late/expired) but coupon valid and capacity exists, redeem;
otherwise honor the already-charged snapshot amount and log an audit warning.

## 6. Learner refund requests

`refundable_amount = round(payment.amount − SUM(refunds WHERE refund_status='SUCCEEDED'))`.

Service validates: ownership, payment `COMPLETED|PARTIALLY_REFUNDED`,
`paid_at + REFUND_WINDOW_DAYS >= now`, `requested_amount > 0`, `≤ refundable`,
no existing `PENDING` request. Creates a `PENDING` row only — **no Stripe call,
no status mutation**.

Routes (all `requireAuth`):
`POST /users/me/payments/:paymentId/refund-requests`,
`GET /users/me/refund-requests`,
`GET /users/me/refund-requests/:requestId`; mount new
`/api/v1/users/me/refund-requests` in `app/routes.js`.

## 7. Payment read model

Expose `provider`, `payment_method`, `refundable_amount`, and latest
`refund_request_status` in learner payment list/detail. No sensitive Stripe
data beyond the already-masked reference.

## 8. Frontend (`frontend/src/features/subscriptions/`)

- `PaymentSuccess.jsx`: refetch subscription **and** payments; processing state
  until backend confirms; safe on manual URL access.
- `PaymentDetailsModal.jsx`: show refundable balance, request status, refund
  history, and a full-amount "Request Refund" form (`reason` required). No admin
  controls.
- `BillingDashboard.jsx`: refund-request status badge in history, from server
  state.
- `services/subscriptions.js`, `hooks/useSubscriptions.js`,
  `hooks/useSubscriptionMutations.js`, `lib/queryKeys.js`: add refund-request
  methods/keys; add root to `userScopedQueryRoots`; invalidate payments +
  refund requests after create.

## 9. Access control (unchanged)

Paid access still requires `subscription.status='ACTIVE' AND end_date>NOW() AND
payment.payment_status='COMPLETED'`. Checkout/order/success page/refund request
never grant access.

## 10. Edge cases

Duplicate checkout · duplicate/retried/delayed/failed webhook ·
abandoned/expired order + reservation release · concurrent coupon checkout ·
duplicate PaymentIntent · duplicate subscription · existing active subscription
· price/coupon changed after checkout · coupon limit reached concurrently ·
duplicate pending refund · outside window · amount > refundable ·
partial/full refund · manually opened success URL · Stripe API/network failure ·
DB transaction failure.

## 11. Task checklist

1. Migration `0022` + `schema.sql` mirror; `npm run db:migrate`.
2. Checkout-order + coupon-reservation repositories.
3. `checkout.service.js`; refactor `subscription.service.js`/controller.
4. Webhook refactor (order-snapshot provisioning, legacy fallback, delayed handling).
5. Payment `provider`/`payment_method`/`checkout_order_id` wiring + read model.
6. Refund-request repository/service/controller/routes/validators + `REFUND_WINDOW_DAYS`.
7. Frontend service/hooks/query keys.
8. Payment success + billing + payment modal UI.
9. Lint/build/migrate; update `docs/progress/backend-progress.md`,
   `docs/progress/frontend-user.md`, `docs/04-design/database-design.md`.

## 12. Verification

`npm run db:migrate` · backend `npx eslint .` · frontend `npm run lint` +
`npm run build`. Manual Stripe test-mode: happy path, coupon
reserve→finalize, duplicate checkout reuse, abandoned expiry + reservation
release, webhook retry (no dup payment/subscription/redemption), refund request
PENDING (no Stripe refund). No automated tests/CI exist.

## 13. Out of scope

Admin billing/refund/subscription management and UI, recurring
billing/auto-renewal, any new framework/ORM.

## 14. Webhook operations (implemented)

- The Stripe webhook is mounted at `/api/v1/webhooks/stripe` before
  `express.json()` so the raw body is preserved.
- Duplicate paid orders are safe: a paid checkout for a user who already has an
  ACTIVE subscription records the payment against that subscription
  (audit `duplicate: true`) and releases the duplicate order's reservation
  without a second coupon redemption.
- Missed-webhook recovery: `npm run billing:reconcile` (all unpaid-but-paid
  orders) or `npm run billing:reconcile -- <checkoutOrderId>` fetches each
  Checkout Session server-side and provisions only when Stripe reports `paid`.
  Stripe remains the source of truth; the frontend is never trusted.
- Dev setup: run `stripe listen --forward-to localhost:5000/api/v1/webhooks/stripe`
  against the **same** Stripe account as `STRIPE_SECRET_KEY`, and set
  `STRIPE_WEBHOOK_SECRET` to the CLI's `whsec_…`.

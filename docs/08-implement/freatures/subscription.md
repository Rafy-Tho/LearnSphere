# Billing & Subscription — Plan & Implementation (v2)

> **Status:** implemented (DB `0018`–`0019`, backend, webhooks, learner frontend).
> Admin coupon/refund endpoints and the admin billing UI remain deferred (D4).

Goal: make billing a complete, production-quality feature on top of the **existing
prepaid, one-time Stripe Checkout** implementation. This document replaces the
previous broad spec, which assumed recurring Stripe subscriptions. It was rewritten
after inspecting the real code so the plan matches the architecture.

> **Reviewed against:** `backend/src/modules/subscriptions/*`,
> `backend/src/db/migrations/0007_billing.sql`, `backend/src/db/schema.sql` (§4.4),
> `frontend/src/features/subscriptions/*`, `docs/04-design/{database-design,api-design}.md`.

## 0. Confirmed Decisions

| # | Decision |
|---|---|
| D1 | **Billing model stays prepaid one-time.** Stripe Checkout `mode:"payment"` for a fixed `duration_days`. No auto-renew. |
| D2 | **Recurring billing is out of scope.** No Stripe Subscriptions, no invoices, no `PAST_DUE`, no Stripe Billing Portal. |
| D3 | **Cancel/reactivate is dropped.** There is no recurring charge to cancel; access ends at `end_date`. UI shows "Expires on…" and offers renew after expiry. |
| D4 | **Admin backend + UI deferred.** Learner APIs, coupons validation, and webhook sync land now. Admin coupon/refund issuance is deferred. |
| D5 | **Enums extended additively.** Keep `CANCELLED`/`COMPLETED`; add `PENDING` (subscription) and `PARTIALLY_REFUNDED` (payment). |
| D6 | **Refunds:** schema + `charge.refunded`/`refund.updated` webhook sync + read-only display now; admin issuance deferred. |
| D7 | **Keep `subscription_payments.amount`** as the final charged total to avoid breaking the working admin app; add `subtotal` and `discount_amount`. |

## 1. Current State (as implemented)

**Database** (`0007_billing.sql`, mirrored in `schema.sql`):

- `subscription_plans`: `id, name, duration_days, price, created_at, updated_at`; unique `(name, duration_days)`.
- `user_subscriptions`: `id, user_id, plan_id, start_date, end_date, status, timestamps`; partial unique `one_active_subscription_per_user`; both FKs `ON DELETE CASCADE`.
- `subscription_payments`: `id, user_subscription_id, amount, payment_status, stripe_payment_intent_id (unique), timestamps`.
- Enums: `subscription_status = ACTIVE|EXPIRED|CANCELLED`; `payment_status = PENDING|COMPLETED|FAILED|REFUNDED`.

**Backend** (`modules/subscriptions/`): plans/subscriptions/payments admin CRUD, Stripe Checkout `mode:"payment"`, one webhook event (`checkout.session.completed`) with signature verification. Premium gating lives in `courses/course.service.js:78` (flips `access_type` when an active paid subscription exists).

**Learner frontend**: pricing page with **hardcoded plans + DB UUIDs** (`frontend/src/constants/plans.js`, `PricingSection.jsx`), checkout, success/cancel pages. No billing management, history, coupons, or cancel UI.

**Admin**: working subscription/payment/plan CRUD UI (not touched in this plan).

## 2. Gaps vs. the Original Spec

| Area | Status |
|---|---|
| `coupons`, `coupon_redemptions`, `payment_refunds`, `stripe_webhook_events` | Missing |
| Plan `description` / `currency` / `is_active` | Missing |
| Payment subtotal / discount / currency / invoice / paid_at / failure_reason | Missing |
| Cancellation fields (`cancel_at_period_end`, `cancelled_at`) | Missing |
| Stripe IDs (`customer_id`, `subscription_id`, `invoice_id`, `refund_id`) | Missing |
| Webhook idempotency by event ID | Weak (relies on payment-intent uniqueness) |
| Refunds / partial refunds | Missing |
| Public plans list endpoint | Missing (`GET /plans/:planId` only) |
| User payment history / subscription detail endpoints | Missing |
| Learner billing UI (management, history, coupon, cancel) | Missing |

## 3. Bugs / Risks Found

1. **Frontend hardcodes plans and their DB UUIDs** — the DB is not the source of truth; changing a plan breaks the pricing page.
2. **Destructive admin deletes with `ON DELETE CASCADE`** on `plan_id` / `user_subscription_id` can wipe billing history.
3. **`setUserSubscriptionStatusToExpired(userId)`** bulk-expires *all* of a user's rows before checkout (`subscription.service.js:35`).
4. `createPayment` hardcodes `'COMPLETED'`; checkout stores no customer/email; metadata key `subscriptionId` actually holds a **plan id**.
5. Pricing is fully client-supplied today; there is no server-side amount/coupon validation to trust.

## 4. Scope

### In scope

- Database improvements: coupons, redemptions, refunds, webhook events, plan/payment fields, indexes, non-destructive FK.
- Backend: public plans list, coupon validation, checkout with server-calculated amounts, payment history, richer subscription detail, premium gating helper, validators.
- Webhook: event-id idempotency; `checkout.session.completed`, `charge.refunded`, `refund.updated`; failures logged.
- Learner frontend: API-driven pricing, checkout with coupon UX, billing page with payment history, payment details, status states.
- Docs + progress updates.

### Out of scope (deferred)

- True recurring Stripe subscriptions, Customers/Billing Portal, invoices, auto-renew, `PAST_DUE`, cancel/reactivate.
- Admin coupon CRUD + redemptions, admin refund issuance, admin billing overview, admin billing UI.
- Any unrelated refactor.

---

## 5. Phase 1 — Database

Two migrations (DDL and backfill separated per `backend/src/db/README.md`), mirrored into `schema.sql`. New enum values go in their **own migration** so they are not used in the same transaction that adds them.

### 5.1 `0018_billing_schema.sql` (DDL)

```sql
-- Enum additions (safe to re-run)
ALTER TYPE subscription_status ADD VALUE IF NOT EXISTS 'PENDING';
ALTER TYPE payment_status      ADD VALUE IF NOT EXISTS 'PARTIALLY_REFUNDED';

DO $$ BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'discount_type') THEN
    CREATE TYPE discount_type AS ENUM ('PERCENTAGE','FIXED_AMOUNT');
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'refund_status') THEN
    CREATE TYPE refund_status AS ENUM ('PENDING','SUCCEEDED','FAILED');
  END IF;
END $$;

-- subscription_plans: new columns
ALTER TABLE subscription_plans
  ADD COLUMN IF NOT EXISTS description TEXT,
  ADD COLUMN IF NOT EXISTS currency VARCHAR(3) NOT NULL DEFAULT 'usd',
  ADD COLUMN IF NOT EXISTS is_active BOOLEAN NOT NULL DEFAULT TRUE;

-- user_subscriptions: new columns
ALTER TABLE user_subscriptions
  ADD COLUMN IF NOT EXISTS cancel_at_period_end BOOLEAN NOT NULL DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS cancelled_at TIMESTAMPTZ,
  ADD COLUMN IF NOT EXISTS stripe_customer_id TEXT,
  ADD COLUMN IF NOT EXISTS stripe_subscription_id TEXT;  -- reserved

-- subscription_payments: new columns (amount stays the charged total)
ALTER TABLE subscription_payments
  ADD COLUMN IF NOT EXISTS subtotal NUMERIC(10,2),
  ADD COLUMN IF NOT EXISTS discount_amount NUMERIC(10,2) NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS currency VARCHAR(3) NOT NULL DEFAULT 'usd',
  ADD COLUMN IF NOT EXISTS coupon_id UUID,
  ADD COLUMN IF NOT EXISTS stripe_invoice_id TEXT,
  ADD COLUMN IF NOT EXISTS paid_at TIMESTAMPTZ,
  ADD COLUMN IF NOT EXISTS failure_reason TEXT;

-- coupons
CREATE TABLE IF NOT EXISTS coupons (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  code VARCHAR(50) NOT NULL UNIQUE,          -- stored uppercase
  discount_type discount_type NOT NULL,
  discount_value NUMERIC(10,2) NOT NULL CHECK (discount_value >= 0),
  max_redemptions INT CHECK (max_redemptions IS NULL OR max_redemptions > 0),
  redemption_count INT NOT NULL DEFAULT 0 CHECK (redemption_count >= 0),
  starts_at TIMESTAMPTZ,
  expires_at TIMESTAMPTZ,
  is_active BOOLEAN NOT NULL DEFAULT TRUE,
  created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- coupon_redemptions
CREATE TABLE IF NOT EXISTS coupon_redemptions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  coupon_id UUID NOT NULL REFERENCES coupons(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  payment_id UUID NOT NULL,
  discount_amount NUMERIC(10,2) NOT NULL CHECK (discount_amount >= 0),
  redeemed_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT unique_coupon_per_user UNIQUE (coupon_id, user_id),
  CONSTRAINT unique_coupon_redemption_payment UNIQUE (payment_id)
);

-- payment_refunds
CREATE TABLE IF NOT EXISTS payment_refunds (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  payment_id UUID NOT NULL REFERENCES subscription_payments(id) ON DELETE CASCADE,
  amount NUMERIC(10,2) NOT NULL CHECK (amount > 0),
  currency VARCHAR(3) NOT NULL DEFAULT 'usd',
  refund_status refund_status NOT NULL DEFAULT 'PENDING',
  stripe_refund_id TEXT UNIQUE,
  reason TEXT,
  refunded_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- stripe_webhook_events (idempotency)
CREATE TABLE IF NOT EXISTS stripe_webhook_events (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  stripe_event_id TEXT NOT NULL UNIQUE,
  event_type TEXT NOT NULL,
  processed_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- Non-destructive FK: plans cannot delete billing history
ALTER TABLE user_subscriptions DROP CONSTRAINT IF EXISTS user_subscriptions_plan_id_fkey;
ALTER TABLE user_subscriptions
  ADD CONSTRAINT user_subscriptions_plan_id_fkey
  FOREIGN KEY (plan_id) REFERENCES subscription_plans(id) ON DELETE RESTRICT;

ALTER TABLE subscription_payments DROP CONSTRAINT IF EXISTS subscription_payments_coupon_id_fkey;
ALTER TABLE subscription_payments
  ADD CONSTRAINT subscription_payments_coupon_id_fkey
  FOREIGN KEY (coupon_id) REFERENCES coupons(id) ON DELETE SET NULL;

-- Indexes
CREATE INDEX IF NOT EXISTS idx_subscription_plans_active ON subscription_plans(is_active);
CREATE INDEX IF NOT EXISTS idx_user_subscriptions_status ON user_subscriptions(status);
CREATE INDEX IF NOT EXISTS idx_user_subscriptions_stripe_sub ON user_subscriptions(stripe_subscription_id);
CREATE INDEX IF NOT EXISTS idx_subscription_payments_status ON subscription_payments(payment_status);
CREATE INDEX IF NOT EXISTS idx_subscription_payments_invoice ON subscription_payments(stripe_invoice_id);
CREATE INDEX IF NOT EXISTS idx_coupons_active ON coupons(is_active);
CREATE INDEX IF NOT EXISTS idx_coupon_redemptions_coupon ON coupon_redemptions(coupon_id);
CREATE INDEX IF NOT EXISTS idx_coupon_redemptions_user ON coupon_redemptions(user_id);
CREATE INDEX IF NOT EXISTS idx_payment_refunds_payment ON payment_refunds(payment_id);
CREATE INDEX IF NOT EXISTS idx_payment_refunds_status ON payment_refunds(refund_status);
```

> Note: `amount` is the final charged total. `subtotal - discount_amount = amount`.
> Enforce this in the service layer (not a hard CHECK) so the existing admin
> payment update path keeps working.

### 5.2 `0019_billing_backfill.sql` (data)

```sql
UPDATE subscription_payments
   SET subtotal = COALESCE(subtotal, amount),
       discount_amount = COALESCE(discount_amount, 0),
       paid_at = COALESCE(paid_at, created_at)
 WHERE subtotal IS NULL OR paid_at IS NULL;

UPDATE subscription_plans SET currency = 'usd' WHERE currency IS NULL;
UPDATE subscription_plans SET is_active = TRUE WHERE is_active IS NULL;
```

### 5.3 `schema.sql` sync

Mirror all columns, tables, enum values, indexes, and the RESTRICT FK into the
canonical baseline so a fresh install matches a migrated DB.

Apply: `npm run db:migrate` / `npm run db:status` from `backend/`.

---

## 6. Phase 2 — Backend (`backend/src/modules/subscriptions/`)

Keep the module layering: `routes → validators → middlewares → controllers → services/repositories → pg pool`.
Split the current god `subscription.repository.js` into focused repositories (class + constructor DI + default singleton).

| File | Responsibility |
|---|---|
| `plan.repository.js` / `plan.service.js` / `plan.controller.js` | Plan reads/writes, active list, deactivate-instead-of-delete |
| `subscription.repository.js` / `subscription.service.js` / `subscription.controller.js` | Subscription reads, detail, premium helper |
| `payment.repository.js` / `payment.service.js` / `payment.controller.js` | Payment history, details, refund reads |
| `coupon.repository.js` / `coupon.service.js` / `coupon.controller.js` | Coupon lookup + validation + redemption write |
| `refund.repository.js` | Refund rows (used by webhook) |
| `webhook.service.js` / `webhook.routes.js` | Event handling (extended) |

### 6.1 Plans

- Public `GET /api/v1/plans` — active plans only, no auth. Returns `id, name, description, duration_days, price, currency`.
- `GET /api/v1/plans/:planId` — unchanged behavior, includes new fields.
- `DELETE /admin/plans/:planId` — refuse hard delete when subscriptions/payments reference the plan; deactivate (`is_active = false`) instead. Existing admin endpoints stay functional.

### 6.2 Checkout

`POST /api/v1/subscriptions/:planId/checkout` (auth + validation), body `{ coupon_code? }`:

1. Load the plan; reject inactive/missing.
2. Reject if the user already has an active, unexpired, paid subscription.
3. Validate the coupon server-side (see 6.3) and compute `subtotal`, `discount`, `amount` in integer cents.
4. Create the Stripe Checkout session with `mode:"payment"`, plan `currency`, `customer_email`, and metadata:
   `{ userId, planId, couponCode, subtotal, discount, amount }`.
5. Return `{ session_url }`.

Never accept price/discount/status from the client. Fix the misleading
`subscriptionId` metadata key (it holds a plan id) and remove the bulk
`setUserSubscriptionStatusToExpired` call.

### 6.3 Coupons

`POST /api/v1/coupons/validate` (auth), body `{ code, plan_id }` → `{ valid, code, discount_type, discount_value, subtotal, discount, total, currency }` or a generic invalid message.

Validation rules (server-side, explicit):

- inactive → invalid
- before `starts_at` → invalid
- after `expires_at` → invalid
- `redemption_count >= max_redemptions` → invalid
- `PERCENTAGE` value must be `> 0 and <= 100` → else invalid
- `FIXED_AMOUNT` must be `> 0`; discount is capped at `subtotal`
- user already redeemed this coupon → invalid (enforced by `unique_coupon_per_user`)

Codes are normalized to uppercase on read and write. Error messages stay generic
("Coupon code is invalid or expired.") and never leak internal detail.

### 6.4 Payments & subscription detail

- `GET /api/v1/users/me/payments` (auth, paginated) — date, plan name, subtotal, discount, amount, currency, payment_status, refund total/status.
- `GET /api/v1/users/me/payments/:paymentId` (auth + ownership) — full detail + refund breakdown.
- `GET /api/v1/users/me/subscription` (auth) — current subscription with plan, status, start/end dates, days remaining, cancellation schedule, and latest payment summary; returns `null` when none.

### 6.5 Premium gating

Add `hasActiveSubscription(userId)` to the subscription service: `status = 'ACTIVE'`
**and** `end_date > now()` **and** a `COMPLETED` payment exists. Use it in
`courses/course.service.js` instead of the raw repository call. Expiry is evaluated
at query time (there is no scheduler in this project).

### 6.6 Validation

Add validators for: checkout body (`coupon_code` optional text), coupon validate body (`code` required, `plan_id` uuid), and payment-id param. Reuse the builders in `common/validation.js`; every write endpoint gets validator + `validateResult` + auth.

---

## 7. Phase 3 — Stripe Webhooks

Keep the router mounted **before** `express.json()` with `express.raw(...)` and
signature verification.

### 7.1 Idempotency wrapper

Inside the processing transaction:

```sql
INSERT INTO stripe_webhook_events (stripe_event_id, event_type)
VALUES ($1, $2)
ON CONFLICT (stripe_event_id) DO NOTHING
RETURNING id;
```

If no row is returned, the event was already handled → respond `200` without
re-processing. Otherwise process and set `processed_at`.

### 7.2 Events to handle

| Event | Action |
|---|---|
| `checkout.session.completed` | Provision `user_subscriptions` + `subscription_payments` + `coupon_redemptions`, increment `coupons.redemption_count`, send confirmation email (all in one transaction). Only when `payment_status = 'paid'`. |
| `charge.refunded` | Upsert `payment_refunds`; set payment `REFUNDED` or `PARTIALLY_REFUNDED` based on total refunded vs. amount. |
| `refund.updated` | Update the matching `payment_refunds.refund_status`. |
| `payment_intent.payment_failed` | Log only (payments are created on success, so there is no pending row to attach `failure_reason` to). |

Do not add subscription/invoice events — they are not part of the prepaid model.
Webhook processing must be safe to retry; failures return `500` so Stripe retries.

---

## 8. Phase 4 — Learner Frontend (`frontend/src/features/subscriptions/`)

Components never call `fetch`; go through hooks → services and invalidate query
keys after mutations.

### 8.1 Services / hooks / query keys

- `subscriptionsApi`: `getPlans`, `getById`, `getActive`, `checkout(planId, couponCode)`, `getPayments`, `getPayment(id)`, `validateCoupon(payload)`.
- Hooks: `usePlans`, `useActiveSubscription`, `usePayments`, `usePayment`, `useValidateCoupon`, `useCheckout`.
- `queryKeys`: `plans`, `activeSubscription`, `subscription`, `payments`, `payment(id)`.
- Invalidate `activeSubscription` + `payments` after checkout success.

### 8.2 Pricing

- Remove the hardcoded plan array and `frontend/src/constants/plans.js`; render plans from `GET /plans` (price, currency, duration, description).
- `PricingCard` shows currency + duration; marks the current plan; routes to `/checkout/:planId` for authenticated users (guests → `/login`).

### 8.3 Checkout

New `features/subscriptions/pages/Checkout.jsx`:

- Coupon field with Apply/Remove; on apply call `POST /coupons/validate` and show `subtotal / discount / total`.
- Invalid coupon → generic message; removing restores the original total.
- Confirm → `POST /subscriptions/:planId/checkout` → redirect to `session_url`.
- Show loading/error/payment-failure states; never compute the final amount on the client.

### 8.4 Billing page

New dashboard page (route under the learning dashboard):

- Current plan, status, started, expires-on, days remaining; "Expires on…" for prepaid (no cancel control).
- Expired state → "View Plans".
- Payment history table (date, plan, subtotal, discount, total, status) that becomes cards on mobile.
- Payment details modal: subtotal, coupon, discount, total, status, payment date, masked payment id; refund breakdown (original / refunded / remaining) when refunded.

### 8.5 Shared UI

- Status badge with `icon + label` (not color alone) for Active, Pending, Paid, Failed, Expired, Refunded, Partially Refunded.
- Loading (skeleton), empty ("No payment history yet…"), and error ("We couldn't load your billing information. [Try Again]") states.
- Fix `PaymentSuccess` to use real payment/subscription data instead of fabricated IDs and plan price.
- Use existing Tailwind v4 tokens; responsive and light/dark parity.

---

## 9. Phase 5 — Docs & Verification

- Update `docs/04-design/database-design.md` (§4.4 tables, enum lists, index list, §9 if needed).
- Update `docs/04-design/api-design.md` (§19 plans/subscriptions, §20 webhook events).
- Update `docs/progress/backend-progress.md` and `docs/progress/frontend-user.md` after each completed item.
- Run `npx eslint .` (backend), `npm run lint` + `npm run build` (frontend).

### Manual verification

- Checkout without coupon → success → subscription active.
- Checkout with valid percentage coupon and valid fixed coupon → correct totals.
- Invalid / expired / inactive / maxed-out / already-redeemed coupon → rejected.
- Duplicate webhook delivery (Stripe CLI) → processed once.
- Refund in Stripe dashboard (full + partial) → `payment_refunds` + payment status updated.
- Expired subscription → premium lesson access removed.
- User cannot read another user's payment (`403`/`404`).

---

## 10. Task List

| ID | Task | Phase |
|---|---|---|
| SUB-DB-1 | Migration `0018`: enum values (`PENDING`, `PARTIALLY_REFUNDED`, `discount_type`, `refund_status`) | DB |
| SUB-DB-2 | Migration `0018`: new tables `coupons`, `coupon_redemptions`, `payment_refunds`, `stripe_webhook_events` | DB |
| SUB-DB-3 | Migration `0018`: plan/subscription/payment columns + FK `plan_id` → RESTRICT + indexes | DB |
| SUB-DB-4 | Migration `0019`: backfill; mirror all into `schema.sql` | DB |
| SUB-BE-1 | Split repositories (`plan`, `payment`, `coupon`, `refund`) out of the god repo | Backend |
| SUB-BE-2 | Plan service: new fields, public `GET /plans`, deactivate-instead-of-delete | Backend |
| SUB-BE-3 | Coupon service + repository: validation rules + `POST /coupons/validate` | Backend |
| SUB-BE-4 | Checkout: coupon + server-side amount calc + currency/customer/email/metadata | Backend |
| SUB-BE-5 | Payment history + details endpoints; richer `GET /users/me/subscription` | Backend |
| SUB-BE-6 | `hasActiveSubscription` helper; wire into `course.service.js` gating | Backend |
| SUB-BE-7 | Validators for new write endpoints; plan-delete guard | Backend |
| SUB-WH-1 | `stripe_webhook_events` idempotent processing wrapper | Webhook |
| SUB-WH-2 | `checkout.session.completed` → subscription + payment + coupon redemption (txn) | Webhook |
| SUB-WH-3 | `charge.refunded` / `refund.updated` → `payment_refunds` + payment status | Webhook |
| SUB-FE-1 | Services/hooks/queryKeys for plans, payments, coupon, checkout | Frontend |
| SUB-FE-2 | Pricing renders API plans; delete `constants/plans.js` hardcoding | Frontend |
| SUB-FE-3 | Checkout page with coupon UX + summary | Frontend |
| SUB-FE-4 | Billing page: current plan/status/dates + payment history + details | Frontend |
| SUB-FE-5 | Fix `PaymentSuccess` to use real data; shared status badge + states | Frontend |
| SUB-DOC-1 | Update database/API design + progress docs | Docs |
| SUB-TEST-1 | Lint/build + manual flow verification | Verify |

### Deferred to the admin phase

- Admin coupon CRUD + redemptions list.
- Admin refund issuance (full/partial through Stripe).
- Billing overview dashboard (active subscriptions, revenue, payments, refunds, active coupons).
- Admin subscription/payment/coupon/refund UI.

---

## 11. Business Rules (explicit)

**Coupon**

```text
inactive                        → cannot use
before starts_at                → cannot use
after expires_at                → cannot use
max redemptions reached         → cannot use
percentage outside (0, 100]     → cannot use
fixed amount <= 0               → cannot use
discount > subtotal             → capped at subtotal
already redeemed by this user   → cannot use
```

**Payment**

```text
total_amount = subtotal - discount_amount
subtotal >= 0, 0 <= discount_amount <= subtotal
backend calculates the final amount; the client never supplies it
```

**Refund**

```text
sum(refunds for a payment) <= payment.amount
refund status: PENDING | SUCCEEDED | FAILED
```

**Subscription**

```text
ACTIVE + end_date > now() + COMPLETED payment → premium access
end_date passed                              → premium access removed
```

---

## 12. Acceptance Criteria

```text
[ ] Plans have description, currency, is_active; deactivation preserves history
[ ] Public GET /plans returns active plans only
[ ] Checkout calculates subtotal/discount/total server-side
[ ] Coupons validate: active, window, max redemptions, per-user, value ranges
[ ] Coupon redemption recorded with discount amount
[ ] Historical discount/amount never changes when the plan price changes
[ ] Webhooks are signature-verified and idempotent by event id
[ ] checkout.session.completed provisions subscription + payment + redemption
[ ] Refund webhooks update payment_refunds and payment status
[ ] Payment history + details show subtotal, discount, total, status, refunds
[ ] Premium gating derives from backend subscription state
[ ] Authorization: no cross-user payment/subscription access
[ ] No destructive plan/subscription/payment cascade
[ ] Loading / empty / error states exist; mobile + light/dark work
[ ] Lint (backend + frontend) and frontend build pass
[ ] Admin UI and admin coupon/refund endpoints untouched/deferred
```

## 13. Final Review Checklist (when implementation completes)

```text
[ ] Migrations 0018/0019 applied; schema.sql in sync (fresh install == migrated)
[ ] No secret (STRIPE_SECRET_KEY) reaches the client
[ ] No duplicate endpoints introduced
[ ] No unrelated files changed
[ ] docs/ + docs/progress/ updated
```

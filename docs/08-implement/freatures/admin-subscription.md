# Admin Billing & Refund — Production Refactor

## Scope

Refactor ONLY the admin-facing billing workflow to work with the new learner payment architecture.

The learner payment flow has already been refactored to:

```text
Plan
 → Checkout Order
 → Stripe Checkout
 → Webhook
 → Payment
 → Subscription ACTIVE
 → Access
```

Learner refund flow:

```text
Payment
 → Refund Request
 → PENDING
 → Admin Review
 → Actual Stripe Refund
```

This task implements the **Admin Review + Management** side.

Do NOT redesign the learner checkout/payment architecture unless a compatibility fix is required.

Do NOT introduce recurring billing or auto-renewal.

---

# 1. Admin Responsibilities

Admin should manage:

### Plans

* Create plans
* Update plans
* Activate/deactivate plans
* View plan usage
* Prevent destructive deletion when financial/subscription history depends on the plan

### Subscriptions

* View user subscriptions
* Search/filter subscriptions
* View subscription details
* View payment history associated with subscription
* Perform controlled subscription overrides when explicitly supported
* Audit all administrative subscription changes

### Payments

* View payments
* Search/filter payments
* View payment details
* View checkout order information
* View Stripe references
* View refund history
* Never delete completed financial records

### Refund Requests

* View pending refund requests
* Review learner refund requests
* Approve/reject requests
* Add admin review notes
* Initiate the actual Stripe refund only after approval

### Refunds

* Create Stripe refund
* Support full refunds
* Keep backend partial-refund ready
* Synchronize final refund status from Stripe webhooks
* View refund history

### Billing Statistics

* Revenue
* Payment count
* Refund totals
* Net revenue where appropriate
* Active subscriptions
* Other existing billing metrics

---

# 2. Authorization

All admin billing endpoints require:

```text
requireAuth
+
authorize(ADMIN)
```

Do not allow learners or instructors to perform admin billing operations.

Every sensitive admin action must record:

```text
admin_user_id
action
target_resource
target_id
reason/note where applicable
timestamp
```

Use the existing audit-log system.

---

# 3. Admin Plan Management

Preserve the existing plan functionality but make it production-safe.

Admin can:

```text
POST   /admin/plans
PATCH  /admin/plans/:planId
PATCH  /admin/plans/:planId/status
```

If DELETE remains supported, do NOT allow deletion when referenced by historical subscriptions/orders/payments.

Prefer deactivation over destructive deletion for plans with financial history.

Historical payments and checkout orders must remain unchanged if the plan is later:

* renamed
* repriced
* deactivated

The historical checkout/payment snapshot remains authoritative.

---

# 4. Admin Subscription Management

Admin can view:

```text
GET /admin/subscriptions
GET /admin/subscriptions/:subscriptionId
```

Support:

* search
* user filter
* plan filter
* status filter
* date filtering where useful
* pagination

Subscription detail should show:

```text
User
Plan
Start date
End date
Status
Payment
Payment status
Refund information
```

Do not allow admins to arbitrarily edit financial payment history.

---

# 5. Subscription Override

If the existing system requires admin-granted access, keep an explicit override operation:

```text
POST /admin/subscriptions/override
```

This is NOT a Stripe payment.

It creates an administrative access entitlement.

The operation must require:

```text
user
plan
duration/access period
reason
```

The system must clearly distinguish:

```text
PAID SUBSCRIPTION
```

from:

```text
ADMIN OVERRIDE
```

Do not create a fake Stripe payment for an admin override.

Do not insert a fake completed payment with a Stripe PaymentIntent ID.

Every override must be audit logged.

---

# 6. Admin Payment Management

Admin payment APIs should be read-oriented.

Provide:

```text
GET /admin/payments
GET /admin/payments/:paymentId
GET /admin/payments/:paymentId/refunds
```

Payment detail should expose:

```text
Payment ID
User
Plan
Checkout Order
Amount
Subtotal
Discount
Currency
Provider
Payment Method
Payment Status
Paid At
Stripe PaymentIntent ID
Checkout Session ID
Refundable Amount
Refund Request Status
Refund History
Created/Updated timestamps
```

Do not expose card numbers or sensitive payment information.

Do not allow:

```text
DELETE payment
```

for completed financial records.

Do not allow admins to manually change a Stripe payment from:

```text
COMPLETED
→ REFUNDED
```

without an actual refund operation.

---

# 7. Refund Request Review

Implement the admin workflow:

```text
Learner
   ↓
Refund Request
   ↓
PENDING
   ↓
Admin Review
   ├── REJECTED
   └── APPROVED
          ↓
     Stripe Refund
          ↓
     Stripe Webhook
          ↓
     Final Refund Status
```

Admin endpoints:

```text
GET /admin/refund-requests
GET /admin/refund-requests/:requestId
POST /admin/refund-requests/:requestId/approve
POST /admin/refund-requests/:requestId/reject
```

Support:

* status filtering
* user search
* payment search
* date filtering
* pagination

---

# 8. Refund Approval

Approval means:

```text
Admin approves the learner's request
```

It does NOT necessarily mean:

```text
Stripe money has already been refunded
```

The actual Stripe refund must be a separate operation.

When approving:

1. Verify request is still `PENDING`.
2. Verify payment is still refundable.
3. Recalculate current refundable amount.
4. Ensure requested amount is still valid.
5. Record reviewer.
6. Record admin note.
7. Set request status to `APPROVED`.
8. Audit the approval.

Handle concurrent admin actions safely so two admins cannot approve the same pending request.

---

# 9. Actual Stripe Refund

Create/retain:

```text
POST /admin/payments/:paymentId/refunds
```

This is the ONLY workflow that creates an actual Stripe refund.

Requirements:

* payment belongs to the expected provider
* payment has a Stripe PaymentIntent
* payment status is refundable
* requested amount <= remaining refundable amount
* amount > 0
* no invalid duplicate refund
* Stripe secret remains backend-only

Use Stripe:

```text
stripe.refunds.create(...)
```

with appropriate idempotency protection.

Do not trust frontend refund amounts.

The backend must recalculate the refundable balance.

---

# 10. Refund Transaction

The actual refund should create/update:

```text
payment_refunds
```

with:

```text
payment_id
amount
currency
refund_status
stripe_refund_id
reason
refunded_at
```

Possible states:

```text
PENDING
SUCCEEDED
FAILED
```

Do not mark the payment fully refunded merely because the Stripe refund request was submitted.

The final state must reflect Stripe's actual result.

---

# 11. Stripe Refund Webhooks

Continue handling:

```text
charge.refunded
refund.created
refund.updated
```

Use the webhook to synchronize:

```text
payment_refunds
```

and:

```text
subscription_payments.payment_status
```

For example:

```text
COMPLETED
↓
PARTIALLY_REFUNDED
↓
REFUNDED
```

Calculate payment refund state from actual successful refund amounts.

Webhook processing must be:

* signature verified
* idempotent
* retry safe
* transaction safe

Duplicate Stripe events must not create duplicate refunds.

---

# 12. Refund Request vs Actual Refund

Keep these states completely separate.

### Refund Request

```text
PENDING
APPROVED
REJECTED
CANCELLED
```

### Stripe Refund

```text
PENDING
SUCCEEDED
FAILED
```

### Payment

```text
COMPLETED
PARTIALLY_REFUNDED
REFUNDED
FAILED
```

Example:

```text
Refund Request
    ↓
APPROVED
    ↓
Stripe Refund
    ↓
PENDING
    ↓
Stripe webhook
    ↓
SUCCEEDED
    ↓
Payment
    ↓
PARTIALLY_REFUNDED / REFUNDED
```

Never collapse these into one status.

---

# 13. Refund Rejection

Admin can reject a pending request.

Requirements:

* request must be `PENDING`
* admin must provide a reason/note
* set `reviewed_by`
* set `reviewed_at`
* set `admin_note`
* set status to `REJECTED`
* audit the decision

Rejecting a request must NOT create a Stripe refund.

---

# 14. Refund Request Cancellation

If the existing business rules allow learner cancellation, support:

```text
PENDING
→ CANCELLED
```

Only the learner who owns the request should be able to cancel it.

Do not allow cancellation after:

```text
APPROVED
```

or after an actual Stripe refund has started.

If cancellation is not currently required by the product, keep the database state but do not expose an unnecessary endpoint.

---

# 15. Subscription After Refund

Do NOT automatically invent refund/access behavior.

Implement the project's explicitly defined refund-access rule.

If the business rule is:

```text
Full refund
→ subscription cancelled/revoked
```

then implement that as a controlled business operation.

If the rule is:

```text
Full refund
→ payment refunded
→ subscription remains until end_date
```

then preserve access until expiration.

The rule must be centralized in the subscription/refund service rather than hidden inside a controller.

Do not let the frontend determine subscription access.

---

# 16. Financial Integrity

Production financial records must be treated as historical records.

Do not provide normal admin CRUD that allows:

```text
delete payment
delete refund
change amount
change Stripe PaymentIntent
change paid_at
```

Instead use:

```text
Stripe events
transactions
state transitions
audit logs
```

for financial changes.

Historical payment amounts must remain unchanged even if the plan or coupon changes later.

---

# 17. Idempotency & Concurrency

Handle:

* two admins approving the same request
* two refund requests for the same payment
* duplicate refund API requests
* Stripe API retry
* duplicate Stripe webhook
* webhook arriving before/after admin response
* database transaction failure
* Stripe API timeout
* partial refund followed by another refund
* refund amount exceeding remaining balance

Use:

* database constraints
* row locking where appropriate
* transactions
* Stripe idempotency keys
* unique Stripe refund IDs
* existing webhook idempotency mechanism

Never rely only on frontend button disabling.

---

# 18. Admin UI

Update:

```text
admin/src/pages/SubscriptionsPage.jsx
```

and related:

```text
admin/src/hooks/subscription/
admin/src/services/SubscriptionApi.js
```

Organize billing UI into:

```text
Plans
Subscriptions
Payments
Refund Requests
Refunds
```

## Refund Requests

Show:

* user
* payment
* amount
* reason
* requested date
* refund-window eligibility
* status

Actions:

```text
Review
Approve
Reject
```

---

## Payment Details

Show:

```text
Payment
Plan
Checkout Order
Amount
Discount
Payment status
Refundable amount
Refund requests
Refunds
Stripe reference
```

Actions:

```text
Create Refund
```

Only where the payment is refundable.

---

## Refund Modal

Before creating an actual refund show:

```text
Payment amount
Already refunded
Remaining refundable
Refund amount
Reason
```

For now the UI may remain full-refund oriented, but the backend must remain partial-refund ready.

Require confirmation before submitting.

---

# 19. Billing Statistics

Preserve/update:

```text
GET /admin/billing/stats
```

Stats should be based on actual payment/refund records.

Consider:

```text
Gross revenue
Successful payments
Refunded amount
Net revenue
Active subscriptions
```

Clearly define whether revenue metrics include/exclude refunds.

Do not count:

* checkout orders
* failed payments
* pending refund requests

as successful revenue.

---

# 20. Audit Logging

Audit all sensitive admin operations:

```text
subscription.admin.override
refund.request.approve
refund.request.reject
payment.refund.create
payment.refund.success
payment.refund.failed
plan.create
plan.update
plan.activate
plan.deactivate
```

Include:

```text
admin user
target
action
reason/note
timestamp
```

Do not log:

* Stripe secret keys
* card details
* sensitive payment credentials

---

# 21. Backend Architecture

Maintain:

```text
Route
 ↓
Controller
 ↓
Service
 ↓
Repository
 ↓
Database
```

Keep Stripe operations inside the appropriate service layer.

Repositories must not contain business rules.

Controllers should not directly call Stripe or perform database queries.

Avoid duplicating:

* refundable balance calculation
* refund validation
* Stripe refund creation
* subscription state logic
* audit logging

---

# 22. Existing Admin Legacy Code

Inspect the current admin implementation carefully.

The existing UI may still contain legacy CRUD such as:

```text
create subscription
update subscription
delete subscription
create payment
update payment
delete payment
```

Do NOT preserve dangerous financial CRUD simply because it exists.

Replace legacy payment CRUD with controlled operations.

The admin should NOT manually create a fake payment for a Stripe purchase.

A real Stripe payment comes from:

```text
Stripe
 ↓
Webhook
 ↓
Payment
```

An admin override is separate:

```text
Admin
 ↓
Subscription Override
```

No fake payment record.

---

# 23. API Summary

### Plans

```text
GET    /admin/plans
POST   /admin/plans
PATCH  /admin/plans/:planId
PATCH  /admin/plans/:planId/status
```

### Subscriptions

```text
GET    /admin/subscriptions
GET    /admin/subscriptions/:subscriptionId
POST   /admin/subscriptions/override
```

### Payments

```text
GET    /admin/payments
GET    /admin/payments/:paymentId
GET    /admin/payments/:paymentId/refunds
POST   /admin/payments/:paymentId/refunds
```

### Refund Requests

```text
GET    /admin/refund-requests
GET    /admin/refund-requests/:requestId
POST   /admin/refund-requests/:requestId/approve
POST   /admin/refund-requests/:requestId/reject
```

### Statistics

```text
GET /admin/billing/stats
```

Adjust routes to match the project's existing routing conventions.

---

# 24. Task Checklist

1. Inspect current admin billing implementation.
2. Inspect learner payment/refund schema from migration 0022.
3. Remove/replace unsafe legacy financial CRUD.
4. Implement admin refund-request listing/detail.
5. Implement refund approval/rejection.
6. Implement actual Stripe refund operation.
7. Add refund idempotency/concurrency protection.
8. Integrate Stripe refund webhooks.
9. Update payment/subscription state synchronization.
10. Implement/verify admin subscription override.
11. Update plan management.
12. Update payment management/read models.
13. Update billing statistics.
14. Update admin UI.
15. Update hooks/services/query keys.
16. Add audit logging.
17. Update documentation.
18. Run lint/build/migration verification.

---

# 25. Verification

Run:

```text
npm run db:migrate
```

Backend:

```text
npx eslint .
```

Frontend:

```text
npm run lint
npm run build
```

Manual test cases:

### Payment visibility

```text
Stripe payment
→ webhook
→ payment appears in admin
```

### Refund request

```text
Learner
→ refund request
→ admin sees PENDING
```

### Reject

```text
PENDING
→ admin rejects
→ REJECTED
→ no Stripe refund
```

### Approve + refund

```text
PENDING
→ APPROVED
→ Stripe refund
→ webhook
→ payment updated
```

### Duplicate approval

```text
Two admin requests
→ only one succeeds
```

### Duplicate refund

```text
Same refund request/API retry
→ no duplicate Stripe refund
```

### Partial refund

```text
Payment $100
→ refund $40
→ PARTIALLY_REFUNDED
→ refundable $60
```

### Full refund

```text
Payment $100
→ refund $100
→ REFUNDED
→ refundable $0
```

### Stripe webhook retry

```text
same refund webhook
→ no duplicate refund record
```

### Historical integrity

Verify that changing/deactivating a plan does not change existing:

* checkout order snapshot
* payment amount
* payment currency
* payment discount
* historical subscription information

---

# 26. Out of Scope

Do NOT implement:

* recurring billing
* Stripe subscriptions
* auto-renewal
* recurring invoices
* learner checkout changes
* learner refund-request redesign
* new framework
* new ORM
* fake/manual Stripe payment creation
* deletion of completed financial records

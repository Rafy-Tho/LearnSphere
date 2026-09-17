# Task: Complete and Improve the Billing & Subscription System

We already have an existing billing/subscription implementation in our Learning Online Platform.

Your job is to **inspect the existing code, database schema, API, Stripe integration, and frontend first**, then improve and complete the billing system.

Do NOT blindly rewrite the existing implementation. Preserve working functionality and existing project conventions where appropriate.

The goal is to make billing feel like a complete, production-quality feature while keeping the architecture simple and maintainable.

---

## 1. Existing Billing Scope

We currently have:

- `subscription_plans`
- `user_subscriptions`
- `subscription_payments`

We use Stripe for payments/subscriptions.

We now want to support:

- Subscription plans
- User subscriptions
- Payments
- Recurring billing where applicable
- Subscription expiration
- Subscription cancellation
- Coupon codes
- Percentage discounts
- Fixed-amount discounts
- Coupon redemption tracking
- Payment refunds
- Stripe webhook synchronization
- Payment history
- Subscription management
- Good user-facing billing UI/UX
- Admin billing management

---

# 2. First: Inspect the Existing Project

Before changing anything:

1. Inspect the current database schema.
2. Inspect existing subscription models/tables.
3. Inspect existing payment implementation.
4. Inspect Stripe integration.
5. Inspect Stripe checkout/payment code.
6. Inspect Stripe webhook handling.
7. Inspect subscription status enums.
8. Inspect payment status enums.
9. Inspect existing authentication/user relationships.
10. Inspect existing frontend billing/subscription pages.
11. Inspect existing admin dashboard.
12. Inspect existing API conventions.
13. Inspect validation/error-handling conventions.
14. Inspect existing UI design system and Tailwind configuration.

Do not introduce duplicate functionality.

Reuse existing utilities, components, hooks, services, middleware, validation, and API patterns whenever possible.

---

# 3. Database Design

Improve the billing schema around these core tables:

```text
subscription_plans
user_subscriptions
subscription_payments
payment_refunds
coupons
coupon_redemptions
stripe_webhook_events
```

Keep the design normalized and avoid unnecessary tables.

---

# 4. Subscription Plans

Improve `subscription_plans` so plans can be managed safely.

Recommended fields:

```text
id
name
description
duration_days
price
currency
is_active
created_at
updated_at
```

Requirements:

- Price must never be negative.
- Duration must be greater than zero.
- Currency should be stored explicitly.
- Plans should be deactivated instead of deleted when they have historical subscriptions/payments.
- Existing historical subscriptions must remain valid even if a plan becomes inactive.
- Avoid destructive cascading deletes that could destroy billing history.

If the current schema already has equivalent functionality, improve it rather than duplicating it.

---

# 5. User Subscriptions

Improve `user_subscriptions`.

It should support:

- User
- Plan
- Start date
- End date
- Status
- Cancellation scheduling
- Actual cancellation timestamp
- Stripe customer ID
- Stripe subscription ID
- Created/updated timestamps

Conceptually:

```text
user
  ↓
subscription
  ↓
plan
```

Support states such as:

```text
ACTIVE
CANCELED
EXPIRED
PENDING
PAST_DUE
```

Use the project's existing enum/status conventions if they already exist.

Important:

A user who cancels at the end of their billing period should normally retain access until the subscription actually ends.

Example:

```text
Started:        September 1
Cancel request: September 15
Access until:   September 30
Canceled:       September 30
```

Do not immediately remove access unless the existing business rules explicitly require immediate cancellation.

---

# 6. Payments

Improve `subscription_payments`.

A payment should record the actual financial transaction rather than relying on the current plan price.

Recommended concepts:

```text
id
user_subscription_id
subtotal
discount_amount
total_amount
currency
payment_status
coupon_id
stripe_payment_intent_id
stripe_invoice_id
paid_at
failure_reason
created_at
updated_at
```

The system should preserve the historical amount.

For example:

```text
Plan price:       $20
Discount:          $5
Total charged:    $15
```

Even if the plan later changes to $25, the historical payment must remain $15.

Validate:

```text
discount_amount <= subtotal
total_amount = subtotal - discount_amount
```

Do not trust prices or discount amounts directly from the frontend.

The backend must calculate the final amount.

---

# 7. Coupons

Add coupon support.

Create a `coupons` table that supports:

```text
id
code
discount_type
discount_value
max_redemptions
redemption_count
starts_at
expires_at
is_active
created_at
updated_at
```

Support:

```text
PERCENTAGE
FIXED_AMOUNT
```

Examples:

```text
WELCOME20
20% off
```

and:

```text
SAVE5
$5 off
```

Requirements:

- Coupon code should be unique.
- Normalize coupon codes consistently, preferably case-insensitively.
- Percentage discounts must be within a valid range.
- Fixed discounts cannot be negative.
- Expired coupons cannot be used.
- Inactive coupons cannot be used.
- Coupons that have reached their maximum redemption count cannot be used.
- Backend must validate the coupon.
- Frontend must never be trusted to calculate the final price.

---

# 8. Coupon Redemptions

Create:

```text
coupon_redemptions
```

It should track:

```text
id
coupon_id
user_id
payment_id
discount_amount
redeemed_at
```

This provides a historical record of coupon usage.

The system should be able to answer:

- Which users used a coupon?
- How many times was it used?
- Which payment used it?
- How much discount did it provide?
- When was it redeemed?

Prevent duplicate redemption according to the business rules.

If the product only allows a coupon to be used once per user, enforce that at the database/business-logic level.

---

# 9. Refunds

Add:

```text
payment_refunds
```

Recommended fields:

```text
id
payment_id
amount
currency
refund_status
stripe_refund_id
reason
refunded_at
created_at
updated_at
```

Support:

```text
PENDING
SUCCEEDED
FAILED
```

A payment may have one or more refund records if partial refunds are supported.

Example:

```text
Payment: $20

Refund #1: $5
Refund #2: $15

Total refunded: $20
```

Never allow total refunds to exceed the original payment amount.

The backend must validate refund amounts.

Refunds should be processed through Stripe rather than simply changing the local database status.

---

# 10. Stripe Integration

Review the current Stripe integration and make it reliable.

Use Stripe as the source of truth for Stripe-side payment/subscription events.

Store relevant Stripe identifiers such as:

```text
stripe_customer_id
stripe_subscription_id
stripe_payment_intent_id
stripe_invoice_id
stripe_refund_id
```

Do not expose Stripe secret keys to the frontend.

Do not trust client-provided payment status.

---

# 11. Stripe Webhooks

Improve webhook handling.

Add:

```text
stripe_webhook_events
```

Store:

```text
id
stripe_event_id
event_type
processed_at
created_at
```

Use the Stripe event ID for idempotency.

If the same webhook is received twice:

```text
first request
    ↓
process event
    ↓
store event ID

second request
    ↓
event already exists
    ↓
do not process twice
```

Handle the relevant Stripe events for the existing implementation, such as:

- Checkout completion
- Payment success
- Payment failure
- Invoice payment success
- Invoice payment failure
- Subscription created
- Subscription updated
- Subscription canceled
- Refund events

Do not implement events that are unnecessary for the actual Stripe integration.

Verify Stripe webhook signatures.

Webhook processing should be safe to retry.

---

# 12. Subscription Lifecycle

Make the subscription lifecycle consistent.

Handle:

```text
PENDING
   ↓
ACTIVE
   ↓
CANCELED
```

and:

```text
ACTIVE
   ↓
PAST_DUE
```

and:

```text
ACTIVE
   ↓
EXPIRED
```

Do not rely only on frontend state.

Access to premium courses/features should be determined from the backend subscription state.

Consider expiration based on the stored subscription end date and/or verified Stripe state.

---

# 13. Checkout Flow

Create a clean checkout flow.

Example:

```text
Pricing
   ↓
Select Plan
   ↓
Checkout
   ↓
Enter Coupon
   ↓
Validate Coupon
   ↓
Show Discount
   ↓
Confirm Payment
   ↓
Stripe
   ↓
Success
   ↓
Subscription Active
```

Before payment, display:

```text
Plan
$20.00

Coupon
WELCOME20
- $4.00

Total
$16.00
```

The final amount must be calculated and validated by the backend.

---

# 14. Coupon UX

On checkout provide:

```text
Coupon code
[________________] [Apply]
```

When valid:

```text
✓ Coupon applied

Subtotal      $20.00
Discount      -$4.00
Total         $16.00
```

When invalid:

```text
Coupon code is invalid or expired.
```

Do not expose unnecessary internal validation details.

Support removing a coupon:

```text
WELCOME20   [Remove]
```

After removing it, restore the original price.

---

# 15. User Subscription Page

Create or improve a dedicated subscription/billing page.

It should clearly show:

```text
Current Plan
────────────────────

Premium
$20 / month

Status
Active

Started
September 1, 2026

Next billing
October 1, 2026

[ Manage Subscription ]
```

If cancellation is scheduled:

```text
Cancellation scheduled

Your subscription remains active until
September 30, 2026.

[ Keep Subscription ]
```

If expired:

```text
Subscription expired

[ View Plans ]
```

---

# 16. Payment History

Add a payment history section.

Example:

```text
Payment History

Date          Description       Amount     Status
---------------------------------------------------
Sep 1         Premium           $16.00     Paid
Aug 1         Premium           $20.00     Paid
Jul 1         Premium           $20.00     Paid
```

Show:

- Date
- Plan
- Original amount
- Discount
- Final amount
- Status
- Refund status where applicable

Allow users to view payment details.

---

# 17. Payment Details UI

When a user opens a payment:

```text
Payment Details

Premium Plan

Subtotal          $20.00
Coupon            WELCOME20
Discount           -$4.00
Total              $16.00

Status             Paid
Payment date       Sep 1, 2026

Payment ID
••••••••1234
```

If refunded:

```text
Refunded

Original payment   $20.00
Refunded            $20.00
```

For partial refund:

```text
Original payment   $20.00
Refunded             $5.00
Remaining           $15.00
```

---

# 18. Cancel Subscription UX

Cancellation should not be one accidental click.

Use a confirmation dialog.

Example:

```text
Cancel subscription?

You'll continue to have access until
September 30, 2026.

After that, your premium access will end.

[ Keep Subscription ] [ Cancel Subscription ]
```

After cancellation:

```text
Cancellation scheduled
```

Allow the user to undo cancellation if Stripe/business rules support it.

---

# 19. Refund UX

For normal users, do not expose admin refund controls.

If your product allows users to request refunds, provide:

```text
Request Refund
```

with:

```text
Reason
[ Select reason ]

Additional details
[_____________________]

[ Submit Request ]
```

If refunds are admin-controlled, keep the refund action in the admin dashboard.

---

# 20. Admin Billing Dashboard

Improve the admin UI.

Provide:

```text
Billing Overview

Active subscriptions
123

Revenue
$4,250

Payments
156

Refunds
8

Active coupons
12
```

Do not overcomplicate the dashboard.

Provide sections for:

```text
Subscriptions
Payments
Refunds
Coupons
Plans
```

---

# 21. Admin Subscription Management

Admin should be able to:

- View subscriptions
- Search by user
- Filter by status
- View plan
- View start/end dates
- View Stripe IDs where appropriate
- View payment history
- View cancellation status

Avoid allowing admins to directly manipulate Stripe state without going through the appropriate Stripe operation.

---

# 22. Admin Coupon Management

Admin should be able to:

```text
Create Coupon
Edit Coupon
Activate/Deactivate Coupon
View Usage
```

Example:

```text
WELCOME20
20% OFF

Used: 42 / 100
Starts: Sep 1
Expires: Oct 1

Status: Active
```

Include:

```text
Code
Discount type
Discount value
Maximum redemptions
Start date
Expiration date
Active status
```

---

# 23. Admin Refund Management

Admin should be able to:

- View payments
- View refund history
- Issue a refund
- Issue a partial refund
- See refund status
- See refund reason
- See Stripe refund ID

Before refund:

```text
Refund Payment

Original payment: $20.00
Already refunded: $5.00
Available refund: $15.00

Refund amount
[$________]

Reason
[___________]

[Cancel] [Refund]
```

Require confirmation before issuing the Stripe refund.

---

# 24. UI/UX Design Requirements

The billing UI should feel like a modern SaaS application.

Use the project's existing Tailwind setup and design tokens.

Do not introduce random colors or excessive styling.

Design principles:

- Clean
- Modern
- Professional
- Consistent
- Good spacing
- Strong visual hierarchy
- Clear status indicators
- Accessible
- Responsive
- Mobile friendly
- Minimal visual clutter

Avoid:

- Excessive gradients
- Excessive rounded cards
- Huge headings
- Too many colors
- Purple-heavy designs
- Repeated UI patterns
- Duplicate Tailwind classes
- Inline styles when reusable classes/components are appropriate

Use semantic design tokens instead of hardcoded colors where the project already provides them.

---

# 25. Billing Status UI

Use consistent visual states for:

```text
Active
Pending
Paid
Failed
Canceled
Expired
Past Due
Refunded
Partially Refunded
```

Status should be immediately understandable.

Don't rely only on color.

Use:

```text
icon + label
```

where appropriate.

Ensure sufficient contrast in both light and dark themes.

---

# 26. Loading / Empty / Error States

Every billing page should handle:

### Loading

Use appropriate skeleton/loading UI.

### Empty

Example:

```text
No payment history yet.

Your payments will appear here after
you subscribe to a plan.
```

### Error

Example:

```text
We couldn't load your billing information.

[ Try Again ]
```

### Payment failure

Explain what happened without exposing technical errors.

Example:

```text
Your payment could not be completed.

Please check your payment method and try again.
```

---

# 27. Responsive Design

Make all billing pages work properly on:

- Desktop
- Tablet
- Mobile

On mobile:

- Stack pricing cards where appropriate.
- Make checkout easy to use.
- Make payment tables responsive.
- Convert wide tables into cards where appropriate.
- Keep important actions accessible.
- Avoid horizontal overflow.

---

# 28. Backend API

Follow the project's existing API conventions.

Potential endpoints:

```text
GET    /subscriptions/plans
GET    /subscriptions/me
POST   /subscriptions/checkout
POST   /subscriptions/cancel
POST   /subscriptions/reactivate

GET    /payments
GET    /payments/:id

POST   /coupons/validate

POST   /webhooks/stripe
```

Admin:

```text
GET    /admin/subscriptions
GET    /admin/payments
GET    /admin/refunds
POST   /admin/refunds
GET    /admin/coupons
POST   /admin/coupons
PATCH  /admin/coupons/:id
GET    /admin/coupons/:id/redemptions
```

These are examples only. Follow the existing project's route conventions and don't create duplicate endpoints.

---

# 29. Validation and Security

Important:

Never trust:

- Price from frontend
- Discount amount from frontend
- Payment status from frontend
- Subscription status from frontend
- Coupon validity from frontend

The server must validate everything.

Implement:

- Authentication
- Authorization
- Admin authorization
- Input validation
- Coupon validation
- Refund amount validation
- Stripe webhook signature verification
- Idempotent webhook processing
- Safe error messages
- Rate limiting where appropriate

Never expose:

```text
STRIPE_SECRET_KEY
```

to the frontend.

---

# 30. Database Constraints and Indexes

Review the database and add appropriate indexes for common queries.

Consider indexes on:

```text
user_subscriptions.user_id
user_subscriptions.status
user_subscriptions.stripe_subscription_id

subscription_payments.user_subscription_id
subscription_payments.payment_status
subscription_payments.stripe_payment_intent_id

coupons.code
coupons.is_active

coupon_redemptions.coupon_id
coupon_redemptions.user_id

payment_refunds.payment_id
payment_refunds.refund_status

stripe_webhook_events.stripe_event_id
```

Use unique constraints where appropriate.

Avoid unnecessary indexes.

---

# 31. Business Rules

Make these rules explicit in the implementation.

### Coupon

```text
inactive → cannot use
expired → cannot use
not started → cannot use
max redemptions reached → cannot use
invalid percentage → cannot use
discount > subtotal → cap/reject according to business rule
```

### Refund

```text
refund <= remaining refundable amount
```

### Subscription

```text
active subscription → premium access
expired subscription → premium access removed
scheduled cancellation → access remains until end date
```

### Payment

```text
successful Stripe payment → paid
failed Stripe payment → failed
refund processed → refund record updated
```

---

# 32. Don't Overengineer

This is important.

Do not introduce:

- unnecessary microservices
- unnecessary event buses
- complex billing abstractions
- excessive design patterns
- unnecessary tables
- unnecessary state machines
- unnecessary dependencies

Keep it appropriate for a modern full-stack web application.

Prefer:

```text
React
Node.js
Express
PostgreSQL
Stripe
```

and the project's existing libraries.

Use JavaScript, not TypeScript, unless the existing project already requires otherwise.

---

# 33. Testing

After implementation, test the important flows.

### Subscription

```text
Create subscription
Successful payment
Failed payment
Subscription expiration
Cancellation
Cancellation reversal
```

### Coupon

```text
Valid coupon
Invalid coupon
Expired coupon
Inactive coupon
Maximum redemption reached
Percentage discount
Fixed discount
Duplicate redemption
```

### Refund

```text
Full refund
Partial refund
Multiple partial refunds
Refund exceeding payment
Failed refund
```

### Webhooks

```text
Successful webhook
Duplicate webhook
Invalid webhook signature
Payment webhook
Subscription webhook
Refund webhook
```

### Authorization

Verify:

```text
User cannot access admin billing
User cannot refund another user's payment
User cannot manipulate another user's subscription
User cannot change payment amount
```

---

# 34. Implementation Strategy

Work in this order:

```text
1. Inspect existing implementation
2. Identify gaps
3. Design database changes
4. Update migrations
5. Update backend models/services
6. Update Stripe integration
7. Implement webhook synchronization
8. Implement coupon logic
9. Implement refund logic
10. Update API routes
11. Update frontend services/hooks
12. Build/update pricing UI
13. Build/update checkout UI
14. Build/update subscription management UI
15. Build/update payment history UI
16. Build/update admin billing UI
17. Add loading/error/empty states
18. Test critical flows
19. Refactor duplicated code
20. Review security and consistency
```

---

# 35. Code Quality

While implementing:

- Follow existing project structure.
- Keep responsibilities separated.
- Avoid huge controllers.
- Put business logic in appropriate services.
- Reuse validation.
- Reuse UI components.
- Avoid duplicate Tailwind classes.
- Avoid duplicate API logic.
- Use consistent naming.
- Keep functions focused.
- Handle errors consistently.
- Add comments only where the logic is not obvious.

Do not refactor unrelated parts of the application.

---

# 36. Final Review

After completing the implementation, review the entire billing feature as if it were going into production.

Check:

```text
[ ] Plans work
[ ] Subscriptions work
[ ] Payments work
[ ] Stripe integration works
[ ] Webhooks are verified
[ ] Webhooks are idempotent
[ ] Coupons work
[ ] Coupon redemption is tracked
[ ] Discounts are stored historically
[ ] Refunds work
[ ] Partial refunds work
[ ] Subscription cancellation works
[ ] Payment history works
[ ] Admin billing works
[ ] Authorization is correct
[ ] Validation is correct
[ ] Database constraints are correct
[ ] Indexes are reasonable
[ ] Mobile UI works
[ ] Dark mode works
[ ] Light mode works
[ ] Loading states exist
[ ] Empty states exist
[ ] Error states exist
[ ] No unnecessary duplicate code
[ ] No unnecessary dependencies
[ ] No unrelated files were changed
```

Finally, provide a concise implementation summary:

```text
Database changes:
- ...

Backend changes:
- ...

Stripe changes:
- ...

Frontend changes:
- ...

Admin changes:
- ...

Testing:
- ...

Remaining issues:
- ...
```

If something in the existing architecture conflicts with this specification, **do not blindly force the specification**. Explain the conflict, choose the smallest compatible solution, and preserve existing working behavior.

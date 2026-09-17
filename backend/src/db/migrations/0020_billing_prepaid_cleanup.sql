-- 0020_billing_prepaid_cleanup.sql
-- Align the billing schema with the prepaid, one-time payment model.
-- Drops unused recurring-billing columns/indexes, adds plan features and
-- webhook processing status, and reconciles the discount_amount check.
-- Forward-only; safe to re-run.

-- subscription_plans: feature list rendered by the pricing UI
ALTER TABLE subscription_plans
  ADD COLUMN IF NOT EXISTS features JSONB NOT NULL DEFAULT '[]'::jsonb;

-- user_subscriptions: drop recurring-only columns
ALTER TABLE user_subscriptions
  DROP COLUMN IF EXISTS cancel_at_period_end,
  DROP COLUMN IF EXISTS cancelled_at,
  DROP COLUMN IF EXISTS stripe_customer_id,
  DROP COLUMN IF EXISTS stripe_subscription_id;

-- subscription_payments: no invoices in the prepaid model
ALTER TABLE subscription_payments
  DROP COLUMN IF EXISTS stripe_invoice_id;

-- stripe_webhook_events: store processing status
ALTER TABLE stripe_webhook_events
  ADD COLUMN IF NOT EXISTS status TEXT NOT NULL DEFAULT 'PENDING';

-- indexes tied to dropped columns
DROP INDEX IF EXISTS idx_user_subscriptions_stripe_sub;
DROP INDEX IF EXISTS idx_subscription_payments_invoice;

-- reconcile fresh-install vs migrated drift: discount_amount >= 0
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint
    WHERE conrelid = 'subscription_payments'::regclass
      AND conname = 'subscription_payments_discount_amount_check'
  ) THEN
    ALTER TABLE subscription_payments
      ADD CONSTRAINT subscription_payments_discount_amount_check
      CHECK (discount_amount >= 0);
  END IF;
END $$;

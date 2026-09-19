-- 0024_admin_refund_workflow.sql
-- Admin billing workflow hardening: refund idempotency, refund-request ->
-- actual-refund traceability, and paid-vs-override subscription source.
-- Additive only; no data destruction.

-- ---------------------------------------------------------------------------
-- payment_refunds: stable idempotency key so admin refund retries cannot
-- create duplicate Stripe refunds or duplicate financial records.
-- ---------------------------------------------------------------------------
ALTER TABLE payment_refunds
  ADD COLUMN IF NOT EXISTS idempotency_key TEXT;

CREATE UNIQUE INDEX IF NOT EXISTS unique_payment_refund_idempotency_key
  ON payment_refunds(idempotency_key)
  WHERE idempotency_key IS NOT NULL;

-- ---------------------------------------------------------------------------
-- user_subscriptions: distinguish a paid entitlement from an administrative
-- override entitlement (override creates no fake Stripe payment record).
-- ---------------------------------------------------------------------------
ALTER TABLE user_subscriptions
  ADD COLUMN IF NOT EXISTS source TEXT NOT NULL DEFAULT 'PAID';

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint
    WHERE conrelid = 'user_subscriptions'::regclass
      AND conname = 'user_subscriptions_source_check'
  ) THEN
    ALTER TABLE user_subscriptions
      ADD CONSTRAINT user_subscriptions_source_check
      CHECK (source IN ('PAID', 'ADMIN_OVERRIDE'));
  END IF;
END $$;

-- ---------------------------------------------------------------------------
-- refund_requests: link the reviewed request to the actual payment_refunds row
-- that fulfilled it (if any).
-- ---------------------------------------------------------------------------
ALTER TABLE refund_requests
  ADD COLUMN IF NOT EXISTS payment_refund_id UUID;

ALTER TABLE refund_requests
  DROP CONSTRAINT IF EXISTS refund_requests_payment_refund_id_fkey;
ALTER TABLE refund_requests
  ADD CONSTRAINT refund_requests_payment_refund_id_fkey
  FOREIGN KEY (payment_refund_id) REFERENCES payment_refunds(id) ON DELETE SET NULL;

CREATE INDEX IF NOT EXISTS idx_refund_requests_payment_refund
  ON refund_requests(payment_refund_id);

-- 0018_billing_schema.sql
-- Billing improvements: coupons, redemptions, refunds, webhook idempotency,
-- extra plan/subscription/payment fields, non-destructive plan FK, indexes.
--
-- NOTE: new enum values are added here but must not be USED in this same
-- transaction (PostgreSQL restriction). They are first used by 0019+ / app code.

-- ---------------------------------------------------------------------------
-- Enum additions (additive; existing values are preserved)
-- ---------------------------------------------------------------------------
ALTER TYPE subscription_status ADD VALUE IF NOT EXISTS 'PENDING';
ALTER TYPE payment_status ADD VALUE IF NOT EXISTS 'PARTIALLY_REFUNDED';

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'discount_type') THEN
    CREATE TYPE discount_type AS ENUM ('PERCENTAGE','FIXED_AMOUNT');
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'refund_status') THEN
    CREATE TYPE refund_status AS ENUM ('PENDING','SUCCEEDED','FAILED');
  END IF;
END $$;

-- ---------------------------------------------------------------------------
-- subscription_plans: manage safely (description, currency, active flag)
-- ---------------------------------------------------------------------------
ALTER TABLE subscription_plans
  ADD COLUMN IF NOT EXISTS description TEXT,
  ADD COLUMN IF NOT EXISTS currency VARCHAR(3) NOT NULL DEFAULT 'usd',
  ADD COLUMN IF NOT EXISTS is_active BOOLEAN NOT NULL DEFAULT TRUE;

-- ---------------------------------------------------------------------------
-- user_subscriptions: cancellation scheduling + Stripe identifiers
-- ---------------------------------------------------------------------------
ALTER TABLE user_subscriptions
  ADD COLUMN IF NOT EXISTS cancel_at_period_end BOOLEAN NOT NULL DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS cancelled_at TIMESTAMPTZ,
  ADD COLUMN IF NOT EXISTS stripe_customer_id TEXT,
  ADD COLUMN IF NOT EXISTS stripe_subscription_id TEXT;

-- ---------------------------------------------------------------------------
-- subscription_payments: historical amounts + coupon + Stripe invoice
-- `amount` remains the final charged total (subtotal - discount_amount).
-- ---------------------------------------------------------------------------
ALTER TABLE subscription_payments
  ADD COLUMN IF NOT EXISTS subtotal NUMERIC(10,2),
  ADD COLUMN IF NOT EXISTS discount_amount NUMERIC(10,2) NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS currency VARCHAR(3) NOT NULL DEFAULT 'usd',
  ADD COLUMN IF NOT EXISTS coupon_id UUID,
  ADD COLUMN IF NOT EXISTS stripe_invoice_id TEXT,
  ADD COLUMN IF NOT EXISTS paid_at TIMESTAMPTZ,
  ADD COLUMN IF NOT EXISTS failure_reason TEXT;

-- ---------------------------------------------------------------------------
-- coupons
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS coupons (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  code VARCHAR(50) NOT NULL UNIQUE, -- stored uppercase
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

DROP TRIGGER IF EXISTS trg_coupons_updated_at ON coupons;
CREATE TRIGGER trg_coupons_updated_at
BEFORE UPDATE ON coupons
FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- ---------------------------------------------------------------------------
-- coupon_redemptions (historical coupon usage)
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS coupon_redemptions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  coupon_id UUID NOT NULL REFERENCES coupons(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  payment_id UUID NOT NULL REFERENCES subscription_payments(id) ON DELETE CASCADE,
  discount_amount NUMERIC(10,2) NOT NULL CHECK (discount_amount >= 0),
  redeemed_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT unique_coupon_per_user UNIQUE (coupon_id, user_id),
  CONSTRAINT unique_coupon_redemption_payment UNIQUE (payment_id)
);

-- ---------------------------------------------------------------------------
-- payment_refunds (one payment may have many partial refunds)
-- ---------------------------------------------------------------------------
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

DROP TRIGGER IF EXISTS trg_payment_refunds_updated_at ON payment_refunds;
CREATE TRIGGER trg_payment_refunds_updated_at
BEFORE UPDATE ON payment_refunds
FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- ---------------------------------------------------------------------------
-- stripe_webhook_events (idempotent processing by Stripe event id)
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS stripe_webhook_events (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  stripe_event_id TEXT NOT NULL UNIQUE,
  event_type TEXT NOT NULL,
  processed_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- ---------------------------------------------------------------------------
-- Foreign keys: protect billing history
-- ---------------------------------------------------------------------------
ALTER TABLE user_subscriptions DROP CONSTRAINT IF EXISTS user_subscriptions_plan_id_fkey;
ALTER TABLE user_subscriptions
  ADD CONSTRAINT user_subscriptions_plan_id_fkey
  FOREIGN KEY (plan_id) REFERENCES subscription_plans(id) ON DELETE RESTRICT;

ALTER TABLE subscription_payments DROP CONSTRAINT IF EXISTS subscription_payments_coupon_id_fkey;
ALTER TABLE subscription_payments
  ADD CONSTRAINT subscription_payments_coupon_id_fkey
  FOREIGN KEY (coupon_id) REFERENCES coupons(id) ON DELETE SET NULL;

-- ---------------------------------------------------------------------------
-- Indexes for common billing queries
-- ---------------------------------------------------------------------------
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

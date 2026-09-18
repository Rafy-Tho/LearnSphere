-- 0022_learner_checkout_refunds.sql
-- Learner payment refactor: checkout orders (purchase attempt before payment),
-- coupon reservations (concurrency-safe redemption capacity), payment provider
-- metadata, and learner refund requests. Additive only; no data destruction.

-- ---------------------------------------------------------------------------
-- Enums (new types may be used in this same transaction)
-- ---------------------------------------------------------------------------
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'checkout_order_status') THEN
    CREATE TYPE checkout_order_status AS ENUM (
      'CREATED','CHECKOUT_STARTED','PAID','FAILED','EXPIRED','CANCELLED'
    );
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'refund_request_status') THEN
    CREATE TYPE refund_request_status AS ENUM (
      'PENDING','APPROVED','REJECTED','CANCELLED'
    );
  END IF;
END $$;

-- ---------------------------------------------------------------------------
-- checkout_orders: a purchase attempt before an actual payment exists.
-- Financial values are snapshotted so history never depends on the current plan.
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS checkout_orders (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  plan_id UUID NOT NULL REFERENCES subscription_plans(id) ON DELETE RESTRICT,
  coupon_id UUID REFERENCES coupons(id) ON DELETE SET NULL,
  plan_name VARCHAR(50) NOT NULL,
  duration_days INT NOT NULL CHECK (duration_days > 0),
  subtotal NUMERIC(10,2) NOT NULL CHECK (subtotal >= 0),
  discount_amount NUMERIC(10,2) NOT NULL DEFAULT 0 CHECK (discount_amount >= 0),
  total_amount NUMERIC(10,2) NOT NULL CHECK (total_amount >= 0),
  currency VARCHAR(3) NOT NULL DEFAULT 'usd',
  status checkout_order_status NOT NULL DEFAULT 'CREATED',
  stripe_checkout_session_id TEXT UNIQUE,
  stripe_payment_intent_id TEXT UNIQUE,
  expires_at TIMESTAMPTZ NOT NULL,
  created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_checkout_orders_user ON checkout_orders(user_id);
CREATE INDEX IF NOT EXISTS idx_checkout_orders_status ON checkout_orders(status);

DROP TRIGGER IF EXISTS trg_checkout_orders_updated_at ON checkout_orders;
CREATE TRIGGER trg_checkout_orders_updated_at
BEFORE UPDATE ON checkout_orders
FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- ---------------------------------------------------------------------------
-- coupon_reservations: holds coupon capacity while a checkout is in flight.
-- released_at IS NULL = active. Finalize/release stamps released_at.
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS coupon_reservations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  coupon_id UUID NOT NULL REFERENCES coupons(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  checkout_order_id UUID NOT NULL REFERENCES checkout_orders(id) ON DELETE CASCADE,
  expires_at TIMESTAMPTZ NOT NULL,
  released_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT unique_coupon_reservation_order UNIQUE (checkout_order_id)
);

-- One active reservation per (coupon, user).
CREATE UNIQUE INDEX IF NOT EXISTS unique_active_coupon_reservation
  ON coupon_reservations(coupon_id, user_id)
  WHERE released_at IS NULL;
CREATE INDEX IF NOT EXISTS idx_coupon_reservations_coupon
  ON coupon_reservations(coupon_id);

-- ---------------------------------------------------------------------------
-- coupons: reserved capacity counter (reserved_count + redemption_count)
-- must never exceed max_redemptions.
-- ---------------------------------------------------------------------------
ALTER TABLE coupons
  ADD COLUMN IF NOT EXISTS reserved_count INT NOT NULL DEFAULT 0;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint
    WHERE conrelid = 'coupons'::regclass
      AND conname = 'coupons_reserved_count_check'
  ) THEN
    ALTER TABLE coupons
      ADD CONSTRAINT coupons_reserved_count_check CHECK (reserved_count >= 0);
  END IF;
END $$;

-- ---------------------------------------------------------------------------
-- subscription_payments: payment provider metadata + source checkout order.
-- ---------------------------------------------------------------------------
ALTER TABLE subscription_payments
  ADD COLUMN IF NOT EXISTS provider VARCHAR(20) NOT NULL DEFAULT 'STRIPE',
  ADD COLUMN IF NOT EXISTS payment_method VARCHAR(30) NOT NULL DEFAULT 'card',
  ADD COLUMN IF NOT EXISTS checkout_order_id UUID;

ALTER TABLE subscription_payments
  DROP CONSTRAINT IF EXISTS subscription_payments_checkout_order_id_fkey;
ALTER TABLE subscription_payments
  ADD CONSTRAINT subscription_payments_checkout_order_id_fkey
  FOREIGN KEY (checkout_order_id) REFERENCES checkout_orders(id) ON DELETE SET NULL;

CREATE INDEX IF NOT EXISTS idx_subscription_payments_checkout_order
  ON subscription_payments(checkout_order_id);

-- ---------------------------------------------------------------------------
-- refund_requests: learner's request for a refund. Distinct from
-- payment_refunds (the actual financial refund handled by the admin workflow).
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS refund_requests (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  payment_id UUID NOT NULL REFERENCES subscription_payments(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  requested_amount NUMERIC(10,2) NOT NULL CHECK (requested_amount > 0),
  currency VARCHAR(3) NOT NULL DEFAULT 'usd',
  reason VARCHAR(255) NOT NULL,
  user_note TEXT,
  status refund_request_status NOT NULL DEFAULT 'PENDING',
  reviewed_by UUID REFERENCES users(id) ON DELETE SET NULL,
  admin_note TEXT,
  requested_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  reviewed_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- At most one PENDING request per payment.
CREATE UNIQUE INDEX IF NOT EXISTS one_pending_refund_request_per_payment
  ON refund_requests(payment_id)
  WHERE status = 'PENDING';
CREATE INDEX IF NOT EXISTS idx_refund_requests_payment ON refund_requests(payment_id);
CREATE INDEX IF NOT EXISTS idx_refund_requests_user ON refund_requests(user_id);
CREATE INDEX IF NOT EXISTS idx_refund_requests_status ON refund_requests(status);

DROP TRIGGER IF EXISTS trg_refund_requests_updated_at ON refund_requests;
CREATE TRIGGER trg_refund_requests_updated_at
BEFORE UPDATE ON refund_requests
FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- 0023_checkout_order_context_unique.sql
-- Enforce at most one open checkout order per (user, plan, coupon) context so
-- concurrent duplicate checkout requests cannot create duplicate orders.

CREATE UNIQUE INDEX IF NOT EXISTS one_open_checkout_order_per_context
ON checkout_orders(
  user_id,
  plan_id,
  COALESCE(coupon_id, '00000000-0000-0000-0000-000000000000'::uuid)
)
WHERE status IN ('CREATED', 'CHECKOUT_STARTED');

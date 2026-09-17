-- 0019_billing_backfill.sql
-- Backfill new billing columns for pre-existing rows. Data only, no DDL.

-- Existing payments already represent the final charged amount with no discount.
UPDATE subscription_payments
   SET subtotal = COALESCE(subtotal, amount),
       discount_amount = COALESCE(discount_amount, 0),
       paid_at = COALESCE(paid_at, created_at)
 WHERE subtotal IS NULL
    OR discount_amount IS NULL
    OR paid_at IS NULL;

-- Plans default to active USD.
UPDATE subscription_plans SET currency = 'usd' WHERE currency IS NULL;
UPDATE subscription_plans SET is_active = TRUE WHERE is_active IS NULL;

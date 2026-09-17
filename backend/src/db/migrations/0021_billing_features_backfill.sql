-- 0021_billing_features_backfill.sql
-- Backfill a default feature list for plans created before features existed.

UPDATE subscription_plans
SET features = '[
  "Unlimited access to all courses",
  "Track your learning progress",
  "Certificate on course completion",
  "Priority support"
]'::jsonb
WHERE features IS NULL OR features = '[]'::jsonb;

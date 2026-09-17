-- 000_subscription_plans.sql
-- Baseline subscription plans. Idempotent: re-running is a no-op.
-- UUIDs match the values previously hard-coded in the learner frontend so any
-- historical references remain valid.

INSERT INTO subscription_plans (id, name, description, duration_days, price, currency, is_active, features)
VALUES
  (
    '00c7b88f-fcf3-4d7c-a10d-c83efe587e9d',
    '1 Month',
    'Perfect for getting started with your learning journey.',
    30, 5.00, 'usd', TRUE,
    '["Unlimited access to all courses","Track your learning progress","Certificate on course completion","Priority support"]'::jsonb
  ),
  (
    '618a46ae-30e6-4983-ad0b-fa3126df19e6',
    '6 Months',
    'Best value for consistent learners and skill builders.',
    180, 20.00, 'usd', TRUE,
    '["Unlimited access to all courses","Track your learning progress","Certificate on course completion","Priority support"]'::jsonb
  ),
  (
    'd196d5c8-3cd0-46ac-b6ec-0a676d189216',
    '12 Months',
    'Complete package for mastering skills and career growth.',
    360, 30.00, 'usd', TRUE,
    '["Unlimited access to all courses","Track your learning progress","Certificate on course completion","Priority support"]'::jsonb
  )
ON CONFLICT (id) DO NOTHING;

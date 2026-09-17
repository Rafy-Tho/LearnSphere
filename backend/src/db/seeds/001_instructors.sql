-- ============================================================================
-- SEED 001: Instructors
-- 5 instructor accounts (users.role = 'INSTRUCTOR').
-- password = NULL per plan: instructors set their own password via the
-- invite / password-reset flow (schema allows NULL since migration 0014).
-- Idempotent: INSERT ... ON CONFLICT (email) DO NOTHING keeps rows stable.
-- ============================================================================

INSERT INTO users (id, name, email, role, status, email_verified_at) VALUES
  ('10000000-0000-4000-8000-000000000001', 'Sarah Chen',       'sarah.chen@devacademy.io',       'INSTRUCTOR', 'ACTIVE', CURRENT_TIMESTAMP),
  ('10000000-0000-4000-8000-000000000002', 'Marcus Johnson',   'marcus.johnson@devacademy.io',   'INSTRUCTOR', 'ACTIVE', CURRENT_TIMESTAMP),
  ('10000000-0000-4000-8000-000000000003', 'Anita Patel',      'anita.patel@devacademy.io',      'INSTRUCTOR', 'ACTIVE', CURRENT_TIMESTAMP),
  ('10000000-0000-4000-8000-000000000004', 'David Kim',        'david.kim@devacademy.io',        'INSTRUCTOR', 'ACTIVE', CURRENT_TIMESTAMP),
  ('10000000-0000-4000-8000-000000000005', 'Elena Rodriguez',  'elena.rodriguez@devacademy.io',  'INSTRUCTOR', 'ACTIVE', CURRENT_TIMESTAMP)
ON CONFLICT (email) DO NOTHING;
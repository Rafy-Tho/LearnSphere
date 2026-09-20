-- 0009_instructor.sql
-- Instructor revenue: platform_settings (key/value config) and payout records.
-- CREATE-only baseline.

CREATE TABLE IF NOT EXISTS platform_settings (
  key TEXT PRIMARY KEY,
  value JSONB NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO platform_settings (key, value)
VALUES ('instructor_revenue_share_percent', '70'::jsonb)
ON CONFLICT (key) DO NOTHING;

-- An admin-recorded payment to an instructor for a period. The earnings
-- themselves are estimated on read; a payout is a snapshot the admin records.
CREATE TABLE IF NOT EXISTS instructor_payouts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  instructor_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  amount NUMERIC(12,2) NOT NULL CHECK (amount >= 0),
  currency VARCHAR(10) NOT NULL DEFAULT 'USD',
  status payout_status NOT NULL DEFAULT 'PENDING',
  period_start DATE,
  period_end DATE,
  note TEXT,
  paid_at TIMESTAMP WITH TIME ZONE,
  created_by UUID REFERENCES users(id) ON DELETE SET NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

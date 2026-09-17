-- 0017_user_activity_xp.sql
-- Learning activities + XP ledger.
--   user_activities       append-only record of important learner actions.
--   user_xp_transactions  single source of truth for XP.
--   learn_progress.lesson_id -> current_lesson_id (clearer intent).
--   lesson_completion     drops time_spent_minutes (not tracked) and xp_earned
--                         (XP now lives in the ledger).

-- 1. Activity type enum.
DO $$ BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'user_activity_type') THEN
    CREATE TYPE user_activity_type AS ENUM (
      'ENROLL_COURSE',
      'START_COURSE',
      'START_LESSON',
      'COMPLETE_LESSON',
      'COMPLETE_COURSE',
      'EARN_CERTIFICATE'
    );
  END IF;
END $$;

-- 2. Activities.
CREATE TABLE IF NOT EXISTS user_activities (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  course_id UUID REFERENCES courses(id) ON DELETE CASCADE,
  lesson_id UUID REFERENCES lessons(id) ON DELETE SET NULL,
  type user_activity_type NOT NULL,
  metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_user_activities_user_created
  ON user_activities (user_id, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_user_activities_user_type
  ON user_activities (user_id, type);

-- 3. XP ledger.
CREATE TABLE IF NOT EXISTS user_xp_transactions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  amount INTEGER NOT NULL,
  reason TEXT NOT NULL,
  reference_type TEXT,
  reference_id UUID,
  metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_user_xp_transactions_user_created
  ON user_xp_transactions (user_id, created_at DESC);

-- One XP reward per (user, reason, reference). Guards against duplicate rewards.
CREATE UNIQUE INDEX IF NOT EXISTS unique_user_xp_reference
  ON user_xp_transactions (user_id, reason, reference_id)
  WHERE reference_id IS NOT NULL;

-- 4. Backfill XP already stored on lesson completions.
INSERT INTO user_xp_transactions (
  user_id,
  amount,
  reason,
  reference_type,
  reference_id,
  created_at
)
SELECT
  lc.user_id,
  lc.xp_earned,
  'LESSON_COMPLETION',
  'LESSON',
  lc.lesson_id,
  lc.completed_at
FROM lesson_completion lc
WHERE lc.xp_earned IS NOT NULL
  AND lc.xp_earned <> 0
ON CONFLICT DO NOTHING;

-- 5. Rename learn_progress.lesson_id -> current_lesson_id.
DO $$ BEGIN
  IF EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'learn_progress' AND column_name = 'lesson_id'
  ) AND NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'learn_progress' AND column_name = 'current_lesson_id'
  ) THEN
    ALTER TABLE learn_progress RENAME COLUMN lesson_id TO current_lesson_id;
  END IF;
END $$;

-- 6. Stop tracking time and move XP out of lesson_completion.
ALTER TABLE lesson_completion DROP COLUMN IF EXISTS time_spent_minutes;
ALTER TABLE lesson_completion DROP COLUMN IF EXISTS xp_earned;

-- 7. Certificate confirmation timestamp (kept alongside the confirm flag).
ALTER TABLE certificates
  ADD COLUMN IF NOT EXISTS confirmed_at TIMESTAMP WITH TIME ZONE;

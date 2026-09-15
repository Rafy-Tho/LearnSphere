-- 0001_drift_fixes.sql
-- Resolve schema drift between schema.sql and the code (audit D1-D4).
-- Idempotent: safe to run on a database that already has the fixes.

-- D1: canonical lesson-content table name is `lesson_contents` (plural),
-- matching the repository queries.
DO $$
BEGIN
  IF EXISTS (
    SELECT 1 FROM information_schema.tables
    WHERE table_schema = 'public' AND table_name = 'lesson_content'
  ) AND NOT EXISTS (
    SELECT 1 FROM information_schema.tables
    WHERE table_schema = 'public' AND table_name = 'lesson_contents'
  ) THEN
    ALTER TABLE lesson_content RENAME TO lesson_contents;
    ALTER INDEX IF EXISTS idx_lesson_content_lesson RENAME TO idx_lesson_contents_lesson;
    ALTER TRIGGER trg_lesson_content_updated_at ON lesson_contents
      RENAME TO trg_lesson_contents_updated_at;
    ALTER TABLE lesson_contents
      RENAME CONSTRAINT unique_lesson_content_lesson_position
      TO unique_lesson_contents_lesson_position;
  END IF;
END $$;

-- D2: lessons.access_type is referenced by the code but was missing.
ALTER TABLE lessons
  ADD COLUMN IF NOT EXISTS access_type access_course_type DEFAULT 'FREE';

-- D3: widen the reset-code column so a hash fits.
ALTER TABLE password_reset_codes
  ALTER COLUMN code TYPE VARCHAR(255);

-- D4: allow multiple questions per lesson (drop the single-column UNIQUE).
ALTER TABLE quizzes DROP CONSTRAINT IF EXISTS quizzes_lesson_id_key;

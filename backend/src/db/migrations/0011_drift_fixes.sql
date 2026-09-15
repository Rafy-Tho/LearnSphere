-- 0011_drift_fixes.sql
-- Resolve schema drift between the baseline and the code (audit D1-D8).
-- Idempotent: safe to run on a database that already has the fixes and on a
-- database created from an older schema.sql.
--
-- D5 (modules.icon_name) is obsolete: no code or schema references it.
-- D7 (missing indexes) is applied in 0009_indexes.sql.

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

-- D4: allow multiple questions per lesson. Drop the legacy single-column
-- UNIQUE and ensure the (lesson_id, position) UNIQUE exists.
ALTER TABLE quizzes DROP CONSTRAINT IF EXISTS quizzes_lesson_id_key;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint
    WHERE conname = 'unique_quizzes_lesson_position'
  ) THEN
    ALTER TABLE quizzes
      ADD CONSTRAINT unique_quizzes_lesson_position UNIQUE (lesson_id, position);
  END IF;
END $$;

-- D6: course_reviews.helpful_count was never maintained; the count is derived
-- from review_helpful_votes. Drop the dead column.
ALTER TABLE course_reviews DROP COLUMN IF EXISTS helpful_count;

-- 0009_indexes.sql
-- Explicit indexes and unique indexes (includes audit PERF-4 / drift D7).

CREATE INDEX IF NOT EXISTS idx_modules_course ON modules (course_id);
CREATE INDEX IF NOT EXISTS idx_chapters_module ON chapters (module_id);
CREATE INDEX IF NOT EXISTS idx_lessons_chapter ON lessons (chapter_id);

-- lesson_contents is renamed from lesson_content in 0011 on legacy databases.
DO $$
BEGIN
  IF EXISTS (
    SELECT 1 FROM information_schema.tables
    WHERE table_schema = 'public' AND table_name = 'lesson_contents'
  ) THEN
    CREATE INDEX IF NOT EXISTS idx_lesson_contents_lesson
      ON lesson_contents (lesson_id);
  END IF;
END $$;

CREATE INDEX IF NOT EXISTS idx_quizzes_lesson ON quizzes (lesson_id);
CREATE INDEX IF NOT EXISTS idx_quiz_options_quiz ON quiz_options (quiz_id);

CREATE INDEX IF NOT EXISTS idx_enrollments_user ON enrollments (user_id);
CREATE INDEX IF NOT EXISTS idx_enrollments_course ON enrollments (course_id);

CREATE UNIQUE INDEX IF NOT EXISTS one_active_subscription_per_user
  ON user_subscriptions (user_id)
  WHERE status = 'ACTIVE';
CREATE INDEX IF NOT EXISTS idx_user_subscriptions_user
  ON user_subscriptions (user_id);
CREATE INDEX IF NOT EXISTS idx_subscription_payment_user_subscription
  ON subscription_payments (user_subscription_id);

CREATE INDEX IF NOT EXISTS idx_course_reviews_course ON course_reviews (course_id);
CREATE INDEX IF NOT EXISTS idx_course_reviews_user ON course_reviews (user_id);

CREATE INDEX IF NOT EXISTS idx_learn_progress_user ON learn_progress (user_id);
CREATE INDEX IF NOT EXISTS idx_learn_progress_course ON learn_progress (course_id);

CREATE INDEX IF NOT EXISTS idx_lesson_completion_user
  ON lesson_completion (user_id);
CREATE INDEX IF NOT EXISTS idx_lesson_completion_lesson
  ON lesson_completion (lesson_id);
CREATE INDEX IF NOT EXISTS idx_lesson_completion_user_course
  ON lesson_completion (user_id, course_id);

CREATE INDEX IF NOT EXISTS idx_certificates_user ON certificates (user_id);
CREATE INDEX IF NOT EXISTS idx_certificates_course ON certificates (course_id);

CREATE INDEX IF NOT EXISTS idx_password_reset_codes_user
  ON password_reset_codes (user_id);

-- Course read paths (D7 / PERF-4).
CREATE INDEX IF NOT EXISTS idx_courses_category ON courses (category_id);
CREATE INDEX IF NOT EXISTS idx_courses_instructor ON courses (instructor_id);
CREATE INDEX IF NOT EXISTS idx_courses_catalog
  ON courses (category_id, instructor_id, status, deleted_at);
CREATE INDEX IF NOT EXISTS idx_courses_active_created
  ON courses (created_at DESC)
  WHERE deleted_at IS NULL;

-- Trigram search for ILIKE '%term%' on course name/description.
CREATE INDEX IF NOT EXISTS idx_courses_name_trgm
  ON courses USING gin (name gin_trgm_ops);
CREATE INDEX IF NOT EXISTS idx_courses_description_trgm
  ON courses USING gin (description gin_trgm_ops);

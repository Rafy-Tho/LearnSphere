-- 0015_quiz_attempts.sql
-- Quiz attempt tracking: quiz_attempts (per user+lesson) and quiz_answers (per question).

CREATE TABLE IF NOT EXISTS quiz_attempts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  lesson_id UUID NOT NULL REFERENCES lessons(id) ON DELETE CASCADE,
  status VARCHAR(20) NOT NULL DEFAULT 'in_progress',
  score INTEGER,
  total_questions INTEGER,
  started_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  completed_at TIMESTAMP WITH TIME ZONE,
  CONSTRAINT quiz_attempt_status
    CHECK (status IN ('in_progress', 'completed', 'abandoned')),
  CONSTRAINT quiz_attempt_score_valid
    CHECK (score IS NULL OR score >= 0),
  CONSTRAINT quiz_attempt_total_valid
    CHECK (total_questions IS NULL OR total_questions > 0)
);

CREATE TABLE IF NOT EXISTS quiz_answers (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  attempt_id UUID NOT NULL REFERENCES quiz_attempts(id) ON DELETE CASCADE,
  quiz_id UUID NOT NULL REFERENCES quizzes(id) ON DELETE CASCADE,
  selected_option_id UUID REFERENCES quiz_options(id) ON DELETE SET NULL,
  is_correct BOOLEAN NOT NULL,
  answered_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT unique_attempt_quiz UNIQUE (attempt_id, quiz_id)
);

CREATE INDEX IF NOT EXISTS idx_quiz_attempts_user_lesson
  ON quiz_attempts (user_id, lesson_id);
CREATE INDEX IF NOT EXISTS idx_quiz_attempts_lesson
  ON quiz_attempts (lesson_id);
CREATE INDEX IF NOT EXISTS idx_quiz_answers_attempt
  ON quiz_answers (attempt_id);
CREATE INDEX IF NOT EXISTS idx_quiz_answers_quiz
  ON quiz_answers (quiz_id);

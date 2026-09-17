-- 0016_saved_courses.sql
-- Saved courses (bookmarks): user_id + course_id join table.
-- Rows are only inserted/deleted, so there is no updated_at column or trigger.

CREATE TABLE IF NOT EXISTS saved_courses (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  course_id UUID NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT unique_user_saved_course UNIQUE (user_id, course_id)
);

CREATE INDEX IF NOT EXISTS idx_saved_courses_user ON saved_courses(user_id);
CREATE INDEX IF NOT EXISTS idx_saved_courses_course ON saved_courses(course_id);

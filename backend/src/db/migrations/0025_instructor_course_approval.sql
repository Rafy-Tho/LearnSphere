-- 0025_instructor_course_approval.sql
-- Instructor course approval workflow: a course moves DRAFT/REJECTED -> PENDING
-- -> PUBLISHED (admin approve) or REJECTED (admin reject with a reason).
-- Additive only; no data destruction.

-- New review states. The new values are not referenced in this migration so it
-- remains safe inside the migration runner's transaction on PostgreSQL 12+.
ALTER TYPE content_status ADD VALUE IF NOT EXISTS 'PENDING';
ALTER TYPE content_status ADD VALUE IF NOT EXISTS 'REJECTED';

-- Review metadata on courses.
ALTER TABLE courses
  ADD COLUMN IF NOT EXISTS submitted_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE courses
  ADD COLUMN IF NOT EXISTS reviewed_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE courses
  ADD COLUMN IF NOT EXISTS reviewed_by UUID REFERENCES users(id) ON DELETE SET NULL;
ALTER TABLE courses
  ADD COLUMN IF NOT EXISTS rejection_reason TEXT;

-- Review queue lookups filter by status.
CREATE INDEX IF NOT EXISTS idx_courses_status ON courses(status);

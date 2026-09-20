-- 0010_indexes.sql
-- Explicit indexes (plain, unique, partial, and trigram). CREATE-only baseline.

-- Identity.
CREATE INDEX IF NOT EXISTS idx_password_reset_codes_user
  ON password_reset_codes (user_id);
CREATE INDEX IF NOT EXISTS idx_email_verification_codes_user
  ON email_verification_codes (user_id);
CREATE INDEX IF NOT EXISTS idx_user_auth_providers_user
  ON user_auth_providers (user_id);

-- Catalog.
CREATE INDEX IF NOT EXISTS idx_courses_status ON courses (status);
CREATE INDEX IF NOT EXISTS idx_courses_category ON courses (category_id);
CREATE INDEX IF NOT EXISTS idx_courses_instructor ON courses (instructor_id);
CREATE INDEX IF NOT EXISTS idx_courses_catalog
  ON courses (category_id, instructor_id, status, deleted_at);
CREATE INDEX IF NOT EXISTS idx_courses_active_created
  ON courses (created_at DESC)
  WHERE deleted_at IS NULL;
CREATE INDEX IF NOT EXISTS idx_courses_name_trgm
  ON courses USING gin (name gin_trgm_ops);
CREATE INDEX IF NOT EXISTS idx_courses_description_trgm
  ON courses USING gin (description gin_trgm_ops);

-- Content.
CREATE INDEX IF NOT EXISTS idx_modules_course ON modules (course_id);
CREATE INDEX IF NOT EXISTS idx_chapters_module ON chapters (module_id);
CREATE INDEX IF NOT EXISTS idx_lessons_chapter ON lessons (chapter_id);
CREATE INDEX IF NOT EXISTS idx_lesson_contents_lesson ON lesson_contents (lesson_id);
CREATE INDEX IF NOT EXISTS idx_quizzes_lesson ON quizzes (lesson_id);
CREATE INDEX IF NOT EXISTS idx_quiz_options_quiz ON quiz_options (quiz_id);
CREATE INDEX IF NOT EXISTS idx_quiz_attempts_user_lesson
  ON quiz_attempts (user_id, lesson_id);
CREATE INDEX IF NOT EXISTS idx_quiz_attempts_lesson ON quiz_attempts (lesson_id);
CREATE INDEX IF NOT EXISTS idx_quiz_answers_attempt ON quiz_answers (attempt_id);
CREATE INDEX IF NOT EXISTS idx_quiz_answers_quiz ON quiz_answers (quiz_id);

-- Learning.
CREATE INDEX IF NOT EXISTS idx_enrollments_user ON enrollments (user_id);
CREATE INDEX IF NOT EXISTS idx_enrollments_course ON enrollments (course_id);
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
CREATE INDEX IF NOT EXISTS idx_saved_courses_user ON saved_courses (user_id);
CREATE INDEX IF NOT EXISTS idx_saved_courses_course ON saved_courses (course_id);
CREATE INDEX IF NOT EXISTS idx_user_activities_user_created
  ON user_activities (user_id, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_user_activities_user_type
  ON user_activities (user_id, type);
CREATE INDEX IF NOT EXISTS idx_user_xp_transactions_user_created
  ON user_xp_transactions (user_id, created_at DESC);
-- One XP reward per (user, reason, reference); guards duplicate rewards.
CREATE UNIQUE INDEX IF NOT EXISTS unique_user_xp_reference
  ON user_xp_transactions (user_id, reason, reference_id)
  WHERE reference_id IS NOT NULL;

-- Billing.
CREATE INDEX IF NOT EXISTS idx_subscription_plans_active
  ON subscription_plans (is_active);
CREATE UNIQUE INDEX IF NOT EXISTS one_active_subscription_per_user
  ON user_subscriptions (user_id)
  WHERE status = 'ACTIVE';
CREATE INDEX IF NOT EXISTS idx_user_subscriptions_user
  ON user_subscriptions (user_id);
CREATE INDEX IF NOT EXISTS idx_user_subscriptions_status
  ON user_subscriptions (status);
CREATE INDEX IF NOT EXISTS idx_coupons_active ON coupons (is_active);
CREATE INDEX IF NOT EXISTS idx_checkout_orders_user ON checkout_orders (user_id);
CREATE INDEX IF NOT EXISTS idx_checkout_orders_status ON checkout_orders (status);
-- At most one open order per (user, plan, coupon) purchase context.
CREATE UNIQUE INDEX IF NOT EXISTS one_open_checkout_order_per_context
  ON checkout_orders (
    user_id,
    plan_id,
    COALESCE(coupon_id, '00000000-0000-0000-0000-000000000000'::uuid)
  )
  WHERE status IN ('CREATED', 'CHECKOUT_STARTED');
CREATE UNIQUE INDEX IF NOT EXISTS unique_active_coupon_reservation
  ON coupon_reservations (coupon_id, user_id)
  WHERE released_at IS NULL;
CREATE INDEX IF NOT EXISTS idx_coupon_reservations_coupon
  ON coupon_reservations (coupon_id);
CREATE INDEX IF NOT EXISTS idx_subscription_payment_user_subscription
  ON subscription_payments (user_subscription_id);
CREATE INDEX IF NOT EXISTS idx_subscription_payments_status
  ON subscription_payments (payment_status);
CREATE INDEX IF NOT EXISTS idx_subscription_payments_checkout_order
  ON subscription_payments (checkout_order_id);
CREATE INDEX IF NOT EXISTS idx_coupon_redemptions_coupon
  ON coupon_redemptions (coupon_id);
CREATE INDEX IF NOT EXISTS idx_coupon_redemptions_user
  ON coupon_redemptions (user_id);
CREATE INDEX IF NOT EXISTS idx_payment_refunds_payment ON payment_refunds (payment_id);
CREATE INDEX IF NOT EXISTS idx_payment_refunds_status ON payment_refunds (refund_status);
-- Stable idempotency key for admin-initiated refunds.
CREATE UNIQUE INDEX IF NOT EXISTS unique_payment_refund_idempotency_key
  ON payment_refunds (idempotency_key)
  WHERE idempotency_key IS NOT NULL;
-- At most one PENDING request per payment.
CREATE UNIQUE INDEX IF NOT EXISTS one_pending_refund_request_per_payment
  ON refund_requests (payment_id)
  WHERE status = 'PENDING';
CREATE INDEX IF NOT EXISTS idx_refund_requests_payment ON refund_requests (payment_id);
CREATE INDEX IF NOT EXISTS idx_refund_requests_user ON refund_requests (user_id);
CREATE INDEX IF NOT EXISTS idx_refund_requests_status ON refund_requests (status);
CREATE INDEX IF NOT EXISTS idx_refund_requests_payment_refund
  ON refund_requests (payment_refund_id);

-- Instructor revenue.
CREATE INDEX IF NOT EXISTS idx_instructor_payouts_instructor
  ON instructor_payouts (instructor_id);
CREATE INDEX IF NOT EXISTS idx_instructor_payouts_status
  ON instructor_payouts (status);

-- Reviews.
CREATE INDEX IF NOT EXISTS idx_course_reviews_course ON course_reviews (course_id);
CREATE INDEX IF NOT EXISTS idx_course_reviews_user ON course_reviews (user_id);

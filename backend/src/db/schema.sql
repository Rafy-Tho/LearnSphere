-- Enable UUID generation + trigram search
CREATE EXTENSION IF NOT EXISTS "pgcrypto";
CREATE EXTENSION IF NOT EXISTS "pg_trgm";

-- =========================
-- ENUM TYPES
-- =========================

CREATE TYPE user_role AS ENUM ('LEARNER','INSTRUCTOR','ADMIN');

CREATE TYPE user_status AS ENUM ('ACTIVE','INACTIVE','SUSPENDED');

CREATE TYPE course_level AS ENUM ('BEGINNER','INTERMEDIATE','ADVANCED');

CREATE TYPE content_status AS ENUM ('DRAFT','PUBLISHED');

CREATE TYPE lesson_type AS ENUM ('TEXT','QUIZ');

CREATE TYPE subscription_status AS ENUM ('ACTIVE','EXPIRED','CANCELLED','PENDING');

CREATE TYPE payment_status AS ENUM ('PENDING','COMPLETED','FAILED','REFUNDED','PARTIALLY_REFUNDED');

CREATE TYPE discount_type AS ENUM ('PERCENTAGE','FIXED_AMOUNT');

CREATE TYPE refund_status AS ENUM ('PENDING','SUCCEEDED','FAILED');

CREATE TYPE checkout_order_status AS ENUM ('CREATED','CHECKOUT_STARTED','PAID','FAILED','EXPIRED','CANCELLED');

CREATE TYPE refund_request_status AS ENUM ('PENDING','APPROVED','REJECTED','CANCELLED');

CREATE TYPE access_course_type AS ENUM ('FREE','SUBSCRIPTION');

CREATE TYPE gender AS ENUM ('MALE','FEMALE');

CREATE TYPE user_activity_type AS ENUM (
  'ENROLL_COURSE',
  'START_COURSE',
  'START_LESSON',
  'COMPLETE_LESSON',
  'COMPLETE_COURSE',
  'EARN_CERTIFICATE'
);
-- ========================
-- UTILITY: AUTO-UPDATE update_at
-- ========================
CREATE OR REPLACE FUNCTION set_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = CURRENT_TIMESTAMP;
  RETURN NEW;
END; 
$$ LANGUAGE plpgsql;

-- =========================
-- USERS
-- =========================
CREATE TABLE users(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  image_url TEXT,
  password VARCHAR(255),
  role user_role DEFAULT 'LEARNER',
  status user_status DEFAULT 'ACTIVE',
  failed_login_attempts INTEGER NOT NULL DEFAULT 0,
  locked_until TIMESTAMP WITH TIME ZONE,
  email_verified_at TIMESTAMP WITH TIME ZONE,
  last_login TIMESTAMP WITH TIME ZONE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER trg_users_updated_at
BEFORE UPDATE ON users
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

-- =========================
-- USER PROFILES
-- =========================
CREATE TABLE user_profiles (
  id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id      UUID UNIQUE NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  bio          TEXT,
  location     VARCHAR(255),
  phone        VARCHAR(20),
  date_birth   DATE,
  gender   gender,
  created_at   TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at   TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER trg_user_profiles_updated_at
BEFORE UPDATE ON user_profiles
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TABLE password_reset_codes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  code VARCHAR(255) NOT NULL,
  attempts INTEGER DEFAULT 0,
  expires_at TIMESTAMP WITH TIME ZONE NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER trg_password_reset_codes_updated_at
BEFORE UPDATE ON password_reset_codes
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE INDEX idx_password_reset_codes_user ON password_reset_codes(user_id);

CREATE TABLE email_verification_codes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  code VARCHAR(255) NOT NULL,
  attempts INTEGER DEFAULT 0,
  expires_at TIMESTAMP WITH TIME ZONE NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER trg_email_verification_codes_updated_at
BEFORE UPDATE ON email_verification_codes
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE INDEX idx_email_verification_codes_user
  ON email_verification_codes(user_id);

-- =========================
-- USER AUTH PROVIDERS
-- =========================
-- External identity providers (e.g. Google OAuth). The unique
-- (provider, provider_user_id) constraint maps a provider identity to exactly
-- one user; a user may have email/password and/or provider logins.
CREATE TABLE user_auth_providers (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  provider VARCHAR(50) NOT NULL,
  provider_user_id VARCHAR(255) NOT NULL,
  provider_email VARCHAR(255),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT uq_user_auth_provider UNIQUE (provider, provider_user_id)
);

CREATE TRIGGER trg_user_auth_providers_updated_at
BEFORE UPDATE ON user_auth_providers
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE INDEX idx_user_auth_providers_user ON user_auth_providers(user_id);

-- ========================
-- CATEGORIES
-- =========================
CREATE TABLE categories(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(255) UNIQUE NOT NULL,
  slug TEXT UNIQUE NOT NULL,
  description TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER trg_categories_updated_at
BEFORE UPDATE ON categories
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

-- =========================
-- COURSES
-- =========================
  CREATE TABLE courses(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    instructor_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    category_id UUID NOT NULL REFERENCES categories(id) ON DELETE RESTRICT,
    name VARCHAR(255) NOT NULL,
    slug TEXT UNIQUE NOT NULL,
    description TEXT NOT NULL,
    status content_status DEFAULT 'DRAFT' NOT NULL,
    level course_level DEFAULT 'BEGINNER' NOT NULL,
    access_type access_course_type DEFAULT 'FREE',
    position INTEGER,
    deleted_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
  );

CREATE TRIGGER trg_courses_updated_at
BEFORE UPDATE ON courses
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

-- Course read paths (audit PERF-4)
CREATE INDEX idx_courses_category ON courses(category_id);
CREATE INDEX idx_courses_instructor ON courses(instructor_id);
CREATE INDEX idx_courses_catalog ON courses(category_id, instructor_id, status, deleted_at);
CREATE INDEX idx_courses_active_created ON courses(created_at DESC) WHERE deleted_at IS NULL;
CREATE INDEX idx_courses_name_trgm ON courses USING gin (name gin_trgm_ops);
CREATE INDEX idx_courses_description_trgm ON courses USING gin (description gin_trgm_ops);

-- =========================
-- COURSE OBJECTIVES
-- =========================
CREATE TABLE course_objectives (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  course_id UUID NOT NULL 
  REFERENCES courses(id) ON DELETE CASCADE,
  content TEXT NOT NULL, -- the objective text
  position INTEGER DEFAULT 1, -- ordering
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

create TRIGGER trg_course_objectives_updated_at
BEFORE UPDATE ON course_objectives
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();
-- =========================
-- MODULES
-- =========================

CREATE TABLE modules(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  course_id UUID NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
  position INTEGER NOT NULL,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  status content_status DEFAULT 'DRAFT' NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT unique_modules_course_position UNIQUE(course_id, position)
);

CREATE INDEX idx_modules_course ON modules(course_id);
CREATE TRIGGER trg_modules_updated_at
BEFORE UPDATE ON modules
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

-- =========================
-- CHAPTERS
-- =========================

CREATE TABLE chapters(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  module_id UUID NOT NULL REFERENCES modules(id) ON DELETE CASCADE,
  position INTEGER NOT NULL,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  status content_status DEFAULT 'DRAFT' NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT unique_chapters_module_position UNIQUE(module_id, position)
);
CREATE INDEX idx_chapters_module ON chapters(module_id);
CREATE TRIGGER trg_chapters_updated_at
BEFORE UPDATE ON chapters
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

-- =========================
-- LESSONS
-- =========================

CREATE TABLE lessons(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  chapter_id UUID NOT NULL REFERENCES chapters(id) ON DELETE CASCADE,
  position INTEGER NOT NULL,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  type lesson_type NOT NULL,
  status content_status DEFAULT 'DRAFT' NOT NULL,
  access_type access_course_type DEFAULT 'FREE',
  xp_points INTEGER DEFAULT 5 CHECK (xp_points >= 0) NOT NULL,
  duration_minutes INTEGER DEFAULT 0 CHECK (duration_minutes >= 0) NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT unique_lessons_chapter_position UNIQUE(chapter_id, position)
);
CREATE INDEX idx_lessons_chapter ON lessons(chapter_id);
CREATE TRIGGER trg_lessons_updated_at
BEFORE UPDATE ON lessons
FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- =========================
-- LESSON LINKS
-- =========================

CREATE TABLE lesson_contents(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  lesson_id UUID NOT NULL REFERENCES lessons(id) ON DELETE CASCADE,
  position INTEGER  NOT NULL,
  name VARCHAR(255) NOT NULL,
  content TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT unique_lesson_contents_lesson_position UNIQUE(lesson_id, position)
);
CREATE INDEX idx_lesson_contents_lesson ON lesson_contents(lesson_id);
CREATE TRIGGER trg_lesson_contents_updated_at
BEFORE UPDATE ON lesson_contents
FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- =========================
-- QUIZZES
-- =========================

CREATE TABLE quizzes(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  lesson_id UUID NOT NULL REFERENCES lessons(id) ON DELETE CASCADE,
  question TEXT NOT NULL,
  explanation TEXT,
  position INTEGER NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT unique_quizzes_lesson_position UNIQUE(lesson_id, position)
);

CREATE INDEX idx_quizzes_lesson ON quizzes(lesson_id);

CREATE TRIGGER trg_quizzes_updated_at
BEFORE UPDATE ON quizzes
FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- =========================
-- QUIZ OPTIONS
-- =========================

CREATE TABLE quiz_options(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  quiz_id UUID NOT NULL REFERENCES quizzes(id) ON DELETE CASCADE,
  text TEXT NOT NULL,
  is_correct BOOLEAN DEFAULT FALSE,
  position INTEGER NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT unique_quiz_options_quiz_position UNIQUE(quiz_id, position)
);

CREATE INDEX idx_quiz_options_quiz ON quiz_options(quiz_id);
CREATE TRIGGER trg_quiz_options_updated_at
BEFORE UPDATE ON quiz_options
FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- =========================
-- QUIZ ATTEMPTS
-- =========================

CREATE TABLE quiz_attempts(
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

CREATE INDEX idx_quiz_attempts_user_lesson ON quiz_attempts(user_id, lesson_id);
CREATE INDEX idx_quiz_attempts_lesson ON quiz_attempts(lesson_id);

-- =========================
-- QUIZ ANSWERS
-- =========================

CREATE TABLE quiz_answers(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  attempt_id UUID NOT NULL REFERENCES quiz_attempts(id) ON DELETE CASCADE,
  quiz_id UUID NOT NULL REFERENCES quizzes(id) ON DELETE CASCADE,
  selected_option_id UUID REFERENCES quiz_options(id) ON DELETE SET NULL,
  is_correct BOOLEAN NOT NULL,
  answered_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT unique_attempt_quiz UNIQUE(attempt_id, quiz_id)
);

CREATE INDEX idx_quiz_answers_attempt ON quiz_answers(attempt_id);
CREATE INDEX idx_quiz_answers_quiz ON quiz_answers(quiz_id);

-- =========================
-- ENROLLMENTS
-- =========================

CREATE TABLE enrollments(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  course_id UUID NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
  access_type access_course_type DEFAULT 'FREE',
  enrolled_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP, 
  expires_at TIMESTAMP WITH TIME ZONE,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT unique_user_course UNIQUE(user_id, course_id)
);

CREATE INDEX idx_enrollments_user ON enrollments(user_id);
CREATE INDEX idx_enrollments_course ON enrollments(course_id);

CREATE TRIGGER trg_enrollments_updated_at
BEFORE UPDATE ON enrollments
FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- =========================
-- SUBSCRIPTION PLANS
-- =========================
CREATE TABLE subscription_plans (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(50) NOT NULL, -- STANDARD, PREMIUM, etc.
  description TEXT,
  duration_days INT NOT NULL, -- 30, 365, etc.
  price NUMERIC(10,2) NOT NULL CHECK (price >= 0),
  currency VARCHAR(3) NOT NULL DEFAULT 'usd',
  is_active BOOLEAN NOT NULL DEFAULT TRUE,
  features JSONB NOT NULL DEFAULT '[]'::jsonb,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT unique_plan_duration UNIQUE(name, duration_days)
);

CREATE INDEX idx_subscription_plans_active ON subscription_plans(is_active);

CREATE TRIGGER trg_subscription_plans_updated_at
BEFORE UPDATE ON subscription_plans
FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- =========================
-- USER SUBSCRIPTIONS
-- =========================
CREATE TABLE user_subscriptions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  plan_id UUID NOT NULL REFERENCES subscription_plans(id) ON DELETE RESTRICT,
  start_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  end_date TIMESTAMP WITH TIME ZONE NOT NULL,
  status subscription_status DEFAULT 'ACTIVE',
  source TEXT NOT NULL DEFAULT 'PAID' CHECK (source IN ('PAID', 'ADMIN_OVERRIDE')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Only ONE active subscription per user
CREATE UNIQUE INDEX one_active_subscription_per_user
ON user_subscriptions(user_id)
WHERE status = 'ACTIVE';

CREATE INDEX idx_user_subscriptions_user 
ON user_subscriptions(user_id);
CREATE INDEX idx_user_subscriptions_status ON user_subscriptions(status);

CREATE TRIGGER trg_user_subscriptions_updated_at
BEFORE UPDATE ON user_subscriptions
FOR EACH ROW EXECUTE FUNCTION set_updated_at();
-- =========================
-- COUPONS
-- =========================
CREATE TABLE coupons (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  code VARCHAR(50) NOT NULL UNIQUE, -- stored uppercase
  discount_type discount_type NOT NULL,
  discount_value NUMERIC(10,2) NOT NULL CHECK (discount_value >= 0),
  max_redemptions INT CHECK (max_redemptions IS NULL OR max_redemptions > 0),
  redemption_count INT NOT NULL DEFAULT 0 CHECK (redemption_count >= 0),
  reserved_count INT NOT NULL DEFAULT 0 CHECK (reserved_count >= 0),
  starts_at TIMESTAMP WITH TIME ZONE,
  expires_at TIMESTAMP WITH TIME ZONE,
  is_active BOOLEAN NOT NULL DEFAULT TRUE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_coupons_active ON coupons(is_active);

CREATE TRIGGER trg_coupons_updated_at
BEFORE UPDATE ON coupons
FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- =========================
-- CHECKOUT ORDERS
-- =========================
-- A purchase attempt before an actual payment exists. Financial values are
-- snapshotted so history never depends on the current plan.
CREATE TABLE checkout_orders (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  plan_id UUID NOT NULL REFERENCES subscription_plans(id) ON DELETE RESTRICT,
  coupon_id UUID REFERENCES coupons(id) ON DELETE SET NULL,
  plan_name VARCHAR(50) NOT NULL,
  duration_days INT NOT NULL CHECK (duration_days > 0),
  subtotal NUMERIC(10,2) NOT NULL CHECK (subtotal >= 0),
  discount_amount NUMERIC(10,2) NOT NULL DEFAULT 0 CHECK (discount_amount >= 0),
  total_amount NUMERIC(10,2) NOT NULL CHECK (total_amount >= 0),
  currency VARCHAR(3) NOT NULL DEFAULT 'usd',
  status checkout_order_status NOT NULL DEFAULT 'CREATED',
  stripe_checkout_session_id TEXT UNIQUE,
  stripe_payment_intent_id TEXT UNIQUE,
  expires_at TIMESTAMP WITH TIME ZONE NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_checkout_orders_user ON checkout_orders(user_id);
CREATE INDEX idx_checkout_orders_status ON checkout_orders(status);

-- At most one open order per (user, plan, coupon) purchase context.
CREATE UNIQUE INDEX one_open_checkout_order_per_context
ON checkout_orders(
  user_id,
  plan_id,
  COALESCE(coupon_id, '00000000-0000-0000-0000-000000000000'::uuid)
)
WHERE status IN ('CREATED', 'CHECKOUT_STARTED');

CREATE TRIGGER trg_checkout_orders_updated_at
BEFORE UPDATE ON checkout_orders
FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- =========================
-- COUPON RESERVATIONS
-- =========================
-- Holds coupon capacity while a checkout is in flight. released_at IS NULL =
-- active; finalize/release stamps released_at.
CREATE TABLE coupon_reservations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  coupon_id UUID NOT NULL REFERENCES coupons(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  checkout_order_id UUID NOT NULL REFERENCES checkout_orders(id) ON DELETE CASCADE,
  expires_at TIMESTAMP WITH TIME ZONE NOT NULL,
  released_at TIMESTAMP WITH TIME ZONE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT unique_coupon_reservation_order UNIQUE (checkout_order_id)
);

CREATE UNIQUE INDEX unique_active_coupon_reservation
ON coupon_reservations(coupon_id, user_id)
WHERE released_at IS NULL;

CREATE INDEX idx_coupon_reservations_coupon
ON coupon_reservations(coupon_id);

-- ========================
-- SUBSCRIPTION PAYMENTS
-- =========================

CREATE TABLE subscription_payments(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_subscription_id UUID NOT NULL REFERENCES user_subscriptions(id) ON DELETE CASCADE,
  subtotal NUMERIC(10,2),
  discount_amount NUMERIC(10,2) NOT NULL DEFAULT 0 CHECK (discount_amount >= 0),
  amount NUMERIC(10,2) NOT NULL CHECK (amount >= 0),
  currency VARCHAR(3) NOT NULL DEFAULT 'usd',
  payment_status payment_status DEFAULT 'PENDING',
  coupon_id UUID REFERENCES coupons(id) ON DELETE SET NULL,
  provider VARCHAR(20) NOT NULL DEFAULT 'STRIPE',
  payment_method VARCHAR(30) NOT NULL DEFAULT 'card',
  checkout_order_id UUID REFERENCES checkout_orders(id) ON DELETE SET NULL,
  stripe_payment_intent_id TEXT UNIQUE,
  paid_at TIMESTAMP WITH TIME ZONE,
  failure_reason TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_subscription_payment_user_subscription ON subscription_payments(user_subscription_id);
CREATE INDEX idx_subscription_payments_status ON subscription_payments(payment_status);
CREATE INDEX idx_subscription_payments_checkout_order ON subscription_payments(checkout_order_id);

CREATE TRIGGER trg_subscription_payments_updated_at
BEFORE UPDATE ON subscription_payments
FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- =========================
-- COUPON REDEMPTIONS
-- =========================
CREATE TABLE coupon_redemptions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  coupon_id UUID NOT NULL REFERENCES coupons(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  payment_id UUID NOT NULL REFERENCES subscription_payments(id) ON DELETE CASCADE,
  discount_amount NUMERIC(10,2) NOT NULL CHECK (discount_amount >= 0),
  redeemed_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT unique_coupon_per_user UNIQUE (coupon_id, user_id),
  CONSTRAINT unique_coupon_redemption_payment UNIQUE (payment_id)
);

CREATE INDEX idx_coupon_redemptions_coupon ON coupon_redemptions(coupon_id);
CREATE INDEX idx_coupon_redemptions_user ON coupon_redemptions(user_id);

-- =========================
-- PAYMENT REFUNDS
-- =========================
CREATE TABLE payment_refunds (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  payment_id UUID NOT NULL REFERENCES subscription_payments(id) ON DELETE CASCADE,
  amount NUMERIC(10,2) NOT NULL CHECK (amount > 0),
  currency VARCHAR(3) NOT NULL DEFAULT 'usd',
  refund_status refund_status NOT NULL DEFAULT 'PENDING',
  stripe_refund_id TEXT UNIQUE,
  idempotency_key TEXT,
  reason TEXT,
  refunded_at TIMESTAMP WITH TIME ZONE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_payment_refunds_payment ON payment_refunds(payment_id);
CREATE INDEX idx_payment_refunds_status ON payment_refunds(refund_status);

-- Stable idempotency key for admin-initiated refunds.
CREATE UNIQUE INDEX unique_payment_refund_idempotency_key
ON payment_refunds(idempotency_key)
WHERE idempotency_key IS NOT NULL;

CREATE TRIGGER trg_payment_refunds_updated_at
BEFORE UPDATE ON payment_refunds
FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- =========================
-- REFUND REQUESTS
-- =========================
-- Learner's request for a refund. Distinct from payment_refunds (the actual
-- financial refund handled by the admin workflow).
CREATE TABLE refund_requests (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  payment_id UUID NOT NULL REFERENCES subscription_payments(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  requested_amount NUMERIC(10,2) NOT NULL CHECK (requested_amount > 0),
  currency VARCHAR(3) NOT NULL DEFAULT 'usd',
  reason VARCHAR(255) NOT NULL,
  user_note TEXT,
  status refund_request_status NOT NULL DEFAULT 'PENDING',
  reviewed_by UUID REFERENCES users(id) ON DELETE SET NULL,
  admin_note TEXT,
  payment_refund_id UUID REFERENCES payment_refunds(id) ON DELETE SET NULL,
  requested_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  reviewed_at TIMESTAMP WITH TIME ZONE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE UNIQUE INDEX one_pending_refund_request_per_payment
ON refund_requests(payment_id)
WHERE status = 'PENDING';

CREATE INDEX idx_refund_requests_payment ON refund_requests(payment_id);
CREATE INDEX idx_refund_requests_user ON refund_requests(user_id);
CREATE INDEX idx_refund_requests_status ON refund_requests(status);
CREATE INDEX idx_refund_requests_payment_refund ON refund_requests(payment_refund_id);

CREATE TRIGGER trg_refund_requests_updated_at
BEFORE UPDATE ON refund_requests
FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- =========================
-- STRIPE WEBHOOK EVENTS
-- =========================
CREATE TABLE stripe_webhook_events (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  stripe_event_id TEXT NOT NULL UNIQUE,
  event_type TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'PENDING',
  processed_at TIMESTAMP WITH TIME ZONE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- =========================
-- COURSE REVIEWS
-- =========================

CREATE TABLE course_reviews(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  course_id UUID NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
  rating INTEGER NOT NULL CHECK (rating BETWEEN 1 AND 5),
  review TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT unique_user_review UNIQUE(user_id, course_id)
);

CREATE INDEX idx_course_reviews_course ON course_reviews(course_id);
CREATE INDEX idx_course_reviews_user ON course_reviews(user_id);

CREATE TRIGGER trg_course_reviews_updated_at
  BEFORE UPDATE ON course_reviews
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- =========================
-- REVIEW HELPFUL VOTES
-- =========================
CREATE TABLE review_helpful_votes(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  review_id UUID NOT NULL REFERENCES course_reviews(id) ON DELETE CASCADE,
  is_helpful BOOLEAN NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT unique_user_vote UNIQUE(user_id, review_id)
);

-- =========================
-- REVIEW REPORTS
-- =========================
CREATE TABLE review_reports(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  review_id UUID NOT NULL REFERENCES course_reviews(id) ON DELETE CASCADE,
  reason  VARCHAR(255) NOT NULL,
  description TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT unique_user_report UNIQUE(user_id, review_id)
);

-- =========================
-- SAVED COURSES
-- =========================
CREATE TABLE saved_courses(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  course_id UUID NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT unique_user_saved_course UNIQUE(user_id, course_id)
);

CREATE INDEX idx_saved_courses_user ON saved_courses(user_id);
CREATE INDEX idx_saved_courses_course ON saved_courses(course_id);

-- =========================
-- LEARNING PROGRESS
-- =========================

CREATE TABLE learn_progress(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  course_id UUID NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
  current_lesson_id UUID REFERENCES lessons(id) ON DELETE SET NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT unique_user_course_progress UNIQUE(user_id, course_id)
);

CREATE INDEX idx_learn_progress_user ON learn_progress(user_id);
CREATE INDEX idx_learn_progress_course ON learn_progress(course_id);

CREATE TRIGGER trg_learn_progress_updated_at
  BEFORE UPDATE ON learn_progress
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- =========================
-- LESSON COMPLETIONS
-- =========================
CREATE TABLE lesson_completion (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    course_id UUID NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
    lesson_id UUID NOT NULL REFERENCES lessons(id) ON DELETE CASCADE,
    completed_at TIMESTAMP NOT NULL DEFAULT NOW(),
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT unique_user_lesson_completion UNIQUE(user_id, lesson_id) 
);
CREATE INDEX idx_lesson_completion_user ON lesson_completion(user_id);
CREATE INDEX idx_lesson_completion_lesson ON lesson_completion(lesson_id);
CREATE INDEX idx_lesson_completion_user_course ON lesson_completion(user_id, course_id);

-- =========================
-- CERTIFICATES
-- =========================
CREATE TABLE certificates (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    course_id UUID NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
    confirm BOOLEAN DEFAULT FALSE,
    certificate_number VARCHAR(100) UNIQUE NOT NULL, 
    certificate_url TEXT,
    issued_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    confirmed_at TIMESTAMP WITH TIME ZONE,
    CONSTRAINT unique_user_course_certificate UNIQUE(user_id, course_id)
);

CREATE INDEX idx_certificates_user ON certificates(user_id);
CREATE INDEX idx_certificates_course ON certificates(course_id);

-- =========================
-- USER ACTIVITIES
-- =========================
CREATE TABLE user_activities (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  course_id UUID REFERENCES courses(id) ON DELETE CASCADE,
  lesson_id UUID REFERENCES lessons(id) ON DELETE SET NULL,
  type user_activity_type NOT NULL,
  metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_user_activities_user_created
  ON user_activities(user_id, created_at DESC);
CREATE INDEX idx_user_activities_user_type
  ON user_activities(user_id, type);

-- =========================
-- USER XP TRANSACTIONS
-- =========================
CREATE TABLE user_xp_transactions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  amount INTEGER NOT NULL,
  reason TEXT NOT NULL,
  reference_type TEXT,
  reference_id UUID,
  metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_user_xp_transactions_user_created
  ON user_xp_transactions(user_id, created_at DESC);

CREATE UNIQUE INDEX unique_user_xp_reference
  ON user_xp_transactions(user_id, reason, reference_id)
  WHERE reference_id IS NOT NULL;
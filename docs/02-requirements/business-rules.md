# Business Rules

Business rules define the constraints and policies the system enforces, independent of implementation. Sources: `backend/src/modules/*` and `backend/src/db/schema.sql`.

## 1. Identity & Access

| ID | Rule |
|---|---|
| BR-AUTH-01 | A user is uniquely identified by email; duplicate emails are rejected (HTTP 409 via unique constraint `users.email`). |
| BR-AUTH-02 | New users default to role `LEARNER` and status `ACTIVE`. |
| BR-AUTH-03 | Passwords are stored only as bcrypt hashes (12 salt rounds). |
| BR-AUTH-04 | Password reset codes are single-use, expire after 10 minutes, and are stored as HMAC-SHA256 hashes. |
| BR-AUTH-05 | A reset code may be attempted a limited number of times (max 5) before rejection. |
| BR-AUTH-06 | A reset-code request may be issued at most 10 times per 12 hours per client. |
| BR-AUTH-07 | A code-verification/reset attempt may be made at most 10 times per hour per client. |
| BR-AUTH-08 | Sessions expire after 30 days of inactivity and are rolling (activity extends them). |
| BR-AUTH-09 | Logging out destroys the server-side session and clears the cookie. |

## 2. Roles & Authorization

| ID | Rule |
|---|---|
| BR-ROLE-01 | `LEARNER` may consume content, enroll, review, and subscribe. |
| BR-ROLE-02 | `INSTRUCTOR` may create and manage courses/content they own. |
| BR-ROLE-03 | `ADMIN` may perform all instructor actions plus user, category, and billing management. |
| BR-ROLE-04 | Category write operations are restricted to `ADMIN`. |
| BR-ROLE-05 | Course write operations are allowed for `INSTRUCTOR` and `ADMIN`. |
| BR-ROLE-06 | Content write operations (modules, chapters, lessons, contents, questions, options) are allowed for the owning instructor or an `ADMIN`. |
| BR-ROLE-07 | Admin endpoints under `/api/v1/admin/*` are restricted to `ADMIN`. |
| BR-ROLE-08 | Ownership is verified by joining the resource up to `courses.instructor_id` and comparing with the session user; `ADMIN` bypasses the ownership check. |

## 3. Course & Content Rules

| ID | Rule |
|---|---|
| BR-CRS-01 | A course belongs to exactly one instructor and one category. |
| BR-CRS-02 | A category cannot be deleted while a course references it (FK `ON DELETE RESTRICT`). |
| BR-CRS-03 | Course `slug` is unique. |
| BR-CRS-04 | Courses are soft-deleted (`deleted_at`); deleted courses are excluded from all listings and lookups. |
| BR-CRS-05 | Default course status is `DRAFT`; only `PUBLISHED` courses are intended for public consumption. |
| BR-CRS-06 | Default course level is `BEGINNER`; default access type is `FREE`. |
| BR-CRS-07 | Modules have a unique `(course_id, position)`; chapters `(module_id, position)`; lessons `(chapter_id, position)`. |
| BR-CRS-08 | Lesson contents have a unique `(lesson_id, position)`; quiz options have a unique `(quiz_id, position)`. |
| BR-CRS-09 | Lesson `xp_points` and `duration_minutes` are non-negative. |
| BR-CRS-10 | Deleting a course cascades to its modules, chapters, lessons, contents, quizzes, options, enrollments, progress, completions, certificates, and reviews. |
| BR-CRS-11 | Lesson HTML content is sanitized with DOMPurify before storage. |

## 4. Learning Rules

| ID | Rule |
|---|---|
| BR-LRN-01 | A learner may enroll at most once per course (`UNIQUE(user_id, course_id)`). |
| BR-LRN-02 | Enrollment records an `access_type` (`FREE` or `SUBSCRIPTION`). |
| BR-LRN-03 | On enrollment, a learning-progress row is seeded pointing at the first lesson. |
| BR-LRN-04 | There is at most one learning-progress row per (user, course), tracking the current/last lesson. |
| BR-LRN-05 | Lesson completion is unique per (user, lesson) and records time spent and XP earned. |
| BR-LRN-06 | Lesson XP and duration are copied from the lesson definition at completion time. |
| BR-LRN-07 | A subscription-gated lesson's content is only returned when the learner has an active paid subscription. |
| BR-LRN-08 | `learn_progress.lesson_id` is nullable and becomes `NULL` if the referenced lesson is deleted (`ON DELETE SET NULL`). |
| BR-LRN-09 | A course certificate is unique per (user, course). |

## 5. Subscription & Payment Rules

| ID | Rule |
|---|---|
| BR-SUB-01 | A user may have at most one `ACTIVE` subscription at a time (partial unique index `one_active_subscription_per_user`). |
| BR-SUB-02 | A plan is uniquely identified by `(name, duration_days)`. |
| BR-SUB-03 | Plan price and payment amount are non-negative. |
| BR-SUB-04 | Subscription status is one of `ACTIVE`, `EXPIRED`, `CANCELLED`. |
| BR-SUB-05 | Payment status is one of `PENDING`, `COMPLETED`, `FAILED`, `REFUNDED`. |
| BR-SUB-06 | A subscription is activated only after the Stripe webhook reports `checkout.session.completed`. |
| BR-SUB-07 | A `COMPLETED` payment is recorded per successful checkout, linked to the user subscription. |
| BR-SUB-08 | Active access requires status `ACTIVE` and `end_date > NOW()`. |
| BR-SUB-09 | `stripe_payment_intent_id` is unique when present. |
| BR-SUB-10 | When a new subscription is created, prior active subscriptions for the user are expired. |

## 6. Review & Moderation Rules

| ID | Rule |
|---|---|
| BR-REV-01 | A user may post at most one review per course (`UNIQUE(user_id, course_id)`). |
| BR-REV-02 | A rating must be an integer from 1 to 5. |
| BR-REV-03 | A user may cast at most one helpful vote per review (`UNIQUE(user_id, review_id)`); the vote can be toggled. |
| BR-REV-04 | A user may file at most one report per review (`UNIQUE(user_id, review_id)`). |
| BR-REV-05 | The helpful-vote count derives from `review_helpful_votes`; there is no denormalized `helpful_count` column. |

## 7. Data Integrity Rules

| ID | Rule |
|---|---|
| BR-DATA-01 | Primary keys are UUIDs generated by `gen_random_uuid()`. |
| BR-DATA-02 | Tables with `updated_at` maintain it via the `set_updated_at()` trigger. |
| BR-DATA-03 | Most child records cascade-delete with their parent; `courses.category_id` is `RESTRICT` and `learn_progress.lesson_id` is `SET NULL`. |
| BR-DATA-04 | Deleting a user cascades to their courses, enrollments, progress, completions, certificates, reviews, and subscriptions. |
| BR-DATA-05 | Uploaded profile images must be `jpeg`, `jpg`, `png`, or `webp` and at most 5 MB. |

## 8. API Behaviour Rules

| ID | Rule |
|---|---|
| BR-API-01 | Validation failures return HTTP 422 with the first error message. |
| BR-API-02 | Unauthenticated access to protected endpoints returns HTTP 401. |
| BR-API-03 | Insufficient role returns HTTP 403. |
| BR-API-04 | Duplicate-key violations return HTTP 409; FK violations and invalid input return HTTP 400. |
| BR-API-05 | List endpoints return `data` plus a `pagination` object. |
| BR-API-06 | Rate-limit exhaustion returns HTTP 429. |

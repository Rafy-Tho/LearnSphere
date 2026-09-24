# Project Specification — LearnSphere (PERN)

Consolidated specification for the platform. Detailed references are linked throughout.

## 1. Overview

A full-stack online learning platform delivering structured courses end to end: authentication, course catalog, hierarchical content authoring, enrollment, progress tracking, quizzes, certificates, reviews, and Stripe-based subscriptions, plus an administrative dashboard.

The repository is a monorepo of three independently runnable applications sharing one REST API and PostgreSQL database.

| Application | Path | Purpose |
|---|---|---|
| Backend API | `backend/` | REST API under `/api/v1`, business logic, persistence, integrations |
| Learner frontend | `frontend/` | Public site, learner dashboard, learning player, quizzes, reviews, pricing |
| Admin dashboard | `admin/` | CRUD for users, catalog/content, subscriptions, payments |

## 2. Technology Stack

### Backend
- Node.js 22 (ESM), Express 5
- PostgreSQL via `pg` (raw parameterized SQL, no ORM)
- `express-session` + `connect-pg-simple` (session store)
- `express-validator`, `express-rate-limit`, `helmet`, `cors`
- `bcrypt`, `multer`, Cloudinary SDK, Stripe SDK
- Hostinger Mail API for email; `openid-client` for Google OAuth (PKCE/OIDC); `isomorphic-dompurify` for sanitization
- `dotenv`, `cross-env` for configuration and scripts

### Frontend
- React 19, Vite 7, React Router DOM 7
- TanStack React Query 5, React Hook Form + Zod
- Tailwind CSS 4, React Toastify, Swiper, Lucide React, DOMPurify

### Admin
- React 19, Vite 7, React Router DOM 7, TanStack React Query 5
- Tailwind CSS 3.4, shadcn-style Radix UI, sonner, react-hook-form

### Infrastructure
- PostgreSQL with UUID PKs (`pgcrypto`)
- Schema: CREATE-only migrations in `backend/src/db/migrations/` (source of truth)
- Config: `backend/src/config/environment.js`

## 3. Scope

### In scope
- Session auth, roles (`LEARNER`, `INSTRUCTOR`, `ADMIN`), statuses
- Email verification (6-digit OTP) and Google OAuth via `openid-client` (PKCE/OIDC)
- Profiles + avatar upload
- Categories, courses, objectives
- Content hierarchy: module → chapter → lesson → content / quiz → option
- Enrollment, progress, lesson completion, XP, certificates
- Saved courses, server-graded quiz attempts, activity + XP feed
- Reviews with helpful votes and reports
- Subscription plans, coupons, checkout orders, Stripe Checkout, webhook activation, payments
- Refund requests and Stripe refund issuance
- Admin dashboard CRUD

### Out of scope (current)
- Automated tests, CI/CD
- Video streaming, forums, real-time features
- Social OAuth beyond Google, per-course checkout / accurate instructor revenue accounting, certificate PDFs, multi-tenancy

Full scope: `docs/01-planning/scope.md`.

## 4. Architecture

> **Progress:** the backend is module-based and hardened; the learner frontend and admin refactors are complete. See [`docs/progress/`](./docs/progress/).

### 4.1 Backend Layering

```
routes → validators → middlewares → controllers → services / repositories → pg pool
```

| Layer | Location |
|---|---|
| App wiring | `backend/src/app/` (`app.js`, `middleware.js`, `routes.js`) |
| Modules | `backend/src/modules/<module>/` (`routes.js`, `controller.js`, `service.js`, `repository.js`, `validation.js`) |
| Validators | `backend/src/modules/<module>/validation.js` (+ builders in `backend/src/common/validation.js`) |
| Middlewares | `backend/src/common/middleware/` |
| Services (shared) | `backend/src/common/services/` |
| Config | `backend/src/config/` |
| Utils | `backend/src/common/` |

### 4.2 Request Pipeline

`trust proxy` → helmet → CORS → **Stripe webhook (raw body)** → CSRF guard → JSON parser → global rate limit → session → idle timeout → request logger → routers → 404 → error handler.

### 4.3 Response Envelope

```json
{ "success": true, "statusCode": 200, "message": "OK", "data": {}, "pagination": { "totalItems": 42, "currentPage": 1, "totalPages": 5, "limit": 10, "next": 2, "prev": null } }
```

Errors: `{ "success": false, "statusCode": 422, "message": "..." }` (stack included in development only).

The Stripe webhook router is mounted before the body parser and rate limiter (raw-body signature verification; Stripe retries bypass the global limiter).

### 4.4 Frontend State

| Concern | Mechanism |
|---|---|
| Server state | TanStack React Query |
| Auth/session | `AuthProvider` + `["me"]` query (server-derived) |
| Theme | `ThemeProvider` + localStorage |
| Filters/pagination | URL (`useSearchParams`) |
| Local UI | `useState` |

API access flows components → hooks → feature services → `frontend/src/lib/apiClient.js` (`credentials: "include"`, 401 auto-logout).

### 4.5 External Integrations

| Service | Purpose | Config |
|---|---|---|
| PostgreSQL | Data + sessions | `DATABASE_URL` |
| Stripe | Checkout + webhook | `STRIPE_SECRET_KEY`, `STRIPE_WEBHOOK_SECRET` |
| Cloudinary | Image hosting | `CLOUDINARY_*` |
| Hostinger Mail API | Transactional email | `HOSTINGER_MAIL_API_KEY`, `HOSTINGER_MAIL_MAILBOX_ID`, `HOSTINGER_MAIL_DISPLAY_NAME`, `HOSTINGER_MAIL_API_URL` |
| Google OAuth | Social sign-in (optional, `openid-client`) | `GOOGLE_CLIENT_ID`, `GOOGLE_CLIENT_SECRET`, `GOOGLE_CALLBACK_URL` |

See `docs/04-design/architecture.md` and `docs/diagrams/`.

## 5. Functional Specification

### 5.1 Identity & Access
- Register/login/logout, cookie sessions (30-day rolling + 24h idle timeout, PostgreSQL-backed).
- Email verification: 6-digit OTP after signup (`POST /auth/verify-email`, `POST /auth/resend-verification-code`).
- Google OAuth: `GET /auth/google[/callback]` via `openid-client` (authorization-code + OIDC, state/nonce/PKCE, ID-token). Provider links live in `user_auth_providers`; `users.password` is nullable for provider-only accounts.
- Roles: `LEARNER`, `INSTRUCTOR`, `ADMIN`. Statuses: `ACTIVE`, `INACTIVE`, `SUSPENDED`.
- Password reset via 6-digit email code (10-min expiry, hashed, attempt-limited).
- Login protection: per-account failure lockout + `loginLimiter` (5 attempts / 15 min).
- Profile update and avatar upload (jpeg/jpg/png/webp ≤ 5 MB → Cloudinary).

### 5.2 Catalog & Content
- Categories (admin-managed).
- Courses: unique slug, status `DRAFT`/`PUBLISHED`, level, access `FREE`/`SUBSCRIPTION`, soft-delete via `deleted_at`.
- Content tree: modules → chapters → lessons (type `TEXT`/`QUIZ`) → lesson contents / quizzes → quiz options.
- Position uniqueness within each parent; HTML sanitized with DOMPurify.
- Ownership: only the owning instructor or an admin may modify content.

### 5.3 Learning
- Enrollment unique per (user, course); seeds progress at first lesson.
- Progress tracks the current lesson per course.
- Lesson completion unique per (user, lesson), stores XP and time spent.
- Saved courses: bookmark toggle, unique per (user, course), listed at `/users/me/saved-courses`.
- Quiz attempts: server-graded submissions with idempotent completion and history/best/latest lookup (`/lessons/:lessonId/quiz-attempts`).
- Activity + XP feed: `user_activities` and `user_xp_transactions` with `/users/me/activities` and `/users/me/xp` endpoints.
- Subscription-gated lesson content requires an active paid subscription.
- Certificates: eligibility check, claim with unique number, list/view.

### 5.4 Reviews
- One review per (user, course), rating 1–5.
- Summary: average + rating histogram.
- Helpful votes toggle (one per user/review); reports (one per user/review).

### 5.5 Subscriptions & Payments
- Plans: name, duration_days, price, features; deactivated, never cascade-deleted.
- Coupons: `PERCENTAGE`/`FIXED_AMOUNT`, limits, one-time codes, reserved at checkout (`coupon_reservations`), recorded on payment (`coupon_redemptions`).
- Prepaid billing: `checkout_orders` created server-side (30-min expiry) → Stripe Checkout session.
- Stripe webhook `checkout.session.completed` provisions the subscription transactionally, records a completed payment with webhook event idempotency (`stripe_webhook_events`), then sends a confirmation email via Hostinger Mail API.
- At most one `ACTIVE` subscription per user (partial unique index); prior active subscriptions are expired; admin override supported; access expires lazily.
- Active access requires status `ACTIVE` and `end_date > NOW()`.
- Refunds: learners request within `REFUND_WINDOW_DAYS` (default 14) of payment; admin approves/rejects; Stripe refunds issued with row lock + idempotency key.
- Learner endpoints under `/users/me/{subscription,payments,refund-requests}`.

### 5.6 Administration
- Dashboard statistics (courses, users, instructors, enrollments).
- CRUD for categories, courses, all nested content, users/instructors (incl. set password), plans, user subscriptions, coupons; payments are read-only.
- Billing stats, refund-request review, and Stripe refund issuance.
- Course review queue (approve/reject with reason), instructor revenue-share setting (`platform_settings`), and payout records (`instructor_payouts`).
- Admin endpoints guarded by `requireAuth` + `authorize(ADMIN)`.

### 5.7 Instructor Workspace
- Role-gated area of the admin SPA (`RequireRole`) with a scoped dashboard, own courses, students, analytics, reviews, certificates, and estimated earnings.
- Course lifecycle: `DRAFT` → `PENDING` → `PUBLISHED`/`REJECTED`; only admins publish.
- Instructor reads are scoped to `courses.instructor_id`; `ADMIN` bypasses.

Full requirements: `docs/02-requirements/requirements.md`. Business rules: `docs/02-requirements/business-rules.md`.

## 6. Data Model

PostgreSQL, 38 declared tables (+ runtime `session`), 15 enum types.

### 6.1 Tables by Domain

| Domain | Tables |
|---|---|
| Identity | `users`, `user_profiles`, `password_reset_codes`, `email_verification_codes`, `user_auth_providers` |
| Catalog | `categories`, `courses`, `course_objectives` |
| Content | `modules`, `chapters`, `lessons`, `lesson_contents`, `quizzes`, `quiz_options`, `quiz_attempts`, `quiz_answers` |
| Learning | `enrollments`, `learn_progress`, `lesson_completion`, `certificates`, `saved_courses`, `user_activities`, `user_xp_transactions` |
| Billing | `subscription_plans`, `user_subscriptions`, `coupons`, `checkout_orders`, `coupon_reservations`, `coupon_redemptions`, `subscription_payments`, `payment_refunds`, `refund_requests`, `stripe_webhook_events` |
| Reviews | `course_reviews`, `review_helpful_votes`, `review_reports` |
| Instructor | `platform_settings`, `instructor_payouts` |

### 6.2 Enums

`user_role`, `user_status`, `course_level`, `content_status`, `payout_status`, `lesson_type`, `subscription_status`, `payment_status`, `discount_type`, `refund_status`, `checkout_order_status`, `refund_request_status`, `access_course_type`, `gender`, `user_activity_type`.

### 6.3 Key Constraints
- UUID PKs via `gen_random_uuid()`; `updated_at` maintained by `set_updated_at()` triggers.
- Composite position uniqueness per parent.
- Unique: `users.email`, `categories.(name,slug)`, `courses.slug`, `enrollments.(user_id,course_id)`, `learn_progress.(user_id,course_id)`, `lesson_completion.(user_id,lesson_id)`, `saved_courses.(user_id,course_id)`, `course_reviews.(user_id,course_id)`, `certificates.(user_id,course_id)`, `subscription_plans.(name,duration_days)`, `coupons.code`, `user_auth_providers.(provider,provider_user_id)`, `certificates.certificate_number`.
- Partial unique: one `ACTIVE` subscription per user; one open checkout order per context; one active coupon reservation; one pending refund request per payment; payment refund idempotency key.
- Cascades: most child FKs `CASCADE`; `courses.category_id` `RESTRICT`; `learn_progress.lesson_id` `SET NULL`.

Full detail: `docs/04-design/database-design.md` and `docs/diagrams/erd.md`.

## 7. API Specification

Base: `/api/v1`. Auth via session cookie. List params: `page` (>=1), `limit` (1-100), `sort` (camelCase field, `-` prefix for desc), `search`, and camelCase domain filters (enums pass raw values; ranges use `min*`/`max*`; repeat a key for multi-value). See `docs/04-design/api-design.md` §1.3.

| Domain | Base path |
|---|---|
| Auth | `/auth` (register, login, logout, google[/callback], verify-email, resend-verification-code, password-resets[/verify], password) |
| Users | `/users/me` (profile, xp, password) |
| My data | `/users/me/{courses,saved-courses,certificates,activities,xp,subscription,payments,refund-requests}` |
| Categories | `/categories` |
| Courses | `/courses` (+ `/popular`, `/:courseId/{objectives,reviews,enrollments,progress,certificates,saved,curriculum,first-lesson,completions}`) |
| Objectives | `/courses/:courseId/objectives`, `/objectives` |
| Modules | `/courses/:courseId/modules`, `/modules` |
| Chapters | `/modules/:moduleId/chapters`, `/chapters` |
| Lessons | `/chapters/:chapterId/lessons`, `/lessons` |
| Contents | `/lessons/:lessonId/contents`, `/contents` |
| Questions | `/lessons/:lessonId/questions`, `/lessons/:lessonId/quiz-submissions`, `/questions` |
| Options | `/questions/:questionId/options`, `/options` |
| Quiz attempts | `/lessons/:lessonId/quiz-attempts` |
| Learning | `/lessons/:lessonId/{completions,start}`, `/courses/:courseId/{enrollments,progress}` |
| Reviews | `/courses/:courseId/reviews`, `/reviews/:reviewId/{helpful-vote,reports}` |
| Certificates | `/courses/:courseId/certificates`, `/certificates/:certificateId`, `/users/me/certificates` |
| Plans | `/plans` |
| Subscriptions | `/subscriptions/:planId/checkout`, `/users/me/subscription` |
| Payments & refunds | `/users/me/payments` (+ `/:paymentId/refund-requests`), `/users/me/refund-requests` |
| Coupons | `/coupons/validate` |
| Instructor | `/instructor/{dashboard,earnings,payouts,courses/:courseId/{students,analytics,reviews,certificates,submit}}` |
| Admin | `/admin/{dashboard,users(+password),courses,plans,subscriptions,payments,refund-requests,refunds,coupons,billing,settings,instructor-payouts}` |
| Stripe webhook | `/webhooks/stripe` |

Status codes: `200/201/204`, `400`, `401`, `403`, `404`, `409`, `422`, `429`, `500`. PostgreSQL SQLSTATE `23505→409`, `23503→400`, `23502→400`, `22P02→400`.

Full reference: `docs/04-design/api-design.md`.

## 8. Security Specification

- Passwords: bcrypt (12 rounds).
- Sessions: `httpOnly`, `secure` in prod, `sameSite=none` prod / `lax` dev, 30-day rolling + 24h idle timeout.
- Authorization: role guard + per-resource ownership checks.
- Validation: `express-validator`; HTML sanitized via DOMPurify on input and render.
- Rate limiting: global 100/min; login 5/15min; password reset 10/12h; code attempts 10/h; email verification 5/h; per-account login lockout.
- CSRF: state-changing methods guarded by the `X-Requested-With` header + JSON/multipart content types; the Stripe webhook is exempt (server-to-server).
- Google OAuth: `openid-client` with state, nonce, and PKCE; ID-token signature verified.
- CORS: allowlist (`CLIENT_URL_1`, `CLIENT_URL_2`) with credentials.
- Uploads: type/MIME filter, 5 MB limit.
- Payments: Stripe Checkout + webhook signature verification.
- Secrets: environment variables only; `.env` gitignored.

Known gaps and threat model: `docs/04-design/security.md`.

## 9. Non-Functional Requirements

| ID | Requirement |
|---|---|
| NFR-01 | Consistent response envelope |
| NFR-02 | PostgreSQL errors mapped to HTTP statuses |
| NFR-03 | Global + auth rate limiting |
| NFR-04 | CORS restricted to configured origins |
| NFR-05 | Upload type/size validation |
| NFR-06 | HTML sanitization on input and render |
| NFR-07 | Pagination with metadata |
| NFR-08 | Node.js 22 |
| NFR-09 | Frontends clear auth and redirect on 401 |
| NFR-10 | No secrets in source |

## 10. Configuration

### Backend `.env`
`PORT`, `NODE_ENV`, `TRUST_PROXY` (optional), `DATABASE_URL`, `SESSION_SECRET`, `COOKIE_NAME`, `CLIENT_URL_1`, `CLIENT_URL_2`, `HOSTINGER_MAIL_API_KEY`, `HOSTINGER_MAIL_MAILBOX_ID`, `HOSTINGER_MAIL_DISPLAY_NAME`, `HOSTINGER_MAIL_API_URL`, `GOOGLE_CLIENT_ID`, `GOOGLE_CLIENT_SECRET`, `GOOGLE_CALLBACK_URL`, `CLOUDINARY_NAME`, `CLOUDINARY_API_KEY`, `CLOUDINARY_SECRET_KEY`, `STRIPE_SECRET_KEY`, `STRIPE_WEBHOOK_SECRET`, `REFUND_WINDOW_DAYS` (default 14).

### Frontend / Admin `.env`
`VITE_BASE_URL`.

Setup steps: `docs/05-development/environment-setup.md`.

## 11. Commands

| App | Dev | Lint | Build |
|---|---|---|---|
| backend | `npm run dev` | `npx eslint .` | — |
| frontend | `npm run dev` | `npm run lint` | `npm run build` |
| admin | `npm run dev` | `npm run lint` | `npm run build` |

## 12. Known Issues & Residuals

1. No automated tests and no CI.
2. Live DB only: legacy `lesson_content*` child object names remain alongside the canonical ones (harmless).
3. Backend cross-module calls still import other modules' repositories (BM-1).

Schema drift and the former auth/validation gaps are resolved. The schema is a CREATE-only migration baseline (`0001`–`0011`). Details: `docs/04-design/database-design.md` §9, `docs/04-design/security.md` §11, `docs/progress/backend-progress.md`.

## 13. Acceptance & Verification

Acceptance criteria: `docs/02-requirements/acceptance-criteria.md`.
Test strategy and cases: `docs/06-testing/`.
Deployment: `docs/07-deployment/`.

## 14. Related Documents

- `README.md` — human-facing readme
- `agent.md` — AI agent entry guide
- `ai/` — agent rules
- `docs/` — full documentation set

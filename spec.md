# Project Specification — Learning Online Platform (PERN)

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
- `express-validator`, `express-rate-limit`
- `bcrypt`, `multer`, Cloudinary SDK, Stripe SDK
- Brevo REST API for email; `isomorphic-dompurify` for sanitization

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
- Profiles + avatar upload
- Categories, courses, objectives
- Content hierarchy: module → chapter → lesson → content / quiz → option
- Enrollment, progress, lesson completion, XP, certificates
- Reviews with helpful votes and reports
- Subscription plans, Stripe Checkout, webhook activation, payments
- Admin dashboard CRUD

### Out of scope (current)
- Automated tests, CI/CD
- Social OAuth, video streaming, forums, real-time features
- Per-course checkout / accurate instructor revenue accounting, certificate PDFs, multi-tenancy

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

`trust proxy` → helmet → CORS → **Stripe webhook (raw body)** → CSRF guard → JSON parser → logging → global rate limit → session → idle timeout → routers → 404 → error handler.

### 4.3 Response Envelope

```json
{ "success": true, "statusCode": 200, "message": "OK", "data": {}, "pagination": { "totalItems": 42, "currentPage": 1, "totalPages": 5, "limit": 10, "next": 2, "prev": null } }
```

Errors: `{ "success": false, "statusCode": 422, "message": "..." }` (stack included in development only).

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
| Brevo | Transactional email | `BREVO_API_KEY`, `SENDER_EMAIL` |

See `docs/04-design/architecture.md` and `docs/diagrams/`.

## 5. Functional Specification

### 5.1 Identity & Access
- Register/login/logout, cookie sessions (30-day rolling, PostgreSQL-backed).
- Roles: `LEARNER`, `INSTRUCTOR`, `ADMIN`. Statuses: `ACTIVE`, `INACTIVE`, `SUSPENDED`.
- Password reset via 6-digit email code (10-min expiry, hashed, attempt-limited).
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
- Subscription-gated lesson content requires an active paid subscription.
- Certificates: eligibility check, claim with unique number, list/view.

### 5.4 Reviews
- One review per (user, course), rating 1–5.
- Summary: average + rating histogram.
- Helpful votes toggle (one per user/review); reports (one per user/review).

### 5.5 Subscriptions & Payments
- Plans: name, duration_days, price.
- Stripe Checkout session creation; webhook `checkout.session.completed` creates/activates the subscription and records a completed payment, then sends a confirmation email.
- At most one `ACTIVE` subscription per user (partial unique index); prior active subscriptions are expired.
- Active access requires status `ACTIVE` and `end_date > NOW()`.

### 5.6 Administration
- Dashboard statistics (courses, users, instructors, enrollments).
- CRUD for categories, courses, all nested content, users/instructors, plans, user subscriptions, payments.
- Course review queue (approve/reject), instructor revenue-share setting, and payout records.
- Admin endpoints guarded by `requireAuth` + `authorize(ADMIN)`.

### 5.7 Instructor Workspace
- Role-gated area of the admin SPA (`RequireRole`) with a scoped dashboard, own courses, students, analytics, reviews, certificates, and estimated earnings.
- Course lifecycle: `DRAFT` → `PENDING` → `PUBLISHED`/`REJECTED`; only admins publish.
- Instructor reads are scoped to `courses.instructor_id`; `ADMIN` bypasses.

Full requirements: `docs/02-requirements/requirements.md`. Business rules: `docs/02-requirements/business-rules.md`.

## 6. Data Model

PostgreSQL, 22 declared tables (+ runtime `session`), 9 enum types.

### 6.1 Tables by Domain

| Domain | Tables |
|---|---|
| Identity | `users`, `user_profiles`, `password_reset_codes` |
| Catalog | `categories`, `courses`, `course_objectives` |
| Content | `modules`, `chapters`, `lessons`, `lesson_contents`, `quizzes`, `quiz_options` |
| Learning | `enrollments`, `learn_progress`, `lesson_completion`, `certificates` |
| Billing | `subscription_plans`, `user_subscriptions`, `subscription_payments` |
| Reviews | `course_reviews`, `review_helpful_votes`, `review_reports` |

### 6.2 Enums

`user_role`, `user_status`, `course_level`, `content_status`, `lesson_type`, `subscription_status`, `payment_status`, `access_course_type`, `gender`.

### 6.3 Key Constraints
- UUID PKs via `gen_random_uuid()`; `updated_at` maintained by `set_updated_at()` triggers.
- Composite position uniqueness per parent.
- Unique: `users.email`, `categories.(name,slug)`, `courses.slug`, `enrollments.(user_id,course_id)`, `learn_progress.(user_id,course_id)`, `lesson_completion.(user_id,lesson_id)`, `course_reviews.(user_id,course_id)`, `certificates.(user_id,course_id)`, `subscription_plans.(name,duration_days)`.
- Partial unique: one `ACTIVE` subscription per user.
- Cascades: most child FKs `CASCADE`; `courses.category_id` `RESTRICT`; `learn_progress.lesson_id` `SET NULL`.

Full detail: `docs/04-design/database-design.md` and `docs/diagrams/erd.md`.

## 7. API Specification

Base: `/api/v1`. Auth via session cookie. List params: `page` (>=1), `limit` (1-100), `sort` (camelCase field, `-` prefix for desc), `search`, and camelCase domain filters (enums pass raw values; ranges use `min*`/`max*`; repeat a key for multi-value). See `docs/04-design/api-design.md` §1.3.

| Domain | Base path |
|---|---|
| Auth | `/auth` (register, login, logout, password-resets, password) |
| Users | `/users/me` (profile, xp, password), `/users/me/{courses,certificates,subscription}` |
| Categories | `/categories` |
| Courses | `/courses` (+ `/:courseId/{objectives,reviews,enrollments,progress,certificates,curriculum,first-lesson,completions}`) |
| Objectives | `/courses/:courseId/objectives`, `/objectives` |
| Modules | `/courses/:courseId/modules`, `/modules` |
| Chapters | `/modules/:moduleId/chapters`, `/chapters` |
| Lessons | `/chapters/:chapterId/lessons`, `/lessons` |
| Contents | `/lessons/:lessonId/contents`, `/contents` |
| Questions | `/lessons/:lessonId/questions`, `/lessons/:lessonId/quiz-submissions`, `/questions` |
| Options | `/questions/:questionId/options`, `/options` |
| Reviews | `/courses/:courseId/reviews`, `/reviews/:reviewId/{helpful-vote,reports}` |
| Certificates | `/courses/:courseId/certificates`, `/certificates/:certificateId` |
| Plans | `/plans/:planId` |
| Subscriptions | `/subscriptions/:planId/checkout` |
| Admin | `/admin/{dashboard,courses,users,plans,subscriptions,payments}` |
| Stripe webhook | `/webhooks/stripe` |

Status codes: `200/201/204`, `400`, `401`, `403`, `404`, `409`, `422`, `429`, `500`. PostgreSQL SQLSTATE `23505→409`, `23503→400`, `23502→400`, `22P02→400`.

Full reference: `docs/04-design/api-design.md`.

## 8. Security Specification

- Passwords: bcrypt (12 rounds).
- Sessions: `httpOnly`, `secure` in prod, `sameSite=none` prod / `lax` dev, 30-day rolling.
- Authorization: role guard + per-resource ownership checks.
- Validation: `express-validator`; HTML sanitized via DOMPurify on input and render.
- Rate limiting: global 100/min; password reset 10/12h; code attempts 10/h.
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
`PORT`, `NODE_ENV`, `DATABASE_URL`, `SESSION_SECRET`, `COOKIE_NAME`, `CLIENT_URL_1`, `CLIENT_URL_2`, `BREVO_API_KEY`, `SENDER_EMAIL`, `CLOUDINARY_NAME`, `CLOUDINARY_API_KEY`, `CLOUDINARY_SECRET_KEY`, `STRIPE_SECRET_KEY`, `STRIPE_WEBHOOK_SECRET`.

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

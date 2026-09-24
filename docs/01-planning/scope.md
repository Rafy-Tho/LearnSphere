# Scope

This document defines what LearnSphere does and does not cover in its current implementation.

## 1. Scope Summary

The platform is an end-to-end online course delivery system. It covers user identity, course authoring, learner consumption, assessment, feedback, and subscription-based monetization, plus an administrative control panel.

## 2. In Scope

### 2.1 Identity & Access

- Email/password registration and login, plus email verification (6-digit OTP) and Google OAuth.
- Cookie-based sessions stored in PostgreSQL (30-day rolling + 24h idle timeout).
- Roles: `LEARNER`, `INSTRUCTOR`, `ADMIN`.
- User statuses: `ACTIVE`, `INACTIVE`, `SUSPENDED`.
- Profile management (bio, location, phone, birth date, gender, avatar).
- Password change and password reset via 6-digit email code.

### 2.2 Catalog & Authoring

- Categories with name, slug, and description.
- Courses with lifecycle status (`DRAFT`/`PENDING`/`PUBLISHED`/`REJECTED`), level, access type (`FREE`/`SUBSCRIPTION`), instructor, and category.
- Course objectives.
- Content hierarchy: modules → chapters → lessons.
- Lesson types: `TEXT` and `QUIZ`.
- Lesson contents (positioned text/HTML blocks).
- Quizzes with questions and options (one correct option flag).

### 2.3 Learning Experience

- Course browsing, search, and filtering (level, category/skill, rating, duration, free/paid).
- Enrollment (free or subscription-gated) and saved courses.
- Learning player with sidebar navigation and next/previous progression.
- Learning progress tracking (current lesson per course).
- Lesson completion with XP and time spent.
- Server-graded quiz attempts with history/best lookup.
- Activity feed and XP transactions.
- Certificates: eligibility check, claim, list, and view.

### 2.4 Feedback

- Course reviews with a 1–5 rating.
- Helpful votes (toggle) and review reports.

### 2.5 Monetization

- Subscription plans (name, duration in days, price, features).
- Coupons (`PERCENTAGE`/`FIXED_AMOUNT`) with one-time codes and usage limits.
- Prepaid checkout orders (30-min expiry) → Stripe Checkout session creation.
- Stripe webhook handling (`checkout.session.completed`), with event idempotency, to activate subscriptions and record payments.
- Learner refund requests (within `REFUND_WINDOW_DAYS`, default 14) and admin-issued Stripe refunds.
- One active subscription per user (enforced by a partial unique index).

### 2.6 Administration

- Dashboard statistics (courses, users, instructors, enrollments).
- CRUD for categories, courses, and all nested content.
- CRUD for users and instructors.
- CRUD for plans, user subscriptions, and payments.
- Admin profile and password management.
- Course review queue (approve/reject instructor submissions).
- Instructor revenue-share setting and payout records.

### 2.7 Instructor Workspace

- Role-gated instructor area inside the admin app (no self-publishing).
- Ownership-scoped dashboard (courses by status, students, enrollments, reviews, rating).
- Own-course management with submit-for-review workflow.
- Per-course student roster, completion/quiz analytics, reviews, and certificates.
- Estimated revenue-share earnings and payout history.

## 3. Out of Scope (Current State)

The following are **not** implemented:

| Item | Notes |
|---|---|
| Automated tests | No test framework or test files exist in any app. |
| Database seeds | Optional sample data in `backend/src/db/seeds/`; schema defined by CREATE-only migrations. |
| CI/CD pipelines | No CI config in the repository. |
| Social OAuth beyond Google | Only Google OAuth (via `openid-client`) is implemented. |
| Video hosting/streaming | Lessons are text/HTML and quizzes; no video pipeline. |
| Discussion forums / Q&A threads | Not present. |
| Separate instructor app | Instructors use a role-gated area of the admin app; there is no fourth SPA. |
| Accurate instructor revenue accounting | No per-course pricing; instructor earnings are estimated from subscription revenue-share. |
| Email templates beyond welcome/reset/payment/course-review | Only a few transactional emails exist. |
| Multi-tenancy / organizations | Single-tenant platform. |
| Real-time features | No WebSockets/SSE. |
| Full-text search engine | Search is SQL `ILIKE`, not a dedicated search service. |
| Certificate PDF generation | Certificate view is a web page; `certificate_url` is unused. |

## 4. Known Constraints

- Schema changes use one idempotent, CREATE-only migration per change (`npm run db:migrate`); migrations are the source of truth.
- The `admin/` `package.json` is named `frontend` (legacy naming) and there is no `lint` script in `backend/`.
- Backend is ESM-only and pins `engines.node` to `22.22.2`.
- Session cookies use `sameSite: "none"` in production, which requires HTTPS and `trust proxy`.
- Two frontends must be listed in the backend CORS origins (`CLIENT_URL_1`, `CLIENT_URL_2`).

## 5. Assumptions

- A single PostgreSQL database backs the API and session store.
- Stripe, Cloudinary, and Hostinger Mail API credentials (and optionally Google OAuth) are provisioned by the operator.
- Both frontends are served from origins allowed by CORS.
- Learners have modern browsers with cookie support.

## 6. Success Criteria (Product Level)

- A new learner can register, enroll in a free course, complete lessons, and see progress reflected on the dashboard.
- An enrolled learner can submit a quiz, receive a result, and earn completion XP.
- A subscriber can pay through Stripe and gain access to subscription courses after the webhook fires.
- An admin can create a course with full nested content and publish it without direct database access.

## 7. Future / Candidate Scope

- Automated test suites and CI.
- Additional social login providers.
- Video lessons and richer media.
- Per-course checkout and accurate instructor revenue accounting.
- Certificate PDF export and verification.
- Notifications and email template management.

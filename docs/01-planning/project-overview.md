# Project Overview

## 1. What This Project Is

**Learning Online Platform (PERN)** is a full-stack online learning platform that delivers structured courses end to end. It combines a learner-facing React SPA, an administrator dashboard SPA, and a single Express/PostgreSQL REST API.

The platform supports:

- Session-based authentication (cookie sessions persisted in PostgreSQL).
- Course discovery, filtering, and enrollment.
- A content hierarchy of **course → module → chapter → lesson → content / quiz → option**.
- Lesson progress tracking, XP, lesson completion, and certificates.
- Course reviews with helpful votes and reporting.
- Subscription plans with Stripe-powered checkout and webhook confirmation.
- An admin dashboard for managing users, courses, subscriptions, and payments.

## 2. Goals

| Goal | Description |
|---|---|
| Structured learning | Deliver content as an ordered, nestable hierarchy that mirrors real curricula. |
| Clean learner UX | Provide a modern SPA experience for browsing, learning, quizzing, and reviewing. |
| Scalable domain model | Use a normalized relational schema that supports multiple courses, instructors, and plans. |
| Monetization | Support free and subscription-gated courses with real payment processing. |
| Administration | Give admins full CRUD control over the catalog, users, and billing without touching SQL. |

## 3. System Composition

The repository is a monorepo with three independently runnable applications:

| Application | Directory | Runtime | Purpose |
|---|---|---|---|
| Backend API | `backend/` | Node.js 22 + Express 5 | REST API under `/api/v1`, business logic, persistence, integrations |
| Learner frontend | `frontend/` | React 19 + Vite 7 | Public marketing site + learner dashboard, learning player, quizzes |
| Admin dashboard | `admin/` | React 19 + Vite 7 | Administrative CRUD UI for users, courses, subscriptions, payments |

Both frontends talk to the same backend API and share the same cookie-based session.

## 4. Technology Stack

### Backend

- Node.js 22 (ESM, `"type": "module"`)
- Express 5
- PostgreSQL via `pg` (raw parameterized SQL, no ORM)
- `express-session` + `connect-pg-simple` (session store)
- `express-validator` (input validation)
- `express-rate-limit` (rate limiting)
- `bcrypt` (password hashing)
- `multer` (file upload) + Cloudinary (media storage)
- Stripe SDK (payments)
- Brevo REST API (transactional email)
- `isomorphic-dompurify` (HTML sanitization)

### Learner Frontend

- React 19 + Vite 7
- React Router DOM 7
- TanStack React Query 5 (server state)
- React Hook Form + Zod (forms/validation)
- Tailwind CSS 4 (via `@tailwindcss/vite`)
- React Toastify (notifications)
- Swiper (carousels)
- Lucide React (icons)
- DOMPurify (rendering sanitized lesson HTML)

### Admin Dashboard

- React 19 + Vite 7
- React Router DOM 7
- TanStack React Query 5
- Tailwind CSS 3.4 + shadcn-style Radix UI components
- `sonner` + custom toast for notifications
- `react-hook-form` + `@hookform/resolvers`

### Infrastructure / Database

- PostgreSQL with UUID primary keys (`pgcrypto` / `gen_random_uuid()`)
- SQL schema defined in `backend/src/db/schema.sql`
- Environment-variable configuration via `backend/src/config/environment.js`

## 5. High-Level Architecture

```text
                +----------------------+        +----------------------+
                |  Learner Frontend    |        |  Admin Dashboard     |
                |  (React + Vite)      |        |  (React + Vite)      |
                +----------+-----------+        +----------+-----------+
                           |  HTTPS / cookies              |
                           +---------------+---------------+
                                           |
                                  +--------v---------+
                                  |   Backend API    |
                                  |   Express 5      |
                                  +--------+---------+
                                           |
             +-----------------+-----------+-----------+-----------------+
             |                 |                       |                 |
       +-----v-----+    +------v------+        +-------v------+   +------v------+
       | PostgreSQL|    |  Cloudinary |        |    Stripe    |   |    Brevo    |
       |  (data +  |    |  (images)   |        |  (payments)  |   |   (email)   |
       | sessions) |    +-------------+        +--------------+   +-------------+
       +-----------+
```

See `docs/diagrams/system-context.md` and `docs/diagrams/architecture.md` for detailed diagrams.

## 6. Core Domains

| Domain | Responsibility |
|---|---|
| Identity | Users, profiles, roles, statuses, password reset |
| Catalog | Categories, courses, objectives |
| Content | Modules, chapters, lessons, lesson contents, quizzes, options |
| Learning | Enrollments, learning progress, lesson completion, certificates |
| Monetization | Subscription plans, user subscriptions, payments |
| Feedback | Course reviews, helpful votes, reports |

## 7. Primary Actors

| Actor | Description |
|---|---|
| Guest | Unauthenticated visitor; can browse courses and pricing |
| Learner | Registered user; enrolls, learns, quizzes, reviews, subscribes |
| Instructor | Manages courses and content they own |
| Admin | Full platform management across users, catalog, and billing |

## 8. Request Lifecycle (Backend)

1. Request enters the Express app (`backend/src/app/app.js`).
2. CORS, JSON parsing, rate limiting, and session middleware are applied.
3. Route-specific validators and auth/authorization middleware run.
4. Controller executes business logic.
5. Repository performs a parameterized SQL operation via the PostgreSQL pool.
6. A JSON response (`{ success, statusCode, message, data }`) is returned.
7. Global not-found and error middleware handle unmatched routes/errors.

## 9. Documentation Map

| Area | Location |
|---|---|
| Planning | `docs/01-planning/` |
| Requirements | `docs/02-requirements/` |
| Analysis | `docs/03-analysis/` |
| Design | `docs/04-design/` |
| Development | `docs/05-development/` |
| Testing | `docs/06-testing/` |
| Deployment | `docs/07-deployment/` |
| Diagrams | `docs/diagrams/` |
| AI agent rules | `ai/` |

## 10. Related Files

- `README.md` — human-facing project readme
- `backend/src/db/schema.sql` — authoritative database DDL
- `database.svg`, `er-diagram.svg` — rendered ERD assets
- `ai/project-context.md` — condensed context for AI agents

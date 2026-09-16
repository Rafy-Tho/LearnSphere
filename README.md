# Learning Online Platform (PERN)

Learning Online Platform is a full-stack web application for delivering structured online courses with authentication, enrollment, progress tracking, quizzes, reviews, and subscription payments.

> **Progress:** the backend is module-based (`app/`, `config/`, `db/`, `common/`, `modules/`) and hardened; the learner frontend refactor is complete; the admin refactor has not started. See [`docs/progress/`](./docs/progress/).

## Project Purpose

This project is built to provide an end-to-end e-learning experience where:

- learners can discover courses, enroll, and track learning progress,
- instructors/admin workflows can manage course content (course -> module -> chapter -> lesson),
- users can complete quizzes and lessons to build completion history,
- subscription-based access can be handled through Stripe-powered payments.

The main goal is to combine a clean learning UI with a scalable backend/domain model for real online education workflows.

## Architecture Overview

- **Frontend:** React SPA (Vite) that handles UI, routing, user interaction, and API calls.
- **Backend:** Express API server with modular routes/controllers/repositories.
- **Database:** PostgreSQL with a relational schema for users, courses, lessons, enrollments, progress, subscriptions, and reviews.
- **Auth Session:** Cookie-based session auth using `express-session` + PostgreSQL session store.
- **Third-party services:** Stripe (payments), Cloudinary (media upload), Brevo (email flows).

## Tech Stack

### Frontend

- React 19
- React Router DOM
- TanStack React Query
- React Hook Form + Zod
- Tailwind CSS 4
- Vite
- React Toastify
- Swiper

### Backend

- Node.js + Express 5
- PostgreSQL (`pg`)
- `express-session` + `connect-pg-simple`
- `express-validator`
- `express-rate-limit`
- `bcrypt`
- `multer`
- Cloudinary SDK
- Stripe SDK
- Brevo REST API

### Database / Infrastructure

- PostgreSQL (UUID-based primary keys via `pgcrypto`)
- SQL schema defined in `backend/src/db/schema.sql`
- Environment-variable based configuration in `backend/src/config/environment.js`

## Backend Explanation

The backend follows a layered, module-based pattern under `backend/src/`:

- **App** (`backend/src/app/`): app creation, middleware pipeline, and route mounting.
- **Modules** (`backend/src/modules/<module>/`): each domain owns its `routes.js`, `controller.js`, `service.js`, `repository.js`, and `validation.js`.
- **Common** (`backend/src/common/`): shared middleware, errors, query builder, services, validation builders, and logger.
- **Config** (`backend/src/config/`): environment, pg pool (+ `withTransaction`), Cloudinary, Stripe.
- **DB** (`backend/src/db/`): `schema.sql` baseline + `migrations/` and the `migrate.js` runner.

Modules: auth, users, categories, courses, content, learning, reviews, certificates, subscriptions, admin.

Core API surface under `/api/v1`:

- `/auth/*`, `/users/*`, `/users/me/{courses,certificates,subscription}`
- `/categories`, `/courses`, `/objectives`, `/plans`, `/subscriptions`, `/certificates`, `/reviews`
- Content: `/courses/:courseId/modules`, `/modules/:moduleId/chapters`, `/chapters/:chapterId/lessons`, `/lessons/:lessonId/{contents,questions,quiz-submissions}`, `/questions/:questionId/options` (plus top-level item routes)
- Admin: `/admin/{dashboard,courses,users,plans,subscriptions,payments}`
- Webhook: `/webhooks/stripe`

### Backend Request Lifecycle

1. Request enters the Express app (`backend/src/app/app.js`).
2. Middleware runs in order: helmet, CORS, **Stripe webhook (raw body)**, CSRF guard, JSON parser, logging, rate limiter, session (+ idle timeout).
3. Route validators and auth middleware run.
4. Controller executes business logic via the module service.
5. Repository performs parameterized SQL via the pg pool.
6. Response returns the `{ success, statusCode, message, data }` envelope.
7. Global not-found and error middleware handle unmatched routes/errors.

## Frontend Explanation

The learner frontend is a React single-page app with a feature-based structure under `frontend/src/`:

- **Routing/guards:** `app/router.jsx` + `app/guards/`.
- **State/Data:** TanStack React Query; server state via hooks → feature services.
- **Auth:** `features/auth` + the `["me"]` query as the single source of truth.
- **API client:** `lib/apiClient.js` (transport, 401 handling, envelope unwrapping) and `lib/queryKeys.js` (central query keys).
- **UI:** `components/ui` primitives, `components/common`, `layouts/`, and `features/<domain>/pages`.

Main user-facing flows include:

- auth flow (signup/login/logout/password reset),
- browsing courses and viewing details,
- enrollment and learning route navigation,
- lesson/quiz progression,
- review creation and summary display,
- subscription checkout success/cancel states.

## Admin Dashboard

The `admin/` directory is a separate React SPA (Vite + Tailwind + shadcn-style UI components) used by platform administrators to manage users, courses, and subscriptions. It talks to the same backend API as the learner frontend.

### Admin Auth Flow

1. Admin opens `/login`; `AuthContext` calls `useGetMe` (`GET /users/me`) to restore any existing session.
2. Unauthenticated users are redirected to `/login` by `ProtectedRoutes` in `admin/src/App.jsx`.
3. Login form submits email/password to `POST /auth/login` (via `services/AuthApi.js`, `credentials: include`).
4. On success, `AuthContext.login()` stores the user and the app redirects to the dashboard.
5. Logout posts to `/auth/logout`, clears the query cache, and returns to `/login`.

### Layout & Navigation

- `AdminLayout` wraps all protected routes with a collapsible sidebar (`AdminSidebar`).
- Sidebar links: Dashboard, Categories, Courses, Subscriptions, Instructors, Users, plus profile, dark/light theme toggle, and logout.

### Page Flows

- **Dashboard** (`/`) — Shows stat cards (total courses, users, instructors, enrollments) and lists of recent courses and instructors, fetched via `useGetDashboardData`. Cards link to the relevant management pages.
- **Categories** (`/categories`) — DataTable of categories with create/edit modal (name, auto-generated slug, description) and delete with confirmation.
- **Courses** (`/courses`) — Paginated list with status/level/access badges and enrollment counts. Supports create/edit via modal (name, slug, description, position, category, status DRAFT/PUBLISHED, level, access type) and delete via confirm dialog. Row click navigates to course detail.
- **Course Detail** (`/courses/:courseId`) — Full course content builder. Manage objectives and the course -> module -> chapter -> lesson -> content/quiz hierarchy using expandable `ModuleCard` trees and CRUD modals (`ModuleModal`, `ChapterModal`, `LessonModal`, `ContentModal`, `QuizModal`). All deletes go through a shared `DeleteConfirmDialog`.
- **Users / Instructors** (`/users`, `/instructors`) — The same `UsersPage` component filtered by role. Paginated table with create/edit modal (name, email, role, status ACTIVE/INACTIVE/SUSPENDED) and delete.
- **Subscriptions** (`/subscriptions`) — Three tabs: Plans, User Subscriptions, and Payments, backed by `usePlans`, `useSubscriptions`, and `usePayments` hooks. Header stats show plan count, active subscriptions, and total revenue (sum of completed payments). Each tab supports CRUD modals and delete confirmation.
- **Profile** (`/profile`) — View account info (avatar, role, status, join date, last login), edit name/email, and change password.

### Data Access Pattern

Every page uses TanStack React Query hooks (`admin/src/hooks`) that wrap centralized API services (`admin/src/services/*Api.js`) through the shared `apiFetch` wrapper (`admin/src/services/http.js`). Forms are validated before submit, and success/error feedback is shown via toast/sonner notifications.

## Database Design (Table List)

Defined in `backend/src/db/schema.sql`.

### Identity & User

- `users`
- `user_profiles`
- `password_reset_codes`

### Catalog & Course Content

- `categories`
- `courses`
- `course_objectives`
- `modules`
- `chapters`
- `lessons`
- `lesson_contents`
- `quizzes`
- `quiz_options`

### Enrollment & Learning Progress

- `enrollments`
- `learn_progress`
- `lesson_completion`
- `certificates`

### Subscriptions & Payments

- `subscription_plans`
- `user_subscriptions`
- `subscription_payments`

### Reviews & Moderation

- `course_reviews`
- `review_helpful_votes`
- `review_reports`

### Supporting Types / Utilities

- Enum types: `user_role`, `user_status`, `course_level`, `content_status`, `lesson_type`, `subscription_status`, `payment_status`, `access_course_type`, `gender`
- Trigger function: `set_updated_at()` used by update triggers on many tables

### ERD Diagram

  <img src="database.svg" alt="Description" >

### ER Diagram

  <img src="er-diagram.svg" alt="Description" >
  
## How Things Flow (End-to-End)

### 1) Authentication Flow

- User submits login/signup form in frontend.
- Frontend service calls backend auth endpoint with `credentials: include`.
- Backend validates input, hashes/checks password, creates session.
- Session cookie is stored in browser, session data persisted in PostgreSQL session store.
- Frontend fetches `/users/me` style profile data and updates auth context.

### 2) Course Discovery and Enrollment

- Frontend requests course list/details via course service.
- Backend returns course data with category/instructor metadata.
- User enrolls in course.
- Backend creates enrollment record (`enrollments`) and grants access based on free/subscription logic.

### 3) Learning and Progress Tracking

- Learner opens `/courses/:courseId/lessons/:lessonId`.
- Frontend fetches learning data, lesson content, and progress state.
- On lesson completion/progress update, frontend sends progress request.
- Backend updates `learn_progress` and inserts `lesson_completion`.
- Dashboard queries reflect in-progress/completed/recent courses.

### 4) Quiz and Assessment

- Quiz endpoints return question/options for lesson quizzes.
- User submits answer(s).
- Backend validates/correctness checks and updates completion/progress logic.

### 5) Subscription and Payment

- User chooses plan from pricing page.
- Frontend calls subscription endpoints to start payment flow.
- Backend creates Stripe payment intent and stores payment/subscription records.
- Stripe webhook endpoint confirms payment status.
- Backend activates/updates `user_subscriptions` and `subscription_payments`.
- Frontend shows payment success/cancel pages.

### 6) Reviews and Feedback

- Enrolled learner posts a review/rating for course.
- Backend stores review in `course_reviews`.
- Users can vote report/helpfulness, stored in moderation tables.
- Frontend refreshes review list/summary via React Query.

## Local Setup

### 1. Clone and install

```bash
git clone <your-repository-url>
cd LEARNING_ONLINE_PLATFORM
cd backend && npm install
cd ../frontend && npm install
```

### 2. Configure environment variables

Create environment files for backend and frontend.

### Backend variables (example names)

- `PORT`
- `NODE_ENV`
- `DATABASE_URL`
- `SESSION_SECRET`
- `COOKIE_NAME`
- `CLIENT_URL`
- `BREVO_API_KEY`
- `SENDER_EMAIL`
- `STRIPE_SECRET_KEY`
- `STRIPE_WEBHOOK_SECRET`
- `CLOUDINARY_NAME`
- `CLOUDINARY_API_KEY`
- `CLOUDINARY_SECRET_KEY`

### Frontend variables (example names)

- `VITE_BASE_URL` (example: `http://localhost:5000/api/v1`)

### 3. Set up the database

For a fresh database, run `backend/src/db/schema.sql`. For an existing database, apply migrations:

```bash
cd backend
npm run db:migrate   # apply pending migrations
npm run db:status    # show applied migrations
```

### 4. Start development servers

Backend:

```bash
cd backend
npm run dev
```

Frontend:

```bash
cd frontend
npm run dev
```

### Project Preview

   <img src="image-1.png" alt="Description" >

- Link: [Visit App](https://learning-online-platform-pern.onrender.com/)

## Current Core Features

- Session-based authentication
- Role-ready user model (`LEARNER`, `INSTRUCTOR`, `ADMIN`)
- Course content hierarchy (course -> module -> chapter -> lesson)
- Lesson and quiz support
- Enrollment and learning progress tracking
- Course reviews with moderation helpers
- Subscription plans + Stripe payment integration
- Dashboard views for recent, in-progress, and completed courses

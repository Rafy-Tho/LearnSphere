# Requirements

Requirements are grouped by domain. Each requirement has an ID, a description, and its priority (Must / Should / Could). Sources: codebase review of `backend/`, `frontend/`, and `admin/`.

## 1. Identity & Authentication

| ID | Requirement | Priority |
|---|---|---|
| FR-AUTH-01 | The system shall allow a user to register with name, email, and password. | Must |
| FR-AUTH-02 | The system shall reject registration with an email that already exists. | Must |
| FR-AUTH-03 | The system shall hash passwords with bcrypt before storage. | Must |
| FR-AUTH-04 | The system shall authenticate users via email/password and create a server-side session. | Must |
| FR-AUTH-05 | The system shall persist sessions in PostgreSQL and use an HTTP-only cookie. | Must |
| FR-AUTH-06 | The system shall expose `GET /users/me` to restore the current session/user. | Must |
| FR-AUTH-07 | The system shall allow a logged-in user to log out and destroy their session. | Must |
| FR-AUTH-08 | The system shall issue a 6-digit reset code by email that expires in 10 minutes. | Must |
| FR-AUTH-09 | The system shall verify a reset code before allowing a password reset. | Must |
| FR-AUTH-10 | The system shall limit reset-code attempts and reset-code requests by rate. | Must |
| FR-AUTH-11 | The system shall allow an authenticated user to change their password. | Should |
| FR-AUTH-12 | The system shall support three roles: LEARNER, INSTRUCTOR, ADMIN. | Must |
| FR-AUTH-13 | The system shall support user statuses: ACTIVE, INACTIVE, SUSPENDED. | Must |

## 2. User Profile

| ID | Requirement | Priority |
|---|---|---|
| FR-PROF-01 | The system shall store extended profile data (bio, location, phone, birth date, gender). | Should |
| FR-PROF-02 | The system shall allow a user to upload a profile image (jpeg/jpg/png/webp, max 5 MB). | Should |
| FR-PROF-03 | The system shall store uploaded images in Cloudinary and remove the local temp file. | Should |
| FR-PROF-04 | The system shall allow a user to update name, email, and profile fields. | Must |

## 3. Catalog & Course Management

| ID | Requirement | Priority |
|---|---|---|
| FR-CAT-01 | The system shall list categories publicly. | Must |
| FR-CAT-02 | Only admins shall create, update, or delete categories. | Must |
| FR-CAT-03 | The system shall list courses with pagination, filtering, sorting, and search. | Must |
| FR-CAT-04 | Instructors/admins shall create, update, and delete courses. | Must |
| FR-CAT-05 | The system shall support course status DRAFT and PUBLISHED. | Must |
| FR-CAT-06 | The system shall support course levels BEGINNER, INTERMEDIATE, ADVANCED. | Must |
| FR-CAT-07 | The system shall support course access types FREE and SUBSCRIPTION. | Must |
| FR-CAT-08 | The system shall soft-delete courses via `deleted_at` and exclude deleted courses from listings. | Must |
| FR-CAT-09 | The system shall provide public course detail data including modules, chapters, lessons, and reviews summary. | Must |
| FR-CAT-10 | The system shall expose dashboard-specific course endpoints (recent, recommended, popular, in-progress, completed). | Should |
| FR-CAT-11 | The system shall manage course objectives (CRUD). | Should |

## 4. Content Authoring

| ID | Requirement | Priority |
|---|---|---|
| FR-CONT-01 | The system shall manage modules within a course with an ordered `position`. | Must |
| FR-CONT-02 | The system shall manage chapters within a module with an ordered `position`. | Must |
| FR-CONT-03 | The system shall manage lessons within a chapter with type TEXT or QUIZ. | Must |
| FR-CONT-04 | Lessons shall carry XP points and duration in minutes. | Should |
| FR-CONT-05 | The system shall manage positioned lesson contents (text/HTML). | Must |
| FR-CONT-06 | The system shall manage quiz questions per lesson. | Must |
| FR-CONT-07 | The system shall manage quiz options per question, including a correct flag. | Must |
| FR-CONT-08 | Content positions shall be unique within their parent. | Must |
| FR-CONT-09 | Content HTML shall be sanitized before storage. | Must |
| FR-CONT-10 | Only the owning instructor or an admin shall modify course content. | Must |

## 5. Learning & Progress

| ID | Requirement | Priority |
|---|---|---|
| FR-LRN-01 | An authenticated user shall be able to enroll in a course. | Must |
| FR-LRN-02 | Enrollment shall be unique per (user, course). | Must |
| FR-LRN-03 | The system shall track a learner's current/last lesson per course. | Must |
| FR-LRN-04 | The system shall record lesson completion with time spent and XP earned. | Must |
| FR-LRN-05 | Lesson completion shall be unique per (user, lesson). | Must |
| FR-LRN-06 | The system shall return learning data (hierarchy + content + completion) for a course. | Must |
| FR-LRN-07 | Subscription-only lesson content shall be blocked without an active subscription. | Must |
| FR-LRN-08 | The system shall provide the first lesson of a course for redirect/navigation. | Should |
| FR-LRN-09 | The system shall expose per-course lesson completions for the current user. | Should |

## 6. Quizzes & Assessment

| ID | Requirement | Priority |
|---|---|---|
| FR-QUIZ-01 | The system shall return quiz questions and options for a quiz lesson. | Must |
| FR-QUIZ-02 | The learner shall be able to answer questions and see a result. | Must |
| FR-QUIZ-03 | The system shall provide explanations for quiz questions where defined. | Should |
| FR-QUIZ-04 | Quiz completion shall contribute to lesson completion/progress. | Must |

## 7. Certificates

| ID | Requirement | Priority |
|---|---|---|
| FR-CERT-01 | The system shall check whether a learner is eligible for a course certificate. | Should |
| FR-CERT-02 | The system shall allow an eligible learner to claim a certificate with a unique number. | Should |
| FR-CERT-03 | The system shall list a learner's certificates and fetch one by ID. | Should |

## 8. Reviews & Moderation

| ID | Requirement | Priority |
|---|---|---|
| FR-REV-01 | An authenticated user shall be able to create one review per course with rating 1–5. | Must |
| FR-REV-02 | The system shall list reviews with pagination, search, sorting, and filters. | Must |
| FR-REV-03 | The system shall provide a review summary (average and rating histogram). | Must |
| FR-REV-04 | The system shall allow toggling a helpful vote per (user, review). | Should |
| FR-REV-05 | The system shall allow reporting a review with a reason. | Should |

## 9. Subscriptions & Payments

| ID | Requirement | Priority |
|---|---|---|
| FR-SUB-01 | The system shall define subscription plans with name, duration_days, and price. | Must |
| FR-SUB-02 | The system shall allow a user to start a Stripe Checkout session for a plan. | Must |
| FR-SUB-03 | The system shall create/activate a user subscription upon Stripe webhook completion. | Must |
| FR-SUB-04 | The system shall record a payment row per successful checkout. | Must |
| FR-SUB-05 | The system shall enforce at most one ACTIVE subscription per user. | Must |
| FR-SUB-06 | The system shall expose the current user's active subscription. | Must |
| FR-SUB-07 | The system shall send a payment-confirmation email on success. | Should |
| FR-SUB-08 | Admins shall manage plans, user subscriptions, and payments. | Must |

## 10. Administration

| ID | Requirement | Priority |
|---|---|---|
| FR-ADM-01 | Admins shall view dashboard statistics (courses, users, instructors, enrollments). | Must |
| FR-ADM-02 | Admins shall list, create, update, and delete users/instructors. | Must |
| FR-ADM-03 | Admins shall manage all course content through the dashboard. | Must |
| FR-ADM-04 | Admin-only endpoints shall be guarded by role authorization. | Must |

## 11. Non-Functional Requirements

| ID | Requirement | Priority |
|---|---|---|
| NFR-01 | The API shall return a consistent response envelope `{ success, statusCode, message, data }`. | Must |
| NFR-02 | The API shall map PostgreSQL error codes to appropriate HTTP status codes. | Must |
| NFR-03 | The API shall apply global rate limiting (100 req/min) and stricter limits on auth flows. | Must |
| NFR-04 | CORS shall be restricted to configured client origins with credentials enabled. | Must |
| NFR-05 | Uploaded images shall be validated by extension and MIME type, limited to 5 MB. | Must |
| NFR-06 | HTML content shall be sanitized with DOMPurify on input and on render. | Must |
| NFR-07 | List endpoints shall support pagination with metadata. | Should |
| NFR-08 | The system shall run on Node.js 22. | Must |
| NFR-09 | The frontends shall handle 401 responses by clearing auth state and redirecting to login. | Should |
| NFR-10 | The system shall not expose secrets in source; configuration shall come from environment variables. | Must |

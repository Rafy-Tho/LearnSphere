# Acceptance Criteria

Acceptance criteria are written in Given/When/Then form and map to requirement IDs in `requirements.md`. They define when a feature is considered complete and correct.

## 1. Authentication

### AC-AUTH-01 — Registration (FR-AUTH-01)
- **Given** a guest on the signup page
- **When** they submit a unique name, valid email, and a password meeting policy with terms accepted
- **Then** a user and profile are created, a session is established, and they are authenticated.

### AC-AUTH-02 — Duplicate email (FR-AUTH-02)
- **Given** an email already registered
- **When** a guest submits signup with that email
- **Then** the API returns HTTP 409 and no new user is created.

### AC-AUTH-03 — Login (FR-AUTH-04)
- **Given** a registered active user
- **When** they submit correct credentials
- **Then** the API creates a session and returns the user; subsequent requests are authenticated via cookie.

### AC-AUTH-04 — Invalid login (FR-AUTH-04)
- **Given** a registered user
- **When** they submit an incorrect password
- **Then** the API returns HTTP 401 and no session is created.

### AC-AUTH-05 — Session restore (FR-AUTH-06)
- **Given** an existing valid session cookie
- **When** the frontend calls `GET /api/v1/users/me`
- **Then** the current user is returned; if no session exists, `data` is `null`.

### AC-AUTH-06 — Logout (FR-AUTH-07)
- **Given** an authenticated user
- **When** they log out
- **Then** the session is destroyed and the cookie cleared; protected requests now return 401.

### AC-AUTH-07 — Password reset flow (FR-AUTH-08/09/10)
- **Given** a registered email
- **When** the user requests a reset code, receives it, verifies it, and submits a new valid password
- **Then** the code is invalidated and the user can log in with the new password.
- **And** an expired (>10 min) or over-attempted code is rejected.

## 2. Profile

### AC-PROF-01 — Update profile (FR-PROF-04)
- **Given** an authenticated user
- **When** they PATCH their profile with valid fields
- **Then** the changes persist and are returned on subsequent reads.

### AC-PROF-02 — Avatar upload (FR-PROF-02/03)
- **Given** an authenticated user
- **When** they upload a valid image ≤5 MB
- **Then** the image is stored in Cloudinary, the local temp file is deleted, and the profile `image_url` is updated.
- **And** an invalid type or oversized file is rejected.

## 3. Catalog & Course Management

### AC-CAT-01 — Public course list (FR-CAT-03)
- **Given** published, non-deleted courses exist
- **When** any client requests `GET /api/v1/courses`
- **Then** a paginated list is returned with `pagination` metadata, honoring filters/sort/search.

### AC-CAT-02 — Course creation (FR-CAT-04)
- **Given** an authenticated instructor/admin
- **When** they POST a valid course
- **Then** the course is created with `DRAFT` default status and appears in instructor/admin listings.

### AC-CAT-03 — Authorization on course write (FR-CAT-04, BR-ROLE-05)
- **Given** a learner
- **When** they attempt to create/update/delete a course
- **Then** the API returns HTTP 403.

### AC-CAT-04 — Soft delete (FR-CAT-08)
- **Given** a course
- **When** it is deleted
- **Then** `deleted_at` is set and it no longer appears in public or dashboard listings.

### AC-CAT-05 — Category delete protection (BR-CRS-02)
- **Given** a category referenced by a course
- **When** an admin deletes it
- **Then** the API returns HTTP 400 and the category remains.

## 4. Content Authoring

### AC-CONT-01 — Nested content CRUD (FR-CONT-01/02/03)
- **Given** an owning instructor/admin
- **When** they create modules, chapters, and lessons in order
- **Then** each is persisted with the correct parent and position and is visible in course detail.

### AC-CONT-02 — Position uniqueness (FR-CONT-08)
- **Given** a module with a chapter at position 1
- **When** another chapter is created at position 1 in the same module
- **Then** the API returns HTTP 409.

### AC-CONT-03 — Ownership enforcement (FR-CONT-10, BR-ROLE-06)
- **Given** an instructor who does not own a course
- **When** they attempt to edit its content
- **Then** the API returns HTTP 403.

### AC-CONT-04 — HTML sanitization (FR-CONT-09)
- **Given** lesson content containing a script tag
- **When** it is saved
- **Then** the script is stripped before storage.

### AC-CONT-05 — Quiz authoring (FR-CONT-06/07)
- **Given** a QUIZ lesson
- **When** a question and options (with one correct flag) are created
- **Then** the quiz is returned to learners with options and, where defined, an explanation.

## 5. Learning & Progress

### AC-LRN-01 — Enrollment (FR-LRN-01/02)
- **Given** an authenticated learner not enrolled in a course
- **When** they enroll
- **Then** an enrollment row and a seeded progress row are created.
- **And** a second enrollment attempt is rejected.

### AC-LRN-02 — Learning data (FR-LRN-06)
- **Given** an enrolled learner
- **When** they request `GET /api/v1/courses/:id/learn`
- **Then** the full hierarchy, lesson content, and their completion state are returned.

### AC-LRN-03 — Progress update (FR-LRN-03)
- **Given** an enrolled learner viewing a lesson
- **When** they navigate to another lesson
- **Then** their learning-progress current lesson is updated.

### AC-LRN-04 — Lesson completion (FR-LRN-04/05)
- **Given** an enrolled learner finishing a lesson
- **When** completion is submitted
- **Then** a completion row is created with copied XP/duration and the dashboard reflects progress.
- **And** a duplicate completion for the same lesson is not duplicated.

### AC-LRN-05 — Subscription gating (FR-LRN-07, BR-LRN-07)
- **Given** a learner without an active subscription
- **When** they request content for a subscription-gated lesson
- **Then** the API denies access.
- **Given** an active subscription, **then** access is granted.

## 6. Certificates

### AC-CERT-01 — Eligibility & claim (FR-CERT-01/02)
- **Given** a learner who completed the required course content
- **When** they check eligibility and claim
- **Then** a certificate with a unique number is created and returned.
- **And** claiming is unavailable when ineligible.

## 7. Reviews

### AC-REV-01 — Create review (FR-REV-01, BR-REV-02)
- **Given** an authenticated user
- **When** they submit a rating between 1 and 5 with optional text
- **Then** the review is stored.
- **And** a rating outside 1–5 is rejected (HTTP 422).

### AC-REV-02 — One review per course (BR-REV-01)
- **Given** a user who already reviewed a course
- **When** they submit another review for the same course
- **Then** the API returns HTTP 409.

### AC-REV-03 — Summary (FR-REV-03)
- **Given** reviews exist for a course
- **When** the summary is requested
- **Then** the average rating and a 1–5 histogram are returned.

### AC-REV-04 — Helpful vote toggle (FR-REV-04)
- **Given** a user who has not voted on a review
- **When** they vote helpful and then vote again
- **Then** the vote toggles and at most one vote per (user, review) exists.

### AC-REV-05 — Report (FR-REV-05)
- **Given** a user
- **When** they submit a report with a reason
- **Then** the report is stored; a duplicate report is rejected.

## 8. Subscriptions & Payments

### AC-SUB-01 — Checkout session (FR-SUB-02)
- **Given** an authenticated user and a plan
- **When** they request payment
- **Then** the API returns a Stripe Checkout URL and the frontend redirects.

### AC-SUB-02 — Webhook activation (FR-SUB-03/04, BR-SUB-06/07)
- **Given** a completed Stripe checkout
- **When** the webhook receives `checkout.session.completed` with a valid signature
- **Then** a user subscription is created/activated, a completed payment is recorded, and a confirmation email is sent.

### AC-SUB-03 — Invalid webhook signature (BR-SUB-06)
- **Given** a webhook request with an invalid signature
- **When** it is received
- **Then** the API rejects it and no records are created.

### AC-SUB-04 — Single active subscription (BR-SUB-01)
- **Given** a user with an ACTIVE subscription
- **When** another ACTIVE subscription would be created
- **Then** the prior one is expired first, preserving the single-active invariant.

### AC-SUB-05 — Active subscription lookup (FR-SUB-06)
- **Given** a user with an ACTIVE, unexpired subscription
- **When** they request their active subscription
- **Then** it is returned; otherwise an empty result is returned.

## 9. Administration

### AC-ADM-01 — Dashboard stats (FR-ADM-01)
- **Given** an authenticated admin
- **When** they load the dashboard
- **Then** counts for courses, users, instructors, and enrollments are returned.

### AC-ADM-02 — User management (FR-ADM-02)
- **Given** an admin
- **When** they create/update/delete a user
- **Then** the change persists and the list reflects it.

### AC-ADM-03 — Admin guard (FR-ADM-04)
- **Given** a non-admin (learner or instructor)
- **When** they call any `/api/v1/admin/*` endpoint
- **Then** the API returns HTTP 403.

## 10. Cross-Cutting

### AC-NFR-01 — Response envelope (NFR-01)
- **Given** any successful API call
- **When** it responds
- **Then** the body contains `success`, `statusCode`, `message`, and `data` (or `pagination` for lists).

### AC-NFR-02 — Error mapping (NFR-02)
- **Given** a database unique-violation
- **When** an insert/update fails
- **Then** the API returns HTTP 409 with a descriptive message.

### AC-NFR-03 — Rate limiting (NFR-03)
- **Given** a client exceeding the configured limit
- **When** it makes another request
- **Then** the API returns HTTP 429.

### AC-NFR-04 — CORS (NFR-04)
- **Given** a request from a disallowed origin
- **When** it is made with credentials
- **Then** the browser blocks the response (origin not in the allowlist).

### AC-NFR-05 — 401 handling (NFR-09)
- **Given** an expired/invalid session
- **When** the frontend receives a 401
- **Then** local auth state is cleared and the user is redirected to login.

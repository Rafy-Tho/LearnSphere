# API Design

Base URL: `{VITE_BASE_URL}` (default `http://localhost:5000/api/v1`)
Content type: `application/json` (except profile upload, which is `multipart/form-data`)
Auth: HTTP-only session cookie sent with `credentials: include`

> Route naming: plural nouns, **max 1 level of nesting**, descriptive params, user-scoped data under `/users/me`.

## 1. Conventions

### 1.1 Response Envelope

Success:

```json
{ "success": true, "statusCode": 200, "message": "OK", "data": {} }
```

List success adds pagination:

```json
{
  "success": true,
  "statusCode": 200,
  "message": "OK",
  "data": [],
  "pagination": {
    "totalItems": 42,
    "currentPage": 1,
    "totalPages": 5,
    "limit": 10,
    "next": 2,
    "prev": null
  }
}
```

Error:

```json
{ "success": false, "statusCode": 422, "message": "First validation error" }
```

In development the error body may also include `stack` and `error`.

> `200` with `data: null` is a valid "not present yet" state for learner
> sub-resources (not enrolled / no review / no progress / no certificate / no active
> subscription) and for guest `GET /users/me`. `404` is reserved for a missing parent
> resource.

### 1.2 Status Codes

`200` OK, `201` Created, `204` No Content, `400` Bad Request, `401` Unauthorized, `403` Forbidden, `404` Not Found, `409` Conflict, `422` Validation Error, `429` Too Many Requests, `500` Internal Server Error.

### 1.3 Query Parameters (List Endpoints)

Cross-cutting params accepted by every list endpoint:

| Param | Type | Meaning |
|---|---|---|
| `page` | integer >= 1 | 1-based page number (invalid values fall back to 1) |
| `limit` | integer 1-100 | Page size (capped at 100) |
| `sort` | string | Comma-separated camelCase fields; `-` prefix for descending (e.g. `-avgRating`) |
| `search` | string (>= 2 chars) | Case-insensitive `ILIKE` across the endpoint's search columns; `%`/`_` match literally |

Domain filters are camelCase and named after the semantic field. Enum filters pass the raw enum value (not a boolean); ranges use explicit `min*`/`max*`; repeat a key to match multiple values (`IN`). Unknown parameters are rejected with `422`.

Each endpoint derives its filters, sortable fields, and search columns from a query spec (e.g. `backend/src/modules/courses/course.query-spec.js`), which also drives validation and the tables below.

#### `GET /courses`

| Param | Type | Values | Description |
|---|---|---|---|
| `level` | enum | `BEGINNER`, `INTERMEDIATE`, `ADVANCED` | Course difficulty level |
| `categoryId` | uuid (repeatable) | category UUIDs | Match any of the given categories |
| `accessType` | enum | `FREE`, `SUBSCRIPTION` | Free or subscription-only access |
| `minRating` | number 0-5 | | Minimum average rating |
| `maxRating` | number 0-5 | | Maximum average rating |
| `minDuration` | integer (minutes) | | Minimum total duration |
| `maxDuration` | integer (minutes) | | Maximum total duration |
| `sort` | enum | `createdAt`, `avgRating`, `totalDuration` | Sort field |

Example: `?page=1&level=BEGINNER&accessType=FREE&categoryId=<uuid>&minRating=4&minDuration=180&sort=-avgRating`

#### `GET /courses/:courseId/reviews`

| Param | Type | Values | Description |
|---|---|---|---|
| `rating` | integer 1-5 | | Exact star rating |
| `search` | string | | Search within review text |
| `sort` | enum | `createdAt`, `rating` | Sort field |

#### `GET /admin/courses`

| Param | Type | Values | Description |
|---|---|---|---|
| `level` | enum | `BEGINNER`, `INTERMEDIATE`, `ADVANCED` | Course difficulty level |
| `categoryId` | uuid (repeatable) | category UUIDs | Match any of the given categories |
| `accessType` | enum | `FREE`, `SUBSCRIPTION` | Free or subscription-only access |
| `sort` | enum | `createdAt` | Sort field |

#### `GET /admin/users`

| Param | Type | Values | Description |
|---|---|---|---|
| `role` | enum | `LEARNER`, `INSTRUCTOR`, `ADMIN` | Filter by role |

### 1.4 Middleware Legend

`auth` = `requireAuth`; `admin`/`instructor`/`roles(...)` = `authorize`; `val` = validator + `validateResult`.

---

## 2. Auth

Mounted at `/api/v1/auth`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| POST | `/register` | `emailVerificationLimiter`, `val` | Register user + profile, email a verification code |
| POST | `/login` | `loginLimiter`, `val` | Authenticate; session only when email is verified |
| POST | `/verify-email` | `codeAttemptsLimiter`, `val` | Verify pending email code, then start session |
| POST | `/resend-verification-code` | `emailVerificationLimiter` | Re-issue the pending verification code |
| POST | `/logout` | `auth` | Destroy session |
| POST | `/password-resets` | `passwordResetLimiter`, `val` | Request a password reset code |
| POST | `/password-resets/verify` | `codeAttemptsLimiter`, `val` | Verify reset code |
| PATCH | `/password` | `codeAttemptsLimiter`, `val` | Reset password with code |
| GET | `/google` | `loginLimiter` | Start Google OAuth: set state/nonce/PKCE in session, redirect to Google |
| GET | `/google/callback` | — | Validate Google response, link/create user, start session, redirect to frontend |

> Registration and login of an unverified account return
> `data: { requiresEmailVerification: true, email }` and set a pending
> verification id in the session; no authenticated session is created until
> `POST /verify-email` succeeds. `POST /verify-email` takes `{ code }` only and
> returns the authenticated user.

> Google OAuth is browser-driven and does not use the JSON envelope: both
> endpoints redirect. The callback always redirects to
> `${CLIENT_URL_1}/auth/callback?status=success` or
> `?status=error&code=<OAUTH_ERROR_CODE>` (codes: `OAUTH_STATE_INVALID`,
> `GOOGLE_AUTH_FAILED`, `GOOGLE_EMAIL_NOT_VERIFIED`,
> `GOOGLE_ACCOUNT_ALREADY_LINKED`, `OAUTH_CALLBACK_FAILED`, `OAUTH_CANCELLED`).
> The provider identity comes only from Google's validated ID token; the
> frontend never supplies it.

## 3. Users (current user)

Mounted at `/api/v1/users`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| GET | `/me` | — | Current user or `data: null` for guests |
| GET | `/me/profile` | `auth` | Full profile |
| PATCH | `/me/profile` | `auth`, upload, `val` | Update profile (+ avatar) |
| GET | `/me/xp` | `auth` | XP summary (`total_xp`, `today_xp`) from the XP ledger |
| GET | `/me/xp/transactions` | `auth` | XP transaction history (paginated) |
| GET | `/me/activities` | `auth` | Activity feed (paginated) |
| PATCH | `/me/password` | `auth`, `val` | Change password |
| GET | `/me/courses/recently-viewed` | `auth` | Recently viewed courses |
| GET | `/me/courses/recommended` | `auth` | Recommended courses |
| GET | `/me/courses/in-progress` | `auth` | In-progress courses |
| GET | `/me/courses/completed` | `auth` | Completed courses |
| GET | `/me/saved-courses` | `auth` | Saved courses (paginated) |
| GET | `/me/saved-courses/ids` | `auth` | Saved course IDs (for bookmark state) |
| GET | `/me/certificates` | `auth` | List my certificates (paginated) |
| GET | `/me/subscription` | `auth` | Current or latest subscription (`is_active`, `days_remaining`) or `data: null` |
| GET | `/me/payments` | `auth` | My payment history (paginated, includes refund totals) |
| GET | `/me/payments/:paymentId` | `auth`, `val` | My payment detail (ownership enforced) |

## 4. Admin

Mounted under `/api/v1/admin`.

| Method | Path | Description |
|---|---|---|
| GET | `/dashboard` | Dashboard stats (instructors list bounded to 5) |
| GET | `/courses` | Admin course list (paginated) |
| GET | `/courses/:courseId` | Full content tree for admin builder |
| GET | `/users` | List users (top-level `pagination`, `role` filter) |
| POST | `/users` | Create user |
| PATCH | `/users/:userId` | Update user |
| DELETE | `/users/:userId` | Delete user |
| GET/POST | `/plans` | List (paginated) / create plan |
| PATCH/DELETE | `/plans/:planId` | Update / delete plan |
| GET/POST | `/subscriptions` | List (paginated) / create user subscription |
| PATCH/DELETE | `/subscriptions/:subscriptionId` | Update / delete user subscription |
| GET/POST | `/payments` | List (paginated) / create payment |
| PATCH/DELETE | `/payments/:paymentId` | Update / delete payment |

`/admin/users`, `/admin/plans`, `/admin/subscriptions`, and `/admin/payments` require `auth` + `roles(ADMIN)`; `/admin/dashboard` and `/admin/courses` allow `roles(ADMIN, INSTRUCTOR)`.

## 5. Categories

Mounted at `/api/v1/categories`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| GET | `/` | — | List categories |
| POST | `/` | `auth`, `roles(ADMIN)`, `val` | Create category |
| GET | `/:categoryId` | — | Get category |
| PATCH | `/:categoryId` | `auth`, `roles(ADMIN)`, `val` | Update category |
| DELETE | `/:categoryId` | `auth`, `roles(ADMIN)`, `val` | Delete category |

## 6. Courses

Mounted at `/api/v1/courses`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| GET | `/` | — | Paginated/filtered course list |
| POST | `/` | `auth`, `roles(INSTRUCTOR, ADMIN)`, `val` | Create course |
| GET | `/popular` | — | Popular courses |
| GET | `/:courseId` | — | Course detail |
| PATCH | `/:courseId` | `auth`, `roles(INSTRUCTOR, ADMIN)`, `val` | Update course |
| DELETE | `/:courseId` | `auth`, `roles(INSTRUCTOR, ADMIN)`, `val` | Soft-delete course |
| GET | `/:courseId/curriculum` | — | Learning data (curriculum metadata; public preview) |
| GET | `/:courseId/first-lesson` | — | First lesson of the course |
| GET | `/:courseId/completions` | `auth` | Current user's completions in course |
| POST | `/:courseId/saved` | `auth`, `val` | Save course (bookmark) |
| DELETE | `/:courseId/saved` | `auth`, `val` | Remove saved course |

### 6.1 Nested Course Routers

`/api/v1/courses/:courseId/...` composes: `modules`, `objectives`, `reviews`, `enrollments`, `progress`, `certificates`, `saved`.

## 7. Objectives

Nested collection at `/api/v1/courses/:courseId/objectives`; item at `/api/v1/objectives`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| GET | `/courses/:courseId/objectives` | — | List objectives |
| POST | `/courses/:courseId/objectives` | `auth`, `roles(INSTRUCTOR, ADMIN)`, `val` | Create objective |
| PATCH | `/objectives/:objectiveId` | `auth`, `roles(INSTRUCTOR, ADMIN)`, `val` | Update objective |
| DELETE | `/objectives/:objectiveId` | `auth`, `roles(INSTRUCTOR, ADMIN)`, `val` | Delete objective |

## 8. Modules

Collection at `/api/v1/courses/:courseId/modules`; item at `/api/v1/modules`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| POST | `/courses/:courseId/modules` | `auth`, `roles(INSTRUCTOR, ADMIN)`, `val` | Create module |
| GET | `/modules/:moduleId` | — | Get module |
| PATCH | `/modules/:moduleId` | `auth`, `roles(INSTRUCTOR, ADMIN)`, `val` | Update module |
| DELETE | `/modules/:moduleId` | `auth`, `roles(INSTRUCTOR, ADMIN)`, `val` | Delete module |

## 9. Chapters

Collection at `/api/v1/modules/:moduleId/chapters`; item at `/api/v1/chapters`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| GET | `/modules/:moduleId/chapters` | — | List chapters |
| POST | `/modules/:moduleId/chapters` | `auth`, `roles(INSTRUCTOR, ADMIN)`, `val` | Create chapter |
| GET | `/chapters/:chapterId` | — | Get chapter |
| PATCH | `/chapters/:chapterId` | `auth`, `roles(INSTRUCTOR, ADMIN)`, `val` | Update chapter |
| DELETE | `/chapters/:chapterId` | `auth`, `roles(INSTRUCTOR, ADMIN)`, `val` | Delete chapter |

## 10. Lessons

Collection at `/api/v1/chapters/:chapterId/lessons`; item at `/api/v1/lessons`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| POST | `/chapters/:chapterId/lessons` | `auth`, `roles(INSTRUCTOR, ADMIN)`, `val` | Create lesson |
| PATCH | `/lessons/:lessonId` | `auth`, `roles(INSTRUCTOR, ADMIN)`, `val` | Update lesson |
| DELETE | `/lessons/:lessonId` | `auth`, `roles(INSTRUCTOR, ADMIN)`, `val` | Delete lesson |

## 11. Lesson Contents

Collection at `/api/v1/lessons/:lessonId/contents`; item at `/api/v1/contents`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| GET | `/lessons/:lessonId/contents` | — | List lesson contents |
| POST | `/lessons/:lessonId/contents` | `auth`, `roles(INSTRUCTOR, ADMIN)`, `val` | Create content |
| PATCH | `/contents/:contentId` | `auth`, `roles(INSTRUCTOR, ADMIN)`, `val` | Update content |
| DELETE | `/contents/:contentId` | `auth`, `roles(INSTRUCTOR, ADMIN)`, `val` | Delete content |

## 12. Questions (Quizzes)

Collection at `/api/v1/lessons/:lessonId/questions`; item at `/api/v1/questions`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| GET | `/lessons/:lessonId/questions` | `auth`, enrolled/owner/admin | List questions with options |
| POST | `/lessons/:lessonId/questions` | `auth`, `roles(ADMIN, INSTRUCTOR)`, `val` | Create question |
| PATCH | `/questions/:questionId` | `auth`, `roles(ADMIN, INSTRUCTOR)`, `val` | Update question |
| DELETE | `/questions/:questionId` | `auth`, `roles(ADMIN, INSTRUCTOR)`, `val` | Delete question |

### Quiz attempts

Collection at `/api/v1/lessons/:lessonId/quiz-attempts` (learner's own attempts).

| Method | Path | Middleware | Description |
|---|---|---|---|
| POST | `/lessons/:lessonId/quiz-attempts` | `auth`, enrolled/owner/admin, `val` | Grade server-side, persist a completed attempt + answers, mark the lesson complete |
| GET | `/lessons/:lessonId/quiz-attempts` | `auth`, enrolled/owner/admin | Attempt history + best score |
| GET | `/lessons/:lessonId/quiz-attempts/latest` | `auth`, enrolled/owner/admin | Latest completed attempt with full review (or `null`) |

Correct answers and explanations are only returned after submission (review payloads), never while taking the quiz.

## 13. Options (Quiz Answers)

Collection at `/api/v1/questions/:questionId/options`; item at `/api/v1/options`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| POST | `/questions/:questionId/options` | `auth`, `roles(INSTRUCTOR, ADMIN)`, `val` | Create option |
| PATCH | `/options/:optionId` | `auth`, `roles(INSTRUCTOR, ADMIN)`, `val` | Update option |
| DELETE | `/options/:optionId` | `auth`, `roles(INSTRUCTOR, ADMIN)`, `val` | Delete option |

## 14. Reviews

Collection at `/api/v1/courses/:courseId/reviews`; item at `/api/v1/reviews`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| GET | `/courses/:courseId/reviews` | — | Paginated reviews |
| POST | `/courses/:courseId/reviews` | `auth`, `val` | Create review |
| GET | `/courses/:courseId/reviews/summary` | — | Average + histogram |
| GET | `/courses/:courseId/reviews/me` | `auth` | Current user's review |
| PUT | `/reviews/:reviewId/helpful-vote` | `auth`, `val` | Set helpful vote |
| DELETE | `/reviews/:reviewId/helpful-vote` | `auth` | Remove helpful vote |
| POST | `/reviews/:reviewId/reports` | `auth`, `val` | Report review |

## 15. Enrollments

Nested at `/api/v1/courses/:courseId/enrollments`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| POST | `/courses/:courseId/enrollments` | `auth`, `val` | Enroll current user |
| GET | `/courses/:courseId/enrollments` | `auth` | Get current user's enrollment |

## 16. Learning Progress

Nested at `/api/v1/courses/:courseId/progress`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| POST | `/courses/:courseId/progress` | `auth`, `val` | Create progress |
| GET | `/courses/:courseId/progress` | `auth` | Get progress |
| PATCH | `/courses/:courseId/progress` | `auth`, `val` | Update current lesson |

## 17. Lesson Completions & Start

Nested at `/api/v1/lessons/:lessonId/completions` and `/api/v1/lessons/:lessonId/start`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| POST | `/lessons/:lessonId/start` | `auth`, `val` | Set current lesson, record `START_COURSE`/`START_LESSON` (idempotent) |
| POST | `/lessons/:lessonId/completions` | `auth`, `val` | Record completion (idempotent), update progress, record `COMPLETE_LESSON`, award lesson XP, detect `COMPLETE_COURSE` |
| GET | `/lessons/:lessonId/completions` | `auth` | Get completion |

## 18. Certificates

Course-scoped at `/api/v1/courses/:courseId/certificates`; item at `/api/v1/certificates`; mine at `/api/v1/users/me/certificates`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| GET | `/courses/:courseId/certificates/check` | `auth` | Eligibility check |
| POST | `/courses/:courseId/certificates` | `auth`, `val` | Claim certificate |
| GET | `/courses/:courseId/certificates` | `auth` | Get course certificate |
| GET | `/certificates/:certificateId` | `val` | Get certificate by ID |
| GET | `/users/me/certificates` | `auth` | List my certificates (paginated) |

## 19. Plans, Subscriptions & Coupons

| Method | Path | Middleware | Description |
|---|---|---|---|
| GET | `/plans` | — | Active plans (public pricing) |
| GET | `/plans/:planId` | `val` | Plan by ID |
| POST | `/subscriptions/:planId/checkout` | `auth`, `val` | Create Stripe Checkout session; optional body `{ coupon_code }` |
| POST | `/coupons/validate` | `auth`, `val` | Validate a coupon against a plan; returns discount preview |

Amounts are always calculated server-side; the client never supplies price, discount, or status.

## 20. Stripe Webhook

Mounted at `/api/v1/webhooks/stripe`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| POST | `/` | `express.raw({ type: "application/json" })` | Verify signature; process idempotently by Stripe event id |

Handled events: `checkout.session.completed` (provision subscription + payment +
coupon redemption), `charge.refunded` and `refund.created` / `refund.updated`
(record refunds, update payment status), `payment_intent.payment_failed` (logged).
Duplicate deliveries are ignored via `stripe_webhook_events`.

> The webhook is registered before `express.json()` in `app/middleware.js`.

## 21. Error Mapping

| PostgreSQL SQLSTATE | HTTP | Message |
|---|---|---|
| 23505 (unique) | 409 | Parsed field conflict message |
| 23503 (FK) | 400 | Referenced record error |
| 23502 (not null) | 400 | Required field message |
| 22P02 (invalid text) | 400 | Invalid input |
| other | 500 | Internal server error |

## 22. Example Requests

```http
POST /api/v1/auth/login
Content-Type: application/json
{ "email": "user@example.com", "password": "P@ssw0rd!" }
```

```http
GET /api/v1/courses?page=1&limit=12&level=BEGINNER&sort=-created_at
```

```http
PATCH /api/v1/users/me/profile
Content-Type: multipart/form-data; boundary=...
name=Jane&bio=Hello&image=<file>
```

```http
POST /api/v1/subscriptions/<planId>/checkout
```

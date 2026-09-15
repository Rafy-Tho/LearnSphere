# API Design

Base URL: `{VITE_BASE_URL}` (default `http://localhost:5000/api/v1`)
Content type: `application/json` (except profile upload, which is `multipart/form-data`)
Auth: HTTP-only session cookie sent with `credentials: include`

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
  "pagination": { "page": 1, "limit": 10, "total": 42, "totalPages": 5 }
}
```

Error:

```json
{ "success": false, "statusCode": 422, "message": "First validation error" }
```

In development the error body may also include `stack` and `error`.

### 1.2 Status Codes

`200` OK, `201` Created, `204` No Content, `400` Bad Request, `401` Unauthorized, `403` Forbidden, `404` Not Found, `409` Conflict, `422` Validation Error, `429` Too Many Requests, `500` Internal Server Error.

### 1.3 Query Parameters (List Endpoints)

| Param | Meaning |
|---|---|
| `page` | 1-based page number |
| `limit` | Page size |
| `sort` | Field name; prefix `-` for descending (e.g. `-created_at`) |
| `fields` | Comma-separated projection |
| `search` | Full-text-ish `ILIKE` across mapped fields |
| filters | Domain-specific keys, some with operators `[gte] [gt] [lte] [lt]` |

Examples: `?level=BEGINNER`, `?category=<uuid>`, `?duration[gte]=30`, `?rating[gte]=4`, `?isFree=true`.

### 1.4 Middleware Legend

`auth` = `requireAuth`; `admin`/`instructor`/`roles(...)` = `authorize`; `val` = validator + `validateResult`.

## 2. Users

Mounted at `/api/v1/users` via `backend/src/modules/auth/routes.js`, `backend/src/modules/users/routes.js`, and the legacy `backend/src/routes/userRoute.js` (payment/dashboard).

| Method | Path | Middleware | Description |
|---|---|---|---|
| POST | `/register` | `val` | Register user + profile, start session |
| POST | `/login` | `val` | Authenticate, start session |
| POST | `/logout` | `auth` | Destroy session |
| GET | `/me` | — | Current user or `null` |
| GET | `/profile` | `auth` | Full profile |
| GET | `/xp-earned` | `auth` | Total XP earned |
| PATCH | `/profile` | `auth`, upload, `val` | Update profile (+ avatar) |
| PATCH | `/update-password` | `auth`, `val` | Change password |
| POST | `/password-reset-code` | `passwordResetLimiter`, `val` | Send reset code |
| POST | `/verify-password-reset-code` | `codeAttemptsLimiter`, `val` | Verify reset code |
| POST | `/reset-password` | `codeAttemptsLimiter`, `val` | Reset password |
| POST | `/payment-stripe/:subscriptionId` | `auth` | Create Stripe Checkout session |
| GET | `/dashboard-data` | `auth`, `roles(INSTRUCTOR, ADMIN)` | Instructor/admin dashboard stats |

## 3. Categories

Mounted at `/api/v1/categories`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| GET | `/` | — | List categories |
| POST | `/` | `auth`, `roles(ADMIN)`, `val` | Create category |
| GET | `/:id` | — | Get category |
| PATCH | `/:id` | `auth`, `roles(ADMIN)`, `val` | Update category |
| DELETE | `/:id` | `auth`, `roles(ADMIN)` | Delete category |

## 4. Courses

Mounted at `/api/v1/courses`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| GET | `/` | — | Paginated/filtered course list |
| POST | `/` | `auth`, `roles(INSTRUCTOR, ADMIN)`, `val` | Create course |
| GET | `/recently-viewed` | `auth` | Recently viewed courses |
| GET | `/recommended` | `auth` | Recommended courses |
| GET | `/popular` | — | Popular courses |
| GET | `/in-progress` | `auth` | In-progress courses |
| GET | `/completed` | `auth` | Completed courses |
| GET | `/dashboard` | `auth`, `roles(ADMIN, INSTRUCTOR)` | Dashboard course list |
| GET | `/:id/dashboard-details` | `auth`, `roles(ADMIN, INSTRUCTOR)` | Full content tree for admin builder |
| GET | `/:id` | — | Course detail |
| PATCH | `/:id` | `auth`, `roles(INSTRUCTOR, ADMIN)`, `val` | Update course |
| DELETE | `/:id` | `auth`, `roles(INSTRUCTOR, ADMIN)` | Soft-delete course |
| GET | `/:id/learn` | — | Learning data (hierarchy + content) |
| GET | `/:id/lesson-completions` | `auth` | Current user's completions in course |

### 4.1 Nested Course Routers

`/api/v1/courses/:id/...` composes: `modules`, `objectives`, `lessons`, `reviews`, `enrollments`, `progresses`, `certificates`.

## 5. Course Objectives

Nested under `/api/v1/courses/:id/objectives`; also top-level `/api/v1/objectives`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| GET | `/objectives` | — | List objectives |
| POST | `/objectives` | `auth`, `roles(INSTRUCTOR, ADMIN)`, `val` | Create objective |
| PATCH | `/objectives/:id` | `auth`, `roles(INSTRUCTOR, ADMIN)`, `val` | Update objective |
| DELETE | `/objectives/:id` | `auth`, `roles(INSTRUCTOR, ADMIN)` | Delete objective |

## 6. Modules

Nested under `/api/v1/courses/:id/modules`; top-level `/api/v1/modules`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| POST | `/modules` | `auth`, `roles(INSTRUCTOR, ADMIN)`, `val` | Create module |
| GET | `/modules/:id` | — | Get module |
| PATCH | `/modules/:id` | `auth`, `roles(INSTRUCTOR, ADMIN)`, `val` | Update module |
| DELETE | `/modules/:id` | `auth`, `roles(INSTRUCTOR, ADMIN)` | Delete module |

## 7. Chapters

Nested under `/api/v1/modules/:id/chapters`; top-level `/api/v1/chapters`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| GET | `/chapters` | — | List chapters |
| POST | `/chapters` | `auth`, `roles(INSTRUCTOR, ADMIN)`, `val` | Create chapter |
| GET | `/chapters/:id` | — | Get chapter |
| PATCH | `/chapters/:id` | `auth`, `roles(INSTRUCTOR, ADMIN)`, `val` | Update chapter |
| DELETE | `/chapters/:id` | `auth`, `roles(INSTRUCTOR, ADMIN)` | Delete chapter |

## 8. Lessons

Nested under `/api/v1/chapters/:id/lessons` and `/api/v1/courses/:id/lessons`; top-level `/api/v1/lessons`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| POST | `/lessons` | `auth`, `roles(INSTRUCTOR, ADMIN)`, `val` | Create lesson |
| PATCH | `/lessons/:id` | `auth`, `roles(INSTRUCTOR, ADMIN)`, `val` | Update lesson |
| DELETE | `/lessons/:id` | `auth`, `roles(INSTRUCTOR, ADMIN)` | Delete lesson |
| GET | `/lessons/first` | — | First lesson of a course |

## 9. Lesson Contents

Nested under `/api/v1/lessons/:id/contents`; top-level `/api/v1/contents`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| GET | `/contents` | — | List lesson contents |
| POST | `/contents` | `auth`, `roles(INSTRUCTOR, ADMIN)`, `val` | Create content |
| PATCH | `/contents/:id` | `auth`, `roles(INSTRUCTOR, ADMIN)`, `val` | Update content |
| DELETE | `/contents/:id` | `auth`, `roles(INSTRUCTOR, ADMIN)` | Delete content |

## 10. Questions (Quizzes)

Nested under `/api/v1/lessons/:id/questions`; top-level `/api/v1/questions`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| GET | `/questions` | — | List questions with options |
| POST | `/questions` | `auth`, `roles(ADMIN, INSTRUCTOR)`, `val` | Create question |
| PATCH | `/questions/:id` | `auth`, `roles(ADMIN, INSTRUCTOR)`, `val` | Update question |
| DELETE | `/questions/:id` | `auth`, `roles(ADMIN, INSTRUCTOR)` | Delete question |

## 11. Options (Quiz Answers)

Nested under `/api/v1/questions/:id/options`; top-level `/api/v1/options`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| POST | `/options` | `auth`, `val` | Create option |
| PATCH | `/options/:id` | `auth`, `roles(INSTRUCTOR, ADMIN)` | Update option |
| DELETE | `/options/:id` | `auth`, `roles(INSTRUCTOR, ADMIN)` | Delete option |

> **Known issue:** `POST /options` lacks an `authorize` guard and `PATCH /options/:id` lacks a validator.

## 12. Enrollments

Nested under `/api/v1/courses/:id/enrollments`; top-level `/api/v1/enrollments`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| POST | `/enrollments` | `auth` | Enroll current user |
| GET | `/enrollments` | `auth` | Get current user's enrollment |

## 13. Learning Progress

Nested under `/api/v1/courses/:id/progresses`; top-level `/api/v1/progresses`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| POST | `/progresses` | `auth` | Create progress |
| GET | `/progresses` | `auth` | Get progress |
| PATCH | `/progresses` | `auth`, `val` | Update current lesson |

## 14. Lesson Completions

Nested under `/api/v1/lessons/:id/completions`; top-level `/api/v1/completions`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| POST | `/completions` | `auth` | Record completion |
| GET | `/completions` | `auth` | Get completion |

## 15. Reviews

Nested under `/api/v1/courses/:id/reviews`; top-level `/api/v1/reviews`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| GET | `/reviews` | — | Paginated reviews |
| POST | `/reviews` | `auth`, `val` | Create review |
| GET | `/reviews/summary` | — | Average + histogram |
| POST | `/reviews/:id/helpful-votes` | `auth`, `val` | Toggle helpful vote |
| POST | `/reviews/:id/reports` | `auth`, `val` | Report review |
| GET | `/reviews/me` | `auth` | Current user's review |

## 16. Certificates

Nested under `/api/v1/courses/:id/certificates`; standalone at `/api/v1/certificates`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| GET | `.../certificates/check` | `auth` | Eligibility check |
| POST | `.../certificates` | `auth` | Claim certificate |
| GET | `.../certificates` | `auth` | Get course certificate |
| GET | `/api/v1/certificates/mine` | `auth` | List my certificates |
| GET | `/api/v1/certificates/:id` | — | Get certificate by ID |

## 17. Subscriptions

Mounted at `/api/v1/subscriptions`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| GET | `/user-active` | `auth` | Current user's active subscription |
| GET | `/:id` | — | Subscription by ID |

## 18. Admin Users

Mounted at `/api/v1/admin/users`; router-level `auth` + `roles(ADMIN)`.

| Method | Path | Description |
|---|---|---|
| GET | `/` | List users (paginated, role filter) |
| POST | `/` | Create user |
| PATCH | `/:id` | Update user |
| DELETE | `/:id` | Delete user |

## 19. Admin Subscriptions

Mounted at `/api/v1/admin/subscriptions`; router-level `auth` + `roles(ADMIN)`.

| Resource | Methods |
|---|---|
| Plans | GET/POST `/plans`, PATCH/DELETE `/plans/:id` |
| User subscriptions | GET/POST `/user-subscriptions`, PATCH/DELETE `/user-subscriptions/:id` |
| Payments | GET/POST `/payments`, PATCH/DELETE `/payments/:id` |

## 20. Stripe Webhook

Mounted at `/api/v1/stripe-webhook`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| POST | `/` | `express.raw({ type: "application/json" })` | Verify signature, handle `checkout.session.completed` |

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
POST /api/v1/users/login
Content-Type: application/json
{ "email": "user@example.com", "password": "P@ssw0rd!" }
```

```http
GET /api/v1/courses?page=1&limit=12&level=BEGINNER&sort=-created_at
```

```http
PATCH /api/v1/users/profile
Content-Type: multipart/form-data; boundary=...
name=Jane&bio=Hello&image=<file>
```

```http
POST /api/v1/users/payment-stripe/<subscriptionId>
```

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

| Param | Meaning |
|---|---|
| `page` | 1-based page number (non-finite values fall back to 1) |
| `limit` | Page size, capped at 100 |
| `sort` | Field name; prefix `-` for descending (e.g. `-created_at`) |
| `search` | Full-text-ish `ILIKE` across mapped fields |
| filters | Domain-specific keys, some with operators `[gte] [gt] [lte] [lt]` |

Examples: `?level=BEGINNER`, `?category=<uuid>`, `?duration[gte]=30`, `?rating[gte]=4`, `?isFree=true`.

### 1.4 Middleware Legend

`auth` = `requireAuth`; `admin`/`instructor`/`roles(...)` = `authorize`; `val` = validator + `validateResult`.

---

## 2. Auth

Mounted at `/api/v1/auth`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| POST | `/register` | `val` | Register user + profile, start session |
| POST | `/login` | `loginLimiter`, `val` | Authenticate, start session |
| POST | `/logout` | `auth` | Destroy session |
| POST | `/password-resets` | `passwordResetLimiter`, `val` | Request a password reset code |
| POST | `/password-resets/verify` | `codeAttemptsLimiter`, `val` | Verify reset code |
| PATCH | `/password` | `codeAttemptsLimiter`, `val` | Reset password with code |

## 3. Users (current user)

Mounted at `/api/v1/users`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| GET | `/me` | — | Current user or `data: null` for guests |
| GET | `/me/profile` | `auth` | Full profile |
| PATCH | `/me/profile` | `auth`, upload, `val` | Update profile (+ avatar) |
| GET | `/me/xp` | `auth` | Total XP earned |
| PATCH | `/me/password` | `auth`, `val` | Change password |
| GET | `/me/courses/recently-viewed` | `auth` | Recently viewed courses |
| GET | `/me/courses/recommended` | `auth` | Recommended courses |
| GET | `/me/courses/in-progress` | `auth` | In-progress courses |
| GET | `/me/courses/completed` | `auth` | Completed courses |
| GET | `/me/certificates` | `auth` | List my certificates (paginated) |
| GET | `/me/subscription` | `auth` | Current user's active subscription |

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

### 6.1 Nested Course Routers

`/api/v1/courses/:courseId/...` composes: `modules`, `objectives`, `reviews`, `enrollments`, `progress`, `certificates`.

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

## 17. Lesson Completions

Nested at `/api/v1/lessons/:lessonId/completions`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| POST | `/lessons/:lessonId/completions` | `auth`, `val` | Record completion |
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

## 19. Plans & Subscriptions

| Method | Path | Middleware | Description |
|---|---|---|---|
| GET | `/plans/:planId` | `val` | Plan by ID |
| POST | `/subscriptions/:planId/checkout` | `auth`, `val` | Create Stripe Checkout session |

## 20. Stripe Webhook

Mounted at `/api/v1/webhooks/stripe`.

| Method | Path | Middleware | Description |
|---|---|---|---|
| POST | `/` | `express.raw({ type: "application/json" })` | Verify signature, handle `checkout.session.completed` |

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

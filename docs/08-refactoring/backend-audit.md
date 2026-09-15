# Backend Audit

Read-only audit of `backend/`. Evidence is cited as `file:line`. Severity tags: **Confirmed**, **Likely**, **Possible**.

**Companion docs:** [`codebase-audit.md`](./codebase-audit.md) (register + roadmap), [`frontend-audit.md`](./frontend-audit.md).

---

## 1. Folder Structure

```
backend/
├── server.js                     DB check + listen
├── package.json                  scripts: dev, pro (no lint/test)
├── eslint.config.mjs
├── .env                          gitignored
├── uploads/                      multer destination (profile.jpg is committed!)
└── src/
    ├── app.js                    middleware order + route mounts + error handling
    ├── configs/                  Env.js, database.js, cloudinary.js, schema.sql
    ├── constants/                constants.js, StatusCode.js
    ├── controllers/              one per domain
    ├── repositories/             one class per table/domain
    ├── services/                 EmailService, HashService, HashCode, SessionService
    ├── middlewares/              requireAuth, authorize, validateResult, rateLimit, session, multer, errorHandler
    ├── validators/               express-validator schemas + common.validator.js
    ├── helper/createRadomCode.js
    ├── utils/                    ApiError, asyncHandler, notFoundUrl, AdvaceQuery (typo)
    └── routes/                   domain routers + admin/ + webhookRoute
```

**Observations (Confirmed):**
- Layering is generally respected, but there is no domain service layer — controllers call repositories directly.
- `backend/uploads/profile.jpg` is tracked in git and the directory is served statically (`app.js:61`).
- No migrations, no seed, no tests, no CI.
- Filename typo `utils/AdvaceQuery.js` (should be `Advance`), consistently imported.

---

## 2. Middleware & Request Pipeline

Order in `app.js`: `trust proxy` (`:38`) → CORS (`:41-43`) → **webhook (`:46`, raw body)** → `express.json`/`urlencoded` (`:49-50`) → morgan (dev only, `:53-56`) → `globalLimiter` (`:57`) → session (`:58`) → static uploads (`:61`) → routers (`:64-81`) → 404 (`:83`) → error handler (`:84`).

| Finding | Evidence | Severity |
|---|---|---|
| Webhook correctly mounted before body parsers (good) | `app.js:46` | — |
| No security headers (`helmet` absent) | `app.js`, `package.json` | Confirmed |
| `trust proxy: 1` can enable IP rate-limit spoofing if not exactly one proxy | `app.js:38` | Confirmed |
| CORS allowlist may contain `undefined` if env unset | `app.js:42`, `Env.js:14-15` | Possible |
| Multer errors (`fileFilter`/`MulterError`) become 500, not 400 | `multer.js:26`, `errorHandler.js:33-59` | Confirmed |
| Upload runs **before** validators, orphaning files on validation failure | `userRoute.js:52-56` | Confirmed |

---

## 3. Authentication

| Finding | Evidence | Severity |
|---|---|---|
| bcrypt cost 12 (good) | `HashService.js:5` | — |
| Session regenerated on login/register (fixation-safe) | `SessionService.js:4-14` | — |
| Login does not check `users.status` → SUSPENDED/INACTIVE can log in | `userControllers.js:55-79` | Confirmed |
| Login timing oracle: no dummy bcrypt for unknown users | `userControllers.js:58-65` | Confirmed |
| Register returns 400 (not 409) and reveals existing email | `userControllers.js:24-26` | Confirmed |
| Reset endpoints return 404 "User Doesn't Exist" → enumeration | `userControllers.js:197-199,230-232,264-266` | Confirmed |
| `getMe` is public and returns role/status for any session | `userRoute.js:45`, `userControllers.js:105-118` | Possible |
| `findByEmail`/`findById` always select `password` | `UserRepository.js:16-25,112-121` | Confirmed |

---

## 4. Sessions & Cookies

| Finding | Evidence | Severity |
|---|---|---|
| `httpOnly`, `secure` in prod, rolling, 30-day, `unset:"destroy"` (good) | `sessionMiddleware.js:25-30` | — |
| Production `sameSite:"none"` removes default CSRF defense | `sessionMiddleware.js:28` | Confirmed |
| Sessions not invalidated on password change/reset | `userControllers.js:284-314` | Confirmed |
| `SessionService.validate` trusts session snapshot; no status/role recheck | `SessionService.js:27-34` | Confirmed |
| Weak `SESSION_SECRET` (8 chars in local `.env`), no validation | `Env.js:11` | Confirmed |
| `COOKIE_NAME` has no default | `Env.js:12` | Possible |

---

## 5. Authorization / IDOR / BOLA

| Finding | Evidence | Severity |
|---|---|---|
| `POST /options` lacks `authorize` + ownership → any learner creates quiz options | `answerRoute.js:15-17`, `answerControllers.js:9-27` | Confirmed |
| `PATCH/DELETE /options/:id` lack ownership → instructors edit others' answers | `answerRoute.js:18-21`, `answerControllers.js:31-64` | Confirmed |
| `GET /courses/:id/dashboard-details` role-only, no ownership | `courseRoute.js:63-68`, `courseControllers.js:332-361` | Confirmed |
| Enrollment bypasses subscription/publish checks | `enrollmentControllers.js:12-49` | Confirmed |
| Lesson completion without enrollment (XP farming) | `lessonCompletionControllers.js:11-37` | Confirmed |
| Review creation without enrollment | `ReviewControllers.js:53-73` | Confirmed |
| Progress update doesn't verify lesson belongs to course | `learningProgressControllers.js:47-78` | Confirmed |
| Public certificate lookup returns holder/course names by UUID | `certificateRoute.js:23`, `certificateControllers.js:101-113` | Low |
| Ownership checks exist correctly on course/module/chapter/lesson/content/objective/question mutations | `courseControllers.js:123,161`; `moduleControllers.js:19,67,99`; etc. | — |
| Identity-scoped endpoints correctly use `req.session.user.id` | enrollment/progress/completion/certificate/review controllers | — |

---

## 6. Input Validation

Validators exist for users, courses/objectives/progress, modules, chapters, lessons/contents, categories, questions/answers, reviews. Gaps (Confirmed):

| Endpoint | Route evidence |
|---|---|
| `PATCH /options/:id`, `DELETE /options/:id` | `answerRoute.js:18-21` |
| `POST /courses/:id/enrollments` | `enrollmentRoute.js:10-13` |
| `POST /courses/:id/progresses` | `learningProgressRoute.js:13-16` |
| `POST /lessons/:id/completions` | `lessonCompletionRoute.js:9-12` |
| `GET /courses/:id/lesson-completions` | `courseRoute.js:82` |
| `POST /courses/:id/certificates` | `certificateRoute.js:14-17` |
| `POST /users/payment-stripe/:subscriptionId` | `userRoute.js:91-95` |
| All admin users/subscriptions writes | `adminUserRoute.js:16-17`, `adminSubscriptionRoute.js:25-40` |

Other validation weaknesses:
- `textValidator` does not escape/sanitize free text → stored-XSS risk if rendered as HTML (`common.validator.js:50-68`).
- `dateValidator` has `isISO8601` commented out (`common.validator.js:221-223`).
- `rating` uses `floatValidator` while the DB column is INTEGER (`common.validator.js:124-137`, `schema.sql:368`).
- `validateResult` returns only the first error (`validateResult.js:8`).

---

## 7. Error Handling & Logging

| Finding | Evidence | Severity |
|---|---|---|
| `errorHandler` never logs → 500s invisible server-side | `errorHandler.js:29-70` | Confirmed |
| No prod access log (morgan dev only) | `app.js:53-56` | Confirmed |
| No process-level handlers / graceful shutdown | `server.js:6-21` | Confirmed |
| PG codes mapped `23505→409`, `23503/23502/22P02→400` (good) | `errorHandler.js:33-59` | — |
| `getInstructor` may return `undefined`; controllers dereference → possible TypeError 500 | `moduleControllers.js:66-67`, etc. | Possible |
| Scattered `console.*`, no levels/request-ids | `database.js:12,16`; `EmailService.js:30,33`; `webhookRoute.js:73,80`; `userControllers.js:43,157` | Confirmed |

---

## 8. Data Access & SQL

### 8.1 Parameterization
All repository queries use placeholders (`$1`, `$2`). No string concatenation of user values was found. `AdvancedQuery` uses whitelists for `filter`, `search`, `sort`, and coerces pagination numbers (`AdvaceQuery.js:34-176`). **Latent risk:** `limitFields()` joins raw field names without a whitelist and is never called (`AdvaceQuery.js:131-139`). **Possible/Low.**

### 8.2 Duplicated SQL
- Duration/lesson-count aggregate subquery repeated ~8× in `CourseRepository.js` (see `codebase-audit.md` §3.3).
- `getInstructor` ownership SQL duplicated across 5 repositories.

### 8.3 Missing pagination / unbounded results (Confirmed)
| Method | Evidence |
|---|---|
| `CategoryRepository.findAll` | `CategoryRepository.js:4-10` |
| `UserRepository.getInstructors` (`SELECT *`, all instructors) | `UserRepository.js:149-157` |
| `SubscriptionRepository.findAllPlans` | `SubscriptionRepository.js:81-86` |
| `SubscriptionRepository.findAllUserSubscriptions` | `SubscriptionRepository.js:117-126` |
| `SubscriptionRepository.findAllPayments` | `SubscriptionRepository.js:166-176` |
| `CertificateRepository.findByUser` | `CertificateRepository.js:22-32` |
| `LessonRepository.getQuestions` | `LessonRepository.js:120-141` |

### 8.4 Missing indexes (Confirmed, `schema.sql`)
- `courses`: no index on `category_id`, `instructor_id`, `status`, `deleted_at`, `created_at`.
- `lesson_completion`: only `user_id` and `lesson_id`; `getCourseCompletions` filters `(course_id,user_id)` — no matching index.
- `password_reset_codes`: no index on `user_id`.
- No trigram index for the `ILIKE '%term%'` course search.

### 8.5 Soft delete ignored (Confirmed)
`courses.deleted_at` exists but is referenced in only 6 places; most reads omit `deleted_at IS NULL`, and `CourseRepository.delete` performs a hard `DELETE` (`CourseRepository.js:82-90`). Soft-deleted courses can leak into listings/dashboards; the column is effectively dead.

### 8.6 `SELECT *` over-fetch (Confirmed)
Pervasive, including `UserRepository.findByEmail`/`findById` selecting `password`, and `UserRepository.updateById` `RETURNING *` (`UserRepository.js:16-25,112-121,191-200`).

### 8.7 Schema drift (Confirmed)
`lesson_contents` vs `lesson_content`; missing `lessons.access_type`; `quizzes.lesson_id UNIQUE`; reset-code column width. See `codebase-audit.md` §3.1.

---

## 9. Transactions

**No transaction usage exists.** `database.js` exposes only a `Pool`; no client checkout or `withTransaction` helper. Multi-step writes that are not transactional:

| # | Operation | Evidence | Writes |
|---|---|---|---|
| 1 | Register | `userControllers.js:32-39` | users + user_profiles |
| 2 | Admin create user | `adminUserControllers.js:42-60` | users + update + profile |
| 3 | Enroll | `enrollmentControllers.js:32-41` | enrollments + learn_progress |
| 4 | Stripe webhook | `webhookRoute.js:47-61` | user_subscriptions + payment |
| 5 | Reset password | `userControllers.js:286-288` | users + delete codes |
| 6 | Helpful vote | `ReviewControllers.js:106-131` | read-then-write, racy |
| 7 | Stripe session expire-before-pay | `userControllers.js:363` | expires all subs pre-payment |

---

## 10. Rate Limiting

| Limiter | Config | Applied | Finding |
|---|---|---|---|
| `globalLimiter` | 100/min | `app.js:57` | — |
| `passwordResetLimiter` | 10/12h | `userRoute.js:69` | — |
| `codeAttemptsLimiter` | 10/h | `userRoute.js:77,85` | — |
| `loginLimiter` | 5/15min | **Never** | Confirmed brute-force gap (`rateLimitMiddlewares.js:19-23`) |

No per-account lockout. IP limits depend on `trust proxy` correctness.

---

## 11. Configuration & Environment

| Finding | Evidence | Severity |
|---|---|---|
| No env validation; missing vars fail late/undefined | `Env.js:5-26` | Confirmed |
| `CLIENT_URL_1`/`CLIENT_URL_2` naming opaque; certificate links use `CLIENT_URL_1` | `Env.js:14-15`, `certificateControllers.js:52,55` | Confirmed |
| No `.env.example` | repo | Confirmed |
| Hardcoded default avatar in two controllers | `userControllers.js:30`, `adminUserControllers.js:40` | Confirmed |
| `connectCloudinary()` async but config is sync and unawaited | `app.js:33`, `cloudinary.js:3-9` | Possible |
| `.env` untracked (good); local `SESSION_SECRET` weak | `.gitignore`, `.env` | Confirmed |

---

## 12. API Trace Matrix

Detailed traces for the highest-risk endpoints; a summary table follows.

### 12.1 `POST /api/v1/users/register`
- Route: `userRoute.js:39` → `validateRegister` → `validateResult` → `register`
- Controller: `userControllers.js:21-51`
- Repo/SQL: `User.findByEmail` (`UserRepository.js:16-25`), `User.create` (`:4-14`), `User.createProfile` (`:40-49`)
- Other: `HashService.hash`, `SessionService.create`, `EmailService.sendWelcome` (fire-and-forget)
- Response: envelope, `data` = user (no password)
- Consumer: `frontend/src/api/auth.js:5` → `hooks/mutations/useAuthMutations.js:11-16` → `Signup.jsx:39`
- Problems: **no transaction** (orphan user if profile insert fails); check-then-insert race; hardcoded avatar; no dedicated limiter; frontend Zod allows 1-char name vs backend min 3.

### 12.2 `POST /api/v1/users/login`
- Route: `userRoute.js:41` → `validateLogin` → `validateResult` → `login`
- Controller: `userControllers.js:55-79`
- Repo: `User.findByEmail`, `User.updateLastLogin` (`UserRepository.js:122-129`)
- Consumer: `frontend/src/api/auth.js:4`, admin `AuthApi.js:5-20`
- Problems: **`loginLimiter` unused**; **no status check**; 3 sequential DB round-trips; timing oracle; `findByEmail` selects password on all paths.

### 12.3 `POST /api/v1/users/logout`
- Route: `userRoute.js:43` → `requireAuth` → `logout` (`userControllers.js:83-100`)
- Repo: `User.findById` — **only to null-check** (`UserRepository.js:112-121`)
- Problem: unnecessary DB call (session already validated); session destroy + `clearCookie` correct.

### 12.4 `GET /api/v1/users/me`
- Route: `userRoute.js:45` — **no `requireAuth`**
- Controller: `userControllers.js:105-118`; repo `User.findById` (selects password, deleted in JS)
- Consumer: `frontend/src/api/users.js:4` → `hooks/queries/useAuth.js:13-33` → `AuthContext.jsx`; admin `UserApi.js:6-19`
- Problems: public route returns role/status when a session exists; selects password; returns `200 null` instead of 401; dead `usersApi.updateMe` → `PATCH /users/me` has no backend route (`frontend/src/api/users.js:7`).

### 12.5 `PATCH /api/v1/users/profile`
- Route: `userRoute.js:50-57` → `requireAuth` → `upload.single` → validators → `updateProfile`
- Controller: `userControllers.js:138-189`; repos `findById`, `update` (`:27-38`), `profile` (`:76-100`), `updateProfile` (`:51-74`)
- Problems: 3 DB calls + Cloudinary + fs, **no transaction**; `||` fallbacks prevent clearing fields; `RETURNING *` leaks profile internals; multer runs before validators (orphan files).

### 12.6 Password reset trio
- Routes: `userRoute.js:67-89` with `passwordResetLimiter`/`codeAttemptsLimiter`
- Controllers: `userControllers.js:194-296`; repo `PasswordResetCodeRepository` (`:4-51`)
- Problems: **`VARCHAR(6)` vs 64-char hash → broken**; enumeration 404s; `incrementAttempt` updates all rows and increments before validation; verify/reset duplicate ~30 lines; **no session invalidation**; reset uses `codeAttemptsLimiter` (can lock out legit retries); no transaction.

### 12.7 `POST /api/v1/users/payment-stripe/:subscriptionId`
- Route: `userRoute.js:91-95` → `requireAuth` → `createStripeSession` (**no validator**)
- Controller: `userControllers.js:342-393`; repos `Subscription.findById` (`:4-10`), `getActivePaidSubscription` (`:32-68`), `setUserSubscriptionStatusToExpired` (`:70-79`)
- Problems: **expires all subscriptions before payment completes**; `origin` header used for redirect URLs (open redirect); no UUID validation; hardcoded card/USD; Stripe errors → generic 500.

### 12.8 `GET /api/v1/courses`
- Route: `courseRoute.js:41-43` → `getAllCourses` (public)
- Controller: `courseControllers.js:55-66`; repo `CourseRepository.getAllCourses` (`:99-171`) + `AdvancedQuery.paginate` (`AdvaceQuery.js:144-176`)
- Consumer: `frontend/src/api/courses.js:4` → `hooks/queries/useCourses.js:8-15`
- Problems: **2 queries/request** (count re-runs aggregate base); alias filters (`rating`/`duration`) placed in `WHERE` → **500** if used (`AdvaceQuery.js:74`); no `deleted_at`; uncapped `limit`; `SELECT c.*` leaks internal columns; echoes `query` in body.

### 12.9 `GET /api/v1/courses/:id`
- Route: `courseRoute.js:70-72` → `getCourseDetails` (`courseControllers.js:179-191`)
- Repo: `Course.findById` **then** `getCourseDetailsById` (`CourseRepository.js:191-235`) — redundant first query; no `deleted_at`; `SELECT *`.

### 12.10 `GET /api/v1/courses/:id/learn`
- Route: `courseRoute.js:81` → `getCourseLearningData` (public, optional session)
- Controller: `courseControllers.js:195-227`; repo `Course.getLearningData` (`CourseRepository.js:236-307`, 3 CTEs + `json_agg`)
- Problems: **queries nonexistent `l.access_type` → errors**; gating is cosmetic (full payload returned regardless); unbounded nested data.

### 12.11 `GET /api/v1/courses/:id/dashboard-details`
- Route: `courseRoute.js:63-68` → `requireAuth` → `authorize(ADMIN, INSTRUCTOR)` → `getCourseDetailsDashboard`
- Controller: `courseControllers.js:332-361` — **8 sequential queries**
- Repos: `Course.findById`, `CourseObjective.getObjectivesByCourseId`, `Module.getModulesByCourseId`, `Chapter.getChaptersByCourseId`, `Lesson.getLessonsByCourseId`, `LessonContent.getLessonContentsByCourseId`, `Question.getQuestionsByCourseId`, `Answer.getOptionsByCourseId`
- Consumer: `admin/src/services/CourseApi.js:64-77` → `hooks/course/use-get-course-details.js:10` → `CourseDetailPage.jsx:21`
- Problems: 8 round-trips; **no ownership check**; unbounded; `lesson_contents` typo → errors.

### 12.12 `POST /api/v1/courses/:id/enrollments`
- Route: `enrollmentRoute.js:12` → `requireAuth` → `enrollCourse` (**no validator**)
- Controller: `enrollmentControllers.js:12-49` — **5 sequential calls**
- Problems: **no transaction** (enrollment without progress on failure); no PUBLISHED/`deleted_at`/subscription check; `getFirstLesson` may point at a draft.

### 12.13 `PATCH /api/v1/courses/:id/progresses`
- Route: `learningProgressRoute.js:17-22` → `requireAuth` + validator
- Controller: `learningProgressControllers.js:47-78`
- Problems: **doesn't verify lesson belongs to course**; check-then-create/update race; redundant `Course.findById`; 201 vs 200 inconsistency.

### 12.14 `POST /api/v1/lessons/:id/completions`
- Route: `lessonCompletionRoute.js:11` → `requireAuth` (**no validator**)
- Controller: `lessonCompletionControllers.js:11-37` — 3 sequential queries
- Problems: no enrollment check; XP/time copied from lesson definition; duplicate → 409; frontend fires completion + progress as two requests (`NextPrevious.jsx:24-25`).

### 12.15 Reviews
- `GET /courses/:id/reviews`: `reviewRoute.js:20-22` → `ReviewControllers.js:12-31` → `ReviewRepository.js:5-57` + `AdvancedQuery` (`startIndex:2`). Redundant `Course.findById`; 2 queries/page; `helpful_count` unused.
- `POST /courses/:id/reviews`: `reviewRoute.js:23` → validator → `ReviewControllers.js:53-73`. **No enrollment check**; duplicate → 409; input `description` stored as `review`; `rating` float vs INTEGER.
- `GET /reviews/summary`: `ReviewControllers.js:36-48` → `ReviewRepository.js:58-76`. Redundant existence query; half-star buckets for integer ratings.
- `POST /reviews/:id/helpful-votes`: `ReviewControllers.js:94-138` — 4–5 queries; racy; `helpful_count` never updated; response omits `data`.
- `POST /reviews/:id/reports`: `ReviewControllers.js:143-176` — 4 queries; free-text reason.

### 12.16 `GET /api/v1/subscriptions/user-active`
- Route: `subscriptionRoute.js:9` → `requireAuth` → `getUserActiveSubscriptions`
- Repo: `SubscriptionRepository.getActivePaidSubscription` (`:32-68`) — 3-table JOIN, `LIMIT 1`
- Consumer: `frontend/src/api/subscriptions.js:5` → `hooks/queries/useSubscriptions.js:5-12`
- Problems: inner JOIN on payments hides ACTIVE subs without a COMPLETED payment (e.g. admin-created); over-fetches wide row; query duplicated in payment/learn flows.

### 12.17 Admin users
- `GET /admin/users`: `adminUserControllers.js:7-21`; `User.findAll`/`findAllCount` (`UserRepository.js:159-189`). **No `pagination` envelope**; `limit` unclamped (`NaN` → SQL error); no status filter.
- `POST /admin/users`: `adminUserControllers.js:23-67` — 4–5 sequential calls; **hardcoded `TempPassword123!`**; create+update returns stale role/status; no validator; no transaction.
- `PATCH/DELETE /admin/users/:id`: `adminUserControllers.js:69-104` — existence+write; no validators; hard delete cascades.

### 12.18 Admin subscriptions
- Plans/user-subscriptions/payments GET: `adminSubscriptionControllers.js:7-15,76-84,145-153`; repos **unbounded** (`SubscriptionRepository.js:81-86,117-126,166-176`).
- **`PATCH user-subscriptions/:id`** and **`PATCH payments/:id`**: load the **entire table** then `.find()` in JS (`adminSubscriptionControllers.js:108-131,184-206`) — severe anti-pattern.
- No validators; no pagination; deletes don't 404.

### 12.19 `POST /api/v1/stripe-webhook`
- Route: `webhookRoute.js:12-15`; mounted `app.js:46`; `express.raw`.
- Handler inline (`webhookRoute.js:15-84`): verify signature → 4 sequential writes → email.
- Problems: **no idempotency** (retries duplicate/500-loop); **no transaction** (subscription without payment); **amount unit bug** (stores dollars `webhookRoute.js:59`, email divides by 100 `EmailService.js:42`); ignores refunds/failures; business logic + SQL + email inline (violates layering).

### 12.20 Trace Summary (remaining endpoints)

| Endpoint | Controller → Repo | Key issue |
|---|---|---|
| `GET /categories` | `categoryControllers.js` → `CategoryRepository.findAll` | unbounded |
| `POST/PATCH/DELETE /categories` | `categoryControllers.js` | admin-guarded, OK |
| `GET /courses/recently-viewed` | `courseControllers.js:234` → `CourseRepository.getRecentlyViewed` | redundant user lookup; no `deleted_at` |
| `GET /courses/recommended` | `:252` → `getRecommended` | heavy correlated subqueries |
| `GET /courses/popular` | `:266` → `getPopular` | counts completions not enrollments; full aggregate |
| `GET /courses/in-progress` / `completed` | `:284,302` → count+data aggregate | two heavy passes; redundant user lookup |
| `GET /courses/dashboard` | `:318` → `getAllCoursesDashboard` | count re-runs aggregate |
| `GET /users/dashboard-data` | `adminControllers.js:10-45` → 6 queries | leaks password hashes; unbounded instructors |
| `GET /xp-earned` | `userControllers.js:326` → `CourseRepository.getXpEarning` | redundant user lookup; otherwise OK |
| `GET /certificates/mine` | `certificateControllers.js:86` → `CertificateRepository.findByUser` | unbounded |

---

## 13. Performance Findings

Format: location · current behavior · why slow · severity · evidence · improvement · impact · risk.

### PERF-1 — `getAllCourses` double aggregate + count re-run
- **Location:** `CourseRepository.js:99-171`; `AdvaceQuery.js:144-176`
- **Current behavior:** page query joins two aggregate subqueries; `paginate()` runs a separate `COUNT(*)` over the same aggregate base.
- **Why slow:** aggregates computed for all courses twice per request; `%term%` search unindexed.
- **Severity:** Confirmed (shape) / Likely (impact)
- **Evidence:** `:103-123` (subqueries), `AdvaceQuery.js:154-160` (count).
- **Improvement:** pre-aggregate stats into a view/summary table; count with a simple filtered `COUNT(*)` when filters don't touch joined columns; add `pg_trgm` GIN.
- **Impact:** large latency reduction on the primary public endpoint.
- **Risk:** Medium (cache invalidation).

### PERF-2 — `getCourseDetailsDashboard` 8 sequential queries
- **Location:** `courseControllers.js:332-361`
- **Current behavior:** 8 serial awaits, each re-joining the content chain.
- **Why slow:** O(round-trips × course size), unbounded payload.
- **Severity:** Confirmed
- **Evidence:** `:338-345`.
- **Improvement:** single `json_agg` CTE (pattern in `getLearningData`), `Promise.all` where independent, paginate children.
- **Impact:** 8 RTT → 1–2.
- **Risk:** Medium (admin UI shape).

### PERF-3 — Popular/recommended/in-progress/completed aggregates
- **Location:** `CourseRepository.js:363-663`
- **Current behavior:** full `GROUP BY` over `lesson_completion`/`course_reviews`; in-progress/completed run count+data aggregate passes.
- **Why slow:** large scans, no selective indexes, two passes.
- **Severity:** Confirmed (shape) / Likely (impact)
- **Evidence:** `:401-432,363-400,487-663`.
- **Improvement:** summary tables/materialized views; fix `getPopular` to use `enrollments`; add composite indexes.
- **Impact:** dashboard/landing latency.
- **Risk:** Medium.

### PERF-4 — Missing indexes
- **Location:** `schema.sql`
- **Current behavior:** no indexes on `courses(category_id,instructor_id,status,deleted_at)`, `lesson_completion(user_id,course_id)`, `password_reset_codes(user_id)`; no trigram.
- **Severity:** Confirmed
- **Evidence:** `schema.sql` index list.
- **Improvement:** add indexes; verify with `EXPLAIN`.
- **Impact:** read-path gains; low risk.

### PERF-5 — Admin load-all-then-find
- **Location:** `adminSubscriptionControllers.js:108-131,184-206`
- **Current behavior:** loads entire table, `.find()` in JS to update one row.
- **Severity:** Confirmed
- **Evidence:** `:111-112,187-188`.
- **Improvement:** `findById` repository methods.
- **Impact:** O(n) → O(1); low risk.

### PERF-6 — Redundant existence queries
- **Location:** `getCourseDetails` (two queries), review/list/summary, logout, helpful vote, reports, progress, etc.
- **Severity:** Confirmed
- **Improvement:** fold existence into the main query; trust session.
- **Impact:** fewer round-trips; low risk.

---

## 14. Security Findings

Areas audited with severity and evidence:

| Area | Finding | Evidence | Severity |
|---|---|---|---|
| Authentication | No status check on login | `userControllers.js:55-79` | High |
| Authentication | Timing oracle / enumeration | `userControllers.js:57-65,24-26,197-199` | Medium |
| Authorization | Options POST/PATCH/DELETE lack role+ownership | `answerRoute.js:15-21` | High |
| Authorization | Dashboard-details no ownership | `courseRoute.js:63-68` | Medium |
| Sessions | `sameSite:"none"` + no CSRF | `sessionMiddleware.js:28` | High |
| Sessions | No invalidation on password change/reset; suspended users persist | `userControllers.js:284-314`, `SessionService.js:27-34` | Medium |
| CSRF | No token; urlencoded simple requests not preflighted | `app.js:49-50` | High |
| CORS | Explicit allowlist (good); `undefined` if unset | `app.js:42` | Low |
| Validation | Missing validators (see §6); text not escaped | multiple | Medium |
| Output handling | `is_correct` exposed publicly | `LessonRepository.js:129` | Critical |
| Output handling | Password hashes returned (dashboard, admin update) | `UserRepository.js:149-157,191-200` | High |
| Rate limiting | `loginLimiter` unused; no lockout | `rateLimitMiddlewares.js:19-23` | High |
| Password handling | `Math.random` code, unsalted SHA-256, `VARCHAR(6)` | `HashCode.js`, `createRadomCode.js`, `schema.sql:80` | High |
| Sensitive exposure | `/users/me` public role/status; certificate PII | `userControllers.js:105`, `certificateRoute.js:23` | Low |
| Headers | No helmet/HSTS/CSP/nosniff | `app.js` | Medium |
| Uploads | MIME/extension only; static `/uploads`; committed file | `multer.js:17-28`, `app.js:61` | Low/Medium |
| SQL | Parameterized (good); `limitFields` latent | `AdvaceQuery.js:131-139` | Low |
| Error responses | Stack only in dev (good); reflected `originalUrl` | `errorHandler.js:60-68`, `notFoundUrl.js:5` | Low |
| Logging | No sensitive data logged (good); no structured logging | `console.*` | Low |
| Secrets | `.env` untracked (good); weak secret; no env validation | `Env.js`, `.env` | High/Medium |
| Enumeration | Register/reset reveal existence | `userControllers.js:24-26,197-199` | Medium |
| IDOR/BOLA | Enrollment/completion/review bypass; options; progress cross-course | multiple | High |
| Stripe | No idempotency/replay; `Origin` redirect; amount unit | `webhookRoute.js`, `userControllers.js:380-381` | Medium |

**Positive controls:** bcrypt 12; session regeneration; parameterized SQL; ownership checks on most content mutations; admin routers globally gated; webhook signature verification; dev-only stacks; `.env` untracked.

---

## 15. Duplicated Logic & Dead Code

- Ownership check duplicated ~18×; response object ~90×; duration subquery ~8×; `getInstructor` SQL 5×.
- Dead: `getCoursesByCategoryId`/`getCoursesByInstructorId` (`courseControllers.js:70-103`) + repo methods; `loginLimiter`; unused repo methods (`AnswerRepository.getAnswers`, `CategoryRepository.findBySlug`, `ChapterRepository.findByModuleId`, `LessonRepository.findByChapterId`, `AdvancedQuery.limitFields`); unused deps `nodemailer`, `resend`; dead columns `helpful_count`, `confirm`.
- Inconsistent session user access (`req.user` set but never read; controllers use `req.session.user`).

---

## 16. Recommended Backend Sequencing

1. Webhook integrity + `withTransaction` helper.
2. Transactions for register/enroll/admin-user/reset.
3. Security: options authorization, validators, password-hash exposure, status check, `loginLimiter`, `is_correct`, reset-code fix.
4. Indexes, then rewrite `getAllCourses`/popular/recommended/in-progress/completed and consolidate dashboard-details.
5. Soft-delete decision + consistency.
6. Response helper, dead-code removal, dependency cleanup.
7. Structured logging + error logging.

See `codebase-audit.md` §5 for the full phased roadmap.

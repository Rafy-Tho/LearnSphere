# Codebase Audit — Executive Summary

**Project:** Learning Online Platform (PERN)
**Audit type:** Read-only static audit of the full monorepo (`backend/`, `frontend/`, `admin/`)
**Method:** Code inspection with `file:line` evidence. No code executed against a running server. Findings are classified as **Confirmed** (directly observed), **Likely** (code path confirmed, impact depends on runtime/data), or **Possible** (needs measurement).
**Related deep dives:** [`backend-audit.md`](./backend-audit.md), [`frontend-audit.md`](./frontend-audit.md)

> This document is a findings register and roadmap. It does not implement anything. Implementation begins only after the refactoring plan is approved.

---

## 1. Scope & Snapshot

| App | Path | Notes |
|---|---|---|
| Backend API | `backend/` | Node 22 ESM, Express 5, `pg` raw SQL, express-session, Stripe, Cloudinary, Brevo |
| Learner frontend | `frontend/` | React 19, Vite 7, React Router 7, TanStack Query 5, Tailwind 4 |
| Admin dashboard | `admin/` | React 19, Vite 7, TanStack Query 5, Tailwind 3, shadcn/Radix |

- No tests, no migrations, no CI.
- Database schema: `backend/src/configs/schema.sql` (22 tables, 9 enums).
- Auth: cookie session (`express-session` + `connect-pg-simple`).

---

## 2. Severity Model

| Class | Meaning |
|---|---|
| **Confirmed** | Directly visible in code; not dependent on runtime conditions. |
| **Likely** | Code path is present; impact depends on data volume, configuration, or usage. |
| **Possible** | Plausible; requires measurement/profiling to confirm. |

Each finding in the deep-dive docs includes: location, current behavior, why it is a problem, severity, evidence, recommended improvement, expected impact, and risk of change.

---

## 3. Cross-Cutting Findings

### 3.1 Schema drift already breaks features (Confirmed)
The committed `schema.sql` and the repository SQL disagree, so several endpoints cannot work as written:

| # | Drift | Evidence | Impact |
|---|---|---|---|
| D1 | `LessonContentRepository` queries `lesson_contents`; table is `lesson_content` | `LessonContentRepository.js:5,20,33,40,47,56,72` vs `schema.sql:219` | Admin course detail / content endpoints 500 |
| D2 | `lessons.access_type` referenced but column absent | `CourseRepository.js:249`, `courseControllers.js:213` vs `schema.sql:196-209` | `GET /courses/:id/learn` errors; lesson gating cosmetic |
| D3 | `password_reset_codes.code VARCHAR(6)` stores 64-char SHA-256 | `schema.sql:80`, `userControllers.js:207` | Password reset insert fails |
| D4 | `quizzes.lesson_id UNIQUE` blocks many questions per lesson | `schema.sql:240` vs `QuestionRepository.js:4-18` | Second question insert violates constraint |

> Either the live database has been altered out-of-band, or these flows are currently broken. This must be resolved before relying on the affected features.

### 3.2 No transaction infrastructure (Confirmed)
There is no `BEGIN`/`COMMIT`/`ROLLBACK` and no client checkout helper anywhere in application code. Every multi-step write can partially commit. Highest-risk cases: register, enroll, admin create user, reset password, Stripe webhook.

### 3.3 Duplicated logic (Confirmed)
- The course duration/lesson-count aggregate subquery is copy-pasted ~8× in `CourseRepository.js` (`:103-113`, `:209-218`, `:277-288`, `:341-348`, `:372-380`, `:413-421`, `:446-454`, `:507-516`, `:543-545`, `:590-592`, `:626-628`).
- The `getInstructor` ownership query is duplicated across 5 repositories (`ModuleRepository.js:55-63`, `ChapterRepository.js:49-58`, `LessonRepository.js:155-165`, `LessonContentRepository.js:66-77`, `QuestionRepository.js:64-75`).
- The `{ success, statusCode, message, data }` response object is hand-written ~90×.
- The ownership check `instructor_id !== user && role !== ADMIN` is repeated ~18× across controllers.

### 3.4 Dead code (Confirmed)
- Unmounted controllers: `getCoursesByCategoryId`/`getCoursesByInstructorId` (`courseControllers.js:70-103`) and their repository methods.
- Unused middleware: `loginLimiter` (`rateLimitMiddlewares.js:19-23`) — and `/login` has no limiter.
- Unused deps: `nodemailer`, `resend` (backend); `@react-oauth/google` (frontend); `recharts` imported by an unused admin file but not declared.
- ~32 dead frontend/admin files (see `frontend-audit.md`).

### 3.5 Response-contract inconsistencies (Confirmed)
- `status` instead of `statusCode` (`courseObjectiveControllers.js:31-124`).
- Admin lists return `{ data: { users, total } }` / raw arrays without `pagination` (`adminUserControllers.js:15-20`, `adminSubscriptionControllers.js`).
- `GET /courses` echoes `query: req.query` (`courseControllers.js:64`).
- Helpful-vote response omits `data` (`ReviewControllers.js:133-137`).
- `GET /users/me` returns `200 null` instead of `401` when unauthenticated (`userControllers.js:105-117`).
- Update/delete return `201` "created" (`answerControllers.js:43-64`).

### 3.6 Observability is near-zero in production (Confirmed)
- `errorHandler` never logs (`errorHandler.js:29-70`).
- Morgan access logging only in development (`app.js:53-56`).
- No `unhandledRejection`/`uncaughtException`/`SIGTERM` handling (`server.js`).

---

## 4. Prioritized Findings Register

### P0 — Critical security / data-integrity

| ID | Finding | Evidence | Severity |
|---|---|---|---|
| P0-1 | Public quiz endpoint exposes `is_correct` answer key + explanations | `LessonRepository.js:120-141`, `questionRoute.js:19` | Confirmed |
| P0-2 | Password reset broken & weak: `Math.random` 6-digit, unsalted SHA-256, `VARCHAR(6)` | `HashCode.js:3-5`, `createRadomCode.js:2-3`, `schema.sql:80` | Confirmed |
| P0-3 | Instructor dashboard returns bcrypt password hashes of all instructors | `UserRepository.js:149-157`, `adminControllers.js:29`, `userRoute.js:97-99` | Confirmed |
| P0-4 | Missing authorization/ownership on quiz options POST/PATCH/DELETE | `answerRoute.js:15-21`, `answerControllers.js:9-64` | Confirmed |
| P0-5 | Stripe webhook: no idempotency, no transaction, expires subscriptions pre-payment, amount unit bug | `webhookRoute.js:31-83`, `userControllers.js:363`, `EmailService.js:42` | Confirmed |
| P0-6 | Subscription/enrollment bypass; lesson completion & review without enrollment | `enrollmentControllers.js:12-49`, `lessonCompletionControllers.js:11-37`, `ReviewControllers.js:53-73` | Confirmed |
| P0-7 | No session invalidation on password change/reset; no status check (suspended users keep access) | `SessionService.js:27-34`, `userControllers.js:284-314` | Confirmed |
| P0-8 | Multi-step writes not transactional (register, enroll, admin create user, reset) | `userControllers.js:32-39`, `enrollmentControllers.js:32-41`, `adminUserControllers.js:42-60` | Confirmed |
| P0-9 | Password hashes returned by admin user update/create; hardcoded temp password | `UserRepository.js:191-200`, `adminUserControllers.js:39` | Confirmed |
| P0-10 | Missing validators on many write endpoints | options, enrollment, completions, payment, all admin routes | Confirmed |
| P0-11 | Account enumeration (register 400 vs 409, reset 404) + login timing oracle | `userControllers.js:24-26,197-199,57-65` | Confirmed |
| P0-12 | `loginLimiter` unused; no brute-force/account lockout | `rateLimitMiddlewares.js:19-23`, `userRoute.js:41` | Confirmed |
| P0-13 | No CSRF protection + production `sameSite:"none"`; no security headers | `sessionMiddleware.js:28`, `app.js` (no helmet) | Confirmed |
| P0-14 | Weak `SESSION_SECRET`, no env validation, `Origin`-header open redirect in Stripe session | `Env.js:5-26`, `userControllers.js:345,380-381` | Confirmed |
| P0-15 | Schema drift breaks learn/content/reset flows (D1–D4 above) | see §3.1 | Confirmed |

### P1 — High-impact architectural / performance

| ID | Finding | Evidence | Severity |
|---|---|---|---|
| P1-1 | `getCourseDetailsDashboard`: 8 sequential queries, no ownership check, unbounded | `courseControllers.js:332-361` | Confirmed/Likely |
| P1-2 | `getAllCourses`: count re-runs aggregate base; alias filters in `WHERE` → 500; no `deleted_at`; uncapped `limit` | `CourseRepository.js:99-171`, `AdvaceQuery.js:74,154-160` | Confirmed/Likely |
| P1-3 | Heavy aggregates: `getPopular` (counts completions, not enrollments), `getRecommended`, `getCourseInProgress`/`getCompletedCourses` | `CourseRepository.js:363-663` | Confirmed/Likely |
| P1-4 | Duplicated duration subquery (8×) and ownership SQL (5×) | `CourseRepository.js`, 5 repositories | Confirmed |
| P1-5 | Missing indexes: `courses(category_id/instructor_id/status/deleted_at)`, `lesson_completion(user_id,course_id)`, `password_reset_codes(user_id)`, trigram search | `schema.sql` | Confirmed |
| P1-6 | Admin `PATCH user-subscriptions`/`payments` load entire tables then `.find()` in JS | `adminSubscriptionControllers.js:108-131,184-206` | Confirmed |
| P1-7 | Soft-delete ignored on most reads; `CourseRepository.delete` hard-deletes | `CourseRepository.js:82-90` + many | Confirmed |
| P1-8 | No `QueryClient` defaults → refetch-on-focus storms; missing `enabled` guards | `frontend/src/main.jsx:10`, `admin/src/App.jsx:22` | Confirmed |
| P1-9 | Response-contract inconsistencies (see §3.5) | multiple | Confirmed |
| P1-10 | No route-level code splitting; no request cancellation | `App.jsx` (both apps), all `fetch` calls | Confirmed |
| P1-11 | Frontend stale localStorage auth never cleared when server returns `data:null` | `AuthContext.jsx:31-35`, `useAuth.js:23` | Likely |
| P1-12 | `PaymentSuccess` crashes without `session_id`; subscription param mismatch | `PaymentSuccess.jsx:12`, `useSubscriptions.js:15-16` | Likely |

### P2 — Important maintainability

| ID | Finding | Evidence |
|---|---|---|
| P2-1 | Ownership-check and response-shaping duplication across ~90 handlers | controllers |
| P2-2 | Frontend hook shim tree duplicates `hooks/queries` + `hooks/mutations` | `frontend/src/hooks/course|auth|user|subscription` |
| P2-3 | Query-key bugs (`useMyReview`, `useSubscriptionDetails`, unused subscription hooks) | `useCourses.js:117-124`, `useSubscriptions.js:14-22` |
| P2-4 | `utils/*` byte-identical across frontend and admin (6 files) | both `src/utils` |
| P2-5 | Dead code: ~32 files + unused deps (`nodemailer`, `resend`, `@react-oauth/google`, 23 unused UI files) | see `frontend-audit.md` |
| P2-6 | Two incompatible API clients (frontend class vs admin per-service classes); admin lacks 401 handling | `frontend/src/api/client.js`, `admin/src/services/*` |
| P2-7 | Admin forms all manual vs frontend RHF+zod; RHF/form deps dead in admin | admin pages, `components/ui/form.jsx` |
| P2-8 | No logging in `errorHandler`; no structured logging/prod access logs | `errorHandler.js`, `app.js` |
| P2-9 | No tests, no TypeScript/JSDoc checking | all apps |
| P2-10 | Misnamed files/hooks (`useReviews.js` exports `useCategories`; option/question hook filenames) | frontend/admin hooks |
| P2-11 | Three sources of truth for auth; admin theme state fragmented | `AuthContext`, `ThemeContext`, `use-theme.js` |
| P2-12 | Missing loading/error/empty states (silent `null`, no empty messages) | `CertificationSection.jsx:8`, `PopularCourses.jsx:23` |

### P3 — Cleanup / refinement

| ID | Finding | Evidence |
|---|---|---|
| P3-1 | Folder/naming inconsistencies (`Siderbar.jsx`, `ThemSelector.jsx`, `LearningDashBoard/`, `libs/` vs `@/lib`) | frontend/admin |
| P3-2 | Dead assets: `frontend/src/assets/profile.jpg` (2 MB), Font Awesome CDN, `date-fns` for one helper | `frontend` |
| P3-3 | Leftover `console.log` in components | `LearningRoadMap.jsx:105`, `CourseRating.jsx:29` |
| P3-4 | `package.json` name collision (both `"frontend"`) | both apps |
| P3-5 | Comment/route drift; filename typo `AdvaceQuery.js` | backend |
| P3-6 | `AdvancedQuery.limitFields()` latent SQL injection if ever called | `AdvaceQuery.js:131-139` |
| P3-7 | Unused schema columns (`course_reviews.helpful_count`, `certificates.confirm`) | `schema.sql` |
| P3-8 | `@tanstack/react-query-devtools` shipped as prod dependency | both apps |

---

## 5. Refactor Roadmap (dependency-ordered)

Phases are ordered so each unblocks the next. Each phase should ship behind verification (lint + manual smoke), and payment/schema changes require extra care.

### Phase 0 — Safety net & decisions
- Decide hard vs soft delete for courses (drives many fixes).
- Decide whether to reconcile `schema.sql` with the live DB or add migrations.
- Add an `.env.example` and document required variables.
- Introduce a minimal structured logger and enable `errorHandler` logging (low-risk, high-value).

### Phase 1 — P0 security & data integrity
1. Strip `is_correct`/explanations from learner-facing quiz responses (P0-1).
2. Fix authorization/ownership on options; add validators to all unvalidated writes (P0-4, P0-10).
3. Stop returning password hashes; remove hardcoded temp password (P0-3, P0-9).
4. Fix password reset (secure random, salted/HMAC hash, schema width) (P0-2).
5. Add `withTransaction` and wrap multi-step writes (P0-8).
6. Webhook idempotency + transaction + `payment_status`/amount verification + fix email unit (P0-5).
7. Enforce subscription/enrollment on enroll, completion, review (P0-6).
8. Session invalidation on password change; status check on auth (P0-7).
9. Wire `loginLimiter`; add per-account throttling (P0-12).
10. CSRF strategy + `sameSite` decision; add `helmet` (P0-13).
11. Env validation; remove `Origin`-based redirects (P0-14).
12. Resolve schema drift (P0-15).

### Phase 2 — P1 performance & architecture
1. Add missing indexes (P1-5).
2. Consolidate `getCourseDetailsDashboard` to 1–2 aggregate queries + ownership check (P1-1).
3. Rewrite `getAllCourses` (single count strategy, fix alias filters, soft-delete, cap limit) (P1-2).
4. Rewrite/simplify `getPopular`/`getRecommended`/in-progress/completed; extract shared aggregate CTE (P1-3, P1-4).
5. Replace admin load-all-then-find with `findById` (P1-6).
6. Standardize response helper + pagination envelope (P1-9).
7. React Query defaults + `enabled` guards (P1-8); route code splitting (P1-10).
8. Fix stale auth and `PaymentSuccess` (P1-11, P1-12).

### Phase 3 — P2 maintainability
- Extract ownership/response helpers; remove hook shims; fix query keys; unify utils; remove dead code/deps; unify API clients; adopt RHF in admin or remove dead deps; add tests/typing incrementally.

### Phase 4 — P3 cleanup
- Naming, assets, deps, console logs, typos.

---

## 6. Risk & Rollback Notes

| Area | Risk of change | Mitigation |
|---|---|---|
| Payments / webhook | High | Test in Stripe test mode; keep old handler until verified; idempotent upserts |
| Schema changes | High | Backup first; no migrations exist — apply carefully; keep schema.sql authoritative |
| Auth/session | High | Coordinate with both frontends; test cross-site cookies |
| Query rewrites | Medium | Capture before/after `EXPLAIN`; verify response shape unchanged |
| Frontend refactors | Medium | Verify query-key/invalidation changes against UI |
| Dead-code removal | Low | Confirm zero references before deleting |

---

## 7. What This Audit Does Not Claim

- It does not claim any endpoint is slow without a stated mechanism; performance items are marked Confirmed (query shape) vs Likely (production impact) vs Possible (needs profiling).
- It does not assume the live database matches `schema.sql`; drift is flagged, not asserted as the only state.
- It does not propose framework/ORM/state-library changes.

---

## 8. Next Step

Await approval of the refactoring plan (phase scope and sequencing). On approval, implement Phase 0/1 first and re-audit the touched areas.

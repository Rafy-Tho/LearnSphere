# Progress

Single place to track what is done, what is in progress, and what is left. Keep each file short; append to it as work lands.

**Status legend:** ✅ Done · 🟡 In progress · ⬜ Not started

| Area | File | Status | Summary |
|---|---|---|---|
| Backend API | [`backend-progress.md`](./backend-progress.md) | 🟡 | Module structure, DB migrations, API/naming/security work done; a few module gaps left |
| Learner frontend | [`frontend-user.md`](./frontend-user.md) | ✅ | Feature architecture, UI primitives, performance, API/state, design tokens |
| Admin dashboard | [`frontend-admin.md`](./frontend-admin.md) | ✅ | Feature architecture, apiClient/query patterns, billing UI aligned with prepaid API |
| Instructor workspace | [`instructor-dashboard.md`](./instructor-dashboard.md) | 🟡 | Role-gated instructor area in the admin app: scoped dashboard, courses, students, analytics, reviews, certificates, earnings; course review workflow + payouts (schema in the CREATE-only baseline; live DB needs rebuilding) |

## How To Update

1. Update the status/summary row for the area you touched.
2. Move finished items from **Remaining** into **Done**.
3. Keep entries to one line. Link code paths, not plans.

## Key Decisions

| # | Decision | Chosen |
|---|---|---|
| D-01 | Course delete | Soft delete (`deleted_at`); reads filter it |
| D-02 | Lesson-content table | `lesson_contents` (plural) |
| D-03 | `lessons.access_type` | Added as `access_course_type` (DEFAULT `'FREE'`) |
| D-05 | Reset-code storage | HMAC-SHA256 keyed with `SESSION_SECRET`; 6-digit `crypto.randomInt` |
| D-06 | CSRF | JSON-only + `X-Requested-With` header |
| D-07 | Migrations | Plain SQL runner (`db/migrate.js`), no new deps |
| D-08 | `course_reviews.helpful_count` | Dropped; count derives from votes |
| D-15 | Quiz answer key | Server-side grading (`POST /lessons/:lessonId/quiz-submissions`) |
| D-16 | Registration | Generic success, no auto-login (no account enumeration) |
| D-23 | API response contract | Unwrapped `data` by default; `{ data, pagination }` for lists |
| D-24 | Query keys | Central factory (`frontend/src/lib/queryKeys.js`) |
| D-26 | Client state | Server-state-first; only theme + auth in context |
| D-27 | Design tokens | Tailwind v4 CSS-first `@theme` (`frontend/src/css/theme.css`) |
| D-28 | Primary accent | Blue + slate neutrals |
| D-29 | Dark mode | Full light/dark parity |
| D-31 | Design scope | Learner app only |
| D-32 | Google OAuth | Backend-driven authorization-code flow via `openid-client` (state/nonce/PKCE/ID-token); reuses existing session cookies, no JWT |
| D-33 | Provider email policy | Trust Google's verified email — sets `users.email_verified_at` and links/creates without a separate verification round |
| D-34 | Provider-only accounts | `users.password` nullable; password login rejected cleanly for provider-only users |
| D-35 | Quiz attempts | Deferred grading (answers hidden until submit); atomic submit persists a completed `quiz_attempts` row + `quiz_answers`, marks the lesson complete; every retake is a new attempt; UI shows best + latest and full history |
| D-36 | Instructor placement | Instructors share the admin SPA behind `RequireRole` + role-filtered nav; no separate fourth app |
| D-37 | Course approval | Lifecycle `DRAFT → PENDING → PUBLISHED/REJECTED`; only admins approve/reject; rejection requires a reason |
| D-38 | Instructor scoping | All instructor reads/actions are scoped to `courses.instructor_id`; `ADMIN` bypasses; `/admin/dashboard` is admin-only |
| D-39 | Instructor earnings | Estimated: attributed subscription revenue (equal split per enrolled course, refunds deducted) × admin-configurable revenue-share % (`platform_settings`, default 70); actual payouts recorded in `instructor_payouts` |
| D-40 | Instructor review notifications | Approval/rejection emails the owning instructor; failures never fail the review action |

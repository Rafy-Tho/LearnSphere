# Progress

Single place to track what is done, what is in progress, and what is left. Keep each file short; append to it as work lands.

**Status legend:** ✅ Done · 🟡 In progress · ⬜ Not started

| Area | File | Status | Summary |
|---|---|---|---|
| Backend API | [`backend-progress.md`](./backend-progress.md) | 🟡 | Module structure, DB migrations, API/naming/security work done; a few module gaps left |
| Learner frontend | [`frontend-user.md`](./frontend-user.md) | ✅ | Feature architecture, UI primitives, performance, API/state, design tokens |
| Admin dashboard | [`frontend-admin.md`](./frontend-admin.md) | ⬜ | Not started (learner app refactor came first) |

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

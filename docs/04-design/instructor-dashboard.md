# Instructor Dashboard — Design & Implementation Plan

Status: 🟡 In progress
Owner: Platform team
Related: [`api-design.md`](./api-design.md) · [`database-design.md`](./database-design.md) · [`architecture.md`](./architecture.md) · [`../progress/README.md`](../progress/README.md)

## 1. Goal

Give `INSTRUCTOR` accounts a dedicated, ownership-scoped workspace inside the
existing admin dashboard app. Admins keep the platform-wide console; instructors
see only their own teaching data. This replaces the previous behaviour where an
instructor shared the admin UI and (incorrectly) received platform-wide course
data.

The learner frontend is unchanged. There is no separate instructor app; the
instructor experience is a role-gated area of `admin/`.

## 2. Actors & access

| Role | Access |
|---|---|
| `LEARNER` | No access to the admin app; `/users/me` only. |
| `INSTRUCTOR` | Instructor workspace: own dashboard, own courses, own students, own reviews, own certificates, own earnings/payout history. |
| `ADMIN` | Everything an instructor can do (bypasses ownership), plus the platform console: categories, subscriptions, all users, course review queue, payouts & settings. |

Ownership is enforced server-side via `courses.instructor_id` and the existing
`assertOwnership` helper (`ADMIN` bypass). The frontend role gate is a UX aid,
never the security boundary.

## 3. Capabilities (what a teacher can do)

| Area | Capability |
|---|---|
| Dashboard | Own counts: courses by status, distinct students, enrollments, reviews, average rating, recent enrollments/reviews. |
| Courses | Create / edit / delete own courses. Submit a course for review; see status and rejection feedback. |
| Curriculum | Full CRUD of modules → chapters → lessons → contents and quiz questions/options (existing endpoints). |
| Students | Per-course roster: name/email/avatar, enrolled date, progress %, last activity, completion status. Search + completion filter. |
| Analytics | Completion rate, average progress, lesson drop-off, quiz pass/fail. |
| Reviews | Owner-scoped reviews and rating breakdown per course. |
| Certificates | Certificates issued for the instructor's courses. |
| Earnings | Estimated revenue-share summary, per-course breakdown, payout history. |
| Profile | Existing profile + password page. |

## 4. Course review workflow

```
INSTRUCTOR:  DRAFT ──submit──► PENDING ──admin approve──► PUBLISHED
                ▲                    └──admin reject────► REJECTED ──edit──► DRAFT
```

- New enum values `PENDING` and `REJECTED` are added to `content_status`.
- Only dedicated endpoints change status:
  - `POST /instructor/courses/:courseId/submit` (owner) → `PENDING`.
  - `POST /admin/courses/:courseId/approve` → `PUBLISHED`.
  - `POST /admin/courses/:courseId/reject` → `REJECTED` + `rejection_reason`.
- The generic course create/update validator still accepts `DRAFT`/`PUBLISHED`;
  the service forces an instructor update to `DRAFT` (an instructor cannot
  self-publish).
- Admin-created/updated courses may still be set to `PUBLISHED` directly.
- While a course is `PENDING` it is **locked from instructor edits** (course
  metadata, objectives, and all nested content return HTTP 409 via
  `common/auth/course-lock.js`); admins bypass the lock. Rejection unlocks it
  for re-submission.

## 5. Earnings model (estimate)

There is no per-course price; billing is platform-wide subscriptions. Instructor
earnings are therefore **estimated** and clearly labelled as such in the UI.

```
share        = platform_settings.instructor_revenue_share_percent (default 70)
attributed   = Σ over completed subscription payments p of learner u
                 Σ over courses c where c.instructor_id = instructor
                   and u is enrolled in c
                     (net(p) / enrolledCourseCount(u))
estimated    = attributed * share / 100
```

- `net(p)` = payment `amount` minus succeeded refunds.
- Admin records actual payouts in `instructor_payouts`; the instructor sees
  their payout history.

## 6. UI

### Navigation (role filtered)

| ADMIN | INSTRUCTOR |
|---|---|
| Dashboard | Dashboard |
| Categories | My Courses |
| Courses | Earnings |
| Course Reviews | |
| Subscriptions | |
| Instructors | |
| Users | |
| Payouts | |

- Sidebar brand: "Admin Console" (ADMIN) / "Instructor Studio" (INSTRUCTOR).
- Footer role label comes from `user.role`.

### Home route `/`

Renders `DashboardPage` for ADMIN and `InstructorDashboardPage` for INSTRUCTOR
through a role-aware home wrapper.

### Course detail — `/courses/:courseId`

Existing curriculum builder plus tabs: `Curriculum · Students · Analytics ·
Reviews · Certificates`. Tabs require an accessible course (ownership or admin).

### New pages

- `/course-reviews` (ADMIN) — approval queue with approve/reject.
- `/payouts` (ADMIN) — revenue-share setting + record/track instructor payouts.
- Instructor: `/` dashboard, `/earnings`.

### Admin app structure additions

```
admin/src/features/instructor/
  services/instructor.js
  hooks/{useInstructorQueries,useInstructorMutations,index}.js
  components/{StudentTable,AnalyticsPanel,ReviewsPanel,CertificatesPanel}.jsx
  pages/{InstructorDashboardPage,InstructorEarningsPage}.jsx
admin/src/features/courses/pages/CourseReviewsPage.jsx
admin/src/features/courses/components/{CourseDetailTabs,StudentsTab,AnalyticsTab,ReviewsTab,CertificatesTab}.jsx
admin/src/features/payouts/
  services/payouts.js
  hooks/{usePayouts,index}.js
  pages/PayoutsPage.jsx
admin/src/app/guards/RequireRole.jsx
```

## 7. Backend API

All routes are under `/api/v1`, use the standard envelope, and return
`pagination` on lists.

### Instructor module (`/instructor`, roles: INSTRUCTOR, ADMIN; owner-scoped)

| Method | Path | Purpose |
|---|---|---|
| GET | `/instructor/dashboard` | Scoped dashboard stats. |
| GET | `/instructor/courses/:courseId/students` | Paginated roster. |
| GET | `/instructor/courses/:courseId/analytics` | Completion / drop-off / quiz stats. |
| GET | `/instructor/courses/:courseId/reviews` | Owner-scoped reviews. |
| GET | `/instructor/courses/:courseId/certificates` | Issued certificates. |
| POST | `/instructor/courses/:courseId/submit` | Submit DRAFT/REJECTED → PENDING. |
| GET | `/instructor/earnings` | Estimated earnings + per-course breakdown. |
| GET | `/instructor/payouts` | Own payout history. |

### Admin additions (roles: ADMIN)

| Method | Path | Purpose |
|---|---|---|
| GET | `/admin/courses?status=PENDING` | Review queue (list filtered by status). |
| POST | `/admin/courses/:courseId/approve` | PENDING → PUBLISHED. |
| POST | `/admin/courses/:courseId/reject` | PENDING → REJECTED (+ reason). |
| GET | `/admin/settings` | Read platform settings (revenue share). |
| PATCH | `/admin/settings` | Update revenue share. |
| GET | `/admin/instructor-payouts` | List payouts. |
| POST | `/admin/instructor-payouts` | Record a payout. |
| PATCH | `/admin/instructor-payouts/:payoutId` | Mark paid / update. |

### Fixes to existing endpoints

- `GET /admin/courses` (`GET /api/v1/admin/courses`): now scoped to
  `instructor_id = session user` when the caller is an `INSTRUCTOR`.
- `GET /admin/dashboard`: ADMIN only (instructors use `/instructor/dashboard`).

## 8. Database changes

Migration `0025_instructor_course_approval.sql`
- `content_status` += `PENDING`, `REJECTED`.
- `courses` += `submitted_at`, `reviewed_at`, `reviewed_by`, `rejection_reason`;
  index on `status` for the review queue.

Migration `0026_instructor_revenue.sql`
- `platform_settings (key TEXT PK, value JSONB, updated_at)`, seeded with
  `instructor_revenue_share_percent = 70`.
- `payout_status` enum (`PENDING`, `PAID`, `CANCELLED`).
- `instructor_payouts` table.

No existing column is dropped or mutated destructively. `backend/src/db/schema.sql`
is updated to mirror the same enums/tables/columns for fresh installs.

## 9. Frontend state & data access

- Services call the shared `api` client; hooks wrap TanStack Query.
- New query roots are added to `queryKeys.js` and to `userScopedQueryRoots` so
  they are cleared on logout / 401.
- Mutations invalidate the matching root(s).

## 10. Non-goals

- Real per-course checkout / instructor revenue accounting.
- Instructor-to-learner messaging, Q&A, or announcements.
- Automated tests / CI (none exists in the repo).

## 11. Acceptance criteria

- An `INSTRUCTOR` sees only their own courses, students, reviews, certificates,
  and estimated earnings; platform-wide data is never returned.
- An `INSTRUCTOR` cannot set a course to `PUBLISHED`; only admins approve.
- An `ADMIN` sees the platform dashboard, the review queue, payouts, and can
  bypass ownership.
- `LEARNER` accounts cannot reach any instructor or admin endpoint (403).
- Existing learner flows and admin billing are unaffected.

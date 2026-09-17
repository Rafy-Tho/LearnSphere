# Save Course (Bookmark) — Plan & Implementation

Goal: let a learner save any published course. A saved course shows a **filled
bookmark** on cards and the course-detail page, and appears in a **"Saved
Courses" tab** in the Learning Dashboard. The backend is the source of truth.

Decisions (confirmed):

- Saving is a **bookmark/wishlist**, independent of enrollment.
- Any **published** course can be saved; drafts/soft-deleted courses are rejected.
- Saved state is derived from the API, not a per-course boolean column.

## 1. Database

New migration `backend/src/db/migrations/0016_saved_courses.sql` (and mirrored in
`backend/src/db/schema.sql`):

```sql
CREATE TABLE IF NOT EXISTS saved_courses (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  course_id UUID NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT unique_user_saved_course UNIQUE (user_id, course_id)
);
CREATE INDEX IF NOT EXISTS idx_saved_courses_user ON saved_courses(user_id);
CREATE INDEX IF NOT EXISTS idx_saved_courses_course ON saved_courses(course_id);
```

- Rows are only inserted/deleted → no `updated_at` and no trigger (mirrors
  `review_helpful_votes` / `review_reports`).
- `UNIQUE (user_id, course_id)` makes save idempotent.

Apply with `npm run db:migrate` (backend).

## 2. Backend — `backend/src/modules/saved-courses/`

Follows the `reviews` layering: repository → service → controller → routes,
constructor-injected singletons, `sendSuccess` envelope.

| File | Responsibility |
|---|---|
| `repository.js` | Parameterized SQL: idempotent `save` (`ON CONFLICT ... DO UPDATE`), `unsave`, `getSavedCourseIds`, paginated `getSavedCourses` (joins `courses` + `learn_progress` + `lesson_completion` for progress fields). |
| `service.js` | Verifies the course exists and `status = 'PUBLISHED'` (else 404) before saving. |
| `controller.js` | `saveCourse`, `unsaveCourse`, `getSavedCourses`, `getSavedCourseIds`. |
| `routes.js` | `savedCourseRoute` (nested) + `meSavedCoursesRoute`. |
| `validation.js` | Re-exports `courseIdParamValidator`. |

### Endpoints

| Method | Path | Middleware | Description |
|---|---|---|---|
| POST | `/api/v1/courses/:courseId/saved` | `auth`, `val` | Save course (idempotent) |
| DELETE | `/api/v1/courses/:courseId/saved` | `auth`, `val` | Remove saved course (idempotent) |
| GET | `/api/v1/users/me/saved-courses` | `auth` | Paginated saved courses (+ progress) |
| GET | `/api/v1/users/me/saved-courses/ids` | `auth` | Saved course IDs for bookmark state |

### Mounting

- `modules/courses/routes.js`: `coursesRoute.use("/:courseId/saved", savedCourseRoute);`
- `app/routes.js`: `app.use("/api/v1/users/me/saved-courses", meSavedCoursesRoute);`

## 3. Frontend — `frontend/src/features/saved/`

| File | Responsibility |
|---|---|
| `services/saved.js` | `getSavedCourses`, `getSavedCourseIds`, `saveCourse`, `unsaveCourse`. |
| `hooks/useSavedCourses.js` | `useSavedCourses` (paginated), `useSavedCourseIds`, `useIsCourseSaved`; all gated on `enabled: !!user`. |
| `hooks/useSavedMutations.js` | `useToggleSaveCourse` with optimistic update of the IDs query, `react-toastify` success/error feedback, and invalidation of the list. |

Query keys (`lib/queryKeys.js`): `savedCourses`, `savedCoursesRoot`,
`savedCourseIds` — the roots are added to `userScopedQueryRoots` so they clear
on logout/401.

### UI wiring

- `components/common/CourseCard.jsx` — bookmark button fills (`fill-current
  text-primary`) when saved; toggles; guests go to `/login`.
- `features/catalog/components/course/CourseCardDetailed.jsx` — same, with
  `preventDefault`/`stopPropagation` (card is a `<Link>`).
- `features/catalog/components/course-detail/HeroSection.jsx` — "Save Course" /
  "Saved" button next to "Start Learning".
- `features/dashboard/components/Tabs.jsx` — new "Saved Courses" tab.
- `features/dashboard/pages/SavedCoursesDashboard.jsx` — reuses
  `CourseGridSection` at `/learning-dashboard/saved`.
- `app/router.jsx` — lazy import + nested route.

## 4. Verification

- Backend: `npx eslint .` (backend).
- Frontend: `npm run lint` + `npm run build` (frontend).
- DB: `npm run db:migrate` (backend).
- No automated tests exist in this repo; UI is verified manually in the browser.

## 5. Out of scope

- No admin UI changes.
- No new dependencies.
- Saving does not enroll the learner or affect access.

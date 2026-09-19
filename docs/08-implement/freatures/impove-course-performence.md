# Improve Admin Course Detail Performance

Plan for making the admin **Course Detail** page load fast by breaking the single
monolithic fetch into small, per-branch requests that load on demand (when the
user expands a node), with targeted cache invalidation after mutations.

## Status: Implemented

- **Backend:** new admin child endpoints added in
  `backend/src/modules/courses/admin.routes.js`; service methods in
  `course.service.js`; count-aware, position-ordered repos in
  `backend/src/modules/content/*.repository.js`; monolithic
  `GET /admin/courses/:courseId` + `getDashboardDetails` retired.
- **Frontend:** `useCourseSummary` + per-branch hooks under
  `admin/src/features/courses/hooks/tree/`; `CourseDetailPage`, `ModuleCard`,
  `ChapterItem`, `LessonItem` now lazy-load on expand; CRUD hooks use targeted
  prefix invalidation; action hooks fixed to call the correct services.
- **Verified:** `npx eslint .` (backend, no new issues), `npm run lint`
  (admin courses clean), `npm run build` (admin succeeds).

---

## 1. Problem

`CourseDetailPage` calls `useGetCourseDetails(courseId)` which hits
`GET /api/v1/admin/courses/:courseId`. That endpoint returns the **entire**
curriculum in one payload:

```
{ course, objectives, modules, chapters, lessons, lessonContents, quizzes, options }
```

References:

- Frontend page: `admin/src/features/courses/pages/CourseDetailPage.jsx:20`
- Hook: `admin/src/features/courses/hooks/course/use-course-queries.js:18`
- Service: `admin/src/features/courses/services/courses.js:14`
- Backend service: `backend/src/modules/courses/course.service.js:134`
  (`getDashboardDetails`) — 1 `findById` + 7 parallel queries.

Consequences:

- **Heavy first load.** Every lesson's HTML `lesson_contents` and every
  `quiz_options` row (including answer keys) is transferred before the user
  expands anything.
- **Wasted rendering.** All data is held in local state
  (`admin/src/features/courses/hooks/course/use-course-data.js`) and each node
  repeatedly scans the full arrays: `chapters.filter(...)` in
  `ModuleCard.jsx:46`, `lessons.filter(...)` in `ChapterItem.jsx:33`,
  `lessonContents.filter(...)` / `quizzes.filter(...)` in `LessonItem.jsx:137`,
  `quizOptions.filter(...)` in `LessonItem.jsx:139`. This is roughly
  `O(depth × total nodes)` work on every render.
- **State mutation bug.** `CourseDetailPage.jsx:96` calls
  `modules.sort(...)` directly on state, mutating React state in place.

The backend has **no N+1 loops**, but the contract is "give me everything,"
which does not scale with course size.

---

## 2. Goal / Target Behavior

- **Initial request:** course + objectives + **modules only**, plus per-module
  counts (`chapter_count`, `lesson_count`) so collapsed nodes can still show
  meaningful summaries.
- **On demand:** chapters load when a module expands; lessons load when a
  chapter expands; lesson contents and quizzes load when a lesson expands.
- **Caching:** TanStack Query holds one cache entry per branch; re-expanding is
  instant until a mutation invalidates it.
- **Mutations:** after a create/update/delete, invalidate only the affected
  branch (by query-key prefix), not the whole course tree.

> Note: the original request also mentioned auto-loading the **first module**.
> This plan defaults to "modules only" for the initial load, but includes an
> optional first-module prefetch (see §7, Step 5.4) that can be switched on.

---

## 3. Backend Changes

All new endpoints are **admin-scoped reads**, guarded with:

```
requireAuth → authorize(ADMIN, INSTRUCTOR) → param validators → validateResult → service ownership check
```

Ownership: the service resolves the course from `courseId` and calls
`assertOwnership({ ownerId: course.instructor_id, user })` (same as
`course.service.js:138`). Every child query **joins up to `course_id`** so a
module/chapter/lesson id from another course returns 404, not data (IDOR
protection).

### 3.1 Routes

Add to the admin courses router
(`backend/src/modules/courses/admin.routes.js`), mounted at
`/api/v1/admin/courses`:

| Method | Path | Returns |
|---|---|---|
| GET | `/:courseId/summary` | `{ course, objectives, modules: [{ ...module, chapter_count, lesson_count }] }` |
| GET | `/:courseId/modules/:moduleId/chapters` | chapters + `lesson_count`, ordered by position |
| GET | `/:courseId/chapters/:chapterId/lessons` | lessons + `content_count` + `quiz_count`, ordered by position |
| GET | `/:courseId/lessons/:lessonId/contents` | lesson_contents, ordered by position |
| GET | `/:courseId/lessons/:lessonId/questions` | quizzes with nested options, **including `is_correct` + explanation (admin answer key)** |

Rationale for nesting under `:courseId`: a single ownership check covers the
whole subtree, and every parent is validated to belong to that course. (The
existing public `/modules/:moduleId/chapters`, `/lessons/:lessonId/contents`,
and `/lessons/:lessonId/questions` routes are learner-facing and must not be
reused for admin because they lack ownership enforcement and the questions route
strips the answer key — see `backend/src/modules/content/question.repository.js:125`.)

### 3.2 Repository methods

Add methods (parameterized SQL only, no ORM; follow existing repository style):

- `module.repository.js`
  - `getModulesWithCountsByCourseId(courseId)` — modules with correlated
    `chapter_count` and `lesson_count`, `ORDER BY position ASC`. (Existing
    `getModulesByCourseId` has **no `ORDER BY`** — fix that too.)
- `chapter.repository.js`
  - `findByModuleIdWithCounts(moduleId, courseId)` — chapters with
    `lesson_count`, joined to `modules` on `course_id`, `ORDER BY position`.
- `lesson.repository.js`
  - `findByChapterIdWithCounts(chapterId, courseId)` — lessons with
    `content_count` and `quiz_count`, joined up to `modules`/`course_id`,
    `ORDER BY position`.
- `lesson-content.repository.js`
  - reuse `findByLessonId(lessonId)` but add a course-validated variant
    (`WHERE lc.lesson_id = $1` plus joins up to `course_id`), `ORDER BY position`.
- `question.repository.js`
  - `getQuestionsWithOptionsByLessonId(lessonId, courseId)` — quizzes + options
    via `json_agg(json_build_object('id', ..., 'text', ..., 'is_correct', ...,
    'position', ...))`, joined up to `course_id`, `ORDER BY position`.

Add `ORDER BY position` anywhere missing (modules, chapters, lessons,
lesson_contents, quizzes, options) so the frontend no longer needs to sort.

### 3.3 Controller / service / validators

- Add handlers to `backend/src/modules/courses/course.controller.js`
  (`getCourseSummary`, `getModuleChapters`, `getChapterLessons`,
  `getLessonContents`, `getLessonQuestions`) or a small dedicated
  `admin-curriculum.controller.js` if the file grows too large.
- Add corresponding service methods that (a) assert ownership via `courseId`
  and (b) delegate to the repositories. Prefer `Promise.all` where independent.
- Validators: compose the existing UUID param validators
  (`courseIdParamValidator`, `moduleIdParamValidator`, `chapterIdParamValidator`,
  `lessonIdParamValidator` from the respective validation files) plus
  `validateResult`.
- Responses use `sendSuccess` (envelope `{ success, statusCode, message, data }`).

### 3.4 Retire the monolithic endpoint

The only consumer of `GET /admin/courses/:courseId` is the admin app. Two options:

- **Recommended:** repurpose it to return the summary (same contract change,
  no dead code), then delete `getDashboardDetails` and the seven-query
  `Promise.all`.
- Alternatively add `/summary` now and remove the old handler in the same PR
  after the frontend migrates.

Whichever is chosen, remove the now-unused repository calls to keep the module
clean.

---

## 4. Frontend Changes

### 4.1 Query keys

`admin/src/lib/queryKeys.js`:

```js
courseSummary:   (courseId)              => ['course-summary', courseId],
moduleChapters:  (courseId, moduleId)    => ['module-chapters', courseId, moduleId],
chapterLessons:  (courseId, chapterId)   => ['chapter-lessons', courseId, chapterId],
lessonContents:  (courseId, lessonId)    => ['lesson-contents', courseId, lessonId],
lessonQuestions: (courseId, lessonId)    => ['lesson-questions', courseId, lessonId],
```

Add each root to `userScopedQueryRoots` so logout clears them.

The nested-by-`courseId` shape enables **prefix invalidation**: invalidating
`['module-chapters', courseId]` clears every expanded module's chapter cache at
once.

### 4.2 Services

Add fetchers in `admin/src/features/courses/services/` (extend `courses.js`,
`modules.js`, `lessons.js`, `contents.js`, `questions.js`):

```js
getCourseSummary: (courseId) => api.get(`/admin/courses/${courseId}/summary`),
getModuleChapters: (courseId, moduleId) =>
  api.get(`/admin/courses/${courseId}/modules/${moduleId}/chapters`),
getChapterLessons: (courseId, chapterId) =>
  api.get(`/admin/courses/${courseId}/chapters/${chapterId}/lessons`),
getLessonContents: (courseId, lessonId) =>
  api.get(`/admin/courses/${courseId}/lessons/${lessonId}/contents`),
getLessonQuestions: (courseId, lessonId) =>
  api.get(`/admin/courses/${courseId}/lessons/${lessonId}/questions`),
```

### 4.3 Hooks

New hooks under `admin/src/features/courses/hooks/`:

- `use-course-summary` — always enabled.
- `use-module-chapters(courseId, moduleId, isExpanded)` — `enabled: isExpanded`.
- `use-chapter-lessons(courseId, chapterId, isExpanded)` — `enabled: isExpanded`.
- `use-lesson-contents(courseId, lessonId, isExpanded)`
- `use-lesson-questions(courseId, lessonId, isExpanded)`

Each uses `staleTime: 5 * 60 * 1000` and a long `gcTime` so re-expanding does
not refetch unless a mutation invalidated the key. Return
`{ data, isLoading, isError, error, refetch }`.

### 4.4 Component refactor

The key insight: each expandable node is already its own component, so it can
own its query hook (hooks cannot be called conditionally inside `.map`, but a
hook inside a component is fine). Radix `CollapsibleContent` unmounts when
closed, so `ChapterItem`/`LessonItem` only mount when actually expanded.

- `CourseDetailPage.jsx`
  - Fetch only `useCourseSummary(courseId)`.
  - Pass `courseId` down to `ModuleCard`.
  - Remove the `.sort()` state mutation (data now arrives pre-sorted).
- `ModuleCard.jsx`
  - Call `useModuleChapters(courseId, module.id, isExpanded)`.
  - Render `chapter_count` / `lesson_count` in the header (from summary) so
    collapsed nodes still show structure.
  - Render a small inline skeleton while loading, error + retry on failure.
  - Map chapters directly (no `.filter().sort()`).
- `ChapterItem.jsx`
  - Call `useChapterLessons(courseId, chapter.id, isExpanded)`.
  - Show `lesson_count` when collapsed; render lessons directly.
- `LessonItem.jsx`
  - Call `useLessonContents` / `useLessonQuestions` when expanded.
  - Render contents and quizzes directly (options already nested in the
    question payload).
- Wrap `ModuleCard`, `ChapterItem`, `LessonItem`, and item rows in `React.memo`
  to stop re-render cascades when a sibling loads.

### 4.5 Mutations → cache invalidation

This is the largest part of the refactor. Today each CRUD hook receives
`setModules`/`setChapters`/... setters from `useCourseData` and patches local
state (`use-module-crud.js:53`, `use-chapter-crud.js:59`, etc.). Rewrite them to
use `useQueryClient()` and invalidate by prefix:

| Mutation | Invalidate |
|---|---|
| module create/update/delete | `['course-summary', courseId]` |
| chapter create/update/delete | `['module-chapters', courseId]`, `['course-summary', courseId]` |
| lesson create/update/delete | `['chapter-lessons', courseId]`, `['module-chapters', courseId]`, `['course-summary', courseId]` |
| content create/update/delete | `['lesson-contents', courseId]`, `['chapter-lessons', courseId]` |
| quiz/option create/update/delete | `['lesson-questions', courseId]`, `['chapter-lessons', courseId]` |

(`refetchType: 'active'` is the default, so only expanded branches refetch.)
Pass `courseId` into each CRUD hook; `useCourseDetail`/`useCourseData` are then
slimmed down or deleted. Keep the existing toast behavior.

Optional: optimistic `setQueryData` for snappy edits, reconciled by the
invalidation.

### 4.6 Remove

- `use-course-data.js` full-tree state (or reduce to summary only).
- The array-scanning `.filter().sort()` chains and the state `.sort()`.
- Any now-dead exports in `hooks/index.js`.

---

## 5. Phased Execution

1. **Backend**
   1. Add repository methods + `ORDER BY position`.
   2. Add service/controller handlers with ownership checks.
   3. Add routes + param validators.
   4. Repurpose/retire the monolithic detail handler.
   5. Run `npx eslint .` in `backend/`.
2. **Frontend query layer**
   1. Add keys + `userScopedQueryRoots`.
   2. Add services and per-branch hooks.
3. **UI refactor**
   1. `CourseDetailPage` → summary + `courseId` propagation.
   2. `ModuleCard` / `ChapterItem` / `LessonItem` own their queries.
   3. Counts, skeletons, error/retry, `React.memo`.
4. **Mutations**
   1. Rewrite CRUD hooks to invalidate by prefix.
   2. Tune `staleTime` / `gcTime`.
5. **Polish & verify**
   1. Optional: prefetch a module on hover / auto-load the first module behind
      a `PREFETCH_FIRST_MODULE` flag.
   2. Run `npm run lint` and `npm run build` in `admin/`.
   3. Manually exercise expand/collapse and every CRUD path.

---

## 6. Risks / Watch-outs

- **Answer-key exposure.** The admin questions endpoint must stay admin-guarded;
  the learner endpoint (`getQuestions`) intentionally strips `is_correct`.
- **IDOR on nested routes.** Every child query must join up to `course_id`, not
  trust the child id alone.
- **Query-key prefix invalidation.** Keys must be nested so prefix matching
  clears exactly the right branches; test invalidating a parent after a nested
  delete.
- **Hook mounting.** Relying on Radix unmount for child hooks is only safe if
  `CollapsibleContent` keeps its default (non-`forceMount`) behavior — verify
  before shipping.
- **Large refactor.** Rewriting all CRUD hooks is invasive; land it
  incrementally (backend first, then read path, then mutations) so the page is
  never broken.
- **Counts freshness.** Counts live in `course-summary`; a lesson added deep in
  the tree must invalidate that summary key too, or counts go stale.
- **Existing bug.** `modules.sort()` mutating state is fixed as part of this
  work.

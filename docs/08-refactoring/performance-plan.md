# Performance Plan

Execution plan for backend and frontend performance work. Findings are drawn from [`backend-audit.md`](./backend-audit.md) §13 and [`frontend-audit.md`](./frontend-audit.md); priorities from [`codebase-audit.md`](./codebase-audit.md) P1.

> **Status:** Proposed. No optimization applied. Every item must be measured before and after (see §2 and §6).

---

## 1. Goals

- Reduce slow API responses
- Reduce unnecessary database work
- Reduce unnecessary frontend requests
- Improve rendering performance
- Keep performance measurable

---

## 2. Baseline

Before optimization, record where possible:
- Response time
- Database query time
- Number of database queries
- API request frequency
- Large payloads
- Frontend rendering issues

### 2.1 Current baseline status

**No measurements have been taken.** The audit recorded *query shapes* (Confirmed) and production *impact* (Likely), not timings. This plan requires establishing a baseline first.

Recommended baseline method:

| Signal | How to capture |
|---|---|
| Endpoint latency (p50/p95) | Time `curl`/Supertest requests against a seeded DB; or add lightweight request timing logs |
| Query time + plan | `EXPLAIN (ANALYZE, BUFFERS)` on the audit's flagged queries |
| Query count per request | Log query count per request (temporary instrumentation) |
| Payload size | Measure response `Content-Length` for list endpoints |
| Frontend requests | Network tab / React Query devtools for a full page session |
| Render counts | React DevTools Profiler on heavy pages (`CoursesPage`, `LearningRoadMap`, dashboards) |
| Bundle size | `vite build` output before/after |

Seed data should be realistic (hundreds of courses, thousands of lessons, thousands of completions/reviews) — many flagged queries only manifest at volume.

### 2.2 Baseline template

| Metric | Endpoint / page | Before | After | Delta |
|---|---|---|---|---|
| p95 latency | `GET /courses` | | | |
| Query count | `GET /courses` | | | |
| p95 latency | `GET /courses/:id/learn` | | | |
| Query count | `GET /courses/:id/dashboard-details` | | | |
| Payload bytes | `GET /admin/subscriptions/payments` | | | |
| Requests/page | `/courses` (learner) | | | |
| Bundle KB (initial JS) | `frontend` | | | |
| Bundle KB (initial JS) | `admin` | | | |

---

## 3. Backend

Review:
- Slow SQL queries
- Missing indexes
- N+1 queries
- Duplicate database calls
- Unnecessary joins
- Large result sets
- Missing pagination
- Repeated calculations
- Inefficient data processing

### 3.1 Prioritized backend work

| # | Item | Evidence | Class |
|---|---|---|---|
| B1 | Add indexes: `courses(category_id,instructor_id,status,deleted_at)`, `lesson_completion(user_id,course_id)`, `password_reset_codes(user_id)`, trigram on course name/description | `backend-audit.md` PERF-4 | Confirmed |
| B2 | Rewrite `getAllCourses`: single count strategy, fix alias filters (currently 500), soft-delete, cap `limit` | PERF-1 | Confirmed shape / Likely impact |
| B3 | Consolidate `getCourseDetailsDashboard` (8 queries → 1–2) + ownership check | PERF-2 | Confirmed |
| B4 | Simplify `getPopular` (use `enrollments`), `getRecommended`, in-progress/completed; extract shared aggregate CTE | PERF-3 | Confirmed shape / Likely impact |
| B5 | Replace admin load-all-then-find with `findById` | PERF-5 | Confirmed |
| B6 | Remove redundant existence queries (course detail, reviews, logout, votes, progress) | PERF-6 | Confirmed |
| B7 | Fix `AdvancedQuery.paginate` so the count query does not re-run aggregate subqueries | PERF-1 | Confirmed |
| B8 | Deduplicate the duration/lesson-count aggregate subquery (~8 copies) | `codebase-audit.md` §3.3 | Confirmed |
| B9 | Add `withTransaction` and wrap multi-step writes (correctness under load) | `backend-audit.md` §9 | Confirmed |

### 3.2 Query-shape notes (Confirmed)
- `getAllCourses` (`CourseRepository.js:99-171`) joins two aggregate subqueries; `paginate()` (`AdvaceQuery.js:144-176`) reruns the aggregate base for `COUNT(*)`.
- `getPopular` (`:401-432`) aggregates all `lesson_completion` rows per request; `getRecommended` uses correlated `IN`/`NOT IN`; in-progress/completed run count+data aggregate passes.
- `%term%` search (`AdvaceQuery.js:83-96`) has no trigram index → sequential scan.
- Missing `deleted_at IS NULL` on most reads can inflate result sets.

---

## 4. Frontend

Review:
- Unnecessary API requests
- Duplicate requests
- Poor caching
- Unnecessary re-renders
- Large components
- Large lists
- Bundle size
- Unnecessary state updates

### 4.1 Prioritized frontend work

| # | Item | Evidence | Class |
|---|---|---|---|
| F1 | Set `QueryClient` defaults (`staleTime`, `refetchOnWindowFocus:false`, retry) to stop refetch-on-focus storms | `frontend/main.jsx:10`, `admin/App.jsx:22` | Confirmed |
| F2 | Add `enabled: !!user` guards to user-scoped queries | `useCourses.js:126-194`, `useUsers.js:4-11`, admin `useGetUsers.js:11` | Possible |
| F3 | Fix query keys so caches don't leak across courses/subscriptions | `useCourses.js:117-124`, `useSubscriptions.js:14-22` | Confirmed |
| F4 | Remove local-mirror + `useEffect` double-fetch/double-update in admin pages | `admin/pages/CoursesPage.jsx:258-262,113-122` | Confirmed |
| F5 | Route-level code splitting (`React.lazy`/`Suspense`) | `frontend/App.jsx`, `admin/App.jsx` | Confirmed |
| F6 | Drop Font Awesome CDN (use lucide-react); remove `date-fns` for one helper; delete dead 2 MB asset | `frontend/index.html:7-10`, `utils/formatTimeAgo.js:2`, `assets/profile.jpg` | Confirmed |
| F7 | Add pagination params / server pagination for dashboard and admin lists (avoid large payloads + client slicing) | `useCourses.js:126-194`, `admin/pages/SubscriptionsPage.jsx:23-27` | Likely |
| F8 | Memoize context values and inline `columns`/handlers | `AuthContext.jsx:43-45`, `LearningLayout.jsx:49-51`, `CoursesPage.jsx:183-257` | Confirmed (minor) |
| F9 | Add request cancellation (`AbortController` via React Query `signal`) | all `fetch` calls | Confirmed |
| F10 | Remove ~32 dead files + unused deps (reduces bundle/install surface) | `frontend-audit.md` §15–§16 | Confirmed |

---

## 5. Optimization Rules

- Measure before changing
- Fix high-impact problems first
- Prefer simple solutions
- Avoid premature optimization
- Do not trade correctness or security for speed

Additional project rules:
- Preserve response shapes consumed by the frontends.
- Do not introduce caching without an invalidation strategy.
- Prefer query/index fixes over adding infrastructure.
- Keep changes isolated from feature work.

---

## 6. Verification

After optimization:

```text
Measure
  ↓
Compare with baseline
  ↓
Run tests
  ↓
Verify behavior
```

Classify findings as:
- Confirmed problem
- Likely problem
- Possible improvement

### 6.1 Classification of this plan's items

| Class | Items |
|---|---|
| **Confirmed problem** | B1, B3, B5, B6, B8, F1, F3, F4, F5, F6, F8, F9, F10 |
| **Likely problem** | B2, B4, B7, F7 |
| **Possible improvement** | F2 |

> "Confirmed" means the code shape/mechanism is directly observed; it still requires before/after measurement to quantify. "Likely" means the path is present but impact depends on data volume/usage. "Possible" needs measurement to confirm.

### 6.2 Verification checklist per change
1. Record the before metric (latency, query count, payload, bundle).
2. Apply the change.
3. Re-measure with the same method and seed data.
4. Run `EXPLAIN (ANALYZE, BUFFERS)` for changed queries; confirm index usage.
5. Lint (`npx eslint .`, `npm run lint`) and build frontends.
6. Confirm the response shape and UI behavior are unchanged.
7. Record the after metric in the §2.2 table.

### 6.3 Guardrails
- Do not merge a performance change that alters API contracts without updating both consumers.
- Do not add caching/materialized views without a write-side invalidation plan.
- Revert if a change does not measurably improve the target metric.

---

## 7. Suggested Order

1. Establish baseline (§2) with realistic seed data.
2. Backend indexes (B1) — highest impact, lowest risk.
3. `getAllCourses` + paginate count (B2, B7) — primary public endpoint.
4. Dashboard-details consolidation (B3).
5. Popular/recommended/in-progress/completed (B4).
6. Admin load-all-then-find + redundant queries (B5, B6).
7. Frontend query defaults/keys/local mirrors (F1, F3, F4).
8. Code splitting + bundle cleanup (F5, F6, F10).
9. Re-measure and iterate (F2, F7, F8, F9).

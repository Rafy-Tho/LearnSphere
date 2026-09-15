# Backend Performance

Backend-only performance plan. Supersedes the backend sections of
[`../performance-plan.md`](../performance-plan.md), which predates the module refactor
and lists several items that are already implemented. Part of the backend refactor
series under `docs/08-refactoring/backend/`.

> **Status:** Partially implemented (2026-09-15). B7, B8, B6, B3, B4 applied; B2
> resolved via B7 + existing `MAX_LIMIT`; B1/B5/B9 confirmed done. Deferred: B4
> in-progress/completed two-pass and the full `json_agg` dashboard rewrite (see §4.2).
> Every change still requires before/after measurement (see §3 and §5). Findings
> verified against the refactored code on 2026-09-15.

---

## 1. Goals

- Reduce slow API responses
- Reduce unnecessary database work
- Keep response sizes reasonable
- Improve scalability

---

## 2. Status Snapshot

Format: item — current behavior — class — evidence — action.

| # | Item | Class | Evidence | Action |
|---|---|---|---|---|
| B1 | Course/learning indexes | **Done** | `src/db/migrations/0009_indexes.sql:53-66` | Mark complete |
| B5 | Admin load-all-then-find | **Done** | `modules/subscriptions/payment.service.js:46`; `subscription.repository.js:263,275` | Mark complete |
| B9 | Transaction infrastructure | **Done (in use)** | `config/database.js:26`; `webhook.service.js:39`; `enrollment.service.js:56` | Mark complete |
| B7 | `paginate` count re-runs aggregate subqueries | **Fixed — Confirmed** | `common/query/advanced-query.js:152-160` | `countBaseQuery` + `countJoinAliases` |
| B2 | `getAllCourses` count re-run; `limit` cap | **Fixed — Confirmed shape** | `modules/courses/repository.js:104-177` | Resolved by B7; cap already in `pagination.js:24` |
| B8 | Duration/lesson aggregate duplicated | **Fixed — Confirmed** | `modules/courses/repository.js:6-26` | Shared `COURSE_STATS_SUBQUERY` / `COURSE_DURATION_SUBQUERY` |
| B3 | `getDashboardDetails` 8 sequential queries | **Fixed — Confirmed** | `modules/courses/course.service.js:150-183` | Parallelized via `Promise.all` |
| B6 | Redundant existence queries | **Fixed — Confirmed** | `course.service.js:74-83,104-138` | Existence folded into main query |
| B4 | Popular/recommended aggregates | **Partially fixed — Confirmed shape** | `repository.js:387-458` | `getPopular` → `enrollments`; `getRecommended` → `EXISTS` |

> "Confirmed" means the code shape/mechanism is directly observed; it still requires
> before/after measurement to quantify. "Likely" means the path is present but impact
> depends on data volume/usage.

---

## 3. Baseline

No measurements have been taken. Establish a baseline before changing anything.

| Signal | How to capture |
|---|---|
| Migration state | `npm run migrate status` — confirm `0009` applied |
| Endpoint latency (p50/p95) | Time `curl` requests against a seeded DB |
| Query time + plan | `EXPLAIN (ANALYZE, BUFFERS)` on the flagged queries |
| Query count per request | Manual review / temporary logging during baseline only |
| Payload size | Response `Content-Length` for list endpoints |

Seed data must be realistic (hundreds of courses, thousands of lessons, thousands of
completions/reviews) — the flagged queries only manifest at volume.

### 3.1 Baseline template

| Metric | Endpoint | Before | After | Delta |
|---|---|---|---|---|
| p95 latency | `GET /courses` | | | |
| Query count | `GET /courses` | | | |
| p95 latency | `GET /courses/:id` | | | |
| p95 latency | `GET /courses/:id/learn` | | | |
| Query count | `GET /courses/:id/dashboard-details` | | | |
| p95 latency | `GET /courses/popular` | | | |
| Payload bytes | `GET /admin/subscriptions/payments` | | | |

---

## 4. Prioritized Work

### B7 — `AdvancedQuery.paginate` count re-runs aggregates ✅
- **Location:** `common/query/advanced-query.js:152-171`
- **Before:** `countQuery = SELECT COUNT(*) ${baseQuery} ${whereClause}`; `baseQuery`
  includes joined aggregate subqueries, so every page request computed them twice.
- **Applied:** added `countBaseQuery` + `countJoinAliases`. The lightweight count base is
  used unless an active filter references a joined alias (`rv.`, `ld.`).
- **Risk:** Low.

### B2 — `getAllCourses` count re-run ✅
- **Location:** `modules/courses/repository.js:128-177`
- **Before:** page query joined duration + review aggregates and the count re-ran them.
- **Applied:** `countBaseQuery: "FROM courses c"` with `countJoinAliases: ["rv","ld"]`;
  same for `getAllCoursesDashboard`. `limit` was already capped at 100
  (`common/query/pagination.js:24`). The audit's "alias filters 500" was **not
  reproducible** against current code (frontend sends a UUID `category`), so filters
  were left unchanged.
- **Risk:** Low.

### B8 — Duplicated duration/lesson aggregate ✅
- **Location:** `modules/courses/repository.js:6-26`
- **Before:** the `modules → chapters → lessons` aggregate was copied across read paths.
- **Applied:** `COURSE_STATS_SUBQUERY` (duration + text/quiz counts) and
  `COURSE_DURATION_SUBQUERY` (duration only) reused by `getAllCourses`, `getPopular`,
  `getRecommended`, `getHighlyRated`.
- **Risk:** Low.

### B3 — `getDashboardDetails` sequential queries ✅
- **Location:** `modules/courses/course.service.js:150-183`
- **Before:** 7 serial awaits after the ownership lookup (8 round-trips).
- **Applied:** `Promise.all` over the 7 independent reads → 2 round-trips. Row shapes
  preserved exactly. The full single `json_agg` CTE was deferred (see §4.2).
- **Risk:** Low.

### B4 — Popular/recommended ✅
- **Location:** `modules/courses/repository.js:387-458`
- **Before:** `getPopular` aggregated all `lesson_completion` rows; `getRecommended`
  used correlated `IN`/`NOT IN`.
- **Applied:** `getPopular` now counts `enrollments`; `getRecommended` uses
  `EXISTS`/`NOT EXISTS` (NULL-safe, index-friendly). In-progress/completed deferred
  (see §4.2).
- **Risk:** Low–Medium (response shape unchanged).

### B6 — Redundant existence queries ✅
- **Location:** `modules/courses/course.service.js:74-138`
- **Before:** `getCourseDetails` / `getLearningData` ran `findById` then re-queried;
  `getRecentlyViewed` / `getRecommended` / `getInProgress` / `getCompleted` ran
  `userRepository.findById` although auth already guarantees the user.
- **Applied:** existence folded into the main query; session trusted for user
  existence. Removed the now-unused `userRepository` dependency from `CourseService`.
- **Risk:** Low.

### 4.2 Deferred (needs measurement / higher contract risk)
- **B4 — in-progress/completed two-pass:** the count and data queries each join the full
  content chain and `GROUP BY`. Reducing to one pass via `COUNT(*) OVER()` breaks
  out-of-range pages (no rows ⇒ total 0), so it is deferred pending a measurement and a
  pagination strategy. Locations: `repository.js:496-672`.
- **B3 — full `json_agg` CTE:** `json_agg` changes value types (timestamps → ISO strings,
  `numeric` → JSON numbers) versus the `pg` driver's `Date`/string output, risking the
  admin contract. Revisit only with both consumers updated.
- **B8 residual copies:** `getCourseDetailsById`, `getLearningData` duration CTE, and the
  in-progress/completed inline aggregates still have bespoke shapes; left to avoid
  semantic drift.

### 4.1 Done items (no work)
- **B1** — indexes already in `0009_indexes.sql` (catalog, trigram, `lesson_completion
  (user_id,course_id)`, `password_reset_codes(user_id)`). Verify applied via
  `npm run migrate status`.
- **B5** — admin update paths use `findPaymentById` / `findUserSubscriptionById`.
- **B9** — `withTransaction` implemented and used by webhook + enrollment.

---

## 5. Verification

```text
Measure
  ↓
Change
  ↓
Test
  ↓
Measure Again
```

Per change:
1. Record the before metric (§3.1).
2. Apply the change.
3. Re-measure with the same method and seed data.
4. Run `EXPLAIN (ANALYZE, BUFFERS)` for changed queries; confirm index usage.
5. `npx eslint .`.
6. Confirm the response shape and UI behavior are unchanged.
7. Record the after metric.

### 5.1 Guardrails
- Do not alter API contracts without updating both consumers.
- Do not add caching/materialized views without a write-side invalidation plan.
- Revert if a change does not measurably improve the target metric.

### 5.2 Applied-change status
- `npx eslint .` passes (0 errors; only pre-existing `no-console` warnings).
- Response shapes preserved: count/select columns and `Promise.all` return values are
  unchanged; `getPopular.enroll_count` now counts `enrollments` (semantically correct).
- **Outstanding:** baseline/after metrics (§3.1) and `EXPLAIN` confirmation are still to
  be captured against seeded data before these changes are considered verified.

---

## 6. Order

1. Establish baseline (§3) with realistic seed data.
2. B7 — `paginate` count.
3. B2 — `getAllCourses`.
4. B8 — shared aggregate.
5. B3 — dashboard-details consolidation.
6. B4 — popular/recommended/in-progress/completed.
7. B6 — redundant existence queries.
8. Re-measure and iterate.

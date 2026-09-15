# Frontend Performance

Performance standard for the learner app (`frontend/`) only. The admin dashboard (`admin/`) is
**out of scope**. Part of the frontend refactor series under `docs/08-refactoring/frontend/`.
See also [`01-architecture.md`](./01-architecture.md), [`02-migration-plan.md`](./02-migration-plan.md),
[`03-components.md`](./03-components.md), and the executable tasks in
[`../../09-implement/tasks/frontend-performance.md`](../../09-implement/tasks/frontend-performance.md).

> **Status:** Implemented. `FP-1…FP-14` are done; see
> [`../../09-implement/tasks/frontend-performance.md`](../../09-implement/tasks/frontend-performance.md)
> for task-level status and the after metrics in §4.2. `npm run lint` and `npm run build` pass in
> `frontend/`; admin is untouched.

---

## 1. Goals

- Reduce unnecessary renders
- Reduce unnecessary API requests
- Improve initial load time
- Keep large lists responsive

---

## 2. Review

Check for:

- Unnecessary re-renders
- Duplicate API requests
- Poor caching
- Large component trees
- Large lists
- Unnecessary state updates
- Large bundles
- Unnecessary dependencies

### 2.1 Findings (evidence)

Inventory as of this standard. Evidence cited as `file:line`. Classification follows the older
[`../performance-plan.md`](../performance-plan.md) §6.1 (Confirmed = mechanism directly observed;
Likely = path present, impact depends on data/usage).

#### 2.1.1 Unnecessary re-renders

| Finding | Evidence | Class |
|---|---|---|
| No `React.memo` on any component; list items re-render on parent updates | `frontend/src` (no `memo()` usage) | Confirmed |
| `AuthContext` value object recreated each render; all `useAuth()` consumers re-render on auth-state change | `app/providers/AuthProvider.jsx:25` | Confirmed |
| `ThemeContext` value object recreated each render | `app/providers/ThemeProvider.jsx:28` | Confirmed |
| `<Outlet context={{…}}>` object recreated each render; every `useOutletContext()` consumer re-renders | `layouts/LearningLayout.jsx:50-52` | Confirmed |
| Inline per-item handlers (`onToggle={() => toggle(module.id)}`, per-option `onSelect`) | `learning/.../CourseSidebar.jsx:160`, `learning/.../Quiz/QuestionCard.jsx:34` | Confirmed |
| New array/object/JSX props each render into list sections | `dashboard/pages/InProgressDashboard.jsx:15-17`, `dashboard/pages/CompletedCourseDashboard.jsx:15-17` | Confirmed |
| New closures passed into subtrees each render | `settings/components/UserProfile.jsx:50-52`, `catalog/pages/CourseDetailScreen.jsx:9-14` | Confirmed |
| `logout` redefined each render (not `useCallback`) and passed as a prop | `auth/hooks/useAuthMutations.js:53-62` → `layouts/AppLayout.jsx:24` | Confirmed |
| Duplicate component trees mounted at once (CSS hides one) | `learning/pages/CourseLearningScreen.jsx:30,43` (`CourseSidebar` ×2), `learning/components/LearningNavigation.jsx:35,38` (Desktop+Mobile), `components/common/Navigation.jsx:54-76` | Confirmed |

#### 2.1.2 Duplicate API requests

| Finding | Evidence | Class |
|---|---|---|
| No `useEffect`-driven fetches (good); React Query dedupes identical keys, but extra subscribers and double-mounted trees multiply subscriptions | `useLearning.js:6,62` consumed by `CourseSidebar.jsx:14-15`, `LearningRoadmap.jsx:19-22`, `useLessonNavigation.js:8` | Confirmed |
| `["active-subscription"]` consumed by several components, some mounted twice | `subscriptions/hooks/useSubscriptions.js:5` → `UnlockAccessButton.jsx:10`, `SubscriptionContainer.jsx:7`, `PricingSection.jsx:56` | Confirmed |
| `["review-me"]` consumed by both always-mounted menus | `reviews/hooks/useReviews.js:52` → `DesktopMenu.jsx:20`, `MobileMenuContent.jsx:15` | Confirmed |
| 401 handling clears the **entire** cache, forcing every active query to refetch | `lib/apiClient.js:34` (`queryClient.clear()`) | Confirmed |
| Logout removes **all** non-`me` queries | `app/providers/AuthProvider.jsx:21` | Confirmed |
| Paginated/filtered queries have no `placeholderData`, so page/filter changes blank to a spinner | `catalog/hooks/useCourses.js:7-13`, `reviews/hooks/useReviews.js:7-16` | Confirmed |

#### 2.1.3 Poor caching

Global defaults — `lib/queryClient.js:3-11`: `staleTime` 60 s, `gcTime` 5 min, `retry` 1,
`refetchOnWindowFocus: false`.

| Finding | Evidence | Class |
|---|---|---|
| 60 s `staleTime` is short for mostly-static data; every route remount after 60 s refetches | `lib/queryClient.js:6` | Confirmed |
| Only one per-query override exists (`["me"]`, 5 min) | `auth/hooks/useAuthQueries.js:16` | Confirmed |
| Static catalog/curriculum/subscription queries inherit the 60 s default | `catalog/hooks/useCategories.js:5`, `catalog/hooks/useCourses.js:18,27,35`, `learning/hooks/useLearning.js` (all), `learning/hooks/useLessons.js:7,16,25`, `subscriptions/hooks/useSubscriptions.js:7,15` | Confirmed |
| No cache persistence → full refetch on hard reload | `package.json` (no `query-persist-client`) | Confirmed |

#### 2.1.4 Large component trees

Largest `.jsx` files: `catalog/.../LearningRoadmap.jsx` (282), `catalog/.../Sidebar.jsx` (234),
`auth/.../OtpStep.jsx` (214), `components/common/Pagination.jsx` (184),
`learning/.../CourseSidebar.jsx` (168), `subscriptions/.../PricingCard.jsx` (167).

Deeply nested / monolithic: `LearningRoadmap.jsx:141-215` (modules → lessons with nested
conditionals), `CourseSidebar.jsx` (search + filters + derived maps + two effects + list),
`CourseLearningScreen.jsx:23-72` (near-duplicate mobile/desktop blocks).

#### 2.1.5 Large lists

| List | Evidence | Bounding | Class |
|---|---|---|---|
| Recently viewed (full page) | `dashboard/pages/RecentViewDashboard.jsx:4` renders `<RecentlyViewed />` with **no limit** | None | Confirmed |
| Certificates | `dashboard/components/CertificationSection.jsx:22` | None | Confirmed |
| Curriculum modules/lessons | `catalog/.../LearningRoadmap.jsx:141-215`, `learning/.../CourseSidebar.jsx:155-164` | Collapsed modules only; no windowing | Likely |
| Courses (catalog) | `catalog/.../SearchResult.jsx:32-34` | Server pagination ✅ | Confirmed |
| Reviews | `reviews/.../StudentFeedback.jsx:121-125` | `useInfiniteQuery` 5/page ✅ | Confirmed |
| Dashboard course grids | `dashboard/components/CourseGridSection.jsx:23-35` | Pagination ✅ | Confirmed |
| Index keys used instead of stable IDs | `SearchResult.jsx:33`, `LearningRoadmap.jsx:185`, `LearningObjective.jsx:19`, `PricingCard.jsx:111`, `home/Feature.jsx:30`, `home/Guide.jsx:17`, `common/Footer.jsx:14,20,47`, `settings/.../PasswordContainer.jsx:118`, `pages/NotFoundPage.jsx:37-39` | — | Confirmed |

No virtualization library is present (`package.json`); adding one is a non-goal.

#### 2.1.6 Unnecessary state updates

| Finding | Evidence | Class |
|---|---|---|
| `currentPage` derived from URL into local state and never re-synced → stale page when filters clear `page` | `components/common/Pagination.jsx:13-15` | Confirmed |
| Server profile mirrored into `user` + `draft` state; background refetch overwrites edits | `settings/components/UserProfile.jsx:35-48` | Confirmed |
| `setExpandedSections` driven by search/filter via effect | `catalog/.../LearningRoadmap.jsx:85-91` | Confirmed |
| `setExpandedModuleIds` + active-lesson expansion via effects | `learning/.../CourseSidebar.jsx:83-101` | Confirmed |
| URL param writes from local state depending on the `searchParams` object | `catalog/.../SearchHeader.jsx:20-27` | Confirmed |
| Three cascading effects for the reset flow | `auth/pages/ResetPasswordFlow.jsx:15-37` | Confirmed |
| Unthrottled `scroll` listener sets state on every event | `hooks/useScrollEffect.js:9-15` | Confirmed |
| Unthrottled `resize` listener sets state on every event | `layouts/LearningLayout.jsx:13-25` | Confirmed |
| Avatar preview `URL.createObjectURL` never revoked | `settings/components/ProfileHeader.jsx:21` | Confirmed |

#### 2.1.7 Large bundles

| Finding | Evidence | Class |
|---|---|---|
| `ReactQueryDevtools` imported and rendered **unconditionally** (devDependency in the prod graph) | `main.jsx:2,14` | Confirmed |
| No `build.rollupOptions.output.manualChunks`; one default vendor chunk; Swiper pulled into the dashboard chunk | `vite.config.js` (13 lines) | Confirmed |
| Swiper + 4 CSS imports + modules imported eagerly by dashboard components | `dashboard/components/SwiperWrapper.jsx:2-10`, `PopularCourses.jsx:3`, `RecommendedSection.jsx:3` | Confirmed |
| `react-toastify` CSS imported in both eager layouts | `layouts/AppLayout.jsx:3`, `layouts/LearningLayout.jsx:4` | Confirmed |
| Global `* { @apply transition-all duration-300 }` on every element | `index.css:4-6` | Confirmed |
| Route-level `React.lazy` already in place for all pages | `app/router.jsx:10-55` | ✅ |
| No barrel files; lucide named imports are tree-shakeable; no second icon library | `frontend/src/**` | ✅ |

#### 2.1.8 Unnecessary dependencies

| Finding | Evidence | Class |
|---|---|---|
| `@tanstack/react-query-devtools` is a devDependency but imported at runtime | `package.json:29`, `main.jsx:2` | Confirmed |
| `@tailwindcss/vite` + `tailwindcss` are build-time only but listed under `dependencies` | `package.json:14,24` | Confirmed |
| No unused runtime dependency found; no moment/lodash/axios/chart libs; one icon library | `package.json` | ✅ |

---

## 3. Rules

- Measure before optimizing.
- Use server-state caching where appropriate.
- Avoid unnecessary global state.
- Use pagination or virtualization for large lists when needed.
- Avoid premature optimization.

Project guardrails:

- Learner app only; `admin/` is untouched.
- No new frameworks, state managers, UI kits, ORMs, or dependencies (including virtualization
  libraries — bound lists with the existing `Pagination` and collapse-by-default rendering).
- Preserve route paths, the `{ success, statusCode, message, data }` consumption, and user-visible
  behavior except where a change is explicitly scoped and verified.
- Do not introduce caching without an invalidation strategy; keep invalidating query keys after
  mutations.
- Revert a change that does not measurably improve its target metric.
- Run `npm run lint` and `npm run build` in `frontend/` for every change.

---

## 4. Baseline

Record before optimizing (FP-1) and again at FP-14.

| Metric | How to capture | Page / hook |
|---|---|---|
| Bundle KB (initial JS) | `npm run build` output | `frontend` |
| Per-route chunk KB | `npm run build` output | catalog / learning / dashboard |
| Requests per session | React Query Devtools network tab | home, catalog list, course detail, learning, dashboard |
| Duplicate in-flight requests | React Query Devtools | course learning |
| Render counts / commits | React DevTools Profiler | catalog list, learning, dashboard |
| Filter/page refetch behavior | Devtools + Network | catalog list (`useCourses`) |

Seed/behavior notes: catalog pagination and dashboard volume are the primary risk areas; measure
with a realistic number of courses/reviews where possible.

### 4.1 FP-1 recorded baseline (2026-09-15, `npm run build`)

| Chunk | Size | gzip |
|---|---|---|
| `index-*.js` (initial / vendor + devtools) | 353.92 kB | 109.04 kB |
| `external-*.js` (Swiper) | 159.86 kB | 35.22 kB |
| `zod-*.js` | 136.43 kB | 39.37 kB |
| `HomeDashboard-*.js` | 107.20 kB | 32.88 kB |
| `index-*.css` | 205.68 kB | 27.35 kB |
| `CourseDetailScreen-*.js` | 23.93 kB | 6.86 kB |
| `LessonContent-*.js` | 23.03 kB | 8.93 kB |
| `UserSetting-*.js` | 21.59 kB | 6.26 kB |
| `CourseScreen-*.js` | 12.77 kB | 3.91 kB |
| `CourseLearningScreen-*.js` | 12.35 kB | 3.97 kB |

Baseline lint: `npm run lint` → **8 errors, 0 warnings** (all `react-hooks/set-state-in-effect`:
`OtpStep.jsx:105`, `ResetPasswordFlow.jsx:19,35`, `LearningRoadmap.jsx:87`, `CourseSidebar.jsx:86,97`,
`StudentFeedback.jsx:56`, `UserProfile.jsx:46`). FP-7 targets several of these.

Request-count and render-count metrics require an interactive browser session (React Query Devtools /
React DevTools Profiler); no automated capture is available in this environment, so they are recorded
manually when a session is run. Bundle and lint metrics are captured automatically.

### 4.2 FP-14 after metrics (2026-09-15, `npm run build`)

| Chunk | Before | After |
|---|---|---|
| Initial `index-*.js` | 353.92 kB | **82.01 kB** |
| `react-vendor-*.js` (new) | — | 230.20 kB |
| `query-*.js` (new) | — | 36.48 kB |
| `icons-*.js` (new) | — | 16.94 kB |
| `swiper-*.js` | 159.86 kB (`external`) | 97.27 kB |
| `zod-*.js` | 136.43 kB | 136.43 kB |
| `external-*.js` | 159.86 kB | 159.86 kB |
| `index-*.css` | 205.68 kB | 205.73 kB |

- `ReactQueryDevtools` is no longer referenced in `dist/` (was rendered unconditionally).
- Initial JS is split into `index` + `react-vendor` + `query` + `icons`; Swiper is isolated and only
  loads with dashboard routes.
- `npm run lint` → **0 errors, 0 warnings** (was 8 errors), because the FP-7 effect cascades were
  fixed.

Request/render-count after metrics remain to be captured manually in a browser session.

---

## 5. Prioritized Opportunities

Ordered by impact / risk. Each maps to a task in
[`../../09-implement/tasks/frontend-performance.md`](../../09-implement/tasks/frontend-performance.md).

1. Gate `ReactQueryDevtools` (FP-11) — immediate prod-bundle win.
2. Memoize context values + split auth read/action (FP-5).
3. Raise `staleTime` defaults + per-query overrides + `keepPreviousData` (FP-2).
4. Memoize list items and stabilize callbacks (FP-6).
5. Fix derived-state/effect cascades (FP-7).
6. Throttle global listeners (FP-8).
7. Remove duplicate mounted query trees (FP-4).
8. Bound large lists (FP-9) + stable keys (FP-10).
9. Narrow 401/logout cache clearing + `enabled` guards (FP-3).
10. Bundle chunking + dependency hygiene (FP-12) and global transition scoping (FP-13).

---

## 6. Verification

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

1. Record the before metric (FP-1).
2. Apply the change.
3. `npm run lint` and `npm run build` in `frontend/`.
4. Smoke-test the affected flow against the API.
5. Re-measure with the same method and record the after metric.
6. Revert if the target metric does not improve.

---

## 7. Non-Goals

- Admin dashboard (`admin/`) performance.
- Backend performance (tracked in [`../backend/05-performance.md`](../backend/05-performance.md)).
- Adding a virtualization library or any new dependency.
- Rewriting the component architecture (owned by
  [`03-components.md`](./03-components.md)).

---

## 8. Definition of Done

- Context values are memoized; auth read-state and actions are separated.
- Default and per-query caching reflect data volatility; paginated/filtered lists keep previous data.
- 401/logout cache clearing is scoped to user data.
- Duplicate mounted query trees are removed.
- Derived-state/effect cascades are fixed; global listeners are throttled.
- Large lists are bounded with the existing primitives; list keys are stable IDs.
- `ReactQueryDevtools` is development-only; vendor/swiper/lucide are split into chunks; build-only
  dependencies are `devDependencies`.
- Global `transition-all` is scoped to interactive elements.
- `npm run lint` and `npm run build` pass in `frontend/` (baseline lint errors may remain but no new
  ones).
- Existing flows behave the same; FP-1 metrics re-measured at FP-14.

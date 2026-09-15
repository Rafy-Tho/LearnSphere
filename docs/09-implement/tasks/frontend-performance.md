# Frontend Performance (Learner App)

Reduce unnecessary renders, API requests, and initial load time, and keep large lists responsive in
the learner app. Standard: [`../../08-refactoring/frontend/04-performance.md`](../../08-refactoring/frontend/04-performance.md);
architecture: [`../../08-refactoring/frontend/01-architecture.md`](../../08-refactoring/frontend/01-architecture.md);
components: [`../../08-refactoring/frontend/03-components.md`](../../08-refactoring/frontend/03-components.md).
**Admin is out of scope.**

> **Status:** ✅ Done. All `FP-1…FP-14` implemented; `npm run build` passes, initial `index` chunk
> dropped 353.92 kB → 82.01 kB, and `npm run lint` is **0 errors / 0 warnings** (was 8 baseline
> `react-hooks/set-state-in-effect` errors). After metrics: [`04-performance.md`](../../08-refactoring/frontend/04-performance.md) §4.2.
> **Status legend:** ⬜ Not started · 🟡 In progress · ✅ Done · ⛔ Blocked · ⏭️ Deferred

## Tasks

| # | Task | Phase | Status | Notes |
|---|---|---|---|---|
| FP-1 | Baseline measurements | Measure | ✅ | `npm run build` chunk sizes + `npm run lint` recorded in `04-performance.md` §4.1 (index 353.92 kB; 8 lint errors). Request/render counts need a browser session. |
| FP-2 | Caching defaults + `keepPreviousData` | Caching | ✅ | `lib/queryClient.js` default `staleTime` 60 s → 5 min, `gcTime` → 30 min; 10-min overrides for static catalog/curriculum/lesson/certificate/plan hooks; 30-min for categories; `placeholderData: keepPreviousData` on `useCourses` + `useReviews`. |
| FP-3 | Scope cache clearing + `enabled` guards | Caching | ✅ | Added `clearUserQueries()` (user-scoped key allowlist) in `lib/queryClient.js`; `apiClient` 401 and `AuthProvider.clearAuth` use it instead of clearing the whole cache. Added `enabled: !!user` to profile/xp/dashboard/certificates/my-review queries. |
| FP-4 | Remove duplicate mounted query trees | Requests | ✅ | `CourseLearningScreen` rendered `CourseSidebar` and `<Outlet>` twice (mobile+desktop) — now one per breakpoint via `hooks/useMediaQuery.js`. `LearningNavigation` renders either Desktop or Mobile menu, not both. |
| FP-5 | Memoize context values | Renders | ✅ | `useMemo` for `AuthProvider` value, new `AuthActionsContext` (actions split from read-state), `ThemeProvider` value, and `LearningLayout` `<Outlet context>`. |
| FP-6 | Memo list items + stable callbacks | Renders | ✅ | `memo`: `CourseCard`, `CourseCardDetailed`, `ReviewCard`, `PricingCard`, `CourseCardGrid`, `CourseGridSection`, `ModuleGroup`. `useCallback`: `CourseSidebar.toggle`, `Sidebar` handlers, `UserProfile.field/update`, `useAuthMutations.logout`, `CourseDetailScreen.scrollToSection`, `CourseLearningScreen.closeSidebar`; dashboard section icons hoisted. |
| FP-7 | Fix derived-state/effect cascades | State | ✅ | `Pagination` derives page from URL; `UserProfile` derives server data (no mirror state); `LearningRoadmap`/`CourseSidebar`/`SearchHeader`/`StudentFeedback` expand/filter in handlers or derived values; `ResetPasswordFlow` lazy-init + derived step; `OtpStep` lazy timer init. `ProfileHeader` revokes avatar object URLs. |
| FP-8 | Throttle global listeners | State | ✅ | `useScrollEffect` uses `requestAnimationFrame` + passive listener; `LearningLayout` resize debounced with rAF. |
| FP-9 | Bound large lists | Lists | ✅ | `RecentlyViewed` client-paginates the full-page case (8/page via `Pagination`); `CertificationSection` shows 6 with "Show all"; curriculum is collapsed by default. No new deps. |
| FP-10 | Stable list keys | Lists | ✅ | Replaced index keys with IDs/stable fields in `SearchResult`, `LearningRoadmap` lessons, `LearningObjective`, `PricingCard`, `Feature`, `Guide`, `Footer`. |
| FP-11 | Gate `ReactQueryDevtools` | Bundle | ✅ | `main.jsx` lazily imports/renders devtools only when `import.meta.env.DEV`; verified absent from `dist/`. |
| FP-12 | Bundle chunking + dep hygiene | Bundle | ✅ | `vite.config.js` `manualChunks` (react-vendor, query, icons, swiper) + `chunkSizeWarningLimit`; `@tailwindcss/vite`/`tailwindcss` moved to `devDependencies`. |
| FP-13 | Scope global `transition-all` | CSS | ✅ | `index.css` global `* { transition-all }` replaced with a zero-specificity `:where(a, button, input, select, textarea, [role="button"])` rule so explicit utility transitions still win. |
| FP-14 | Verification | Verify | ✅ | `npm run lint` 0/0; `npm run build` passes; after metrics recorded (`04-performance.md` §4.2). Initial `index` 353.92 → 82.01 kB. |

## Acceptance Criteria

- Context values are memoized; auth read-state and actions are separated. ✅
- Caching reflects data volatility; paginated/filtered lists keep previous data. ✅
- 401/logout cache clearing is scoped to user data. ✅
- Duplicate mounted query trees are removed. ✅
- Derived-state/effect cascades are fixed; global listeners are throttled. ✅
- Large lists are bounded with existing primitives; list keys are stable IDs. ✅
- `ReactQueryDevtools` is development-only; vendor/swiper/lucide are split; build-only deps are
  `devDependencies`. ✅
- Global `transition-all` is scoped. ✅
- `npm run lint` (0 errors / 0 warnings) and `npm run build` pass in `frontend/`. ✅
- Existing flows behave the same; FP-1 metrics re-measured at FP-14. ✅

## Notes / Residuals

- **Browser metrics:** request-count and render-count deltas still require a manual React Query
  Devtools / React DevTools Profiler session; only bundle + lint metrics are captured automatically.
- **`Navigation` (public navbar)** still mounts `Desktop`/`Menu`/`Mobile`/`Avatar` together (CSS
  visibility). They are cheap presentational components with no queries, so they were left as-is.
- **Static decorative lists** (`PasswordContainer` strength bars, `NotFoundPage` dots) keep numeric
  keys; they are fixed-length, non-data lists where a key has no identity.
- **`external-*.js` (159.86 kB)** is an existing shared app/vendor chunk, unchanged by this work.
- No new dependencies, frameworks, state managers, or UI kits. Admin untouched.

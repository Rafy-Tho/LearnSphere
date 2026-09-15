# Frontend Audit (Learner `frontend/` + `admin/`)

Read-only audit of both React SPAs. Evidence cited as `file:line`. Severity tags: **Confirmed**, **Likely**, **Possible**.

**Companion docs:** [`codebase-audit.md`](./codebase-audit.md), [`backend-audit.md`](./backend-audit.md).

---

## 1. Folder Structure

### Learner (`frontend/src`)
```
api/ services/ contexts/ hooks/{queries,mutations,auth,course,user,subscription}
pages/ components/{navbar,learningNavbar,home,LearningDashBoard,course,courseDetail,
courseLearning,courseLearning/quiz,courseReview,pricing,setting,form,resetPasswordForm,
redirectRoutes,ui,features/dashboard} ui/ constants/ utils/ helper/ css/ socialSvg/ assets/
```

### Admin (`admin/src`)
```
services/ contexts/ hooks/{auth,category,course,course-details,dashboard-data,chapters,
modules,lessons,contents,objectives,options,questions,subscription,user}
pages/ components/{courseDetail,subscriptions,ui} libs/ utils/ assets/
```

**Findings (Confirmed):**
- Two parallel `ui` folders in frontend: `src/ui/` (used) and `src/components/ui/` (only dead `AsyncBoundary`, `ErrorBoundary`).
- Naming typos/inconsistencies: `course/Siderbar.jsx`, `ThemSelector.jsx`, `LearningDashBoard/`, `socialSvg/`.
- Admin uses kebab-case hook folders; frontend uses camelCase.
- `frontend/src/utils/*` and `admin/src/utils/*` are **byte-identical** (6 files: `formatCapitalize`, `formatMinutes`, `formatTimeAgo`, `parseQueryToObject`, `parseQueryToString`, `truncateText`).
- `admin/src/libs/utils.js` exports `cn`, but `components/ui/chart.jsx:4` and `toggle.jsx:5` import `@/lib/utils` — **no `@` alias configured** and `chart.jsx` imports `recharts` which is **not in `package.json`** (latent build break; both files unused today).

---

## 2. Routing

| Finding | Evidence | Severity |
|---|---|---|
| Guards correct but only check truthiness of localStorage-derived `user`; no loading state inside guards | `IsAuthenticate.jsx:4-9`, `ProtectRoute.jsx:4-9`, `admin/App.jsx:24-54` | Confirmed |
| Admin guard does **not** check `user.role === "ADMIN"` | `admin/src/App.jsx:24-26` | Likely |
| No route-level code splitting (`React.lazy`/`Suspense` absent) | `frontend/App.jsx:1-26`, `admin/App.jsx:12-20` | Confirmed |
| Protected routes split across three `<Route element={<ProtectRoute/>}>` blocks | `frontend/App.jsx:42-72` | Confirmed |
| Dead alternate dashboard layout duplicating page composition | `components/features/dashboard/DashboardLayout.jsx` vs `pages/LearningDashboard.jsx:11-13` | Confirmed |

---

## 3. Components & Pages

### Oversized / mixed-responsibility (Confirmed)
| Component | Lines | Issues |
|---|---|---|
| `frontend/components/courseDetail/LearningRoadMap.jsx` | ~300 | search, expand/collapse, filtering, progress mutation, certificate claim, render |
| `frontend/components/course/Siderbar.jsx` | ~240 | URL-param state machine + filters + local subcomponents |
| `admin/pages/CoursesPage.jsx` | ~472 | table, modal, CRUD, pagination, delete |
| `admin/pages/ProfilePage.jsx` | ~278 | profile + password + context refresh |
| `admin/pages/UsersPage.jsx` | ~267 | table, modal, CRUD, pagination |
| `admin/components/ui/sidebar.jsx` / `skeleton.jsx` | ~22KB / ~14KB | large generated primitives |

### Duplication (Confirmed)
- Two near-identical `DeleteConfirmDialog` in admin (`components/courseDetail/`, `components/subscriptions/`).
- `use-toast` duplicated (implementation + re-export shim) with mixed import paths (`admin/pages/LoginPage.jsx:16`, `CoursesPage.jsx:35`, `ProfilePage.jsx:18`).
- `useIsMobile` in both apps; frontend's is dead (`frontend/src/hooks/useMobile.js`).

### Data fetching in components (Confirmed, style)
Components don't call `fetch` (good) but own query orchestration, e.g. `courseDetail/HeroSection.jsx:14-17`, `courseLearning/CourseSidebar.jsx:14-15`, `courseReview/StudentFeedback.jsx:21-28`. No container/presenter separation.

### Page logic that belongs in hooks (Confirmed)
Admin pages use a repeated local-mirror + `useEffect` pattern: `CoursesPage.jsx:50-262`, `CategoriesPage.jsx:18-145`, `UsersPage.jsx:34-98`. Frontend `ResetPasswordFlow.jsx:9-47` holds the step machine inline.

---

## 4. Hooks

| Finding | Evidence | Severity |
|---|---|---|
| Re-export shim tree (`hooks/course|auth|user|subscription`) duplicates canonical `hooks/queries`+`hooks/mutations`; two names per hook | `hooks/course/useGetCourses.js:1-2`, `hooks/user/useGetMe.js:1-2` | Confirmed |
| `hooks/queries/useReviews.js` exports `useCategories` (misnamed) | `useReviews.js:4-8` | Confirmed |
| Admin option/question hook files named `use-create-content.js` but export `useCreateOption`/`useCreateQuestion` | `admin/hooks/options/use-create-content.js:4`, `admin/hooks/questions/*` | Confirmed |
| `useMyReview` key omits `courseId` though `queryFn` uses it → stale cross-course data | `useCourses.js:117-124` | Confirmed |
| `useSubscriptionDetails` key omits id and reads `window.location.search` (non-reactive) | `useSubscriptions.js:14-22` | Confirmed |
| `useCertificate` key collides semantically with `useCertificateById` | `useCourses.js:161-168` vs `:196-201` | Confirmed |
| Admin subscription hooks invalidate `["subscriptions"]` but live hooks use `["admin-user-subscriptions"]` | `admin/hooks/subscription/use-*-subscription.js` vs `use-subscription.js:20,28` | Confirmed |
| Missing `enabled: !!user` on several user-scoped queries | `useCourses.js:126-194`, `useUsers.js:4-11`, `admin/hooks/user/useGetUsers.js:11` | Possible |
| `useCreateReview` invalidates only `["review-me"]` (not list/summary) | `useCourseMutations.js:50` | Likely |

---

## 5. API Layer

| Finding | Evidence | Severity |
|---|---|---|
| Two incompatible clients: frontend class returns `result.data` + unwraps pagination; admin services return the full envelope and re-implement `fetch` ~12× | `frontend/src/api/client.js:3-72` vs `admin/src/services/*` | Confirmed |
| Admin has **no 401 handling** (frontend clears storage + redirects) | `client.js:25-31`; admin services | Confirmed |
| No request cancellation (`AbortController`/`signal`) anywhere | `client.js:20`, all admin services | Confirmed |
| Base URL not normalized; `?` always appended → `/courses?` when empty | `frontend/src/api/courses.js:4` | Possible |
| Retry policy not centralized (only `useGetMe` sets `retry:false`) | `useAuth.js:27`, `admin/hooks/user/useGetMe.js:8` | Confirmed |

---

## 6. State & Server-State Management

| Finding | Evidence | Severity |
|---|---|---|
| Frontend auth has three sources of truth: context state, localStorage, and `["me"]` cache | `AuthContext.jsx:9-20`, `hooks/queries/useAuth.js:4-11` | Confirmed |
| Stale localStorage auth never cleared when server returns `data:null` (user stays "logged in") | `AuthContext.jsx:31-35`, `useAuth.js:23` | Likely |
| Admin auth sets local state but never updates `["me"]`; `useGetMe` always enabled | `admin/contexts/AuthContext.jsx:9,13,25-30` | Confirmed |
| Admin theme has three mechanisms (App effect, `use-theme.js`, `next-themes` in sonner) both writing `localStorage.theme` | `admin/App.jsx:72-79`, `admin/hooks/use-theme.js:3-25`, `admin/components/ui/sonner.jsx:1` | Confirmed |
| No `QueryClient` defaults in either app → `staleTime:0`, `refetchOnWindowFocus:true`, `retry:3` | `frontend/main.jsx:10`, `admin/App.jsx:22` | Confirmed |
| Query-key inconsistency (no key factory) | `admin/hooks/user/useGetUsers.js:12`, `use-get-dashboard-data.js:8`, `use-get-courses.js:13` | Confirmed |
| Large payloads fetched then sliced client-side (no pagination params) | `useCourses.js:126-194`, `RecentlyViewed.jsx:28`, `CertificationSection.jsx:20`; admin `SubscriptionsPage.jsx:23-27` | Likely |

---

## 7. Forms & Validation

| Finding | Evidence | Severity |
|---|---|---|
| RHF+zod only in frontend (Login/Signup/Reset/Report); admin forms all manual `useState` | `frontend/pages/Login.jsx:3-35`, `Signup.jsx:1-37`; admin pages | Confirmed |
| Admin ships `react-hook-form`, `@hookform/resolvers`, `components/ui/form.jsx` but never uses them | `admin/package.json`, `admin/components/ui/form.jsx` | Confirmed |
| Duplicated/adhoc validation in frontend settings vs zod schemas; password rules differ (6 vs 8) | `setting/PasswordContainer.jsx:17-49`, `setting/UserProfile.jsx:54-70`; `Login.jsx:16`, `Signup.jsx:17` | Confirmed |
| `PaymentSuccess` crashes when `session_id` absent and reads wrong query param | `PaymentSuccess.jsx:7-19`, `useSubscriptions.js:15-16` | Likely |

---

## 8. Authentication / Authorization UI

- Stale local auth (see §6), admin role guard gap (§2), admin 401 gap (§5).
- `client.js` mutates `localStorage` directly on 401 rather than through `AuthContext`, so in-memory `user` persists until reload (`client.js:25-31`). **Likely**.

---

## 9. Loading / Error / Empty States

| Finding | Evidence | Severity |
|---|---|---|
| Inconsistent patterns: frontend uses `SpinnerLoader`/`ErrorMessage`; admin uses skeletons | `courseDetail/HeroSection.jsx:26-27`; `admin/pages/CoursesPage.jsx:268`, `DashboardPage.jsx:15` | Confirmed |
| Silent `null` loading hides sections; no error state | `CertificationSection.jsx:8`, `ActivitySection.jsx:19`, `RecommendedSection.jsx:31-33` | Confirmed |
| Missing empty states | `PopularCourses.jsx:23`, `RecommendedSection` | Confirmed |

---

## 10. Duplicated Logic (cross-app)

- `utils/*` identical across apps (§1).
- Admin `DeleteConfirmDialog` ×2; theme logic ×2; `use-toast` ×2.
- `useIsMobile` duplicated (frontend one dead).
- Pagination components differ by framework (not true duplication).

---

## 11. Unnecessary Re-renders

| Finding | Evidence | Severity |
|---|---|---|
| Context value objects not memoized; admin `login`/`logout` recreated each render | `frontend/contexts/AuthContext.jsx:43-45`, `ThemeContext.jsx:28`, `admin/contexts/AuthContext.jsx:32,13,15` | Confirmed |
| `useOutletContext` inline object recreated each render | `frontend/components/LearningLayout.jsx:49-51` | Confirmed |
| Inline `columns`/handlers in list renders | `admin/pages/CoursesPage.jsx:183-257`, `frontend/components/course/Siderbar.jsx:140-203` | Confirmed |

---

## 12. Unnecessary API Requests

| Finding | Evidence | Severity |
|---|---|---|
| Default `refetchOnWindowFocus:true` on all queries | `main.jsx:10`, `App.jsx:22` | Confirmed |
| Local-mirror `useEffect` causes fetch + mirror + double optimistic updates | `admin/pages/CoursesPage.jsx:258-262,113-122` | Confirmed |
| Missing `enabled` guards on user queries | see §4 | Possible |
| No pagination on dashboard/list queries → large payloads | see §6 | Likely |

---

## 13. Caching

- No `QueryClient` defaults (`staleTime`, `gcTime`, retry) — Confirmed.
- localStorage caches `user`/`isAuthenticated` and `theme` with no versioning/expiry; combined with §6 stale-auth risk — Likely.

---

## 14. Bundle / Performance

| Finding | Evidence | Severity |
|---|---|---|
| No route-level code splitting (`React.lazy` absent) | `frontend/App.jsx`, `admin/App.jsx` | Confirmed |
| Font Awesome 6.5 full CSS from CDN for ~8 glyphs; project already uses lucide-react | `frontend/index.html:7-10`, icon usages | Confirmed |
| Dead asset `frontend/src/assets/profile.jpg` (2,083,249 bytes), never imported | `frontend/src/assets/` | Confirmed |
| `date-fns` used by exactly one helper in each app | `utils/formatTimeAgo.js:2` | Confirmed |
| `swiper` used in only two dashboard sections | `SwiperWrapper.jsx`, `PopularCourses.jsx`, `RecommendedSection.jsx` | Possible |
| Admin ships ~23 unused `components/ui/*` pulling many Radix deps | see §18 | Confirmed |

---

## 15. Dead Code

### Frontend (verified zero references)
`components/features/dashboard/DashboardLayout.jsx`, `components/ui/AsyncBoundary.jsx`, `components/ui/ErrorBoundary.jsx`, `ui/FullScreenSkeletonLoader.jsx`, `hooks/user/useGetMe.js`, `hooks/useClickOuteSideTwo.js`, `hooks/useMobile.js`, `helper/OpenCloseMediaQuery.jsx`.

### Admin
- 23 unused `components/ui/*`: `accordion`, `aspect-ratio`, `breadcrumb`, `calendar`, `carousel`, `chart`, `checkbox`, `command`, `context-menu`, `drawer`, `dropdown-menu`, `form`, `hover-card`, `input-otp`, `menubar`, `navigation-menu`, `popover`, `progress`, `radio-group`, `resizable`, `scroll-area`, `slider`, `toggle-group`.
- Unused hooks: `hooks/subscription/use-create-subscription.js`, `use-delete-subscription.js`, `use-update-subscription.js`.
- Unused utils: `formatCapitalize`, `formatMinutes`, `formatTimeAgo`, `truncateText`.

---

## 16. Dependency Usage

| App | Package | Status |
|---|---|---|
| frontend | `@react-oauth/google` | **Unused** (zero imports) |
| frontend | `@tanstack/react-query-devtools` | Used but in `dependencies` (should be dev) |
| frontend | `date-fns` | One usage |
| admin | 23 Radix/UI packages | Only referenced by unused UI files |
| admin | `recharts` | Imported by unused `chart.jsx` but **not declared** |
| admin | `next-themes` | Only in unused-ish `sonner.jsx`; actual toggle uses `use-theme.js` |
| admin | `react-hook-form` + `@hookform/resolvers` | Effectively unused |
| admin | `@tanstack/react-query-devtools` | Prod dep though dev tool |
| both | `@types/react`, `@types/react-dom` | Dev-only; harmless in JS project |

---

## 17. Maintainability

| Finding | Evidence | Severity |
|---|---|---|
| No TypeScript; `jsconfig.json` without `checkJs` | both apps | Confirmed |
| No tests / no test script | both `package.json` | Confirmed |
| File-naming inconsistency; duplicate filenames across apps with different implementations | both apps | Confirmed |
| Debug leftovers: `console.log` | `courseDetail/LearningRoadMap.jsx:105`, `courseLearning/CourseRating.jsx:29` | Confirmed |
| `package.json` name collision (both `"frontend"`) | both apps | Confirmed |

---

## 18. Findings by Severity

### Likely / high-impact
- Stale localStorage auth never cleared (`AuthContext.jsx:31-35`, `useAuth.js:23`).
- `PaymentSuccess` crash + param mismatch (`PaymentSuccess.jsx:12`).
- No `QueryClient` defaults → refetch storms.
- Admin no 401 handling + no role guard.
- Query-key bugs (`useMyReview`, `useSubscriptionDetails`, unused subscription hooks).
- `useCreateReview` doesn't invalidate list/summary.

### Confirmed / medium
- No code splitting; Font Awesome CDN; `date-fns` for one helper.
- ~32 dead files + unused deps.
- Duplicate utils/components/hooks; naming inconsistencies.
- Admin manual forms vs frontend RHF+zod.
- Two incompatible API clients; no cancellation; no retries policy.
- Missing loading/error/empty states.
- Context value churn / minor re-renders.

### Possible
- `enabled` guards; swiper replacement; base URL `?` handling.

---

## 19. Recommended Frontend Sequencing

1. Fix stale auth + `PaymentSuccess` + admin role/401 handling.
2. Add `QueryClient` defaults and fix query keys/invalidation.
3. Split routes (lazy) and remove Font Awesome/`date-fns`/dead assets.
4. Unify the API client in admin; add request cancellation.
5. Remove dead code/deps; consolidate duplicate utils/components.
6. Adopt a key factory, RHF in admin (or remove dead deps), and standardize states.
7. Add tests + JSDoc/typing incrementally.

See `codebase-audit.md` §5 for the full phased roadmap.

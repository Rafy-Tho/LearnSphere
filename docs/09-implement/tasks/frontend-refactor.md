# Frontend Refactor (Learner App)

Migrate `frontend/` to the feature-based architecture. Target: [`../../08-refactoring/frontend/01-architecture.md`](../../08-refactoring/frontend/01-architecture.md); plan: [`../../08-refactoring/frontend/02-migration-plan.md`](../../08-refactoring/frontend/02-migration-plan.md). **Admin is out of scope.**

> **Status:** ✅ Done. All FE tasks implemented; `npm run build` passes and `npm run lint`
> is down to 8 pre-existing `react-hooks/set-state-in-effect` errors (baseline was 16
> errors / 5 warnings).
> **Status legend:** ⬜ Not started · 🟡 In progress · ✅ Done · ⛔ Blocked · ⏭️ Deferred

## Tasks

| # | Task | Phase | Status | Notes |
|---|---|---|---|---|
| FE-1 | `@` alias + target folder scaffold | Foundation | ✅ | Add `@`→`src` in `vite.config.js` + `jsconfig.json`; create `app/`, `features/`, `components/{ui,common}`, `layouts/`, `lib/`. |
| FE-2 | `lib/` infrastructure | Foundation | ✅ | Move `api/client.js` → `lib/api-client.js`; add `lib/query-client.js` (defaults: `staleTime`, `retry`, `refetchOnWindowFocus:false`) and `lib/auth-storage.js`. |
| FE-3 | `app/` setup | Foundation | ✅ | Move `App.jsx` → `app/`; split `router.jsx`, `providers.jsx`; move guards to `app/guards/` (`IsAuthenticate`→`RedirectIfAuthenticated`, `ProtectRoute`→`RequireAuth`); `main.jsx` uses providers. |
| FE-4 | UI primitives consolidation | Shared | ✅ | Move `src/ui/*` → `components/ui/`; delete dead `components/ui/{AsyncBoundary,ErrorBoundary}.jsx` and `ui/FullScreenSkeletonLoader.jsx`. |
| FE-5 | Shared components | Shared | ✅ | Move navbar/footer/pagination/rating/swiper/theme-selector/social/etc. and `socialSvg/*` → `components/common/`. |
| FE-6 | Layouts | Shared | ✅ | Move `AppLayout.jsx`, `LearningLayout.jsx` → `layouts/`. |
| FE-7 | Feature: auth | Features | ✅ | Login/Signup/ResetPasswordFlow + form/reset components, auth hooks/services/validation, auth guards. |
| FE-8 | Feature: catalog | Features | ✅ | Home, CourseScreen, CourseDetailScreen + home/course/courseDetail components, course/category hooks/services, filter constants. |
| FE-9 | Feature: learning | Features | ✅ | CourseLearningScreen + courseLearning/quiz components, lesson/progress/quiz hooks, lessons service, certificates. |
| FE-10 | Feature: reviews | Features | ✅ | courseReview components + review hooks/service/validation. |
| FE-11 | Feature: subscriptions | Features | ✅ | PricingScreen + pricing components, subscription hooks/service; fix `PaymentSuccess` crash/param (audit P1-12). |
| FE-12 | Feature: dashboard | Features | ✅ | LearningDashboard + 4 sub-dashboards + `LearningDashBoard/*` sections, dashboard hooks. |
| FE-13 | Feature: settings | Features | ✅ | UserSetting + setting components, user hooks/mutations/service. |
| FE-14 | Collapse hook shims + generic hooks | Fixes | ✅ | Delete `hooks/{auth,course,user,subscription}` re-export tree; move generic hooks (`useMenuState`, `useScrollEffect`, `useTheme`) to `hooks/`; delete dead `useMobile`, `useClickOuteSideTwo`. |
| FE-15 | Route-level code splitting | Fixes | ✅ | `React.lazy` + `Suspense` in `app/router.jsx`; fallback via `SpinnerLoader`. |
| FE-16 | Auth single source of truth | Fixes | ✅ | Remove stale localStorage auth (audit P1-11); context derives from `["me"]`; 401 clears via context/storage. |
| FE-17 | Query keys + invalidation | Fixes | ✅ | Key factory; fix `useMyReview` (missing `courseId`), `useSubscriptionDetails`, `useCertificate` collision, `useCreateReview` invalidation (audit P2-3). |
| FE-18 | Dead code, deps, assets | Fixes | ✅ | Remove verified dead files (audit §15), `@react-oauth/google`, `date-fns`, Font Awesome CDN, dead `profile.jpg`; move devtools to devDependencies. |
| FE-19 | Naming + states | Fixes | ✅ | Fix `Siderbar`→`Sidebar`, `ThemSelector`→`ThemeSelector`, `LearningDashBoard/`; remove `console.log`s; standardize loading/error/empty states. |
| FE-20 | Verification | Verify | ✅ | `npm run lint` + `npm run build` clean; smoke-test key flows; sync docs. |

## Acceptance Criteria

- No feature imports another feature's internals; cross-feature use goes through `components/`, `hooks/`, or a feature's public entry.
- One API client (`lib/api-client.js`); no `fetch` in components or feature services.
- No hook re-export shims; no dead files or unused deps.
- Routes are lazy-loaded; lint and build pass.
- Existing flows behave the same except FE-11/FE-16/FE-17 fixes.

## Notes

- Deferred until requested: admin app, tests, TypeScript/JSDoc typing, performance measurement.
- Payment changes (FE-11) require Stripe test-mode verification.

# Frontend Components (Learner App)

Consolidate and standardize the learner app's components. Standard:
[`../../08-refactoring/frontend/03-components.md`](../../08-refactoring/frontend/03-components.md);
architecture: [`../../08-refactoring/frontend/01-architecture.md`](../../08-refactoring/frontend/01-architecture.md);
plan: [`../../08-refactoring/frontend/02-migration-plan.md`](../../08-refactoring/frontend/02-migration-plan.md).
**Admin is out of scope.**

> **Status:** ✅ Done. All `FC-1…FC-16` implemented; `npm run build` passes and `npm run lint`
> is at the 8 pre-existing `react-hooks/set-state-in-effect` errors (baseline unchanged).
> Residuals (deliberately not changed) are listed in Notes.
> **Status legend:** ⬜ Not started · 🟡 In progress · ✅ Done · ⛔ Blocked · ⏭️ Deferred

## Tasks

| # | Task | Phase | Status | Notes |
|---|---|---|---|---|
| FC-1 | Publish component standard | Docs | ✅ | [`03-components.md`](../../08-refactoring/frontend/03-components.md): types, placement test, rules, conventions, state components, audit, mapping, DoD. |
| FC-2 | Add UI primitives | Primitives | ✅ | Added `components/ui/{Button,Modal,Card,Input,EmptyState,ProgressBar}.jsx` + `utils/cn.js` (no new deps). |
| FC-3 | Consolidate loading states | State | ✅ | Adopted `SpinnerLoader` in the three reset steps, `PricingCard`, settings `Subscription`, both layouts, and the `StudentFeedback` "See more" label; `sm` now uses a thinner border. |
| FC-4 | Consolidate error states | State | ✅ | Field validation errors now render via `Input` (FC-8); `CertificationSection` now surfaces query errors via `ErrorMessage`. |
| FC-5 | Consolidate empty states | State | ✅ | `EmptyState` adopted in `SearchResult`, `StudentFeedback`, `RecentlyViewed`, and the dashboard list/grid sections; `NotSummary` reimplemented on `EmptyState` (renamed `NoSummary`). |
| FC-6 | Consolidate modals/overlays | State | ✅ | `ConfirmDialog`, `ReportModal`, `CourseRating` rebuilt on `Modal` (portal, Esc, overlay, scroll lock). |
| FC-7 | Consolidate course cards | Domain | ✅ | `CourseCardProgress` + `CourseCardRecentReview` folded into `CourseCard` (`progress`, `lessonId`, `scrollToTop` props) and deleted. |
| FC-8 | Consolidate form inputs | Forms | ✅ | `Input` gained password toggle + `error`; auth `Email/Name/PasswordInput`, settings `InputField`/`PasswordField`, `EmailStep`, `PasswordStep` route through it; field errors via `Input`. |
| FC-9 | Consolidate progress bars | Domain | ✅ | Quiz `ProgressBar` and `RatingSummary` rebuilt on the `ProgressBar` primitive. |
| FC-10 | Decouple shared from feature/auth | Boundaries | ✅ | `Navigation`/`navbar/Avatar`/`navbar/Mobile` now take `user`/`onLogout` props from `AppLayout`; no auth hooks in `components/common/`. |
| FC-11 | Promote/demote misplaced components | Placement | ✅ | Demoted single-feature `SocialButtons`→auth, `SwiperWrapper`→dashboard, `StarRating`/`HalfStar`→learning, `CourseCardGrid`→catalog. |
| FC-12 | Move route pages out of `components/` | Placement | ✅ | `PaymentSuccess`/`PaymentCancel` → `subscriptions/pages/`; `LessonContent`/`Quiz` → `learning/pages/`; router updated. |
| FC-13 | Naming fixes | Naming | ✅ | `FilterTab`, `LearningRoadmap`, `InProgressDashboard`, `Facebook`, `LoginSignupButton`, `NoSummary` renamed (files + symbols + imports). |
| FC-14 | Extract inline components/data | Cleanup | ✅ | Centralized plan IDs (`constants/plans.js`) and `lessonIcons` (`constants/lessonIcons.js`); removed the duplicated definitions. |
| FC-15 | Dedupe dashboard pages/lists | Cleanup | ✅ | New `CourseGridSection` backs `InProgressDashboard`/`CompletedCourseDashboard`; `RecentViewDashboard` now reuses `RecentlyViewed`. |
| FC-16 | Verification | Verify | ✅ | `npm run lint` (8 baseline errors, 0 new) + `npm run build` pass after every task; no stale imports (grep clean). |

## Acceptance Criteria

- `components/ui/` holds the primitives; `components/common/` holds only genuinely shared
  components; feature code lives in features. ✅
- No reusable component imports a feature hook/service or calls `fetch`. ✅
- Loading/error/empty/confirm states use shared primitives. ✅
- Course cards, form fields, progress bars, and dashboard lists are consolidated. ✅
- Route pages are under `features/<feature>/pages/`. ✅
- Naming follows the standard; no new lint errors; build passes. ✅
- Existing flows behave the same. ✅ (visual standardization only)

## Notes / Residuals

- **Directories:** camelCase feature component dirs (`courseDetail`, `courseLearning`,
  `learningNavbar`, `resetPasswordForm`) were left as-is; renaming them is high-churn and
  cosmetic. The component standard §4 documents the target.
- **OtpStep** keeps its bespoke OTP input (centered/tracking styles) rather than `Input`, to
  avoid unreliable Tailwind class overrides without `tailwind-merge`.
- **Password strength meter** (`PasswordContainer`) and the reset `ProgressStep` stepper remain
  bespoke (segmented/stepper, not single-value bars).
- **Mobile drawers** in `CourseScreen`/`CourseLearningScreen` remain off-canvas nav panels (not
  centered modals).
- **ReportModal** textarea/select still use inline markup/errors.
- Settings `InputField`/`PasswordField`/`SelectField` stay feature-local (single consumer; thin
  adapters over `Input`).
- No new dependencies, frameworks, or UI kits; primitives use React + Tailwind + lucide-react.

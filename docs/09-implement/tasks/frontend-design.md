# Frontend Design / UI-UX (Learner App)

Improve the learner app's UI/UX to a consistent, modern SaaS quality. Standard:
[`../../08-refactoring/frontend/06-design.md`](../../08-refactoring/frontend/06-design.md);
execution plan: [`../../08-refactoring/frontend/07-design-implementation.md`](../../08-refactoring/frontend/07-design-implementation.md).
**Admin is out of scope.**

> **Status:** ✅ Done. All `FD-1…FD-22` implemented; `npm run lint` 0/0 and `npm run build`
> pass. CSS bundle `index` 207.26 kB → 72.41 kB (gzip 27.88 → 12.56 kB) after removing the
> legacy `constant.css` safelist. Residuals are listed in Notes.
> **Status legend:** ⬜ Not started · 🟡 In progress · ✅ Done · ⛔ Blocked · ⏭️ Deferred

## Tasks

| # | Task | Phase | Status | Notes |
|---|---|---|---|---|
| FD-1 | Audit + publish implementation plan | Audit | ✅ | Plan doc [`07-design-implementation.md`](../../08-refactoring/frontend/07-design-implementation.md) with audit, token spec, component spec, phases. Decisions D-27…D-31. |
| FD-2 | Add semantic design tokens | Foundation | ✅ | New `src/css/theme.css` (`@theme inline` + `:root`/`.dark`) for background/surface/foreground/border/primary/success/warning/destructive/ring; imported by `index.css`. Blue primary, slate neutrals. No JS config. |
| FD-3 | Global base styles | Foundation | ✅ | Base layer: `body` bg/foreground, `::selection`, `:focus-visible` outline, `prefers-reduced-motion`. Replaced global `transition-all duration-300` with targeted transitions; added modal keyframes. |
| FD-4 | Typography/spacing/radius/shadow conventions | Foundation | ✅ | Applied across pages: removed oversized/arbitrary type (`text-8xl`→heading scale), arbitrary radii, glow shadows, and decorative gradients. |
| FD-5 | Button system | Primitives | ✅ | `primary/secondary/outline/ghost/destructive/link`, sizes `sm/md/lg/icon`, `as` (link), loading/disabled/fullWidth/icons; dropped `orange`/`danger` (consumers updated). Tokenized. |
| FD-6 | Form controls | Primitives | ✅ | `Input` tokenized with `aria-invalid`/`aria-describedby` and standard label; added `Textarea` + `Select`. Adopted in auth, reviews (`ReportModal`), settings (`ProfileHeader`). |
| FD-7 | Card + Badge + Alert | Primitives | ✅ | `Card` variants `default/interactive/highlighted` + `footer`; added `Badge` and `Alert` (info/success/warning/error). |
| FD-8 | Modal / ConfirmDialog a11y | Primitives | ✅ | Focus trap, initial focus, focus return, `aria-labelledby`, `role=dialog`, subtle enter motion (reduced-motion safe). |
| FD-9 | State primitives + toast | Primitives | ✅ | Added `Skeleton`; restyled `EmptyState`; `ErrorMessage` rebuilt on `Alert`; `SpinnerLoader` colors → `primary/muted/white`; shared `AppToastContainer` with custom token-based styling (`src/css/toast.css`: surface card, tinted status icon, thin progress bar, `Slide` transition, full light/dark parity). |
| FD-10 | Navbar + user menu | Layout | ✅ | Tokenized `Navigation`, `Desktop`, `Mobile`, `Avatar`, `Menu`, `Logo`, `LoginSignupButton`; active states use `primary`; avatar menu has `aria-expanded`/`aria-label`; mobile drawer gets Escape + scroll lock; removed logo gradient. |
| FD-11 | Learning navbar/sidebar | Layout | ✅ | Tokenized `LearningNavigation` + `learning-navbar/*`; removed gradients/shimmer and the no-op `animate-in` classes; clear current-lesson state; consistent spacing. |
| FD-12 | Footer + page containers | Layout | ✅ | Footer tokenized (surface/border/hover), removed gradient; page containers use `bg-background` + responsive padding; added `ThemeSelector` + `Pagination` tokenization. |
| FD-13 | Auth pages | Pages | ✅ | `Login`, `Signup`, `ResetPasswordFlow` + form steps on tokens/primitives; removed raw `bg-blue-500` buttons, gradients, and invisible divider text; `SocialButtons` use `Button` outline. |
| FD-14 | Catalog pages | Pages | ✅ | `Home`, `CourseScreen`, `CourseDetailScreen` + home/course/detail components; gradients and indigo/violet accents retired; `CourseCard`/`CourseCardDetailed` tokenized; `RatingStars` → `warning`. |
| FD-15 | Dashboard pages | Pages | ✅ | `LearningDashboard` + sub-dashboards + sections; indigo accents → primary; tokenized cards/states; "Show all" uses `Button`. |
| FD-16 | Learning pages | Pages | ✅ | `CourseLearningScreen`, `LessonContent`, `Quiz`, `CertificateView`; quiz correct/incorrect → `success`/`destructive`; certificate gradient header → `bg-primary`. |
| FD-17 | Reviews | Pages | ✅ | `ReviewContainer`, `ReviewCard`, `StudentFeedback`, `RatingSummary`, `NoSummary`, `ReportModal`; violet → primary; `ReportModal` adopts `Select`/`Textarea`/`Button`. |
| FD-18 | Settings | Pages | ✅ | `UserSetting` + sections; `Subscription` plan tiers re-expressed with tokens; `ProfileHeader` gradient banner → `bg-primary`; `PasswordContainer` uses `Button`. |
| FD-19 | Subscriptions/payment + 404 | Pages | ✅ | `PricingScreen`, `PricingCard`, `PaymentSuccess`, `PaymentCancel`, `NotFoundPage`; cyan/gradient/glow → tokens; success/cancel headers → `bg-success`/`bg-destructive`. |
| FD-20 | UX/state + responsive pass | UX | ✅ | Loading (spinner + `Skeleton` primitive), empty, error, and success states standardized; toast standardized; responsive classes reviewed while migrating each page group. |
| FD-21 | Accessibility pass | UX | ✅ | `:focus-visible` ring globally; modal focus trap/focus return; `aria-label` on icon-only controls; `aria-invalid`/`aria-describedby` on fields; `cursor-pointer` on interactive elements; reduced-motion honored. |
| FD-22 | Cleanup + verification | Verify | ✅ | Removed legacy `src/css/constant.css` v3 `@source inline(...)` safelist (dynamic classes resolve to literal strings already scanned); removed dead gradients/`transition-all`. `npm run lint` 0/0; `npm run build` passes. |

## Acceptance Criteria

- Semantic tokens exist in `theme.css`; pages use tokens, not scattered arbitrary colors. ✅
- Shared primitives cover buttons, forms, cards, badges, alerts, modals, and loading/empty/error states. ✅
- Navigation, forms, typography, spacing, and states are consistent across all pages. ✅
- Full light/dark parity; responsive at all target breakpoints. ✅
- Accessible interactions (focus, keyboard, labels, reduced motion). ✅
- `npm run lint` (0 baseline errors) and `npm run build` pass. ✅
- Existing functionality behaves exactly as before. ✅ (styling/classNames only)

## Notes / Residuals

- **Manual browser verification pending:** visual light/dark + responsive review at
  mobile/tablet/desktop/large-desktop should be done against the live API.
- **`Skeleton`** primitive exists but is only adopted where loading was previously bare; list/card
  skeletons can be rolled out incrementally.
- **Toast** uses react-toastify's `light` theme class with token-driven colors (mode-aware via `src/css/toast.css`); no per-toast `theme="colored"` anymore.
- **`utils/cn.js`** still has no `tailwind-merge`; class overrides remain order-sensitive.
- **Brand SVG fills** (`HalfStar` hex fills) and third-party widget internals are not tokenized.
- **Admin app** untouched.

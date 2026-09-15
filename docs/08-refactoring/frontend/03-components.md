# Frontend Components

Component standards for the learner app (`frontend/`) only. Admin (`admin/`) is **out of scope**.
Part of the frontend refactor series under `docs/08-refactoring/frontend/`.
See also [`01-architecture.md`](./01-architecture.md), [`02-migration-plan.md`](./02-migration-plan.md),
and the executable tasks in [`../../09-implement/tasks/frontend-components.md`](../../09-implement/tasks/frontend-components.md).

> **Status:** Implemented. The primitives and consolidations (`FC-1…FC-16`) are done; see
> [`tasks/frontend-components.md`](../../09-implement/tasks/frontend-components.md) for status and
> the residual items deliberately left unchanged (directory casing, `OtpStep` input, password
> strength meter/stepper, mobile drawers).

---

## 1. Purpose

Define what a component is, where it lives, and how it behaves so the learner app has:

- a small set of reusable primitives instead of ad-hoc duplicated markup,
- a clear boundary between generic UI, shared app components, and feature code,
- presentational components that never own data fetching.

The rules apply to every `.jsx` file under `frontend/src`.

---

## 2. Component Types

### 2.1 UI primitives — `frontend/src/components/ui/`

Generic, domain-agnostic building blocks. They know nothing about courses, auth, reviews, or
the API. They render from props and own at most local presentational state (open/closed, hover).

```text
Button
Input
Modal
Card
EmptyState
ProgressBar
SpinnerLoader
ErrorMessage
ConfirmDialog
StarRating / HalfStar
```

Rules:

- No `fetch`, no `@/lib/api-client`, no feature hooks/services.
- No `useAuth`, `useLogout`, or any feature context.
- Reusable by any feature without change.

### 2.2 Common components — `frontend/src/components/common/`

Reusable, composed application components shared across features. They may be domain-aware
(courses, navigation) but remain feature-agnostic and data-driven through props.

```text
Navigation / navbar/*
Footer
CourseCard / CourseCardGrid
Pagination
RatingStars
SwiperWrapper
ThemeSelector
LoginSignupBtn
SocialButtons
socialSvg/*
```

Rules:

- No data fetching; consume data via props (or a generic app context that is not a feature).
- Must have more than one consumer, or be genuinely generic. Single-feature components belong in
  that feature.
- Shared stateful behaviour (logout, theme) is passed in as props/callbacks, not imported from a
  feature.

### 2.3 Feature components — `frontend/src/features/<feature>/components/`

Components specific to one feature. This is the default home for new UI.

```text
features/auth/components/
features/catalog/components/
features/learning/components/
features/reviews/components/
features/subscriptions/components/
features/dashboard/components/
features/settings/components/
```

Rules:

- Feature components may use that feature's hooks, services, and validation.
- They must not import another feature's internals; cross-feature reuse goes through
  `components/`, `hooks/`, `utils/`, or `constants/`.
- A feature owns its route pages under `features/<feature>/pages/`, not under `components/`.

### 2.4 Placement test

Ask in order:

1. Does it render generic UI with no domain/feature knowledge? → `components/ui/`.
2. Is it used by 2+ features, or is it generic app chrome? → `components/common/`.
3. Otherwise → `features/<feature>/components/`.

---

## 3. Rules

- Keep components small and focused; split when a component owns unrelated concerns.
- **No API calls in reusable UI components.** Components never call `fetch`; go through
  hooks → services → the single API client (`lib/api-client.js`). Reusable components receive
  data and callbacks via props.
- Do not duplicate components. If markup is repeated, consolidate onto one component with props.
- Keep feature-specific components inside their feature.
- Promote a component to shared only when it is genuinely reusable (2+ consumers or generic).
- Demote shared components used by a single feature into that feature.
- Route-level pages live in `features/<feature>/pages/`; do not put route pages in `components/`.
- Prefer local state; use TanStack Query for server state; avoid global state and unnecessary
  abstractions.
- No new frameworks, UI kits, ORMs, or state managers. Primitives are hand-built with the existing
  stack (React + Tailwind + lucide-react).
- Keep route paths and user-visible behaviour unchanged when moving components.

---

## 4. Conventions

| Concern | Convention |
|---|---|
| File name | PascalCase, matching the default export (`CourseCard.jsx`). |
| Export | Default export for components; named exports only for a deliberate multi-export module. |
| One component | One component per file. Extract nested components. |
| Naming | Full words (`LoginSignupButton`, not `LoginSignupBtn`); no typos. |
| Directories | Lowercase for feature component groups (`course`, `home`, `quiz`); no camelCase dirs. |
| Props | Explicit, presentational; no hidden coupling to feature hooks/context. |
| State | Loading/error/empty render through the shared primitives (§5). |
| Comments | Do not add comments unless they add information. |

---

## 5. State Components

Use the shared primitives; do not hand-roll state UI:

| State | Component | Replaces |
|---|---|---|
| Loading | `components/ui/SpinnerLoader.jsx` | inline `animate-spin` SVGs, lucide `Loader2`, layout `"Loading..."` divs |
| Error | `components/ui/ErrorMessage.jsx` | ad-hoc `<p className="text-red-...">` messages |
| Empty | `components/ui/EmptyState.jsx` | inline "No …" blocks |
| Confirm | `components/ui/ConfirmDialog.jsx` (built on `Modal`) | bespoke confirm overlays |

Route-level `Suspense` uses `SpinnerLoader` as its fallback.

---

## 6. Current-State Audit

Inventory as of this standard. Evidence cited as `file:line`.

### 6.1 Missing primitives

No shared `Button`, `Modal`, `Card`, `Input`, `EmptyState`, or `ProgressBar`. Their absence is the
root cause of most duplication below.

### 6.2 Duplication

| Pattern | Occurrences |
|---|---|
| Spinners | `ui/SpinnerLoader.jsx:21`; `auth/.../EmailStep.jsx:107`, `OtpStep.jsx:199`, `PasswordStep.jsx:271` (identical SVG); `subscriptions/.../PricingCard.jsx:155`, `settings/.../Subscription.jsx:113` (lucide `Loader2`); `layouts/AppLayout.jsx:12`, `LearningLayout.jsx:25` (`"Loading..."`). |
| Error states | `ErrorMessage.jsx` plus ~11 inline paragraphs: `auth/form/{EmailInput,NameInput,PasswordInput,TermCheck}.jsx`, `auth/.../{EmailStep,OtpStep,PasswordStep}.jsx`, `reviews/.../ReportModal.jsx`, `settings/.../{PasswordContainer,PersonalInfoSection,ProfileHeader}.jsx`. |
| Empty states | `reviews/.../NotSummary.jsx`; `catalog/.../SearchResult.jsx:22`; `dashboard/.../RecentlyViewed.jsx:21`; `dashboard/pages/RecentViewDashboard.jsx:21`; `dashboard/pages/InprogressDashboard.jsx:24`; `dashboard/pages/CompletedCourseDashboard.jsx:24`; `reviews/.../StudentFeedback.jsx:139`. |
| Modals/overlays | `ui/ConfirmDialog.jsx:36`; `reviews/.../ReportModal.jsx:62`; `learning/.../CourseRating.jsx:36`; mobile drawers `catalog/pages/CourseScreen.jsx:30`, `learning/pages/CourseLearningScreen.jsx:17`. |
| Course cards | `common/CourseCard.jsx`; `dashboard/.../CourseCardProgress.jsx:7`; `dashboard/.../CourseCardRecentReview.jsx:6`. |
| Form inputs | auth RHF fields (`auth/components/form/*`), settings controlled fields (`settings/.../{InputField,PasswordField,SelectField}.jsx`), and inline copies (`EmailStep`, `OtpStep`, `PasswordStep`, `PersonalInfoSection`, `ProfileHeader`). Password eye-toggle repeated 4×. |
| Progress bars | `learning/.../quiz/ProgressBar.jsx`; `dashboard/.../CourseCardProgress.jsx:68`; `reviews/.../RatingSummary.jsx:45`; `settings/.../PasswordContainer.jsx:113`; `auth/.../ProgressStep.jsx`. |
| Nav/menu markup | active-link logic `navbar/{Desktop,Mobile}.jsx`, `dashboard/.../Tabs.jsx:20`; avatar dropdown items `navbar/Avatar.jsx:42` vs `navbar/Mobile.jsx:76`. |
| Dashboard lists | `dashboard/pages/{InprogressDashboard,CompletedCourseDashboard}.jsx` structurally identical; `dashboard/pages/RecentViewDashboard.jsx` ≈ `dashboard/components/RecentlyViewed.jsx`. |
| Module→lesson mapping | `learning/.../ModuleGroup.jsx:6` vs `catalog/.../LearningRoadMap.jsx:172`. |

### 6.3 Feature-coupled "shared" components

| File:line | Issue |
|---|---|
| `common/Navigation.jsx:7` | imports `useAuth`. |
| `common/navbar/Avatar.jsx:5,7` | imports `useAuth` + `useLogout` mutation. |
| `common/navbar/Mobile.jsx:3,4` | imports `useLogout` + `useAuth`. |

### 6.4 Misplaced components

- Route pages under `components/` (lazy in `app/router.jsx`): `subscriptions/components/{PaymentSuccess,PaymentCancel}.jsx`, `learning/components/courseLearning/LessonContent.jsx`, `learning/components/courseLearning/quiz/Quiz.jsx`.
- Shared but single-feature: `common/CourseCardGrid.jsx` (catalog), `common/SocialButtons.jsx` (auth), `ui/StarRating.jsx` + `ui/HalfStar.jsx` (learning/reviews), `common/SwiperWrapper.jsx` (dashboard).
- Generic UI trapped in a feature: `settings/.../{InputField,SelectField,PasswordField,SectionCard,Avatar}.jsx`, `learning/.../quiz/ProgressBar.jsx`, `reviews/.../NotSummary.jsx`.
- Inline components: `catalog/.../Sidebar.jsx:204` (`Section`), `:213` (`Radio`).

### 6.5 Naming drift

| Current | Should be |
|---|---|
| `catalog/.../FilterTap.jsx` (exports `FilterTab`) | `FilterTab.jsx` / `FilterTab` |
| `catalog/.../LearningRoadMap.jsx` (component `LearningRoadmap`) | `LearningRoadmap.jsx` / `LearningRoadmap` |
| `reviews/.../NotSummary.jsx` | `EmptyState` usage or `NoSummary` |
| `dashboard/.../CourseCardRecentReview.jsx` (renders recently viewed) | `CourseCardRecentView.jsx` |
| `dashboard/pages/InprogressDashboard.jsx` | `InProgressDashboard.jsx` |
| `common/socialSvg/FaceBook.jsx` | `Facebook.jsx` |
| `common/LoginSignupBtn.jsx` | `LoginSignupButton.jsx` |
| `RatingStars` vs `StarRating` vs `HalfStar` | disambiguate (read-only vs interactive) |
| Mixed exports (named vs default) and camelCase dirs (`courseDetail`, `courseLearning`, `learningNavbar`, `resetPasswordForm`) | default exports; lowercase dirs |
| `auth/ResetFlow.js`, `auth/ResendTimer.js` (PascalCase utils) | lowercase util names |

### 6.6 Duplicated inline config/logic

- Plan config duplicated: `subscriptions/components/PricingSection.jsx:6` vs `settings/components/Subscription.jsx:9`.
- Auth schemas inline: `auth/pages/{Login,Signup}.jsx`; report schema/`ISSUE_TYPES` in `reviews/.../ReportModal.jsx:10`.
- Quiz scoring `calculateScore` inline in `learning/.../quiz/Quiz.jsx:62`.
- Feature data arrays inline (`dashboard/.../DiscoverFeatures.jsx:4`).

---

## 7. Current → Target Mapping

| Current | Target |
|---|---|
| Inline spinner SVGs / `Loader2` / `"Loading..."` | `components/ui/SpinnerLoader.jsx` |
| Inline error paragraphs | `components/ui/ErrorMessage.jsx` |
| Inline "No …" blocks | `components/ui/EmptyState.jsx` (new) |
| `ConfirmDialog` / `ReportModal` / `CourseRating` / drawers | `components/ui/Modal.jsx` (new) + `ConfirmDialog` |
| Hand-styled primary buttons | `components/ui/Button.jsx` (new) |
| Course card variants | `components/common/CourseCard.jsx` + props |
| Parallel form fields | `components/ui/Input.jsx` (new) + feature wrappers |
| Progress bar copies | `components/ui/ProgressBar.jsx` (new) |
| `settings/components/{InputField,SelectField,PasswordField,SectionCard,Avatar}.jsx` | promote to `components/ui/` |
| `common/{CourseCardGrid,SocialButtons,SwiperWrapper}.jsx`, `ui/{StarRating,HalfStar}.jsx` | demote to consuming feature (or keep if second consumer appears) |
| Route pages in `features/*/components/` | `features/*/pages/` |
| Feature hooks inside `common/Navigation` + `navbar/*` | props/callbacks from `app/`/`layouts/` |
| Inline `Section`/`Radio` in `Sidebar.jsx` | extracted local/`components/ui` components |
| Duplicated plan config / schemas | feature `constants/` + `validation/` |

---

## 8. Definition of Done

- `components/ui/` holds the primitives in §2.1; `components/common/` holds only genuinely shared
  components; feature code lives in features.
- No reusable component imports a feature hook/service or calls `fetch`.
- Loading/error/empty/confirm states use the shared primitives.
- Duplicate course cards, form fields, progress bars, and dashboard lists are consolidated.
- Route pages are under `features/<feature>/pages/`.
- Naming follows §4; no `Tap`/`Map`/`Btn`/`FaceBook`/`Inprogress` drift.
- `npm run lint` and `npm run build` pass in `frontend/` (baseline lint errors may remain but no new
  ones are introduced).
- Existing flows behave the same.

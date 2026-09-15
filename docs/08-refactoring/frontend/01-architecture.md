# Frontend Architecture

Target architecture for the learner app (`frontend/`) only. The admin dashboard (`admin/`) is
**out of scope**. Part of the frontend refactor series under `docs/08-refactoring/frontend/`.
See also [`../architecture-plan.md`](../architecture-plan.md) §4 and [`../frontend-audit.md`](../frontend-audit.md).

> **Status:** Implemented. The learner app now follows this structure; see [`02-migration-plan.md`](./02-migration-plan.md) and [`../../09-implement/tasks/frontend-refactor.md`](../../09-implement/tasks/frontend-refactor.md).

---

## 1. Architecture

Use **feature-based architecture + shared components + application infrastructure**.

```text
frontend/src/
├── app/                      # routing, providers, application setup
│   ├── App.jsx
│   ├── router.jsx
│   ├── providers.jsx
│   └── guards/
├── features/                 # feature-specific code
│   ├── auth/
│   ├── catalog/
│   ├── learning/
│   ├── reviews/
│   ├── subscriptions/
│   ├── dashboard/
│   └── settings/
├── components/
│   ├── ui/                   # primitives
│   └── common/               # shared composed components
├── layouts/                  # page layouts
├── pages/                    # route-level pages
├── lib/                      # application infrastructure
├── hooks/                    # generic reusable hooks
├── utils/                    # helper functions
├── constants/                # shared constants
└── main.jsx
```

> The pasted template listed `auth/`, `notes/`, `users/` as example features. This project has no
> `notes` domain; the real features are the seven listed above (decision D-FE-1).

---

## 2. Responsibilities

| Folder | Responsibility |
|---|---|
| `app/` | Routing, providers, route guards, application setup. |
| `features/` | Feature-specific code (components, hooks, services, validation). |
| `components/` | Reusable UI. `ui/` primitives; `common/` shared composed components. |
| `layouts/` | Page layouts (`AppLayout`, `LearningLayout`). |
| `pages/` | Route-level pages (thin, compose features). |
| `lib/` | Application infrastructure (API client, query client). |
| `hooks/` | Generic reusable hooks only (no feature logic). |
| `utils/` | Pure helper functions. |
| `constants/` | Shared constants. |

---

## 3. Feature Structure

```text
features/<feature>/
├── components/               # feature components
├── hooks/                    # feature hooks (queries + mutations)
├── services/                 # feature API calls (use lib/api-client)
└── validation/               # feature schemas (zod)
```

Feature-specific code stays inside its feature. A feature may own route-level pages when they are
thin compositions; those pages live in `features/<feature>/pages/` and are re-exported through
`pages/` only if a shared route entry is needed.

### Features

| Feature | Owns |
|---|---|
| `auth/` | login, signup, password reset, auth guards, auth forms. |
| `catalog/` | home, course browse/filters, course detail, categories. |
| `learning/` | course player, lesson content, quiz, progress, certificates. |
| `reviews/` | review list, rating summary, helpful votes, reports. |
| `subscriptions/` | pricing, checkout, payment success/cancel, active subscription. |
| `dashboard/` | learner dashboard and its sections (in-progress, recent, completed). |
| `settings/` | profile, password, subscription settings. |

---

## 4. Data Flow

```text
Page
 ↓
Feature Component
 ↓
Hook
 ↓
Feature Service
 ↓
API Client (lib/api-client.js)
 ↓
Backend
```

---

## 5. Rules

- Keep feature logic inside features.
- Keep reusable UI inside `components/`.
- Keep API infrastructure inside `lib/`.
- Prefer local state when possible.
- Use server-state management (TanStack Query) for server data.
- Avoid unnecessary global state.
- Avoid duplicate logic.
- Avoid unnecessary abstractions.
- Components never call `fetch`; go through hooks → services → the single API client.
- Invalidate query keys after mutations.
- No new frameworks, ORMs, state managers, or UI kits.

---

## 6. Current → Target Mapping

| Current | Target |
|---|---|
| `src/App.jsx`, `src/contexts/*`, `src/components/redirectRoutes/*` | `src/app/` (`router.jsx`, `providers.jsx`, `guards/`) |
| `src/api/client.js` | `src/lib/api-client.js` |
| `src/main.jsx` QueryClient | `src/lib/query-client.js` |
| `src/api/*.js` (endpoint functions) | `src/features/<feature>/services/*.js` |
| `src/hooks/queries/*`, `src/hooks/mutations/*`, `src/hooks/{auth,course,user,subscription}/*` | `src/features/<feature>/hooks/*` |
| `src/ui/*` (used), dead `src/components/ui/*` | `src/components/ui/` (dead files removed) |
| `src/components/{navbar,Footer,Pagination,RatingStars,SwiperWrapper,ThemSelector,SocialButtons,LoginSignupBtn,...}`, `src/socialSvg/*` | `src/components/common/` |
| `src/components/{AppLayout,LearningLayout}.jsx` | `src/layouts/` |
| `src/pages/*`, `src/components/{home,course,courseDetail,courseLearning,courseReview,pricing,setting,form,resetPasswordForm,LearningDashBoard,learningNavbar}/*` | `src/features/<feature>/` |
| `src/helper/{ResetFlow,ResendTimer}` | `src/features/auth/` |
| `src/helper/OpenCloseMediaQuery.jsx`, `src/hooks/{useMobile,useClickOuteSideTwo}.js` | deleted (dead code) |
| `src/hooks/{useMenuState,useScrollEffect,useTheme}.js` | `src/hooks/` (generic) |
| `src/utils/*`, `src/constants/*`, `src/css/*` | unchanged |

---

## 7. Structure Rules

- Feature-specific code stays inside its feature.
- Shared code belongs in `components/`, `hooks/`, `utils/`, or `constants/`.
- Application infrastructure belongs in `app/` and `lib/`.
- Do not create folders without a clear responsibility.
- Avoid unnecessary abstraction layers.
- Keep the structure consistent across features.

Additional rules for this project:
- One API client (`lib/api-client.js`) owns transport, 401 handling, and unwrapping.
- Feature services own endpoint paths and payload shapes.
- Generic hooks do not import feature code.
- Route guards are the only place that checks auth for routing.
- Keep route paths and user-visible behavior unchanged during migration.

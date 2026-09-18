# Admin Frontend Architecture & Refactor Plan

> **Status:** Refactor complete (Phases 0–2, 3.1–3.5, and 3.6) and verified (lint + build). Phase 4 (toast consolidation) and Phase 5 (docs to Done) pending. See [`../../../progress/frontend-admin.md`](../../../progress/frontend-admin.md).
>
> This document defines the **target architecture** for the admin React SPA and the **phased plan** to get there. It mirrors the patterns already proven in the learner frontend (`frontend/`) refactor.
>
> **Deviation (Phase 3.2):** `StatsCard` lives at `features/dashboard/components/StatsCard.jsx` (dashboard-specific) rather than `components/common/` as shown in the target tree above.
>
> **Deviation (Phase 3.6):** `features/subscriptions/` reflects the prepaid billing API: subscriptions/payments are read-only (override + refunds only), plans remain full CRUD, and coupons + billing stats are new.

## 1. Target Architecture

Use **feature-based architecture + shared components + application infrastructure**.

```text
admin/src/
├── app/                          Routing, providers, application setup
│   ├── App.jsx                   Providers composition (Query → Auth → Router)
│   ├── router.jsx                All route definitions + lazy loading
│   ├── providers/
│   │   ├── AuthProvider.jsx      useGetMe bootstrap; saveAuth/clearAuth
│   │   └── context.js            createContext for Auth
│   └── guards/
│       ├── RequireAuth.jsx       Redirects to /login if no user
│       └── RedirectIfAuthenticated.jsx  Redirects to / if already logged in
├── features/                     One folder per admin domain
│   ├── auth/                     Admin login/logout, session bootstrap
│   │   ├── pages/                LoginPage.jsx
│   │   ├── hooks/                useGetMe, useLogout
│   │   └── services/             auth.js
│   ├── categories/               Category CRUD
│   │   ├── pages/                CategoriesPage.jsx
│   │   ├── hooks/                useGetCategories, useCreate/Update/DeleteCategory
│   │   └── services/             categories.js
│   ├── courses/                  Course listing + detail + content-tree editor
│   │   ├── pages/                CoursesPage.jsx, CourseDetailPage.jsx
│   │   ├── components/           CourseHeader, ObjectivesCard, ModuleCard, ChapterItem,
│   │   │   │                     LessonItem, ContentItem, QuizItem, *Modal,
│   │   │   └──                  DeleteConfirmDialog
│   │   │   └── course-detail/    (courseDetail/* landing here)
│   │   ├── hooks/                useGetCourses, useCourseDetail (composer),
│   │   │                         useModuleCrud, useChapterCrud, useLessonCrud,
│   │   │                         useContentCrud, useQuizCrud, useObjectiveActions,
│   │   │                         useExpandCollapse, useDeleteDialog
│   │   └── services/             courses.js, modules.js, chapters.js, lessons.js,
│   │                             contents.js, objectives.js, questions.js, options.js
│   ├── dashboard/                Admin dashboard stats
│   │   ├── pages/                DashboardPage.jsx
│   │   ├── components/           StatsCard.jsx
│   │   ├── hooks/                useGetDashboardData
│   │   └── services/             dashboard.js
│   ├── subscriptions/            Plans, subscriptions, payments, coupons, stats
│   │   ├── pages/                SubscriptionsPage.jsx
│   │   ├── components/           PlansTab, SubscriptionsTab, PaymentsTab,
│   │   │                         SubscriptionStats, *Modal, DeleteConfirmDialog
│   │   ├── hooks/                usePlans, useSubscriptions, usePayments,
│   │   │                         useCoupons, useSubscriptionOverride, useRefund
│   │   └── services/             subscriptions.js
│   └── users/                    User management + admin profile
│       ├── pages/                UsersPage.jsx, ProfilePage.jsx
│       ├── hooks/                useGetUsers, useCreate/Update/DeleteUser,
│       │                         useGetMe, useUpdateProfile, useUpdatePassword
│       └── services/             users.js
├── components/
│   ├── ui/                       shadcn/Radix primitives (only actively used)
│   └── common/                   Reusable composables
│       ├── DataTable.jsx
│       ├── PaginationTable.jsx
│       ├── FormModal.jsx
│       ├── StatusBadge.jsx
│       ├── StatsCard.jsx
│       └── NavLink.jsx
├── layouts/
│   ├── AdminLayout.jsx           Sidebar + Outlet
│   └── AdminSidebar.jsx          Navigation, theme toggle, logout
├── pages/
│   └── NotFound.jsx              Catch-all 404
├── lib/                          Application infrastructure
│   ├── apiClient.js              fetch wrapper + ApiError + envelope unwrapping
│   ├── queryClient.js            QueryClient defaults + clearUserQueries()
│   ├── queryKeys.js              Central query-key factory
│   └── utils.js                  cn() (clsx + tailwind-merge)
├── hooks/                        Generic reusable hooks (non-feature)
│   ├── use-mobile.jsx            Mobile breakpoint detection
│   ├── use-theme.js              Dark mode toggle + localStorage
│   └── use-toast.js              Sole toast source (shadcn Toaster)
├── utils/                        Pure helpers
│   ├── parseQueryToObject.js
│   └── parseQueryToString.js
├── constants/                    Shared constants (navItems, status labels)
├── css/
│   └── index.css                 Tailwind import + theme tokens + glass-card
├── assets/
└── main.jsx
```

## 2. Responsibilities

| Layer | Responsibility |
|---|---|
| `app/` | Routing, guards, providers, application setup |
| `features/` | Feature-specific pages, components, hooks, services |
| `components/ui/` | Reusable UI primitives (shadcn/Radix + custom) |
| `components/common/` | Reusable composables composed from primitives |
| `layouts/` | Page layouts (AdminLayout, AdminSidebar) |
| `pages/` | Global 404 only |
| `lib/` | Application infrastructure (API client, query client, query keys) |
| `hooks/` | Generic reusable hooks (non-feature) |
| `utils/` | Helper functions |
| `constants/` | Shared constants |

## 3. Feature Structure

```text
features/<domain>/
├── pages/           route-level pages owned by the feature
├── components/      feature-specific components
├── hooks/           queries + mutations via React Query
└── services/        api objects wrapping lib/apiClient
```

- Add `constants/` or `utils/` only when the feature has domain-specific static data / flow helpers.
- Feature-specific code stays inside its feature. No barrel `index.js` files — direct file imports.

## 4. Data Flow

```text
Page
  ↓
Feature Component
  ↓
Hook (useQuery / useMutation)
  ↓
Service (features/<f>/services/xxxApi)
  ↓
API Client (lib/apiClient.js)
  ↓
Backend (/api/v1/*)
```

## 5. Rules

- Components never call `fetch`; they use hooks, which use services.
- Server state lives in React Query; never duplicate it in Context.
- Auth state lives in `AuthProvider`; theme in `useTheme` hook + localStorage.
- Filters/pagination live in the URL (`useSearchParams`).
- Query keys are defined centrally in `lib/queryKeys.js`.
- Mutations invalidate the relevant query keys.
- Reuse existing UI primitives; no new component libraries.
- Keep feature logic inside `features/`.
- Keep API infrastructure inside `lib/`.
- Keep reusable UI inside `components/`.
- Prefer local state over global state; avoid unnecessary abstractions.
- **Tailwind 3** (no Tailwind 4 migration in this refactor).
- **Manual `useState` forms** (react-hook-form/zod deferred to a later pass).
- **shadcn Toaster only** (Sonner is dropped).

## 6. Current State (As-Is)

The current admin app is functionally working but structurally flat:

```text
admin/src/
├── App.jsx                  Providers + AppRoutes + ProtectedRoutes + AdminLayout routes
├── contexts/AuthContext.jsx Login/logout + useGetMe bootstrap
├── services/                13 PascalCase API classes + http.js apiFetch wrapper
├── hooks/                   kebab-case per-domain folders + generic hooks
├── pages/                   9 route-level pages
├── components/
│   ├── AdminLayout, AdminSidebar, NavLink, DataTable, PaginationTable,
│   │   FormModal, StatsCard, StatusBadge
│   ├── courseDetail/        14 course-detail components
│   ├── subscriptions/       8 subscription components
│   └── ui/                  49 shadcn-style primitives
├── libs/utils.js            cn() (clsx + tailwind-merge); src/lib/ is empty
├── utils/                   2 used + 4 dead helpers
└── css/, assets/
```

### 6.1 Key Deficiencies

| Area | Issue |
|---|---|
| Architecture | Flat `pages/` + `components/` layout; no `features/`, no `app/`, no `lib/` infra |
| Routing | Buried inside `App.jsx`; no guards/ folder; no lazy loading |
| API client | `services/http.js` returns raw envelope; no unwrapping, no `ApiError`, no 401 auto-logout, no `buildQuery`, no pagination helper |
| Query keys | Scattered string keys inside hooks; no central factory |
| Path alias | No `@` → `src` alias; deep relative imports |
| Services | Monolithic `UserApi`/`CourseApi` mixing unrelated concerns; not feature-scoped |
| Duplication | Two toast entry points; duplicate subscription hooks; misnamed options/questions hook files |
| Dead code | ~27 unused shadcn ui files, 4 unused utils, empty `lib/` vs `libs/`, un-mounted Sonner |
| Billing | `SubscriptionsPage` calls removed endpoints (prepaid refactor) and will break |

### 6.2 Known Issues — Surface, Do Not Silently Fix

| # | Issue | Handle In |
|---|---|---|
| 1 | ~~Billing endpoint mismatch — Payments/Subscriptions tabs use removed `/admin/*` mutation endpoints~~ | Phase 3.6 ✅ |
| 2 | ~~Duplicate subscription hooks (`use-subscription.js` vs create/update/delete) with different query keys~~ | Phase 3.6 ✅ |
| 3 | ~~Misnamed hook files (options/questions named `-content`)~~ | Phase 3.5 ✅ |
| 4 | ~~Two toast entry points (`hooks/use-toast.js` + `components/ui/use-toast.js`)~~ | Phase 4 ✅ |
| 5 | `lib/` (empty) vs `libs/` (active `utils.js`) | Phase 1 ✅ |
| 6 | Dead shadcn components | Phase 4 |
| 7 | Dead utils (formatCapitalize, formatMinutes, formatTimeAgo, truncateText) | Phase 4 |
| 8 | `SuccessAlert` references un-imported `<CheckCircle>` | Phase 4 |
| 9 | `chart.jsx`/`toggle.jsx` import `@/lib/utils` (alias not configured) | Phase 4 |
| 10 | `next-themes` in sonner.jsx without ThemeProvider | Phase 4 |

## 7. Refactor Plan

Executed as incremental phases, each a complete working commit point verified with `npm run lint` + `npm run build` in `admin/`. Progress tracked in [`docs/progress/frontend-admin.md`](../../../progress/frontend-admin.md).

### Phase 0 — Housekeeping

1. Delete untracked `admin/admin/` nested duplicate scaffold.
2. Remove empty `src/lib/` scaffold (recreated in Phase 1).
- No behavior change. Verify: `npm run dev` still works.

### Phase 1 — App Infrastructure (`app/` + `lib/`)

Foundation for everything else.

1. **`@` alias** — `vite.config.js` `resolve.alias` `@` → `./src`; `jsconfig.json` `paths`.
2. **`lib/apiClient.js`** — Class `ApiClient` (`get`, `getPaginated`, `post`, `patch`, `put`, `delete`, `upload`), `credentials: "include"`, `X-Requested-With`, safe JSON parse, envelope unwrapping (`data`, `{ data, pagination }`), `ApiError { message, statusCode, data }`, 401 auto-logout via `clearUserQueries()`, `buildQuery(params)`. Export singleton `api`.
3. **`lib/queryClient.js`** — `staleTime` 5 min, `retry` 1, `refetchOnWindowFocus: false`, `clearUserQueries()`.
4. **`lib/queryKeys.js`** — Central factory: `auth`, `dashboard`, `categories`, `courses`, `users`, `subscriptions` (plans/list/payments/coupons/stats).
5. **`lib/utils.js`** — move `libs/utils.js`; delete `libs/`.
6. **`app/providers/`** — `context.js` (Auth context), `AuthProvider.jsx` (from `contexts/AuthContext.jsx`).
7. **`app/guards/`** — `RequireAuth.jsx`, `RedirectIfAuthenticated.jsx`.
8. **`app/router.jsx`** — all route definitions.
9. **`app/App.jsx`** — providers composition only.
10. Delete old `App.jsx`, `contexts/`; update `main.jsx` and all imports.

### Phase 2 — Service Layer

Move each monolithic service class into a feature service under `features/<f>/services/<name>.js` as a named `xxxApi` object. Includes the **billing endpoint update** (see below).

### Phase 3 — Feature Extraction

Domain by domain, simplest first; each sub-step is a working commit:

1. **`features/auth/`** — LoginPage, auth hooks.
2. **`features/dashboard/`** — DashboardPage, StatsCard, dashboard hooks.
3. **`features/categories/`** — CategoriesPage, category hooks.
4. **`features/users/`** — UsersPage, ProfilePage, user hooks.
5. **`features/courses/`** (largest) — CoursesPage, CourseDetailPage, 14 courseDetail components, course + content-entity hooks; rename misnamed option/question hook files; add missing query invalidation for `course-details`.
6. **`features/subscriptions/`** — SubscriptionsPage + tabs/modals/hooks; **resolve duplicate hooks**; **update for the prepaid billing API**:
   - Payments read-only + refund issuance.
   - Subscriptions read-only + audited override.
   - Coupons + billing stats.
   - Remove all calls to removed mutation endpoints.

### Phase 4 — Shared Components Cleanup

1. Move reusable composables to `components/common/` (DataTable, PaginationTable, FormModal, StatusBadge, NavLink).
2. Prune dead shadcn ui files (accordion, aspect-ratio, breadcrumb, calendar, carousel, chart, checkbox, command, context-menu, drawer, dropdown-menu, form, hover-card, input-otp, menubar, navigation-menu, popover, progress, radio-group, resizable, scroll-area, slider, toggle, toggle-group).
3. Remove `sonner.jsx` + `components/ui/use-toast.js` re-export; consolidate to `hooks/use-toast.js`.
4. Remove now-orphan deps (`sonner`, `next-themes`, `cmdk`, `embla-carousel-react`, `react-day-picker`, `vaul`, `react-resizable-panels`) — verify each via import grep.
5. Fix `SuccessAlert`.
6. Remove dead utils.
7. `constants/navItems.js` — extract sidebar items.

### Phase 5 — Documentation & Final Verification

1. Update `docs/progress/frontend-admin.md` (Done).
2. Update `docs/04-design/architecture.md` §4 (Admin Architecture).
3. Update `docs/05-development/folder-structure.md` §3 (Admin tree).
4. Final `npm run lint` + `npm run build` + manual smoke test.

## 8. Verification

| Check | Command |
|---|---|
| Lint | `npm run lint` (in `admin/`) |
| Build | `npm run build` (in `admin/`) |
| Dev smoke | `npm run dev` — login → dashboard → categories → courses → course detail editing → subscriptions → users → profile |
# Folder Structure

Annotated structure of the monorepo.

> **Progress:** the backend is module-based and hardened; the learner frontend refactor is complete; the admin refactor has not started. See [`../progress/`](../progress/).

```text
LEARNING_ONLINE_PLATFORM/
├── backend/                     Express API
├── frontend/                    Learner React SPA
├── admin/                       Admin React SPA
├── docs/                        This documentation set
├── ai/                          Rules/context for AI agents
├── README.md                    Project readme
├── database.svg                 Rendered database diagram
├── er-diagram.svg               Rendered ER diagram
├── image-1.png                  Preview image
└── .gitignore
```

## 1. Backend (`backend/`)

```text
backend/
├── package.json                 Scripts (dev, pro), deps, engines node 22.22.2
├── eslint.config.mjs            Flat ESLint config
├── jsconfig.json                ES2024 + NodeNext
├── .env                         Secrets/config (gitignored)
├── uploads/                     Local multer destination (temporary)
└── src/
    ├── server.js                Entry point: DB check + listen
    ├── app/                     App wiring (migrated)
    │   ├── app.js               Create Express app, register middleware/routes, error handling
    │   ├── middleware.js        Global middleware pipeline (order preserved)
    │   └── routes.js            Mounts module routers under /api/v1
    ├── config/                  Configuration + infrastructure
    │   ├── environment.js       Loads dotenv, exports ENV
    │   ├── database.js          pg Pool + withTransaction()
    │   ├── cloudinary.js        connectCloudinary()
    │   └── stripe.js            Stripe client
    ├── db/
    │   ├── schema.sql           Authoritative DDL baseline (fresh installs)
    │   ├── migrate.js           Plain-SQL migration runner
    │   ├── migrations/          0001…0012 incremental migrations
    │   └── README.md            How to run migrations
    ├── common/                  Shared infrastructure
    │   ├── errors/api-error.js
    │   ├── http/                async-handler.js, not-found-url.js, response.js
    │   ├── middleware/          require-auth, authorize, validate-result, csrf-protection,
    │   │                        rate-limit-middlewares, session-middleware, session-idle-timeout,
    │   │                        multer, error-handler
    │   ├── auth/ownership.js    assertOwnership()
    │   ├── query/advanced-query.js  AdvancedQuery builder
    │   ├── constants/           constants.js, status-code.js
    │   ├── helper/              create-random-code.js
    │   ├── services/            email-service, hash-service, hash-code, session-service
    │   ├── validation.js        express-validator builders
    │   └── logger.js            Structured logger (+ logger.audit)
    └── modules/                 Feature modules
        ├── auth/                register/login/logout, password resets (+ session.repository.js)
        ├── users/               profile, xp, password
        ├── categories/          category CRUD
        ├── courses/             courses, objectives, admin/me routes
        ├── content/             modules, chapters, lessons, lesson contents, questions, options
        ├── learning/            enrollments, progress, lesson completion
        ├── reviews/             reviews, helpful votes, reports
        ├── certificates/        eligibility/claim/lookup
        ├── subscriptions/       plans, subscriptions, payments, Stripe webhook
        └── admin/               dashboard stats + admin user management
```

Each module follows `routes.js`, `controller.js`, `service.js`, `repository.js`, `validation.js`; multi-entity modules split into `<entity>.<role>.js` (e.g. `lesson-content.repository.js`).

## 2. Learner Frontend (`frontend/`)

```text
frontend/
├── index.html
├── vite.config.js               react() + tailwindcss() + `@` alias
├── eslint.config.js
├── jsconfig.json
├── .env                         VITE_BASE_URL
└── src/
    ├── main.jsx                 Mounts providers + App
    ├── index.css                Tailwind import + theme.css
    ├── app/
    │   ├── App.jsx              Providers + Router
    │   ├── router.jsx           Route definitions + lazy loading
    │   ├── providers.jsx        Query → Theme → Auth
    │   ├── providers/           AuthProvider, ThemeProvider, context
    │   └── guards/              RequireAuth, RedirectIfAuthenticated, RedirectToFirstLesson
    ├── layouts/                 AppLayout, LearningLayout
    ├── lib/                     apiClient.js, queryClient.js, queryKeys.js
    ├── components/
    │   ├── ui/                  Button, Input, Textarea, Select, Modal, Card, Badge, Alert,
    │   │                        EmptyState, Skeleton, ProgressBar, SpinnerLoader, ConfirmDialog, ...
    │   └── common/              Navigation, navbar/*, Footer, CourseCard, Pagination, RatingStars, ...
    ├── features/
    │   ├── auth/                pages, components, hooks, services, utils
    │   ├── catalog/             home + course listing/detail
    │   ├── learning/            course learning screen, lesson, quiz, certificate
    │   ├── reviews/             review list/card/summary/report
    │   ├── subscriptions/       pricing + payment success/cancel
    │   ├── dashboard/           learner dashboards
    │   └── settings/            profile + subscription settings
    ├── hooks/                   useTheme, useMediaQuery, useMenuState, useScrollEffect
    ├── constants/               navLinks, footerLinks, plans, lessonIcons, ...
    ├── utils/                   cn, formatting, query parsing
    ├── css/                     theme.css, toast.css, SwiperWrapper.css
    ├── pages/                   NotFoundPage.jsx
    └── assets/
```

## 3. Admin Dashboard (`admin/`)

```text
admin/
├── index.html                   "LMS Dashboard"
├── vite.config.js               react()
├── tailwind.config.js           darkMode class, HSL tokens, tailwindcss-animate
├── postcss.config.js
├── eslint.config.js
├── jsconfig.json
├── .env                         VITE_BASE_URL
└── src/
    ├── main.jsx
    ├── App.jsx                  Providers, AppRoutes, ProtectedRoutes, AdminLayout routes
    ├── index.css                Tailwind + theme tokens + glass-card
    ├── services/                AuthApi, UserApi, CategoryApi, CourseApi, ModuleApi, ChapterApi,
    │                            LessonApi, ContentApi, QuestionApi, OptionApi, ObjectiveApi,
    │                            SubscriptionApi (+ http.js `apiFetch` wrapper)
    ├── contexts/AuthContext.jsx login/logout, useGetMe bootstrap
    ├── hooks/                   kebab-case per domain (auth, category, course, course-details,
    │                            dashboard-data, chapters, modules, lessons, contents, objectives,
    │                            options, questions, subscription, user) + use-mobile/use-theme/use-toast
    ├── pages/                   DashboardPage, LoginPage, CategoriesPage, CoursesPage, CourseDetailPage,
    │                            SubscriptionsPage, UsersPage, ProfilePage, NotFound
    ├── components/
    │   ├── AdminLayout, AdminSidebar, NavLink, DataTable, PaginationTable, FormModal,
    │   │   StatsCard, StatusBadge
    │   ├── courseDetail/        CourseHeader, ObjectivesCard, ModuleCard, ChapterItem, LessonItem,
    │   │                        ContentItem, QuizItem, *Modal, DeleteConfirmDialog
    │   ├── subscriptions/       SubscriptionStats, PlansTab, SubscriptionsTab, PaymentsTab, *Modal
    │   └── ui/                  shadcn-style Radix primitives
    ├── libs/utils.js            cn() = clsx + tailwind-merge
    ├── utils/                   formatCapitalize, formatMinutes, formatTimeAgo, parseQuery*, truncateText
    └── assets/
```

## 4. Documentation (`docs/`)

```text
docs/
├── 01-planning/       project-overview.md, scope.md
├── 02-requirements/   requirements.md, business-rules.md, acceptance-criteria.md
├── 03-analysis/       use-cases.md, workflows.md
├── 04-design/         architecture.md, database-design.md, api-design.md, security.md
├── 05-development/    coding-standards.md, folder-structure.md, git-workflow.md, environment-setup.md
├── 06-testing/        test-strategy.md, test-cases.md
├── 07-deployment/     deployment.md, production-checklist.md
├── diagrams/          system-context.md, architecture.md, erd.md, sequence-diagrams.md
└── progress/          README.md, backend-progress.md, frontend-user.md, frontend-admin.md
```

## 5. AI (`ai/`)

```text
ai/
├── project-context.md
├── architecture-rules.md
├── coding-rules.md
├── security-rules.md
├── testing-rules.md
└── task-rules.md
```

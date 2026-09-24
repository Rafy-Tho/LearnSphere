# Folder Structure

Annotated structure of the monorepo.

> **Progress:** the backend is module-based and hardened; the learner frontend and admin refactors are complete. See [`../progress/`](../progress/).

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
    │   ├── stripe.js            Stripe client
    │   └── google-oauth.js      openid-client discovery + PKCE
    ├── db/
    │   ├── migrate.js           Plain-SQL migration runner
    │   ├── seed.js              Optional sample-data runner
    │   ├── reconcile-billing.js Stripe webhook/order reconciliation script
    │   ├── migrations/          CREATE-only migrations (schema source of truth)
    │   ├── seeds/               Optional sample data
    │   └── README.md            How to run migrations
    ├── common/                  Shared infrastructure
    │   ├── errors/api-error.js
    │   ├── http/                async-handler.js, not-found-url.js, response.js
    │   ├── middleware/          require-auth, authorize, validate-result, csrf-protection,
    │   │                        rate-limit-middlewares, session-middleware, session-idle-timeout,
    │   │                        request-logger, list-query-validator, multer, error-handler
    │   ├── auth/                ownership.js, course-lock.js
    │   ├── query/               advanced-query.js, pagination.js, query-spec.js
    │   ├── constants/           constants.js, status-code.js
    │   ├── helper/              create-random-code.js
    │   ├── services/            email-service, hash-service, hash-code, session-service
    │   ├── validation.js        express-validator builders
    │   └── logger.js            Structured logger (+ logger.audit)
    └── modules/                 Feature modules
        ├── auth/                register/login/logout, Google OAuth, email verification, password resets
        ├── users/               profile, password
        ├── categories/          category CRUD
        ├── courses/             courses, objectives, admin/me routes
        ├── content/             modules, chapters, lessons, lesson contents, questions, options
        ├── learning/            enrollments, progress, lesson completion, activities, XP, start
        ├── quiz/                quiz attempts (server-side grading, history/best)
        ├── reviews/             reviews, helpful votes, reports
        ├── saved-courses/       saved/bookmarked courses
        ├── certificates/        eligibility/claim/lookup
        ├── subscriptions/       plans, subscriptions, payments, coupons, refunds, Stripe webhook
        ├── instructor/          instructor dashboard/earnings/payouts + admin review queue
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
    ├── main.jsx                 QueryClientProvider + app
    ├── index.css                Tailwind import + theme.css
    ├── app/
    │   ├── App.jsx              AppProviders (Theme → Auth) + Router
    │   ├── router.jsx           Route definitions + lazy loading
    │   ├── providers.jsx        Theme → Auth providers
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
    │   ├── subscriptions/       pricing, checkout, payment success/cancel, billing tab
    │   ├── dashboard/           learner dashboards
    │   ├── settings/            profile + password
    │   ├── activity/            activity feed + XP summary (no pages)
    │   └── saved/               saved-courses data feature (no pages)
    ├── hooks/                   useIntersectionObserver, useMediaQuery, useMenuState, useScrollEffect, useTheme
    ├── constants/               navLinks, footerLinks, features, faqQuestions, testimonials, lessonIcons, ...
    ├── utils/                   cn, formatting, query parsing
    ├── css/                     theme.css, toast.css, SwiperWrapper.css
    ├── pages/                   NotFoundPage.jsx
    └── assets/
```

## 3. Admin Dashboard (`admin/`)

```text
admin/
├── index.html                   "LearnSphere Admin"
├── vite.config.js               react() + tailwindcss() + @ alias
├── tailwind.config.js           darkMode class, HSL tokens
├── postcss.config.js
├── eslint.config.js
├── jsconfig.json
├── .env                         VITE_BASE_URL
└── src/
    ├── main.jsx                 StrictMode + App
    ├── app/
    │   ├── App.jsx              Providers (QueryClient → Tooltip → Toaster → Auth) + Router
    │   ├── router.jsx           Route definitions + lazy loading
    │   ├── providers/           AuthProvider, context.js
    │   └── guards/              RequireAuth, RedirectIfAuthenticated, RequireRole
    ├── features/
    │   ├── auth/                pages, hooks, services
    │   ├── dashboard/           pages, components, hooks, services
    │   ├── categories/          pages, hooks, services
    │   ├── users/               pages, hooks, services
    │   ├── courses/             pages, components, hooks, services (incl. content tree builder)
    │   ├── subscriptions/       pages, components, hooks, services (plans/subs/payments/refunds/coupons)
    │   ├── instructor/          pages, components, hooks, services (dashboard, earnings, course tabs)
    │   └── payouts/             pages, hooks, services (revenue-share + payout records)
    ├── components/
    │   ├── ui/                  shadcn-style Radix primitives
    │   └── common/              DataTable, PaginationTable, FormModal, StatusBadge, NavLink, ConfirmDialog
    ├── layouts/
    │   ├── AdminLayout.jsx
    │   └── AdminSidebar.jsx
    ├── pages/                   RoleHome.jsx, NotFound.jsx, NoAccess.jsx
    ├── lib/                     apiClient.js, queryClient.js, queryKeys.js, utils.js
    ├── hooks/                   use-mobile, use-theme, use-toast, use-debounced-value (non-feature)
    ├── constants/               navItems.js (role-filtered navigation)
    ├── utils/                   parseQueryToObject.js
    └── index.css                Tailwind + theme tokens
```

## 4. Documentation (`docs/`)

```text
docs/
├── 01-planning/       project-overview.md, scope.md
├── 02-requirements/   requirements.md, business-rules.md, acceptance-criteria.md
├── 03-analysis/       use-cases.md, workflows.md
├── 04-design/         architecture.md, database-design.md, api-design.md, security.md, instructor-dashboard.md
├── 05-development/    coding-standards.md, folder-structure.md, git-workflow.md, environment-setup.md
├── 06-testing/        test-strategy.md, test-cases.md
├── 07-deployment/     deployment.md, production-checklist.md
├── 08-implement/      data-seed/
├── diagrams/          system-context.md, architecture.md, erd.md, sequence-diagrams.md
└── progress/          README.md, backend-progress.md, frontend-user.md, frontend-admin.md, instructor-dashboard.md
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

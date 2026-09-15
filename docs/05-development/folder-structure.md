# Folder Structure

Annotated structure of the monorepo.

> **Backend refactor (structure complete):** the backend follows the module-based architecture (`app/`, `config/`, `db/`, `common/`, `modules/`). Target: [`docs/08-refactoring/backend/01-structure.md`](../08-refactoring/backend/01-structure.md); tasks: [`docs/09-implement/tasks/`](../09-implement/tasks/); status: [`docs/09-implement/progress-tracking.md`](../09-implement/progress-tracking.md).

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
    ├── config/                  Configuration + infrastructure (migrated)
    │   ├── Env.js               Loads dotenv, exports ENV
    │   ├── database.js          pg Pool + withTransaction()
    │   └── cloudinary.js        connectCloudinary()
    ├── db/
    │   └── schema.sql           Authoritative DDL baseline (migrations pending)
    ├── common/                  Shared infrastructure (migrated)
    │   ├── errors/ApiError.js
    │   ├── http/                asyncHandler.js, notFoundUrl.js, response.js
    │   ├── middleware/          requireAuth, authorize, validateResult, rateLimitMiddlewares, sessionMiddleware, multer, errorHandler
    │   ├── auth/ownership.js    assertOwnership()
    │   ├── query/AdvaceQuery.js AdvancedQuery builder (filename typo)
    │   ├── constants/           constants.js, StatusCode.js
    │   ├── helper/createRadomCode.js
    │   ├── services/            EmailService, HashService, HashCode, SessionService
    │   ├── validation.js        express-validator builders
    │   └── logger.js            Structured logger
    ├── modules/                 Feature modules (all migrated)
    │   ├── auth/                register/login/session/password reset
    │   │   ├── routes.js
    │   │   ├── controller.js
    │   │   ├── service.js
    │   │   ├── repository.js    Password reset code SQL
    │   │   └── validation.js
    │   ├── users/               profile/xp + UserRepository
    │   │   ├── routes.js
    │   │   ├── controller.js
    │   │   ├── service.js
    │   │   ├── repository.js    UserRepository
    │   │   └── validation.js
    │   ├── categories/          Category CRUD
    │   │   ├── routes.js
    │   │   ├── controller.js
    │   │   ├── service.js
    │   │   ├── repository.js    CategoryRepository
    │   │   └── validation.js
    │   ├── courses/             Courses + objectives
    │   │   ├── routes.js        Course endpoints + nested mounts
    │   │   ├── objectives.routes.js
    │   │   ├── controller.js
    │   │   ├── service.js
    │   │   ├── repository.js    CourseRepository
    │   │   ├── objectives.repository.js
    │   │   └── validation.js
    │   ├── content/             Modules/chapters/lessons/contents/quizzes/options
    │   │   ├── module.routes.js, chapter.routes.js, lesson.routes.js
    │   │   ├── lessonContent.routes.js, question.routes.js, answer.routes.js
    │   │   ├── controller.js
    │   │   ├── service.js
    │   │   ├── module.repository.js, chapter.repository.js, lesson.repository.js
    │   │   ├── lessonContent.repository.js, question.repository.js, answer.repository.js
    │   │   └── validation.js
    │   ├── learning/            Enrollments/progress/lesson completion
    │   │   ├── enrollment.routes.js, progress.routes.js, completion.routes.js
    │   │   ├── controller.js
    │   │   ├── service.js
    │   │   ├── repository.js    EnrollmentRepository
    │   │   ├── progress.repository.js
    │   │   ├── completion.repository.js
    │   │   └── validation.js
    │   ├── reviews/             Reviews/helpful votes/reports
    │   │   ├── routes.js
    │   │   ├── controller.js
    │   │   ├── service.js
    │   │   ├── repository.js    ReviewRepository
    │   │   └── validation.js
    │   ├── certificates/        Eligibility/claim/lookup
    │   │   ├── routes.js
    │   │   ├── controller.js
    │   │   ├── service.js
    │   │   └── repository.js    CertificateRepository
    │   ├── subscriptions/       Plans/subscriptions/payments/Stripe
    │   │   ├── routes.js        User-facing /subscriptions
    │   │   ├── payment.routes.js
    │   │   ├── admin.routes.js  /admin/subscriptions
    │   │   ├── webhook.routes.js
    │   │   ├── controller.js
    │   │   ├── admin.controller.js
    │   │   ├── service.js
    │   │   └── repository.js    SubscriptionRepository
    │   └── admin/               Dashboard stats + admin user management
    │       ├── routes.js        /users/dashboard-data
    │       ├── users.routes.js  /admin/users
    │       ├── controller.js
    │       ├── users.controller.js
    │       ├── service.js
    │       └── users.service.js
```

## 2. Learner Frontend (`frontend/`)

```text
frontend/
├── index.html                   Root + Font Awesome CDN
├── vite.config.js               react() + tailwindcss()
├── eslint.config.js
├── jsconfig.json
├── .env                         VITE_BASE_URL
└── src/
    ├── main.jsx                 Providers: Query → Theme → Auth → App
    ├── App.jsx                  Route definitions + guards
    ├── index.css                Tailwind import, dark variant, globals
    ├── api/
    │   └── client.js            ApiClient (fetch wrapper, credentials, 401 handling)
    ├── services/                auth.js, users.js, courses.js, lessons.js, reviews.js, subscriptions.js, categories.js
    ├── contexts/                context.js, AuthContext.jsx, ThemeContext.jsx
    ├── hooks/
    │   ├── queries/             Canonical query hooks (useAuth, useCourses, useLessons, ...)
    │   ├── mutations/           Canonical mutation hooks
    │   ├── auth/ course/ user/ subscription/   Feature re-export shims
    │   └── useTheme.js, useAuth.js, useScrollEffect.js, useMobile.js, ...
    ├── pages/                   Home, Login, Signup, CourseScreen, CourseDetailScreen, LearningDashboard, ...
    ├── components/
    │   ├── navbar/, learningNavbar/, home/, LearningDashBoard/
    │   ├── course/, courseDetail/, courseLearning/, courseLearning/quiz/
    │   ├── courseReview/, pricing/, setting/, form/, resetPasswordForm/
    │   ├── redirectRoutes/      IsAuthenticate, ProtectRoute, RedirectToFirstLesson
    │   └── ui/                  ErrorBoundary, AsyncBoundary
    ├── ui/                      SpinnerLoader, ErrorMessage, NotFoundPage, ConfirmDialog, StarRating, ...
    ├── constants/               navLinks, footerLinks, courseFilterData, features, ...
    ├── utils/                   parseQueryToString/Object, formatTimeAgo, formatMinutes, ...
    ├── helper/                  ResetFlow, ResendTimer, OpenCloseMediaQuery
    ├── css/                     constant.css (Tailwind safelist), SwiperWrapper.css
    ├── socialSvg/               Brand SVG icons
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
    │                            LessonApi, ContentApi, QuestionApi, OptionApi, ObjectiveApi, SubscriptionApi
    ├── contexts/
    │   └── AuthContext.jsx      login/logout, useGetMe bootstrap
    ├── hooks/
    │   ├── use-mobile.jsx, use-theme.js, use-toast.js
    │   ├── auth/, category/, course/, course-details/, dashboard-data/
    │   ├── chapters/, modules/, lessons/, contents/, objectives/, options/, questions/
    │   ├── subscription/, user/
    ├── pages/                   DashboardPage, LoginPage, CategoriesPage, CoursesPage, CourseDetailPage,
    │                            SubscriptionsPage, UsersPage, ProfilePage, NotFound
    ├── components/
    │   ├── AdminLayout.jsx, AdminSidebar.jsx, NavLink.jsx
    │   ├── DataTable.jsx, PaginationTable.jsx, FormModal.jsx, StatsCard.jsx, StatusBadge.jsx
    │   ├── courseDetail/        CourseHeader, ObjectivesCard, ModuleCard, ChapterItem, LessonItem,
    │   │                        ContentItem, QuizItem, *Modal, DeleteConfirmDialog
    │   ├── subscriptions/       SubscriptionStats, PlansTab, SubscriptionsTab, PaymentsTab, *Modal
    │   └── ui/                  ~65 shadcn-style Radix primitives
    ├── libs/
    │   └── utils.js             cn() = clsx + tailwind-merge
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
├── 08-refactoring/    audits + architecture/backend/API/DB/perf/security plans
├── 09-implement/      decisions.md, progress-tracking.md, tasks/
└── diagrams/          system-context.md, architecture.md, erd.md, sequence-diagrams.md
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

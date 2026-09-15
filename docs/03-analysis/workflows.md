# Workflows

End-to-end workflows showing how requests flow through the frontend, backend, and database. Each workflow lists the participating files.

## 1. Authentication Workflow

**Participants:** `frontend/src/services/auth.js`, `frontend/src/api/client.js`, `backend/src/modules/auth/routes.js`, `backend/src/modules/auth/controller.js`, `backend/src/modules/auth/service.js`, `backend/src/common/services/HashService.js`, `backend/src/common/services/SessionService.js`, `backend/src/common/middleware/sessionMiddleware.js`.

```mermaid
sequenceDiagram
  participant U as User
  participant F as Frontend
  participant A as API
  participant DB as PostgreSQL

  U->>F: Submit login form
  F->>A: POST /api/v1/users/login (credentials: include)
  A->>DB: SELECT user by email
  DB-->>A: user row
  A->>A: bcrypt.compare(password, hash)
  alt valid
    A->>DB: UPDATE users SET last_login
    A->>DB: INSERT INTO session
    A-->>F: 200 { user } + Set-Cookie
    F->>F: saveAuth(user) to localStorage
    F-->>U: Redirect to dashboard
  else invalid
    A-->>F: 401 Unauthorized
    F-->>U: Show error toast
  end
```

Steps:

1. Frontend posts credentials via the API client with `credentials: "include"`.
2. Route runs validators then the `login` controller.
3. Controller looks up the user, verifies the password with bcrypt, updates `last_login`, and creates a session via `SessionService.create`.
4. Session is stored in PostgreSQL by `connect-pg-simple`; the HTTP-only cookie is returned.
5. Frontend persists user state and routes to the dashboard.

## 2. Session Validation Workflow

**Participants:** `backend/src/common/middleware/requireAuth.js`, `backend/src/common/middleware/authorize.js`, `backend/src/common/services/SessionService.js`.

```mermaid
flowchart TD
  A[Request to protected route] --> B{session has user.id and user.role?}
  B -- no --> C[401 Unauthorized]
  B -- yes --> D[Set req.user]
  D --> E{authorize role check}
  E -- fail --> F[403 Forbidden]
  E -- pass --> G[Controller]
```

`requireAuth` populates `req.user`; `authorize(...roles)` reads `req.session.user.role` and allows or rejects.

## 3. Course Discovery Workflow

**Participants:** `frontend/src/pages/CourseScreen.jsx`, `frontend/src/hooks/queries/useCourses.js`, `frontend/src/services/courses.js`, `backend/src/modules/courses/routes.js`, `backend/src/modules/courses/service.js`, `backend/src/modules/courses/repository.js`, `backend/src/common/query/AdvaceQuery.js`.

```mermaid
sequenceDiagram
  participant U as User
  participant F as Frontend
  participant A as API
  participant Q as AdvancedQuery
  participant DB as PostgreSQL

  U->>F: Set filters/search (URL params)
  F->>A: GET /api/v1/courses?page=&limit=&search=&level=&sort=
  A->>Q: build filtered/sorted/paginated query
  Q->>DB: SELECT ... + COUNT
  DB-->>Q: rows + total
  Q-->>A: { data, pagination }
  A-->>F: 200 envelope
  F-->>U: Render course grid
```

Filters supported by `CourseRepository` include `level`, `category`, `skill` (mapped to category slug), `rating`, `duration`, and `isFree` (access type). Sorting uses `-field` for descending.

## 4. Enrollment Workflow

**Participants:** `frontend/src/hooks/mutations/useCourseMutations.js`, `backend/src/modules/learning/enrollment.routes.js`, `backend/src/modules/learning/service.js`, `backend/src/modules/learning/repository.js`, `backend/src/modules/learning/progress.repository.js`.

```mermaid
sequenceDiagram
  participant L as Learner
  participant F as Frontend
  participant A as API
  participant DB as PostgreSQL

  L->>F: Click Enroll
  F->>A: POST /api/v1/courses/:id/enrollments
  A->>DB: INSERT INTO enrollments (user, course)
  A->>DB: SELECT first lesson
  A->>DB: INSERT INTO learn_progress (user, course, lesson)
  A-->>F: 201 { enrollment }
  F-->>L: Redirect to first lesson
```

Duplicate enrollments are prevented by the `UNIQUE(user_id, course_id)` constraint. Subscription-gated courses require an active subscription (checked when learning data is fetched).

## 5. Learning & Progress Workflow

**Participants:** `frontend/src/components/courseLearning/NextPrevious.jsx`, `frontend/src/components/courseLearning/LessonContent.jsx`, `frontend/src/hooks/mutations/useCourseMutations.js`, `backend/src/modules/learning/service.js`, `backend/src/modules/learning/controller.js`.

```mermaid
sequenceDiagram
  participant L as Learner
  participant F as Frontend
  participant A as API
  participant DB as PostgreSQL

  L->>F: Open lesson
  F->>A: GET /api/v1/courses/:id/learn
  A-->>F: hierarchy + content + completion
  L->>F: Mark complete / next lesson
  F->>A: POST /api/v1/lessons/:id/completions
  A->>DB: INSERT lesson_completion (xp, time_spent)
  F->>A: PATCH /api/v1/courses/:id/progresses
  A->>DB: UPSERT learn_progress (current lesson)
  A-->>F: updated state
```

Lesson HTML is sanitized with DOMPurify before rendering.

## 6. Quiz Workflow

**Participants:** `frontend/src/components/courseLearning/quiz/Quiz.jsx`, `frontend/src/hooks/queries/useLessons.js`, `backend/src/modules/content/service.js`, `backend/src/modules/content/lesson.repository.js`.

```mermaid
stateDiagram-v2
  [*] --> Start
  Start --> Questions: Begin
  Questions --> Questions: Next / Prev
  Questions --> Results: Submit
  Results --> [*]: Review / Retry
```

The quiz endpoint returns questions with options; results are computed in the frontend state machine and completion is recorded through the completion workflow.

## 7. Review Workflow

**Participants:** `frontend/src/components/courseReview/ReviewContainer.jsx`, `frontend/src/hooks/mutations/useCourseMutations.js`, `backend/src/modules/reviews/controller.js`, `backend/src/modules/reviews/service.js`, `backend/src/modules/reviews/repository.js`.

```mermaid
sequenceDiagram
  participant L as Learner
  participant F as Frontend
  participant A as API
  participant DB as PostgreSQL

  L->>F: Submit rating + text
  F->>A: POST /api/v1/courses/:id/reviews
  A->>DB: INSERT INTO course_reviews
  A-->>F: 201 review
  F->>A: GET /api/v1/courses/:id/reviews/summary
  A->>DB: aggregate avg + histogram
  A-->>F: summary
  F-->>L: Refresh review list/summary
```

Helpful votes toggle via `POST /reviews/:id/helpful-votes`; reports via `POST /reviews/:id/reports`.

## 8. Subscription & Payment Workflow

**Participants:** `frontend/src/components/pricing/PricingCard.jsx`, `frontend/src/hooks/mutations/useUserMutations.js`, `backend/src/modules/subscriptions/service.js` (`createStripeSession`), `backend/src/modules/subscriptions/webhook.routes.js`, `backend/src/common/services/EmailService.js`.

```mermaid
sequenceDiagram
  participant L as Learner
  participant F as Frontend
  participant A as API
  participant S as Stripe
  participant W as Webhook
  participant DB as PostgreSQL

  L->>F: Select plan / Pay
  F->>A: POST /api/v1/users/payment-stripe/:subscriptionId
  A->>S: Create Checkout Session
  S-->>A: session.url
  A-->>F: { session_url }
  F-->>L: Redirect to Stripe
  L->>S: Complete payment
  S->>W: POST /api/v1/stripe-webhook (checkout.session.completed)
  W->>W: Verify signature
  W->>DB: Expire prior active subscriptions
  W->>DB: INSERT user_subscriptions
  W->>DB: INSERT subscription_payments (COMPLETED)
  W->>L: Payment confirmation email
  S-->>F: Redirect to /payment-success
```

The webhook is mounted before JSON body parsing so it can verify the raw request body against the Stripe signature.

## 9. Admin Content Authoring Workflow

**Participants:** `admin/src/pages/CourseDetailPage.jsx`, `admin/src/hooks/course-details/*`, `admin/src/services/*Api.js`, `backend/src/routes/*`.

```mermaid
flowchart TD
  A[Open course detail] --> B[Load dashboard-details]
  B --> C{Action}
  C -->|Module| D[POST /courses/:id/modules]
  C -->|Chapter| E[POST /modules/:id/chapters]
  C -->|Lesson| F[POST /chapters/:id/lessons]
  C -->|Content| G[POST /lessons/:id/contents]
  C -->|Quiz| H[POST /lessons/:id/questions]
  C -->|Option| I[POST /questions/:id/options]
  D --> J[Invalidate course-details]
  E --> J
  F --> J
  G --> J
  H --> J
  I --> J
  J --> B
```

Each mutation invalidates the `['course-details', courseId]` query key, triggering a refetch that rehydrates the local content tree.

## 10. Error Handling Workflow

**Participants:** `backend/src/common/middleware/errorHandler.js`, `backend/src/common/errors/ApiError.js`, `backend/src/common/middleware/validateResult.js`.

```mermaid
flowchart TD
  A[Request] --> B{Validation error?}
  B -- yes --> C[422 first message]
  B -- no --> D{Controller throws?}
  D -- no --> E[200/201 envelope]
  D -- yes --> F{pg SQLSTATE}
  F -->|23505| G[409 conflict]
  F -->|23503| H[400 FK violation]
  F -->|23502| I[400 required field]
  F -->|22P02| J[400 invalid input]
  F -->|other| K[500 internal]
  F --> L[Include stack in development]
```

All controllers are wrapped in `asyncHandler` so rejected promises reach the central error handler.

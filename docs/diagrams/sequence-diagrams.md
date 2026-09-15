# Sequence Diagrams

Detailed interaction flows across clients, API, database, and external services.

## 1. Login

```mermaid
sequenceDiagram
  autonumber
  actor U as User
  participant F as Frontend
  participant A as API
  participant S as SessionService
  participant DB as PostgreSQL

  U->>F: Enter email/password
  F->>A: POST /api/v1/users/login
  A->>A: validateLogin + validateResult
  A->>DB: SELECT * FROM users WHERE email=$1
  DB-->>A: user
  A->>A: bcrypt.compare
  alt valid
    A->>DB: UPDATE users SET last_login
    A->>S: create(req, user)
    S->>DB: INSERT INTO session
    A-->>F: 200 { user } + Set-Cookie
    F->>F: saveAuth(user)
    F-->>U: Redirect to dashboard
  else invalid
    A-->>F: 401 Unauthorized
    F-->>U: Error toast
  end
```

## 2. Registration

```mermaid
sequenceDiagram
  autonumber
  actor U as User
  participant F as Frontend
  participant A as API
  participant H as HashService
  participant DB as PostgreSQL
  participant E as EmailService

  U->>F: Submit signup
  F->>A: POST /api/v1/users/register
  A->>A: validateRegister
  A->>H: hash(password)
  A->>DB: INSERT users + user_profiles
  DB-->>A: user
  A->>DB: INSERT session
  A->>E: sendWelcome(email)
  A-->>F: 201 { user } + cookie
  F-->>U: Redirect to dashboard
```

## 3. Password Reset

```mermaid
sequenceDiagram
  autonumber
  actor U as User
  participant F as Frontend
  participant A as API
  participant DB as PostgreSQL
  participant E as EmailService

  U->>F: Enter email
  F->>A: POST /users/password-reset-code
  A->>A: generate 6-digit code
  A->>A: SHA-256 hash + 10-min expiry
  A->>DB: INSERT password_reset_codes
  A->>E: sendResetCode(email, code)
  A-->>F: 200
  U->>F: Enter code
  F->>A: POST /users/verify-password-reset-code
  A->>DB: find + check expiry + attempts
  A-->>F: 200 verified
  U->>F: Enter new password
  F->>A: POST /users/reset-password
  A->>DB: UPDATE users.password, DELETE code
  A-->>F: 200
```

## 4. Course Discovery & Enrollment

```mermaid
sequenceDiagram
  autonumber
  actor L as Learner
  participant F as Frontend
  participant A as API
  participant Q as AdvancedQuery
  participant DB as PostgreSQL

  L->>F: Browse /courses
  F->>A: GET /courses?filters
  A->>Q: build()
  Q->>DB: SELECT + COUNT
  A-->>F: { data, pagination }
  F-->>L: Course grid
  L->>F: Open course + Enroll
  F->>A: POST /courses/:id/enrollments
  A->>DB: INSERT enrollments
  A->>DB: INSERT learn_progress (first lesson)
  A-->>F: 201
  F-->>L: Redirect to first lesson
```

## 5. Learning a Lesson

```mermaid
sequenceDiagram
  autonumber
  actor L as Learner
  participant F as Frontend
  participant A as API
  participant DB as PostgreSQL

  L->>F: Open /courses/:id/lessons/:lessonId
  F->>A: GET /courses/:id/learn
  A->>DB: aggregate hierarchy + completion
  A-->>F: learning data
  F->>F: DOMPurify.sanitize(content)
  F-->>L: Render lesson
  L->>F: Complete / Next
  F->>A: POST /lessons/:id/completions
  A->>DB: INSERT lesson_completion
  F->>A: PATCH /courses/:id/progresses
  A->>DB: UPSERT learn_progress
  A-->>F: updated progress
```

## 6. Quiz Attempt

```mermaid
sequenceDiagram
  autonumber
  actor L as Learner
  participant F as Frontend
  participant A as API
  participant DB as PostgreSQL

  L->>F: Open quiz lesson
  F->>A: GET /lessons/:id/questions
  A->>DB: SELECT quizzes + json_agg(options)
  A-->>F: questions + options
  L->>F: Answer + submit
  F->>F: evaluate answers (state machine)
  F-->>L: Results + explanations
  F->>A: POST /lessons/:id/completions
  A->>DB: INSERT lesson_completion
  A-->>F: 201
```

## 7. Review Submission

```mermaid
sequenceDiagram
  autonumber
  actor L as Learner
  participant F as Frontend
  participant A as API
  participant DB as PostgreSQL

  L->>F: Submit rating + text
  F->>A: POST /courses/:id/reviews
  A->>A: reviewValidator
  A->>DB: INSERT course_reviews
  A-->>F: 201
  F->>A: GET /courses/:id/reviews/summary
  A->>DB: aggregate avg + histogram
  A-->>F: summary
  F-->>L: Updated review section
```

## 8. Helpful Vote Toggle

```mermaid
sequenceDiagram
  autonumber
  actor L as Learner
  participant F as Frontend
  participant A as API
  participant DB as PostgreSQL

  L->>F: Click helpful
  F->>A: POST /reviews/:id/helpful-votes
  A->>DB: SELECT existing vote
  alt exists
    A->>DB: UPDATE/DELETE vote
  else new
    A->>DB: INSERT vote
  end
  A-->>F: updated count
  F-->>L: Toggle state
```

## 9. Subscription Checkout & Webhook

```mermaid
sequenceDiagram
  autonumber
  actor L as Learner
  participant F as Frontend
  participant A as API
  participant S as Stripe
  participant W as Webhook
  participant DB as PostgreSQL
  participant E as EmailService

  L->>F: Choose plan + Pay
  F->>A: POST /users/payment-stripe/:subscriptionId
  A->>S: checkout.sessions.create
  S-->>A: session.url
  A-->>F: { session_url }
  F-->>L: Redirect to Stripe
  L->>S: Complete payment
  S->>W: POST /stripe-webhook (checkout.session.completed)
  W->>W: constructEvent + verify signature
  W->>DB: expire prior ACTIVE subscriptions
  W->>DB: INSERT user_subscriptions
  W->>DB: INSERT subscription_payments (COMPLETED)
  W->>E: sendPaymentConfirmation
  S-->>F: Redirect /payment-success
  F->>A: GET /subscriptions/user-active
  A-->>F: active subscription
```

## 10. Admin Course Authoring

```mermaid
sequenceDiagram
  autonumber
  actor AD as Admin
  participant AF as Admin Frontend
  participant A as API
  participant DB as PostgreSQL

  AD->>AF: Open course detail
  AF->>A: GET /courses/:id/dashboard-details
  A->>DB: aggregate full content tree
  A-->>AF: tree
  AD->>AF: Add module
  AF->>A: POST /courses/:id/modules
  A->>DB: INSERT modules
  A-->>AF: 201
  AD->>AF: Add chapter
  AF->>A: POST /modules/:id/chapters
  AD->>AF: Add lesson
  AF->>A: POST /chapters/:id/lessons
  AD->>AF: Add content/question/option
  AF->>A: POST nested content endpoints
  AF->>AF: invalidate ['course-details', courseId]
  AF->>A: GET /courses/:id/dashboard-details
  A-->>AF: refreshed tree
```

## 11. Session Validation (Protected Request)

```mermaid
sequenceDiagram
  autonumber
  participant C as Client
  participant MW as requireAuth
  participant AZ as authorize
  participant Ctl as Controller
  participant DB as PostgreSQL

  C->>MW: Request with session cookie
  MW->>MW: SessionService.validate(req)
  alt no session.user
    MW-->>C: 401 Unauthorized
  else valid
    MW->>MW: req.user = user
    MW->>AZ: next()
    alt role not allowed
      AZ-->>C: 403 Forbidden
    else allowed
      AZ->>Ctl: next()
      Ctl->>DB: query
      DB-->>Ctl: rows
      Ctl-->>C: 200 envelope
    end
  end
```

## 12. Error Handling

```mermaid
sequenceDiagram
  autonumber
  participant C as Client
  participant Ctl as Controller
  participant R as Repository
  participant DB as PostgreSQL
  participant EH as Error Handler

  C->>Ctl: Request
  Ctl->>R: query
  R->>DB: SQL
  DB-->>R: error (e.g. 23505)
  R-->>Ctl: throw
  Ctl-->>EH: next(err) via asyncHandler
  EH->>EH: map SQLSTATE
  EH-->>C: 409 { success:false, message }
```

# Entity Relationship Diagram (ERD)

The database contains 22 declared tables plus a runtime `session` table. Grouped by domain for readability.

## 1. Full ERD

```mermaid
erDiagram
  users {
    uuid id PK
    varchar name
    varchar email UK
    text image_url
    varchar password
    user_role role
    user_status status
    timestamptz last_login
    timestamptz created_at
    timestamptz updated_at
  }
  user_profiles {
    uuid id PK
    uuid user_id UK
    text bio
    varchar location
    varchar phone
    date date_birth
    gender gender
    timestamptz created_at
    timestamptz updated_at
  }
  password_reset_codes {
    uuid id PK
    uuid user_id FK
    varchar code
    int attempts
    timestamptz expires_at
    timestamptz created_at
    timestamptz updated_at
  }
  categories {
    uuid id PK
    varchar name UK
    text slug UK
    text description
    timestamptz created_at
    timestamptz updated_at
  }
  courses {
    uuid id PK
    uuid instructor_id FK
    uuid category_id FK
    varchar name
    text slug UK
    text description
    content_status status
    course_level level
    access_course_type access_type
    int position
    timestamptz deleted_at
    timestamptz created_at
    timestamptz updated_at
  }
  course_objectives {
    uuid id PK
    uuid course_id FK
    text content
    int position
    timestamptz created_at
    timestamptz updated_at
  }
  modules {
    uuid id PK
    uuid course_id FK
    int position
    varchar name
    text description
    content_status status
    timestamptz created_at
    timestamptz updated_at
  }
  chapters {
    uuid id PK
    uuid module_id FK
    int position
    varchar name
    text description
    content_status status
    timestamptz created_at
    timestamptz updated_at
  }
  lessons {
    uuid id PK
    uuid chapter_id FK
    int position
    varchar name
    text description
    lesson_type type
    content_status status
    int xp_points
    int duration_minutes
    timestamptz created_at
    timestamptz updated_at
  }
  lesson_contents {
    uuid id PK
    uuid lesson_id FK
    int position
    varchar name
    text content
    timestamptz created_at
    timestamptz updated_at
  }
  quizzes {
    uuid id PK
    uuid lesson_id UK
    text question
    text explanation
    int position
    timestamptz created_at
    timestamptz updated_at
  }
  quiz_options {
    uuid id PK
    uuid quiz_id FK
    text text
    boolean is_correct
    int position
    timestamptz created_at
    timestamptz updated_at
  }
  enrollments {
    uuid id PK
    uuid user_id FK
    uuid course_id FK
    access_course_type access_type
    timestamptz enrolled_at
    timestamptz expires_at
    timestamptz updated_at
  }
  learn_progress {
    uuid id PK
    uuid user_id FK
    uuid course_id FK
    uuid lesson_id FK
    timestamptz created_at
    timestamptz updated_at
  }
  lesson_completion {
    uuid id PK
    uuid user_id FK
    uuid course_id FK
    uuid lesson_id FK
    timestamp completed_at
    int time_spent_minutes
    int xp_earned
    timestamp created_at
  }
  certificates {
    uuid id PK
    uuid user_id FK
    uuid course_id FK
    boolean confirm
    varchar certificate_number UK
    text certificate_url
    timestamptz issued_at
  }
  subscription_plans {
    uuid id PK
    varchar name
    int duration_days
    numeric price
    timestamptz created_at
    timestamptz updated_at
  }
  user_subscriptions {
    uuid id PK
    uuid user_id FK
    uuid plan_id FK
    timestamptz start_date
    timestamptz end_date
    subscription_status status
    timestamptz created_at
    timestamptz updated_at
  }
  subscription_payments {
    uuid id PK
    uuid user_subscription_id FK
    numeric amount
    payment_status payment_status
    text stripe_payment_intent_id UK
    timestamptz created_at
    timestamptz updated_at
  }
  course_reviews {
    uuid id PK
    uuid user_id FK
    uuid course_id FK
    int rating
    text review
    timestamptz created_at
    timestamptz updated_at
  }
  review_helpful_votes {
    uuid id PK
    uuid user_id FK
    uuid review_id FK
    boolean is_helpful
    timestamptz created_at
  }
  review_reports {
    uuid id PK
    uuid user_id FK
    uuid review_id FK
    varchar reason
    text description
    timestamptz created_at
  }

  users ||--o| user_profiles : "has profile"
  users ||--o{ password_reset_codes : "requests"
  users ||--o{ courses : "instructs"
  categories ||--o{ courses : "classifies"
  courses ||--o{ course_objectives : "has"
  courses ||--o{ modules : "contains"
  modules ||--o{ chapters : "contains"
  chapters ||--o{ lessons : "contains"
  lessons ||--o{ lesson_contents : "has"
  lessons ||--o| quizzes : "has"
  quizzes ||--o{ quiz_options : "has"
  users ||--o{ enrollments : "enrolls"
  courses ||--o{ enrollments : "receives"
  users ||--o{ learn_progress : "tracks"
  courses ||--o{ learn_progress : "tracks"
  lessons ||--o{ learn_progress : "current"
  users ||--o{ lesson_completion : "completes"
  courses ||--o{ lesson_completion : "records"
  lessons ||--o{ lesson_completion : "completed"
  users ||--o{ certificates : "earns"
  courses ||--o{ certificates : "grants"
  subscription_plans ||--o{ user_subscriptions : "chosen"
  users ||--o{ user_subscriptions : "owns"
  user_subscriptions ||--o{ subscription_payments : "billed"
  users ||--o{ course_reviews : "writes"
  courses ||--o{ course_reviews : "reviewed"
  course_reviews ||--o{ review_helpful_votes : "voted"
  course_reviews ||--o{ review_reports : "reported"
```

## 2. Content Hierarchy

```mermaid
erDiagram
  courses ||--o{ modules : has
  modules ||--o{ chapters : has
  chapters ||--o{ lessons : has
  lessons ||--o{ lesson_contents : has
  lessons ||--o| quizzes : has
  quizzes ||--o{ quiz_options : has
  courses ||--o{ course_objectives : has
```

## 3. Learning Domain

```mermaid
erDiagram
  users ||--o{ enrollments : has
  courses ||--o{ enrollments : has
  users ||--o{ learn_progress : has
  courses ||--o{ learn_progress : has
  lessons ||--o{ learn_progress : current
  users ||--o{ lesson_completion : has
  lessons ||--o{ lesson_completion : has
  users ||--o{ certificates : has
  courses ||--o{ certificates : has
```

## 4. Billing Domain

```mermaid
erDiagram
  subscription_plans ||--o{ user_subscriptions : has
  users ||--o{ user_subscriptions : owns
  user_subscriptions ||--o{ subscription_payments : has
```

## 5. Reviews Domain

```mermaid
erDiagram
  users ||--o{ course_reviews : writes
  courses ||--o{ course_reviews : has
  course_reviews ||--o{ review_helpful_votes : has
  course_reviews ||--o{ review_reports : has
```

## 6. Relationship & Constraint Summary

| Parent | Child | FK | On Delete | Cardinality |
|---|---|---|---|---|
| users | user_profiles | user_id | CASCADE | 1:1 |
| users | password_reset_codes | user_id | CASCADE | 1:N |
| users | courses | instructor_id | CASCADE | 1:N |
| categories | courses | category_id | **RESTRICT** | 1:N |
| courses | course_objectives | course_id | CASCADE | 1:N |
| courses | modules | course_id | CASCADE | 1:N |
| modules | chapters | module_id | CASCADE | 1:N |
| chapters | lessons | chapter_id | CASCADE | 1:N |
| lessons | lesson_contents | lesson_id | CASCADE | 1:N |
| lessons | quizzes | lesson_id | CASCADE | 1:1 |
| quizzes | quiz_options | quiz_id | CASCADE | 1:N |
| users | enrollments | user_id | CASCADE | 1:N |
| courses | enrollments | course_id | CASCADE | 1:N |
| users | learn_progress | user_id | CASCADE | 1:N |
| courses | learn_progress | course_id | CASCADE | 1:N |
| lessons | learn_progress | lesson_id | **SET NULL** | 1:N |
| users | lesson_completion | user_id | CASCADE | 1:N |
| lessons | lesson_completion | lesson_id | CASCADE | 1:N |
| users | certificates | user_id | CASCADE | 1:N |
| courses | certificates | course_id | CASCADE | 1:N |
| subscription_plans | user_subscriptions | plan_id | CASCADE | 1:N |
| users | user_subscriptions | user_id | CASCADE | 1:N (≤1 ACTIVE) |
| user_subscriptions | subscription_payments | user_subscription_id | CASCADE | 1:N |
| users | course_reviews | user_id | CASCADE | 1:N |
| courses | course_reviews | course_id | CASCADE | 1:N |
| course_reviews | review_helpful_votes | review_id | CASCADE | 1:N |
| course_reviews | review_reports | review_id | CASCADE | 1:N |

### Key Unique Constraints

| Table | Unique |
|---|---|
| users | email |
| categories | name, slug |
| courses | slug |
| modules | (course_id, position) |
| chapters | (module_id, position) |
| lessons | (chapter_id, position) |
| lesson_contents | (lesson_id, position) |
| quizzes | lesson_id, (lesson_id, position) |
| quiz_options | (quiz_id, position) |
| enrollments | (user_id, course_id) |
| learn_progress | (user_id, course_id) |
| lesson_completion | (user_id, lesson_id) |
| certificates | (user_id, course_id), certificate_number |
| subscription_plans | (name, duration_days) |
| user_subscriptions | (user_id) WHERE status='ACTIVE' |
| subscription_payments | stripe_payment_intent_id |
| course_reviews | (user_id, course_id) |
| review_helpful_votes | (user_id, review_id) |
| review_reports | (user_id, review_id) |

> **Note:** The ERD reflects `schema.sql`. The former drift (`lesson_contents`, `lessons.access_type`, `password_reset_codes.code`) is resolved; see `docs/04-design/database-design.md` §9.

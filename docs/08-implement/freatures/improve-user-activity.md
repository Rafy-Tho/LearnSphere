# Learning System Implementation

Implement and improve the learning system across the database, backend, frontend, and UI/UX.

## Scope

The learning system should include:

- Enrollments
- Learning progress
- Lesson completion
- User activities
- XP transactions
- Certificates

Do **not** implement lesson session/time tracking. We are not tracking how long users spend learning.

---

## Database

Use the following responsibilities:

### `enrollments`

Tracks which users have access to which courses.

- user
- course
- access type
- enrollment date
- expiration date
- updated date
- unique user + course

### `learn_progress`

Tracks the user's current position in a course.

- user
- course
- current lesson
- timestamps
- unique user + course

Prefer `current_lesson_id` instead of a generic `lesson_id` so the purpose is clear.

### `lesson_completion`

Tracks completed lessons.

- user
- course
- lesson
- completed date
- unique user + lesson

Do not track time spent.

### `user_activities`

Tracks important user actions/events.

Examples:

- ENROLL_COURSE
- START_COURSE
- START_LESSON
- COMPLETE_LESSON
- START_QUIZ
- COMPLETE_QUIZ
- PASS_QUIZ
- FAIL_QUIZ
- COMPLETE_COURSE
- EARN_CERTIFICATE
- SUBMIT_REVIEW
- BOOKMARK_LESSON

Use `metadata JSONB` for activity-specific information instead of adding many nullable columns.

### `user_xp_transactions`

Tracks XP history.

Examples:

- Lesson completion
- Quiz pass
- Course completion
- Other legitimate XP rewards
- Admin adjustment if required

Store the amount and reason so XP history can be audited.

Do not duplicate XP history unnecessarily in multiple tables. `user_xp_transactions` should be the source of truth for XP transactions.

### `certificates`

One certificate table is sufficient.

Track:

- user
- course
- certificate number
- certificate URL
- issued date
- confirmation date if confirmation is required

Do not create certificate templates or verification-history tables unless they are actually required by the existing project requirements.

---

# Backend

Implement the learning functionality using the project's existing backend architecture and coding conventions.

Create appropriate:

- Routes
- Controllers
- Services
- Database queries/repositories
- Validation
- Authorization
- Error handling

Follow the existing project structure instead of introducing a completely different architecture.

Users should only be able to access and modify their own learning data unless they have the appropriate admin/instructor permissions.

Important actions should create `user_activities` records.

For example:

```text
Enroll course
    ↓
Create enrollment
    ↓
Create ENROLL_COURSE activity

Complete lesson
    ↓
Create lesson completion
    ↓
Update learning progress
    ↓
Create COMPLETE_LESSON activity
    ↓
Create XP transaction
```

Avoid duplicate activities or duplicate XP when the same action is submitted multiple times.

Use database constraints and/or transactional logic where appropriate.

---

# Frontend

Integrate the learning system into the existing React application.

The UI should make the user's learning status easy to understand.

## Course Page

Show relevant information such as:

- Enrollment status
- Course progress
- Current lesson
- Continue Learning action
- Completed lessons
- Course completion status

The user should immediately understand:

> Where am I?
> What have I completed?
> What should I do next?

## Lesson Page

Provide a clear learning flow:

- Course/lesson context
- Current lesson
- Lesson navigation
- Completed state
- Complete lesson action
- Next lesson action when available

Avoid unnecessary UI elements.

## Course Progress

Use a simple visual progress indicator such as:

```text
Course Progress
████████░░ 80%

8 / 10 lessons completed
```

Make the progress visually clear without overwhelming the page.

## XP

Show XP in appropriate locations such as:

- User profile
- Learning dashboard
- Course completion
- Relevant success states

When XP is earned, provide clear but non-intrusive feedback.

Example:

```text
+50 XP
Lesson completed
```

Do not make animations excessive.

## Certificates

After completing the required course requirements:

- Clearly show that the course is completed
- Show certificate availability
- Allow the user to view/download the certificate if supported
- Display certificate number where appropriate
- Show issue date

Certificate UI should feel like an achievement but remain consistent with the overall application design.

## Activity

If the application has a profile/dashboard activity section, display useful recent activities such as:

```text
Completed "Authentication"
Passed "JavaScript Quiz"
Enrolled in "React Fundamentals"
Earned Certificate
Earned 50 XP
```

Use readable timestamps and meaningful activity descriptions.

---

# UI/UX Requirements

Improve the experience as part of the implementation rather than only connecting the API.

Use the existing design system and Tailwind setup.

The design should be:

- Modern
- Clean
- Consistent
- Responsive
- Accessible
- Easy to scan
- Appropriate for an education/learning platform

Avoid unnecessary decoration.

Use clear visual hierarchy for:

- Course title
- Progress
- Current lesson
- Completion status
- XP
- Certificates
- Primary actions

Use consistent:

- Spacing
- Typography
- Buttons
- Cards
- Badges
- Progress indicators
- Empty states
- Loading states
- Error states
- Success states

Do not introduce random colors or one-off styling.

Reuse existing components and design tokens where possible.

Avoid excessive Tailwind utility duplication. Extract reusable UI components when the same pattern appears multiple times.

---

# UX States

Handle all important states.

### Loading

Show appropriate skeleton/loading states instead of a blank page.

### Empty

For example:

```text
No courses completed yet.
Start learning to build your progress.
```

### Success

After completing a lesson:

```text
Lesson completed
+50 XP earned
```

Provide a clear next action.

### Error

Show useful error messages and allow the user to retry where appropriate.

### Already Completed

If a lesson is already completed, don't allow the UI to repeatedly create completion/XP records.

### Course Completed

Provide a clear completion state and certificate action when available.

---

# Data Integrity

Make sure the implementation handles:

- Duplicate enrollment attempts
- Duplicate lesson completion
- Duplicate XP rewards
- Invalid course/lesson relationships
- Unauthorized access
- Missing resources
- Expired course access
- Repeated API requests
- Refreshing the page after completing a lesson

The system should remain consistent if users refresh or repeat requests.

---

# Implementation Approach

Before changing code:

1. Inspect the existing project structure.
2. Understand the current database schema.
3. Understand existing authentication/authorization.
4. Identify existing course, lesson, quiz, review, and user functionality.
5. Reuse existing patterns where possible.
6. Implement the database changes.
7. Implement backend functionality.
8. Integrate the frontend.
9. Improve the UI/UX.
10. Test the complete learning flow.

Do not rewrite unrelated parts of the application.

Keep the implementation simple and maintainable.

The final result should feel like one integrated learning system rather than several unrelated features.

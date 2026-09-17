Implement a complete quiz feature for our existing Learning Online Platform.

First inspect the existing project architecture, database schema, authentication, lesson system, API patterns, frontend structure, and UI components. Follow the existing conventions instead of introducing a new architecture.

### Quiz System

A lesson can have multiple quiz questions, and each question has multiple-choice options.

Use the existing `quizzes` and `quiz_options` tables.

We also want to track users while they take quizzes, including:

- quiz attempts
- selected answers
- correct/incorrect answers
- score
- completion status
- start/completion time
- previous attempts
- ability to retake a quiz

Keep quiz content separate from user attempt/history data.

The backend must be the source of truth for correct answers and scoring. Do not expose correct answers to the frontend while the user is taking the quiz.

### Learner UI/UX

Create a modern, clean learning experience that matches the existing application design.

The quiz experience should include:

- clear quiz introduction/start state
- question-by-question experience
- question progress indicator
- selectable answer cards
- clear selected state
- Previous/Next navigation
- submit confirmation
- loading and error states
- quiz result with score
- correct/incorrect answer review
- previous attempt history
- retake quiz option

Keep the interface focused and distraction-free. Use our existing Tailwind/design system and avoid unnecessary colors, animations, cards, or duplicated styling.

Make it responsive and accessible, especially for mobile users.

### Implementation

Implement this incrementally and keep the changes consistent with the existing project.

Prioritize:

1. Database and quiz attempt tracking
2. Backend API and scoring
3. Learner quiz experience
4. Results and attempt history
5. Validation, security, responsive UX, and cleanup

Before coding, inspect what already exists and reuse existing components, utilities, API patterns, authentication, validation, and state management wherever possible.

Do not modify unrelated features or add unnecessary dependencies.

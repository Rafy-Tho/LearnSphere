# Learner Frontend Progress

**Status:** ✅ Done.

## Done

| Area | What landed |
|---|---|
| Architecture | Feature-based `frontend/src`: `app/`, `layouts/`, `components/{ui,common}`, `lib/`, `features/` (auth, catalog, learning, reviews, subscriptions, dashboard, settings), `@`→`src` alias, route-level `React.lazy`/`Suspense`. |
| Components | Shared primitives `components/ui/*` (Button, Input, Textarea, Select, Modal, Card, Badge, Alert, EmptyState, Skeleton, ProgressBar, SpinnerLoader) + consolidated course cards, form fields, nav, and state components. |
| Performance | Default `staleTime`, scoped `clearUserQueries`, memoized context, removed effect/derived-state cascades, rAF-throttled scroll, list pagination, `manualChunks`. Initial `index` chunk 353.92 → 82.01 kB. |
| API & state | `lib/apiClient.js` (safe parse, `ApiError`, unwrapped `data`, `getPaginated`, `buildQuery`, upload, `AbortSignal`), central `lib/queryKeys.js`, completed invalidation + optimistic vote/report. |
| Design / UI-UX | Tailwind v4 `@theme` tokens (`css/theme.css`), blue + slate, full light/dark parity, tokenized layout/pages/toasts, retired ad-hoc gradients/accents. |
| Quiz experience | Rebuilt `features/learning/pages/Quiz.jsx` as an `intro → taking → results` flow with deferred grading: selectable answer cards, question progress + jump nav, Previous/Next, submit confirmation, score result, per-question review, attempt history, and retake. If a completed attempt exists it opens on the result with "Try Again". New hooks/services (`useQuizAttempts`, `quizAttemptsApi`) + query keys. |
| Email verification | `/verify-email` page with 6-box OTP input (auto-advance, paste), resend + 60s cooldown, error states, and auto-login on success. Signup/Login route unverified users here via `requiresEmailVerification`. |
| Google login | "Continue with Google" on Login/Signup redirects to the backend `/auth/google`. `/auth/callback` page handles success (refreshes `["me"]`, then dashboard), cancelled/failed OAuth, and maps backend error codes to messages (`features/auth/utils/googleOAuth.js`). |
| Saved courses | `features/saved/` services + hooks (`useSavedCourses`, `useSavedCourseIds`, `useToggleSaveCourse` with optimistic update + success/error toasts). Bookmark buttons on `CourseCard`, `CourseCardDetailed`, and the course-detail `HeroSection` fill when saved (guests are sent to `/login`). New "Saved Courses" tab at `/learning-dashboard/saved` reuses `CourseGridSection`. |
| Activity & XP | `features/activity/` (`ActivityFeed`, `ActivityItem`, `useActivities`) backed by `GET /users/me/activities`. Dashboard `ActivitySection` replaced the mock streak with a real recent-activity feed plus XP summary (`total_xp`/`today_xp`). Lesson completion toasts `+N XP` and invalidates activity/XP queries. `POST /lessons/:lessonId/start` fires on lesson open to advance progress. |
| Activity & Certificates pages | Dashboard "Activity" tab (`/learning-dashboard/activity`) lists 20 activities per page with infinite scroll (`useInfiniteActivities` + `useIntersectionObserver`). "Certificates" tab (`/learning-dashboard/certificates`) shows a responsive certificate grid with page-based `Pagination`; shared `CertificateCard`; `CertificationSection` previews six with a "View All" link. |
| XP display | Reusable `XpSummaryCard` (dashboard + account settings): level + progress bar (`utils/xpLevel.js`), today's XP, current day streak, and recent XP gains from `useXpTransactions`. XP summary endpoint now also returns `streak_days`. |
| Learning flow UI | Course-detail `HeroSection` shows enrollment status, course progress (`ProgressBar` + `n / total lessons completed`), current lesson, and switches between Start / Continue / Review. Lesson footer (`NextPrevious`) shows completion, next lesson, and a certificate claim/view action when the course is complete. |
| Billing & subscriptions | Pricing now renders plans from `GET /plans` (removed hardcoded `constants/plans.js` and UUIDs). New `Checkout` page (`/checkout/:planId`) with coupon apply/remove and server-calculated subtotal/discount/total. New Billing tab (`/learning-dashboard/billing`) showing current/expired plan, dates, days remaining, and paginated payment history (table → cards on mobile) with a payment-details modal (refund breakdown). Shared `BillingStatusBadge` (icon + label); `PaymentSuccess` uses real payment data. Settings subscription panel uses API plans. |
| Responsive pass | Mobile-first audit across catalog, course detail, auth, dashboard, learning, settings, subscriptions. Removed forced min-widths (`AppLayout` `min-w-sm`, `Home` `min-w-xs`) and horizontal overflow (catalog `LearningRoadmap`/lesson content padding, OTP boxes, theme dropdown, footer). Viewport units switched to `dvh` for fixed learning/catalog shells; learning sidebar now overlays the content area instead of using a `pt-15` hack; filters/results keep one scroll region. UI primitives (`Modal`, `Card`, `Input`/`Select`/`Textarea`) use responsive padding, `max-h-[90dvh]`, and 16px mobile font to avoid iOS zoom; stacked forms/buttons (`Checkout`, payment pages), full-bleed scrollable dashboard tabs, 2-up footer, and 44px-ish nav touch targets. |

## Remaining / Residuals

- Manual browser pass for light/dark across small mobile, normal mobile, tablet, desktop, and large desktop (responsive classes audited statically, not device-tested).
- `Skeleton` rollout is incremental (used where it matters, not everywhere).
- Browser smoke test against the live API is manual.

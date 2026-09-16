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
| Email verification | `/verify-email` page with 6-box OTP input (auto-advance, paste), resend + 60s cooldown, error states, and auto-login on success. Signup/Login route unverified users here via `requiresEmailVerification`. |
| Google login | "Continue with Google" on Login/Signup redirects to the backend `/auth/google`. `/auth/callback` page handles success (refreshes `["me"]`, then dashboard), cancelled/failed OAuth, and maps backend error codes to messages (`features/auth/utils/googleOAuth.js`). |

## Remaining / Residuals

- Manual browser pass for light/dark and responsive behavior.
- `Skeleton` rollout is incremental (used where it matters, not everywhere).
- Browser smoke test against the live API is manual.

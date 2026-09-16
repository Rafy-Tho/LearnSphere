# Frontend Design Implementation Plan

Execution plan for the UI/UX improvement specified in [`06-design.md`](./06-design.md).
Turns the design principles into concrete, ordered work.

> **Scope:** learner app (`frontend/`) only. **Admin is out of scope.**
> **Status:** see [`../../09-implement/tasks/frontend-design.md`](../../09-implement/tasks/frontend-design.md).
> **Related:** architecture [`01-architecture.md`](./01-architecture.md), components
> [`03-components.md`](./03-components.md), performance [`04-performance.md`](./04-performance.md),
> API/state [`05-api-state.md`](./05-api-state.md).

---

## 1. Principle

This is a **styling and usability refactor**, not a rewrite.

```text
Audit  →  Foundation (tokens)  →  Primitives  →  Layout/Nav  →  Pages  →  UX pass  →  Cleanup  →  Verify
```

- Preserve behavior: API calls, auth, routing, state, validation, business rules.
- Improve how Tailwind is used (semantic tokens + reusable variants), not which framework.
- Apply the system consistently across pages instead of redesigning each page independently.
- Verify (`npm run lint` + `npm run build`) after every task.

---

## 2. Decisions

Recorded in [`../../09-implement/decisions.md`](../../09-implement/decisions.md):

| # | Decision | Chosen |
|---|---|---|
| D-27 | Design system mechanism | Tailwind v4 CSS-first `@theme` tokens in `src/css/theme.css` (no `tailwind.config.js`, no new deps) |
| D-28 | Primary accent | **Blue** (blue-600/700) with `slate` neutrals; retire competing indigo/violet/cyan/purple for primary actions |
| D-29 | Dark mode | Full light/dark parity using the existing `.dark` class variant; no behavior change to `ThemeProvider` |
| D-30 | Component strategy | Upgrade the existing `components/ui/*` primitives with variants; add only `Badge`, `Alert`, `Skeleton`, `Textarea`, `Select` if reuse justifies it. No new UI kit |
| D-31 | Scope | Learner app only; admin excluded. No backend/business-logic changes |

---

## 3. Audit — Current State

### 3.1 Foundations

| Item | Finding |
|---|---|
| Tailwind | v4 CSS-first. `src/index.css` = `@import "tailwindcss"` + `@custom-variant dark`; **no config file**. |
| Theme tokens | None. No semantic colors/typography/spacing tokens. |
| Legacy CSS | `src/css/constant.css` is a single enormous `@source inline(...)` safelist (hundreds of utilities). Candidate for audit/trim once dynamic class construction is confirmed absent. |
| Global | `:where(a, button, input, select, textarea, [role="button"]) { @apply transition-all duration-300 }` — very broad; conflicts with purposeful motion and reduced-motion. |
| `utils/cn.js` | Plain `join(" ")`; no `tailwind-merge`, so overrides rely on order (already a documented constraint). |

### 3.2 Inconsistencies

| Area | Finding |
|---|---|
| Neutrals | `slate` and `gray` mixed (navbar/Footer/Login/NotFound use `gray`; primitives use `slate`). |
| Primary accent | 5 competing accents for the same role: `blue` (Button, auth), `indigo` (dashboard, catalog, cards), `violet` (reviews, feedback), `cyan` (pricing highlight), `purple` (404, certificate, dashboard feature). |
| Decoration | Gradients in ~25 files (`from-blue-50 via-indigo-50 to-purple-100`, `from-indigo-600 to-purple-600`, `from-cyan-400 to-blue-500`, …). |
| Radii | `rounded-lg` / `rounded-xl` / `rounded-2xl` / `rounded-full` / arbitrary `rounded-b-[3rem]`. |
| Shadows | `shadow-sm` / `shadow-md` / `shadow-lg` / arbitrary `shadow-[0_0_40px_rgba(...)]`. |
| Type | `text-8xl`, `text-6xl`, `text-5xl`, `text-4xl`, `text-[10px]` with no scale. |
| Focus | `focus:ring-2` vs `focus:ring-4`; ring colors `blue-300` / `slate-400` / `violet-500`. |
| Spacing | Mixed `gap-2/3/4`, `p-4/6/8`, one-off `mt-7`/`px-5`-style values. |

### 3.3 Primitives (exist but bypassed)

`components/ui/`: `Button`, `Input`, `Card`, `Modal`, `ConfirmDialog`, `EmptyState`,
`ErrorMessage`, `ProgressBar`, `SpinnerLoader`.

- `Button` has `primary/secondary/danger/orange/outline/ghost` — `orange` has no clear semantic role; no `link`/icon-only size; hover uses `transition-colors` while globals force `transition-all`.
- `Input` handles label/error/password toggle; no `Textarea`/`Select`; label is always uppercase micro-type.
- `Card` is a fixed surface with optional header; no `interactive`/`highlighted` variants.
- `Modal` has portal/Esc/overlay/scroll-lock but **no focus trap, no `aria-labelledby`, no focus return**.
- `ErrorMessage` hardcodes "Error occurred" and its own red palette.
- `SpinnerLoader` carries a `purple` color and legacy color names.

Widely bypassed by hand-rolled markup in: `HeroSection`, `PricingCard`, `PricingSection`,
`LearningRoadmap`, `StudentFeedback`, `ReviewCard`, `Login`, `Signup`, `ResetPasswordFlow`,
`CertificateView`, `PaymentSuccess`, `PaymentCancel`, `NotFoundPage`, dashboard sections.

### 3.4 States & feedback

- **Loading:** spinner only; no skeleton loaders for lists/cards/pages.
- **Empty/error:** `EmptyState` / `ErrorMessage` exist; coverage is uneven.
- **Success:** `react-toastify` with `theme="colored"` (multi-color) — does not match the intended restrained palette.
- **Disabled/focus:** present in primitives, inconsistent elsewhere.

### 3.5 Accessibility

- No focus trap / focus return in `Modal`.
- Icon-only controls (`Menu`, avatar, password toggle) vary in labeling.
- Contrast/focus indicators inconsistent; broad `transition-all` can mask focus affordances.
- No explicit `prefers-reduced-motion` handling.

---

## 4. Design Foundation

### 4.1 Token file

Create `frontend/src/css/theme.css` and import it from `index.css` **before** `constant.css`:

```css
@theme {
  /* Semantic colors — light value; dark via .dark overrides in base layer */
  --color-background: oklch(...);       /* slate-50 */
  --color-surface: ...;                 /* white */
  --color-surface-muted: ...;           /* slate-100 */
  --color-foreground: ...;              /* slate-900 */
  --color-foreground-muted: ...;        /* slate-500 */
  --color-border: ...;                  /* slate-200 */
  --color-primary: ...;                 /* blue-600 */
  --color-primary-hover: ...;           /* blue-700 */
  --color-primary-subtle: ...;          /* blue-50 */
  --color-success: ...;                 /* emerald-600 */
  --color-warning: ...;                 /* amber-500 */
  --color-destructive: ...;             /* red-600 */
  --color-ring: ...;                    /* blue-500 @ 40% */
}
```

Exact values are finalized in `FD-2`; light/dark are expressed with the existing `.dark`
variant (a small `@layer base` block sets the dark values). **Do not** introduce a JS config.

### 4.2 Semantic usage rules

| Token | Use for |
|---|---|
| `primary` | Primary actions, active nav, links, focus |
| `background` / `surface` / `surface-muted` | Page / card / inset backgrounds |
| `foreground` / `foreground-muted` | Body text / secondary text |
| `border` | Dividers, input borders, card outlines |
| `success` / `warning` / `destructive` | Status only (never decoration) |

Retire raw `bg-blue-600`, `text-gray-500`, `border-slate-200`, etc. in component/page markup
in favor of tokens (Tailwind v4 maps `--color-primary` → `bg-primary`, `text-primary`, …).

### 4.3 Typography scale

| Role | Class pattern | Use |
|---|---|---|
| Page title | `text-2xl font-semibold` (md `text-3xl`) | One per page |
| Section title | `text-lg font-semibold` | Section headers |
| Card title | `text-sm font-semibold` | Card/panel headers |
| Body | `text-sm` | Default copy |
| Small | `text-xs` | Labels, metadata |
| Caption | `text-xs text-foreground-muted` | Helpers, timestamps |

Hierarchy comes from weight + color, not from oversized display type. The `text-8xl`/gradient
display treatment in `NotFoundPage` is reduced to a restrained heading.

### 4.4 Spacing / radius / shadow / motion

- Spacing: standard scale only (`1/2/3/4/6/8/10/12`); page padding `px-4 sm:px-6 lg:px-8`;
  card padding `p-4`/`p-6`; section gap `gap-6`/`gap-8`.
- Radius: `rounded-lg` (controls) and `rounded-xl` (surfaces); no arbitrary radii.
- Shadow: `shadow-sm` for cards, `shadow-md` for overlays; no glow/colored shadows.
- Motion: `transition-colors`/`transition-shadow`/`transition-transform` with `duration-150–200`;
  wrap decorative motion in `motion-safe:`; respect `prefers-reduced-motion`.
- Replace the global `transition-all duration-300` with targeted transitions.

---

## 5. Component Spec

| Component | Variants / additions |
|---|---|
| `Button` | `primary`, `secondary`, `outline`, `ghost`, `destructive` (+ `link`); sizes `sm`/`md`/`lg`/`icon`; `isLoading`, `disabled`, `fullWidth`, `leftIcon`/`rightIcon`, `as` (render as link). Drop `orange` (no semantic role). |
| `Input` | states `default/hover/focus/error/disabled`; optional label style; add `Textarea`, `Select` |
| `Card` | `default`, `interactive` (hover/clickable), `highlighted` (selected/featured); optional header/body/footer slots |
| `Badge` | `default`, `success`, `warning`, `destructive`, `neutral` |
| `Alert` | `info`, `success`, `warning`, `error`; used by `ErrorMessage` internally |
| `Modal` | focus trap, initial focus, focus return, `aria-labelledby`/`aria-describedby`, subtle enter/exit, reduced-motion safe |
| `EmptyState` | keep API; standard spacing/icon treatment |
| `ErrorMessage` | restyle on `Alert`; remove hardcoded heading |
| `SpinnerLoader` | trim color set to semantic names |
| `Skeleton` | new: text/block/card skeletons for list and page loading |
| Toast | standardize `ToastContainer` (position, radius, colors) via a small `notify` helper; keep `react-toastify` |

No abstraction beyond these; only add `Badge`/`Alert`/`Skeleton`/`Textarea`/`Select` if they
replace real duplication.

---

## 6. Layout & Navigation

- **Navbar:** consistent `slate` surfaces, semantic active state, accessible user menu
  (aria-expanded, Esc, focus return), mobile drawer with overlay + scroll lock.
- **Learning navbar/sidebar:** same tokens; clear current-lesson state; consistent spacing.
- **Footer:** neutral surface, tokenized borders, consistent link hover.
- **Containers:** one shared max-width + responsive page padding convention; consistent
  `PageHeader`/`SectionHeader` rhythm.

---

## 7. Page Application

Applied in this order (each page uses the tokens/primitives, no per-page visual language):

1. Auth — `Login`, `Signup`, `ResetPasswordFlow`.
2. Catalog — `Home`, `CourseScreen`, `CourseDetailScreen`.
3. Dashboard — `LearningDashboard` + sub-dashboards/sections.
4. Learning — `CourseLearningScreen`, `LessonContent`, `Quiz`, `CertificateView`.
5. Reviews — `ReviewContainer`, `ReviewCard`, `StudentFeedback`, `RatingSummary`, `ReportModal`.
6. Settings — `UserSetting` + sections.
7. Subscriptions — `PricingScreen`, `PricingCard`, `PaymentSuccess`, `PaymentCancel`.
8. `NotFoundPage`.

Gradients are reduced to at most subtle, token-based accents (or removed); no page keeps a
distinct accent color for primary actions.

---

## 8. UX / State Conventions

- **Loading:** skeletons for lists/cards; button-level loading for mutations; page-level spinner only for full-page transitions.
- **Empty:** `EmptyState` with title + description + optional action everywhere a collection can be empty.
- **Error:** friendly, actionable copy via `Alert`/`ErrorMessage`; no raw backend messages.
- **Success:** toast on note/review/profile/password/payment outcomes via the standardized toast.
- **Forms:** label + helper/error text, `aria-invalid`, error not conveyed by color alone, keyboard-operable.
- **Focus:** visible `focus-visible` ring on every interactive element; never removed for aesthetics.

---

## 9. Execution Phases → Tasks

| Phase | Tasks |
|---|---|
| A. Audit | FD-1 |
| B. Foundation | FD-2, FD-3, FD-4 |
| C. Primitives | FD-5…FD-9 |
| D. Layout/Nav | FD-10, FD-11, FD-12 |
| E. Pages | FD-13…FD-19 |
| F. UX/Verify | FD-20, FD-21, FD-22 |

---

## 10. Compatibility Rules

- No new dependencies, frameworks, state managers, or UI kits.
- No changes to API calls, services, hooks, routing, auth, or business rules.
- Keep the response contract and query-key factory untouched.
- Keep `react-toastify`, `lucide-react`, and `swiper`; do not add an icon library.
- Preserve middleware/backend behavior entirely.
- One task at a time; lint + build after each.

---

## 11. Risk & Rollback

| Area | Risk | Mitigation |
|---|---|---|
| Global token/`@theme` changes | Medium | Add tokens first, migrate incrementally; keep old utilities working until replaced. |
| `constant.css` safelist trim | Medium | Grep for dynamic class construction; remove in small batches with build checks. |
| Modal focus-trap | Medium | Verify keyboard flows (open/close/tab/Esc) per modal consumer. |
| Broad `transition-all` removal | Low | Replace with targeted transitions; check hover/focus feedback. |
| Page-by-page migration | Low | One page group per task; visual smoke test in light + dark. |

Rollback is per-task: revert that task's commit. Tasks are independent.

---

## 12. Definition of Done

- Semantic tokens exist and are used; no scattered arbitrary color values in pages.
- Shared primitives cover buttons, inputs, cards, badges, alerts, modals, empty/error/loading states.
- Navigation, forms, and states are consistent across all pages.
- Full light/dark parity; responsive at mobile/tablet/desktop/large desktop.
- Accessible: focus visible, keyboard-operable, labeled controls, reduced-motion respected.
- `npm run lint` and `npm run build` pass in `frontend/`.
- Existing functionality behaves exactly as before.

---

## 13. Verification

1. `frontend/`: `npm run lint` (baseline 0 errors) and `npm run build`.
2. Manual review of loading / empty / error / success / hover / focus / disabled.
3. Responsive check at mobile, tablet, desktop, large desktop.
4. Light + dark check on every page group.
5. Cross-page consistency pass (one application, one visual language).

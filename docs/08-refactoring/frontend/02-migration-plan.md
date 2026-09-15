# Frontend Migration Plan

Incremental execution plan for moving `frontend/` to the target architecture in
[`01-architecture.md`](./01-architecture.md). Admin is out of scope.

> **Status:** Complete. See [`../../09-implement/tasks/frontend-refactor.md`](../../09-implement/tasks/frontend-refactor.md) for task-level status.

---

## 1. Principle

Migrate **incrementally**, one unit at a time, verifying after each step.

```text
Audit
  ↓
Design
  ↓
Move one feature / shared unit
  ↓
Update imports
  ↓
Lint + build
  ↓
Next unit
```

Do not rewrite the whole app at once.

---

## 2. Migration Order

Shared infrastructure first, then features (smallest/least-coupled first), then cross-cutting fixes,
then verification.

| Phase | Units | Rationale |
|---|---|---|
| 0. Foundation | alias + folders, `lib/`, `app/` | Everything imports these; do them first. |
| 1. Shared | `components/ui`, `components/common`, `layouts/` | Features depend on shared components. |
| 2. Features | auth → catalog → learning → reviews → subscriptions → dashboard → settings | auth is smallest/highest value; catalog/learning are largest. |
| 3. Fixes | hook shims, lazy routes, auth source of truth, query keys, dead code, naming, states | Behavior fixes layered on the stable structure. |
| 4. Verify | lint + build + smoke + docs | Confirm nothing regressed. |

---

## 3. Per-Unit Checklist

1. Create the target folder(s).
2. Move files with `git mv` (preserve history).
3. Update all imports (prefer the `@/` alias).
4. Keep route paths and response consumption unchanged.
5. Run `npm run lint` and `npm run build` in `frontend/`.
6. Smoke-test the affected flow against the API.
7. Delete old files/folders only after the new path is verified.
8. Update the task status and [`../../09-implement/progress-tracking.md`](../../09-implement/progress-tracking.md).

---

## 4. Compatibility Rules

- No user-visible behavior changes bundled with structural moves, except the explicit fixes
  scoped in FE-14–FE-19.
- Keep React Router paths and the `{ success, statusCode, message, data }` consumption identical.
- Keep auth/session behavior unchanged outside FE-16.
- No new frameworks, state managers, or UI kits.
- One API client; feature services do not call `fetch` directly.
- Run lint for the app touched.

---

## 5. Risk & Rollback

| Area | Risk | Mitigation |
|---|---|---|
| Large feature moves (catalog/learning) | Medium | Move one feature per task; lint+build each; verify in git. |
| Import rewrites | Medium | Use the `@/` alias; grep for stale relative paths after each move. |
| Auth source of truth (FE-16) | High | Coordinate with session behavior; test login/logout/refresh. |
| Query-key changes (FE-17) | Medium | Verify invalidation against the UI; no server changes. |
| Dead-code removal (FE-18) | Low | Confirm zero references before deleting. |
| Payment flow (FE-11/FE-17) | High | Verify `PaymentSuccess`/`PaymentCancel` in Stripe test mode. |

Rollback is per-task: revert the commit for that task; tasks are independent.

---

## 6. Definition of Done

- Each feature is self-contained under `features/<feature>/`.
- Shared UI is under `components/`; infrastructure under `app/` and `lib/`.
- No hook re-export shims; no dead files or unused deps.
- Route-level code splitting is in place.
- Auth has a single source of truth; query keys are consistent.
- `npm run lint` and `npm run build` pass in `frontend/`.
- Existing flows behave the same (except the explicitly scoped fixes).

# Decisions Log

Decisions that block or shape dependent work. Record a decision here **before** starting the tasks that depend on it.

**Status legend:** ⬜ Open · 🟡 In progress · ✅ Decided

| # | Decision | Options | Status | Chosen | Date | Notes |
|---|---|---|---|---|---|---|
| D-01 | Course delete semantics | Hard delete vs soft delete (`deleted_at`) | ✅ | Soft delete | 2026-09-15 | `deleted_at` kept; reads filter; `Course.delete` sets it (P1-7) |
| D-02 | Canonical lesson-content table name | `lesson_content` vs `lesson_contents` | ✅ | `lesson_contents` | 2026-09-15 | Matches code; schema.sql + migration 0001 |
| D-03 | `lessons.access_type` | Add column vs remove code usage | ✅ | Add column | 2026-09-15 | `access_course_type DEFAULT 'FREE'` |
| D-04 | `quizzes.lesson_id` unique | Drop constraint vs keep one-question model | ✅ | Drop constraint | 2026-09-15 | Keep `(lesson_id, position)` unique |
| D-05 | Reset-code hashing | bcrypt vs HMAC-SHA256 + pepper | ✅ | HMAC-SHA256 + pepper | 2026-09-15 | Pepper = `SESSION_SECRET`; code via `crypto.randomInt` |
| D-06 | CSRF strategy | Same-site + `sameSite=lax` vs CSRF tokens vs JSON-only + custom header | ✅ | JSON-only + custom header | 2026-09-15 | State-changing requests require `application/json` + `X-Requested-With`; all clients already send JSON. Blocks SH-2 |
| D-07 | Migration tooling | Plain SQL runner vs `node-pg-migrate` | ✅ | Plain SQL runner | 2026-09-15 | No new deps; `db/migrate.js` + `schema_migrations` |
| D-08 | `course_reviews.helpful_count` | Maintain vs drop | ✅ | Drop column | 2026-09-15 | Never maintained; count derives from `review_helpful_votes` |
| D-09 | Admin temp password | Email invite vs keep | ✅ | Email invite/reset flow | 2026-09-15 | Replace hardcoded `TempPassword123!`. Blocks SH-7.2 |
| D-10 | Guest `GET /users/me` semantics | `200` + `data:null` vs `401` | ✅ | `200` + `data:null` | 2026-09-15 | Intentional; admin treats `null` as guest. Blocks AP-5.4 |
| D-11 | Quiz answer-key exposure | Gate route vs server-side scoring vs split endpoints | ✅ | Gate to enrolled learners | 2026-09-15 | ~~Keep `is_correct`/`explanation` (client scores)~~ **Superseded by D-15** (server-side grading). |
| D-12 | Pagination rollout | Growing lists only vs all lists vs bug-fixes-only | ✅ | Growing lists only | 2026-09-15 | Small child collections stay unpaginated; consumer updates required for admin lists. Blocks AP-3.3/3.4/3.5 |
| D-13 | Absent sub-resource semantics | `200` + `data:null` vs `404` | ✅ | `200` + `data:null` | 2026-09-15 | Frontend guards rely on `null`; `404` reserved for missing parent resources. Blocks AP-5.3 |
| D-14 | Endpoint rename migration strategy | In-place vs `/api/v2` vs legacy aliases | ✅ | In-place + update consumers | 2026-09-15 | No known external clients except Stripe webhook; update frontend/admin/Stripe in the same change. Blocks ER-1…ER-12 |
| D-15 | Quiz answer-key protection | Client-side scoring vs server-side grading endpoint | ✅ | Server-side grading endpoint | 2026-09-15 | Supersedes D-11. Learner payload drops `is_correct`/`explanation`; `POST /lessons/:lessonId/quiz-submissions` grades. Blocks SH-1 |
| D-16 | Registration account enumeration | Generic success (no auto-login) vs generic message vs defer | ✅ | Generic success, no auto-login | 2026-09-15 | New and existing emails return the same `201`; frontend routes to `/login`. Closes enumeration without email verification. Blocks SH-6.2 |
| D-17 | Frontend feature taxonomy | Pasted template (`auth/notes/users`) vs real domains vs coarser set | ✅ | Real domains | 2026-09-15 | `auth, catalog, learning, reviews, subscriptions, dashboard, settings`; matches architecture-plan §4 and the actual code. Blocks FE-1/FE-7…FE-13 |
| D-18 | Frontend import alias | Relative imports vs `@`→`src` | ✅ | `@`→`src` | 2026-09-15 | Added in `vite.config.js` + `jsconfig.json`; no new dependency. Blocks FE-1 |
| D-19 | Frontend service layer | Feature `services/` + `lib/api-client` vs keep `api/` | ✅ | Feature `services/` + `lib/api-client` | 2026-09-15 | Client owns transport/401/unwrapping; services own endpoints. Blocks FE-2/FE-7…FE-13 |
| D-20 | Frontend refactor scope | Structure-only vs structure + targeted fixes vs full remediation | ✅ | Structure + targeted fixes | 2026-09-15 | Behavior-preserving moves, plus audit fixes FE-14–FE-19. Blocks FE-20 |
| D-21 | Admin app scope | Include vs exclude | ✅ | Exclude | 2026-09-15 | This refactor covers `frontend/` only. |
| D-22 | Frontend component standards | Consolidate duplicates only vs add shared primitives vs no new abstractions | ✅ | Add shared primitives | 2026-09-15 | `components/ui/{Button,Modal,Card,Input,EmptyState,ProgressBar}` built with React + Tailwind + lucide (no new deps). Learner app only. Blocks FC-2…FC-16 |
| D-23 | Frontend API response contract | Keep auto-detected `data` vs `{data,pagination}` vs normalize | ✅ | Normalize + update consumers | 2026-09-16 | Default methods return unwrapped `data`; list endpoints opt into `{ data, pagination }` via `getPaginated`. Blocks FS-2 |
| D-24 | Frontend query keys | Inline literals vs central factory | ✅ | Central factory (`lib/queryKeys.js`) | 2026-09-16 | All keys + invalidation go through the factory; `clearUserQueries` roots derived from it. Blocks FS-3/FS-4 |
| D-25 | Frontend optimistic updates | Invalidate-only vs optimistic + rollback | ✅ | Optimistic + rollback | 2026-09-16 | Used only for immediate interactions (helpful vote, report); lists stay refetch. Blocks FS-6/FS-9 |
| D-26 | Frontend state taxonomy | Server-state-first vs global store | ✅ | Server-state-first | 2026-09-16 | Only global client state is theme + server-derived auth; no new state managers. Learner app only. Blocks FS-5/FS-6 |
| D-27 | Frontend design system mechanism | JS `tailwind.config` vs Tailwind v4 CSS-first `@theme` | ✅ | CSS-first `@theme` tokens | 2026-09-16 | New `src/css/theme.css` imported by `index.css`; no config file, no new deps. Blocks FD-2…FD-4 |
| D-28 | Frontend primary accent | Blue vs indigo vs teal/emerald | ✅ | Blue (+ slate neutrals) | 2026-09-16 | Retire indigo/violet/cyan/purple for primary actions; blue already the `Button` default. Blocks FD-2/FD-5…FD-19 |
| D-29 | Frontend dark mode | Full parity vs light-first | ✅ | Full light/dark parity | 2026-09-16 | Keep the existing `.dark` class variant and `ThemeProvider` behavior. Blocks FD-2…FD-22 |
| D-30 | Frontend component strategy | Add UI kit vs upgrade existing primitives vs duplicates only | ✅ | Upgrade existing primitives | 2026-09-16 | Extend `components/ui/*` with variants; add `Badge`/`Alert`/`Skeleton`/`Textarea`/`Select` only where reuse justifies. No new deps. Blocks FD-5…FD-9 |
| D-31 | Frontend design scope | Include admin vs learner only | ✅ | Learner only | 2026-09-16 | Styling/UX refactor only; no API/auth/routing/business-logic changes. Blocks FD-1…FD-22 |

## Related

- Tasks: [`tasks/`](./tasks/)
- Progress: [`progress-tracking.md`](./progress-tracking.md)
- Security plan: [`../08-refactoring/security-plan.md`](../08-refactoring/security-plan.md)
- Backend security plan: [`../08-refactoring/backend/06-security.md`](../08-refactoring/backend/06-security.md)
- Security tasks: [`tasks/security-hardening.md`](./tasks/security-hardening.md)
- Migration plan: [`../08-refactoring/backend/02-migration-plan.md`](../08-refactoring/backend/02-migration-plan.md)
- API plan: [`../08-refactoring/backend/03-api.md`](../08-refactoring/backend/03-api.md)

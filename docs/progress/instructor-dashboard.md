# Instructor Workspace

**Status:** 🟡 In progress — code complete; the live database must be rebuilt from the
CREATE-only baseline, then the flows manually QA'd.

Design + plan: [`../04-design/instructor-dashboard.md`](../04-design/instructor-dashboard.md).

## Done

| Area | What landed |
|---|---|
| Role gating (admin app) | `app/guards/RequireRole.jsx`, role-filtered `constants/navItems.js`, `AdminSidebar` brand/role label, role-aware `/` via `pages/RoleHome.jsx`. |
| Instructor dashboard | `features/instructor/pages/InstructorDashboardPage.jsx` — scoped stats, recent enrollments/reviews. |
| Instructor API | `features/instructor/services/instructor.js`, queries/mutations in `features/instructor/hooks/`. |
| Course tabs | `features/instructor/components/{StudentsTab,AnalyticsTab,ReviewsTab,CertificatesTab}.jsx` wired into `CourseDetailPage`. |
| Course submit | `useSubmitCourse` + submit action on `CoursesPage` (instructors cannot self-publish). |
| Earnings | `features/instructor/pages/InstructorEarningsPage.jsx` — estimate + per-course breakdown + payout history. |
| Admin review queue | `features/courses/pages/CourseReviewsPage.jsx` (approve/reject with reason). |
| Admin payouts | `features/payouts/` — revenue-share setting + record/track payouts. |
| Backend | `backend/src/modules/instructor/`; course review workflow + scoping fixes in `modules/courses/`; schema in baseline migrations `0004_catalog.sql`/`0009_instructor.sql`. |
| Docs | requirements/business-rules/acceptance/use-cases/api/database/architecture/scope/spec/README + `ai/project-context.md` updated. |

## Remaining

| # | Task | Status | Notes |
|---|---|---|---|
| Ops | Rebuild the live DB from the baseline | ⬜ | `npm run db:migrate` on a fresh database (the old `0025`–`0026` files no longer exist). |
| QA | Verify instructor vs admin flows | ⬜ | Manual: submit → approve/reject, roster filters, analytics, earnings, payouts. |
| QA | Rejection-reason feedback on the course form | ⬜ | Status shows `REJECTED`; consider surfacing `rejection_reason` inline. |

## Notes / Residuals

- Earnings are an **estimate** — no per-course pricing exists; attributed revenue is subscription-revenue share.
- Approval/rejection emails the instructor; failures are swallowed so the review action always succeeds.
- `ADMIN` can access instructor endpoints and bypasses ownership.
- No automated tests/CI.

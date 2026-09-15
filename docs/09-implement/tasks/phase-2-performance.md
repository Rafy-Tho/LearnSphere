# Phase 2 — P1 Performance & Architecture

High-impact performance and architecture work.

**Plan references:** [`performance-plan.md`](../../08-refactoring/performance-plan.md), [`api-refactor-plan.md`](../../08-refactoring/api-refactor-plan.md), [`codebase-audit.md`](../../08-refactoring/codebase-audit.md) §5

| ID | Task | Plan ref | Status | Notes |
|---|---|---|---|---|
| P1-1 | `getCourseDetailsDashboard`: consolidate queries + ownership | perf B3 | ⬜ | 8 → 1–2 queries |
| P1-2 | Rewrite `getAllCourses` (count, alias filters, soft-delete, cap) | perf B2 | ⬜ | |
| P1-3 | Simplify popular/recommended/in-progress/completed | perf B4 | ⬜ | |
| P1-4 | Dedupe duration subquery + ownership SQL | perf B8 | ⬜ | |
| P1-5 | Add missing indexes | perf B1 | ⬜ | |
| P1-6 | Admin load-all-then-find → `findById` | perf B5 | ⬜ | |
| P1-7 | Decide + apply soft-delete consistency | P1-7 | ⬜ | Depends D-01 |
| P1-8 | Frontend QueryClient defaults + `enabled` guards | perf F1/F2 | ⬜ | Deferred to frontend phase |
| P1-9 | Standardize response envelope + pagination | api §3 | ⬜ | |
| P1-10 | Route-level code splitting | perf F5 | ⬜ | Deferred to frontend phase |
| P1-11 | Fix stale localStorage auth | P1-11 | ⬜ | Deferred to frontend phase |
| P1-12 | Fix `PaymentSuccess` param/crash | P1-12 | ⬜ | Deferred to frontend phase |

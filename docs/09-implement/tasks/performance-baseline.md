# Performance Baseline & Results

From [`performance-plan.md`](../../08-refactoring/performance-plan.md) §2.2. Record before/after measurements here (see [`phase-0-safety-net.md`](./phase-0-safety-net.md) PH0-05).

| Metric | Endpoint / page | Before | After | Delta |
|---|---|---|---|---|
| p95 latency | `GET /courses` | | | |
| Query count | `GET /courses` | | | |
| p95 latency | `GET /courses/:id/learn` | | | |
| Query count | `GET /courses/:id/dashboard-details` | | | |
| Payload bytes | `GET /admin/subscriptions/payments` | | | |
| Requests/page | `/courses` (learner) | | | |
| Bundle KB | `frontend` | | | |
| Bundle KB | `admin` | | | |

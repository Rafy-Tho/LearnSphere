# Frontend API & State (Learner App)

Standardize API communication and state management in the learner app. Standard:
[`../../08-refactoring/frontend/05-api-state.md`](../../08-refactoring/frontend/05-api-state.md);
architecture: [`../../08-refactoring/frontend/01-architecture.md`](../../08-refactoring/frontend/01-architecture.md);
components: [`../../08-refactoring/frontend/03-components.md`](../../08-refactoring/frontend/03-components.md).
**Admin is out of scope.**

> **Status:** ✅ Done. All `FS-1…FS-10` implemented; `npm run lint` is **0 errors / 0 warnings** and
> `npm run build` passes in `frontend/`. Browser smoke-testing against the live API is the only
> manual residual.
> **Status legend:** ⬜ Not started · 🟡 In progress · ✅ Done · ⛔ Blocked · ⏭️ Deferred

## Tasks

| # | Task | Phase | Status | Notes |
|---|---|---|---|---|
| FS-1 | Publish API & State standard | Docs | ✅ | [`05-api-state.md`](../../08-refactoring/frontend/05-api-state.md): data flow, client responsibilities, response contract, query keys, state taxonomy, mutation/cache rules, state conventions, current→target, DoD. |
| FS-2 | Harden `lib/apiClient.js` | API | ✅ | Safe body parse (`204`/empty/non-JSON → `null`); `ApiError` (`statusCode`+payload); normalized contract (`data` default, `getPaginated` opt-in `{ data, pagination }`); `buildQuery(params)` (objects, arrays, `field[op]`, `URLSearchParams`); `upload(endpoint, formData, method)`; `AbortSignal`; single client + `X-Requested-With` retained. Paginated consumers (`courses`, `reviews`, dashboard in-progress/completed, `my-certificates`) updated to `getPaginated`. |
| FS-3 | Central query-key factory | Keys | ✅ | New `lib/queryKeys.js` (all roots + `reviewsRoot`/`reviewsInfiniteRoot`/`courseLessonCompletionsRoot`); every hook/mutation/`AuthProvider`/`clearUserQueries` uses it; hand-maintained `USER_SCOPED_QUERY_ROOTS` removed and derived from the factory. |
| FS-4 | Mutation invalidation completeness | Cache | ✅ | Added invalidations: create/update progress → progress/completions/eligibility; enroll → enrollment/in-progress/recommended; complete lesson → completed-lesson/completions/progress/eligibility/in-progress; payment → active subscription. |
| FS-5 | Auth/user cache coherence | Cache | ✅ | `useUpdateUserProfile` merges the response into `["me"]` and invalidates `["profile"]`; `UserProfile` no longer writes ad-hoc `saveAuth`; `AuthProvider` stays the server-derived single source. |
| FS-6 | Remove duplicated server state | State | ✅ | `ReviewCard` derives vote/report from the query cache (no `useState` mirror); `Subscription`/`PricingCard` use `mutation.isPending`; form-draft pattern documented in the standard §3.2. |
| FS-7 | Standardize loading/error/empty | State | ✅ | `CertificationSection` spinner instead of `null`; `SubscriptionContainer`/`PricingSection` now surface `ErrorMessage`. Remaining views already used the shared primitives. |
| FS-8 | Service param consistency | API | ✅ | `courses`/`reviews`/`dashboard` services take params objects serialized by `buildQuery`; raw `?${queryString}` assembly removed; dead `utils/parseQueryToString.js` deleted. |
| FS-9 | Optimistic updates | State | ✅ | Helpful vote + report update the infinite-review cache in `onMutate`, roll back in `onError`, and invalidate in `onSettled`; no local mirror. |
| FS-10 | Verification | Verify | ✅ | `npm run lint` 0/0 + `npm run build` pass; no inline query keys, one `fetch` (the client), no `parseQueryToString` references. Browser smoke-test against the API remains manual. |

## Acceptance Criteria

- One API client; no `fetch` in components or services. ✅
- Consistent response contract: default methods return `data`; `getPaginated` returns `{ data, pagination }`. ✅
- Errors are normalized (`ApiError` with `statusCode` + payload). ✅
- All query keys come from `lib/queryKeys.js`; no inline literals. ✅
- Every mutation invalidates its affected keys. ✅
- No duplicated server data in client state; only global state is theme + server-derived auth. ✅
- Loading/error/empty states use the shared primitives. ✅
- `npm run lint` (0/0) and `npm run build` pass in `frontend/`. ✅
- Existing flows behave the same, except the explicitly scoped FS fixes. ✅ (build/lint verified; browser smoke-test manual)

## Notes / Residuals

- Learner app only; admin out of scope.
- No new dependencies, frameworks, state managers, or UI kits.
- Optimistic updates are limited to immediate interactions (helpful vote, report); list/detail data
  stays invalidate-and-refetch.
- Browser smoke-testing (login/logout, profile, enroll, complete lesson, quiz, review vote/report,
  checkout, certificates) requires a live API session and is not automated in this repo.

# Test Cases

Proposed test cases mapped to acceptance criteria. None are automated yet. Format: ID, layer, preconditions, steps, expected result.

## 1. Backend — Authentication

| ID | Case | Expected |
|---|---|---|
| TC-AUTH-01 | Register with unique valid data | 201, user + profile created, session set |
| TC-AUTH-02 | Register with existing email | 409 |
| TC-AUTH-03 | Register with weak password | 422 first validation message |
| TC-AUTH-04 | Login with correct credentials | 200, session created, `last_login` updated |
| TC-AUTH-05 | Login with wrong password | 401, no session |
| TC-AUTH-06 | `GET /users/me` with valid session | 200 current user |
| TC-AUTH-07 | `GET /users/me` with no session | 200, `data: null` |
| TC-AUTH-08 | Logout then protected request | Session destroyed, 401 |
| TC-AUTH-09 | Reset code request then verify then reset | 200 each; new password works |
| TC-AUTH-10 | Verify expired reset code | Rejected |
| TC-AUTH-11 | Exceed code attempts | Rejected after max attempts |
| TC-AUTH-12 | Exceed password-reset rate limit | 429 |

## 2. Backend — Authorization

| ID | Case | Expected |
|---|---|---|
| TC-AUTHZ-01 | Learner creates a course | 403 |
| TC-AUTHZ-02 | Instructor updates own course | 200 |
| TC-AUTHZ-03 | Instructor updates another instructor's course | 403 |
| TC-AUTHZ-04 | Admin updates any course | 200 |
| TC-AUTHZ-05 | Learner calls `/api/v1/admin/users` | 403 |
| TC-AUTHZ-06 | Instructor edits content of non-owned course | 403 |
| TC-AUTHZ-07 | Instructor edits content of owned course | 200 |
| TC-AUTHZ-08 | Unauthenticated create module | 401 |
| TC-AUTHZ-09 | Authenticated learner POSTs an option (known gap) | Should be 403; currently may succeed |

## 3. Backend — Validation & Errors

| ID | Case | Expected |
|---|---|---|
| TC-VAL-01 | Missing required field | 422 |
| TC-VAL-02 | Invalid email | 422 |
| TC-VAL-03 | Invalid enum value | 422 |
| TC-VAL-04 | Duplicate position within parent | 409 |
| TC-VAL-05 | Delete category in use | 400 |
| TC-VAL-06 | Lesson HTML with `<script>` | Sanitized on store |
| TC-VAL-07 | Unknown route | 404 `Not Found <url>` |

## 4. Backend — Courses & Query

| ID | Case | Expected |
|---|---|---|
| TC-CRS-01 | List courses default | Paginated, excludes soft-deleted |
| TC-CRS-02 | Filter by level | Only matching level |
| TC-CRS-03 | Filter by category | Only matching category |
| TC-CRS-04 | Sort `-created_at` | Newest first |
| TC-CRS-05 | Search term | Matching courses |
| TC-CRS-06 | Pagination metadata | Correct page/limit/total/totalPages |
| TC-CRS-07 | Course detail | Includes objectives, modules, chapters, lessons, review summary |
| TC-CRS-08 | Soft-delete course | Excluded from listings |

## 5. Backend — Learning

| ID | Case | Expected |
|---|---|---|
| TC-LRN-01 | Enroll in free course | 201, progress seeded |
| TC-LRN-02 | Duplicate enrollment | 409 |
| TC-LRN-03 | Learning data for enrolled learner | Full hierarchy + content |
| TC-LRN-04 | Complete lesson | Completion row with XP/duration |
| TC-LRN-05 | Duplicate completion | Not duplicated |
| TC-LRN-06 | Update progress | Current lesson updated |
| TC-LRN-07 | Subscription lesson without subscription | Access denied |
| TC-LRN-08 | Subscription lesson with active subscription | Access granted |
| TC-LRN-09 | First lesson endpoint | Returns first lesson |

## 6. Backend — Reviews

| ID | Case | Expected |
|---|---|---|
| TC-REV-01 | Create valid review | 201 |
| TC-REV-02 | Rating 0 or 6 | 422 |
| TC-REV-03 | Second review same course | 409 |
| TC-REV-04 | Review summary | Average + 1–5 histogram |
| TC-REV-05 | Toggle helpful vote | Toggles; one vote per user |
| TC-REV-06 | Duplicate report | Rejected |

## 7. Backend — Subscriptions & Payments

| ID | Case | Expected |
|---|---|---|
| TC-SUB-01 | Create Stripe session | Returns `session_url` |
| TC-SUB-02 | Webhook valid signature `checkout.session.completed` | Subscription + payment created, email sent |
| TC-SUB-03 | Webhook invalid signature | Rejected, no records |
| TC-SUB-04 | Second active subscription | Prior expired, one active remains |
| TC-SUB-05 | Active subscription lookup | Returns active unexpired |
| TC-SUB-06 | Expired subscription lookup | Not returned |
| TC-SUB-07 | Admin CRUD plans/subs/payments | Persist and list correctly |

## 8. Backend — Certificates

| ID | Case | Expected |
|---|---|---|
| TC-CERT-01 | Eligibility when incomplete | Not eligible |
| TC-CERT-02 | Claim when eligible | Certificate with unique number |
| TC-CERT-03 | Duplicate claim | Rejected (unique user+course) |
| TC-CERT-04 | List my certificates | Returns user's certificates |

## 9. Frontend — Unit/Component

| ID | Case | Expected |
|---|---|---|
| TC-FE-01 | API client sends `credentials: include` | Cookie included |
| TC-FE-02 | API client on 401 (non-auth path) | Clears localStorage, redirects to `/login` |
| TC-FE-03 | API client unwraps pagination | Returns `{ data, pagination }` |
| TC-FE-04 | ProtectRoute with no user | Redirect to `/login` |
| TC-FE-05 | IsAuthenticate with user | Redirect to `/learning-dashboard` |
| TC-FE-06 | Login form invalid email | Shows validation error |
| TC-FE-07 | Signup weak password | Shows validation error |
| TC-FE-08 | Reset flow steps | Cannot skip ahead |
| TC-FE-09 | Quiz state machine | Start → questions → results |
| TC-FE-10 | Lesson HTML sanitized | Script removed before render |
| TC-FE-11 | Review summary bars | Correct percentages |

## 10. Admin — Unit/Component

| ID | Case | Expected |
|---|---|---|
| TC-ADM-01 | ProtectedRoutes without user | Redirect to `/login` |
| TC-ADM-02 | Dashboard stats render | Counts shown |
| TC-ADM-03 | Category slug auto-generated | Lowercased, spaces → `-` |
| TC-ADM-04 | Course modal validation | Required fields enforced |
| TC-ADM-05 | Delete last row on page | Page decremented |
| TC-ADM-06 | Course detail add module/chapter/lesson | Tree updates after invalidation |
| TC-ADM-07 | StatusBadge mapping | Correct variant per status |
| TC-ADM-08 | Profile update | Context refreshed after save |

## 11. End-to-End (Playwright)

| ID | Flow | Expected |
|---|---|---|
| TC-E2E-01 | Guest → signup → dashboard | Authenticated, redirected |
| TC-E2E-02 | Login → browse → course detail | Course data shown |
| TC-E2E-03 | Enroll → open first lesson | Lesson content rendered |
| TC-E2E-04 | Complete lesson → next | Progress updated on dashboard |
| TC-E2E-05 | Quiz attempt → results | Score shown |
| TC-E2E-06 | Submit review | Review appears in list/summary |
| TC-E2E-07 | Admin create category | Appears in table |
| TC-E2E-08 | Admin create course + content + publish | Visible in learner catalog |
| TC-E2E-09 | Admin manage users | Create/edit/delete reflected |
| TC-E2E-10 | Subscription checkout (Stripe test) | Active subscription after webhook |

## 12. Regression Cases for Known Issues

| ID | Case | Expected after fix |
|---|---|---|
| TC-FIX-01 | Save lesson content | No `relation "lesson_contents"` error |
| TC-FIX-02 | Create/update lesson with access type | No `column "access_type"` error |
| TC-FIX-03 | Add second question to a lesson | Allowed |
| TC-FIX-04 | Password reset end to end | Hash stored without truncation |
| TC-FIX-05 | Learner POST option | 403 |
| TC-FIX-06 | Login brute force | 429 via `loginLimiter` |

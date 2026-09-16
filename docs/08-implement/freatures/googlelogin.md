# Implement Google OAuth Login

> **Status: ✅ Implemented.** Backend: `GET /api/v1/auth/google` +
> `/auth/google/callback` (authorization-code + OIDC via `openid-client`),
> `user_auth_providers` migration `0014`, account linking in
> `backend/src/modules/auth/google-oauth.service.js`. Frontend:
> "Continue with Google" + `/auth/callback` page. See
> [`docs/progress/backend-progress.md`](../../progress/backend-progress.md) and
> [`docs/progress/frontend-user.md`](../../progress/frontend-user.md). Remaining:
> supply real Google credentials.

Implement Google OAuth login in our existing authentication system.

The goal is to allow users to:

- Register/login with Google.
- Link Google to an existing account when the Google email matches an existing verified account.
- Prevent duplicate user accounts.
- Use the existing session-based authentication system.
- Keep the existing email/password authentication working.
- Work with the existing email verification system.

Do not rewrite unrelated authentication code.

---

## 1. Database

Use the existing `user_auth_providers` table:

```sql
CREATE TABLE IF NOT EXISTS user_auth_providers (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    user_id UUID NOT NULL
        REFERENCES users(id)
        ON DELETE CASCADE,

    provider VARCHAR(50) NOT NULL,

    provider_user_id VARCHAR(255) NOT NULL,

    provider_email VARCHAR(255),

    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT uq_user_auth_provider
        UNIQUE (provider, provider_user_id)
);
```

For Google, store:

```text
provider = GOOGLE
provider_user_id = Google's stable unique user ID
provider_email = Google's email
```

Do NOT use the Google email as `provider_user_id`.

---

# 2. Google OAuth Flow

Implement the standard OAuth authorization-code flow.

Expected flow:

```text
User clicks "Continue with Google"
        ↓
Frontend redirects to backend Google OAuth endpoint
        ↓
Backend redirects user to Google
        ↓
User authenticates with Google
        ↓
Google redirects back to backend callback
        ↓
Backend validates OAuth response
        ↓
Backend obtains verified Google identity
        ↓
Find Google provider account
        ↓
Determine existing/new account
        ↓
Create/link user if appropriate
        ↓
Create existing application session
        ↓
Redirect user to frontend
```

Use the project's existing backend/session architecture.

Do not replace the application's session authentication with JWT.

---

# 3. Environment Variables

Use environment variables for Google credentials.

Example:

```env
GOOGLE_CLIENT_ID=
GOOGLE_CLIENT_SECRET=
GOOGLE_CALLBACK_URL=
```

Frontend URL should also come from environment configuration if needed:

```env
CLIENT_URL=
```

Do not hardcode:

- client ID
- client secret
- callback URL
- frontend URL

Never expose `GOOGLE_CLIENT_SECRET` to the frontend.

---

# 4. OAuth Endpoints

Use clear endpoints following the existing API conventions.

For example:

```text
GET /auth/google
GET /auth/google/callback
```

If the project already has an OAuth route structure, follow that structure instead.

---

# 5. Google Identity Validation

After Google redirects to the callback:

1. Validate the OAuth authorization response.
2. Exchange the authorization code securely.
3. Retrieve the Google user identity.
4. Verify the Google identity token according to Google's OAuth/OpenID Connect requirements.
5. Confirm the email is verified by Google.
6. Extract:

```text
google_user_id
email
name
profile image
```

Do not trust an email supplied directly by the browser.

The backend must obtain the identity from Google's authenticated OAuth response.

---

# 6. Existing Google Account

First check:

```text
provider = GOOGLE
provider_user_id = google_user_id
```

If found:

```text
Google account
      ↓
user_auth_providers
      ↓
user_id
      ↓
users
      ↓
Create application session
      ↓
Login successful
```

Do not create another user.

---

# 7. Google Email Matches Existing User

This is an important case.

Suppose the database already contains:

```text
users
--------------------------------
id: A
email: example@gmail.com
```

The user then chooses:

```text
Continue with Google
```

Google returns:

```text
email: example@gmail.com
google_user_id: 123456
email_verified: true
```

The backend should:

```text
1. Search for GOOGLE + 123456
2. If not found, search users by email
3. Existing user found
4. Confirm Google email is verified
5. Link Google provider to existing user
6. Do NOT create a new users record
7. Create the normal application session
8. Log the user in
```

Result:

```text
users
──────────────────────────────
id: A
email: example@gmail.com

user_auth_providers
──────────────────────────────
user_id: A
provider: GOOGLE
provider_user_id: 123456
```

The user now has:

```text
Email/password ──┐
                 ├── User A
Google ──────────┘
```

---

# 8. Existing User With Unverified Email

If the existing user is:

```text
users
email = example@gmail.com
email_verified_at = NULL
```

and Google returns:

```text
email = example@gmail.com
email_verified = true
```

Follow the application's email-verification policy.

If Google has verified the email, it may be used to satisfy the application's email-verification requirement.

Update:

```text
email_verified_at = CURRENT_TIMESTAMP
```

Then link the Google provider and create the normal application session.

Do not send the user through unnecessary email verification if the application's security policy explicitly accepts Google's verified email.

If the project requirements require verification through our own email regardless of provider, instead send the user through the existing email-verification flow.

Choose one policy and implement it consistently across the application.

---

# 9. New Google User

If:

```text
GOOGLE + google_user_id
```

does not exist and:

```text
users.email
```

does not exist:

Create a new user.

Example:

```text
users
--------------------------------
email = example@gmail.com
name = Google User
image_url = Google profile image
email_verified_at = CURRENT_TIMESTAMP
```

Then create:

```text
user_auth_providers
--------------------------------
user_id = new user ID
provider = GOOGLE
provider_user_id = Google ID
provider_email = example@gmail.com
```

Then create the normal application session.

Expected flow:

```text
Continue with Google
       ↓
Google authentication
       ↓
New user created
       ↓
Email considered verified because Google verified it
       ↓
Session created
       ↓
Dashboard
```

---

# 10. Duplicate Account Protection

Never create another `users` record when the email already exists.

Example:

```text
Existing:
example@gmail.com
```

Google login:

```text
example@gmail.com
```

Must NOT result in:

```text
User A → example@gmail.com
User B → example@gmail.com
```

The existing:

```sql
UNIQUE(email)
```

constraint must remain.

Instead:

```text
Google
  ↓
existing email
  ↓
existing user
  ↓
link Google
  ↓
login
```

---

# 11. Security

Implement OAuth securely.

Requirements:

- Use authorization code flow.
- Validate OAuth state to prevent CSRF.
- Validate redirect/callback URL.
- Never expose Google client secret to frontend.
- Validate Google's identity/token.
- Require verified Google email before using it for account linking.
- Do not trust user-provided email values.
- Do not accept arbitrary `provider_user_id` from the frontend.
- Do not allow a Google account already linked to another user to be linked to a different user.
- Respect the unique `(provider, provider_user_id)` constraint.
- Do not log access tokens, refresh tokens, client secrets, or sensitive OAuth credentials.
- Reuse the application's existing secure session creation mechanism.

---

# 12. Account Linking Rules

Implement these rules:

### Case A — Google provider already linked

```text
Google ID exists
      ↓
Login existing user
```

### Case B — Google ID does not exist, email matches existing user

```text
Google ID not found
      ↓
Email exists
      ↓
Google email verified
      ↓
Link Google to existing user
      ↓
Login
```

### Case C — Neither Google ID nor email exists

```text
Google ID not found
      ↓
Email not found
      ↓
Create user
      ↓
Create Google provider
      ↓
Login
```

### Case D — Google ID belongs to another user

```text
Google ID already linked to User A
but request attempts to link it to User B
```

Reject the linking operation.

Never silently move a Google identity between users.

---

# 13. Frontend

Add:

```text
Continue with Google
```

to the existing login page.

If Google registration is supported through the same flow, the same button can be used on the registration/login experience.

The frontend should not implement the Google client secret or manually create users.

The backend controls the OAuth flow.

Handle:

```text
Loading
Success
OAuth cancelled
OAuth failed
Account linking required
Account already linked
Invalid OAuth response
Server error
```

Use the application's existing notification/error UI.

---

# 14. Session

After successful Google authentication:

```text
Google OAuth
    ↓
Find/create/link user
    ↓
Existing session service
    ↓
Create authenticated session
    ↓
Set secure session cookie
    ↓
Redirect to application
```

Do NOT create a separate Google-specific session system.

Do NOT return a JWT unless the existing application already requires one.

---

# 15. Logout

Google login must use the same application logout flow as normal login.

Logging out of our application should:

```text
destroy/revoke the application's session
```

Do not automatically sign the user out of their Google account.

---

# 16. Error Handling

Use the existing application's error classes and response conventions.

Handle at least:

```text
OAUTH_STATE_INVALID
GOOGLE_AUTH_FAILED
GOOGLE_EMAIL_NOT_VERIFIED
GOOGLE_ACCOUNT_ALREADY_LINKED
OAUTH_CALLBACK_FAILED
```

Do not expose internal OAuth errors, tokens, or provider responses to the client.

---

# 17. Testing

Test these scenarios:

### New user

1. New Google user can authenticate.
2. User is created.
3. Google provider is created.
4. Email is marked verified according to the chosen policy.
5. User receives an application session.
6. User reaches the authenticated application.

### Existing email/password user

7. Existing user with same verified email can login with Google.
8. No duplicate `users` record is created.
9. Google provider is linked to the existing user.
10. User can subsequently login with either password or Google.

### Existing unverified user

11. Existing unverified user with matching Google verified email follows the defined verification policy.
12. No duplicate account is created.

### Existing Google user

13. Existing Google user logs in successfully.
14. No duplicate provider or user is created.

### Security

15. Invalid OAuth state is rejected.
16. Invalid callback is rejected.
17. Unverified Google email cannot be used when verification is required.
18. A Google account already linked to User A cannot be linked to User B.
19. Google client secret is never exposed to frontend.
20. OAuth tokens/secrets are never written to logs.

---

# 18. Implementation Rules

Before modifying code:

1. Inspect the existing authentication architecture.
2. Find current login/session creation logic.
3. Find user repository/service.
4. Find current route/controller structure.
5. Find database repository patterns.
6. Find existing environment configuration.
7. Find existing error handling.
8. Find frontend authentication state.
9. Find existing protected-route behavior.

Then implement Google OAuth using the existing architecture.

Do not rewrite unrelated authentication functionality.

Do not introduce TypeScript if this project uses JavaScript.

Keep the implementation modular and easy to maintain.

After implementation, run:

```text
Database migration
Backend tests
Frontend tests
Lint
Build
OAuth integration tests where possible
```

Finally, report:

```text
Files changed
Database changes
New OAuth endpoints
Google OAuth configuration required
Account-linking behavior
Session behavior
Tests completed
Remaining configuration/setup
```

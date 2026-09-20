# Environment Setup

## 1. Prerequisites

| Tool | Version |
|---|---|
| Node.js | 22.22.2 (pinned in `backend/package.json` `engines`) |
| npm | Bundled with Node |
| PostgreSQL | 14+ (UUID via `pgcrypto`) |
| Git | Any recent version |

Optional accounts: Stripe, Cloudinary, Brevo (for payment, image, and email features).

## 2. Clone & Install

```bash
git clone https://github.com/Rafy-Tho/Learning_Online_Platform_Pern.git
cd LEARNING_ONLINE_PLATFORM

cd backend && npm install
cd ../frontend && npm install
cd ../admin && npm install
```

## 3. Environment Variables

Create a `.env` in each app. All `.env` files are gitignored. **Do not commit them.**

### 3.1 `backend/.env`

| Variable | Description |
|---|---|
| `PORT` | API port (e.g. `5000`) |
| `NODE_ENV` | `development` or `production` |
| `DATABASE_URL` | PostgreSQL connection string |
| `SESSION_SECRET` | Long random string for session signing |
| `COOKIE_NAME` | Session cookie name |
| `CLIENT_URL_1` | Allowed origin (learner frontend) |
| `CLIENT_URL_2` | Allowed origin (admin dashboard) |
| `BREVO_API_KEY` | Brevo transactional email key |
| `SENDER_EMAIL` | From address for emails |
| `CLOUDINARY_NAME` | Cloudinary cloud name |
| `CLOUDINARY_API_KEY` | Cloudinary API key |
| `CLOUDINARY_SECRET_KEY` | Cloudinary API secret |
| `STRIPE_SECRET_KEY` | Stripe secret key |
| `STRIPE_WEBHOOK_SECRET` | Stripe webhook signing secret |
| `GOOGLE_CLIENT_ID` | Google OAuth client ID (optional; enables Google login) |
| `GOOGLE_CLIENT_SECRET` | Google OAuth client secret (optional, server-only) |
| `GOOGLE_CALLBACK_URL` | Google redirect URI; must match the Google Cloud Console entry |

Example (values are placeholders):

```dotenv
PORT=5000
NODE_ENV=development
DATABASE_URL=postgresql://postgres:postgres@localhost:5432/learning_platform
SESSION_SECRET=change-me-to-a-long-random-string
COOKIE_NAME=lms_session
CLIENT_URL_1=http://localhost:5173
CLIENT_URL_2=http://localhost:5174
BREVO_API_KEY=
SENDER_EMAIL=no-reply@example.com
CLOUDINARY_NAME=
CLOUDINARY_API_KEY=
CLOUDINARY_SECRET_KEY=
STRIPE_SECRET_KEY=
STRIPE_WEBHOOK_SECRET=
GOOGLE_CLIENT_ID=
GOOGLE_CLIENT_SECRET=
GOOGLE_CALLBACK_URL=http://localhost:5000/api/v1/auth/google/callback
```

### 3.2 `frontend/.env`

```dotenv
VITE_BASE_URL=http://localhost:5000/api/v1
```

### 3.3 `admin/.env`

```dotenv
VITE_BASE_URL=http://localhost:5000/api/v1
```

Only `VITE_*` variables reach the browser. Never put secrets in frontend env files.

## 4. Database Setup

1. Create a database:

```bash
createdb learning_platform
```

2. Apply the schema (an empty database is built from scratch):

```bash
cd backend
npm run db:migrate   # apply migrations (creates the schema)
npm run db:status    # list applied/pending
```

3. The `session` table is created automatically on first backend start (`connect-pg-simple`).

## 5. Running the Apps

Open three terminals:

```bash
# backend
cd backend
npm run dev          # node --watch server.js

# learner frontend
cd frontend
npm run dev          # vite

# admin dashboard
cd admin
npm run dev          # vite
```

Vite prints the local URLs (commonly `5173` and `5174`). Ensure those origins match `CLIENT_URL_1` / `CLIENT_URL_2`.

## 6. Stripe Webhook (local)

Use the Stripe CLI to forward events and get a signing secret:

```bash
stripe listen --forward-to localhost:5000/api/v1/webhooks/stripe
```

Copy the printed `whsec_...` into `STRIPE_WEBHOOK_SECRET`.

## 6.1 Google OAuth (local)

1. In Google Cloud Console, create an OAuth 2.0 Client ID (type: Web application).
2. Add an authorized redirect URI matching `GOOGLE_CALLBACK_URL`, e.g.
   `http://localhost:5000/api/v1/auth/google/callback`.
3. Put the generated client ID/secret into `GOOGLE_CLIENT_ID` /
   `GOOGLE_CLIENT_SECRET`. These are optional: with them unset the API still
   boots, but `/api/v1/auth/google` redirects back with `GOOGLE_AUTH_FAILED`.
4. The callback returns to `CLIENT_URL_1` (learner frontend) at
   `/auth/callback`; ensure it is running.

## 7. Scripts Reference

| App | Command | Description |
|---|---|---|
| backend | `npm run dev` | Watch mode server |
| backend | `npm run pro` | Production start (`NODE_ENV=production`) |
| backend | `npm run db:migrate` | Apply pending DB migrations |
| backend | `npm run db:status` | List applied/pending DB migrations |
| backend | `npx eslint .` | Lint (no npm script) |
| frontend | `npm run dev` | Vite dev server |
| frontend | `npm run build` | Production build |
| frontend | `npm run preview` | Preview build |
| frontend | `npm run lint` | ESLint |
| admin | `npm run dev` | Vite dev server |
| admin | `npm run build` | Production build |
| admin | `npm run preview` | Preview build |
| admin | `npm run lint` | ESLint |

## 8. Troubleshooting

| Symptom | Likely Cause / Fix |
|---|---|
| CORS error in browser | Frontend origin not in `CLIENT_URL_1`/`CLIENT_URL_2` |
| Cookies not sent | Ensure `credentials: "include"` and matching origins; HTTPS in production |
| `relation "lesson_contents" does not exist` | Database missing migrations — run `npm run db:migrate` |
| `column "access_type" does not exist` | Database missing migrations — run `npm run db:migrate` |
| Session lost on restart | Confirm `connect-pg-simple` store and DB connectivity |
| Emails not sent | Verify `BREVO_API_KEY` and `SENDER_EMAIL` |
| Image upload fails | Check Cloudinary credentials and 5 MB/type limits |
| Google login redirects back with `GOOGLE_AUTH_FAILED` | Set `GOOGLE_CLIENT_ID`/`GOOGLE_CLIENT_SECRET`; check `GOOGLE_CALLBACK_URL` matches the Google Console redirect URI exactly |
| Google callback returns `OAUTH_STATE_INVALID` | The session cookie was missing/expired between start and callback; retry from the login page |

## 9. Verifying the Setup

1. Backend logs `DB READY` and listening on `PORT`.
2. `GET http://localhost:5000/api/v1/categories` returns `{ success: true, ... }`.
3. Register a user in the learner frontend and confirm `GET /users/me` returns the user.
4. Log in to the admin dashboard with an `ADMIN` user (create one directly in the DB if needed).

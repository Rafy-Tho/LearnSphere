# Deployment

## 1. Overview

The platform deploys as three components:

| Component | Artifact | Runtime |
|---|---|---|
| Backend API | Node.js process | `npm run pro` (`NODE_ENV=production node server.js`) |
| Learner frontend | Static build (`frontend/dist`) | Static host / CDN |
| Admin dashboard | Static build (`admin/dist`) | Static host / CDN |
| Database | Managed PostgreSQL | External service |

The README references a live deployment on Render: `https://learning-online-platform-pern.onrender.com/`.

## 2. Build Commands

```bash
# backend (no build step; run directly)
cd backend && npm ci && npm run pro

# frontend
cd frontend && npm ci && npm run build     # -> frontend/dist

# admin
cd admin && npm ci && npm run build        # -> admin/dist
```

## 3. Environment Variables (Production)

Set these on the backend host:

| Variable | Notes |
|---|---|
| `NODE_ENV` | `production` |
| `PORT` | Usually provided by the host |
| `DATABASE_URL` | Managed Postgres connection string (SSL as required) |
| `SESSION_SECRET` | Long random secret |
| `COOKIE_NAME` | Session cookie name |
| `CLIENT_URL_1` | Learner frontend origin (https) |
| `CLIENT_URL_2` | Admin dashboard origin (https) |
| `BREVO_API_KEY` | Email |
| `SENDER_EMAIL` | Verified sender |
| `CLOUDINARY_NAME` / `CLOUDINARY_API_KEY` / `CLOUDINARY_SECRET_KEY` | Image hosting |
| `STRIPE_SECRET_KEY` | Live or test secret key |
| `STRIPE_WEBHOOK_SECRET` | Endpoint signing secret |
| `GOOGLE_CLIENT_ID` / `GOOGLE_CLIENT_SECRET` | Google OAuth client (optional; enables Google login) |
| `GOOGLE_CALLBACK_URL` | Public `https://<api-host>/api/v1/auth/google/callback`; register it as an authorized redirect URI in Google Cloud Console |

Frontends: set `VITE_BASE_URL` to the public API URL **at build time** (Vite inlines it).

## 4. Deployment Steps

### 4.1 Database

1. Provision PostgreSQL.
2. Apply the schema:
   ```bash
   psql "$DATABASE_URL" -f backend/src/db/schema.sql
   ```
3. Create an initial `ADMIN` user if needed:
   ```sql
   INSERT INTO users (name, email, password, role, status)
   VALUES ('Admin', 'admin@example.com', '<bcrypt-hash>', 'ADMIN', 'ACTIVE');
   ```
   (Generate the bcrypt hash with the app's `HashService` or a trusted tool.)
4. The `session` table is created on first backend start.

### 4.2 Backend

1. Deploy the `backend/` directory with Node 22.
2. Set all backend env vars.
3. Run `npm ci` then `npm run pro`.
4. Verify health: `GET /api/v1/categories` returns the envelope.
5. Ensure the host terminates TLS and forwards `X-Forwarded-*` (needed for `trust proxy` + secure cookies).

### 4.3 Frontends

1. Set `VITE_BASE_URL` to `https://<api-host>/api/v1`.
2. Build both apps (`npm run build`).
3. Deploy `frontend/dist` and `admin/dist` to static hosting.
4. Confirm each deployed origin is listed in `CLIENT_URL_1` / `CLIENT_URL_2`.

### 4.4 Stripe

1. Create a webhook endpoint pointing to `https://<api-host>/api/v1/webhooks/stripe`.
2. Subscribe to `checkout.session.completed` (at minimum).
3. Copy the signing secret to `STRIPE_WEBHOOK_SECRET`.
4. Test with the Stripe CLI before going live.

### 4.5 Cloudinary & Brevo

1. Verify Cloudinary credentials and upload preset (if any).
2. Verify the Brevo sender domain and API key.

## 5. Post-Deploy Verification

```text
[ ] Backend responds to GET /api/v1/categories
[ ] CORS allows both frontend origins
[ ] Session cookie is set on login (Secure, HttpOnly, SameSite=None)
[ ] Register/login works on the learner frontend
[ ] Admin login works and dashboard stats load
[ ] Image upload reaches Cloudinary
[ ] Stripe checkout redirects and webhook activates subscription
[ ] Payment confirmation email arrives
[ ] Course content CRUD persists
[ ] Password reset email delivers
```

## 6. Rollback Strategy

- Keep the previous frontend builds; static hosts support instant rollback.
- For backend, deploy immutable releases and be able to redeploy the prior version.
- Database changes are applied via migrations (`npm run db:migrate`); take a backup before applying.
- Stripe webhook changes should be versioned; keep the previous secret until cutover.

## 7. Operational Notes

| Item | Detail |
|---|---|
| Sessions | Stored in PostgreSQL; ensure the DB is reachable at all times. |
| File uploads | Local `uploads/` is temporary; durable storage is Cloudinary. |
| Logging | Morgan in development; structured `logger` / `logger.audit` in all environments. |
| Scaling | DB-backed sessions allow multiple backend instances behind a load balancer. |
| File uploads | Uploads are temporary local files pushed to Cloudinary; not served statically. |
| Node version | Pin to 22.22.2 to match `engines`. |

## 8. Known Deployment Risks

- Migrations must be applied in order; always back up first.
- `sameSite: "none"` requires HTTPS; a non-HTTPS production setup breaks auth.
- No health-check endpoint beyond hitting an API route.
- No centralized logging/alerting.

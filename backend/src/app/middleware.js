import cors from "cors";
import express from "express";
import helmet from "helmet";
import environment from "../config/environment.js";
import csrfProtection from "../common/middleware/csrf-protection.js";
import { globalLimiter } from "../common/middleware/rate-limit-middlewares.js";
import requestLogger from "../common/middleware/request-logger.js";
import sessionIdleTimeout from "../common/middleware/session-idle-timeout.js";
import sessionMiddleware from "../common/middleware/session-middleware.js";
import webhookRoute from "../modules/subscriptions/webhook.routes.js";

// Accepts either a hop count ("1") or a comma-separated CIDR list
// ("loopback, 10.0.0.0/8"). Defaults to a single trusted proxy.
export function resolveTrustProxy(value) {
  if (!value) return 1;

  const hops = Number(value);
  if (Number.isInteger(hops) && hops >= 0) return hops;

  const list = value
    .split(",")
    .map((entry) => entry.trim())
    .filter(Boolean);
  return list.length > 0 ? list : 1;
}

export function registerMiddleware(app) {
  // 1. Trust proxy: exact hops/CIDR so X-Forwarded-For cannot be spoofed.
  app.set("trust proxy", resolveTrustProxy(environment.TRUST_PROXY));

  // 2. Security headers (helmet; also removes X-Powered-By)
  app.use(
    helmet({
      // The API serves JSON only, never HTML, so a locked-down CSP is safe.
      // The frontends set their own CSP at their host.
      contentSecurityPolicy: {
        useDefaults: false,
        directives: {
          defaultSrc: ["'none'"],
          baseUri: ["'none'"],
          frameAncestors: ["'none'"],
          formAction: ["'none'"],
        },
      },
      // Uploaded media lives on Cloudinary; keep API resources loadable cross-origin.
      crossOriginResourcePolicy: { policy: "cross-origin" },
      strictTransportSecurity:
        environment.NODE_ENV === "production"
          ? { maxAge: 15552000, includeSubDomains: false }
          : false,
    }),
  );

  // 3. CORS before everything
  app.use(
    cors({
      origin: [environment.CLIENT_URL_1, environment.CLIENT_URL_2],
      credentials: true,
      allowedHeaders: ["Content-Type", "X-Requested-With"],
    }),
  );

  // 4. Webhook route (needs raw body, so before json parser)
  app.use("/api/v1/webhooks/stripe", webhookRoute);

  // 5. CSRF guard for state-changing requests (after the server-to-server webhook)
  app.use(csrfProtection);

  // 6. Body parser (JSON only; urlencoded is intentionally unsupported)
  app.use(express.json());

  app.use(globalLimiter);
  app.use(sessionMiddleware);
  app.use(sessionIdleTimeout);

  // 7. Request logging (after session so the authenticated user id is available)
  app.use(requestLogger);
}

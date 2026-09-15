import cors from "cors";
import express from "express";
import path from "path";
import { fileURLToPath } from "url";
import ENV from "../config/Env.js";
import { globalLimiter } from "../common/middleware/rateLimitMiddlewares.js";
import sessionMiddleware from "../common/middleware/sessionMiddleware.js";
import webhookRoute from "../modules/subscriptions/webhook.routes.js";

const __dirname = path.dirname(fileURLToPath(import.meta.url));

export async function registerMiddleware(app) {
  // 1. Trust proxy (required for secure cookies behind Nginx/ALB/etc.)
  app.set("trust proxy", 1);

  // 2. CORS before everything
  app.use(
    cors({ origin: [ENV.CLIENT_URL_1, ENV.CLIENT_URL_2], credentials: true }),
  );

  // 3. Webhook route (needs raw body, so before json parser)
  app.use("/api/v1/webhooks/stripe", webhookRoute);

  // 4. Body parsers
  app.use(express.json());
  app.use(express.urlencoded({ extended: true }));

  // 5. No cookieParser needed - session handles it
  if (process.env.NODE_ENV === "development") {
    const { default: morgan } = await import("morgan");
    app.use(morgan("dev"));
  }

  app.use(globalLimiter);
  app.use(sessionMiddleware);

  // 6. Static uploads
  app.use(express.static(path.join(__dirname, "../../uploads")));
}

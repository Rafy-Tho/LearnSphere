import dotenv from "dotenv";

dotenv.config();

const refundWindowDays = Number(process.env.REFUND_WINDOW_DAYS);

const environment = {
  PORT: process.env.PORT,
  NODE_ENV: process.env.NODE_ENV,
  // database
  DATABASE_URL: process.env.DATABASE_URL,
  // session
  SESSION_SECRET: process.env.SESSION_SECRET,
  COOKIE_NAME: process.env.COOKIE_NAME,
  // url
  CLIENT_URL_1: process.env.CLIENT_URL_1,
  CLIENT_URL_2: process.env.CLIENT_URL_2,
  // proxy: number of trusted hops, or a comma-separated CIDR list (optional)
  TRUST_PROXY: process.env.TRUST_PROXY,
  // mail (Hostinger Mail API)
  HOSTINGER_MAIL_API_KEY: process.env.HOSTINGER_MAIL_API_KEY,
  HOSTINGER_MAIL_MAILBOX_ID: process.env.HOSTINGER_MAIL_MAILBOX_ID,
  HOSTINGER_MAIL_DISPLAY_NAME:
    process.env.HOSTINGER_MAIL_DISPLAY_NAME || "LearnSphere",
  HOSTINGER_MAIL_API_URL: process.env.HOSTINGER_MAIL_API_URL,
  // Google OAuth
  GOOGLE_CLIENT_ID: process.env.GOOGLE_CLIENT_ID,
  GOOGLE_CLIENT_SECRET: process.env.GOOGLE_CLIENT_SECRET,
  GOOGLE_CALLBACK_URL: process.env.GOOGLE_CALLBACK_URL,
  // Stripe api key
  STRIPE_SECRET_KEY: process.env.STRIPE_SECRET_KEY,
  STRIPE_WEBHOOK_SECRET: process.env.STRIPE_WEBHOOK_SECRET,
  // learner refund window (days from payment.paid_at); defaults to 14
  REFUND_WINDOW_DAYS:
    Number.isFinite(refundWindowDays) && refundWindowDays >= 0
      ? refundWindowDays
      : 14,
  // cloudinary
  CLOUDINARY_NAME: process.env.CLOUDINARY_NAME,
  CLOUDINARY_API_KEY: process.env.CLOUDINARY_API_KEY,
  CLOUDINARY_SECRET_KEY: process.env.CLOUDINARY_SECRET_KEY,
};

// Fail fast on missing configuration instead of failing later at request time.
// Google OAuth is optional: when unset, the OAuth routes report not-configured
// instead of preventing the whole API from booting.
const OPTIONAL_KEYS = [
  "TRUST_PROXY",
  "HOSTINGER_MAIL_DISPLAY_NAME",
  "HOSTINGER_MAIL_API_URL",
  "GOOGLE_CLIENT_ID",
  "GOOGLE_CLIENT_SECRET",
  "GOOGLE_CALLBACK_URL",
];
const REQUIRED_KEYS = Object.keys(environment).filter(
  (key) => !OPTIONAL_KEYS.includes(key),
);
const missing = REQUIRED_KEYS.filter((key) => !environment[key]);
if (missing.length > 0) {
  throw new Error(
    `Missing required environment variables: ${missing.join(", ")}. See .env.example.`,
  );
}

if (
  environment.NODE_ENV === "production" &&
  environment.SESSION_SECRET.length < 32
) {
  throw new Error(
    "SESSION_SECRET must be at least 32 characters in production",
  );
}

export default environment;

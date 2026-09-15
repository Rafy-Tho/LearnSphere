import dotenv from "dotenv";

dotenv.config();

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
  // mail
  BREVO_API_KEY: process.env.BREVO_API_KEY,
  SENDER_EMAIL: process.env.SENDER_EMAIL,
  // Stripe api key
  STRIPE_SECRET_KEY: process.env.STRIPE_SECRET_KEY,
  STRIPE_WEBHOOK_SECRET: process.env.STRIPE_WEBHOOK_SECRET,
  // cloudinary
  CLOUDINARY_NAME: process.env.CLOUDINARY_NAME,
  CLOUDINARY_API_KEY: process.env.CLOUDINARY_API_KEY,
  CLOUDINARY_SECRET_KEY: process.env.CLOUDINARY_SECRET_KEY,
};

// Fail fast on missing configuration instead of failing later at request time.
const REQUIRED_KEYS = Object.keys(environment);
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

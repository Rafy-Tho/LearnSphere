import connectPgSimple from "connect-pg-simple";
import session from "express-session";
import pgPool from "../../config/database.js";
import environment from "../../config/environment.js";

const THIRTY_DAYS_S = 60 * 60 * 24 * 30; // seconds  (for DB / ttl)
const THIRTY_DAYS_MS = THIRTY_DAYS_S * 1000; // ms       (for cookie)

const pgSession = connectPgSimple(session);

const sessionMiddleware = session({
  store: new pgSession({
    pool: pgPool,
    tableName: "session",
    createTableIfMissing: true,
    pruneSessionInterval: 60 * 360, // prune expired rows every 6 hours
    ttl: () => THIRTY_DAYS_S, // ← function form: always 30 days
  }),
  secret: environment.SESSION_SECRET,
  resave: false,
  saveUninitialized: false,
  name: environment.COOKIE_NAME,
  rolling: true, // resets expiry on every request ✓
  unset: "destroy", // ← change: "keep" can leave stale DB rows
  cookie: {
    httpOnly: true,
    secure: environment.NODE_ENV === "production",
    sameSite: environment.NODE_ENV === "production" ? "none" : "lax",
    maxAge: THIRTY_DAYS_MS,
  },
});

export default sessionMiddleware;

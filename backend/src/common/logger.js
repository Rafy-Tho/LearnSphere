/* eslint-disable no-console */
/**
 * Minimal structured logger. Centralizes console usage so it can be
 * swapped for a library later without touching call sites.
 */
function write(level, message, meta) {
  const entry = { time: new Date().toISOString(), level, message };
  if (meta !== undefined) entry.meta = meta;
  const line = JSON.stringify(entry);

  if (level === "error") console.error(line);
  else if (level === "warn") console.warn(line);
  else console.log(line);
}

const logger = {
  debug: (message, meta) => write("debug", message, meta),
  info: (message, meta) => write("info", message, meta),
  warn: (message, meta) => write("warn", message, meta),
  error: (message, meta) => write("error", message, meta),
  // Structured audit trail for security-relevant events. Callers must pass only
  // non-sensitive fields (ids, actions, outcomes) — never secrets or credentials.
  audit: (action, meta) => write("info", `audit:${action}`, meta),
};

export default logger;

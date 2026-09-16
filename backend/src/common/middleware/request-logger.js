import logger from "../logger.js";

// Logs every request with method, path, status and duration. Runs after the
// session middleware so the authenticated user id is available when present.
function requestLogger(req, res, next) {
  const startedAt = process.hrtime.bigint();

  res.on("finish", () => {
    const durationMs = Number(process.hrtime.bigint() - startedAt) / 1e6;
    const meta = {
      method: req.method,
      path: req.originalUrl,
      status: res.statusCode,
      durationMs: Math.round(durationMs * 100) / 100,
      ip: req.ip,
      userId: req.session?.user?.id ?? null,
    };

    const message = `${req.method} ${req.originalUrl} ${res.statusCode}`;
    if (res.statusCode >= 500) logger.error(message, meta);
    else if (res.statusCode >= 400) logger.warn(message, meta);
    else logger.info(message, meta);
  });

  return next();
}

export default requestLogger;

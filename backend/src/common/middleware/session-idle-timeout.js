const SESSION_IDLE_TIMEOUT_MS = 24 * 60 * 60 * 1000; // 24 hours

// Destroys a session that has been idle beyond the timeout, independent of the
// 30-day rolling cookie window. Must run after the session middleware.
function sessionIdleTimeout(req, res, next) {
  const session = req.session;
  if (!session?.user) return next();

  const now = Date.now();
  const lastActivity = session.lastActivity;

  if (lastActivity && now - lastActivity > SESSION_IDLE_TIMEOUT_MS) {
    return session.destroy((error) => {
      if (error) return next(error);
      return next();
    });
  }

  session.lastActivity = now;
  return next();
}

export default sessionIdleTimeout;

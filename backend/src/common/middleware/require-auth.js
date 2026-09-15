import StatusCode from "../constants/status-code.js";
import sessionService from "../services/session-service.js";
import ApiError from "../errors/api-error.js";

function requireAuth(req, res, next) {
  const user = sessionService.validate(req);
  if (!user) return next(new ApiError(StatusCode.UNAUTHORIZED, "Unauthorized"));
  req.user = user;
  next();
}

export default requireAuth;

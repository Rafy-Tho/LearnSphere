import StatusCode from "../constants/StatusCode.js";
import sessionService from "../services/SessionService.js";
import ApiError from "../errors/ApiError.js";

function requireAuth(req, res, next) {
  const user = sessionService.validate(req);
  if (!user) return next(new ApiError(StatusCode.UNAUTHORIZED, "Unauthorized"));
  req.user = user;
  next();
}

export default requireAuth;

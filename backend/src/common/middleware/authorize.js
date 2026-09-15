import StatusCode from "../constants/StatusCode.js";
import ApiError from "../errors/ApiError.js";

const authorize = (...roles) => {
  return (req, res, next) => {
    const user = req.session.user;
    if (!user || !roles.includes(user.role)) {
      return next(
        new ApiError(
          StatusCode.FORBIDDEN,
          "You are not authorized to access this resource.",
        ),
      );
    }
    next();
  };
};

export default authorize;

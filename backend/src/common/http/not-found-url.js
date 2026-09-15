import StatusCode from "../constants/status-code.js";
import ApiError from "../errors/api-error.js";

const notFoundUrl = (req, res, next) => {
  next(new ApiError(StatusCode.NOT_FOUND, "Not Found " + req.originalUrl));
};
export default notFoundUrl;

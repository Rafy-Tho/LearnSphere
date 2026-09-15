import StatusCode from "../constants/status-code.js";
import ApiError from "../errors/api-error.js";

const STATE_CHANGING_METHODS = ["POST", "PUT", "PATCH", "DELETE"];
const ALLOWED_CONTENT_TYPES = ["application/json", "multipart/form-data"];

// CSRF mitigation for a cross-site session-cookie API: a plain browser form can
// send neither a custom header nor an `application/json` body without a CORS
// preflight, which the origin allowlist rejects for untrusted sites.
function csrfProtection(req, res, next) {
  if (!STATE_CHANGING_METHODS.includes(req.method)) return next();

  // Server-to-server callbacks (Stripe) carry no session and are signature-verified.
  if (req.path.startsWith("/api/v1/webhooks")) return next();

  if (!req.headers["x-requested-with"]) {
    return next(
      new ApiError(StatusCode.FORBIDDEN, "Missing required request header"),
    );
  }

  const contentType = (req.headers["content-type"] || "").toLowerCase();
  const hasAllowedContentType = ALLOWED_CONTENT_TYPES.some((type) =>
    contentType.includes(type),
  );
  if (!hasAllowedContentType) {
    return next(
      new ApiError(StatusCode.FORBIDDEN, "Unsupported request content type"),
    );
  }

  return next();
}

export default csrfProtection;

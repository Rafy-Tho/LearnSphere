import crypto from "crypto";
import ENV from "../../config/Env.js";

// HMAC-SHA256 keyed with the server secret (pepper) so a leaked database
// cannot brute-force the 6-digit reset codes offline.
export default function hashCode(code) {
  return crypto
    .createHmac("sha256", ENV.SESSION_SECRET)
    .update(String(code))
    .digest("hex");
}

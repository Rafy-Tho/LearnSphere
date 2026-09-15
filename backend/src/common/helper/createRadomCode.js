import crypto from "crypto";

// Cryptographically secure 6-digit code.
const createRandomCode = () => {
  return crypto.randomInt(0, 1_000_000).toString().padStart(6, "0");
};

export default createRandomCode;

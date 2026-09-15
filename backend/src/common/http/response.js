import StatusCode from "../constants/status-code.js";

/**
 * Send the standard success envelope.
 * @param {import("express").Response} res
 * @param {unknown} [payload]
 * @param {{ statusCode?: number, message?: string, pagination?: object }} [options]
 */
export function sendSuccess(res, payload = null, options = {}) {
  const {
    statusCode = StatusCode.OK,
    message = "OK",
    pagination,
  } = options;

  const body = { success: true, statusCode, message, data: payload };
  if (pagination) body.pagination = pagination;

  return res.status(statusCode).json(body);
}

export default sendSuccess;

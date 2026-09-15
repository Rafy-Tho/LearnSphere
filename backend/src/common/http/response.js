import StatusCode from "../constants/StatusCode.js";

/**
 * Send the standard success envelope.
 * @param {import("express").Response} res
 * @param {unknown} [data]
 * @param {{ statusCode?: number, message?: string, pagination?: object }} [options]
 */
export function sendSuccess(res, data = null, options = {}) {
  const {
    statusCode = StatusCode.OK,
    message = "OK",
    pagination,
  } = options;

  const body = { success: true, statusCode, message, data };
  if (pagination) body.pagination = pagination;

  return res.status(statusCode).json(body);
}

export default sendSuccess;

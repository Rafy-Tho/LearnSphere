import environment from "../../config/environment.js";
import logger from "../logger.js";

const DEFAULT_API_URL = "https://api.mail.hostinger.com";
const REQUEST_TIMEOUT_MS = 10_000;
const MAX_ATTEMPTS = 3;
const BASE_BACKOFF_MS = 300;
const MAX_BACKOFF_MS = 5_000;

class EmailDeliveryError extends Error {
  constructor(
    message,
    { statusCode, code, retryable = false, retryAfterMs, correlationId } = {},
  ) {
    super(message);
    this.name = "EmailDeliveryError";
    this.statusCode = statusCode;
    this.code = code;
    this.retryable = retryable;
    this.retryAfterMs = retryAfterMs;
    this.correlationId = correlationId;
  }
}

const sleep = (ms) => new Promise((resolve) => setTimeout(resolve, ms));

// Exponential backoff with jitter, capped so a hung provider cannot stall callers.
function backoffDelay(attempt) {
  const base = Math.min(BASE_BACKOFF_MS * 2 ** attempt, MAX_BACKOFF_MS);
  return Math.round(base / 2 + Math.random() * (base / 2));
}

function parseRetryAfter(headerValue) {
  if (!headerValue) return null;
  const seconds = Number(headerValue);
  if (Number.isFinite(seconds)) return Math.max(0, seconds * 1000);
  const date = Date.parse(headerValue);
  if (Number.isNaN(date)) return null;
  return Math.max(0, date - Date.now());
}

// Transient failures only: network/timeout, 429 and 5xx. Client errors (400,
// 401, 403, 404, 422) are permanent and retrying them would just repeat.
const isRetryableStatus = (statusCode) => statusCode === 429 || statusCode >= 500;

class EmailService {
  async #request(payload) {
    const baseUrl = environment.HOSTINGER_MAIL_API_URL || DEFAULT_API_URL;
    const url = `${baseUrl}/api/v1/mailboxes/${environment.HOSTINGER_MAIL_MAILBOX_ID}/send`;

    const controller = new AbortController();
    const timer = setTimeout(() => controller.abort(), REQUEST_TIMEOUT_MS);

    try {
      const res = await fetch(url, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${environment.HOSTINGER_MAIL_API_KEY}`,
        },
        body: JSON.stringify(payload),
        signal: controller.signal,
      });

      // 204 No Content means the message was accepted.
      if (res.status === 204) return;

      // Read the error envelope for metadata only. The body is never surfaced
      // in the thrown error or logs, so message content cannot leak.
      let body = null;
      try {
        body = await res.json();
      } catch {
        body = null;
      }

      throw new EmailDeliveryError("Hostinger Mail API rejected the message", {
        statusCode: res.status,
        code: body?.code,
        retryable: isRetryableStatus(res.status),
        retryAfterMs: parseRetryAfter(res.headers.get("retry-after")),
        correlationId: body?.correlation_id,
      });
    } catch (error) {
      if (error instanceof EmailDeliveryError) throw error;
      if (error?.name === "AbortError") {
        throw new EmailDeliveryError("Hostinger Mail API request timed out", {
          retryable: true,
        });
      }
      throw new EmailDeliveryError("Hostinger Mail API request failed", {
        retryable: true,
      });
    } finally {
      clearTimeout(timer);
    }
  }

  async #sendViaHostinger(payload) {
    let lastError;
    for (let attempt = 0; attempt < MAX_ATTEMPTS; attempt += 1) {
      try {
        return await this.#request(payload);
      } catch (error) {
        lastError = error;
        if (!error.retryable || attempt === MAX_ATTEMPTS - 1) break;
        const delay =
          error.retryAfterMs != null
            ? Math.min(error.retryAfterMs, MAX_BACKOFF_MS)
            : backoffDelay(attempt);
        await sleep(delay);
      }
    }
    throw lastError;
  }

  async send({ to, subject, text, html }) {
    const payload = {
      to: [to],
      displayName: environment.HOSTINGER_MAIL_DISPLAY_NAME,
      subject,
      text,
      html: html || `<p>${text}</p>`,
    };

    try {
      await this.#sendViaHostinger(payload);
      logger.info("Email sent");
      return { success: true };
    } catch (error) {
      // Log non-sensitive metadata only. Never the API key, verification/reset
      // codes, tokens, recipients, or email content.
      logger.error("Email delivery failed", {
        statusCode: error.statusCode,
        code: error.code,
        correlationId: error.correlationId,
      });
      throw error;
    }
  }

  async sendPaymentConfirmation(to, { planName, amount, startDate, endDate }) {
    const formattedAmount = new Intl.NumberFormat("en-US", {
      style: "currency",
      currency: "USD",
    }).format(amount);

    const formattedStart = new Date(startDate).toLocaleDateString("en-US", {
      year: "numeric",
      month: "long",
      day: "numeric",
    });

    const formattedEnd = new Date(endDate).toLocaleDateString("en-US", {
      year: "numeric",
      month: "long",
      day: "numeric",
    });

    return this.send({
      to,
      subject: `Payment Confirmation - ${planName}`,
      text: `Your payment of ${formattedAmount} for ${planName} has been confirmed. Valid from ${formattedStart} to ${formattedEnd}.`,
      html: `
        <div style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto;">
          <h2 style="color: #2563eb;">Payment Confirmed</h2>
          <p>Thank you for your purchase! Your payment has been successfully processed.</p>
          <table style="width: 100%; border-collapse: collapse; margin: 20px 0;">
            <tr>
              <td style="padding: 8px; border-bottom: 1px solid #eee; font-weight: bold;">Plan</td>
              <td style="padding: 8px; border-bottom: 1px solid #eee;">${planName}</td>
            </tr>
            <tr>
              <td style="padding: 8px; border-bottom: 1px solid #eee; font-weight: bold;">Amount</td>
              <td style="padding: 8px; border-bottom: 1px solid #eee;">${formattedAmount}</td>
            </tr>
            <tr>
              <td style="padding: 8px; border-bottom: 1px solid #eee; font-weight: bold;">Start Date</td>
              <td style="padding: 8px; border-bottom: 1px solid #eee;">${formattedStart}</td>
            </tr>
            <tr>
              <td style="padding: 8px; border-bottom: 1px solid #eee; font-weight: bold;">End Date</td>
              <td style="padding: 8px; border-bottom: 1px solid #eee;">${formattedEnd}</td>
            </tr>
          </table>
          <p style="color: #666; font-size: 12px;">If you have any questions, please contact our support team.</p>
        </div>
      `,
    });
  }

  async sendWelcome(to, name) {
    return this.send({
      to,
      subject: "Welcome to Learning Platform",
      text: `Hi ${name}, welcome to Learning Platform! We're glad to have you.`,
      html: `
        <div style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto;">
          <h2 style="color: #2563eb;">Welcome to Learning Platform!</h2>
          <p>Hi ${name},</p>
          <p>We're excited to have you on board. Here's what you can do:</p>
          <ul>
            <li>Browse and enroll in courses</li>
            <li>Track your learning progress</li>
            <li>Earn certificates upon completion</li>
          </ul>
          <p>Start exploring our courses and begin your learning journey today!</p>
          <p style="color: #666; font-size: 12px;">If you have any questions, feel free to reach out to our support team.</p>
        </div>
      `,
    });
  }

  async sendResetCode(to, code) {
    return this.send({
      to,
      subject: "Password Reset Code",
      text: `Your password reset code is: ${code}`,
      html: `
        <div style="font-family: Arial;">
          <h2>Password Reset</h2>
          <p>Your code:</p>
          <h1 style="color:green;">${code}</h1>
          <p>Expires in 10 minutes</p>
        </div>
      `,
    });
  }

  async sendVerificationCode(to, code) {
    return this.send({
      to,
      subject: "Verify Your Email",
      text: `Your verification code is: ${code}. This code expires in 10 minutes.`,
      html: `
        <div style="font-family: Arial;">
          <h2>Verify Your Email</h2>
          <p>Your verification code is:</p>
          <h1 style="color:green;">${code}</h1>
          <p>This code expires in 10 minutes.</p>
        </div>
      `,
    });
  }
}

const emailService = new EmailService();

export { EmailService, EmailDeliveryError };
export default emailService;

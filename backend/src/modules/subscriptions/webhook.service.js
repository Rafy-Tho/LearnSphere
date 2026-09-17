import logger from "../../common/logger.js";
import emailService from "../../common/services/email-service.js";
import { withTransaction } from "../../config/database.js";
import userRepository from "../users/repository.js";
import couponRepository from "./coupon.repository.js";
import paymentRepository from "./payment.repository.js";
import planRepository from "./plan.repository.js";
import refundRepository from "./refund.repository.js";
import subscriptionRepository from "./subscription.repository.js";
import webhookEventRepository from "./webhook-event.repository.js";

const REFUND_STATUS_MAP = {
  pending: "PENDING",
  requires_action: "PENDING",
  succeeded: "SUCCEEDED",
  failed: "FAILED",
  canceled: "FAILED",
};

function roundMoney(value) {
  return Math.round(Number(value) * 100) / 100;
}

class StripeWebhookService {
  constructor({
    subscriptionRepository,
    paymentRepository,
    planRepository,
    couponRepository,
    refundRepository,
    webhookEventRepository,
    userRepository,
    emailService,
  }) {
    this.subscriptionRepository = subscriptionRepository;
    this.paymentRepository = paymentRepository;
    this.planRepository = planRepository;
    this.couponRepository = couponRepository;
    this.refundRepository = refundRepository;
    this.webhookEventRepository = webhookEventRepository;
    this.userRepository = userRepository;
    this.emailService = emailService;
  }

  // Idempotent entry point. Returns { duplicate } and never processes the same
  // Stripe event twice.
  async handleEvent(event) {
    return withTransaction(async (client) => {
      const record = await this.webhookEventRepository.tryInsert(
        { stripeEventId: event.id, eventType: event.type },
        client,
      );

      if (!record) {
        logger.info("Stripe webhook duplicate ignored", { eventId: event.id });
        return { duplicate: true };
      }

      await this.dispatch(event, client);
      await this.webhookEventRepository.markProcessed(record.id, client);

      return { duplicate: false };
    });
  }

  async dispatch(event, client) {
    switch (event.type) {
      case "checkout.session.completed":
        return this.handleCheckoutCompleted(event.data.object, client);
      case "charge.refunded":
        return this.handleChargeRefunded(event.data.object, client);
      case "refund.created":
      case "refund.updated":
        return this.handleRefundUpsert(event.data.object, client);
      case "payment_intent.payment_failed":
        logger.warn("Stripe payment failed", {
          paymentIntentId: event.data.object?.id,
          reason: event.data.object?.last_payment_error?.message,
        });
        return null;
      default:
        return null;
    }
  }

  async handleCheckoutCompleted(session, client) {
    const metadata = session.metadata || {};
    const userId = metadata.userId;
    const planId = metadata.planId;
    const paymentIntentId = session.payment_intent;

    // Only provision on a paid checkout.
    if (session.payment_status && session.payment_status !== "paid") {
      return null;
    }

    // Idempotency: ignore duplicate deliveries of the same checkout.
    if (paymentIntentId) {
      const existingPayment =
        await this.paymentRepository.findPaymentByIntentId(
          paymentIntentId,
          client,
        );
      if (existingPayment) return null;
    }

    const plan = await this.planRepository.findById(planId);
    if (!plan) throw new Error("Plan not found");

    const startDate = new Date();
    const endDate = new Date(startDate);
    endDate.setDate(endDate.getDate() + Number(plan.duration_days));

    const subtotal =
      metadata.subtotal != null ? Number(metadata.subtotal) : Number(plan.price);
    const discount = metadata.discount != null ? Number(metadata.discount) : 0;
    const amount =
      metadata.amount != null
        ? Number(metadata.amount)
        : roundMoney(subtotal - discount);
    const currency = plan.currency || "usd";

    const userSubscription =
      await this.subscriptionRepository.createUserSubscription(
        { userId, subscriptionPlanId: planId, endDate },
        client,
      );
    if (!userSubscription) {
      throw new Error("Failed to create user subscription");
    }

    let couponId = null;
    if (metadata.couponCode) {
      const coupon = await this.couponRepository.findByCode(
        metadata.couponCode,
      );
      if (coupon) couponId = coupon.id;
    }

    const payment = await this.paymentRepository.createPayment(
      {
        userSubscriptionId: userSubscription.id,
        subtotal,
        discountAmount: discount,
        amount,
        currency,
        couponId,
        paymentStatus: "COMPLETED",
        stripePaymentIntentId: paymentIntentId,
        paidAt: new Date(),
      },
      client,
    );

    if (couponId && discount > 0) {
      await this.couponRepository.createRedemption(
        {
          couponId,
          userId,
          paymentId: payment.id,
          discountAmount: discount,
        },
        client,
      );
      await this.couponRepository.incrementRedemptionCount(couponId, client);
    }

    logger.audit("payment.completed", {
      userId,
      planId,
      amount,
      discount,
      couponId,
    });

    const user = await this.userRepository.findById(userId);
    if (user?.email) {
      this.emailService
        .sendPaymentConfirmation(user.email, {
          planName: plan.name,
          amount,
          startDate,
          endDate,
        })
        .catch((error) =>
          logger.error("Failed to send payment email", {
            message: error.message,
          }),
        );
    }

    return userSubscription;
  }

  async handleChargeRefunded(charge, client) {
    const payment = await this.paymentRepository.findPaymentByIntentId(
      charge.payment_intent,
      client,
    );
    if (!payment) {
      logger.error("Refund for unknown payment", {
        paymentIntentId: charge.payment_intent,
      });
      return null;
    }
    return this.syncPaymentRefundStatus(payment, client);
  }

  async handleRefundUpsert(refund, client) {
    const payment = await this.paymentRepository.findPaymentByIntentId(
      refund.payment_intent,
      client,
    );
    if (!payment) {
      logger.error("Refund for unknown payment", {
        paymentIntentId: refund.payment_intent,
      });
      return null;
    }

    const status = REFUND_STATUS_MAP[refund.status] || "PENDING";
    const refundedAt =
      status === "SUCCEEDED" && refund.created
        ? new Date(refund.created * 1000)
        : null;

    await this.refundRepository.upsertByStripeRefundId(
      {
        paymentId: payment.id,
        amount: Number(refund.amount || 0) / 100,
        currency: refund.currency || payment.currency || "usd",
        status,
        stripeRefundId: refund.id,
        reason: refund.reason || null,
        refundedAt,
      },
      client,
    );

    return this.syncPaymentRefundStatus(payment, client);
  }

  async syncPaymentRefundStatus(payment, client) {
    const refunded = await this.refundRepository.sumByPayment(
      payment.id,
      client,
    );
    const total = Number(payment.amount);

    let status = payment.payment_status;
    if (total > 0 && refunded >= total) status = "REFUNDED";
    else if (refunded > 0) status = "PARTIALLY_REFUNDED";

    if (status !== payment.payment_status) {
      await this.paymentRepository.updatePaymentStatus(
        payment.id,
        status,
        null,
        client,
      );
    }

    return { paymentId: payment.id, refunded, status };
  }
}

export { StripeWebhookService };
export default new StripeWebhookService({
  subscriptionRepository,
  paymentRepository,
  planRepository,
  couponRepository,
  refundRepository,
  webhookEventRepository,
  userRepository,
  emailService,
});

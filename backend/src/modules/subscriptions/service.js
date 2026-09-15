import ApiError from "../../common/errors/ApiError.js";
import StatusCode from "../../common/constants/StatusCode.js";
import logger from "../../common/logger.js";
import emailService from "../../common/services/EmailService.js";
import stripe from "../../config/stripe.js";
import ENV from "../../config/Env.js";
import { withTransaction } from "../../config/database.js";
import User from "../users/repository.js";
import Subscription from "./repository.js";

// TODO(refactor): user cross-module call should go through the users service.

// --- Subscriptions (user-facing) ---

export async function getSubscription(subscriptionId) {
  const subscription = await Subscription.findById(subscriptionId);
  if (!subscription) {
    throw new ApiError(StatusCode.BAD_REQUEST, "Subscription not found");
  }
  return subscription;
}

export async function getUserActiveSubscriptions(userId) {
  return Subscription.getActivePaidSubscription(userId);
}

export async function createStripeSession({ subscriptionId, userId }) {
  const subscription = await Subscription.findById(subscriptionId);
  if (!subscription) {
    throw new ApiError(StatusCode.NOT_FOUND, "Subscription not found");
  }

  const activePlan = await Subscription.getActivePaidSubscription(userId);
  if (activePlan) {
    throw new ApiError(
      StatusCode.BAD_REQUEST,
      "You already have an active subscription",
    );
  }

  await Subscription.setUserSubscriptionStatusToExpired(userId);

  const session = await stripe.checkout.sessions.create({
    payment_method_types: ["card"],
    mode: "payment",
    line_items: [
      {
        price_data: {
          currency: "usd",
          product_data: { name: subscription.name },
          unit_amount: subscription.price * 100,
        },
        quantity: 1,
      },
    ],
    success_url: `${ENV.CLIENT_URL_1}/payment-success?session_id={CHECKOUT_SESSION_ID}&subscriptionId=${subscriptionId}`,
    cancel_url: `${ENV.CLIENT_URL_1}/payment-cancel?subscriptionId=${subscriptionId}`,
    metadata: { userId, subscriptionId },
  });

  return { session_url: session.url };
}

// --- Stripe webhook ---

export async function handleCheckoutCompleted(session) {
  const userId = session.metadata.userId;
  const subscriptionId = session.metadata.subscriptionId;
  const paymentIntentId = session.payment_intent;

  // Only provision on a paid checkout.
  if (session.payment_status && session.payment_status !== "paid") {
    return null;
  }

  // Idempotency: ignore duplicate deliveries of the same checkout.
  if (paymentIntentId) {
    const existingPayment =
      await Subscription.findPaymentByIntentId(paymentIntentId);
    if (existingPayment) return null;
  }

  const subscription = await Subscription.findById(subscriptionId);
  if (!subscription) throw new Error("Subscription not found");

  const startDate = new Date();
  const endDate = new Date(startDate);
  endDate.setDate(endDate.getDate() + Number(subscription.duration_days));

  const userSubscription = await withTransaction(async (client) => {
    const created = await Subscription.createUserSubscription(
      { userId, subscriptionPlanId: subscriptionId, endDate },
      client,
    );
    if (!created) throw new Error("Failed to create user subscription");

    await Subscription.createPayment(
      {
        userSubscriptionId: created.id,
        amount: subscription.price,
        stripePaymentIntentId: paymentIntentId,
      },
      client,
    );

    return created;
  });

  const user = await User.findById(userId);
  if (user?.email) {
    emailService
      .sendPaymentConfirmation(user.email, {
        planName: subscription.name,
        amount: subscription.price,
        startDate,
        endDate,
      })
      .catch((err) =>
        logger.error("Failed to send payment email", { message: err.message }),
      );
  }

  return userSubscription;
}

// --- Admin: plans ---

export async function getPlans() {
  return Subscription.findAllPlans();
}

export async function createPlan({ name, duration_days, price }) {
  if (!name || !duration_days || price === undefined) {
    throw new ApiError(
      StatusCode.BAD_REQUEST,
      "Name, duration_days, and price are required",
    );
  }
  return Subscription.createPlan({
    name,
    durationDays: duration_days,
    price,
  });
}

export async function updatePlan(planId, { name, duration_days, price }) {
  const existing = await Subscription.findById(planId);
  if (!existing) throw new ApiError(StatusCode.NOT_FOUND, "Plan not found");

  return Subscription.updatePlan(planId, {
    name: name || existing.name,
    durationDays: duration_days || existing.duration_days,
    price: price !== undefined ? price : existing.price,
  });
}

export async function deletePlan(planId) {
  const existing = await Subscription.findById(planId);
  if (!existing) throw new ApiError(StatusCode.NOT_FOUND, "Plan not found");

  await Subscription.deletePlan(planId);
}

// --- Admin: user subscriptions ---

export async function getUserSubscriptions() {
  return Subscription.findAllUserSubscriptions();
}

export async function createUserSubscription({
  user_id,
  plan_id,
  start_date,
  end_date,
  status,
}) {
  if (!user_id || !plan_id) {
    throw new ApiError(
      StatusCode.BAD_REQUEST,
      "user_id and plan_id are required",
    );
  }
  return Subscription.AdminCreateUserSubscription({
    userId: user_id,
    planId: plan_id,
    startDate: start_date || new Date().toISOString(),
    endDate: end_date,
    status,
  });
}

export async function updateUserSubscription(subscriptionId, body) {
  const existing = await Subscription.findUserSubscriptionById(subscriptionId);
  if (!existing) {
    throw new ApiError(StatusCode.NOT_FOUND, "User subscription not found");
  }

  return Subscription.updateUserSubscription(subscriptionId, {
    userId: body.user_id || existing.user_id,
    planId: body.plan_id || existing.plan_id,
    startDate: body.start_date || existing.start_date,
    endDate: body.end_date || existing.end_date,
    status: body.status || existing.status,
  });
}

export async function deleteUserSubscription(subscriptionId) {
  await Subscription.deleteUserSubscription(subscriptionId);
}

// --- Admin: payments ---

export async function getPayments() {
  return Subscription.findAllPayments();
}

export async function createPayment({
  user_subscription_id,
  amount,
  payment_status,
  stripe_payment_intent_id,
}) {
  if (!user_subscription_id || amount === undefined) {
    throw new ApiError(
      StatusCode.BAD_REQUEST,
      "user_subscription_id and amount are required",
    );
  }
  return Subscription.AdminCreatePayment({
    userSubscriptionId: user_subscription_id,
    amount,
    paymentStatus: payment_status,
    stripePaymentIntentId: stripe_payment_intent_id,
  });
}

export async function updatePayment(paymentId, body) {
  const existing = await Subscription.findPaymentById(paymentId);
  if (!existing) throw new ApiError(StatusCode.NOT_FOUND, "Payment not found");

  return Subscription.updatePayment(paymentId, {
    amount: body.amount !== undefined ? body.amount : existing.amount,
    paymentStatus: body.payment_status || existing.payment_status,
    stripePaymentIntentId:
      body.stripe_payment_intent_id !== undefined
        ? body.stripe_payment_intent_id
        : existing.stripe_payment_intent_id,
  });
}

export async function deletePayment(paymentId) {
  await Subscription.deletePayment(paymentId);
}

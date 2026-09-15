import logger from "../../common/logger.js";
import emailService from "../../common/services/email-service.js";
import { withTransaction } from "../../config/database.js";
import userRepository from "../users/repository.js";
import subscriptionRepository from "./subscription.repository.js";

class StripeWebhookService {
  constructor({ subscriptionRepository, userRepository, emailService }) {
    this.subscriptionRepository = subscriptionRepository;
    this.userRepository = userRepository;
    this.emailService = emailService;
  }

  async handleCheckoutCompleted(session) {
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
        await this.subscriptionRepository.findPaymentByIntentId(paymentIntentId);
      if (existingPayment) return null;
    }

    const subscription =
      await this.subscriptionRepository.findById(subscriptionId);
    if (!subscription) throw new Error("Subscription not found");

    const startDate = new Date();
    const endDate = new Date(startDate);
    endDate.setDate(endDate.getDate() + Number(subscription.duration_days));

    const userSubscription = await withTransaction(async (client) => {
      const createdSubscription =
        await this.subscriptionRepository.createUserSubscription(
          { userId, subscriptionPlanId: subscriptionId, endDate },
          client,
        );
      if (!createdSubscription) {
        throw new Error("Failed to create user subscription");
      }

      await this.subscriptionRepository.createPayment(
        {
          userSubscriptionId: createdSubscription.id,
          amount: subscription.price,
          stripePaymentIntentId: paymentIntentId,
        },
        client,
      );

      return createdSubscription;
    });

    const user = await this.userRepository.findById(userId);
    if (user?.email) {
      this.emailService
        .sendPaymentConfirmation(user.email, {
          planName: subscription.name,
          amount: subscription.price,
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
}

export { StripeWebhookService };
export default new StripeWebhookService({
  subscriptionRepository,
  userRepository,
  emailService,
});

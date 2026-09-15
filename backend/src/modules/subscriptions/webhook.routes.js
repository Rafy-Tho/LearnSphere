import express from "express";
import stripe from "../../config/stripe.js";
import ENV from "../../config/Env.js";
import logger from "../../common/logger.js";
import * as subscriptionsService from "./service.js";

const webhookRoute = express.Router();

// IMPORTANT: raw body required, so this router is mounted before express.json()
webhookRoute.post(
  "/",
  express.raw({ type: "application/json" }),
  async (req, res) => {
    const sig = req.headers["stripe-signature"];

    let event;
    try {
      event = stripe.webhooks.constructEvent(
        req.body,
        sig,
        ENV.STRIPE_WEBHOOK_SECRET,
      );
    } catch (err) {
      return res.status(400).send(`Webhook Error: ${err.message}`);
    }

    try {
      if (event.type === "checkout.session.completed") {
        await subscriptionsService.handleCheckoutCompleted(event.data.object);
      }
      return res.status(200).json({ received: true });
    } catch (err) {
      logger.error("Webhook processing error", { message: err.message });
      // Tell Stripe to retry
      return res.status(500).send("Webhook failed");
    }
  },
);

export default webhookRoute;

import express from "express";
import requireAuth from "../../common/middleware/requireAuth.js";
import * as controller from "./controller.js";

const subscriptionsRoute = express.Router();

subscriptionsRoute.get(
  "/user-active",
  requireAuth,
  controller.getUserActiveSubscriptions,
);
subscriptionsRoute.route("/:id").get(controller.getSubscription);

export default subscriptionsRoute;

import express from "express";
import requireAuth from "../../common/middleware/requireAuth.js";
import * as controller from "./controller.js";

const meSubscriptionRoute = express.Router();

meSubscriptionRoute.get("/", requireAuth, controller.getUserActiveSubscriptions);

export default meSubscriptionRoute;

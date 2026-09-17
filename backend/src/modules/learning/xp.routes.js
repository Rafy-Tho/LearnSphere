import express from "express";
import requireAuth from "../../common/middleware/require-auth.js";
import xpController from "./xp.controller.js";

// Mounted at /api/v1/users/me/xp
const meXpRoute = express.Router();

meXpRoute.get("/", requireAuth, xpController.getSummary);
meXpRoute.get("/transactions", requireAuth, xpController.getTransactions);

export default meXpRoute;

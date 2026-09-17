import express from "express";
import requireAuth from "../../common/middleware/require-auth.js";
import activityController from "./activity.controller.js";

// Mounted at /api/v1/users/me/activities
const meActivitiesRoute = express.Router();

meActivitiesRoute.get("/", requireAuth, activityController.getMyActivities);

export default meActivitiesRoute;

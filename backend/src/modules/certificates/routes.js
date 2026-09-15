import express from "express";
import requireAuth from "../../common/middleware/requireAuth.js";
import * as controller from "./controller.js";

const certificateRoute = express.Router({ mergeParams: true });

certificateRoute.get("/check", requireAuth, controller.checkCertificateEligibility);
certificateRoute
  .route("/")
  .post(requireAuth, controller.claimCertificate)
  .get(requireAuth, controller.getCertificate);

export default certificateRoute;

export const standaloneCertificateRoute = express.Router();
standaloneCertificateRoute.get("/mine", requireAuth, controller.getMyCertificates);
standaloneCertificateRoute.get("/:id", controller.getCertificateById);

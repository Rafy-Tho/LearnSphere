import express from "express";
import requireAuth from "../../common/middleware/requireAuth.js";
import { validateResult } from "../../common/middleware/validateResult.js";
import * as controller from "./controller.js";
import {
  certificateIdParamValidator,
  courseIdParamValidator,
} from "./validation.js";

// Mounted at /api/v1/courses/:courseId/certificates
export const courseCertificateRoute = express.Router({ mergeParams: true });

courseCertificateRoute.get(
  "/check",
  requireAuth,
  controller.checkCertificateEligibility,
);
courseCertificateRoute
  .route("/")
  .post(
    requireAuth,
    courseIdParamValidator,
    validateResult,
    controller.claimCertificate,
  )
  .get(requireAuth, controller.getCertificate);

// Mounted at /api/v1/certificates
export const certificateItemRoute = express.Router();

certificateItemRoute.get(
  "/:certificateId",
  certificateIdParamValidator,
  validateResult,
  controller.getCertificateById,
);

// Mounted at /api/v1/users/me/certificates
export const meCertificatesRoute = express.Router();

meCertificatesRoute.get("/", requireAuth, controller.getMyCertificates);

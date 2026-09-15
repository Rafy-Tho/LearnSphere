import express from "express";
import requireAuth from "../../common/middleware/require-auth.js";
import { validateResult } from "../../common/middleware/validate-result.js";
import certificateController from "./controller.js";
import {
  certificateIdParamValidator,
  courseIdParamValidator,
} from "./validation.js";

// Mounted at /api/v1/courses/:courseId/certificates
export const courseCertificateRoute = express.Router({ mergeParams: true });

courseCertificateRoute.get(
  "/check",
  requireAuth,
  certificateController.checkCertificateEligibility,
);
courseCertificateRoute
  .route("/")
  .post(
    requireAuth,
    courseIdParamValidator,
    validateResult,
    certificateController.claimCertificate,
  )
  .get(requireAuth, certificateController.getCertificate);

// Mounted at /api/v1/certificates
export const certificateItemRoute = express.Router();

certificateItemRoute.get(
  "/:certificateId",
  requireAuth,
  certificateIdParamValidator,
  validateResult,
  certificateController.getCertificateById,
);

// Mounted at /api/v1/users/me/certificates
export const meCertificatesRoute = express.Router();

meCertificatesRoute.get(
  "/",
  requireAuth,
  certificateController.getMyCertificates,
);

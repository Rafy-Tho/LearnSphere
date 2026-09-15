import StatusCode from "../../common/constants/StatusCode.js";
import asyncHandler from "../../common/http/asyncHandler.js";
import { sendSuccess } from "../../common/http/response.js";
import * as certificatesService from "./service.js";

export const claimCertificate = asyncHandler(async (req, res) => {
  const { alreadyClaimed, certificate } =
    await certificatesService.claimCertificate({
      courseId: req.params.courseId,
      userId: req.session.user.id,
    });

  return sendSuccess(res, certificate, {
    statusCode: alreadyClaimed ? StatusCode.OK : StatusCode.CREATED,
    message: alreadyClaimed
      ? "Certificate already claimed"
      : "Certificate claimed successfully",
  });
});

export const getCertificate = asyncHandler(async (req, res) => {
  const certificate = await certificatesService.getCertificate({
    courseId: req.params.courseId,
    userId: req.session.user.id,
  });

  return sendSuccess(res, certificate || null, {
    message: "Certificate retrieved successfully",
  });
});

export const getMyCertificates = asyncHandler(async (req, res) => {
  const { data, pagination } = await certificatesService.getMyCertificates(
    req.session.user.id,
    req.query,
  );

  return sendSuccess(res, data, {
    message: "Certificates retrieved successfully",
    pagination,
  });
});

export const getCertificateById = asyncHandler(async (req, res) => {
  const certificate = await certificatesService.getCertificateById(
    req.params.certificateId,
  );

  return sendSuccess(res, certificate, {
    message: "Certificate retrieved successfully",
  });
});

export const checkCertificateEligibility = asyncHandler(async (req, res) => {
  const data = await certificatesService.checkEligibility({
    courseId: req.params.courseId,
    userId: req.session.user.id,
  });

  return sendSuccess(res, data, { message: "Eligibility check completed" });
});

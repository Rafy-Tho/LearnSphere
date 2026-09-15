import StatusCode from "../../common/constants/status-code.js";
import asyncHandler from "../../common/http/async-handler.js";
import { sendSuccess } from "../../common/http/response.js";
import certificateService from "./service.js";

class CertificateController {
  constructor({ certificateService }) {
    this.certificateService = certificateService;
  }

  claimCertificate = asyncHandler(async (req, res) => {
    const { isAlreadyClaimed, certificate } =
      await this.certificateService.claimCertificate({
        courseId: req.params.courseId,
        userId: req.session.user.id,
      });

    return sendSuccess(res, certificate, {
      statusCode: isAlreadyClaimed ? StatusCode.OK : StatusCode.CREATED,
      message: isAlreadyClaimed
        ? "Certificate already claimed"
        : "Certificate claimed successfully",
    });
  });

  getCertificate = asyncHandler(async (req, res) => {
    const certificate = await this.certificateService.getCertificate({
      courseId: req.params.courseId,
      userId: req.session.user.id,
    });

    return sendSuccess(res, certificate || null, {
      message: "Certificate retrieved successfully",
    });
  });

  getMyCertificates = asyncHandler(async (req, res) => {
    const { certificates, pagination } =
      await this.certificateService.getMyCertificates(
        req.session.user.id,
        req.query,
      );

    return sendSuccess(res, certificates, {
      message: "Certificates retrieved successfully",
      pagination,
    });
  });

  getCertificateById = asyncHandler(async (req, res) => {
    const certificate = await this.certificateService.getCertificateById(
      req.params.certificateId,
    );

    return sendSuccess(res, certificate, {
      message: "Certificate retrieved successfully",
    });
  });

  checkCertificateEligibility = asyncHandler(async (req, res) => {
    const eligibility = await this.certificateService.checkCertificateEligibility(
      {
        courseId: req.params.courseId,
        userId: req.session.user.id,
      },
    );

    return sendSuccess(res, eligibility, {
      message: "Eligibility check completed",
    });
  });
}

export { CertificateController };
export default new CertificateController({ certificateService });

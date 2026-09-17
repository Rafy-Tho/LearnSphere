import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import assertOwnership from "../../common/auth/ownership.js";
import {
  buildPagination,
  parsePagination,
} from "../../common/query/pagination.js";
import environment from "../../config/environment.js";
import { withTransaction } from "../../config/database.js";
import courseRepository from "../courses/repository.js";
import enrollmentRepository from "../learning/enrollment.repository.js";
import activityService, {
  ACTIVITY_TYPE,
} from "../learning/activity.service.js";
import certificateRepository from "./repository.js";

const CERTIFICATE_ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

function generateCertificateNumber() {
  let certificateNumber = "CERT-";
  for (let index = 0; index < 10; index++) {
    certificateNumber += CERTIFICATE_ALPHABET.charAt(
      Math.floor(Math.random() * CERTIFICATE_ALPHABET.length),
    );
  }
  return certificateNumber;
}

class CertificateService {
  constructor({
    certificateRepository,
    courseRepository,
    enrollmentRepository,
    activityService,
  }) {
    this.certificateRepository = certificateRepository;
    this.courseRepository = courseRepository;
    this.enrollmentRepository = enrollmentRepository;
    this.activityService = activityService;
  }

  async claimCertificate({ courseId, userId }) {
    const course = await this.courseRepository.findById(courseId);
    if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

    const enrollment = await this.enrollmentRepository.findOne({
      courseId,
      userId,
    });
    if (!enrollment) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "You are not enrolled in this course",
      );
    }

    const existingCertificate =
      await this.certificateRepository.findByUserAndCourse({ userId, courseId });
    if (existingCertificate) {
      return { isAlreadyClaimed: true, certificate: existingCertificate };
    }

    const { isComplete } = await this.certificateRepository.checkCourseCompletion(
      { userId, courseId },
    );
    if (!isComplete) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "You have not completed all lessons in this course",
      );
    }

    const certificateNumber = generateCertificateNumber();

    const certificate = await withTransaction(async (client) => {
      const created = await this.certificateRepository.create(
        {
          userId,
          courseId,
          certificateNumber,
          certificateUrl: `${environment.CLIENT_URL_1}/certificates/{id}`,
        },
        client,
      );

      await this.activityService.record(
        {
          userId,
          type: ACTIVITY_TYPE.EARN_CERTIFICATE,
          courseId,
          metadata: { certificateNumber: created.certificate_number },
          once: true,
        },
        client,
      );

      return created;
    });

    certificate.certificate_url = `${environment.CLIENT_URL_1}/certificates/${certificate.id}`;
    certificate.course_name = course.name;

    return { isAlreadyClaimed: false, certificate };
  }

  async getCertificate({ courseId, userId }) {
    return this.certificateRepository.findByUserAndCourse({ userId, courseId });
  }

  async getMyCertificates(userId, query = {}) {
    const { page, limit, offset } = parsePagination(query, {
      defaultLimit: 50,
    });

    const [certificates, total] = await Promise.all([
      this.certificateRepository.findByUser(userId, { limit, offset }),
      this.certificateRepository.countByUser(userId),
    ]);

    return {
      certificates,
      pagination: buildPagination({ total, page, limit }),
    };
  }

  async getCertificateById(certificateId, user) {
    const certificate = await this.certificateRepository.findById(certificateId);
    if (!certificate) {
      throw new ApiError(StatusCode.NOT_FOUND, "Certificate not found");
    }

    assertOwnership({
      ownerId: certificate.user_id,
      user,
      message: "You are not authorized to view this certificate",
    });

    return certificate;
  }

  async checkCertificateEligibility({ courseId, userId }) {
    const course = await this.courseRepository.findById(courseId);
    if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

    const existingCertificate =
      await this.certificateRepository.findByUserAndCourse({ userId, courseId });
    const { isComplete, total, completed } =
      await this.certificateRepository.checkCourseCompletion({
        userId,
        courseId,
      });

    return {
      isComplete,
      totalLessons: Number(total),
      completedLessons: Number(completed),
      hasCertificate: !!existingCertificate,
      certificate: existingCertificate || null,
    };
  }
}

export { CertificateService };
export default new CertificateService({
  certificateRepository,
  courseRepository,
  enrollmentRepository,
  activityService,
});

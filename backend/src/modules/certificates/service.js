import ApiError from "../../common/errors/ApiError.js";
import StatusCode from "../../common/constants/StatusCode.js";
import ENV from "../../config/Env.js";
import Course from "../courses/repository.js";
import Enrollment from "../learning/repository.js";
import Certificate from "./repository.js";

// TODO(refactor): course/enrollment cross-module calls should go through their services.

function generateCertificateNumber() {
  const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
  let result = "CERT-";
  for (let i = 0; i < 10; i++) {
    result += chars.charAt(Math.floor(Math.random() * chars.length));
  }
  return result;
}

export async function claimCertificate({ courseId, userId }) {
  const course = await Course.findById(courseId);
  if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

  const enrollment = await Enrollment.findOne({ courseId, userId });
  if (!enrollment) {
    throw new ApiError(
      StatusCode.BAD_REQUEST,
      "You are not enrolled in this course",
    );
  }

  const existing = await Certificate.findByUserAndCourse({ userId, courseId });
  if (existing) {
    return { alreadyClaimed: true, certificate: existing };
  }

  const { isComplete } = await Certificate.checkCourseCompletion({
    userId,
    courseId,
  });
  if (!isComplete) {
    throw new ApiError(
      StatusCode.BAD_REQUEST,
      "You have not completed all lessons in this course",
    );
  }

  const certificateNumber = generateCertificateNumber();

  const certificate = await Certificate.create({
    userId,
    courseId,
    certificateNumber,
    certificateUrl: `${ENV.CLIENT_URL_1}/certificates/{id}`,
  });

  certificate.certificate_url = `${ENV.CLIENT_URL_1}/certificates/${certificate.id}`;
  certificate.course_name = course.name;

  return { alreadyClaimed: false, certificate };
}

export async function getCertificate({ courseId, userId }) {
  return Certificate.findByUserAndCourse({ userId, courseId });
}

export async function getMyCertificates(userId) {
  return Certificate.findByUser(userId);
}

export async function getCertificateById(certificateId) {
  const certificate = await Certificate.findById(certificateId);
  if (!certificate) {
    throw new ApiError(StatusCode.NOT_FOUND, "Certificate not found");
  }
  return certificate;
}

export async function checkEligibility({ courseId, userId }) {
  const course = await Course.findById(courseId);
  if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

  const existing = await Certificate.findByUserAndCourse({ userId, courseId });
  const { isComplete, total, completed } =
    await Certificate.checkCourseCompletion({ userId, courseId });

  return {
    isComplete,
    totalLessons: Number(total),
    completedLessons: Number(completed),
    hasCertificate: !!existing,
    certificate: existing || null,
  };
}

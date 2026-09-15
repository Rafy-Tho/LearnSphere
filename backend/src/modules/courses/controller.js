import StatusCode from "../../common/constants/StatusCode.js";
import asyncHandler from "../../common/http/asyncHandler.js";
import { sendSuccess } from "../../common/http/response.js";
import * as coursesService from "./service.js";

// --- Courses ---

export const createCourse = asyncHandler(async (req, res) => {
  const course = await coursesService.createCourse({
    instructorId: req.session.user.id,
    data: req.body,
  });

  return sendSuccess(res, course, {
    statusCode: StatusCode.CREATED,
    message: "Course created successfully",
  });
});

export const getAllCourses = asyncHandler(async (req, res) => {
  const { data, pagination } = await coursesService.listCourses(req.query);

  return sendSuccess(res, data, {
    message: "Courses retrieved successfully",
    pagination,
  });
});

export const updateCourse = asyncHandler(async (req, res) => {
  const course = await coursesService.updateCourse(
    req.params.id,
    req.body,
    req.session.user,
  );

  return sendSuccess(res, course, { message: "Course updated successfully" });
});

export const deleteCourse = asyncHandler(async (req, res) => {
  const course = await coursesService.deleteCourse(
    req.params.id,
    req.session.user,
  );

  return sendSuccess(res, course, { message: "Course deleted successfully" });
});

export const getCourseDetails = asyncHandler(async (req, res) => {
  const course = await coursesService.getCourseDetails(req.params.id);

  return sendSuccess(res, course, { message: "Course retrieved successfully" });
});

export const getCourseLearningData = asyncHandler(async (req, res) => {
  const data = await coursesService.getLearningData(
    req.params.id,
    req.session?.user?.id,
  );

  return sendSuccess(res, data, {
    message: "Module details retrieved successfully",
  });
});

export const getRecentlyViewedCourses = asyncHandler(async (req, res) => {
  const data = await coursesService.getRecentlyViewed(req.session.user.id);

  return sendSuccess(res, data, {
    message: "Recently viewed retrieved successfully",
  });
});

export const getRecommendedCourses = asyncHandler(async (req, res) => {
  const data = await coursesService.getRecommended(req.session.user.id);

  return sendSuccess(res, data, {
    message: "Recommended courses retrieved successfully",
  });
});

export const getPopularCourses = asyncHandler(async (req, res) => {
  const data = await coursesService.getPopular();

  return sendSuccess(res, data, {
    message: "Popular courses retrieved successfully",
  });
});

export const getCourseInprogress = asyncHandler(async (req, res) => {
  const data = await coursesService.getInProgress(
    req.session.user.id,
    req.query,
  );

  return sendSuccess(res, data, { message: "Courses retrieved successfully" });
});

export const getCourseCompleted = asyncHandler(async (req, res) => {
  const data = await coursesService.getCompleted(req.session.user.id, req.query);

  return sendSuccess(res, data, { message: "Courses retrieved successfully" });
});

export const getCoursesDashboard = asyncHandler(async (req, res) => {
  const { data, pagination } = await coursesService.getDashboard(req.query);

  return sendSuccess(res, data, {
    message: "Courses retrieved successfully",
    pagination,
  });
});

export const getCourseDetailsDashboard = asyncHandler(async (req, res) => {
  const data = await coursesService.getDashboardDetails(req.params.id);

  return sendSuccess(res, data, {
    message: "Course details retrieved successfully",
  });
});

// --- Course objectives ---

export const getCourseObjectives = asyncHandler(async (req, res) => {
  const data = await coursesService.getCourseObjectives(req.params.id);

  return sendSuccess(res, data, {
    message: "Course objectives retrieved successfully",
  });
});

export const createCourseObjective = asyncHandler(async (req, res) => {
  const objective = await coursesService.createCourseObjective({
    courseId: req.params.id,
    data: req.body,
    user: req.session.user,
  });

  return sendSuccess(res, objective, {
    statusCode: StatusCode.CREATED,
    message: "Course objective created successfully",
  });
});

export const updateCourseObjective = asyncHandler(async (req, res) => {
  const objective = await coursesService.updateCourseObjective(
    req.params.id,
    req.body,
    req.session.user,
  );

  return sendSuccess(res, objective, {
    message: "Course objective updated successfully",
  });
});

export const deleteCourseObjective = asyncHandler(async (req, res) => {
  const objective = await coursesService.deleteCourseObjective(
    req.params.id,
    req.session.user,
  );

  return sendSuccess(res, objective, {
    message: "Course objective delete successfully",
  });
});

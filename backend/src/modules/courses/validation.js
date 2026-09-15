import { checkSchema } from "express-validator";
import {
  ACCESS_COURSE_TYPE,
  CONTENT_STATUS,
  COURSE_LEVEL,
} from "../../common/constants/constants.js";
import {
  enumValidator,
  numberValidator,
  textValidator,
  uuidParamValidator,
  uuidValidator,
} from "../../common/validation.js";

export const courseValidator = checkSchema({
  categoryId: uuidValidator("Category ID"),
  name: textValidator("Course Name"),
  slug: textValidator("Course Slug"),
  description: textValidator("Course Description", false, 500),
  status: enumValidator("Course Status", CONTENT_STATUS),
  position: numberValidator("Course Position"),
  level: enumValidator("Course Level", COURSE_LEVEL),
  accessType: enumValidator("Course Access Type", ACCESS_COURSE_TYPE),
});

export const courseObjectiveValidator = checkSchema({
  position: numberValidator("Course Objective Position"),
  content: textValidator("Course Objective", false, 500),
});

export const courseIdParamValidator = checkSchema({
  courseId: uuidParamValidator("Course ID"),
});

export const courseObjectiveIdParamValidator = checkSchema({
  objectiveId: uuidParamValidator("Course Objective ID"),
});

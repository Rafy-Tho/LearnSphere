import { checkSchema } from "express-validator";
import { uuidParamValidator } from "../../common/validation.js";

export const courseIdParamValidator = checkSchema({
  courseId: uuidParamValidator("Course ID"),
});

export const certificateIdParamValidator = checkSchema({
  certificateId: uuidParamValidator("Certificate ID"),
});

import { checkSchema } from "express-validator";
import { uuidValidator, uuidParamValidator } from "../../common/validation.js";

export const learningProgressValidator = checkSchema({
  lessonId: uuidValidator("Lesson ID"),
});

export const courseIdParamValidator = checkSchema({
  courseId: uuidParamValidator("Course ID"),
});

export const lessonIdParamValidator = checkSchema({
  lessonId: uuidParamValidator("Lesson ID"),
});

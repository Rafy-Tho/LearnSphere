import { checkSchema } from "express-validator";
import { uuidValidator, uuidParamValidator } from "../../common/validation.js";

export const learningProgressValidator = checkSchema({
  lessonId: uuidValidator("Lesson ID"),
});

export const courseIdParamValidator = checkSchema({
  id: uuidParamValidator("Course ID"),
});

export const lessonIdParamValidator = checkSchema({
  id: uuidParamValidator("Lesson ID"),
});

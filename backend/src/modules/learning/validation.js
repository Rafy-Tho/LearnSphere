import { checkSchema } from "express-validator";
import { uuidValidator } from "../../common/validation.js";

export const learningProgressValidator = checkSchema({
  lessonId: uuidValidator("Lesson ID"),
});

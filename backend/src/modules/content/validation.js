import { checkSchema } from "express-validator";
import {
  booleanValidator,
  enumValidator,
  htmlValidator,
  numberValidator,
  textValidator,
  uuidParamValidator,
} from "../../common/validation.js";
import {
  ACCESS_COURSE_TYPE,
  CONTENT_STATUS,
  LESSON_TYPE,
} from "../../common/constants/constants.js";

export const moduleValidators = checkSchema({
  name: textValidator("Module name"),
  description: textValidator("Module description", true),
  position: numberValidator("Module position"),
  status: enumValidator("Module status", CONTENT_STATUS),
});

export const chapterValidators = checkSchema({
  name: textValidator("Chapter name"),
  description: textValidator("Chapter description", true),
  position: numberValidator("Chapter position"),
  status: enumValidator("Chapter status", CONTENT_STATUS, true),
});

export const lessonValidator = checkSchema({
  name: textValidator("Name"),
  status: enumValidator("Status", CONTENT_STATUS),
  description: textValidator("Description", true, 500),
  type: enumValidator("Type", LESSON_TYPE),
  xpPoints: numberValidator("Xp point"),
  position: numberValidator("Position"),
  accessType: enumValidator("Access type", ACCESS_COURSE_TYPE),
  durationMinutes: numberValidator("Durations"),
});

export const lessonContentValidator = checkSchema({
  name: textValidator("Name"),
  position: numberValidator("Position"),
  content: htmlValidator("Content"),
});

export const questionValidator = checkSchema({
  question: textValidator("Question", false, 500),
  explanation: textValidator("Explanation", false, 500),
  position: numberValidator("Position", false),
});

export const optionValidator = checkSchema({
  text: textValidator("Answer", false, 500),
  isCorrect: booleanValidator("Is Correct"),
  position: numberValidator("Position", false),
});

export const moduleIdParamValidator = checkSchema({
  moduleId: uuidParamValidator("Module ID"),
});

export const chapterIdParamValidator = checkSchema({
  chapterId: uuidParamValidator("Chapter ID"),
});

export const lessonIdParamValidator = checkSchema({
  lessonId: uuidParamValidator("Lesson ID"),
});

export const lessonContentIdParamValidator = checkSchema({
  contentId: uuidParamValidator("Lesson content ID"),
});

export const questionIdParamValidator = checkSchema({
  questionId: uuidParamValidator("Question ID"),
});

export const optionIdParamValidator = checkSchema({
  optionId: uuidParamValidator("Option ID"),
});

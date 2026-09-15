import { checkSchema } from "express-validator";
import { textValidator, uuidParamValidator } from "../../common/validation.js";

export const categoryValidator = checkSchema({
  name: textValidator("Category name"),
  slug: textValidator("Category slug"),
  description: textValidator("Category description", true, 500),
});

export const categoryIdParamValidator = checkSchema({
  categoryId: uuidParamValidator("Category ID"),
});

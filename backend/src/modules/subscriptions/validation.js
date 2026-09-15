import { checkSchema } from "express-validator";
import { uuidParamValidator } from "../../common/validation.js";

export const planIdParamValidator = checkSchema({
  planId: uuidParamValidator("Plan ID"),
});

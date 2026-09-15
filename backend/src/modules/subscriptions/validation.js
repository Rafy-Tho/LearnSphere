import { checkSchema } from "express-validator";
import { uuidParamValidator } from "../../common/validation.js";

export const subscriptionIdParamValidator = checkSchema({
  subscriptionId: uuidParamValidator("Subscription ID"),
});

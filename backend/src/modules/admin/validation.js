import { checkSchema } from "express-validator";
import {
  emailValidator,
  EnumValidator,
  textValidator,
  uuidParamValidator,
} from "../../common/validation.js";

const ROLES = ["LEARNER", "INSTRUCTOR", "ADMIN"];
const STATUSES = ["ACTIVE", "INACTIVE", "SUSPENDED"];

export const createUserValidator = checkSchema({
  name: textValidator("Name"),
  email: emailValidator("Email"),
  role: EnumValidator("Role", ROLES, true),
  status: EnumValidator("Status", STATUSES, true),
});

export const updateUserValidator = checkSchema({
  name: textValidator("Name", true),
  email: emailValidator("Email", true),
  role: EnumValidator("Role", ROLES, true),
  status: EnumValidator("Status", STATUSES, true),
});

export const userIdParamValidator = checkSchema({
  userId: uuidParamValidator("User ID"),
});

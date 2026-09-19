import { checkSchema } from "express-validator";
import {
  emailValidator,
  enumValidator,
  passwordValidator,
  textValidator,
  uuidParamValidator,
} from "../../common/validation.js";

const ROLES = ["LEARNER", "INSTRUCTOR", "ADMIN"];
const STATUSES = ["ACTIVE", "INACTIVE", "SUSPENDED"];

export const createUserValidator = checkSchema({
  name: textValidator("Name"),
  email: emailValidator("Email"),
  role: enumValidator("Role", ROLES, true),
  status: enumValidator("Status", STATUSES, true),
  password: passwordValidator("Password", true),
});

export const adminSetPasswordValidator = checkSchema({
  newPassword: passwordValidator("New Password"),
});

export const updateUserValidator = checkSchema({
  name: textValidator("Name", true),
  email: emailValidator("Email", true),
  role: enumValidator("Role", ROLES, true),
  status: enumValidator("Status", STATUSES, true),
});

export const userIdParamValidator = checkSchema({
  userId: uuidParamValidator("User ID"),
});

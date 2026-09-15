import { checkSchema } from "express-validator";
import {
  codeValidator,
  emailValidator,
  passwordValidator,
  textValidator,
} from "../../common/validation.js";

export const validateRegister = checkSchema({
  name: textValidator("Name"),
  email: emailValidator("Email"),
  password: passwordValidator("Password"),
});

export const validateLogin = checkSchema({
  email: emailValidator("Email"),
  password: passwordValidator("Password"),
});

export const validateUpdatePassword = checkSchema({
  oldPassword: passwordValidator("Old Password"),
  newPassword: passwordValidator("New Password"),
});

export const validateResetPassword = checkSchema({
  code: codeValidator("Reset Code"),
  email: emailValidator("Email"),
  password: passwordValidator("Password"),
});

export const validateEmailResetCode = checkSchema({
  email: emailValidator("Email"),
});

export const validateSendResetPasswordCode = checkSchema({
  email: emailValidator("Email"),
  code: codeValidator("Reset Code"),
});

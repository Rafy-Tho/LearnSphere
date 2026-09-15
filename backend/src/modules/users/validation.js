import { checkSchema } from "express-validator";
import {
  dateValidator,
  emailValidator,
  enumValidator,
  numberValidator,
  textValidator,
} from "../../common/validation.js";

export const validateUpdateProfile = checkSchema({
  name: textValidator("Name", true),
  email: emailValidator("Email", true),
  bio: textValidator("Bio", true, 200),
  location: textValidator("Location", true, 200),
  dateBirth: dateValidator("Date of birth", true),
  phone: numberValidator("Phone", true),
  gender: enumValidator("Gender", ["Male", "Female"], true),
});

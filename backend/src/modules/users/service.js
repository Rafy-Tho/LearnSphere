import { v2 as cloudinary } from "cloudinary";
import fs from "fs";
import ApiError from "../../common/errors/ApiError.js";
import StatusCode from "../../common/constants/StatusCode.js";
import logger from "../../common/logger.js";
import Course from "../../modules/courses/repository.js";
import User from "./repository.js";

// TODO(refactor): CourseRepository moves to modules/learning; call its service then.

export async function getProfile(userId) {
  const user = await User.profile(userId);
  if (!user) throw new ApiError(StatusCode.NOT_FOUND, "User not found");
  return user;
}

export async function getMe(userId) {
  const user = userId ? await User.findById(userId) : null;
  if (user) delete user.password;
  return user;
}

export async function updateProfile({ userId, data, imageFile }) {
  const user = await User.findById(userId);
  if (!user) throw new ApiError(StatusCode.NOT_FOUND, "User not found");

  let imageUrl = user.image_url;
  if (imageFile) {
    const uploaded = await cloudinary.uploader.upload(imageFile.path, {
      resource_type: "image",
      folder: "image",
    });

    imageUrl = uploaded.secure_url;
    fs.unlink(imageFile.path, (err) => {
      if (err) {
        logger.error("Failed to delete local file", { message: err.message });
      }
    });
  }

  const updatedUser = await User.update({
    userId,
    name: data.name || user.name,
    email: data.email || user.email,
    imageUrl,
  });

  const userProfile = await User.profile(userId);
  const updatedProfile = await User.updateProfile({
    userId,
    bio: data.bio || userProfile.bio,
    location: data.location || userProfile.location,
    phone: data.phone || userProfile.phone,
    dateBirth: data.dateBirth || userProfile.dateBirth,
    gender: data.gender || userProfile.gender,
  });

  return { ...updatedUser, ...updatedProfile };
}

export async function getXpEarning(userId) {
  const user = await User.findById(userId);
  if (!user) throw new ApiError(StatusCode.NOT_FOUND, "User Doesn't Exist");

  return Course.getXpEarning(userId);
}

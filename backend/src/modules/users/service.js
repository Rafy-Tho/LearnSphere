import { v2 as cloudinary } from "cloudinary";
import fs from "fs";
import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import logger from "../../common/logger.js";
import courseRepository from "../courses/repository.js";
import userRepository from "./repository.js";

class UserService {
  constructor({ userRepository, courseRepository }) {
    this.userRepository = userRepository;
    this.courseRepository = courseRepository;
  }

  async getProfile(userId) {
    const user = await this.userRepository.profile(userId);
    if (!user) throw new ApiError(StatusCode.NOT_FOUND, "User not found");
    return user;
  }

  async getMe(userId) {
    const user = userId ? await this.userRepository.findById(userId) : null;
    if (user) delete user.password;
    return user;
  }

  async updateProfile({ userId, profileData, imageFile }) {
    const user = await this.userRepository.findById(userId);
    if (!user) throw new ApiError(StatusCode.NOT_FOUND, "User not found");

    let imageUrl = user.image_url;
    if (imageFile) {
      try {
        const uploaded = await cloudinary.uploader.upload(imageFile.path, {
          resource_type: "image",
          folder: "image",
        });

        imageUrl = uploaded.secure_url;
      } finally {
        // Always remove the local staging file, even if the upload failed.
        fs.unlink(imageFile.path, (error) => {
          if (error) {
            logger.error("Failed to delete local file", {
              message: error.message,
            });
          }
        });
      }
    }

    const updatedUser = await this.userRepository.update({
      userId,
      name: profileData.name || user.name,
      email: profileData.email || user.email,
      imageUrl,
    });

    const userProfile = await this.userRepository.profile(userId);
    const updatedProfile = await this.userRepository.updateProfile({
      userId,
      bio: profileData.bio || userProfile.bio,
      location: profileData.location || userProfile.location,
      phone: profileData.phone || userProfile.phone,
      dateBirth: profileData.dateBirth || userProfile.dateBirth,
      gender: profileData.gender || userProfile.gender,
    });

    return { ...updatedUser, ...updatedProfile };
  }

  async getXpEarnings(userId) {
    const user = await this.userRepository.findById(userId);
    if (!user) throw new ApiError(StatusCode.NOT_FOUND, "User Doesn't Exist");

    return this.courseRepository.getXpEarning(userId);
  }
}

export { UserService };
export default new UserService({ userRepository, courseRepository });

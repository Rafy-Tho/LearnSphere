import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import assertOwnership from "../../common/auth/ownership.js";
import courseRepository from "../courses/repository.js";
import moduleRepository from "./module.repository.js";

const OWNER_MESSAGE = "You are not authorized to do this";

class ModuleService {
  constructor({ moduleRepository, courseRepository }) {
    this.moduleRepository = moduleRepository;
    this.courseRepository = courseRepository;
  }

  async createModule({ courseId, moduleData, user }) {
    const course = await this.courseRepository.findById(courseId);
    if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

    assertOwnership({
      ownerId: course.instructor_id,
      user,
      message: OWNER_MESSAGE,
    });

    return this.moduleRepository.create({
      name: moduleData.name,
      description: moduleData.description,
      position: moduleData.position,
      status: moduleData.status,
      courseId,
    });
  }

  async getModule(moduleId) {
    const courseModule = await this.moduleRepository.findById(moduleId);
    if (!courseModule) {
      throw new ApiError(StatusCode.NOT_FOUND, "Module not found");
    }
    return courseModule;
  }

  async updateModule(moduleId, moduleData, user) {
    const courseModule = await this.moduleRepository.findById(moduleId);
    if (!courseModule) {
      throw new ApiError(StatusCode.NOT_FOUND, "Module not found");
    }

    const instructor = await this.moduleRepository.getInstructor(
      courseModule.id,
    );
    assertOwnership({
      ownerId: instructor?.instructor_id,
      user,
      message: OWNER_MESSAGE,
    });

    await this.moduleRepository.update({
      id: moduleId,
      name: moduleData.name,
      description: moduleData.description,
      position: moduleData.position,
      status: moduleData.status,
    });

    return courseModule;
  }

  async deleteModule(moduleId, user) {
    const courseModule = await this.moduleRepository.findById(moduleId);
    if (!courseModule) {
      throw new ApiError(StatusCode.NOT_FOUND, "Module not found");
    }

    const instructor = await this.moduleRepository.getInstructor(
      courseModule.id,
    );
    assertOwnership({
      ownerId: instructor?.instructor_id,
      user,
      message: OWNER_MESSAGE,
    });

    await this.moduleRepository.delete(moduleId);
    return courseModule;
  }
}

export { ModuleService };
export default new ModuleService({ moduleRepository, courseRepository });

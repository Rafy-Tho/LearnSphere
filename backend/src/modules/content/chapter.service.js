import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import assertOwnership from "../../common/auth/ownership.js";
import assertCourseEditable from "../../common/auth/course-lock.js";
import chapterRepository from "./chapter.repository.js";
import moduleRepository from "./module.repository.js";

const OWNER_MESSAGE = "You are not authorized to do this";

class ChapterService {
  constructor({ chapterRepository, moduleRepository }) {
    this.chapterRepository = chapterRepository;
    this.moduleRepository = moduleRepository;
  }

  async createChapter({ moduleId, chapterData, user }) {
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

    assertCourseEditable({ courseStatus: instructor?.course_status, user });

    return this.chapterRepository.create({
      moduleId,
      name: chapterData.name,
      description: chapterData.description,
      position: chapterData.position,
      status: chapterData.status,
    });
  }

  async getChapters(moduleId) {
    const courseModule = await this.moduleRepository.findById(moduleId);
    if (!courseModule) {
      throw new ApiError(StatusCode.NOT_FOUND, "Module not found");
    }

    return this.chapterRepository.find({ moduleId });
  }

  async getChapter(chapterId) {
    const chapter = await this.chapterRepository.findById(chapterId);
    if (!chapter) throw new ApiError(StatusCode.NOT_FOUND, "Chapter not found");
    return chapter;
  }

  async updateChapter(chapterId, chapterData, user) {
    const chapter = await this.chapterRepository.findById(chapterId);
    if (!chapter) throw new ApiError(StatusCode.NOT_FOUND, "Chapter not found");

    const instructor = await this.chapterRepository.getInstructor(chapterId);
    assertOwnership({
      ownerId: instructor?.instructor_id,
      user,
      message: OWNER_MESSAGE,
    });

    assertCourseEditable({ courseStatus: instructor?.course_status, user });

    return this.chapterRepository.update({
      id: chapterId,
      name: chapterData.name,
      description: chapterData.description,
      position: chapterData.position,
      status: chapterData.status,
    });
  }

  async deleteChapter(chapterId, user) {
    const chapter = await this.chapterRepository.findById(chapterId);
    if (!chapter) throw new ApiError(StatusCode.NOT_FOUND, "Chapter not found");

    const instructor = await this.chapterRepository.getInstructor(chapterId);
    assertOwnership({
      ownerId: instructor?.instructor_id,
      user,
      message: OWNER_MESSAGE,
    });

    assertCourseEditable({ courseStatus: instructor?.course_status, user });

    await this.chapterRepository.delete(chapterId);
  }
}

export { ChapterService };
export default new ChapterService({ chapterRepository, moduleRepository });

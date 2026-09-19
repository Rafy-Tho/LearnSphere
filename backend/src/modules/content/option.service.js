import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import assertOwnership from "../../common/auth/ownership.js";
import assertCourseEditable from "../../common/auth/course-lock.js";
import optionRepository from "./option.repository.js";
import questionRepository from "./question.repository.js";

const OWNER_MESSAGE = "You are not authorized to do this";

class OptionService {
  constructor({ optionRepository, questionRepository }) {
    this.optionRepository = optionRepository;
    this.questionRepository = questionRepository;
  }

  async createOption({ questionId, optionData, user }) {
    const question = await this.questionRepository.findById(questionId);
    if (!question) throw new ApiError(StatusCode.NOT_FOUND, "Question not found");

    const instructor = await this.questionRepository.getInstructor(questionId);
    assertOwnership({
      ownerId: instructor?.instructor_id,
      user,
      message: OWNER_MESSAGE,
    });

    assertCourseEditable({ courseStatus: instructor?.course_status, user });

    return this.optionRepository.createOption({
      questionId,
      text: optionData.text,
      isCorrect: optionData.isCorrect,
      position: optionData.position,
    });
  }

  async updateOption(optionId, optionData, user) {
    const option = await this.optionRepository.findById(optionId);
    if (!option) throw new ApiError(StatusCode.NOT_FOUND, "Answer not found");

    const instructor = await this.questionRepository.getInstructor(
      option.quiz_id,
    );
    assertOwnership({
      ownerId: instructor?.instructor_id,
      user,
      message: OWNER_MESSAGE,
    });

    assertCourseEditable({ courseStatus: instructor?.course_status, user });

    return this.optionRepository.updateOption({
      optionId,
      text: optionData.text,
      isCorrect: optionData.isCorrect,
      position: optionData.position,
    });
  }

  async deleteOption(optionId, user) {
    const option = await this.optionRepository.findById(optionId);
    if (!option) throw new ApiError(StatusCode.NOT_FOUND, "Answer not found");

    const instructor = await this.questionRepository.getInstructor(
      option.quiz_id,
    );
    assertOwnership({
      ownerId: instructor?.instructor_id,
      user,
      message: OWNER_MESSAGE,
    });

    assertCourseEditable({ courseStatus: instructor?.course_status, user });

    return this.optionRepository.deleteOption(optionId);
  }
}

export { OptionService };
export default new OptionService({ optionRepository, questionRepository });

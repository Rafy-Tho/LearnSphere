import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import assertOwnership from "../../common/auth/ownership.js";
import enrollmentRepository from "../learning/enrollment.repository.js";
import lessonRepository from "./lesson.repository.js";
import questionRepository from "./question.repository.js";

const OWNER_MESSAGE = "You are not authorized to do this";

class QuestionService {
  constructor({ questionRepository, lessonRepository, enrollmentRepository }) {
    this.questionRepository = questionRepository;
    this.lessonRepository = lessonRepository;
    this.enrollmentRepository = enrollmentRepository;
  }

  async createQuestion({ lessonId, questionData, user }) {
    const lesson = await this.lessonRepository.findById(lessonId);
    if (!lesson) throw new ApiError(StatusCode.NOT_FOUND, "Lesson not found");

    const instructor = await this.lessonRepository.getInstructor(lessonId);
    assertOwnership({
      ownerId: instructor?.instructor_id,
      user,
      message: OWNER_MESSAGE,
    });

    return this.questionRepository.createQuestion({
      lessonId,
      question: questionData.question,
      explanation: questionData.explanation,
      position: questionData.position,
    });
  }

  async updateQuestion(questionId, questionData, user) {
    const question = await this.questionRepository.findById(questionId);
    if (!question) throw new ApiError(StatusCode.NOT_FOUND, "Question not found");

    const instructor = await this.questionRepository.getInstructor(questionId);
    assertOwnership({
      ownerId: instructor?.instructor_id,
      user,
      message: OWNER_MESSAGE,
    });

    return this.questionRepository.updateQuestion({
      questionId,
      question: questionData.question,
      explanation: questionData.explanation,
      position: questionData.position,
    });
  }

  async deleteQuestion(questionId, user) {
    const question = await this.questionRepository.findById(questionId);
    if (!question) throw new ApiError(StatusCode.NOT_FOUND, "Question not found");

    const instructor = await this.questionRepository.getInstructor(questionId);
    assertOwnership({
      ownerId: instructor?.instructor_id,
      user,
      message: OWNER_MESSAGE,
    });

    return this.questionRepository.deleteQuestion(questionId);
  }

  async getQuestions(lessonId, user) {
    const lesson = await this.lessonRepository.findById(lessonId);
    if (!lesson) throw new ApiError(StatusCode.NOT_FOUND, "Lesson not found");

    const course = await this.lessonRepository.getCourse(lessonId);
    if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Lesson not found");

    const isAdmin = user?.role === "ADMIN";
    const isOwner = course.instructor_id === user?.id;

    if (!isAdmin && !isOwner) {
      const enrollment = await this.enrollmentRepository.findOne({
        courseId: course.course_id,
        userId: user?.id,
      });
      if (!enrollment) {
        throw new ApiError(
          StatusCode.FORBIDDEN,
          "You must be enrolled in this course to view the quiz",
        );
      }
    }

    const questions = await this.lessonRepository.getQuestions(lessonId);
    if (!questions) {
      throw new ApiError(StatusCode.NOT_FOUND, "Questions not found");
    }
    return questions;
  }
}

export { QuestionService };
export default new QuestionService({
  questionRepository,
  lessonRepository,
  enrollmentRepository,
});

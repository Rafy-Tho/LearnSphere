import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import assertOwnership from "../../common/auth/ownership.js";
import assertCourseEditable from "../../common/auth/course-lock.js";
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

    assertCourseEditable({ courseStatus: instructor?.course_status, user });

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

    assertCourseEditable({ courseStatus: instructor?.course_status, user });

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

    assertCourseEditable({ courseStatus: instructor?.course_status, user });

    return this.questionRepository.deleteQuestion(questionId);
  }

  async assertQuizAccess(lessonId, user) {
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

    return course;
  }

  async getQuestions(lessonId, user) {
    await this.assertQuizAccess(lessonId, user);

    const questions = await this.lessonRepository.getQuestions(lessonId);
    if (!questions) {
      throw new ApiError(StatusCode.NOT_FOUND, "Questions not found");
    }
    return questions;
  }

  async submitQuiz({ lessonId, answers, user }) {
    await this.assertQuizAccess(lessonId, user);

    const questions =
      await this.lessonRepository.getQuestionsWithAnswers(lessonId);
    const questionsById = new Map(
      questions.map((question) => [question.id, question]),
    );

    const results = answers.map(({ questionId, optionId }) => {
      const question = questionsById.get(questionId);
      if (!question) {
        throw new ApiError(
          StatusCode.BAD_REQUEST,
          "Question does not belong to this lesson",
        );
      }

      const options = question.options || [];
      const selectedOption = options.find((option) => option.id === optionId);
      if (!selectedOption) {
        throw new ApiError(
          StatusCode.BAD_REQUEST,
          "Option does not belong to this question",
        );
      }

      const correctOption = options.find((option) => option.is_correct === true);

      return {
        questionId,
        selectedOptionId: optionId,
        correctOptionId: correctOption?.id ?? null,
        isCorrect: selectedOption.is_correct === true,
        explanation: question.explanation,
      };
    });

    const correct = results.filter((result) => result.isCorrect).length;

    return { score: { correct, total: results.length }, results };
  }
}

export { QuestionService };
export default new QuestionService({
  questionRepository,
  lessonRepository,
  enrollmentRepository,
});

import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import { withTransaction } from "../../config/database.js";
import lessonRepository from "../content/lesson.repository.js";
import questionService from "../content/question.service.js";
import completionService from "../learning/completion.service.js";
import quizAttemptRepository from "./quiz-attempt.repository.js";

class QuizAttemptService {
  constructor({
    quizAttemptRepository,
    questionService,
    lessonRepository,
    completionService,
  }) {
    this.quizAttemptRepository = quizAttemptRepository;
    this.questionService = questionService;
    this.lessonRepository = lessonRepository;
    this.completionService = completionService;
  }

  async submitAttempt({ lessonId, answers, user }) {
    await this.questionService.assertQuizAccess(lessonId, user);

    const questions =
      await this.lessonRepository.getQuestionsWithAnswers(lessonId);
    if (!questions.length) {
      throw new ApiError(StatusCode.NOT_FOUND, "Quiz questions not found");
    }

    const gradedAnswers = this.gradeAnswers(questions, answers);
    const score = gradedAnswers.filter((answer) => answer.isCorrect).length;

    const attempt = await withTransaction(async (client) => {
      const created = await this.quizAttemptRepository.createAttempt(
        { userId: user.id, lessonId },
        client,
      );

      await this.quizAttemptRepository.createAnswers(
        { attemptId: created.id, answers: gradedAnswers },
        client,
      );

      return this.quizAttemptRepository.finalizeAttempt(
        {
          attemptId: created.id,
          score,
          totalQuestions: gradedAnswers.length,
        },
        client,
      );
    });

    await this.markLessonComplete({ lessonId, userId: user.id });

    return this.toResult(
      attempt,
      this.buildResults(questions, gradedAnswers),
    );
  }

  async getAttempts({ lessonId, user }) {
    await this.questionService.assertQuizAccess(lessonId, user);

    const attempts = await this.quizAttemptRepository.findCompletedByLesson({
      userId: user.id,
      lessonId,
    });

    const summaries = attempts.map((attempt) => ({
      id: attempt.id,
      score: attempt.score,
      totalQuestions: attempt.total_questions,
      startedAt: attempt.started_at,
      completedAt: attempt.completed_at,
    }));

    const bestScore = summaries.reduce(
      (best, attempt) =>
        best === null || attempt.score > best ? attempt.score : best,
      null,
    );

    return { attempts: summaries, bestScore, totalAttempts: summaries.length };
  }

  async getLatestAttempt({ lessonId, user }) {
    await this.questionService.assertQuizAccess(lessonId, user);

    const attempt = await this.quizAttemptRepository.findLatestCompleted({
      userId: user.id,
      lessonId,
    });
    if (!attempt) return null;

    const rows = await this.quizAttemptRepository.findAnswersWithQuestions(
      attempt.id,
    );

    const results = rows.map((row) => {
      const options = row.options || [];
      const correctOption = options.find((option) => option.is_correct === true);

      return {
        questionId: row.quiz_id,
        question: row.question,
        explanation: row.explanation ?? null,
        selectedOptionId: row.selected_option_id,
        correctOptionId: correctOption?.id ?? null,
        isCorrect: row.is_correct,
        options: options.map((option) => ({
          id: option.id,
          text: option.text,
        })),
      };
    });

    return this.toResult(attempt, results);
  }

  gradeAnswers(questions, answers) {
    const questionsById = new Map(
      questions.map((question) => [question.id, question]),
    );

    const graded = answers.map(({ questionId, optionId }) => {
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

      return {
        questionId,
        selectedOptionId: optionId,
        isCorrect: selectedOption.is_correct === true,
      };
    });

    const uniqueQuestionIds = new Set(
      graded.map((answer) => answer.questionId),
    );
    if (uniqueQuestionIds.size !== graded.length) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "Duplicate answers are not allowed",
      );
    }

    return graded;
  }

  buildResults(questions, gradedAnswers) {
    const answersByQuestion = new Map(
      gradedAnswers.map((answer) => [answer.questionId, answer]),
    );

    return questions.map((question) => {
      const answer = answersByQuestion.get(question.id);
      const options = question.options || [];
      const correctOption = options.find((option) => option.is_correct === true);

      return {
        questionId: question.id,
        question: question.question,
        explanation: question.explanation ?? null,
        selectedOptionId: answer?.selectedOptionId ?? null,
        correctOptionId: correctOption?.id ?? null,
        isCorrect: answer?.isCorrect ?? false,
        options: options.map((option) => ({
          id: option.id,
          text: option.text,
        })),
      };
    });
  }

  toResult(attempt, results) {
    return {
      id: attempt.id,
      lessonId: attempt.lesson_id,
      status: attempt.status,
      score: attempt.score,
      totalQuestions: attempt.total_questions,
      startedAt: attempt.started_at,
      completedAt: attempt.completed_at,
      results,
    };
  }

  async markLessonComplete({ lessonId, userId }) {
    return this.completionService.markLessonComplete({ lessonId, userId });
  }
}

export { QuizAttemptService };
export default new QuizAttemptService({
  quizAttemptRepository,
  questionService,
  lessonRepository,
  completionService,
});

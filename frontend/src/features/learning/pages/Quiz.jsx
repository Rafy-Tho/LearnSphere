// QuizApp.jsx (Main Component)
import { useState } from "react";
import { useQuizzes as useGetQuizzes } from "@/features/learning/hooks/useLessons";
import { useSubmitQuiz } from "@/features/learning/hooks/useLearningMutations";
import ErrorMessage from "@/components/ui/ErrorMessage";
import SpinnerLoader from "@/components/ui/SpinnerLoader";
import NavigationButtons from "@/features/learning/components/course-learning/quiz/NavigationButtons";
import ProgressBar from "@/features/learning/components/course-learning/quiz/ProgressBar";
import QuestionCard from "@/features/learning/components/course-learning/quiz/QuestionCard";
import ResultsScreen from "@/features/learning/components/course-learning/quiz/ResultsScreen";
import StartScreen from "@/features/learning/components/course-learning/quiz/StartScreen";

const Quiz = () => {
  const [currentIndex, setCurrentIndex] = useState(0);
  const [selectedAnswers, setSelectedAnswers] = useState({});
  const [answerResults, setAnswerResults] = useState({});
  const [isShowingResults, setIsShowingResults] = useState(false);
  const [isQuizStarted, setIsQuizStarted] = useState(false);
  const { data, isPending, error } = useGetQuizzes();
  const submitQuiz = useSubmitQuiz();
  const questions = data || [];
  const currentQuestion = questions[currentIndex];
  const selectedOptionId = selectedAnswers[currentIndex];
  const currentResult = answerResults[currentIndex];
  const isAnswered = currentResult !== undefined;
  const isSubmitting = submitQuiz.isPending;

  const handleAnswer = async (optionId) => {
    if (isAnswered || isSubmitting) return;

    setSelectedAnswers((previous) => ({
      ...previous,
      [currentIndex]: optionId,
    }));

    try {
      const submission = await submitQuiz.mutateAsync([
        { questionId: currentQuestion.id, optionId },
      ]);
      setAnswerResults((previous) => ({
        ...previous,
        [currentIndex]: submission.results[0],
      }));
    } catch {
      setSelectedAnswers((previous) => {
        const next = { ...previous };
        delete next[currentIndex];
        return next;
      });
    }
  };

  const handleNext = () => {
    if (currentIndex < questions.length - 1) {
      setCurrentIndex(currentIndex + 1);
    }
  };

  const handlePrevious = () => {
    if (currentIndex > 0) {
      setCurrentIndex(currentIndex - 1);
    }
  };

  const calculateScore = () => {
    const correct = Object.values(answerResults).filter(
      (answerResult) => answerResult.isCorrect,
    ).length;
    return { correct, total: questions.length };
  };

  const restart = () => {
    setCurrentIndex(0);
    setSelectedAnswers({});
    setAnswerResults({});
    setIsShowingResults(false);
    setIsQuizStarted(false);
  };

  if (isPending) return <SpinnerLoader />;
  if (error) return <ErrorMessage message={error.message} />;
  if (!isQuizStarted) {
    return (
      <StartScreen
        onStart={() => setIsQuizStarted(true)}
        totalQuestions={questions.length}
      />
    );
  }

  if (isShowingResults) {
    const score = calculateScore();
    return <ResultsScreen score={score} onRestart={restart} />;
  }

  return (
    <div className="min-h-screen bg-slate-50 dark:bg-slate-900 flex items-center justify-center p-4">
      <div className="max-w-2xl w-full bg-white dark:bg-slate-800 rounded-2xl shadow-xl p-8">
        <ProgressBar
          currentIndex={currentIndex}
          totalQuestions={questions.length}
          answersCount={Object.keys(answerResults).length}
        />

        <QuestionCard
          question={currentQuestion}
          selectedOptionId={selectedOptionId}
          isAnswered={isAnswered}
          isSubmitting={isSubmitting}
          answerResult={currentResult}
          onAnswerSelect={handleAnswer}
        />

        <NavigationButtons
          currentIndex={currentIndex}
          totalQuestions={questions.length}
          isAnswered={isAnswered}
          onPrevious={handlePrevious}
          onNext={handleNext}
          onFinish={() => setIsShowingResults(true)}
        />
      </div>
    </div>
  );
};

export default Quiz;

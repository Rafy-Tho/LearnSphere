// QuizApp.jsx (Main Component)
import { useState } from "react";
import useGetQuizzes from "../../../hooks/course/useGetQuizzes";
import useSubmitQuiz from "../../../hooks/course/useSubmitQuiz";
import ErrorMessage from "../../../ui/ErrorMessage";
import SpinnerLoader from "../../../ui/SpinnerLoader";
import NavigationButtons from "./NavigationButtons";
import ProgressBar from "./ProgressBar";
import QuestionCard from "./QuestionCard";
import ResultsScreen from "./ResultsScreen";
import StartScreen from "./StartScreen";

const Quiz = () => {
  const [currentIndex, setCurrentIndex] = useState(0);
  const [answers, setAnswers] = useState({});
  const [results, setResults] = useState({});
  const [showResults, setShowResults] = useState(false);
  const [quizStarted, setQuizStarted] = useState(false);
  const { data, isPending, error } = useGetQuizzes();
  const submitQuiz = useSubmitQuiz();
  const questions = data || [];
  const currentQuestion = questions[currentIndex];
  const selectedOptionId = answers[currentIndex];
  const currentResult = results[currentIndex];
  const isAnswered = currentResult !== undefined;
  const isSubmitting = submitQuiz.isPending;

  const handleAnswer = async (optionId) => {
    if (isAnswered || isSubmitting) return;

    setAnswers((previous) => ({ ...previous, [currentIndex]: optionId }));

    try {
      const submission = await submitQuiz.mutateAsync([
        { questionId: currentQuestion.id, optionId },
      ]);
      setResults((previous) => ({
        ...previous,
        [currentIndex]: submission.results[0],
      }));
    } catch {
      setAnswers((previous) => {
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
    const correct = Object.values(results).filter(
      (result) => result.isCorrect,
    ).length;
    return { correct, total: questions.length };
  };

  const restart = () => {
    setCurrentIndex(0);
    setAnswers({});
    setResults({});
    setShowResults(false);
    setQuizStarted(false);
  };

  if (isPending) return <SpinnerLoader />;
  if (error) return <ErrorMessage message={error.message} />;
  if (!quizStarted) {
    return (
      <StartScreen
        onStart={() => setQuizStarted(true)}
        totalQuestions={questions.length}
      />
    );
  }

  if (showResults) {
    const score = calculateScore();
    return <ResultsScreen score={score} onRestart={restart} />;
  }

  return (
    <div className="min-h-screen bg-slate-50 dark:bg-slate-900 flex items-center justify-center p-4">
      <div className="max-w-2xl w-full bg-white dark:bg-slate-800 rounded-2xl shadow-xl p-8">
        <ProgressBar
          currentIndex={currentIndex}
          totalQuestions={questions.length}
          answersCount={Object.keys(results).length}
        />

        <QuestionCard
          question={currentQuestion}
          selectedOptionId={selectedOptionId}
          isAnswered={isAnswered}
          isSubmitting={isSubmitting}
          result={currentResult}
          onAnswerSelect={handleAnswer}
        />

        <NavigationButtons
          currentIndex={currentIndex}
          totalQuestions={questions.length}
          isAnswered={isAnswered}
          onPrevious={handlePrevious}
          onNext={handleNext}
          onFinish={() => setShowResults(true)}
        />
      </div>
    </div>
  );
};

export default Quiz;

import { useMemo, useState } from "react";
import { Check, ChevronLeft, ChevronRight } from "lucide-react";
import { useQuizzes as useGetQuizzes } from "@/features/learning/hooks/useLessons";
import {
  useLatestQuizAttempt,
  useQuizAttempts,
} from "@/features/learning/hooks/useQuizAttempts";
import { useSubmitQuizAttempt } from "@/features/learning/hooks/useLearningMutations";
import Button from "@/components/ui/Button";
import ConfirmDialog from "@/components/ui/ConfirmDialog";
import ErrorMessage from "@/components/ui/ErrorMessage";
import SpinnerLoader from "@/components/ui/SpinnerLoader";
import QuizIntro from "@/features/learning/components/course-learning/quiz/QuizIntro";
import QuizQuestion from "@/features/learning/components/course-learning/quiz/QuizQuestion";
import QuizProgress from "@/features/learning/components/course-learning/quiz/QuizProgress";
import QuizResults from "@/features/learning/components/course-learning/quiz/QuizResults";

const Quiz = () => {
  const [currentIndex, setCurrentIndex] = useState(0);
  const [selectedAnswers, setSelectedAnswers] = useState({});
  const [isStarted, setIsStarted] = useState(false);
  const [isConfirmOpen, setIsConfirmOpen] = useState(false);
  const [submittedAttempt, setSubmittedAttempt] = useState(null);

  const { data, isPending, error } = useGetQuizzes();
  const { data: latestAttempt, isPending: isLatestPending } =
    useLatestQuizAttempt();
  const { data: history } = useQuizAttempts();
  const submitAttempt = useSubmitQuizAttempt();

  const questions = useMemo(() => data || [], [data]);
  const totalQuestions = questions.length;
  const currentQuestion = questions[currentIndex];
  const answeredIndexes = useMemo(() => {
    const indexes = new Set();
    questions.forEach((question, index) => {
      if (selectedAnswers[question.id]) indexes.add(index);
    });
    return indexes;
  }, [questions, selectedAnswers]);
  const allAnswered =
    totalQuestions > 0 && answeredIndexes.size === totalQuestions;

  const startQuiz = () => {
    setSelectedAnswers({});
    setCurrentIndex(0);
    setSubmittedAttempt(null);
    setIsStarted(true);
  };

  const handleSelect = (optionId) => {
    setSelectedAnswers((previous) => ({
      ...previous,
      [currentQuestion.id]: optionId,
    }));
  };

  const handleSubmit = async () => {
    setIsConfirmOpen(false);
    const answers = questions.map((question) => ({
      questionId: question.id,
      optionId: selectedAnswers[question.id],
    }));

    try {
      const attempt = await submitAttempt.mutateAsync(answers);
      setSubmittedAttempt(attempt);
      setIsStarted(false);
    } catch {
      // Errors are surfaced by the mutation's toast.
    }
  };

  if (isPending || isLatestPending) return <SpinnerLoader />;
  if (error) return <ErrorMessage message={error.message} />;
  if (!totalQuestions)
    return <ErrorMessage message="This quiz has no questions yet." />;

  const resultAttempt = submittedAttempt ?? (!isStarted ? latestAttempt : null);

  if (resultAttempt) {
    return (
      <QuizResults
        attempt={resultAttempt}
        history={history}
        onRetake={startQuiz}
      />
    );
  }

  if (!isStarted) {
    return (
      <QuizIntro
        totalQuestions={totalQuestions}
        bestScore={history?.bestScore ?? null}
        totalAttempts={history?.totalAttempts ?? 0}
        onStart={startQuiz}
      />
    );
  }

  const isLast = currentIndex === totalQuestions - 1;

  return (
    <div className="flex min-h-full flex-col">
      <div className="mx-auto w-full max-w-3xl flex-1 px-4 py-6">
        <QuizProgress
          currentIndex={currentIndex}
          totalQuestions={totalQuestions}
          answeredIndexes={answeredIndexes}
          onJump={setCurrentIndex}
        />

        <QuizQuestion
          question={currentQuestion}
          selectedOptionId={selectedAnswers[currentQuestion.id]}
          onSelect={handleSelect}
        />
      </div>

      <div className="sticky bottom-0 border-t border-border bg-surface/95 backdrop-blur-md">
        <div className="mx-auto flex max-w-3xl items-center justify-between gap-3 px-4 py-3">
          <Button
            variant="outline"
            onClick={() => setCurrentIndex((index) => Math.max(0, index - 1))}
            disabled={currentIndex === 0}
            leftIcon={<ChevronLeft size={16} />}
          >
            Previous
          </Button>

          {isLast ? (
            <Button
              onClick={() => setIsConfirmOpen(true)}
              disabled={!allAnswered}
              isLoading={submitAttempt.isPending}
              leftIcon={<Check size={16} />}
            >
              Submit Quiz
            </Button>
          ) : (
            <Button
              onClick={() =>
                setCurrentIndex((index) =>
                  Math.min(totalQuestions - 1, index + 1),
                )
              }
              rightIcon={<ChevronRight size={16} />}
            >
              Next
            </Button>
          )}
        </div>

        {isLast && !allAnswered && (
          <p className="pb-3 text-center text-xs text-foreground-muted">
            Answer all {totalQuestions} questions to submit.
          </p>
        )}
      </div>

      <ConfirmDialog
        open={isConfirmOpen}
        onCancel={() => setIsConfirmOpen(false)}
        onConfirm={handleSubmit}
        title="Submit quiz?"
        message="You cannot change your answers after submitting. Your score and review will be shown next."
        confirmText="Submit"
        confirmVariant="primary"
      />
    </div>
  );
};

export default Quiz;

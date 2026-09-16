import { RotateCcw, Trophy } from "lucide-react";
import Button from "@/components/ui/Button";
import Badge from "@/components/ui/Badge";
import Card from "@/components/ui/Card";
import ProgressBar from "@/components/ui/ProgressBar";
import QuizReviewItem from "@/features/learning/components/course-learning/quiz/QuizReviewItem";
import QuizHistory from "@/features/learning/components/course-learning/quiz/QuizHistory";

const getMessage = (percentage) => {
  if (percentage === 100) return "Perfect score — outstanding work.";
  if (percentage >= 70) return "Great job — you passed this quiz.";
  if (percentage >= 40) return "Good effort — review the answers below.";
  return "Keep practicing — review the answers and try again.";
};

const QuizResults = ({ attempt, history, onRetake }) => {
  const total = attempt.totalQuestions || 0;
  const score = attempt.score ?? 0;
  const percentage = total ? Math.round((score / total) * 100) : 0;
  const isPassed = percentage >= 70;
  const bestPercentage =
    history?.bestScore != null && total
      ? Math.round((history.bestScore / total) * 100)
      : null;

  return (
    <div className="mx-auto w-full max-w-3xl px-4 py-6">
      <Card bodyClassName="p-6 text-center sm:p-8">
        <div className="mx-auto mb-4 flex h-14 w-14 items-center justify-center rounded-2xl bg-success/10 text-success">
          <Trophy size={26} />
        </div>
        <h1 className="text-2xl font-bold text-foreground">Quiz Complete</h1>
        <p className="mt-1 text-sm text-foreground-muted">
          {getMessage(percentage)}
        </p>

        <p className="mt-6 text-4xl font-bold text-foreground">
          {score}
          <span className="text-2xl text-foreground-muted">/{total}</span>
        </p>
        <p className="text-sm text-foreground-muted">{percentage}% correct</p>

        <div className="mx-auto mt-4 max-w-sm">
          <ProgressBar
            value={percentage}
            max={100}
            color={isPassed ? "success" : "warning"}
          />
        </div>

        <div className="mt-4 flex flex-wrap items-center justify-center gap-2">
          {bestPercentage !== null && (
            <Badge variant="success">
              <Trophy size={13} />
              Best {bestPercentage}%
            </Badge>
          )}
          {history?.totalAttempts > 0 && (
            <Badge variant="neutral">
              {history.totalAttempts}{" "}
              {history.totalAttempts === 1 ? "attempt" : "attempts"}
            </Badge>
          )}
        </div>

        <Button
          className="mt-6"
          onClick={onRetake}
          leftIcon={<RotateCcw size={16} />}
        >
          Try Again
        </Button>
      </Card>

      <div className="mt-6 space-y-3">
        <h2 className="text-sm font-semibold text-foreground">
          Review answers
        </h2>
        {attempt.results.map((result, index) => (
          <QuizReviewItem key={result.questionId} result={result} index={index} />
        ))}
      </div>

      {history?.attempts?.length > 0 && (
        <div className="mt-6">
          <QuizHistory
            attempts={history.attempts}
            currentAttemptId={attempt.id}
          />
        </div>
      )}
    </div>
  );
};

export default QuizResults;

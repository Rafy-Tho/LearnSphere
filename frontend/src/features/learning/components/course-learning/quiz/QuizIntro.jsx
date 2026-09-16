import { ClipboardList, Play, Trophy } from "lucide-react";
import Button from "@/components/ui/Button";
import Badge from "@/components/ui/Badge";
import Card from "@/components/ui/Card";

const QuizIntro = ({ totalQuestions, bestScore, totalAttempts, onStart }) => {
  const bestPercentage =
    bestScore !== null && totalQuestions
      ? Math.round((bestScore / totalQuestions) * 100)
      : null;

  return (
    <div className="mx-auto w-full max-w-2xl px-4 py-8 sm:py-12">
      <Card bodyClassName="p-6 text-center sm:p-8">
        <div className="mx-auto mb-5 flex h-14 w-14 items-center justify-center rounded-2xl bg-primary/10 text-primary">
          <ClipboardList size={26} />
        </div>
        <h1 className="text-2xl font-bold text-foreground sm:text-3xl">
          Quiz
        </h1>
        <p className="mx-auto mt-2 max-w-md text-sm text-foreground-muted">
          Answer {totalQuestions} questions, then submit to see your score and a
          full review.
        </p>

        <div className="mt-6 flex flex-wrap items-center justify-center gap-3">
          <Badge variant="neutral">{totalQuestions} questions</Badge>
          {totalAttempts > 0 && (
            <Badge variant="neutral">
              {totalAttempts} {totalAttempts === 1 ? "attempt" : "attempts"}
            </Badge>
          )}
          {bestPercentage !== null && (
            <Badge variant="success">
              <Trophy size={13} />
              Best {bestPercentage}%
            </Badge>
          )}
        </div>

        <Button
          size="lg"
          className="mt-8 w-full sm:w-auto"
          onClick={onStart}
          leftIcon={<Play size={18} />}
        >
          {totalAttempts > 0 ? "Retake Quiz" : "Start Quiz"}
        </Button>
      </Card>
    </div>
  );
};

export default QuizIntro;

import Badge from "@/components/ui/Badge";

const formatDate = (value) =>
  value ? new Date(value).toLocaleString() : "—";

const QuizHistory = ({ attempts, currentAttemptId }) => {
  return (
    <div className="overflow-hidden rounded-xl border border-border bg-surface">
      <div className="border-b border-border px-5 py-3">
        <h2 className="text-sm font-semibold text-foreground">
          Attempt history
        </h2>
      </div>

      <ul className="divide-y divide-border">
        {attempts.map((attempt) => {
          const percentage = attempt.totalQuestions
            ? Math.round((attempt.score / attempt.totalQuestions) * 100)
            : 0;

          return (
            <li
              key={attempt.id}
              className="flex items-center justify-between gap-3 px-5 py-3"
            >
              <div className="min-w-0">
                <p className="text-sm text-foreground">
                  {formatDate(attempt.completedAt)}
                </p>
                {attempt.id === currentAttemptId && (
                  <span className="text-xs text-primary">This attempt</span>
                )}
              </div>
              <Badge variant={percentage >= 70 ? "success" : "warning"}>
                {attempt.score}/{attempt.totalQuestions} · {percentage}%
              </Badge>
            </li>
          );
        })}
      </ul>
    </div>
  );
};

export default QuizHistory;

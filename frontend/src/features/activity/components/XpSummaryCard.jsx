import { Flame, Zap } from "lucide-react";
import {
  useXpEarned,
  useXpTransactions,
} from "@/features/settings/hooks/useUsers";
import { getXpLevel } from "@/utils/xpLevel";
import Badge from "@/components/ui/Badge";
import ProgressBar from "@/components/ui/ProgressBar";
import Skeleton from "@/components/ui/Skeleton";
import ErrorMessage from "@/components/ui/ErrorMessage";

const REASON_LABELS = {
  LESSON_COMPLETION: "Lesson completed",
  COURSE_COMPLETION: "Course completed",
  ADMIN_ADJUSTMENT: "Admin adjustment",
};

function XpSummaryCard({ showRecentGains = true }) {
  const { data, isPending, error } = useXpEarned();
  const { data: transactions } = useXpTransactions({ limit: 4 });

  if (error) return <ErrorMessage message={error.message} />;

  const totalXp = data?.total_xp ?? 0;
  const todayXp = data?.today_xp ?? 0;
  const streakDays = data?.streak_days ?? 0;
  const { level, currentLevelXp, xpForNextLevel, xpToNextLevel } =
    getXpLevel(totalXp);

  return (
    <div className="rounded-xl border border-border bg-surface p-6">
      <div className="mb-4 flex items-center justify-between gap-3">
        <p className="text-sm font-semibold text-foreground-muted">Your XP</p>
        {!isPending && (
          <Badge variant="default">
            <Zap size={12} />
            Level {level}
          </Badge>
        )}
      </div>

      {isPending ? (
        <div className="space-y-3">
          <Skeleton className="h-9 w-32" />
          <Skeleton className="h-2 w-full" />
          <Skeleton className="h-16 w-full" />
        </div>
      ) : (
        <>
          <div className="flex items-end gap-2">
            <span className="text-3xl font-bold leading-none text-foreground">
              {totalXp.toLocaleString()}
            </span>
            <span className="pb-0.5 text-sm font-medium text-foreground-muted">
              XP
            </span>
          </div>

          <ProgressBar
            value={currentLevelXp}
            max={xpForNextLevel}
            size="md"
            leftLabel={`Level ${level}`}
            rightLabel={`${currentLevelXp} / ${xpForNextLevel}`}
            className="mt-4"
          />
          <p className="mt-2 text-xs text-foreground-muted">
            {xpToNextLevel} XP to Level {level + 1}
          </p>

          <div className="mt-5 grid grid-cols-2 gap-3">
            <div className="rounded-lg bg-surface-muted p-3">
              <p className="text-lg font-bold text-foreground">+{todayXp}</p>
              <p className="text-xs text-foreground-muted">Earned today</p>
            </div>
            <div className="flex items-center gap-2 rounded-lg bg-surface-muted p-3">
              <Flame className="size-4 shrink-0 text-warning" />
              <div>
                <p className="text-lg font-bold leading-tight text-foreground">
                  {streakDays}
                </p>
                <p className="text-xs text-foreground-muted">
                  Day{streakDays === 1 ? "" : "s"} streak
                </p>
              </div>
            </div>
          </div>
        </>
      )}

      {showRecentGains && (
        <div className="mt-5 border-t border-border pt-4">
          <p className="mb-2 text-xs font-semibold uppercase tracking-wide text-foreground-muted">
            Recent XP
          </p>
          {!transactions?.length ? (
            <p className="text-sm text-foreground-muted">
              No XP earned yet. Complete a lesson to get started.
            </p>
          ) : (
            <ul className="space-y-2">
              {transactions.map((transaction) => (
                <li
                  key={transaction.id}
                  className="flex items-center justify-between gap-3 text-sm"
                >
                  <span className="min-w-0 truncate text-foreground-muted">
                    {REASON_LABELS[transaction.reason] || transaction.reason}
                  </span>
                  <span className="shrink-0 font-semibold text-success">
                    +{transaction.amount} XP
                  </span>
                </li>
              ))}
            </ul>
          )}
        </div>
      )}
    </div>
  );
}

export default XpSummaryCard;

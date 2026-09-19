import { ErrorState } from "@/components/common/ErrorState";
import { Skeleton } from "@/components/ui/skeleton";
import { useInstructorAnalytics } from "@/features/instructor/hooks";

function Stat({ label, value }) {
  return (
    <div className="glass-card rounded-xl p-5">
      <p className="text-sm font-medium text-muted-foreground">{label}</p>
      <p className="mt-1 text-2xl font-bold text-foreground">{value}</p>
    </div>
  );
}

export function AnalyticsTab({ courseId }) {
  const { data, isPending, error } = useInstructorAnalytics(courseId);

  if (isPending) {
    return (
      <div className="grid gap-4 md:grid-cols-3">
        {Array.from({ length: 6 }).map((_, i) => (
          <Skeleton key={i} className="h-24 w-full rounded-xl" />
        ))}
      </div>
    );
  }
  if (error) return <ErrorState message={error.message} />;

  const lessons = data?.lessons || [];
  const maxCompleted = Math.max(
    1,
    ...lessons.map((lesson) => Number(lesson.completed_count)),
  );
  const quiz = data?.quiz || {};

  return (
    <div className="space-y-6">
      <div className="grid gap-4 md:grid-cols-3">
        <Stat label="Enrolled students" value={data?.totalStudents || 0} />
        <Stat label="Total lessons" value={data?.totalLessons || 0} />
        <Stat label="Completion rate" value={`${data?.completionRate || 0}%`} />
        <Stat label="Completed students" value={data?.completedStudents || 0} />
        <Stat
          label="Avg. lessons completed"
          value={data?.avgCompletedLessons || 0}
        />
        <Stat
          label="Quiz avg. score"
          value={`${quiz.avgScorePercentage || 0}%`}
        />
      </div>

      <div className="glass-card rounded-xl p-6">
        <h3 className="font-semibold text-foreground mb-1">
          Quiz performance
        </h3>
        <p className="text-sm text-muted-foreground mb-4">
          Pass threshold {quiz.passThreshold || 60}%
        </p>
        <div className="grid grid-cols-3 gap-4">
          <div className="rounded-lg bg-accent/40 p-4">
            <p className="text-xl font-bold text-foreground">
              {quiz.totalAttempts || 0}
            </p>
            <p className="text-xs text-muted-foreground">Attempts</p>
          </div>
          <div className="rounded-lg bg-accent/40 p-4">
            <p className="text-xl font-bold text-foreground">
              {quiz.completedAttempts || 0}
            </p>
            <p className="text-xs text-muted-foreground">Completed</p>
          </div>
          <div className="rounded-lg bg-accent/40 p-4">
            <p className="text-xl font-bold text-foreground">
              {quiz.passedAttempts || 0}
            </p>
            <p className="text-xs text-muted-foreground">Passed</p>
          </div>
        </div>
      </div>

      <div className="glass-card rounded-xl p-6">
        <h3 className="font-semibold text-foreground mb-4">
          Lesson completion (drop-off)
        </h3>
        {lessons.length === 0 ? (
          <p className="text-sm text-muted-foreground">No lessons yet.</p>
        ) : (
          <div className="space-y-3">
            {lessons.map((lesson) => (
              <div key={lesson.lesson_id}>
                <div className="flex items-center justify-between text-sm">
                  <span className="text-foreground truncate">
                    {lesson.module_name} / {lesson.chapter_name} /{" "}
                    {lesson.lesson_name}
                  </span>
                  <span className="text-muted-foreground">
                    {lesson.completed_count}
                  </span>
                </div>
                <div className="mt-1 h-1.5 w-full rounded-full bg-muted">
                  <div
                    className="h-1.5 rounded-full bg-primary"
                    style={{
                      width: `${(Number(lesson.completed_count) * 100) / maxCompleted}%`,
                    }}
                  />
                </div>
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  );
}

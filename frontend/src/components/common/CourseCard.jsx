import { memo } from "react";
import { BookOpen, Bookmark, Clock, BarChart2 } from "lucide-react";
import { useNavigate } from "react-router-dom";
import formatMinutes from "@/utils/formatMinutes";
import formatCapitalize from "@/utils/formatCapitalize";
import truncateText from "@/utils/truncateText";
import cn from "@/utils/cn";
import ProgressBar from "@/components/ui/ProgressBar";
import useAuth from "@/features/auth/hooks/useAuth";
import { useSavedCourseIds } from "@/features/saved/hooks/useSavedCourses";
import { useToggleSaveCourse } from "@/features/saved/hooks/useSavedMutations";

function CourseCard({ course, progress, lessonId, scrollToTop = true }) {
  const navigate = useNavigate();
  const { user } = useAuth();
  const { data: savedCourseIds } = useSavedCourseIds();
  const { mutate: toggleSave, isPending: isSaving } = useToggleSaveCourse();
  const isSaved = Array.isArray(savedCourseIds) && savedCourseIds.includes(course.id);
  const hasProgress = progress != null;
  const progressPercentage = progress ?? 0;

  const handleClick = () => {
    navigate(
      lessonId
        ? `/courses/${course.id}/lessons/${lessonId}`
        : `/courses/${course.id}`,
    );
    if (scrollToTop) window.scrollTo({ top: 0, behavior: "smooth" });
  };

  const handleToggleSave = (e) => {
    e.stopPropagation();
    if (!user) {
      navigate("/login");
      return;
    }
    toggleSave({ courseId: course.id, isSaved });
  };

  return (
    <article
      className="flex shrink-0 flex-col rounded-xl border border-border bg-surface p-6 shadow-sm transition-shadow hover:shadow-md h-full w-full cursor-pointer"
      onClick={handleClick}
    >
      <div className="mb-4 flex items-start justify-between">
        <span className="inline-flex items-center gap-1.5 rounded-full bg-primary/10 px-2.5 py-1 text-xs font-semibold text-primary">
          <BookOpen className="size-3.5" aria-hidden />
          Course
        </span>
        <button
          type="button"
          className={cn(
            "transition-colors hover:text-primary cursor-pointer",
            isSaved ? "text-primary" : "text-foreground-muted",
          )}
          aria-label={isSaved ? "Remove from saved courses" : "Save course"}
          aria-pressed={isSaved}
          disabled={isSaving}
          onClick={handleToggleSave}
        >
          <Bookmark className={cn("size-5", isSaved && "fill-current")} />
        </button>
      </div>

      <h3 className="mb-2 text-lg font-bold text-foreground">{course.name}</h3>
      <p className="mb-6 line-clamp-4 flex-1 text-sm text-foreground-muted">
        {truncateText(course.description, 150)}
      </p>

      <div className="mt-auto flex items-center justify-between text-xs text-foreground-muted">
        <span className="inline-flex items-center gap-1">
          <Clock className="size-3.5" />
          {formatMinutes(course.total_duration)}
        </span>
        <span className="inline-flex items-center gap-1">
          <BarChart2 className="size-3.5" />
          {formatCapitalize(course.level)}
        </span>
      </div>

      {hasProgress && (
        <ProgressBar
          value={progressPercentage}
          color="primary"
          size="sm"
          leftLabel="Progress"
          rightLabel={`${Math.round(progressPercentage)}%`}
          className="mt-4 pt-2 border-t border-border"
        />
      )}
    </article>
  );
}

export default memo(CourseCard);

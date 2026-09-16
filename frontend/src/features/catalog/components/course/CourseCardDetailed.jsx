import { memo } from "react";
import { BarChart3, Bookmark, BookOpen, CheckCircle, Clock, MessageSquare, Star } from "lucide-react";
import { Link } from "react-router-dom";
import formatCapitalize from "@/utils/formatCapitalize";
import formatMinutes from "@/utils/formatMinutes";
import formatTimeAgo from "@/utils/formatTimeAgo";

export const CourseCardDetailed = memo(function CourseCardDetailed({ course }) {
  return (
    <Link
      to={`/courses/${course.id}`}
      className="bg-surface border border-border rounded-lg p-5 md:p-6 hover:shadow-md transition-shadow block"
    >
      {/* Header */}
      <div className="flex  items-center justify-between gap-3 mb-4">
        <div className="flex items-center gap-3">
          <span className="inline-flex items-center gap-1 px-2.5 py-1 bg-primary/10 text-primary text-xs font-medium rounded">
            <BookOpen className="w-3 h-3" />
            Course
          </span>
          <div className="hidden lg:flex items-center gap-3 text-sm text-foreground-muted">
            <span className="flex items-center gap-1">
              <BarChart3 className="w-4 h-4" />
              {formatCapitalize(course.level)}
            </span>
            <span className="flex items-center gap-1">
              <Clock className="w-4 h-4" />
              {formatTimeAgo(course.updated_at)}
            </span>
            <span className="flex items-center gap-1">
              <Clock className="w-4 h-4" />
              {formatMinutes(course.total_duration)}
            </span>
          </div>
        </div>
        <div className="flex items-center gap-2">
          <div className="flex items-center gap-1">
            <Star className="w-4 h-4 fill-warning text-warning" />
            <span className="text-sm font-medium text-foreground">
              {course.avg_rating}
            </span>
          </div>
          <button className="p-1 text-foreground-muted hover:text-foreground cursor-pointer">
            <Bookmark className="w-5 h-5" />
          </button>
        </div>
      </div>

      {/* Mobile difficulty/time info */}
      <div className="lg:hidden flex flex-wrap gap-2 mb-3 text-xs text-foreground-muted">
        <span className="flex items-center gap-1">
          <BarChart3 className="w-3 h-3" />
          {course.level}
        </span>
        <span className="flex items-center gap-1">
          <Clock className="w-3 h-3" />
          {formatTimeAgo(course.updated_at)}
        </span>
        <span className="flex items-center gap-1">
          <Clock className="w-3 h-3" />
          {formatMinutes(course.total_duration)}
        </span>
      </div>

      {/* Title */}
      <h3 className="text-lg md:text-xl font-semibold text-foreground mb-2">
        {course.name}
      </h3>

      {/* Description */}
      <p className="text-sm text-foreground-muted mb-4 line-clamp-2">
        {course.description}
      </p>

      {/* Features */}
      <div className="flex flex-wrap gap-3 text-xs md:text-sm text-foreground">
        <span className="flex items-center gap-1.5 px-2.5 py-1.5 bg-surface-muted rounded">
          <CheckCircle className="w-4 h-4" />
          {course.total_lessons} Lessons
        </span>

        <span className="flex items-center gap-1.5 px-2.5 py-1.5 bg-surface-muted rounded">
          <MessageSquare className="w-4 h-4" />
          Mock Interviews
        </span>
        <span className="flex items-center gap-1.5 px-2.5 py-1.5 bg-surface-muted rounded">
          <CheckCircle className="w-4 h-4" />
          {course.total_quizzes} Quizzes
        </span>
      </div>
    </Link>
  );
});

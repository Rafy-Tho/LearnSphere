import { memo } from 'react';
import {
  BookOpen,
  ChevronDown,
  ChevronRight,
  FileText,
  HelpCircle,
  Loader2,
  Pencil,
  Plus,
  Trash2,
} from 'lucide-react';
import { StatusBadge } from '@/components/common/StatusBadge';
import { Button } from '@/components/ui/button';
import { useLessonContents, useLessonQuestions } from '@/features/courses/hooks';
import { ContentItem } from './ContentItem';
import { QuizItem } from './QuizItem';

export const LessonItem = memo(function LessonItem({
  courseId,
  lesson,
  isExpanded,
  onToggle,
  onAddContent,
  onAddQuiz,
  onEdit,
  onDelete,
  onEditContent,
  onDeleteContent,
  onEditQuiz,
  onDeleteQuiz,
}) {
  const {
    contents,
    isLoading: contentsLoading,
    isError: contentsError,
    refetch: refetchContents,
  } = useLessonContents(courseId, lesson.id, isExpanded && lesson.type === 'TEXT');

  const {
    questions,
    isLoading: questionsLoading,
    isError: questionsError,
    refetch: refetchQuestions,
  } = useLessonQuestions(
    courseId,
    lesson.id,
    isExpanded && lesson.type === 'QUIZ',
  );

  const hasChildren =
    (lesson.content_count ?? 0) > 0 || (lesson.quiz_count ?? 0) > 0;
  const isLoading = contentsLoading || questionsLoading;
  const isError = contentsError || questionsError;

  return (
    <div>
      {/* Lesson row */}
      <div
        className="flex items-center gap-3 py-2 px-3 rounded-lg hover:bg-accent/10 transition-colors group cursor-pointer"
        onClick={() => onToggle(lesson.id)}
      >
        {hasChildren ? (
          isExpanded ? (
            <ChevronDown className="h-3 w-3 text-muted-foreground" />
          ) : (
            <ChevronRight className="h-3 w-3 text-muted-foreground" />
          )
        ) : (
          <div className="w-3" />
        )}

        {lesson.type === 'TEXT' ? (
          <FileText className="h-3.5 w-3.5 text-primary" />
        ) : (
          <HelpCircle className="h-3.5 w-3.5 text-amber-500" />
        )}

        <div className="flex-1 min-w-0 flex items-center gap-2">
          <span className="text-sm text-foreground">{lesson.name}</span>
          <StatusBadge status={lesson.status} />
          <span className="text-xs text-muted-foreground">
            {lesson.duration_minutes}min · {lesson.xp_points}XP
          </span>
        </div>

        <div className="flex gap-1 opacity-0 group-hover:opacity-100 transition-opacity">
          {lesson.type === 'TEXT' && (
            <Button
              variant="ghost"
              size="icon"
              className="h-7 w-7"
              onClick={(e) => {
                e.stopPropagation();
                onAddContent(lesson.id);
              }}
              title="Add Content"
            >
              <BookOpen className="h-3.5 w-3.5" />
            </Button>
          )}
          {lesson.type === 'QUIZ' && (
            <Button
              variant="ghost"
              size="icon"
              className="h-7 w-7"
              onClick={(e) => {
                e.stopPropagation();
                onAddQuiz(lesson.id, (lesson.quiz_count ?? 0) + 1);
              }}
              title="Add Quiz"
            >
              <Plus className="h-3.5 w-3.5" />
            </Button>
          )}
          <Button
            variant="ghost"
            size="icon"
            className="h-7 w-7"
            onClick={(e) => {
              e.stopPropagation();
              onEdit(lesson);
            }}
            title="Edit Lesson"
          >
            <Pencil className="h-3.5 w-3.5" />
          </Button>
          <Button
            variant="ghost"
            size="icon"
            className="h-7 w-7 text-destructive hover:text-destructive"
            onClick={(e) => {
              e.stopPropagation();
              onDelete(lesson);
            }}
            title="Delete Lesson"
          >
            <Trash2 className="h-3.5 w-3.5" />
          </Button>
        </div>
      </div>

      {/* Expanded children */}
      {isExpanded && (
        <div className="ml-12 space-y-1 py-1">
          {isLoading && (
            <div className="flex items-center gap-2 py-1 px-3 text-xs text-muted-foreground">
              <Loader2 className="h-3 w-3 animate-spin" /> Loading content…
            </div>
          )}

          {isError && (
            <div className="flex items-center gap-3 py-1 px-3 text-xs text-muted-foreground">
              Failed to load content.
              <Button
                variant="outline"
                size="sm"
                onClick={() => {
                  refetchContents();
                  refetchQuestions();
                }}
              >
                Retry
              </Button>
            </div>
          )}

          {!isLoading &&
            !isError &&
            contents.map((lc) => (
              <ContentItem
                key={lc.id}
                lc={lc}
                onEdit={onEditContent}
                onDelete={onDeleteContent}
              />
            ))}

          {!isLoading &&
            !isError &&
            questions.map((q) => (
              <QuizItem
                key={q.id}
                quiz={q}
                options={q.options ?? []}
                onEdit={onEditQuiz}
                onDelete={onDeleteQuiz}
              />
            ))}

          {!isLoading &&
            !isError &&
            contents.length === 0 &&
            questions.length === 0 && (
              <p className="text-xs text-muted-foreground py-1 px-3">
                No content yet
              </p>
            )}
        </div>
      )}
    </div>
  );
});

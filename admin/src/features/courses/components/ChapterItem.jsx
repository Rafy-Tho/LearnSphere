import { memo } from 'react';
import {
  ChevronDown,
  ChevronRight,
  Loader2,
  Pencil,
  Plus,
  Trash2,
} from 'lucide-react';
import { StatusBadge } from '@/components/common/StatusBadge';
import { Button } from '@/components/ui/button';
import {
  Collapsible,
  CollapsibleContent,
  CollapsibleTrigger,
} from '@/components/ui/collapsible';
import { useChapterLessons } from '@/features/courses/hooks';
import { LessonItem } from './LessonItem';

export const ChapterItem = memo(function ChapterItem({
  courseId,
  chapter,
  isExpanded,
  expandedLessons,
  onToggle,
  onAddLesson,
  onEdit,
  onDelete,
  onToggleLesson,
  onAddContent,
  onAddQuiz,
  onEditLesson,
  onDeleteLesson,
  onEditContent,
  onDeleteContent,
  onEditQuiz,
  onDeleteQuiz,
}) {
  const { lessons, isLoading, isError, refetch } = useChapterLessons(
    courseId,
    chapter.id,
    isExpanded,
  );

  return (
    <Collapsible open={isExpanded} onOpenChange={onToggle}>
      <CollapsibleTrigger asChild>
        <div className="flex items-center gap-3 py-3 px-3 cursor-pointer hover:bg-accent/20 rounded-lg mt-2 transition-colors">
          {isExpanded ? (
            <ChevronDown className="h-3.5 w-3.5" />
          ) : (
            <ChevronRight className="h-3.5 w-3.5" />
          )}
          <div className="flex-1 min-w-0 flex items-center gap-2">
            <span className="text-xs font-medium text-accent-foreground bg-accent rounded px-2 py-0.5">
              Ch {chapter.position}
            </span>
            <span className="font-medium text-foreground text-sm">
              {chapter.name}
            </span>
            <StatusBadge status={chapter.status} />
          </div>
          <span className="text-xs text-muted-foreground whitespace-nowrap">
            {chapter.lesson_count} lessons
          </span>
          <div className="flex gap-1">
            <Button
              variant="ghost"
              size="icon"
              className="h-7 w-7"
              onClick={(e) => {
                e.stopPropagation();
                onAddLesson(chapter.id);
              }}
              title="Add Lesson"
            >
              <Plus className="h-3.5 w-3.5" />
            </Button>
            <Button
              variant="ghost"
              size="icon"
              className="h-7 w-7"
              onClick={(e) => {
                e.stopPropagation();
                onEdit(chapter);
              }}
              title="Edit Chapter"
            >
              <Pencil className="h-3.5 w-3.5" />
            </Button>
            <Button
              variant="ghost"
              size="icon"
              className="h-7 w-7 text-destructive hover:text-destructive"
              onClick={(e) => {
                e.stopPropagation();
                onDelete(chapter);
              }}
              title="Delete Chapter"
            >
              <Trash2 className="h-3.5 w-3.5" />
            </Button>
          </div>
        </div>
      </CollapsibleTrigger>

      <CollapsibleContent>
        <div className="ml-8 space-y-1 pb-2">
          {isLoading && (
            <div className="flex items-center gap-2 py-2 px-3 text-xs text-muted-foreground">
              <Loader2 className="h-3 w-3 animate-spin" /> Loading lessons…
            </div>
          )}

          {isError && (
            <div className="flex items-center gap-3 py-2 px-3 text-xs text-muted-foreground">
              Failed to load lessons.
              <Button variant="outline" size="sm" onClick={() => refetch()}>
                Retry
              </Button>
            </div>
          )}

          {!isLoading &&
            !isError &&
            lessons.map((lesson) => (
              <LessonItem
                key={lesson.id}
                courseId={courseId}
                lesson={lesson}
                isExpanded={expandedLessons.has(lesson.id)}
                onToggle={() => onToggleLesson(lesson.id)}
                onAddContent={onAddContent}
                onAddQuiz={onAddQuiz}
                onEdit={onEditLesson}
                onDelete={onDeleteLesson}
                onEditContent={onEditContent}
                onDeleteContent={onDeleteContent}
                onEditQuiz={onEditQuiz}
                onDeleteQuiz={onDeleteQuiz}
              />
            ))}

          {!isLoading && !isError && lessons.length === 0 && (
            <p className="text-xs text-muted-foreground py-2 px-3">
              No lessons yet
            </p>
          )}
        </div>
      </CollapsibleContent>
    </Collapsible>
  );
});

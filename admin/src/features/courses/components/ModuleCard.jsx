import { memo } from 'react';
import {
  ChevronDown,
  ChevronRight,
  GripVertical,
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
import { useModuleChapters } from '@/features/courses/hooks';
import { ChapterItem } from './ChapterItem';

export const ModuleCard = memo(function ModuleCard({
  courseId,
  module,
  isExpanded,
  expandedChapters,
  expandedLessons,
  onToggle,
  onAddChapter,
  onEdit,
  onDelete,
  onToggleChapter,
  onAddLesson,
  onToggleLesson,
  onAddContent,
  onAddQuiz,
  onEditChapter,
  onDeleteChapter,
  onEditLesson,
  onDeleteLesson,
  onEditContent,
  onDeleteContent,
  onEditQuiz,
  onDeleteQuiz,
}) {
  const { chapters, isLoading, isError, refetch } = useModuleChapters(
    courseId,
    module.id,
    isExpanded,
  );

  return (
    <div className="glass-card rounded-xl overflow-hidden">
      <Collapsible open={isExpanded} onOpenChange={() => onToggle(module.id)}>
        <CollapsibleTrigger asChild>
          <div className="flex items-center gap-3 p-4 cursor-pointer hover:bg-accent/30 transition-colors">
            <GripVertical className="h-4 w-4 text-muted-foreground" />
            {isExpanded ? (
              <ChevronDown className="h-4 w-4" />
            ) : (
              <ChevronRight className="h-4 w-4" />
            )}
            <div className="flex-1 min-w-0">
              <div className="flex items-center gap-2">
                <span className="text-xs font-medium text-primary bg-primary/10 rounded px-2 py-0.5">
                  Module {module.position}
                </span>
                <span className="font-semibold text-foreground">
                  {module.name}
                </span>
                <StatusBadge status={module.status} />
              </div>
              {module.description && (
                <p className="text-sm text-muted-foreground mt-1">
                  {module.description}
                </p>
              )}
            </div>
            <span className="text-xs text-muted-foreground whitespace-nowrap">
              {module.chapter_count} chapters · {module.lesson_count} lessons
            </span>
            <div className="flex gap-1">
              <Button
                variant="ghost"
                size="icon"
                onClick={(e) => {
                  e.stopPropagation();
                  onAddChapter(module.id);
                }}
                title="Add Chapter"
              >
                <Plus className="h-4 w-4" />
              </Button>
              <Button
                variant="ghost"
                size="icon"
                onClick={(e) => {
                  e.stopPropagation();
                  onEdit(module);
                }}
                title="Edit Module"
              >
                <Pencil className="h-4 w-4" />
              </Button>
              <Button
                variant="ghost"
                size="icon"
                onClick={(e) => {
                  e.stopPropagation();
                  onDelete(module);
                }}
                className="text-destructive hover:text-destructive"
                title="Delete Module"
              >
                <Trash2 className="h-4 w-4" />
              </Button>
            </div>
          </div>
        </CollapsibleTrigger>

        <CollapsibleContent>
          <div className="border-t border-border ml-11 mr-4 mb-4">
            {isLoading && (
              <div className="flex items-center gap-2 py-4 px-3 text-sm text-muted-foreground">
                <Loader2 className="h-3.5 w-3.5 animate-spin" /> Loading chapters…
              </div>
            )}

            {isError && (
              <div className="flex items-center gap-3 py-4 px-3 text-sm text-muted-foreground">
                Failed to load chapters.
                <Button variant="outline" size="sm" onClick={() => refetch()}>
                  Retry
                </Button>
              </div>
            )}

            {!isLoading &&
              !isError &&
              chapters.map((ch) => (
                <ChapterItem
                  key={ch.id}
                  courseId={courseId}
                  chapter={ch}
                  isExpanded={expandedChapters.has(ch.id)}
                  expandedLessons={expandedLessons}
                  onToggle={onToggleChapter}
                  onAddLesson={onAddLesson}
                  onEdit={onEditChapter}
                  onDelete={onDeleteChapter}
                  onToggleLesson={onToggleLesson}
                  onAddContent={onAddContent}
                  onAddQuiz={onAddQuiz}
                  onEditLesson={onEditLesson}
                  onDeleteLesson={onDeleteLesson}
                  onEditContent={onEditContent}
                  onDeleteContent={onDeleteContent}
                  onEditQuiz={onEditQuiz}
                  onDeleteQuiz={onDeleteQuiz}
                />
              ))}

            {!isLoading && !isError && chapters.length === 0 && (
              <p className="text-sm text-muted-foreground py-4 px-3">
                No chapters yet. Click + to add one.
              </p>
            )}
          </div>
        </CollapsibleContent>
      </Collapsible>
    </div>
  );
});

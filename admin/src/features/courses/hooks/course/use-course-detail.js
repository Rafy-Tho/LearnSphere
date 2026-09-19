import { useChapterCrud } from '../content/use-chapter-crud';
import { useContentCrud } from '../content/use-content-crud';
import { useDeleteDialog } from '../common/use-delete-dialog';
import { useExpandCollapse } from '../common/use-expand-collapse';
import { useLessonCrud } from '../content/use-lesson-crud';
import { useModuleCrud } from '../content/use-module-crud';
import { useObjectiveActions } from '../objective/use-objective-actions';
import { useQuizCrud } from '../quiz/use-quiz-crud';

export function useCourseDetail({ objectives }) {
  const expand = useExpandCollapse();

  const objective = useObjectiveActions({ objectives });

  const moduleCrud = useModuleCrud();
  const chapterCrud = useChapterCrud();
  const lessonCrud = useLessonCrud();
  const contentCrud = useContentCrud();
  const quizCrud = useQuizCrud();

  const deleteDialog = useDeleteDialog({
    onDeleteObjective: objective.remove,
    onDeleteModule: moduleCrud.remove,
    onDeleteChapter: chapterCrud.remove,
    onDeleteLesson: lessonCrud.remove,
    onDeleteContent: contentCrud.remove,
    onDeleteQuiz: quizCrud.remove,
  });

  return {
    // Expand / collapse
    ...expand,
    // Objectives
    objective,
    // CRUD modals (modal state + handlers)
    moduleCrud,
    chapterCrud,
    lessonCrud,
    contentCrud,
    quizCrud,
    // Delete dialog
    deleteDialog,
  };
}

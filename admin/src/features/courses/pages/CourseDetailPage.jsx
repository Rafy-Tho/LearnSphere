import { useCallback } from 'react';
import { Plus } from 'lucide-react';
import { useNavigate, useParams } from 'react-router-dom';
import { ChapterModal } from '@/features/courses/components/ChapterModal';
import { ContentModal } from '@/features/courses/components/ContentModal';
import { CourseHeader } from '@/features/courses/components/CourseHeader';
import { ConfirmDialog } from '@/components/common/ConfirmDialog';
import { LessonModal } from '@/features/courses/components/LessonModal';
import { ModuleCard } from '@/features/courses/components/ModuleCard';
import { ModuleModal } from '@/features/courses/components/ModuleModal';
import { ObjectivesCard } from '@/features/courses/components/ObjectivesCard';
import { QuizModal } from '@/features/courses/components/QuizModal';
import { ErrorState } from '@/components/common/ErrorState';
import { Button } from '@/components/ui/button';
import { CourseDetailPageSkeleton } from '@/components/ui/skeleton';
import {
  Tabs,
  TabsContent,
  TabsList,
  TabsTrigger,
} from '@/components/ui/tabs';
import { AnalyticsTab } from '@/features/instructor/components/AnalyticsTab';
import { CertificatesTab } from '@/features/instructor/components/CertificatesTab';
import { ReviewsTab } from '@/features/instructor/components/ReviewsTab';
import { StudentsTab } from '@/features/instructor/components/StudentsTab';
import { useCourseDetail, useCourseSummary } from '@/features/courses/hooks';

export default function CourseDetailPage() {
  const { courseId } = useParams();
  const navigate = useNavigate();
  const { data, isLoading, isError, error } = useCourseSummary(courseId);

  const course = data?.course ?? {};
  const objectives = data?.objectives ?? [];
  const modules = data?.modules ?? [];

  const {
    expandedModules,
    expandedChapters,
    expandedLessons,
    toggleModule,
    toggleChapter,
    toggleLesson,
    objective,
    moduleCrud,
    chapterCrud,
    lessonCrud,
    contentCrud,
    quizCrud,
    deleteDialog,
  } = useCourseDetail({ objectives });

  const confirmDelete = deleteDialog.confirm;
  const handleDeleteModule = useCallback(
    (m) => confirmDelete('module', m.id, m.name),
    [confirmDelete],
  );
  const handleDeleteChapter = useCallback(
    (ch) => confirmDelete('chapter', ch.id, ch.name),
    [confirmDelete],
  );
  const handleDeleteLesson = useCallback(
    (l) => confirmDelete('lesson', l.id, l.name),
    [confirmDelete],
  );
  const handleDeleteContent = useCallback(
    (lc) => confirmDelete('content', lc.id, lc.name),
    [confirmDelete],
  );
  const handleDeleteQuiz = useCallback(
    (q) => confirmDelete('quiz', q.id, q.question.slice(0, 30)),
    [confirmDelete],
  );
  const handleDeleteObjective = useCallback(
    (o) => confirmDelete('objective', o.id, o.content),
    [confirmDelete],
  );

  if (isLoading) return <CourseDetailPageSkeleton />;
  if (isError) return <ErrorState message={error?.message} />;
  if (Object.keys(course).length === 0) {
    return (
      <div className="text-center py-12">
        <p className="text-muted-foreground">Course not found</p>
        <Button
          variant="outline"
          onClick={() => navigate('/courses')}
          className="mt-4"
        >
          Back to Courses
        </Button>
      </div>
    );
  }

  return (
    <div className="space-y-6">
      <CourseHeader
        course={course}
        onBack={() => navigate('/courses')}
        onAddModule={moduleCrud.openCreate}
      />

      <Tabs defaultValue="curriculum" className="space-y-6">
        <TabsList className="flex-wrap">
          <TabsTrigger value="curriculum">Curriculum</TabsTrigger>
          <TabsTrigger value="students">Students</TabsTrigger>
          <TabsTrigger value="analytics">Analytics</TabsTrigger>
          <TabsTrigger value="reviews">Reviews</TabsTrigger>
          <TabsTrigger value="certificates">Certificates</TabsTrigger>
        </TabsList>

        <TabsContent value="curriculum" className="space-y-6">
          <ObjectivesCard
            objectives={objectives}
            editingIdx={objective.editingIdx}
            objectiveDraft={objective.draft}
            isUpdating={objective.isUpdating}
            addingObjective={objective.adding}
            newObjective={objective.newText}
            isCreating={objective.isCreating}
            onStartEdit={objective.startEdit}
            onSaveEdit={objective.saveEdit}
            onCancelEdit={objective.cancelEdit}
            onDraftChange={objective.setDraft}
            onEditKeyDown={objective.editKeyDown}
            onDeleteObjective={handleDeleteObjective}
            onStartAdd={objective.startAdd}
            onNewObjectiveChange={objective.setNewText}
            onAddObjective={objective.confirmAdd}
            onCancelAdd={objective.cancelAdd}
            onAddKeyDown={objective.addKeyDown}
          />

          <div className="space-y-3">
            {modules.map((mod) => (
              <ModuleCard
                key={mod.id}
                courseId={courseId}
                module={mod}
                isExpanded={expandedModules.has(mod.id)}
                expandedChapters={expandedChapters}
                expandedLessons={expandedLessons}
                onToggle={toggleModule}
                onAddChapter={chapterCrud.openCreate}
                onEdit={moduleCrud.openEdit}
                onDelete={handleDeleteModule}
                onToggleChapter={toggleChapter}
                onAddLesson={lessonCrud.openCreate}
                onToggleLesson={toggleLesson}
                onAddContent={contentCrud.openCreate}
                onAddQuiz={quizCrud.openCreate}
                onEditChapter={chapterCrud.openEdit}
                onDeleteChapter={handleDeleteChapter}
                onEditLesson={lessonCrud.openEdit}
                onDeleteLesson={handleDeleteLesson}
                onEditContent={contentCrud.openEdit}
                onDeleteContent={handleDeleteContent}
                onEditQuiz={quizCrud.openEdit}
                onDeleteQuiz={handleDeleteQuiz}
              />
            ))}

            {modules.length === 0 && (
              <div className="glass-card rounded-xl p-12 text-center">
                <p className="text-muted-foreground">
                  No modules yet. Start building your course structure.
                </p>
                <Button onClick={moduleCrud.openCreate} className="mt-4 gap-2">
                  <Plus className="h-4 w-4" /> Add First Module
                </Button>
              </div>
            )}
          </div>
        </TabsContent>

        <TabsContent value="students">
          <StudentsTab courseId={courseId} />
        </TabsContent>

        <TabsContent value="analytics">
          <AnalyticsTab courseId={courseId} />
        </TabsContent>

        <TabsContent value="reviews">
          <ReviewsTab courseId={courseId} />
        </TabsContent>

        <TabsContent value="certificates">
          <CertificatesTab courseId={courseId} />
        </TabsContent>
      </Tabs>

      {/* Modals */}
      <ModuleModal
        open={moduleCrud.modal}
        onOpenChange={moduleCrud.setModal}
        form={moduleCrud.form}
        onChange={moduleCrud.onChange}
        onSave={moduleCrud.save}
        isEditing={!!moduleCrud.editing}
        isUpdating={moduleCrud.isUpdating}
        isCreating={moduleCrud.isCreating}
      />
      <ChapterModal
        open={chapterCrud.modal}
        onOpenChange={chapterCrud.setModal}
        form={chapterCrud.form}
        onChange={chapterCrud.onChange}
        onSave={chapterCrud.save}
        isEditing={!!chapterCrud.editing}
        isUpdating={chapterCrud.isUpdating}
        isCreating={chapterCrud.isCreating}
      />
      <LessonModal
        open={lessonCrud.modal}
        onOpenChange={lessonCrud.setModal}
        form={lessonCrud.form}
        onChange={lessonCrud.onChange}
        onSave={lessonCrud.save}
        isEditing={!!lessonCrud.editing}
        isUpdating={lessonCrud.isUpdating}
        isCreating={lessonCrud.isCreating}
      />
      <ContentModal
        open={contentCrud.modal}
        onOpenChange={contentCrud.setModal}
        form={contentCrud.form}
        onChange={contentCrud.onChange}
        onSave={contentCrud.save}
        isEditing={!!contentCrud.editing}
        isUpdating={contentCrud.isUpdating}
        isCreating={contentCrud.isCreating}
      />
      <QuizModal
        open={quizCrud.modal}
        onOpenChange={quizCrud.setModal}
        quizForm={quizCrud.quizForm}
        onQuizChange={quizCrud.onQuizChange}
        optionsForm={quizCrud.optionsForm}
        onOptionChange={quizCrud.onOptionChange}
        onAddOption={quizCrud.addOption}
        onRemoveOption={quizCrud.removeOption}
        onSave={quizCrud.save}
        isEditing={!!quizCrud.editing}
        isLoading={quizCrud.isLoading}
      />

      <ConfirmDialog
        open={!!deleteDialog.deleteDialog}
        title={`Delete ${deleteDialog.deleteDialog?.type}?`}
        description={`Are you sure you want to delete "${deleteDialog.deleteDialog?.name}"? This will also delete all nested items. This action cannot be undone.`}
        onConfirm={deleteDialog.execute}
        onCancel={deleteDialog.cancel}
      />
    </div>
  );
}

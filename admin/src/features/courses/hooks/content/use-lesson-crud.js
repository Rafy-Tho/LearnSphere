import { useState } from 'react';
import { useLessonActions } from './use-lesson-actions';
import { toast } from '@/hooks/use-toast';

const DEFAULT_FORM = {
  name: '',
  description: '',
  position: '',
};

export function useLessonCrud({
  setLessons,
  setQuizzes,
  setLessonContents,
  setQuizOptions,
  setChapters,
  chapters,
  quizzes,
}) {
  const [modal, setModal] = useState(false);
  const [editing, setEditing] = useState(null);
  const [parentId, setParentId] = useState('');
  const [form, setForm] = useState(DEFAULT_FORM);
  const { createLesson, updateLesson, deleteLesson, isCreating, isUpdating } = useLessonActions();

  const openCreate = (chapterId) => {
    setParentId(chapterId);
    setEditing(null);
    setForm(DEFAULT_FORM);
    setModal(true);
  };

  const openEdit = (lesson) => {
    setParentId(lesson.chapter_id);
    setEditing(lesson);
    setForm({
      name: lesson.name,
      description: lesson.description || '',
      position: lesson.position,
    });
    setModal(true);
  };

  const save = async () => {
    if (!form.name) return;
    if (editing) {
      try {
        await updateLesson({
          id: editing.id,
          data: { ...form },
        });
        setLessons((ls) =>
          ls.map((l) =>
            l.id === editing.id ? { ...l, ...form } : l,
          ),
        );
        toast({
          title: 'Lesson updated',
          description: 'Lesson has been updated successfully',
        });
      } catch (error) {
        toast({
          title: 'Lesson update failed',
          description: error?.message || 'Lesson could not be updated',
          variant: 'destructive',
        });
      } finally {
        setModal(false);
      }
    } else {
      try {
        const response = await createLesson({
          id: parentId,
          data: { ...form },
        });
        setLessons((ls) => [...ls, response]);
        toast({
          title: 'Lesson created',
          description: 'Lesson has been created successfully',
        });
      } catch (error) {
        toast({
          title: 'Lesson creation failed',
          description: error?.message || 'Lesson could not be created',
          variant: 'destructive',
        });
      } finally {
        setModal(false);
      }
    }
  };

  const onChange = (field, value) => setForm((f) => ({ ...f, [field]: value }));
  const remove = async (id) => {
    try {
      await deleteLesson(id);
      const quizIds = quizzes
        .filter((q) => q.lesson_id === id)
        .map((q) => q.id);
      setQuizOptions((os) => os.filter((o) => !quizIds.includes(o.quiz_id)));
      setQuizzes((qs) => qs.filter((q) => q.lesson_id !== id));
      setLessonContents((cs) => cs.filter((c) => c.lesson_id !== id));
      setLessons((ls) => ls.filter((l) => l.id !== id));
      toast({
        title: 'Lesson deleted',
        description: 'Lesson has been deleted successfully',
      });
    } catch (err) {
      toast({
        title: 'Error',
        description: err.message || 'Failed to delete lesson',
        variant: 'destructive',
      });
    }
  };
  return {
    modal,
    setModal,
    editing,
    form,
    onChange,
    openCreate,
    openEdit,
    save,
    remove,
    isCreating,
    isUpdating,
  };
}

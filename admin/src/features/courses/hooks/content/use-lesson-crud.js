import { useCallback, useState } from 'react';
import { useLessonActions } from './use-lesson-actions';
import { toast } from '@/hooks/use-toast';

const DEFAULT_FORM = {
  name: '',
  description: '',
  position: '',
};

export function useLessonCrud() {
  const [modal, setModal] = useState(false);
  const [editing, setEditing] = useState(null);
  const [parentId, setParentId] = useState('');
  const [form, setForm] = useState(DEFAULT_FORM);
  const { createLesson, updateLesson, deleteLesson, isCreating, isUpdating } =
    useLessonActions();

  const openCreate = useCallback((chapterId) => {
    setParentId(chapterId);
    setEditing(null);
    setForm(DEFAULT_FORM);
    setModal(true);
  }, []);

  const openEdit = useCallback((lesson) => {
    setParentId(lesson.chapter_id);
    setEditing(lesson);
    setForm({
      name: lesson.name,
      description: lesson.description || '',
      position: lesson.position,
    });
    setModal(true);
  }, []);

  const save = async () => {
    if (!form.name) return;
    if (editing) {
      try {
        await updateLesson({ id: editing.id, data: { ...form } });
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
        await createLesson({ id: parentId, data: { ...form } });
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

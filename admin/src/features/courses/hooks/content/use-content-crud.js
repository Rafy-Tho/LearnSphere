import { useState } from 'react';
import { useContentActions } from './use-content-actions';
import { toast } from '@/hooks/use-toast';

const DEFAULT_FORM = { name: '', content: '', position: '' };

export function useContentCrud() {
  const [modal, setModal] = useState(false);
  const [editing, setEditing] = useState(null);
  const [parentId, setParentId] = useState('');
  const [form, setForm] = useState(DEFAULT_FORM);
  const { createContent, updateContent, deleteContent, isCreating, isUpdating } =
    useContentActions();

  const openCreate = (lessonId) => {
    setParentId(lessonId);
    setEditing(null);
    setForm(DEFAULT_FORM);
    setModal(true);
  };

  const openEdit = (lc) => {
    setParentId(lc.lesson_id);
    setEditing(lc);
    setForm({ name: lc.name, content: lc.content, position: lc.position });
    setModal(true);
  };

  const save = async () => {
    if (!form.name || !form.content) return;
    if (editing) {
      try {
        await updateContent({
          id: editing.id,
          data: {
            name: form.name,
            content: form.content,
            position: form.position,
          },
        });
        toast({
          title: 'Success',
          description: 'The content has been updated successfully.',
        });
      } catch (error) {
        toast({
          title: 'Error',
          description: error?.message || 'Failed to update content',
          variant: 'destructive',
        });
      } finally {
        setModal(false);
      }
    } else {
      try {
        await createContent({
          id: parentId,
          data: {
            name: form.name,
            content: form.content,
            position: form.position,
          },
        });
        toast({
          title: 'Success',
          description: 'The content has been created successfully.',
        });
      } catch (error) {
        toast({
          title: 'Error',
          description: error?.message || 'Failed to create content',
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
      await deleteContent(id);
      toast({
        title: 'Success',
        description: 'The content has been deleted successfully.',
      });
    } catch (error) {
      toast({
        title: 'Error',
        description: error?.message || 'Failed to delete content',
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

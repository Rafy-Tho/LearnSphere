import { useState } from 'react';
import { useChapterActions } from './use-chapter-actions';
import { toast } from '@/hooks/use-toast';

const DEFAULT_FORM = {
  name: '',
  description: '',
  status: 'DRAFT',
  position: '',
};

export function useChapterCrud() {
  const [modal, setModal] = useState(false);
  const [editing, setEditing] = useState(null);
  const [parentId, setParentId] = useState('');
  const [form, setForm] = useState(DEFAULT_FORM);
  const { createChapter, updateChapter, deleteChapter, isCreating, isUpdating } =
    useChapterActions();

  const openCreate = (moduleId) => {
    setParentId(moduleId);
    setEditing(null);
    setForm(DEFAULT_FORM);
    setModal(true);
  };

  const openEdit = (ch) => {
    setParentId(ch.module_id);
    setEditing(ch);
    setForm({
      name: ch.name,
      description: ch.description || '',
      status: ch.status,
      position: ch.position,
    });
    setModal(true);
  };

  const save = async () => {
    if (!form.name) return;
    if (editing) {
      try {
        await updateChapter({
          id: editing.id,
          data: {
            name: form.name,
            description: form.description,
            status: form.status,
            position: form.position,
          },
        });
        toast({
          title: 'Chapter updated',
          description: 'Chapter has been updated successfully',
        });
      } catch (error) {
        toast({
          title: 'Chapter update failed',
          description: error?.message || 'Chapter could not be updated',
          variant: 'destructive',
        });
      } finally {
        setModal(false);
      }
    } else {
      try {
        await createChapter({
          id: parentId,
          data: {
            name: form.name,
            description: form.description,
            status: form.status,
            position: form.position,
          },
        });
        toast({
          title: 'Chapter created',
          description: 'Chapter has been created successfully',
        });
      } catch (error) {
        toast({
          title: 'Chapter creation failed',
          description: error?.message || 'Chapter could not be created',
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
      await deleteChapter(id);
      toast({
        title: 'Chapter deleted',
        description: 'Chapter has been deleted successfully',
      });
    } catch (err) {
      toast({
        title: 'Error',
        description: err.message || 'Failed to delete chapter',
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

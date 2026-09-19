import { useCallback, useState } from 'react';
import { useModuleActions } from './use-module-actions';
import { toast } from '@/hooks/use-toast';

const DEFAULT_FORM = {
  name: '',
  description: '',
  status: 'DRAFT',
  position: '',
};

export function useModuleCrud() {
  const [modal, setModal] = useState(false);
  const [editing, setEditing] = useState(null);
  const [form, setForm] = useState(DEFAULT_FORM);
  const { createModule, updateModule, deleteModule, isCreating, isUpdating } =
    useModuleActions();

  const openCreate = useCallback(() => {
    setEditing(null);
    setForm(DEFAULT_FORM);
    setModal(true);
  }, []);

  const openEdit = useCallback((m) => {
    setEditing(m);
    setForm({
      name: m.name,
      description: m.description || '',
      status: m.status,
      position: m.position,
    });
    setModal(true);
  }, []);

  const save = async () => {
    if (!form.name) return;
    if (editing) {
      try {
        await updateModule({ id: editing.id, data: { ...form } });
        toast({
          title: 'Success',
          description: 'Module updated successfully',
        });
      } catch (err) {
        toast({
          title: 'Error',
          description: err?.message || 'Failed to update module',
          variant: 'destructive',
        });
      } finally {
        setModal(false);
      }
    } else {
      try {
        await createModule(form);
        toast({
          title: 'Success',
          description: 'Module created successfully',
        });
      } catch (err) {
        toast({
          title: 'Error',
          description: err?.message || 'Failed to create module',
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
      await deleteModule(id);
      toast({ title: 'Success', description: 'Module deleted' });
    } catch (err) {
      toast({
        title: 'Error',
        description: err.message || 'Failed to delete module',
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

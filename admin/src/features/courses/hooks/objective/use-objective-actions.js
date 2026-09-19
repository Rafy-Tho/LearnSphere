import { useState } from 'react';
import { useMutation, useQueryClient } from '@tanstack/react-query';
import { useParams } from 'react-router-dom';
import { coursesApi } from '@/features/courses/services/courses';
import { objectivesApi } from '@/features/courses/services/objectives';
import { queryKeys } from '@/lib/queryKeys';
import { toast } from '@/hooks/use-toast';

export function useObjectiveActions({ objectives = [] }) {
  const queryClient = useQueryClient();
  const { courseId } = useParams();

  const [editingIdx, setEditingIdx] = useState(null);
  const [draft, setDraft] = useState('');
  const [adding, setAdding] = useState(false);
  const [newText, setNewText] = useState('');

  const invalidate = () => {
    queryClient.invalidateQueries({
      queryKey: queryKeys.courseSummary(courseId),
    });
  };

  const { mutateAsync: createObjective, isPending: isCreating } = useMutation({
    mutationFn: ({ objectiveData }) =>
      coursesApi.createObjective(courseId, objectiveData),
    onSuccess: invalidate,
  });

  const { mutateAsync: updateObjective, isPending: isUpdating } = useMutation({
    mutationFn: ({ objectiveId, objectiveData }) =>
      objectivesApi.update(objectiveId, objectiveData),
    onSuccess: invalidate,
  });

  const { mutateAsync: deleteObjective, isPending: isDeleting } = useMutation({
    mutationFn: (objectiveId) => objectivesApi.delete(objectiveId),
    onSuccess: invalidate,
  });

  const startEdit = (idx, content) => {
    setEditingIdx(idx);
    setDraft(content);
  };

  const cancelEdit = () => {
    setEditingIdx(null);
    setDraft('');
  };

  const saveEdit = async (idx) => {
    const objective = objectives[idx];
    if (!objective || !draft.trim()) return;
    try {
      await updateObjective({
        objectiveId: objective.id,
        objectiveData: { content: draft, position: objective.position },
      });
      setEditingIdx(null);
      setDraft('');
    } catch (err) {
      toast({
        title: 'Failed to update objective',
        description: err?.message || 'Objective could not be updated',
        variant: 'destructive',
      });
    }
  };

  const editKeyDown = (e, idx) => {
    if (e.key === 'Enter') {
      e.preventDefault();
      saveEdit(idx);
    }
    if (e.key === 'Escape') cancelEdit();
  };

  const startAdd = () => setAdding(true);

  const cancelAdd = () => {
    setAdding(false);
    setNewText('');
  };

  const confirmAdd = async () => {
    if (!newText.trim()) return;
    try {
      await createObjective({
        objectiveData: {
          content: newText,
          position: objectives.length + 1,
        },
      });
      setNewText('');
      setAdding(false);
    } catch (err) {
      toast({
        title: 'Failed to add objective',
        description: err?.message || 'Objective could not be created',
        variant: 'destructive',
      });
    }
  };

  const addKeyDown = (e) => {
    if (e.key === 'Enter') {
      e.preventDefault();
      confirmAdd();
    }
    if (e.key === 'Escape') cancelAdd();
  };

  const remove = async (id) => {
    try {
      await deleteObjective(id);
    } catch (err) {
      toast({
        title: 'Failed to delete objective',
        description: err?.message || 'Objective could not be deleted',
        variant: 'destructive',
      });
    }
  };

  return {
    editingIdx,
    draft,
    isUpdating,
    adding,
    newText,
    isCreating,
    isDeleting,
    startEdit,
    saveEdit,
    cancelEdit,
    setDraft,
    editKeyDown,
    startAdd,
    setNewText,
    confirmAdd,
    cancelAdd,
    addKeyDown,
    remove,
  };
}

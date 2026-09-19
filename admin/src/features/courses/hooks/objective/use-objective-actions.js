import { useMutation } from '@tanstack/react-query';
import { coursesApi } from '@/features/courses/services/courses';

export function useObjectiveActions() {
  const { mutateAsync: createObjective, isPending: isCreating } = useMutation({
    mutationFn: ({ objectiveData }) => coursesApi.createObjective(objectiveData),
  });

  const { mutateAsync: updateObjective, isPending: isUpdating } = useMutation({
    mutationFn: ({ objectiveId, objectiveData }) =>
      coursesApi.updateObjective(objectiveId, objectiveData),
  });

  const { mutateAsync: deleteObjective, isPending: isDeleting } = useMutation({
    mutationFn: (objectiveId) => coursesApi.deleteObjective(objectiveId),
  });

  return {
    createObjective,
    updateObjective,
    deleteObjective,
    isCreating,
    isUpdating,
    isDeleting,
  };
}

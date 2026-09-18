import { useMutation, useQueryClient } from '@tanstack/react-query';
import { useParams } from 'react-router-dom';
import { objectivesApi } from '@/features/courses/services/objectives';

export const useDeleteObjective = () => {
  const queryClient = useQueryClient();
  const param = useParams();
  const courseId = param.courseId;
  const { mutateAsync: deleteObjective, isPending: isDeleting } = useMutation({
    mutationKey: ['delete-objective'],
    mutationFn: (id) => objectivesApi.delete(id),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['course-details', courseId] });
    },
  });
  return { deleteObjective, isDeleting };
};

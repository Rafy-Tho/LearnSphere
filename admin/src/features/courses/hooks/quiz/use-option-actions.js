import { useMutation, useQueryClient } from '@tanstack/react-query';
import { useParams } from 'react-router-dom';
import { optionsApi } from '@/features/courses/services/options';
import { questionsApi } from '@/features/courses/services/questions';
import { queryKeys } from '@/lib/queryKeys';

export function useOptionActions() {
  const queryClient = useQueryClient();
  const { courseId } = useParams();

  const invalidate = () => {
    queryClient.invalidateQueries({
      queryKey: queryKeys.lessonQuestionsRoot(courseId),
    });
  };

  const { mutateAsync: createOption, isPending: isCreating } = useMutation({
    mutationFn: ({ id, data }) => questionsApi.createOption(id, data),
    onSuccess: invalidate,
  });

  const { mutateAsync: updateOption, isPending: isUpdating } = useMutation({
    mutationFn: ({ id, data }) => optionsApi.update(id, data),
    onSuccess: invalidate,
  });

  const { mutateAsync: deleteOption, isPending: isDeleting } = useMutation({
    mutationFn: (id) => optionsApi.delete(id),
    onSuccess: invalidate,
  });

  return {
    createOption,
    updateOption,
    deleteOption,
    isCreating,
    isUpdating,
    isDeleting,
  };
}

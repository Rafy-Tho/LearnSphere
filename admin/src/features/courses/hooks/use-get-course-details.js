import { useQuery } from '@tanstack/react-query';
import { useParams } from 'react-router-dom';
import { coursesApi } from '@/features/courses/services/courses';

export function useGetCourseDetails() {
  const param = useParams();
  const courseId = param.courseId;
  const { data, isLoading, error } = useQuery({
    queryKey: ['course-details', courseId],
    queryFn: () => coursesApi.getCourseDetails(courseId),
    enabled: !!courseId,
  });
  return { data, isLoading, error };
}

import { keepPreviousData, useQuery } from "@tanstack/react-query";
import { useParams } from "react-router-dom";
import { coursesApi } from "@/features/catalog/services/courses";
import { queryKeys } from "@/lib/queryKeys";
import parseQueryToObject from "@/utils/parseQueryToObject";

export function useCourses(params) {
  const queryObject = parseQueryToObject(params);
  return useQuery({
    queryKey: queryKeys.courses(queryObject),
    queryFn: ({ signal }) => coursesApi.getAll(queryObject, { signal }),
    placeholderData: keepPreviousData,
  });
}

export function useCourseDetails() {
  const { courseId } = useParams();
  return useQuery({
    queryKey: queryKeys.courseDetails(courseId),
    queryFn: ({ signal }) => coursesApi.getById(courseId, { signal }),
    enabled: !!courseId,
    staleTime: 1000 * 60 * 10,
  });
}

export function useCourseObjectives() {
  const { courseId } = useParams();
  return useQuery({
    queryKey: queryKeys.courseObjectives(courseId),
    queryFn: ({ signal }) => coursesApi.getObjectives(courseId, { signal }),
    enabled: !!courseId,
    staleTime: 1000 * 60 * 10,
  });
}

export function usePopularCourses() {
  return useQuery({
    queryKey: queryKeys.popularCourses(),
    queryFn: ({ signal }) => coursesApi.getPopular({ signal }),
    staleTime: 1000 * 60 * 10,
  });
}

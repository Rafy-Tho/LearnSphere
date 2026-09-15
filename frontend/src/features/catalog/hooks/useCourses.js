import { keepPreviousData, useQuery } from "@tanstack/react-query";
import { useParams } from "react-router-dom";
import { coursesApi } from "@/features/catalog/services/courses";
import parseQueryToObject from "@/utils/parseQueryToObject";
import parseQueryToString from "@/utils/parseQueryToString";

export function useCourses(params) {
  const queryString = parseQueryToString(params);
  const queryObj = parseQueryToObject(params);
  return useQuery({
    queryKey: ["courses", queryObj],
    queryFn: () => coursesApi.getAll(queryString),
    placeholderData: keepPreviousData,
  });
}

export function useCourseDetails() {
  const { courseId } = useParams();
  return useQuery({
    queryKey: ["course-details", courseId],
    queryFn: () => coursesApi.getById(courseId),
    enabled: !!courseId,
    staleTime: 1000 * 60 * 10,
  });
}

export function useCourseObjectives() {
  const { courseId } = useParams();
  return useQuery({
    queryKey: ["course-objectives", courseId],
    queryFn: () => coursesApi.getObjectives(courseId),
    enabled: !!courseId,
    staleTime: 1000 * 60 * 10,
  });
}

export function usePopularCourses() {
  return useQuery({
    queryKey: ["popular-course"],
    queryFn: () => coursesApi.getPopular(),
    staleTime: 1000 * 60 * 10,
  });
}

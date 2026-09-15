import { useQuery } from "@tanstack/react-query";
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
  });
}

export function useCourseDetails() {
  const { courseId } = useParams();
  return useQuery({
    queryKey: ["course-details", courseId],
    queryFn: () => coursesApi.getById(courseId),
    enabled: !!courseId,
  });
}

export function useCourseObjectives() {
  const { courseId } = useParams();
  return useQuery({
    queryKey: ["course-objectives", courseId],
    queryFn: () => coursesApi.getObjectives(courseId),
    enabled: !!courseId,
  });
}

export function usePopularCourses() {
  return useQuery({
    queryKey: ["popular-course"],
    queryFn: () => coursesApi.getPopular(),
  });
}

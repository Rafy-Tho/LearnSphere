import DOMPurify from "dompurify";
import { useLessonContent as useGetLessonContent } from "@/features/learning/hooks/useLessons";
import ErrorMessage from "@/components/ui/ErrorMessage";
import SpinnerLoader from "@/components/ui/SpinnerLoader";
function LessonContent() {
  const { data, isPending, error } = useGetLessonContent();

  const contents = Array.isArray(data) ? data : [data].filter(Boolean);
  const lessons = contents.map((lesson) => lesson.content).join("");
  const cleanHTML = DOMPurify.sanitize(lessons, {
    ALLOWED_ATTR: ["class", "style"],
  });

  if (isPending) return <SpinnerLoader />;
  if (error) return <ErrorMessage message={error.message} />;
  return (
    <div
      className="max-w-7xl mx-auto"
      dangerouslySetInnerHTML={{ __html: cleanHTML }}
    ></div>
  );
}

export default LessonContent;

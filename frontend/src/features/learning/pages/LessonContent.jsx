import { useMemo } from "react";
import DOMPurify from "dompurify";
import { useLessonContent as useGetLessonContent } from "@/features/learning/hooks/useLessons";
import ErrorMessage from "@/components/ui/ErrorMessage";
import SpinnerLoader from "@/components/ui/SpinnerLoader";

const CSS_STRIP = /url\(\s*(['"]?)[^)'"]*\1\s*\)|@import\s[^;]*;?|expression\s*\(/gi;

function sanitizeCSS(raw) {
  return raw.replace(CSS_STRIP, "");
}

function extractAndSanitize(raw) {
  const doc = new DOMParser().parseFromString(raw, "text/html");

  const styles = doc.querySelectorAll("style");
  const cssParts = [];
  for (const el of styles) {
    cssParts.push(el.textContent);
    el.remove();
  }

  const cleanHTML = DOMPurify.sanitize(doc.body.innerHTML, {
    ALLOWED_ATTR: ["class", "style"],
  });

  return { cleanHTML, safeCSS: sanitizeCSS(cssParts.join("\n")) };
}

function LessonContent() {
  const { data, isPending, error } = useGetLessonContent();

  const contents = Array.isArray(data) ? data : [data].filter(Boolean);
  const lessons = contents.map((lesson) => lesson.content).join("");
  const { cleanHTML, safeCSS } = useMemo(
    () => (lessons ? extractAndSanitize(lessons) : { cleanHTML: "", safeCSS: "" }),
    [lessons],
  );

  if (isPending) return <SpinnerLoader />;
  if (error) return <ErrorMessage message={error.message} />;
  return (
    <div className="mx-auto max-w-7xl px-4 py-6 sm:px-6 lg:px-8">
      {safeCSS && <style>{safeCSS}</style>}
      <div
        className="break-words [&_img]:h-auto [&_img]:max-w-full [&_pre]:overflow-x-auto [&_table]:block [&_table]:max-w-full [&_table]:overflow-x-auto"
        dangerouslySetInnerHTML={{ __html: cleanHTML }}
      />
    </div>
  );
}

export default LessonContent;

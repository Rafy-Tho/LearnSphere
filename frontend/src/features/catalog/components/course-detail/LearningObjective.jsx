import { Check } from "lucide-react";
import { useCourseObjectives as useGetCourseObjective } from "@/features/catalog/hooks/useCourses";
import SpinnerLoader from "@/components/ui/SpinnerLoader";
import ErrorMessage from "@/components/ui/ErrorMessage";

export default function LearningObjective() {
  const { data, isPending, error } = useGetCourseObjective();
  if (isPending) return <SpinnerLoader />;
  if (error) return <ErrorMessage message={error.message} />;
  const objectives = data || [];
  return (
    <div className="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 py-12 sm:py-16">
      <div className="bg-surface-muted rounded-2xl p-6 sm:p-8 lg:p-10">
        <h2 className="text-xs sm:text-sm font-bold text-foreground-muted tracking-wider mb-6">
          LEARNING OBJECTIVES
        </h2>
        <div className="space-y-4">
          {objectives.map((objective) => (
            <div key={objective} className="flex gap-3 sm:gap-4">
              <div className="flex-shrink-0 mt-0.5">
                <Check className="w-5 h-5 sm:w-6 sm:h-6 text-success" />
              </div>
              <p className="text-sm sm:text-base text-foreground-muted leading-relaxed">
                {objective}
              </p>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}

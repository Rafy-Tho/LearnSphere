import { Award, CheckCircle2, ChevronDown, ChevronUp, Circle, CircleQuestionMark, ExternalLink, Lock, Search } from "lucide-react";
import { useMemo, useState } from "react";
import { Link } from "react-router-dom";
import { useClaimCertificate } from "@/features/learning/hooks/useLearningMutations";
import { useCertificate, useCertificateEligibility, useCourseLessonCompletions } from "@/features/learning/hooks/useLearning";
import { useCreateCourseProgress } from "@/features/learning/hooks/useLearningMutations";
import { useCourseLearningData as useGetCourseLearningData } from "@/features/learning/hooks/useLearning";
import { useCourseProgress as useGetCourseProgress } from "@/features/learning/hooks/useLearning";
import useAuth from "@/features/auth/hooks/useAuth";
import ErrorMessage from "@/components/ui/ErrorMessage";
import SpinnerLoader from "@/components/ui/SpinnerLoader";
import { lessonIcons } from "@/constants/lessonIcons";
export default function LearningRoadmap({ sectionRef }) {
  const [expandedSections, setExpandedSections] = useState([]);
  const [searchQuery, setSearchQuery] = useState("");
  const { user } = useAuth();
  const { data: progress, isPending: progressPending } = useGetCourseProgress();
  const { mutate: createProgress } = useCreateCourseProgress();
  const { data, isPending, error } = useGetCourseLearningData();
  const { data: certificate } = useCertificate();
  const { data: eligibility } = useCertificateEligibility();
  const { data: completionsData } = useCourseLessonCompletions();
  const { mutate: claimCert, isPending: claiming } = useClaimCertificate();
  const course = data || {};
  const modules = useMemo(() => course?.modules || [], [course?.modules]);
  const completedIds = useMemo(
    () => new Set(completionsData || []),
    [completionsData],
  );
  const totalLessons = modules.reduce(
    (acc, m) => acc + (m.lessons || []).length,
    0,
  );
  const completedCount = completedIds.size;
  const filteredModules = useMemo(
    () =>
      modules
        .map((module) => {
          const filteredLessons = module.lessons.filter((lesson) =>
            lesson?.name?.toLowerCase().includes(searchQuery.toLowerCase()),
          );

          return {
            ...module,
            lessons: filteredLessons,
          };
        })
        .filter((module) => {
          return (
            module?.name?.toLowerCase().includes(searchQuery.toLowerCase()) ||
            module?.lessons.length > 0
          );
        }),
    [modules, searchQuery],
  );
  const toggleSection = (id) => {
    setExpandedSections((prev) =>
      prev.includes(id)
        ? prev.filter((moduleId) => moduleId !== id)
        : [...prev, id],
    );
  };

  const handleSearchChange = (value) => {
    setSearchQuery(value);
    if (!value) return;
    const normalized = value.toLowerCase();
    const ids = modules
      .filter(
        (module) =>
          module?.name?.toLowerCase().includes(normalized) ||
          (module.lessons || []).some((lesson) =>
            lesson?.name?.toLowerCase().includes(normalized),
          ),
      )
      .map((module) => module.id);
    setExpandedSections((prev) => [...new Set([...prev, ...ids])]);
  };

  const toggleExpandAll = () => {
    const target = searchQuery ? filteredModules : modules;

    const allExpanded = target.every((m) => expandedSections.includes(m.id));

    if (allExpanded) setExpandedSections([]);
    else setExpandedSections(target.map((m) => m.id));
  };
  const handleProgress = () => {
    window.scrollTo({ top: 0, behavior: "smooth" });
    if (progressPending || progress || !user) return;
    createProgress();
  };

  const handleClaimCertificate = () => {
    if (claiming || certificate || !user) return;
    claimCert();
  };

  const isComplete = eligibility?.isComplete;
  const canClaim = isComplete && !certificate;
  if (isPending) return <SpinnerLoader />;
  if (error) return <ErrorMessage message={error.message} />;
  return (
    <div ref={sectionRef} className="max-w-6xl mx-auto  py-12 sm:py-16">
      <div className="mb-8">
        <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 mb-6">
          <div>
            <h2 className="text-2xl sm:text-3xl font-bold text-foreground">
              Learning Roadmap
            </h2>
            <p className="text-sm text-foreground-muted mt-1">
              {`${course?.total_lessons} Lessons • ${course?.total_quizzes} Quizzes`}
              {completedCount > 0 && (
                <span className="ml-2 text-success font-medium">
                  • {completedCount}/{totalLessons} completed
                </span>
              )}
            </p>
          </div>
        </div>

        <div className="flex flex-col sm:flex-row gap-4">
          <div className="relative flex-1">
            <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 w-5 h-5 text-foreground-muted" />
            <input
              type="text"
              placeholder="Search Lessons"
              value={searchQuery}
              onChange={(e) => handleSearchChange(e.target.value)}
              className="w-full pl-10 pr-4 py-2.5 border border-border bg-surface text-foreground placeholder:text-foreground-muted rounded-lg focus:outline-none focus:ring-2 focus:ring-ring/50 focus:border-transparent"
            />
          </div>
          <button
            onClick={toggleExpandAll}
            className="flex items-center justify-center gap-2 px-4 py-2.5 border border-border bg-surface hover:bg-surface-muted rounded-lg transition-colors whitespace-nowrap cursor-pointer"
          >
            <span className="text-sm font-medium text-foreground">
              Expand All
            </span>
            {expandedSections.length > 0 ? (
              <ChevronUp className="w-5 h-5 text-foreground-muted" />
            ) : (
              <ChevronDown className="w-5 h-5 text-foreground-muted" />
            )}
          </button>
        </div>
      </div>

      <div className="space-y-4">
        {filteredModules.map((module, index) => (
          <div
            key={module.id}
            className="border border-border rounded-xl overflow-hidden bg-surface"
          >
            <button
              onClick={() => toggleSection(module.id)}
              className="w-full px-6 py-5 flex items-start justify-between hover:bg-surface-muted transition-colors cursor-pointer"
            >
              <div className="flex-1 text-left">
                <h3 className="text-base sm:text-lg font-semibold text-foreground mb-2">
                  {index + 1}. {module.name}
                </h3>
                {module.description && (
                  <p className="text-sm text-foreground-muted pr-4">
                    {module.description}
                  </p>
                )}
              </div>
              <div className="shrink-0 ml-4">
                {expandedSections.includes(module.id) ? (
                  <ChevronUp className="w-5 h-5 text-foreground-muted" />
                ) : (
                  <ChevronDown className="w-5 h-5 text-foreground-muted" />
                )}
              </div>
            </button>

            {expandedSections.includes(module.id) && (
              <div className="px-6 pb-5 space-y-3">
                {module.lessons.map((lesson) => {
                  const isCompleted = completedIds.has(lesson.id);
                  const Icon = isCompleted
                    ? CheckCircle2
                    : lessonIcons[lesson.type] || Circle;
                  const isLocked = lesson.access_type === "SUBSCRIPTION";
                  const isQuiz = lesson.type === "QUIZ";
                  const link = isLocked
                    ? "/pricing"
                    : isQuiz
                      ? `/courses/${course.id}/lessons/${lesson.id}/quiz`
                      : `/courses/${course.id}/lessons/${lesson.id}`;
                  return (
                    <Link
                      key={lesson.id}
                      onClick={handleProgress}
                      to={link}
                      className="flex items-center gap-3 py-2 text-sm sm:text-base"
                    >
                      {isLocked ? (
                        <Lock className="w-4 h-4 text-foreground-muted shrink-0 " />
                      ) : (
                        <Icon
                          className={`w-4 h-4 shrink-0 cursor-pointer transition-colors ${isCompleted ? "text-success" : "text-foreground hover:text-primary"}`}
                        />
                      )}

                      <span
                        className={
                          isLocked
                            ? "text-foreground-muted"
                            : isCompleted
                              ? "text-foreground-muted line-through"
                              : "text-foreground cursor-pointer hover:text-primary transition-colors"
                        }
                      >
                        {lesson.name}
                      </span>
                    </Link>
                  );
                })}
              </div>
            )}
          </div>
        ))}
      </div>

      <div className="mt-12 border border-primary/30 rounded-xl p-6 sm:p-8 bg-surface">
        <div className="flex flex-col lg:flex-row items-center gap-8">
          <div className="flex-1">
            <div className="flex items-center gap-2 mb-3">
              <Award className="w-5 h-5 text-foreground-muted" />
              <h3 className="text-xl font-bold text-foreground">
                Certificate of Completion
              </h3>
            </div>
            <p className="text-foreground-muted mb-4">
              {certificate
                ? "Congratulations! You earned your certificate for this course."
                : isComplete
                  ? "You have completed all lessons. Claim your certificate now!"
                  : "Complete all lessons to earn your certificate of completion."}
            </p>
            {certificate ? (
              <Link
                to={`/certificates/${certificate.id}`}
                className="inline-flex items-center gap-2 px-6 py-2.5 bg-primary hover:bg-primary-hover text-white rounded-lg text-sm font-medium transition-colors"
              >
                <ExternalLink className="w-4 h-4" />
                View Certificate
              </Link>
            ) : (
              <button
                onClick={handleClaimCertificate}
                disabled={!canClaim || claiming}
                className={`px-6 py-2.5 rounded-lg text-sm font-medium transition-colors cursor-pointer ${
                  canClaim
                    ? "bg-primary hover:bg-primary-hover text-white"
                    : "border border-border bg-surface-muted text-foreground-muted cursor-not-allowed"
                }`}
              >
                {claiming ? "Claiming..." : "Claim Certificate"}
              </button>
            )}
          </div>
          <div className="w-full lg:w-64 h-48 border-2 border-primary/30 rounded-lg bg-surface-muted flex items-center justify-center">
            <div className="text-center">
              {certificate ? (
                <>
                  <Award className="w-12 h-12 text-primary mx-auto mb-2" />
                  <p className="text-xs text-primary font-medium">
                    Certificate Earned
                  </p>
                  <p className="text-xs text-foreground-muted mt-1">
                    {certificate.certificate_number}
                  </p>
                </>
              ) : (
                <>
                  <Lock className="w-12 h-12 text-foreground-muted mx-auto mb-2" />
                  <p className="text-xs text-foreground-muted">
                    Certificate Preview
                  </p>
                </>
              )}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

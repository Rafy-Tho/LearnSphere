import { Search, X } from "lucide-react";
import { useCallback, useMemo, useState } from "react";
import ModuleGroup from "@/features/learning/components/course-learning/ModuleGroup";
import { useCourseLearningData as useGetCourseLearningData } from "@/features/learning/hooks/useLearning";
import { useCourseLessonCompletions as useGetCourseLessonCompletions } from "@/features/learning/hooks/useLearning";
import SpinnerLoader from "@/components/ui/SpinnerLoader";
import ErrorMessage from "@/components/ui/ErrorMessage";
import { useParams } from "react-router-dom";

export function CourseSidebar({ onClose }) {
  const [searchQuery, setSearchQuery] = useState("");
  const [activeFilter, setActiveFilter] = useState("ALL");
  const [expandedModuleIds, setExpandedModuleIds] = useState([]);
  const { data, isPending, error } = useGetCourseLearningData();
  const { data: completionsData } = useGetCourseLessonCompletions();
  const completedIds = useMemo(
    () => new Set(completionsData || []),
    [completionsData],
  );
  const course = data || {};
  const modules = useMemo(() => course.modules || [], [course.modules]);
  const normalizedSearch = searchQuery.toLowerCase();
  const { lessonId } = useParams();
  const toggle = useCallback((id) => {
    setExpandedModuleIds((prev) =>
      prev.includes(id)
        ? prev.filter((moduleId) => moduleId !== id)
        : [...prev, id],
    );
  }, []);
  const filteredModules = useMemo(() => {
    return modules
      .map((m) => {
        const lessons = (m.lessons || []).filter((l) => {
          const matchSearch = l?.name?.toLowerCase().includes(normalizedSearch);

          const matchFilter = activeFilter === "ALL" || l?.access_type === "FREE";

          return matchSearch && matchFilter;
        });

        return { ...m, lessons };
      })
      .filter((m) => {
        const matchModule = m.name?.toLowerCase().includes(normalizedSearch);

        return matchModule || m.lessons.length > 0;
      });
  }, [modules, normalizedSearch, activeFilter]);

  const freeCount = useMemo(
    () =>
      modules.reduce(
        (a, m) =>
          a + (m.lessons || []).filter((l) => l?.access_type === "FREE").length,
        0,
      ),
    [modules],
  );
  const lessonToModuleMap = useMemo(() => {
    const map = new Map();

    for (const module of modules) {
      for (const lesson of module.lessons || []) {
        map.set(lesson.id, module.id);
      }
    }

    return map;
  }, [modules]);
  const handleFree = () => {
    const freeModules = modules
      .map((m) => ({
        ...m,
        lessons: (m.lessons || []).filter((l) => l?.access_type === "FREE"),
      }))
      .filter((m) => m.lessons.length > 0);

    setExpandedModuleIds(freeModules.map((m) => m.id));
    setActiveFilter("FREE");
  };
  const handleSearchChange = (value) => {
    setSearchQuery(value);
    if (!value) return;
    const normalized = value.toLowerCase();
    const ids = modules
      .filter(
        (m) =>
          m?.name?.toLowerCase().includes(normalized) ||
          (m.lessons || []).some((l) =>
            l?.name?.toLowerCase().includes(normalized),
          ),
      )
      .map((m) => m.id);
    setExpandedModuleIds((prev) => [...new Set([...prev, ...ids])]);
  };

  const [hasInitialized, setHasInitialized] = useState(false);
  if (!hasInitialized && lessonId && lessonToModuleMap.size > 0) {
    setHasInitialized(true);
    const moduleId = lessonToModuleMap.get(lessonId);
    if (moduleId) {
      setExpandedModuleIds((prev) =>
        prev.includes(moduleId) ? prev : [...prev, moduleId],
      );
    }
  }

  if (isPending) return <SpinnerLoader />;
  if (error) return <ErrorMessage message={error.message} />;
  return (
    <aside className="flex flex-col lg:h-[calc(100vh-64px)] h-full bg-surface border-r border-border">
      <button
        onClick={onClose}
        aria-label="Close sidebar"
        className="text-foreground-muted absolute top-3 right-3 text-2xl cursor-pointer lg:hidden"
      >
        <X size={16} />
      </button>
      <div className="p-5 pb-4">
        <h2 className="text-lg font-semibold text-foreground mb-4">
          {course.name}
        </h2>
        <div className="relative mb-3">
          <Search
            size={16}
            className="absolute left-3 top-1/2 -translate-y-1/2 text-foreground-muted"
          />
          <input
            type="text"
            placeholder="Search Content"
            value={searchQuery}
            onChange={(e) => handleSearchChange(e.target.value)}
            className="w-full rounded-md border border-border bg-surface py-2 pl-9 pr-3 text-sm text-foreground placeholder:text-foreground-muted focus:outline-none focus:ring-2 focus:ring-ring focus:border-primary"
          />
        </div>
        <div className="flex gap-2">
          <button
            onClick={() => setActiveFilter("ALL")}
            className={`rounded-full px-3 py-1 text-xs font-medium border transition-colors cursor-pointer ${
              activeFilter === "ALL"
                ? "border-primary/30 bg-primary/10 text-primary"
                : "border-border text-foreground-muted hover:text-foreground"
            }`}
          >
            All Lessons
          </button>
          <button
            onClick={handleFree}
            className={`rounded-full px-3 py-1 text-xs font-medium border transition-colors cursor-pointer ${
              activeFilter === "FREE"
                ? "border-primary/30 bg-primary/10 text-primary"
                : "border-border text-foreground-muted hover:text-foreground"
            }`}
          >
            Free Lessons ({freeCount})
          </button>
        </div>
      </div>

      <nav className="flex-1 overflow-y-auto px-3 pb-4">
        {filteredModules.map((module, index) => (
          <ModuleGroup
            key={module.id}
            module={module}
            isOpen={expandedModuleIds.includes(module.id)}
            onToggle={toggle}
            index={index}
            completedIds={completedIds}
          />
        ))}
      </nav>
    </aside>
  );
}

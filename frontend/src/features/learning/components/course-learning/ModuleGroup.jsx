import { memo } from "react";
import { CheckCircle2, ChevronDown, ChevronUp, Circle, CircleQuestionMark, Lock } from "lucide-react";
import { NavLink, useParams } from "react-router-dom";
import { lessonIcons } from "@/constants/lessonIcons";

function ModuleGroup({ module, isOpen, onToggle, index, completedIds }) {
  const { courseId } = useParams();
  return (
    <div className="mb-1">
      <button
        onClick={() => onToggle(module.id)}
        className="flex w-full items-start justify-between rounded-md px-2 py-2.5 text-left text-sm font-semibold text-foreground hover:bg-surface-muted transition-colors cursor-pointer"
      >
        <span>
          {index + 1}. {module.name}
        </span>
        {isOpen ? (
          <ChevronUp size={16} className="mt-0.5 shrink-0 ml-2" />
        ) : (
          <ChevronDown size={16} className="mt-0.5 shrink-0 ml-2" />
        )}
      </button>
      {isOpen && (
        <ul className="ml-1 mt-0.5 space-y-0.5">
          {module.lessons.map((lesson) => {
            const isCompleted = completedIds?.has(lesson.id);
            const Icon = isCompleted
              ? CheckCircle2
              : lessonIcons[lesson.type] || Circle;
            const isLocked = lesson.access_type === "SUBSCRIPTION";
            const isQuiz = lesson.type === "QUIZ";
            const link = isLocked
              ? "/pricing"
              : isQuiz
                ? `/courses/${courseId}/lessons/${lesson.id}/quiz`
                : `/courses/${courseId}/lessons/${lesson.id}`;
            return (
              <li key={lesson.id}>
                <NavLink
                  to={link}
                  className={({ isActive }) => `
                     flex w-full items-start gap-2.5 rounded-md px-3 py-2 text-left text-sm transition-colors ${
                       isActive
                         ? "bg-primary/10 text-primary font-medium"
                         : "text-foreground-muted hover:bg-surface-muted hover:text-foreground"
                     }`}
                >
                  {!isLocked ? (
                    <Icon
                      size={14}
                      className={`mt-0.5 shrink-0 ${isCompleted ? "text-success" : ""}`}
                    />
                  ) : (
                    <Lock size={14} className="mt-0.5 shrink-0" />
                  )}
                  <span
                    className={`leading-snug ${isCompleted ? "line-through opacity-70" : ""}`}
                  >
                    {lesson.name}
                  </span>
                </NavLink>
              </li>
            );
          })}
        </ul>
      )}
    </div>
  );
}

export default memo(ModuleGroup);

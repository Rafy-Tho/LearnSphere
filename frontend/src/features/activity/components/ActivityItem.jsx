import {
  Award,
  BookOpen,
  CheckCircle2,
  PlayCircle,
  Trophy,
} from "lucide-react";
import cn from "@/utils/cn";
import formatTimeAgo from "@/utils/formatTimeAgo";

const ACTIVITY_DESCRIPTORS = {
  ENROLL_COURSE: {
    icon: BookOpen,
    describe: (activity) => `Enrolled in "${activity.course_name}"`,
  },
  START_COURSE: {
    icon: PlayCircle,
    describe: (activity) => `Started "${activity.course_name}"`,
  },
  START_LESSON: {
    icon: PlayCircle,
    describe: (activity) => `Started "${activity.lesson_name}"`,
  },
  COMPLETE_LESSON: {
    icon: CheckCircle2,
    tone: "success",
    describe: (activity) => `Completed "${activity.lesson_name}"`,
  },
  COMPLETE_COURSE: {
    icon: Trophy,
    tone: "success",
    describe: (activity) => `Completed course "${activity.course_name}"`,
  },
  EARN_CERTIFICATE: {
    icon: Award,
    tone: "success",
    describe: (activity) => `Earned a certificate for "${activity.course_name}"`,
  },
};

const toneClasses = {
  default: "bg-primary/10 text-primary",
  success: "bg-success/10 text-success",
};

function ActivityItem({ activity }) {
  const descriptor = ACTIVITY_DESCRIPTORS[activity.type] ?? {
    icon: BookOpen,
    describe: () => "Learning activity",
  };
  const Icon = descriptor.icon;
  const tone = toneClasses[descriptor.tone] || toneClasses.default;

  return (
    <li className="flex items-start gap-3 py-3">
      <span
        className={cn(
          "mt-0.5 flex size-9 shrink-0 items-center justify-center rounded-full",
          tone,
        )}
        aria-hidden="true"
      >
        <Icon className="size-4" />
      </span>
      <div className="min-w-0 flex-1">
        <p className="truncate text-sm font-medium text-foreground">
          {descriptor.describe(activity)}
        </p>
        <p className="mt-0.5 text-xs text-foreground-muted">
          {formatTimeAgo(activity.created_at)}
        </p>
      </div>
    </li>
  );
}

export default ActivityItem;

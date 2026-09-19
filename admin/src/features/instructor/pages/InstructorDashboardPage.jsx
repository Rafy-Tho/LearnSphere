import { useNavigate } from "react-router-dom";
import {
  ArrowUpRight,
  BookOpen,
  Star,
  TrendingUp,
  Users,
} from "lucide-react";
import { ErrorState } from "@/components/common/ErrorState";
import { StatusBadge } from "@/components/common/StatusBadge";
import { DashboardPageSkeleton } from "@/components/ui/skeleton";
import { StatsCard } from "@/features/dashboard/components/StatsCard";
import { useInstructorDashboard } from "@/features/instructor/hooks";
import { useAuth } from "@/app/providers/context";

export default function InstructorDashboardPage() {
  const navigate = useNavigate();
  const { user } = useAuth();
  const { data, isPending, error } = useInstructorDashboard();

  if (isPending) return <DashboardPageSkeleton />;
  if (error) return <ErrorState message={error.message} />;

  const stats = [
    { title: "My Courses", value: data?.totalCourses || 0, icon: BookOpen },
    { title: "Students", value: data?.totalStudents || 0, icon: Users },
    {
      title: "Enrollments",
      value: data?.totalEnrollments || 0,
      icon: TrendingUp,
    },
    {
      title: "Avg. Rating",
      value: data?.averageRating || 0,
      icon: Star,
    },
  ];

  const statusItems = [
    { label: "Published", value: data?.publishedCourses || 0 },
    { label: "Pending review", value: data?.pendingCourses || 0 },
    { label: "Draft", value: data?.draftCourses || 0 },
    { label: "Rejected", value: data?.rejectedCourses || 0 },
  ];

  return (
    <div className="space-y-8">
      <div>
        <h1 className="text-2xl font-bold text-foreground">
          Welcome back{user?.name ? `, ${user.name.split(" ")[0]}` : ""}
        </h1>
        <p className="text-muted-foreground mt-1">
          Here is how your teaching is going
        </p>
      </div>

      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
        {stats.map((stat) => (
          <StatsCard
            key={stat.title}
            title={stat.title}
            value={stat.value}
            icon={stat.icon}
          />
        ))}
      </div>

      <div className="glass-card rounded-xl p-6">
        <h2 className="font-semibold text-foreground mb-4">Course status</h2>
        <div className="grid grid-cols-2 gap-4 md:grid-cols-4">
          {statusItems.map((item) => (
            <div key={item.label} className="rounded-lg bg-accent/40 p-4">
              <p className="text-2xl font-bold text-foreground">{item.value}</p>
              <p className="text-sm text-muted-foreground">{item.label}</p>
            </div>
          ))}
        </div>
      </div>

      <div className="grid gap-6 lg:grid-cols-2">
        <div className="glass-card rounded-xl p-6">
          <div className="flex items-center justify-between mb-4">
            <h2 className="font-semibold text-foreground">
              Recent enrollments
            </h2>
            <button
              onClick={() => navigate("/courses")}
              className="text-sm text-primary hover:underline flex items-center gap-1"
            >
              My courses <ArrowUpRight className="h-3 w-3" />
            </button>
          </div>
          <div className="space-y-3">
            {(data?.recentEnrollments || []).length === 0 && (
              <p className="text-sm text-muted-foreground">
                No enrollments yet.
              </p>
            )}
            {(data?.recentEnrollments || []).map((enrollment) => (
              <div
                key={enrollment.id}
                className="flex items-center justify-between p-3 rounded-lg hover:bg-accent/50 transition-colors cursor-pointer"
                onClick={() => navigate(`/courses/${enrollment.course_id}`)}
              >
                <div className="min-w-0">
                  <p className="font-medium text-foreground truncate">
                    {enrollment.student_name}
                  </p>
                  <p className="text-xs text-muted-foreground truncate">
                    {enrollment.course_name}
                  </p>
                </div>
                <span className="text-xs text-muted-foreground">
                  {new Date(enrollment.enrolled_at).toLocaleDateString()}
                </span>
              </div>
            ))}
          </div>
        </div>

        <div className="glass-card rounded-xl p-6">
          <div className="flex items-center justify-between mb-4">
            <h2 className="font-semibold text-foreground">Recent reviews</h2>
            <span className="text-sm text-muted-foreground">
              {data?.totalReviews || 0} total
            </span>
          </div>
          <div className="space-y-3">
            {(data?.recentReviews || []).length === 0 && (
              <p className="text-sm text-muted-foreground">No reviews yet.</p>
            )}
            {(data?.recentReviews || []).map((review) => (
              <div
                key={review.id}
                className="flex items-start justify-between gap-3 p-3 rounded-lg hover:bg-accent/50 transition-colors"
              >
                <div className="min-w-0">
                  <p className="font-medium text-foreground truncate">
                    {review.student_name}
                  </p>
                  <p className="text-xs text-muted-foreground truncate">
                    {review.course_name}
                  </p>
                  {review.review && (
                    <p className="text-sm text-muted-foreground line-clamp-2 mt-1">
                      {review.review}
                    </p>
                  )}
                </div>
                <StatusBadge status={`${review.rating}★`} />
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
}

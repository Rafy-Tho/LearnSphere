import { ArrowRightIcon } from "lucide-react";
import { useCourses as useGetCourses } from "@/features/catalog/hooks/useCourses";
import ErrorMessage from "@/components/ui/ErrorMessage";
import SpinnerLoader from "@/components/ui/SpinnerLoader";
import Button from "@/components/ui/Button";
import CourseCardGrid from "@/features/catalog/components/home/CourseCardGrid";
import { useNavigate } from "react-router-dom";

function TopCourse() {
  const navigate = useNavigate();
  const param = new URLSearchParams({});
  param.append("limit", 4);
  param.append("skill", "javascript-mastery");
  param.append("skill", "c-programming-mastery");
  param.append("skill", "python-programming-for-beginners");
  param.append("skill", "cpp-programming-for-beginners");
  const { data, isPending, error } = useGetCourses(param);
  return (
    <section className="py-12 px-4 sm:px-6 lg:px-8 bg-background">
      <div className="max-w-7xl mx-auto">
        {/* Header Section */}
        <div className="text-center mb-12">
          <h2 className="text-3xl sm:text-4xl font-bold text-foreground mb-4">
            Accelerate Your Engineering Career
          </h2>
          <p className="text-foreground-muted max-w-2xl mx-auto text-lg">
            Master system design and coding interviews with courses crafted by
            FAANG engineers
          </p>
        </div>
        {isPending && <SpinnerLoader size="lg" color="primary" />}
        {error && <ErrorMessage message={error.message} />}
        {data && <CourseCardGrid courses={data?.data?.slice(0, 4) || []} />}
        {/* View All Button */}
        <div className="text-center mt-12">
          <Button
            size="lg"
            rightIcon={<ArrowRightIcon className="w-5 h-5" />}
            onClick={() => {
              navigate("/courses");
              window.scrollTo({ top: 0, behavior: "smooth" });
            }}
          >
            View All Courses
          </Button>
        </div>
      </div>
    </section>
  );
}

export default TopCourse;

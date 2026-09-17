import { Link } from "react-router-dom";
import { ArrowRight, Play, Sparkles } from "lucide-react";

import banner from "@/assets/banner.jpg";
import Button from "@/components/ui/Button";

const stats = [
  { value: "500+", label: "Expert Instructors" },
  { value: "50K+", label: "Active Learners" },
  { value: "1.5K+", label: "Courses Available" },
];

function Hero() {
  return (
    <section className="bg-background px-4 sm:px-6 lg:px-8">
      <div className="max-w-7xl mx-auto grid xl:grid-cols-2 items-center gap-12 py-16 md:py-24">
        <div className="max-w-2xl max-xl:mx-auto max-xl:text-center">
          <span className="inline-flex items-center gap-2 rounded-full bg-primary/10 px-3 py-1 text-xs font-semibold uppercase tracking-wider text-primary">
            <Sparkles className="h-3.5 w-3.5" />
            Learn anytime, anywhere
          </span>

          <h1 className="mt-5 text-4xl sm:text-5xl font-bold tracking-tight leading-[1.1]">
            Master new skills with{" "}
            <span className="text-primary">expert-led</span> courses
          </h1>

          <p className="mt-6 text-base leading-relaxed text-foreground-muted">
            Access 1000+ interactive courses, live workshops, and earn
            certificates. Learn at your own pace with personalized
            recommendations.
          </p>

          <div className="mt-8 flex flex-col sm:flex-row gap-3 max-xl:justify-center">
            <Button
              as={Link}
              to="/courses"
              size="lg"
              rightIcon={<ArrowRight className="h-5 w-5" />}
            >
              Explore Courses
            </Button>
            <Button
              as={Link}
              to="/signup"
              size="lg"
              variant="outline"
              leftIcon={<Play className="h-4 w-4" />}
            >
              Get Started Free
            </Button>
          </div>

          <div className="mt-12 grid grid-cols-1 min-[450px]:grid-cols-3 gap-6 rounded-2xl border border-border bg-surface p-6 shadow-sm">
            {stats.map((stat) => (
              <div key={stat.label} className="text-center">
                <p className="text-3xl font-semibold text-primary">
                  {stat.value}
                </p>
                <p className="mt-1 text-sm font-medium text-foreground-muted">
                  {stat.label}
                </p>
              </div>
            ))}
          </div>
        </div>

        <div className="xl:aspect-[350/251]">
          <img
            src={banner}
            alt="Learners studying online with LearnSphere"
            className="w-full h-full object-contain max-xl:object-top"
          />
        </div>
      </div>
    </section>
  );
}

export default Hero;

import { Link } from "react-router-dom";
import { ArrowRight } from "lucide-react";

import Button from "@/components/ui/Button";

function StartLearning() {
  return (
    <section className="bg-primary px-4 sm:px-6 lg:px-8 py-16 md:py-24">
      <div className="max-w-3xl mx-auto text-center">
        <h2 className="text-3xl md:text-4xl font-bold tracking-tight text-white">
          Start your learning journey today
        </h2>
        <p className="mt-4 text-base text-white/90">
          Join thousands of learners and upgrade your skills with LearnSphere.
        </p>

        <div className="mt-10 flex flex-col sm:flex-row justify-center gap-4">
          <Button
            as={Link}
            to="/signup"
            size="lg"
            className="bg-surface! text-foreground! hover:bg-surface-muted!"
          >
            Get Started Free
          </Button>
          <Button
            as={Link}
            to="/courses"
            size="lg"
            variant="outline"
            rightIcon={<ArrowRight className="h-5 w-5" />}
            className="border-white/70! bg-transparent! text-white! hover:bg-white/10! hover:text-white!"
          >
            View Courses
          </Button>
        </div>
      </div>
    </section>
  );
}

export default StartLearning;

function StartLearning() {
  return (
    <div className="py-16 bg-primary md:mt-28 mt-16 px-4 sm:px-10">
      <div className="container mx-auto text-center">
        <h2 className="text-white text-2xl md:text-3xl font-bold leading-relaxed">
          Start your learning journey today
        </h2>
        <p className="mt-6 text-white/90">
          Join thousands of learners and upgrade your skills.
        </p>
        <div className="flex flex-col sm:flex-row justify-center gap-4 mt-12">
          <button className="cursor-pointer bg-surface px-6 py-3 rounded-lg hover:bg-surface-muted transition-colors font-medium text-foreground">
            Get Started Free
          </button>
          <button className="cursor-pointer bg-transparent border border-white/70 text-white px-6 py-3 rounded-lg hover:bg-white/10 transition-colors font-medium">
            View Courses
          </button>
        </div>
      </div>
    </div>
  );
}

export default StartLearning;

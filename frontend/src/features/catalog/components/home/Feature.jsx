import features from "@/constants/features";
function Feature() {
  return (
    <section
      id="features"
      className="md:mt-28 mt-16 py-16 bg-surface-muted px-4 sm:px-10"
    >
      <div className="container max-w-7xl mx-auto">
        <div className="text-center max-w-4xl mx-auto">
          <p className="text-primary font-semibold mb-2">
            WHY LEARN WITH US
          </p>
          <h2 className="text-2xl md:text-3xl font-bold leading-relaxed">
            Everything you need to accelerate your career
          </h2>
          <div className="max-w-2xl mx-auto mt-6">
            <p className="leading-relaxed">
              Interactive tools, real-world projects, and community support.
            </p>
          </div>
        </div>

        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8 mt-16">
          {/* Feature cards - changed icons/text to e-learning */}
          {features.map((feature) => {
            const Icon = feature.icon;
            return (
              <div
                className="bg-surface p-8 rounded-lg shadow-sm border border-border hover:shadow-md transition-shadow"
                key={feature.title}
              >
                <div className="w-12 h-12 bg-primary/10 text-primary rounded-lg flex items-center justify-center mb-6">
                  <Icon />
                </div>
                <h3 className="text-lg font-semibold mb-2">{feature.title}</h3>
                <p className="leading-relaxed text-foreground-muted">{feature.description}</p>
              </div>
            );
          })}
        </div>
      </div>
    </section>
  );
}

export default Feature;

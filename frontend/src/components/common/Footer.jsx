import { Heart } from "lucide-react";
import { Link } from "react-router-dom";

import { footerLinks } from "@/constants/footerLinks";
import { socialLinks } from "@/constants/socialLinks";
import BrandMark from "@/components/common/BrandMark";
import { CURRENT_YEAR } from "@/constants/appConstants";

const Footer = () => {
  return (
    <footer className="relative bg-surface-muted text-foreground-muted border-t border-border">
      <div
        aria-hidden="true"
        className="absolute inset-x-0 top-0 h-1 bg-primary"
      />

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pt-16 pb-8">
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-6 gap-10 lg:gap-12">
          {/* Brand */}
          <div className="sm:col-span-2 lg:col-span-2 space-y-5">
            <Link
              to="/"
              onClick={() => window.scrollTo({ top: 0, behavior: "smooth" })}
              className="inline-flex items-center gap-2 group"
              aria-label="LearnSphere home"
            >
              <BrandMark className="h-9 w-9 transition-transform duration-200 group-hover:scale-105" />
              <span className="text-lg font-bold tracking-tight text-foreground">
                Learn<span className="text-primary">Sphere</span>
              </span>
            </Link>

            <p className="text-sm leading-relaxed max-w-sm">
              Empowering minds through online education. Learn in-demand skills
              from expert instructors, anywhere, at your own pace.
            </p>

            <div className="flex items-center gap-3">
              {socialLinks.map((social) => {
                const Icon = social.icon;
                return (
                  <a
                    key={social.label}
                    href={social.href}
                    aria-label={social.label}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="w-10 h-10 rounded-full bg-surface border border-border flex items-center justify-center text-foreground-muted transition-all hover:text-white hover:border-primary hover:bg-primary hover:-translate-y-0.5"
                  >
                    <Icon />
                  </a>
                );
              })}
            </div>
          </div>

          {/* Link columns */}
          {footerLinks.map((section) => (
            <div key={section.title} className="space-y-4">
              <h4 className="text-sm font-semibold uppercase tracking-wider text-foreground">
                {section.title}
              </h4>
              <ul className="space-y-3">
                {section.links.map((link) => (
                  <li key={link.href}>
                    <a
                      href={link.href}
                      className="inline-block text-sm transition-all hover:text-primary hover:translate-x-0.5"
                    >
                      {link.label}
                    </a>
                  </li>
                ))}
              </ul>
            </div>
          ))}
        </div>

        <div className="mt-12 pt-6 border-t border-border flex flex-col md:flex-row items-center justify-between gap-4">
          <p className="text-sm">
            © {CURRENT_YEAR} LearnSphere. All rights reserved.
          </p>
          <p className="text-sm flex items-center gap-2">
            Built with{" "}
            <Heart className="w-4 h-4 text-destructive" fill="currentColor" />{" "}
            for learners worldwide
          </p>
        </div>
      </div>
    </footer>
  );
};

export default Footer;

import { Heart } from "lucide-react";

import { footerLinks } from "@/constants/footerLinks";
import { socialLinks } from "@/constants/socialLinks";
import Logo from "@/components/common/navbar/Logo";
import { CURRENT_YEAR } from "@/constants/appConstants";

const Footer = () => {
  return (
    <footer className="bg-surface text-foreground-muted pt-16 pb-8 px-4 sm:px-6 lg:px-8 border-t border-border">
      <div className="max-w-7xl mx-auto">
        {/* Main Footer Content */}
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8 lg:gap-12">
          {footerLinks.map((section) => (
            <div key={section.title} className="space-y-4">
              <h4 className="text-foreground font-semibold text-lg relative pb-2 after:content-[''] after:absolute after:left-0 after:bottom-0 after:w-12 after:h-0.5 after:bg-primary">
                {section.title}
              </h4>
              <ul className="space-y-3">
                {section.links.map((link) => (
                  <li key={link.href}>
                    <a
                      href={link.href}
                      className="text-foreground-muted hover:text-primary text-sm transition-colors inline-block"
                    >
                      {link.label}
                    </a>
                  </li>
                ))}
              </ul>
            </div>
          ))}
        </div>
        {/* Social Links & Copyright */}
        <div className="mt-12 pt-8 border-t border-border">
          <div className="flex flex-col md:flex-row justify-between items-center gap-6">
            {/* Logo/Brand */}
            <div className="flex items-center gap-2">
              <Logo />
              <span className="text-sm text-foreground-muted ml-2">
                © {CURRENT_YEAR}
              </span>
            </div>

            {/* Social Icons */}
            <div className="flex items-center gap-4">
              {socialLinks.map((social) => {
                const Icon = social.icon;
                return (
                  <a
                    key={social.label}
                    href={social.href}
                    className="w-10 h-10 bg-surface-muted hover:bg-primary rounded-full flex items-center justify-center text-lg text-foreground-muted hover:text-white transition-colors"
                    aria-label={social.label}
                    target="_blank"
                    rel="noopener noreferrer"
                  >
                    <Icon />
                  </a>
                );
              })}
            </div>

            {/* Copyright */}
            <p className="text-foreground-muted text-sm text-center md:text-right">
              Empowering minds through online education
            </p>
          </div>
        </div>

        {/* Bottom Bar with Additional Info */}
        <div className="mt-8 pt-4 text-center">
          <p className="text-xs text-foreground-muted flex items-center justify-center gap-2">
            Built with <Heart className="w-4 h-4" fill="currentColor" /> for
            learners worldwide. All rights reserved.
          </p>
        </div>
      </div>
    </footer>
  );
};

export default Footer;

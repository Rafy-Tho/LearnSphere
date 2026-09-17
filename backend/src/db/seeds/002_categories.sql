-- ============================================================================
-- SEED 002: Categories
-- 10 general tech/IT categories.
-- Idempotent: INSERT ... ON CONFLICT (slug) DO NOTHING keeps rows stable.
-- ============================================================================

INSERT INTO categories (id, name, slug, description) VALUES
  ('20000000-0000-4000-8000-000000000001', 'Web Development',               'web-development',               'Build websites and web applications with modern tools and frameworks.'),
  ('20000000-0000-4000-8000-000000000002', 'Programming Fundamentals',      'programming-fundamentals',      'Core programming concepts, logic, and problem solving in any language.'),
  ('20000000-0000-4000-8000-000000000003', 'Data Science',                  'data-science',                  'Analyze data, build models, and extract insights with statistics and machine learning.'),
  ('20000000-0000-4000-8000-000000000004', 'Cloud Computing',               'cloud-computing',               'Deploy, manage, and scale infrastructure on major cloud platforms.'),
  ('20000000-0000-4000-8000-000000000005', 'Cybersecurity',                 'cybersecurity',                 'Protect systems, networks, and data from threats and attacks.'),
  ('20000000-0000-4000-8000-000000000006', 'Networking',                    'networking',                    'Understand how devices communicate across local and wide area networks.'),
  ('20000000-0000-4000-8000-000000000007', 'Mobile Development',            'mobile-development',            'Create native and cross-platform applications for iOS and Android.'),
  ('20000000-0000-4000-8000-000000000008', 'Database & Administration',     'database-administration',       'Design, manage, and optimize relational and NoSQL databases.'),
  ('20000000-0000-4000-8000-000000000009', 'DevOps & CI/CD',                'devops-cicd',                   'Automate software delivery, infrastructure, and operations.'),
  ('20000000-0000-4000-8000-000000000010', 'Software Design & Architecture','software-design-architecture',  'Design maintainable, scalable, and testable software systems.')
ON CONFLICT (slug) DO NOTHING;
-- ============================================================================
-- SEED 027: Complete course — "Google Cloud Platform Essentials"
-- ----------------------------------------------------------------------------
-- Instructor : David Kim          (10000000-0000-4000-8000-000000000004)
-- Category   : Cloud Computing    (20000000-0000-4000-8000-000000000004)
-- Level      : BEGINNER · Access : FREE · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Cloud & Getting Started → C1 Cloud Fundamentals · C2 Projects & IAM
--   M2 Compute Fundamentals    → C3 Compute Engine · C4 App Engine & Cloud Run
--   M3 Storage & Databases     → C5 Cloud Storage · C6 Cloud SQL & Firestore
--   M4 Networking & Operations → C7 Networking & VPC · C8 Monitoring & Cost
--   M5 Capstone: Deploy to GCP → C9 Capstone Orientation · C10 Capstone Build
--
-- Content: 19 TEXT lessons with lesson_contents (self-contained HTML + inline
-- CSS, dollar-quoted so apostrophes need no escaping) and 9 QUIZ lessons with
-- 29 questions / 116 options across quizzes + `quizzes` and `quiz_options`.
--
-- Idempotency: every statement uses ON CONFLICT (id) DO NOTHING with fixed,
-- deterministic UUIDs, so this file can be re-run safely.
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 1. COURSE + OBJECTIVES
-- ----------------------------------------------------------------------------

INSERT INTO courses (
  id, instructor_id, category_id, name, slug, description, status, level, access_type, position
) VALUES (
  '01B00000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000004',
  '20000000-0000-4000-8000-000000000004',
  'Google Cloud Platform Essentials',
  'google-cloud-platform-essentials',
  'Learn Google Cloud Platform from the ground up. Understand core cloud concepts, set up projects and IAM, launch Compute Engine VMs, deploy apps with App Engine and Cloud Run, store data in Cloud Storage, Cloud SQL and Firestore, design VPC networks, monitor and log your systems, control costs, and finish by deploying a complete capstone application.',
  'PUBLISHED',
  'BEGINNER',
  'FREE',
  25
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('01B00000-0000-4000-8000-000000000011', '01B00000-0000-4000-8000-000000000001', 'Explain core cloud concepts and how Google Cloud global infrastructure is organized.', 1),
  ('01B00000-0000-4000-8000-000000000012', '01B00000-0000-4000-8000-000000000001', 'Create projects, manage IAM roles, and understand billing, budgets, and quotas.', 2),
  ('01B00000-0000-4000-8000-000000000013', '01B00000-0000-4000-8000-000000000001', 'Deploy and manage workloads with Compute Engine, App Engine, and Cloud Run.', 3),
  ('01B00000-0000-4000-8000-000000000014', '01B00000-0000-4000-8000-000000000001', 'Store objects and manage data with Cloud Storage, Cloud SQL, and Cloud Firestore.', 4),
  ('01B00000-0000-4000-8000-000000000015', '01B00000-0000-4000-8000-000000000001', 'Design VPC networks, monitor and log services, control cost, and deploy a capstone application.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('01B00000-0000-4000-8000-000000000101', '01B00000-0000-4000-8000-000000000001', 1, 'Cloud & Getting Started',   'Learn what cloud computing is and how to organize Google Cloud projects.', 'PUBLISHED'),
  ('01B00000-0000-4000-8000-000000000102', '01B00000-0000-4000-8000-000000000001', 2, 'Compute Fundamentals',      'Run workloads on Compute Engine, App Engine, and Cloud Run.',             'PUBLISHED'),
  ('01B00000-0000-4000-8000-000000000103', '01B00000-0000-4000-8000-000000000001', 3, 'Storage & Databases',       'Store objects and run managed relational and NoSQL databases.',           'PUBLISHED'),
  ('01B00000-0000-4000-8000-000000000104', '01B00000-0000-4000-8000-000000000001', 4, 'Networking & Operations',   'Design VPCs, load balancing, monitoring, logging, and cost control.',     'PUBLISHED'),
  ('01B00000-0000-4000-8000-000000000105', '01B00000-0000-4000-8000-000000000001', 5, 'Capstone: Deploy to GCP',   'Combine all services into a complete cloud deployment.',                  'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('01B00000-0000-4000-8000-000000000201', '01B00000-0000-4000-8000-000000000101', 1, 'Cloud Fundamentals',           'Cloud concepts and Google Cloud global infrastructure.',          'PUBLISHED'),
  ('01B00000-0000-4000-8000-000000000202', '01B00000-0000-4000-8000-000000000101', 2, 'Projects & IAM',               'Projects, IAM roles, billing, budgets, and quotas.',              'PUBLISHED'),
  ('01B00000-0000-4000-8000-000000000203', '01B00000-0000-4000-8000-000000000102', 1, 'Compute Engine',               'Virtual machines, disks, snapshots, and images.',                 'PUBLISHED'),
  ('01B00000-0000-4000-8000-000000000204', '01B00000-0000-4000-8000-000000000102', 2, 'App Engine & Cloud Run',       'Managed web apps and serverless containers.',                     'PUBLISHED'),
  ('01B00000-0000-4000-8000-000000000205', '01B00000-0000-4000-8000-000000000103', 1, 'Cloud Storage',                'Object storage, buckets, storage classes, and lifecycle.',        'PUBLISHED'),
  ('01B00000-0000-4000-8000-000000000206', '01B00000-0000-4000-8000-000000000103', 2, 'Cloud SQL & Firestore',        'Managed relational databases and NoSQL document stores.',         'PUBLISHED'),
  ('01B00000-0000-4000-8000-000000000207', '01B00000-0000-4000-8000-000000000104', 1, 'Networking & VPC',             'VPCs, subnets, firewalls, load balancing, and Cloud DNS.',        'PUBLISHED'),
  ('01B00000-0000-4000-8000-000000000208', '01B00000-0000-4000-8000-000000000104', 2, 'Monitoring & Cost',            'Monitoring, logging, budgets, and cost optimization.',            'PUBLISHED'),
  ('01B00000-0000-4000-8000-000000000209', '01B00000-0000-4000-8000-000000000105', 1, 'Capstone Orientation',         'Plan the architecture and prepare your project.',                 'PUBLISHED'),
  ('01B00000-0000-4000-8000-000000000210', '01B00000-0000-4000-8000-000000000105', 2, 'Capstone Build',               'Build, secure, and operate the complete deployment.',             'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 01B00000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('01B00000-0000-4000-8000-000000000301', '01B00000-0000-4000-8000-000000000201', 1, 'What Is Cloud Computing?',             'Understand what cloud computing is, its benefits, and the IaaS, PaaS, and SaaS service models.',                                              'TEXT',  'PUBLISHED', 'FREE', 10,  5),
  ('01B00000-0000-4000-8000-000000000302', '01B00000-0000-4000-8000-000000000201', 2, 'Google Cloud Overview',                'Tour Google Cloud products, its global infrastructure, regions and zones, and the shared responsibility model.',                            'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01B00000-0000-4000-8000-000000000303', '01B00000-0000-4000-8000-000000000201', 3, 'Cloud Fundamentals Quiz',              'Check your knowledge of cloud foundations with a short quiz.',                                                                             'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01B00000-0000-4000-8000-000000000304', '01B00000-0000-4000-8000-000000000202', 1, 'Projects & IAM',                       'Organize resources with projects and secure them with IAM roles, policies, and service accounts.',                                        'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01B00000-0000-4000-8000-000000000305', '01B00000-0000-4000-8000-000000000202', 2, 'Billing & Quotas',                     'Understand billing accounts, budgets, alerts, and how quotas protect your project.',                                                    'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01B00000-0000-4000-8000-000000000306', '01B00000-0000-4000-8000-000000000202', 3, 'Projects, IAM & Billing Quiz',         'Quiz on projects, IAM, billing, and quotas.',                                                                                             'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01B00000-0000-4000-8000-000000000307', '01B00000-0000-4000-8000-000000000203', 1, 'Compute Engine Virtual Machines',      'Create and manage Compute Engine virtual machines with the right machine types and images.',                                              'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01B00000-0000-4000-8000-000000000308', '01B00000-0000-4000-8000-000000000203', 2, 'Disks & Machine Images',               'Work with persistent disks, snapshots, and custom images for reliable VMs.',                                                             'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01B00000-0000-4000-8000-000000000309', '01B00000-0000-4000-8000-000000000203', 3, 'Compute Engine Quiz',                  'Quiz on Compute Engine concepts.',                                                                                                        'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01B00000-0000-4000-8000-000000000310', '01B00000-0000-4000-8000-000000000204', 1, 'App Engine: Managed Web Apps',         'Deploy managed web applications with App Engine and its standard and flexible environments.',                                             'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01B00000-0000-4000-8000-000000000311', '01B00000-0000-4000-8000-000000000204', 2, 'Cloud Run: Containers Without Servers','Run containers without managing servers using Cloud Run.',                                                                             'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01B00000-0000-4000-8000-000000000312', '01B00000-0000-4000-8000-000000000204', 3, 'App Engine & Cloud Run Quiz',          'Quiz on App Engine and Cloud Run.',                                                                                                       'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01B00000-0000-4000-8000-000000000313', '01B00000-0000-4000-8000-000000000205', 1, 'Cloud Storage: Objects & Buckets',     'Store and retrieve objects in Cloud Storage buckets using gsutil and the console.',                                                       'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01B00000-0000-4000-8000-000000000314', '01B00000-0000-4000-8000-000000000205', 2, 'Storage Classes & Lifecycle',          'Choose the right storage class and manage data lifecycle and retention.',                                                                 'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01B00000-0000-4000-8000-000000000315', '01B00000-0000-4000-8000-000000000205', 3, 'Cloud Storage Quiz',                   'Quiz on Cloud Storage.',                                                                                                                  'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01B00000-0000-4000-8000-000000000316', '01B00000-0000-4000-8000-000000000206', 1, 'Cloud SQL: Managed Databases',         'Set up managed relational databases with Cloud SQL and high availability.',                                                               'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01B00000-0000-4000-8000-000000000317', '01B00000-0000-4000-8000-000000000206', 2, 'Cloud Firestore: NoSQL Documents',     'Model flexible NoSQL data in Cloud Firestore with collections, documents, and rules.',                                                    'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01B00000-0000-4000-8000-000000000318', '01B00000-0000-4000-8000-000000000206', 3, 'Cloud SQL & Firestore Quiz',           'Quiz on Cloud SQL and Firestore.',                                                                                                        'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01B00000-0000-4000-8000-000000000319', '01B00000-0000-4000-8000-000000000207', 1, 'VPC Networks & Subnets',               'Design VPC networks, subnets, firewall rules, and private access.',                                                                      'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01B00000-0000-4000-8000-000000000320', '01B00000-0000-4000-8000-000000000207', 2, 'Load Balancing & Cloud DNS',           'Distribute traffic with load balancers and manage DNS in Google Cloud.',                                                                 'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01B00000-0000-4000-8000-000000000321', '01B00000-0000-4000-8000-000000000207', 3, 'Networking & VPC Quiz',                'Quiz on VPC networking and load balancing.',                                                                                              'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01B00000-0000-4000-8000-000000000322', '01B00000-0000-4000-8000-000000000208', 1, 'Monitoring & Logging',                 'Gain visibility with Cloud Monitoring and Cloud Logging.',                                                                                'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01B00000-0000-4000-8000-000000000323', '01B00000-0000-4000-8000-000000000208', 2, 'Cost Management & Budgets',            'Control cloud spending with budgets, alerts, and cost recommendations.',                                                                  'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01B00000-0000-4000-8000-000000000324', '01B00000-0000-4000-8000-000000000208', 3, 'Observability & Cost Quiz',            'Quiz on monitoring, logging, and cost management.',                                                                                       'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01B00000-0000-4000-8000-000000000325', '01B00000-0000-4000-8000-000000000209', 1, 'Capstone: Plan the Deployment',        'Plan the capstone: choose services, define an architecture, and prepare a project.',                                                       'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01B00000-0000-4000-8000-000000000326', '01B00000-0000-4000-8000-000000000210', 1, 'Capstone: Platform Components',        'Build the capstone: deploy a web app, a database, and storage on Google Cloud.',                                                           'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('01B00000-0000-4000-8000-000000000327', '01B00000-0000-4000-8000-000000000210', 2, 'Capstone: Best Practices & Security',  'Harden the capstone with secrets, least privilege, and operational best practices.',                                                       'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01B00000-0000-4000-8000-000000000328', '01B00000-0000-4000-8000-000000000210', 3, 'Final Assessment',                     'Complete the course with a comprehensive final assessment.',                                                                              'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 01B00000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '01B00000-0000-4000-8000-000000000401',
  '01B00000-0000-4000-8000-000000000301',
  1,
  'What Is Cloud Computing?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What Is Cloud Computing?</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #4285f4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1a73e8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e8f0fe; color: #1a73e8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e8f0fe; border-left: 4px solid #4285f4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #2563eb; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e8f0fe; color: #1a73e8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #8ab4f8; }
.dark .lesson-page h2 { color: #8ab4f8; }
.dark .lesson-page .ic { background: #0b2e5f; color: #a8c7fa; }
.dark .lesson-page .callout { background: #0b2e5f; border-left-color: #4285f4; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b2e5f; color: #8ab4f8; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>What Is Cloud Computing?</h1>
  <p>Cloud computing is the delivery of <strong>compute, storage, and networking</strong> over the internet, on demand, and billed by usage. Instead of buying and racking physical servers, you rent capacity from a provider such as Google Cloud and pay only for what you consume.</p>
  <p>Google Cloud runs millions of servers across data centers worldwide. When you create a virtual machine, store an object, or run a database, the underlying hardware is invisible — you interact only with a service. This model favors speed, elasticity, and innovation because infrastructure stops being a bottleneck.</p>
  <h2>The defining benefits</h2>
  <ul>
    <li><strong>On-demand self-service</strong> — provision resources without waiting for hardware.</li>
    <li><strong>Rapid elasticity</strong> — scale up and down automatically as demand changes.</li>
    <li><strong>Measured service</strong> — pay per use, with no surprise capacity bills.</li>
    <li><strong>Global reach</strong> — deploy workloads close to users in many regions.</li>
    <li><strong>Managed services</strong> — let the provider handle updates, backups, and failover.</li>
  </ul>
  <h2>Service models</h2>
  <table>
    <tr><th>Model</th><th>You manage</th><th>Provider manages</th><th>GCP example</th></tr>
    <tr><td>IaaS</td><td>OS, apps, data</td><td>Servers, storage, networking</td><td>Compute Engine</td></tr>
    <tr><td>PaaS</td><td>Application code</td><td>Runtime, OS, infrastructure</td><td>App Engine</td></tr>
    <tr><td>SaaS</td><td>Configuration and use</td><td>Everything</td><td>Google Workspace</td></tr>
  </table>
  <p>IaaS (Infrastructure as a Service) gives raw building blocks. PaaS (Platform as a Service) removes infrastructure management entirely. SaaS products work out of the box. Most teams blend all three.</p>
  <div class="callout callout-info">
    <strong>Why cloud wins</strong>
    <p>Speed to market, elastic scaling, global distribution, and shifting cost from large capital purchases (CAPEX) to predictable operational spending (OPEX).</p>
  </div>
  <div class="callout callout-tip">
    <strong>Try it yourself</strong>
    <p>New accounts receive free-trial credit plus an always-free tier. In the next lessons you will create a real Google Cloud project and explore it safely.</p>
  </div>
  <h2>What you will build</h2>
  <p>Over the course you will learn how to assemble Google Cloud services — VMs, serverless platforms, storage, databases, and networking — and combine them into a capstone deployment of a small web application.</p>
</div>
</body>
</html>
$html$
),
(
  '01B00000-0000-4000-8000-000000000402',
  '01B00000-0000-4000-8000-000000000302',
  1,
  'Google Cloud Overview',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Google Cloud Overview</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #4285f4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1a73e8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e8f0fe; color: #1a73e8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e8f0fe; border-left: 4px solid #4285f4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #2563eb; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e8f0fe; color: #1a73e8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #8ab4f8; }
.dark .lesson-page h2 { color: #8ab4f8; }
.dark .lesson-page .ic { background: #0b2e5f; color: #a8c7fa; }
.dark .lesson-page .callout { background: #0b2e5f; border-left-color: #4285f4; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b2e5f; color: #8ab4f8; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Google Cloud Overview</h1>
  <p>Google Cloud Platform (GCP) is a broad suite of services organized into clusters: <strong>Compute</strong>, <strong>Storage</strong>, <strong>Databases</strong>, <strong>Networking</strong>, <strong>Security</strong>, <strong>Big Data</strong>, and <strong>Machine Learning</strong>. This course focuses on the fundamentals that every cloud practitioner needs.</p>
  <h2>Global infrastructure</h2>
  <p>Google Cloud is built on a physical network of <strong>regions</strong> and <strong>zones</strong>:</p>
  <ul>
    <li>A <strong>region</strong> is a geographic area with low-latency internal links, e.g. <span class="ic">us-central1</span>.</li>
    <li>A <strong>zone</strong> is an isolated data center within a region, e.g. <span class="ic">us-central1-a</span>.</li>
    <li>Distributing resources across zones and regions provides <strong>high availability</strong>.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Choose regions wisely</strong>
    <p>Place workloads near your users for latency, and spread critical components across zones so a single failure does not take down the service.</p>
  </div>
  <h2>Projects as containers</h2>
  <p>Everything in Google Cloud lives inside a <strong>project</strong>. A project groups your resources, isolates permissions, and collects billing. The hierarchy is <span class="ic">organization → folders → projects → resources</span>.</p>
  <h2>Shared responsibility model</h2>
  <table>
    <tr><th>Layer</th><th>Google manages</th><th>You manage</th></tr>
    <tr><td>Physical data centers</td><td>Hardware, power, cooling</td><td>—</td></tr>
    <tr><td>Managed services (Cloud SQL, Cloud Run)</td><td>Patching, failover, backups</td><td>Data, configuration, access</td></tr>
    <tr><td>Virtual machines</td><td>Hypervisor, host security</td><td>Guest OS, apps, data</td></tr>
  </table>
  <p>The more managed the service, the more responsibility Google takes — and the less operational work you have.</p>
  <h2>Interacting with GCP</h2>
  <p>You can manage resources three ways: the <strong>Cloud Console</strong> (web UI), the <strong>gcloud CLI</strong> (terminal), and <strong>REST APIs</strong> or SDKs. The console is great for exploring; gcloud is great for scripting.</p>
  <pre class="code-block">&gt; gcloud config list project
&gt; gcloud compute regions list | head</pre>
  <div class="callout callout-info">
    <strong>Always-free tier</strong>
    <p>GCP offers small amounts of compute, storage, and databases at no cost each month — ideal for learning before you spend anything.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01B00000-0000-4000-8000-000000000404',
  '01B00000-0000-4000-8000-000000000304',
  1,
  'Projects & IAM',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Projects &amp; IAM</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #4285f4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1a73e8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e8f0fe; color: #1a73e8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e8f0fe; border-left: 4px solid #4285f4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #2563eb; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e8f0fe; color: #1a73e8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #8ab4f8; }
.dark .lesson-page h2 { color: #8ab4f8; }
.dark .lesson-page .ic { background: #0b2e5f; color: #a8c7fa; }
.dark .lesson-page .callout { background: #0b2e5f; border-left-color: #4285f4; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b2e5f; color: #8ab4f8; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Projects &amp; IAM (Identity and Access Management)</h1>
  <p>Every Google Cloud resource — a VM, a bucket, a database — belongs to exactly one <strong>project</strong>. Projects are the foundation of organization, permissions, and billing.</p>
  <h2>The resource hierarchy</h2>
  <p>Google Cloud organizes resources in a tree: <span class="ic">Organization</span> at the top, then <span class="ic">Folders</span>, then <span class="ic">Projects</span>, then the resources inside each project. Access granted at a higher level flows down to everything below it.</p>
  <ul>
    <li><strong>Organization</strong> — your company or team domain, an optional root.</li>
    <li><strong>Folder</strong> — groups projects by department, environment, or team.</li>
    <li><strong>Project</strong> — the billing and permission boundary you use daily.</li>
  </ul>
  <h2>The IAM model</h2>
  <p>IAM answers three questions: <em>Who</em> can do <em>what</em> on <em>which</em> resource?</p>
  <pre class="code-block">iam policy:
  member (who)   → role (what)   → resource (which)

  user@example.com → roles/compute.instanceAdmin → my-vm-instance</pre>
  <h2>Roles</h2>
  <table>
    <tr><th>Role type</th><th>Example</th><th>Best for</th></tr>
    <tr><td>Basic</td><td>Owner, Editor, Viewer</td><td>Broad access; avoid in production</td></tr>
    <tr><td>Predefined</td><td>roles/compute.instanceAdmin</td><td>Common job functions</td></tr>
    <tr><td>Custom</td><td>roles/myCompany.readOnlyCPUs</td><td>Fine-grained needs</td></tr>
  </table>
  <p>Predefined and custom roles follow the <strong>principle of least privilege</strong>: grant only the permissions a person or service actually needs.</p>
  <h2>Service accounts</h2>
  <p>Applications need identities too. A <strong>service account</strong> is an identity used by a VM, Cloud Run service, or scheduled job to call Google Cloud APIs — no human credentials required.</p>
  <pre class="code-block">gcloud iam service-accounts create app-sa \
  --display-name="App service account"</pre>
  <div class="callout callout-tip">
    <strong>Prefer managed keys over service-account keys</strong>
    <p>Google recommends attaching service accounts to resources instead of downloading JSON key files, which are a common leak source.</p>
  </div>
  <div class="callout callout-info">
    <strong>Audit early, audit often</strong>
    <p>A tiny misconfiguration can expose data. Review IAM policies for your project regularly with the Cloud Console or <span class="ic">gcloud projects get-iam-policy</span>.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01B00000-0000-4000-8000-000000000405',
  '01B00000-0000-4000-8000-000000000305',
  1,
  'Billing & Quotas',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Billing &amp; Quotas</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #4285f4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1a73e8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e8f0fe; color: #1a73e8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e8f0fe; border-left: 4px solid #4285f4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #2563eb; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e8f0fe; color: #1a73e8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #8ab4f8; }
.dark .lesson-page h2 { color: #8ab4f8; }
.dark .lesson-page .ic { background: #0b2e5f; color: #a8c7fa; }
.dark .lesson-page .callout { background: #0b2e5f; border-left-color: #4285f4; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b2e5f; color: #8ab4f8; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Billing &amp; Quotas</h1>
  <p>Cloud is cheap at the start and expensive when uncontrolled. This lesson explains the money layer: <strong>billing accounts</strong>, <strong>budgets</strong>, and the <strong>quotas</strong> that keep your project safe.</p>
  <h2>Billing accounts</h2>
  <p>A <strong>billing account</strong> is a payment container, linked to one or more projects. It defines the payment method (card or invoice) and owns all the cost generated by those projects.</p>
  <pre class="code-block">gcloud billing projects link PROJECT_ID \
  --billing-account=012345-6789AB-CDEF01</pre>
  <h2>Budgets and alerts</h2>
  <p>Set a <strong>budget</strong> on a billing account (or a project) and attach alert thresholds — for example notify me at 50%, 90%, and 100% of the expected monthly spend.</p>
  <div class="callout">
    <strong>Budgets warn — they do not stop</strong>
    <p>A budget only sends notifications. Automate guardrails separately, for example Cloud Functions that pause expensive workloads or Cloud Billing export to BigQuery for analysis.</p>
  </div>
  <h2>How costs form</h2>
  <table>
    <tr><th>Resource</th><th>Billed by</th><th>Example</th></tr>
    <tr><td>Compute Engine VM</td><td>Per second while running</td><td>e2-medium 1 vCPU, 4 GB</td></tr>
    <tr><td>Cloud Storage</td><td>Per GB per month + access</td><td>Standard, Nearline, Archive</td></tr>
    <tr><td>Cloud SQL</td><td>Per hour by tier</td><td>db-f1-micro vs db-n1-standard-2</td></tr>
    <tr><td>Egress</td><td>Per GB leaving Google Cloud</td><td>0.12 USD per GB typical</td></tr>
  </table>
  <h2>Quotas and limits</h2>
  <p>Quotas protect you (and Google) from runaway usage. They limit how many VMs, buckets, or API calls a project can make. Hitting a quota returns an error such as <span class="ic">QUOTA_EXCEEDED</span>, not a surprise bill.</p>
  <ul>
    <li><strong>Rate quotas</strong> — API requests per minute.</li>
    <li><strong>Resource quotas</strong> — maximum number of instances, disks, or other objects.</li>
  </ul>
  <pre class="code-block">gcloud projects describe PROJECT_ID \
  --format="value(projectNumber)"</pre>
  <div class="callout callout-info">
    <strong>Free tier keeps learning free</strong>
    <p>One e2-micro VM, 5 GB of Cloud Storage, and a Firestore database are part of the always-free tier. Perfect for following this course.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01B00000-0000-4000-8000-000000000407',
  '01B00000-0000-4000-8000-000000000307',
  1,
  'Compute Engine Virtual Machines',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Compute Engine Virtual Machines</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #4285f4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1a73e8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e8f0fe; color: #1a73e8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e8f0fe; border-left: 4px solid #4285f4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #2563eb; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e8f0fe; color: #1a73e8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #8ab4f8; }
.dark .lesson-page h2 { color: #8ab4f8; }
.dark .lesson-page .ic { background: #0b2e5f; color: #a8c7fa; }
.dark .lesson-page .callout { background: #0b2e5f; border-left-color: #4285f4; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b2e5f; color: #8ab4f8; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Compute Engine Virtual Machines</h1>
  <p><strong>Compute Engine</strong> is Google Cloud IaaS: resizable Linux and Windows <strong>virtual machines</strong> that run on Google infrastructure. You choose the size, the operating system, and the region, then connect over SSH or RDP.</p>
  <h2>Choosing a machine type</h2>
  <p>Machine types are grouped into <strong>families</strong> by workload shape:</p>
  <table>
    <tr><th>Family</th><th>Best for</th><th>Example</th></tr>
    <tr><td>General-purpose (E2, N2)</td><td>Web apps, dev servers</td><td>e2-standard-4</td></tr>
    <tr><td>Compute-optimized (C3)</td><td>Batch, transcoding, ML training</td><td>c3-standard-8</td></tr>
    <tr><td>Memory-optimized (M3)</td><td>Large in-memory stores</td><td>m3-ultramem-32</td></tr>
    <tr><td>Accelerator-optimized</td><td>GPU and TPU workloads</td><td>a2-highgpu-1g</td></tr>
  </table>
  <p>Sizes follow the pattern <span class="ic">&lt;family&gt;-&lt;class&gt;-&lt;vCPUs&gt;</span>. Start small and move up only when metrics prove you need more.</p>
  <h2>Creating an instance</h2>
  <pre class="code-block">gcloud compute instances create app-server \
    --zone=us-central1-a \
    --machine-type=e2-small \
    --image-family=ubuntu-2204-lts \
    --image-project=ubuntu-os-cloud \
    --tags=web \
    --labels=env=dev</pre>
  <p>Every instance needs a <strong>boot image</strong> (the base OS), a <strong>boot disk</strong>, and a <strong>zone</strong>. The <span class="ic">--tags</span> flag later lets firewall rules target this machine.</p>
  <h2>Connecting</h2>
  <p>SSH is built in — no separate client setup needed:</p>
  <pre class="code-block">gcloud compute ssh app-server --zone=us-central1-a</pre>
  <p>This opens a shell, injects your SSH keys securely, and keeps permissions in the metadata server rather than on disk.</p>
  <h2>VM lifecycle</h2>
  <ul>
    <li><span class="ic">RUNNING</span> — billed per second.</li>
    <li><span class="ic">STOPPED</span> — compute stops; disks and static IPs still bill.</li>
    <li><span class="ic">TERMINATED (deleted)</span> — everything is removed.</li>
    <li><strong>Maintenance</strong> — Google can live-migrate VMs to other hosts without losing data.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Autoscaling later</strong>
    <p>You will often run one VM for learning, but production systems use <strong>Instance Groups</strong> that add or remove VMs automatically based on CPU or load balancer metrics.</p>
  </div>
  <div class="callout callout-info">
    <strong>Stop unused VMs</strong>
    <p>The easiest bill to cut is a forgotten VM. Set a schedule, watch utilization, and turn off what is not serving traffic.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01B00000-0000-4000-8000-000000000408',
  '01B00000-0000-4000-8000-000000000308',
  1,
  'Disks & Machine Images',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Disks &amp; Machine Images</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #4285f4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1a73e8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e8f0fe; color: #1a73e8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e8f0fe; border-left: 4px solid #4285f4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #2563eb; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e8f0fe; color: #1a73e8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #8ab4f8; }
.dark .lesson-page h2 { color: #8ab4f8; }
.dark .lesson-page .ic { background: #0b2e5f; color: #a8c7fa; }
.dark .lesson-page .callout { background: #0b2e5f; border-left-color: #4285f4; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b2e5f; color: #8ab4f8; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Disks &amp; Machine Images</h1>
  <p>Virtual machines are only as reliable as the disks and images behind them. This lesson covers persistent disks, snapshots, and images — the pieces that survive a VM reboot or a disaster.</p>
  <h2>Persistent disks</h2>
  <p><strong>Persistent Disks</strong> are durable network-attached block storage. They detach from a VM, attach to another, and keep data even while the VM is stopped.</p>
  <table>
    <tr><th>Type</th><th>Performance</th><th>Use for</th></tr>
    <tr><td>pd-standard</td><td>Balanced HDD</td><td>Backups, bulk storage</td></tr>
    <tr><td>pd-balanced</td><td>SSD, middle ground</td><td>General workloads</td></tr>
    <tr><td>pd-ssd</td><td>High random IOPS</td><td>Databases, latency-sensitive apps</td></tr>
  </table>
  <p>Create an extra disk and attach it:</p>
  <pre class="code-block">gcloud compute disks create data-disk \
    --zone=us-central1-a --size=20GB --type=pd-ssd
gcloud compute instances attach-disk app-server \
    --disk=data-disk --zone=us-central1-a</pre>
  <h2>Snapshots: your safety net</h2>
  <p>A <strong>snapshot</strong> is a point-in-time, incremental backup of a disk. Only changed blocks are stored after the first snapshot, so backups stay small and cheap.</p>
  <pre class="code-block">gcloud compute snapshots create app-snapshot-01 \
    --source-disk=data-disk \
    --source-disk-zone=us-central1-a</pre>
  <p>Restore it by creating a new disk from the snapshot, then attach it to a VM.</p>
  <div class="callout callout-tip">
    <strong>Snapshot before changes</strong>
    <p>Run a snapshot before OS upgrades, risky migrations, or app releases. A cheap snapshot turns a failed upgrade into a two-minute restore.</p>
  </div>
  <h2>Machine images</h2>
  <p>A <strong>machine image</strong> snapshots an entire instance — boot disk, data disks, and VM metadata — so you can recreate the machine later. Custom images let teams ship a pre-configured OS baseline.</p>
  <h2>Regional vs zonal disks</h2>
  <p>A zonal disk lives in one zone; a <strong>regional disk</strong> replicates across two zones in the same region for higher durability. Choose regional for databases and critical state.</p>
  <div class="callout callout-info">
    <strong>Disks bill while stopped</strong>
    <p>Stopping a VM stops compute charges, but persistent disks and snapshots still bill per GB. Right-size them and clean up unused volumes.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01B00000-0000-4000-8000-000000000410',
  '01B00000-0000-4000-8000-000000000310',
  1,
  'App Engine: Managed Web Apps',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>App Engine: Managed Web Apps</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #4285f4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1a73e8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e8f0fe; color: #1a73e8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e8f0fe; border-left: 4px solid #4285f4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #2563eb; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e8f0fe; color: #1a73e8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #8ab4f8; }
.dark .lesson-page h2 { color: #8ab4f8; }
.dark .lesson-page .ic { background: #0b2e5f; color: #a8c7fa; }
.dark .lesson-page .callout { background: #0b2e5f; border-left-color: #4285f4; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b2e5f; color: #8ab4f8; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>App Engine: Managed Web Apps</h1>
  <p><strong>App Engine</strong> is a PaaS that runs your web application without you managing servers. Give it code, a configuration file, and a region — App Engine provisions the runtime, scales instances, and handles load balancing.</p>
  <h2>Two environments</h2>
  <ul>
    <li><strong>Standard environment</strong> — language runtimes (Python, Node.js, Go, Java, PHP, Ruby) that can scale to zero. Great for lightweight, stateless apps.</li>
    <li><strong>Flexible environment</strong> — runs a customized runtime or a container from your Dockerfile on managed VMs.</li>
  </ul>
  <h2>The app.yaml file</h2>
  <p>Configuration lives in <span class="ic">app.yaml</span> at the root of your project:</p>
  <pre class="code-block">runtime: nodejs20
env_variables:
  BUCKET_NAME: my-app-bucket
automatic_scaling:
  min_instances: 1
  max_instances: 5</pre>
  <p>Then deploy with:</p>
  <pre class="code-block">gcloud app deploy --project=my-project</pre>
  <h2>Scaling modes</h2>
  <ul>
    <li><strong>Automatic</strong> — App Engine adds or removes instances by traffic.</li>
    <li><strong>Basic</strong> — instances are created on demand, great for batch jobs.</li>
    <li><strong>Manual</strong> — you fix the instance count for predictable workloads.</li>
  </ul>
  <h2>Versions and traffic splitting</h2>
  <p>Each deploy creates a <strong>version</strong>. You can keep old versions, promote one to receive all traffic, or split traffic gradually between versions — enabling canary releases with a simple command.</p>
  <pre class="code-block">gcloud app versions list
gcloud app services set-traffic default --splits v2=0.9,v1=0.1</pre>
  <div class="callout callout-tip">
    <strong>Free tier friendly</strong>
    <p>The standard environment offers a generous free daily quota, which makes App Engine a favorite for hobby projects and APIs that are occasionally hit.</p>
  </div>
  <div class="callout callout-info">
    <strong>State lives elsewhere</strong>
    <p>App Engine instances are ephemeral. Store persistent data in Cloud SQL, Firestore, or Cloud Storage — never on the instance file system.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01B00000-0000-4000-8000-000000000411',
  '01B00000-0000-4000-8000-000000000311',
  1,
  'Cloud Run: Containers Without Servers',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cloud Run: Containers Without Servers</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #4285f4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1a73e8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e8f0fe; color: #1a73e8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e8f0fe; border-left: 4px solid #4285f4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #2563eb; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e8f0fe; color: #1a73e8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #8ab4f8; }
.dark .lesson-page h2 { color: #8ab4f8; }
.dark .lesson-page .ic { background: #0b2e5f; color: #a8c7fa; }
.dark .lesson-page .callout { background: #0b2e5f; border-left-color: #4285f4; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b2e5f; color: #8ab4f8; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Cloud Run: Containers Without Servers</h1>
  <p><strong>Cloud Run</strong> executes containers as serverless HTTP services. You bring a container image; Cloud Run provisions CPU in milliseconds, scales from zero to thousands of instances, and bills only when your code is actually running.</p>
  <h2>Why containers plus serverless</h2>
  <p>Containers package an application with its dependencies so it runs the same everywhere. Serverless removes the servers. Cloud Run combines both: bring <span class="ic">container image</span>, get a <span class="ic">HTTPS URL</span>.</p>
  <h2>Deploying a service</h2>
  <pre class="code-block">gcloud run deploy hello-web \
    --image=gcr.io/my-project/hello:v1 \
    --region=us-central1 \
    --allow-unauthenticated</pre>
  <p>Cloud Run assigns a URL like <span class="ic">https://hello-web-xxxx-uc.a.run.app</span>. Add <span class="ic">--allow-unauthenticated</span> for a public site, or leave it off to require authenticated callers.</p>
  <h2>Key concepts</h2>
  <ul>
    <li><strong>Service</strong> — a managed HTTP endpoint that you can update many times.</li>
    <li><strong>Revision</strong> — an immutable snapshot of a deployment; keep old revisions for rollback.</li>
    <li><strong>Scale to zero</strong> — with zero minimum instances, no traffic means no compute cost.</li>
    <li><strong>Concurrency</strong> — how many requests one instance can serve at once (adjust for CPU-heavy code).</li>
  </ul>
  <h2>Configuring scaling and resources</h2>
  <pre class="code-block">gcloud run services update hello-web \
    --concurrency=80 \
    --memory=512Mi \
    --min-instances=1</pre>
  <p><span class="ic">--min-instances=1</span> keeps one warm instance for latency-sensitive apps; <span class="ic">--memory</span> and CPU control the billed size of each instance.</p>
  <div class="callout callout-info">
    <strong>Cloud Run jobs</strong>
    <p>Beyond web services, Cloud Run also runs <strong>jobs</strong> — long-running batch work invoked on a schedule, ideal for ETL and crawlers.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Zero-to-hero scaling</strong>
    <p>A brand-new service receives no traffic and costs nothing until it is called. This simplicity makes Cloud Run a favorite first stop for many teams.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01B00000-0000-4000-8000-000000000413',
  '01B00000-0000-4000-8000-000000000313',
  1,
  'Cloud Storage: Objects & Buckets',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cloud Storage: Objects &amp; Buckets</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #4285f4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1a73e8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e8f0fe; color: #1a73e8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e8f0fe; border-left: 4px solid #4285f4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #2563eb; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e8f0fe; color: #1a73e8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #8ab4f8; }
.dark .lesson-page h2 { color: #8ab4f8; }
.dark .lesson-page .ic { background: #0b2e5f; color: #a8c7fa; }
.dark .lesson-page .callout { background: #0b2e5f; border-left-color: #4285f4; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b2e5f; color: #8ab4f8; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Cloud Storage: Objects &amp; Buckets</h1>
  <p><strong>Cloud Storage</strong> is Google Cloud object storage: unlimited, durable, and billed per gigabyte. Use it for static files: images, videos, backups, uploads, and any blob of data your applications produce.</p>
  <h2>Buckets and objects</h2>
  <p>Data lives in <strong>objects</strong> inside <strong>buckets</strong>. A bucket is the container (like a top-level folder) and objects are the files, each with a name, content, and metadata.</p>
  <pre class="code-block">gs://my-app-assets/          <- bucket (globally unique name)
    images/hero.png
    videos/intro.mp4
    backups/daily_2026-01-01.sql</pre>
  <p>Bucket names must be globally unique across all of Google Cloud. Choose a region for the bucket to control latency and compliance.</p>
  <h2>Working with objects</h2>
  <pre class="code-block"># create a bucket
gsutil mb -l us-central1 gs://my-app-assets

# upload and download
gsutil cp ./hero.png gs://my-app-assets/images/
gsutil cp gs://my-app-assets/images/hero.png .

# list and fetch
gsutil ls gs://my-app-assets/images</pre>
  <p>Or use the newer unified tool, <span class="ic">gcloud storage</span>, which supports the same operations plus IAM-aware defaults.</p>
  <h2>Access control</h2>
  <p>By default buckets are <strong>private</strong>. You grant access with <strong>IAM</strong> (roles like <span class="ic">roles/storage.objectViewer</span>) or fine-grained <strong>ACLs</strong>. Public access must be enabled explicitly — avoid it unless serving a public website.</p>
  <div class="callout callout-tip">
    <strong>Use signed URLs for private sharing</strong>
    <p>To give someone temporary access to one object, generate a <span class="ic">signed URL</span> that expires — no need to make the bucket public.</p>
  </div>
  <h2>Encryption and integrity</h2>
  <p>Objects are encrypted at rest by default with Google-managed keys, and you can supply customer-managed keys for extra control. <strong>Checksums</strong> (MD5, CRC32C) verify uploads against corruption.</p>
  <h2>Versioning</h2>
  <p>Enable <strong>object versioning</strong> to keep a history of every overwrite, so a stray <span class="ic">cp</span> can never destroy data permanently.</p>
  <div class="callout callout-info">
    <strong>Not a database</strong>
    <p>Cloud Storage stores blobs, not queryable rows. If you need to filter and join, pair it with a database — the subject of an upcoming lesson.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01B00000-0000-4000-8000-000000000414',
  '01B00000-0000-4000-8000-000000000314',
  1,
  'Storage Classes & Lifecycle',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Storage Classes &amp; Lifecycle</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #4285f4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1a73e8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e8f0fe; color: #1a73e8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e8f0fe; border-left: 4px solid #4285f4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #2563eb; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e8f0fe; color: #1a73e8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #8ab4f8; }
.dark .lesson-page h2 { color: #8ab4f8; }
.dark .lesson-page .ic { background: #0b2e5f; color: #a8c7fa; }
.dark .lesson-page .callout { background: #0b2e5f; border-left-color: #4285f4; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b2e5f; color: #8ab4f8; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Storage Classes &amp; Lifecycle</h1>
  <p>Not all data is equal. Cloud Storage offers four <strong>storage classes</strong> that trade off price, retrieval cost, and minimum retention — letting you pay peanuts for cold archives and full price only for hot data.</p>
  <h2>The four classes</h2>
  <table>
    <tr><th>Class</th><th>Best for</th><th>Minimum retention</th><th>Retrieval</th></tr>
    <tr><td>Standard</td><td>Hot data, active websites</td><td>None</td><td>Instant</td></tr>
    <tr><td>Nearline</td><td>Once-a-month access</td><td>30 days</td><td>Instant + fee</td></tr>
    <tr><td>Coldline</td><td>Once-a-quarter access</td><td>90 days</td><td>Instant + fee</td></tr>
    <tr><td>Archive</td><td>Once-a-year access</td><td>365 days</td><td>Up to minutes + fee</td></tr>
  </table>
  <p>All classes share the same durability — they differ in price and how often you should read them.</p>
  <h2>Lifecycle policies</h2>
  <p>Automate the transition of objects as they age. A lifecycle rule can change the storage class or delete objects on a schedule:</p>
  <pre class="code-block"># lifecycle.json
{
  "lifecycle": {
    "rule": [
      {
        "action": { "type": "SetStorageClass", "storageClass": "NEARLINE" },
        "condition": { "age": 30 }
      },
      {
        "action": { "type": "Delete" },
        "condition": { "age": 365 }
      }
    ]
  }
}</pre>
  <pre class="code-block">gsutil lifecycle set lifecycle.json gs://my-app-assets</pre>
  <p>Now backups move to Nearline after 30 days and are purged after a year — automatically.</p>
  <h2>Object holds, retention, and versioning</h2>
  <ul>
    <li><strong>Versioning</strong> keeps every overwritten generation for restore.</li>
    <li><strong>Holds</strong> block object deletion until you release them.</li>
    <li><strong>Retention policies</strong> prevent deletion for a minimum duration.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Match class to access</strong>
    <p>Moving a 1 TB legacy dataset to Archive can cut monthly storage spend dramatically. Do the math before choosing Standard for everything.</p>
  </div>
  <div class="callout callout-info">
    <strong>Minimum retention cautions</strong>
    <p>Deleting cold data before its minimum retention still charges the remaining days. Lifecycle rules keep you honest when data loses relevance.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01B00000-0000-4000-8000-000000000416',
  '01B00000-0000-4000-8000-000000000316',
  1,
  'Cloud SQL: Managed Databases',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cloud SQL: Managed Databases</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #4285f4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1a73e8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e8f0fe; color: #1a73e8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e8f0fe; border-left: 4px solid #4285f4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #2563eb; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e8f0fe; color: #1a73e8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #8ab4f8; }
.dark .lesson-page h2 { color: #8ab4f8; }
.dark .lesson-page .ic { background: #0b2e5f; color: #a8c7fa; }
.dark .lesson-page .callout { background: #0b2e5f; border-left-color: #4285f4; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b2e5f; color: #8ab4f8; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Cloud SQL: Managed Databases</h1>
  <p>Running your own PostgreSQL or MySQL server means patching, backups, failover, and replica management. <strong>Cloud SQL</strong> removes that burden: a fully managed relational database with PostgreSQL, MySQL, and SQL Server flavors.</p>
  <h2>Creating an instance</h2>
  <pre class="code-block">gcloud sql instances create my-db \
    --database-version=POSTGRES_15 \
    --tier=db-f1-micro \
    --region=us-central1 \
    --storage-type=SSD --storage-size=10GB</pre>
  <p>Choose a <span class="ic">--tier</span> (CPU/memory) and let Google handle storage growth, automatic backups, and minor version patches.</p>
  <h2>High availability and backups</h2>
  <ul>
    <li><strong>Automatic backups</strong> run daily and you can restore to any point in time.</li>
    <li><strong>High availability</strong> provisions a standby in another zone with automatic failover.</li>
    <li><strong>Read replicas</strong> offload reads and can be promoted in a regional disaster.</li>
  </ul>
  <pre class="code-block">gcloud sql instances patch my-db --backup-start-time=02:00</pre>
  <h2>Connecting safely</h2>
  <p>The two common paths:</p>
  <ul>
    <li><strong>Cloud SQL Auth Proxy</strong> — an agent that authenticates and encrypts the connection; works anywhere.</li>
    <li><strong>Private IP</strong> — connects the database over your VPC, never exposing it to the internet.</li>
  </ul>
  <pre class="code-block">gcloud sql connect my-db --user=postgres</pre>
  <div class="callout callout-tip">
    <strong>Prefer private IP in production</strong>
    <p>Authorize only known sources, or use private IP plus the proxy. A database wide open to <span class="ic">0.0.0.0/0</span> is one of the most common cloud breaches.</p>
  </div>
  <h2>Scaling</h2>
  <p>Increase CPU and memory in minutes, add storage without downtime, or create read replicas for analytics workloads. Cloud SQL handles the mechanics.</p>
  <div class="callout callout-info">
    <strong>When Cloud SQL is the right call</strong>
    <p>Structured relational data with joins, transactions, and SQL semantics — orders, users, products. When your data instead looks like flexible documents, the next lesson introduces Firestore.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01B00000-0000-4000-8000-000000000417',
  '01B00000-0000-4000-8000-000000000317',
  1,
  'Cloud Firestore: NoSQL Documents',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cloud Firestore: NoSQL Documents</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #4285f4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1a73e8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e8f0fe; color: #1a73e8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e8f0fe; border-left: 4px solid #4285f4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #2563eb; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e8f0fe; color: #1a73e8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #8ab4f8; }
.dark .lesson-page h2 { color: #8ab4f8; }
.dark .lesson-page .ic { background: #0b2e5f; color: #a8c7fa; }
.dark .lesson-page .callout { background: #0b2e5f; border-left-color: #4285f4; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b2e5f; color: #8ab4f8; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Cloud Firestore: NoSQL Documents</h1>
  <p><strong>Cloud Firestore</strong> is a flexible, serverless, NoSQL document database that scales automatically. Data is stored as JSON-like <strong>documents</strong> inside <strong>collections</strong>, giving you a schema that evolves with your product.</p>
  <h2>The data model</h2>
  <pre class="code-block">users/{userId}                      <- collection of documents
{
  "name": "Ada Turing",
  "email": "ada@example.com",
  "role": "student",
  "courses": ["gcp-essentials", "cloud-arch"],
  "premium": false
}</pre>
  <p>A document is a set of key-value pairs; a collection holds many documents. Documents can nest maps and arrays, and one document can link to a sub-collection for deeply related data.</p>
  <h2>Queries</h2>
  <pre class="code-block">db.collection("users")
  .where("role", "==", "student")
  .orderBy("name")
  .limit(25)
  .get()</pre>
  <p>Firestore queries are indexed automatically, so lookups stay fast even as data grows. Composite queries can use compound indexes you define.</p>
  <h2>Realtime and offline</h2>
  <ul>
    <li><strong>Realtime listeners</strong> push updates to clients the moment data changes.</li>
    <li><strong>Offline mode</strong> caches locally and syncs when connectivity returns.</li>
    <li><strong>Multi-document transactions</strong> let you update several documents atomically.</li>
  </ul>
  <h2>Security rules</h2>
  <p>Access is enforced with <strong>security rules</strong>, which run on the server and gate every read and write:</p>
  <pre class="code-block">rules_version = '2';
service cloud.firestore {
  match /databases/{db}/documents {
    match /users/{userId} {
      allow read, write: if request.auth != null
                        && request.auth.uid == userId;
    }
  }
}</pre>
  <div class="callout callout-tip">
    <strong>Choose Firestore for flexible, scalable document data</strong>
    <p>User profiles, content feeds, chat, catalogs, and realtime UIs fit the document model beautifully. Firestore also includes a free tier, so it is friendly to learn on.</p>
  </div>
  <div class="callout callout-info">
    <strong>When to choose Cloud SQL instead</strong>
    <p>If your data is deeply relational — invoices with line items needing joins and strict transactions — a managed relational database remains the better tool.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01B00000-0000-4000-8000-000000000419',
  '01B00000-0000-4000-8000-000000000319',
  1,
  'VPC Networks & Subnets',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VPC Networks &amp; Subnets</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #4285f4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1a73e8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e8f0fe; color: #1a73e8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e8f0fe; border-left: 4px solid #4285f4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #2563eb; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e8f0fe; color: #1a73e8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #8ab4f8; }
.dark .lesson-page h2 { color: #8ab4f8; }
.dark .lesson-page .ic { background: #0b2e5f; color: #a8c7fa; }
.dark .lesson-page .callout { background: #0b2e5f; border-left-color: #4285f4; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b2e5f; color: #8ab4f8; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>VPC Networks &amp; Subnets</h1>
  <p>A <strong>Virtual Private Cloud (VPC)</strong> is your private, logically isolated network inside Google Cloud. Resources — VMs, databases, serverless services — attach to it and communicate privately without crossing the public internet.</p>
  <h2>VPCs and subnets</h2>
  <p>A VPC is a global network spanning all regions. You carve it into <strong>subnets</strong>, each bound to a region and an IP range:</p>
  <table>
    <tr><th>Mode</th><th>Behavior</th><th>Best for</th></tr>
    <tr><td>Auto mode</td><td>Creates a subnet in every region automatically</td><td>Getting started</td></tr>
    <tr><td>Custom mode</td><td>You define all subnets and ranges</td><td>Production control</td></tr>
  </table>
  <p>An instance chooses a subnet, which decides its private IP range and region.</p>
  <h2>Firewall rules</h2>
  <p>Firewall rules are <strong>deny-by-default</strong>: no inbound traffic arrives unless a rule explicitly allows it.</p>
  <pre class="code-block">gcloud compute firewall-rules create allow-http \
    --network=default \
    --allow=tcp:80,tcp:443 \
    --source-ranges=0.0.0.0/0 \
    --target-tags=web</pre>
  <p>Rules apply per subnet or to the whole VPC, and use <strong>tags</strong> so only specific VMs (those tagged <span class="ic">web</span>) are exposed.</p>
  <div class="callout callout-tip">
    <strong>Least-exposure networking</strong>
    <p>Only open ports that must be public, restrict source ranges to known IPs, and keep databases on private-only subnets.</p>
  </div>
  <h2>Private internet access</h2>
  <ul>
    <li><strong>Private Google Access</strong> — lets subnets reach Google APIs without external IPs.</li>
    <li><strong>Cloud NAT</strong> — lets private instances make outbound connections to the internet (e.g. downloading packages) while staying unreachable from outside.</li>
  </ul>
  <h2>Connecting networks</h2>
  <p>Peering links two VPCs privately; Cloud VPN connects your on-premises network site-to-site; Cloud Interconnect provides a dedicated, high-throughput physical link.</p>
  <div class="callout callout-info">
    <strong>Serverless also uses VPCs</strong>
    <p>Cloud Run and Cloud Functions can attach to a VPC through a connector, letting them reach private resources like a Cloud SQL instance on a private IP.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01B00000-0000-4000-8000-000000000420',
  '01B00000-0000-4000-8000-000000000320',
  1,
  'Load Balancing & Cloud DNS',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Load Balancing &amp; Cloud DNS</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #4285f4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1a73e8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e8f0fe; color: #1a73e8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e8f0fe; border-left: 4px solid #4285f4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #2563eb; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e8f0fe; color: #1a73e8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #8ab4f8; }
.dark .lesson-page h2 { color: #8ab4f8; }
.dark .lesson-page .ic { background: #0b2e5f; color: #a8c7fa; }
.dark .lesson-page .callout { background: #0b2e5f; border-left-color: #4285f4; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b2e5f; color: #8ab4f8; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Load Balancing &amp; Cloud DNS</h1>
  <p>As traffic grows beyond one instance you need two services: a <strong>load balancer</strong> to spread requests across healthy backends, and <strong>DNS</strong> to map your domain name to the service.</p>
  <h2>Load balancer types</h2>
  <table>
    <tr><th>Type</th><th>Layer</th><th>Best for</th></tr>
    <tr><td>Global external HTTPS</td><td>L7</td><td>Public web apps worldwide, one anycast IP</td></tr>
    <tr><td>External passthrough</td><td>L4</td><td>TCP/UDP with packet-level routing</td></tr>
    <tr><td>Internal</td><td>L4/L7</td><td>Private traffic between services</td></tr>
  </table>
  <p>Google Cloud load balancers are <strong>managed</strong> — no instances to run or patch — and use anycast so a single IP serves users from the nearest region.</p>
  <h2>Backends and health checks</h2>
  <p>A load balancer groups VMs or serverless services into <strong>backends</strong> and probes them with <strong>health checks</strong>. Unhealthy instances are taken out of rotation automatically.</p>
  <pre class="code-block">gcloud compute health-checks create http https-health \
    --request-path=/healthz --check-interval=5s</pre>
  <h2>Cloud DNS</h2>
  <p><strong>Cloud DNS</strong> is a managed DNS service: it translates <span class="ic">www.example.com</span> into the load balancer IP. Create a public or private zone and manage record sets:</p>
  <pre class="code-block">gcloud dns record-sets create www.example.com. \
    --type=A --ttl=300 --zone=my-zone \
    --rrdatas=34.120.0.1</pre>
  <p>Set your registrar to use the Cloud DNS nameservers, and the same tooling manages records for internal zones too (like resolving database hostnames inside the VPC).</p>
  <h2>Tying it together</h2>
  <ol>
    <li>Deploy your app behind a global external HTTPS load balancer.</li>
    <li>Program a Cloud DNS record pointing your domain at the balancer IP.</li>
    <li>Add managed SSL certificates for automatic HTTPS.</li>
  </ol>
  <div class="callout callout-info">
    <strong>Serverless backends work too</strong>
    <p>Cloud Run and App Engine can be registered as load balancer backends, unifying public traffic across VM and serverless tiers.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Health is holistic</strong>
    <p>Use your health check path to validate more than process liveness — check that dependencies the app needs for real work are actually reachable.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01B00000-0000-4000-8000-000000000422',
  '01B00000-0000-4000-8000-000000000322',
  1,
  'Monitoring & Logging',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Monitoring &amp; Logging</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #4285f4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1a73e8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e8f0fe; color: #1a73e8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e8f0fe; border-left: 4px solid #4285f4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #2563eb; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e8f0fe; color: #1a73e8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #8ab4f8; }
.dark .lesson-page h2 { color: #8ab4f8; }
.dark .lesson-page .ic { background: #0b2e5f; color: #a8c7fa; }
.dark .lesson-page .callout { background: #0b2e5f; border-left-color: #4285f4; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b2e5f; color: #8ab4f8; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Monitoring &amp; Logging</h1>
  <p>You cannot manage what you cannot see. <strong>Cloud Monitoring</strong> collects metrics and dashboards; <strong>Cloud Logging</strong> stores and queries logs. Together they answer: is it up, how fast, and what broke?</p>
  <h2>Cloud Monitoring</h2>
  <p>Monitoring pulls <strong>metrics</strong> — CPU, memory, request counts, latency — from GCP services and your own apps. Build <strong>dashboards</strong> and <strong>uptime checks</strong> to track availability.</p>
  <pre class="code-block">gcloud monitoring uptime-checks create http \
    --host=api.example.com --path=/healthz --port=443</pre>
  <h2>Alerting policies</h2>
  <p>An <strong>alerting policy</strong> watches a condition (e.g. CPU above 80% for five minutes) and notifies a channel such as email, Slack, or PagerDuty:</p>
  <pre class="code-block">gcloud monitoring channels create Slack --display-name=ops \
    --type=slack --channel-params=token=xxx</pre>
  <p>Alert on <em>symptoms</em> (errors, latency) rather than only causes (CPU), so the pager fires for users, not theories.</p>
  <h2>Cloud Logging</h2>
  <p>Every GCP service streams logs into Cloud Logging automatically. Application logs are queried with a filter language:</p>
  <pre class="code-block">resource.type="gce_instance" AND
severity>=ERROR AND
"- hasan@example.com"</pre>
  <p>Logs with the <span class="ic">ERROR</span> or <span class="ic">CRITICAL</span> severity can be routed to <strong>Error Reporting</strong>, which groups recurring exceptions into readable issues.</p>
  <h2>Log-based metrics and exports</h2>
  <p>Derive custom metrics from logs (e.g. count of login failures) and export logs to BigQuery or Cloud Storage for retention and compliance.</p>
  <div class="callout callout-tip">
    <strong>Structure your logs</strong>
    <p>Log as JSON with useful fields — trace id, user, latency — instead of strings. Structured logs are searchable and alertable, not just greppable.</p>
  </div>
  <div class="callout callout-info">
    <strong>Five golden signals to watch</strong>
    <p>Latency, traffic, errors, saturation, and requests are a standard checklist for any service dashboard. Start coverage there.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01B00000-0000-4000-8000-000000000423',
  '01B00000-0000-4000-8000-000000000323',
  1,
  'Cost Management & Budgets',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cost Management &amp; Budgets</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #4285f4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1a73e8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e8f0fe; color: #1a73e8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e8f0fe; border-left: 4px solid #4285f4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #2563eb; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e8f0fe; color: #1a73e8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #8ab4f8; }
.dark .lesson-page h2 { color: #8ab4f8; }
.dark .lesson-page .ic { background: #0b2e5f; color: #a8c7fa; }
.dark .lesson-page .callout { background: #0b2e5f; border-left-color: #4285f4; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b2e5f; color: #8ab4f8; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Cost Management &amp; Budgets</h1>
  <p>The cloud bill is the sum of many small decisions. Good teams make cost <em>visible</em>, set alarms, and continuously optimize. This lesson covers the three pillars: budgets, attribution, and reduction.</p>
  <h2>Budgets and alerts</h2>
  <p>A <strong>budget</strong> is a spend threshold attached to a billing account or project. Threshold rules send notifications at percentages of that budget:</p>
  <pre class="code-block">gcloud billing budgets create \
    --billing-account=012345-6789AB-CDEF01 \
    --display-name=quarterly-cap \
    --budget-amount=500USD \
    --alert-thresholds=0.5,0.9,1.0</pre>
  <div class="callout">
    <strong>Budget does not equal a hard stop</strong>
    <p>Alerts notify you; you must act. Pair budgets with automation or billing export so a runaway workload cannot bill the month away silently.</p>
  </div>
  <h2>Attribution with labels</h2>
  <p>Add <strong>labels</strong> to resources — <span class="ic">env=prod</span>, <span class="ic">team=billing</span> — then filter the cost report by label. Without labels, cost reports are guesswork.</p>
  <pre class="code-block">gcloud compute instances create app-vm \
    --labels=env=prod,owner=platform</pre>
  <h2>Those five big levers</h2>
  <table>
    <tr><th>Lever</th><th>How it cuts spend</th></tr>
    <tr><td>Right-sizing</td><td>Rightsize idle vCPUs via usage recommendations</td></tr>
    <tr><td>Committed-use discounts</td><td>1–3 year commitment for predictable workloads</td></tr>
    <tr><td>Spot and preemptible</td><td>Big discount for interruptible batch work</td></tr>
    <tr><td>Storage classes</td><td>Archive old data instead of paying Standard prices</td></tr>
    <tr><td>Shut down idle</td><td>Schedule dev servers off outside business hours</td></tr>
  </table>
  <h2>Cost visibility tooling</h2>
  <p>Export billing data to BigQuery for SQL analysis, and use the <strong>Cloud Billing</strong> reports page and the <strong>Recommender</strong> for proactive suggestions.</p>
  <div class="callout callout-info">
    <strong>Culture beats tools</strong>
    <p>The best cost tool is a team that treats every deployment as a bill with a name. Review spend in the weekly operations meeting.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01B00000-0000-4000-8000-000000000425',
  '01B00000-0000-4000-8000-000000000325',
  1,
  'Capstone: Plan the Deployment',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Plan the Deployment</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #4285f4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1a73e8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e8f0fe; color: #1a73e8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e8f0fe; border-left: 4px solid #4285f4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #2563eb; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e8f0fe; color: #1a73e8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #8ab4f8; }
.dark .lesson-page h2 { color: #8ab4f8; }
.dark .lesson-page .ic { background: #0b2e5f; color: #a8c7fa; }
.dark .lesson-page .callout { background: #0b2e5f; border-left-color: #4285f4; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b2e5f; color: #8ab4f8; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Plan the Deployment</h1>
  <p>You now know the building blocks. The capstone ties them together: a small, public <strong>TODO API</strong> deployed to <strong>Cloud Run</strong>, backed by <strong>Cloud SQL</strong> for tasks and <strong>Cloud Storage</strong> for attachments — a realistic miniature of a production service.</p>
  <h2>The architecture</h2>
  <pre class="code-block">Browser (HTTPS)
    │
    ▼
Cloud Run  todo-api (container, Node.js)
    │  private network
    ├── Cloud SQL (PostgreSQL)  ── tasks table
    └── Cloud Storage (bucket)  ── uploaded files</pre>
  <p>Everything stays inside one project, one region, with a private database connection.</p>
  <h2>Why these services</h2>
  <table>
    <tr><th>Need</th><th>Service</th><th>Because</th></tr>
    <tr><td>HTTP endpoint</td><td>Cloud Run</td><td>Serverless, scale to zero, container</td></tr>
    <tr><td>Task data</td><td>Cloud SQL</td><td>Relationships and strict consistency</td></tr>
    <tr><td>File uploads</td><td>Cloud Storage</td><td>Blob storage with easy CDN later</td></tr>
    <tr><td>Configuration</td><td>Secret Manager + Not needed for MVP</td><td>Separate secrets from code</td></tr>
  </table>
  <h2>Prerequisites checklist</h2>
  <ul>
    <li>A Google Cloud project with billing enabled.</li>
    <li>The gcloud CLI installed and authenticated.</li>
    <li>PostgreSQL client (<span class="ic">psql</span>, Docker, or the proxy) for the local walkthrough.</li>
    <li>A Docker image registry you can push to — Artifact Registry is simplest.</li>
  </ul>
  <h2>Prepare the project</h2>
  <pre class="code-block">gcloud config set project capstone-2026
gcloud config set compute/region us-central1
gcloud config set compute/zone us-central1-a
gcloud services enable run.googleapis.com \
    sqladmin.googleapis.com \
    secretmanager.googleapis.com \
    artifactregistry.googleapis.com</pre>
  <div class="callout callout-info">
    <strong>Scope control</strong>
    <p>Keep every command in one project. A separate capstone project means a mistake cannot touch other work, and cleanup is one <span class="ic">gcloud projects delete</span>.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Estimate before you build</strong>
    <p>An e2-small VM, a db-f1-micro database, and a Cloud Run service fall inside the free tier for practice. Production will of course <em>cost more</em> — plan the bill, not just the app.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01B00000-0000-4000-8000-000000000426',
  '01B00000-0000-4000-8000-000000000326',
  1,
  'Capstone: Platform Components',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Platform Components</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #4285f4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1a73e8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e8f0fe; color: #1a73e8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e8f0fe; border-left: 4px solid #4285f4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #2563eb; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e8f0fe; color: #1a73e8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #8ab4f8; }
.dark .lesson-page h2 { color: #8ab4f8; }
.dark .lesson-page .ic { background: #0b2e5f; color: #a8c7fa; }
.dark .lesson-page .callout { background: #0b2e5f; border-left-color: #4285f4; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b2e5f; color: #8ab4f8; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Platform Components</h1>
  <p>Time to build. This lesson walks through creating the three platform pieces — <strong>Cloud SQL</strong>, <strong>Cloud Storage</strong>, and a <strong>Cloud Run</strong> container — then wiring them together.</p>
  <h2>1. Cloud SQL: the database</h2>
  <pre class="code-block">gcloud sql instances create capstone-db \
    --database-version=POSTGRES_15 \
    --tier=db-f1-micro \
    --region=us-central1

gcloud sql databases create tasks --instance=capstone-db
gcloud sql users create app --instance=capstone-db \
    --password="generated-secret"</pre>
  <p>Note the password: in the next lesson you will move it to Secret Manager. For now, keep it in your local notes, never in the repo.</p>
  <h2>2. Cloud Storage: the bucket</h2>
  <pre class="code-block">gcloud storage buckets create gs://capstone-2026-assets \
    --project=capstone-2026 --location=us-central1 \
    --default-storage-class=STANDARD</pre>
  <p>This bucket stores uploaded attachments. Keep it private and hand object-level permissions to the service account.</p>
  <h2>3. Cloud Run: the API</h2>
  <p>Build a small container, push it to Artifact Registry, and deploy:</p>
  <pre class="code-block">gcloud builds submit --tag us-central1-docker.pkg.dev/\
capstone-2026/services/todo-api:v1

gcloud run deploy todo-api \
    --image=us-central1-docker.pkg.dev/capstone-2026/services/todo-api:v1 \
    --region=us-central1 \
    --allow-unauthenticated \
    --set-env-vars=DB_NAME=tasks,DB_USER=app</pre>
  <div class="callout callout-tip">
    <strong>Wire the private connection</strong>
    <p>Cloud Run reaches Cloud SQL through a VPC connector or private IP. Configure the connector once and set the database host in environment variables so your code stays portable.</p>
  </div>
  <h2>Verify the flow</h2>
  <pre class="code-block">curl https://todo-api-xxxx.a.run.app/healthz
curl -X POST https://todo-api-xxxx.a.run.app/tasks \
    -d '{"title":"finish gcp course"}'</pre>
  <p>A healthy <span class="ic">200</span> on <span class="ic">/healthz</span> and a quoted response from the POST endpoint means the write path works.</p>
  <div class="callout callout-info">
    <strong>Treat as repeatable</strong>
    <p>Save every command in a shell script in your repo. Recreating the stack from scratch in minutes is the point of cloud-native practice.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01B00000-0000-4000-8000-000000000427',
  '01B00000-0000-4000-8000-000000000327',
  1,
  'Capstone: Best Practices & Security',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Best Practices &amp; Security</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #4285f4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1a73e8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e8f0fe; color: #1a73e8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e8f0fe; border-left: 4px solid #4285f4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #2563eb; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e8f0fe; color: #1a73e8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #8ab4f8; }
.dark .lesson-page h2 { color: #8ab4f8; }
.dark .lesson-page .ic { background: #0b2e5f; color: #a8c7fa; }
.dark .lesson-page .callout { background: #0b2e5f; border-left-color: #4285f4; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b2e5f; color: #8ab4f8; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Best Practices &amp; Security</h1>
  <p>The app works. Now make it a good citizen: protect secrets, enforce least privilege, understand your network, and watch the stack. This final lesson before the assessment is your checklist.</p>
  <h2>1. Secrets go to Secret Manager</h2>
  <p>Move the database password out of environment variables and into <strong>Cloud Secret Manager</strong>, then let Cloud Run load it at runtime:</p>
  <pre class="code-block">gcloud secrets create db-password \
    --data-file=./db-password.txt

gcloud run services update todo-api \
    --update-secrets=DB_PASSWORD=db-password:latest</pre>
  <div class="callout callout-tip">
    <strong>Never bake credentials</strong>
    <p>A leaked credential in a container image, repo, or env var is a breach waiting to happen. Secrets live in Secret Manager, nowhere else.</p>
  </div>
  <h2>2. Least privilege everywhere</h2>
  <ul>
    <li>Give <span class="ic">todo-api</span> a dedicated <strong>service account</strong>, not your personal user.</li>
    <li>Grant network and storage roles at the resource level, not the project.</li>
    <li>Revoke the <span class="ic">roles/editor</span> you may have granted while learning.</li>
  </ul>
  <pre class="code-block">gcloud iam service-accounts create todo-api-sa
gcloud projects add-iam-policy-binding capstone-2026 \
    --member=serviceAccount:todo-api-sa@... \
    --role=roles/cloudsql.client
gcloud storage buckets add-iam-policy-binding gs://capstone-2026-assets \
    --member=serviceAccount:todo-api-sa@... \
    --role=roles/storage.objectUser</pre>
  <h2>3. Know your network exposure</h2>
  <p>Keep Cloud SQL on a private IP inside the VPC, keep the storage bucket private, and validate the firewall allows only 443 and your health check path to the balancer.</p>
  <h2>4. Observe it</h2>
  <p>Build a small dashboard of the API request count, latency, and error rate; add an uptime check; alert on error rate and the budget thresholds from the previous lesson.</p>
  <h2>5. Finish, review, clean up</h2>
  <table>
    <tr><th>Area</th><th>Action</th></tr>
    <tr><td>IAM</td><td>Verify who holds Owner and Editor</td></tr>
    <tr><td>Data</td><td>Snapshots and backups configured, bucket private</td></tr>
    <tr><td>Cost</td><td>Budget + alerts on, license of idle resources</td></tr>
    <tr><td>Teardown</td><td>Document how to delete the project when done</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Congratulations</strong>
    <p>You have deployed compute, a database, storage, networking, security, and cost controls on Google Cloud. That is the full lifecycle. Take the final assessment to seal it.</p>
  </div>
</div>
</body>
</html>
$html$
)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 6. QUIZZES  (29 questions)
--    Q1-3 for lesson 303 · Q4-6 for 306 · Q7-9 for 309 · Q10-12 for 312
--    Q13-15 for 315 · Q16-18 for 318 · Q19-21 for 321 · Q22-24 for 324
--    Q25-29 for final assessment 328.
-- ----------------------------------------------------------------------------

INSERT INTO quizzes (id, lesson_id, question, explanation, position) VALUES
  ('01B00000-0000-4000-8000-000000000501', '01B00000-0000-4000-8000-000000000303',
   'Which cloud service model provides virtual machines that you manage?',
   'IaaS gives you compute, storage, and networking and leaves the OS and applications to you.', 1),
  ('01B00000-0000-4000-8000-000000000502', '01B00000-0000-4000-8000-000000000303',
   'What is a region in Google Cloud?',
   'A region is a geographic area made up of one or more zones.', 2),
  ('01B00000-0000-4000-8000-000000000503', '01B00000-0000-4000-8000-000000000303',
   'Who is responsible for patching the guest OS of a Compute Engine VM?',
   'You manage the guest operating system; Google secures the physical infrastructure.', 3),
  ('01B00000-0000-4000-8000-000000000504', '01B00000-0000-4000-8000-000000000306',
   'Which IAM role types include Owner, Editor, and Viewer?',
   'These are the basic (primitive) roles; predefined and custom roles are more granular.', 1),
  ('01B00000-0000-4000-8000-000000000505', '01B00000-0000-4000-8000-000000000306',
   'What gives an application its own identity when calling Google Cloud APIs?',
   'A service account represents an application rather than a human user.', 2),
  ('01B00000-0000-4000-8000-000000000506', '01B00000-0000-4000-8000-000000000306',
   'What happens when a budget alert threshold is reached?',
   'A notification is sent; budgets do not stop resources by themselves.', 3),
  ('01B00000-0000-4000-8000-000000000507', '01B00000-0000-4000-8000-000000000309',
   'Which machine family best fits typical general-purpose web workloads?',
   'E2 general-purpose machines balance cost and performance for most apps.', 1),
  ('01B00000-0000-4000-8000-000000000508', '01B00000-0000-4000-8000-000000000309',
   'Which persistent disk type offers the lowest-latency IOPS?',
   'pd-ssd provides high random IOPS for demanding workloads.', 2),
  ('01B00000-0000-4000-8000-000000000509', '01B00000-0000-4000-8000-000000000309',
   'What does a disk snapshot provide?',
   'A snapshot is a point-in-time, incremental backup of a persistent disk.', 3),
  ('01B00000-0000-4000-8000-000000000510', '01B00000-0000-4000-8000-000000000312',
   'Which App Engine environment is best for stateless apps that should scale to zero?',
   'The standard environment manages runtimes and scales automatically.', 1),
  ('01B00000-0000-4000-8000-000000000511', '01B00000-0000-4000-8000-000000000312',
   'What is a Cloud Run revision?',
   'A revision is an immutable snapshot of a configuration and container image.', 2),
  ('01B00000-0000-4000-8000-000000000512', '01B00000-0000-4000-8000-000000000312',
   'When a Cloud Run service receives no traffic, what happens?',
   'It scales to zero instances and stops billing for compute.', 3),
  ('01B00000-0000-4000-8000-000000000513', '01B00000-0000-4000-8000-000000000315',
   'Which storage class is best for hot data accessed frequently?',
   'Standard is the default class for frequently accessed data.', 1),
  ('01B00000-0000-4000-8000-000000000514', '01B00000-0000-4000-8000-000000000315',
   'Which command-line tool uploads and downloads Cloud Storage objects?',
   'gsutil is the object storage CLI; gcloud storage is its modern replacement.', 2),
  ('01B00000-0000-4000-8000-000000000515', '01B00000-0000-4000-8000-000000000315',
   'Which feature lets you restore an overwritten Cloud Storage object?',
   'Object versioning keeps previous object generations for restore.', 3),
  ('01B00000-0000-4000-8000-000000000516', '01B00000-0000-4000-8000-000000000318',
   'Which service provides managed PostgreSQL, MySQL, and SQL Server?',
   'Cloud SQL is the fully managed relational database service.', 1),
  ('01B00000-0000-4000-8000-000000000517', '01B00000-0000-4000-8000-000000000318',
   'What is a group of Cloud Firestore documents called?',
   'Documents live inside collections in the Firestore data model.', 2),
  ('01B00000-0000-4000-8000-000000000518', '01B00000-0000-4000-8000-000000000318',
   'What is a key benefit of using a managed database service?',
   'Automated backups, patching, failover, and scaling reduce operational work.', 3),
  ('01B00000-0000-4000-8000-000000000519', '01B00000-0000-4000-8000-000000000321',
   'How are regional IP ranges carved out inside a VPC?',
   'A VPC contains subnets, each bound to a region and an IP range.', 1),
  ('01B00000-0000-4000-8000-000000000520', '01B00000-0000-4000-8000-000000000321',
   'What is the default behavior for inbound traffic in a GCP VPC?',
   'Firewalls are deny-by-default; inbound traffic needs an explicit allow rule.', 2),
  ('01B00000-0000-4000-8000-000000000521', '01B00000-0000-4000-8000-000000000321',
   'Which load balancer fronts HTTPS traffic for a global web application?',
   'The global external HTTPS load balancer serves users worldwide via anycast.', 3),
  ('01B00000-0000-4000-8000-000000000522', '01B00000-0000-4000-8000-000000000324',
   'Which Cloud Monitoring object fires a notification when a condition is met?',
   'An alerting policy watches metrics and notifies via channels.', 1),
  ('01B00000-0000-4000-8000-000000000523', '01B00000-0000-4000-8000-000000000324',
   'Which service recommends rightsizing idle or oversized VMs?',
   'The Recommender analyzes usage and suggests cost-saving changes.', 2),
  ('01B00000-0000-4000-8000-000000000524', '01B00000-0000-4000-8000-000000000324',
   'What does a spending budget do at its threshold?',
   'It sends a notification; it does not halt resources automatically.', 3),
  ('01B00000-0000-4000-8000-000000000525', '01B00000-0000-4000-8000-000000000328',
   'What is the best practice for storing a database password?',
   'Use Cloud Secret Manager and reference the secret at runtime.', 1),
  ('01B00000-0000-4000-8000-000000000526', '01B00000-0000-4000-8000-000000000328',
   'Which principle should guide every IAM permission grant?',
   'Least privilege: give each member only the permissions they need.', 2),
  ('01B00000-0000-4000-8000-000000000527', '01B00000-0000-4000-8000-000000000328',
   'Which component serves a global web app on a single anycast IP?',
   'A global external HTTPS load balancer distributes traffic worldwide.', 3),
  ('01B00000-0000-4000-8000-000000000528', '01B00000-0000-4000-8000-000000000328',
   'How can you recover a VM disk after accidental data loss?',
   'Restore the disk from a snapshot or backup and verify the restore.', 4),
  ('01B00000-0000-4000-8000-000000000529', '01B00000-0000-4000-8000-000000000328',
   'Why is serverless like Cloud Run attractive for a new startup?',
   'Scale-to-zero and per-use billing keep costs low when traffic is low.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): service model
  ('01B00000-0000-4000-8000-000000001001', '01B00000-0000-4000-8000-000000000501', 'IaaS', TRUE,  1),
  ('01B00000-0000-4000-8000-000000001002', '01B00000-0000-4000-8000-000000000501', 'PaaS', FALSE, 2),
  ('01B00000-0000-4000-8000-000000001003', '01B00000-0000-4000-8000-000000000501', 'SaaS', FALSE, 3),
  ('01B00000-0000-4000-8000-000000001004', '01B00000-0000-4000-8000-000000000501', 'FaaS', FALSE, 4),
  -- Q1 (501)q2: region
  ('01B00000-0000-4000-8000-000000001005', '01B00000-0000-4000-8000-000000000502', 'A geographic area with one or more zones', TRUE,  1),
  ('01B00000-0000-4000-8000-000000001006', '01B00000-0000-4000-8000-000000000502', 'A single physical server', FALSE, 2),
  ('01B00000-0000-4000-8000-000000001007', '01B00000-0000-4000-8000-000000000502', 'A virtual private network', FALSE, 3),
  ('01B00000-0000-4000-8000-000000001008', '01B00000-0000-4000-8000-000000000502', 'A project billing term', FALSE, 4),
  -- Q1 (501)q3: guest OS
  ('01B00000-0000-4000-8000-000000001009', '01B00000-0000-4000-8000-000000000503', 'You', TRUE,  1),
  ('01B00000-0000-4000-8000-000000001010', '01B00000-0000-4000-8000-000000000503', 'Google', FALSE, 2),
  ('01B00000-0000-4000-8000-000000001011', '01B00000-0000-4000-8000-000000000503', 'A third-party contractor', FALSE, 3),
  ('01B00000-0000-4000-8000-000000001012', '01B00000-0000-4000-8000-000000000503', 'Nobody', FALSE, 4),
  -- Q2 (504): basic roles
  ('01B00000-0000-4000-8000-000000001013', '01B00000-0000-4000-8000-000000000504', 'Basic (primitive) roles', TRUE,  1),
  ('01B00000-0000-4000-8000-000000001014', '01B00000-0000-4000-8000-000000000504', 'Predefined roles', FALSE, 2),
  ('01B00000-0000-4000-8000-000000001015', '01B00000-0000-4000-8000-000000000504', 'Custom roles', FALSE, 3),
  ('01B00000-0000-4000-8000-000000001016', '01B00000-0000-4000-8000-000000000504', 'Conditional roles', FALSE, 4),
  -- Q2 (504)q2: service account
  ('01B00000-0000-4000-8000-000000001017', '01B00000-0000-4000-8000-000000000505', 'A service account', TRUE,  1),
  ('01B00000-0000-4000-8000-000000001018', '01B00000-0000-4000-8000-000000000505', 'A user group', FALSE, 2),
  ('01B00000-0000-4000-8000-000000001019', '01B00000-0000-4000-8000-000000000505', 'A billing account', FALSE, 3),
  ('01B00000-0000-4000-8000-000000001020', '01B00000-0000-4000-8000-000000000505', 'A subnet', FALSE, 4),
  -- Q2 (504)q3: budget alert
  ('01B00000-0000-4000-8000-000000001021', '01B00000-0000-4000-8000-000000000506', 'It sends a notification', TRUE,  1),
  ('01B00000-0000-4000-8000-000000001022', '01B00000-0000-4000-8000-000000000506', 'It deletes all resources', FALSE, 2),
  ('01B00000-0000-4000-8000-000000001023', '01B00000-0000-4000-8000-000000000506', 'It stops billing', FALSE, 3),
  ('01B00000-0000-4000-8000-000000001024', '01B00000-0000-4000-8000-000000000506', 'It shuts down every VM', FALSE, 4),
  -- Q3 (507): machine family
  ('01B00000-0000-4000-8000-000000001025', '01B00000-0000-4000-8000-000000000507', 'E2 general-purpose', TRUE,  1),
  ('01B00000-0000-4000-8000-000000001026', '01B00000-0000-4000-8000-000000000507', 'Memory-optimized', FALSE, 2),
  ('01B00000-0000-4000-8000-000000001027', '01B00000-0000-4000-8000-000000000507', 'Accelerator-optimized', FALSE, 3),
  ('01B00000-0000-4000-8000-000000001028', '01B00000-0000-4000-8000-000000000507', 'Spot instances', FALSE, 4),
  -- Q3 (507)q2: pd-ssd
  ('01B00000-0000-4000-8000-000000001029', '01B00000-0000-4000-8000-000000000508', 'pd-ssd', TRUE,  1),
  ('01B00000-0000-4000-8000-000000001030', '01B00000-0000-4000-8000-000000000508', 'pd-standard', FALSE, 2),
  ('01B00000-0000-4000-8000-000000001031', '01B00000-0000-4000-8000-000000000508', 'Local HDD', FALSE, 3),
  ('01B00000-0000-4000-8000-000000001032', '01B00000-0000-4000-8000-000000000508', 'Cloud Storage', FALSE, 4),
  -- Q3 (507)q3: snapshot
  ('01B00000-0000-4000-8000-000000001033', '01B00000-0000-4000-8000-000000000509', 'A point-in-time incremental backup', TRUE,  1),
  ('01B00000-0000-4000-8000-000000001034', '01B00000-0000-4000-8000-000000000509', 'A fresh empty disk', FALSE, 2),
  ('01B00000-0000-4000-8000-000000001035', '01B00000-0000-4000-8000-000000000509', 'A pricing plan', FALSE, 3),
  ('01B00000-0000-4000-8000-000000001036', '01B00000-0000-4000-8000-000000000509', 'A firewall configuration', FALSE, 4),
  -- Q4 (510): app engine standard
  ('01B00000-0000-4000-8000-000000001037', '01B00000-0000-4000-8000-000000000510', 'Standard environment', TRUE,  1),
  ('01B00000-0000-4000-8000-000000001038', '01B00000-0000-4000-8000-000000000510', 'Flexible environment', FALSE, 2),
  ('01B00000-0000-4000-8000-000000001039', '01B00000-0000-4000-8000-000000000510', 'A bare-metal server', FALSE, 3),
  ('01B00000-0000-4000-8000-000000001040', '01B00000-0000-4000-8000-000000000510', 'A virtual private cloud', FALSE, 4),
  -- Q4 (510)q2: revision
  ('01B00000-0000-4000-8000-000000001041', '01B00000-0000-4000-8000-000000000511', 'An immutable deployment snapshot', TRUE,  1),
  ('01B00000-0000-4000-8000-000000001042', '01B00000-0000-4000-8000-000000000511', 'A load balancer', FALSE, 2),
  ('01B00000-0000-4000-8000-000000001043', '01B00000-0000-4000-8000-000000000511', 'A billing report', FALSE, 3),
  ('01B00000-0000-4000-8000-000000001044', '01B00000-0000-4000-8000-000000000511', 'A storage bucket', FALSE, 4),
  -- Q4 (510)q3: scale to zero
  ('01B00000-0000-4000-8000-000000001045', '01B00000-0000-4000-8000-000000000512', 'It scales to zero instances', TRUE,  1),
  ('01B00000-0000-4000-8000-000000001046', '01B00000-0000-4000-8000-000000000512', 'It keeps one warm instance', FALSE, 2),
  ('01B00000-0000-4000-8000-000000001047', '01B00000-0000-4000-8000-000000000512', 'It shuts down permanently', FALSE, 3),
  ('01B00000-0000-4000-8000-000000001048', '01B00000-0000-4000-8000-000000000512', 'It replicates the image', FALSE, 4),
  -- Q5 (513): standard class
  ('01B00000-0000-4000-8000-000000001049', '01B00000-0000-4000-8000-000000000513', 'Standard', TRUE,  1),
  ('01B00000-0000-4000-8000-000000001050', '01B00000-0000-4000-8000-000000000513', 'Nearline', FALSE, 2),
  ('01B00000-0000-4000-8000-000000001051', '01B00000-0000-4000-8000-000000000513', 'Archive', FALSE, 3),
  ('01B00000-0000-4000-8000-000000001052', '01B00000-0000-4000-8000-000000000513', 'Coldline', FALSE, 4),
  -- Q5 (513)q2: gsutil
  ('01B00000-0000-4000-8000-000000001053', '01B00000-0000-4000-8000-000000000514', 'gsutil', TRUE,  1),
  ('01B00000-0000-4000-8000-000000001054', '01B00000-0000-4000-8000-000000000514', 'psql', FALSE, 2),
  ('01B00000-0000-4000-8000-000000001055', '01B00000-0000-4000-8000-000000000514', 'kubectl', FALSE, 3),
  ('01B00000-0000-4000-8000-000000001056', '01B00000-0000-4000-8000-000000000514', 'ssh', FALSE, 4),
  -- Q5 (513)q3: versioning
  ('01B00000-0000-4000-8000-000000001057', '01B00000-0000-4000-8000-000000000515', 'Versioning', TRUE,  1),
  ('01B00000-0000-4000-8000-000000001058', '01B00000-0000-4000-8000-000000000515', 'Encryption at rest', FALSE, 2),
  ('01B00000-0000-4000-8000-000000001059', '01B00000-0000-4000-8000-000000000515', 'Lifecycle deletion', FALSE, 3),
  ('01B00000-0000-4000-8000-000000001060', '01B00000-0000-4000-8000-000000000515', 'Object holds', FALSE, 4),
  -- Q6 (516): cloud sql
  ('01B00000-0000-4000-8000-000000001061', '01B00000-0000-4000-8000-000000000516', 'Cloud SQL', TRUE,  1),
  ('01B00000-0000-4000-8000-000000001062', '01B00000-0000-4000-8000-000000000516', 'Cloud Storage', FALSE, 2),
  ('01B00000-0000-4000-8000-000000001063', '01B00000-0000-4000-8000-000000000516', 'Cloud Firestore', FALSE, 3),
  ('01B00000-0000-4000-8000-000000001064', '01B00000-0000-4000-8000-000000000516', 'BigQuery', FALSE, 4),
  -- Q6 (516)q2: collection
  ('01B00000-0000-4000-8000-000000001065', '01B00000-0000-4000-8000-000000000517', 'A collection', TRUE,  1),
  ('01B00000-0000-4000-8000-000000001066', '01B00000-0000-4000-8000-000000000517', 'A table', FALSE, 2),
  ('01B00000-0000-4000-8000-000000001067', '01B00000-0000-4000-8000-000000000517', 'A bucket', FALSE, 3),
  ('01B00000-0000-4000-8000-000000001068', '01B00000-0000-4000-8000-000000000517', 'A row', FALSE, 4),
  -- Q6 (516)q3: managed benefit
  ('01B00000-0000-4000-8000-000000001069', '01B00000-0000-4000-8000-000000000518', 'Automated backups and high availability', TRUE,  1),
  ('01B00000-0000-4000-8000-000000001070', '01B00000-0000-4000-8000-000000000518', 'No monitoring needed', FALSE, 2),
  ('01B00000-0000-4000-8000-000000001071', '01B00000-0000-4000-8000-000000000518', 'Manual patching', FALSE, 3),
  ('01B00000-0000-4000-8000-000000001072', '01B00000-0000-4000-8000-000000000518', 'Self-managed hardware', FALSE, 4),
  -- Q7 (519): subnets
  ('01B00000-0000-4000-8000-000000001073', '01B00000-0000-4000-8000-000000000519', 'Subnets', TRUE,  1),
  ('01B00000-0000-4000-8000-000000001074', '01B00000-0000-4000-8000-000000000519', 'Firewall rules', FALSE, 2),
  ('01B00000-0000-4000-8000-000000001075', '01B00000-0000-4000-8000-000000000519', 'Peering attachments', FALSE, 3),
  ('01B00000-0000-4000-8000-000000001076', '01B00000-0000-4000-8000-000000000519', 'Routes', FALSE, 4),
  -- Q7 (519)q2: deny by default
  ('01B00000-0000-4000-8000-000000001077', '01B00000-0000-4000-8000-000000000520', 'Deny by default', TRUE,  1),
  ('01B00000-0000-4000-8000-000000001078', '01B00000-0000-4000-8000-000000000520', 'Allow by default', FALSE, 2),
  ('01B00000-0000-4000-8000-000000001079', '01B00000-0000-4000-8000-000000000520', 'Permit all ports', FALSE, 3),
  ('01B00000-0000-4000-8000-000000001080', '01B00000-0000-4000-8000-000000000520', 'Only UDP allowed', FALSE, 4),
  -- Q7 (519)q3: global LB
  ('01B00000-0000-4000-8000-000000001081', '01B00000-0000-4000-8000-000000000521', 'Global external HTTPS load balancer', TRUE,  1),
  ('01B00000-0000-4000-8000-000000001082', '01B00000-0000-4000-8000-000000000521', 'Internal passthrough load balancer', FALSE, 2),
  ('01B00000-0000-4000-8000-000000001083', '01B00000-0000-4000-8000-000000000521', 'Cloud NAT', FALSE, 3),
  ('01B00000-0000-4000-8000-000000001084', '01B00000-0000-4000-8000-000000000521', 'VPC peering', FALSE, 4),
  -- Q8 (522): alerting policy
  ('01B00000-0000-4000-8000-000000001085', '01B00000-0000-4000-8000-000000000522', 'Alerting policy', TRUE,  1),
  ('01B00000-0000-4000-8000-000000001086', '01B00000-0000-4000-8000-000000000522', 'Firewall rule', FALSE, 2),
  ('01B00000-0000-4000-8000-000000001087', '01B00000-0000-4000-8000-000000000522', 'Storage class', FALSE, 3),
  ('01B00000-0000-4000-8000-000000001088', '01B00000-0000-4000-8000-000000000522', 'Machine image', FALSE, 4),
  -- Q8 (522)q2: recommender
  ('01B00000-0000-4000-8000-000000001089', '01B00000-0000-4000-8000-000000000523', 'Recommender', TRUE,  1),
  ('01B00000-0000-4000-8000-000000001090', '01B00000-0000-4000-8000-000000000523', 'Cloud Shell', FALSE, 2),
  ('01B00000-0000-4000-8000-000000001091', '01B00000-0000-4000-8000-000000000523', 'App Engine', FALSE, 3),
  ('01B00000-0000-4000-8000-000000001092', '01B00000-0000-4000-8000-000000000523', 'VPC peering', FALSE, 4),
  -- Q8 (522)q3: budget behavior
  ('01B00000-0000-4000-8000-000000001093', '01B00000-0000-4000-8000-000000000524', 'It sends a notification', TRUE,  1),
  ('01B00000-0000-4000-8000-000000001094', '01B00000-0000-4000-8000-000000000524', 'It deletes the project', FALSE, 2),
  ('01B00000-0000-4000-8000-000000001095', '01B00000-0000-4000-8000-000000000524', 'It turns off billing', FALSE, 3),
  ('01B00000-0000-4000-8000-000000001096', '01B00000-0000-4000-8000-000000000524', 'It removes all VMs', FALSE, 4),
  -- Q9 (525): secret manager
  ('01B00000-0000-4000-8000-000000001097', '01B00000-0000-4000-8000-000000000525', 'Cloud Secret Manager', TRUE,  1),
  ('01B00000-0000-4000-8000-000000001098', '01B00000-0000-4000-8000-000000000525', 'A Dockerfile ENV variable', FALSE, 2),
  ('01B00000-0000-4000-8000-000000001099', '01B00000-0000-4000-8000-000000000525', 'A public source file', FALSE, 3),
  ('01B00000-0000-4000-8000-000000001100', '01B00000-0000-4000-8000-000000000525', 'An email thread', FALSE, 4),
  -- Q9 (525)q2: least privilege
  ('01B00000-0000-4000-8000-000000001101', '01B00000-0000-4000-8000-000000000526', 'Least privilege', TRUE,  1),
  ('01B00000-0000-4000-8000-000000001102', '01B00000-0000-4000-8000-000000000526', 'Owner for everyone', FALSE, 2),
  ('01B00000-0000-4000-8000-000000001103', '01B00000-0000-4000-8000-000000000526', 'Editor for everyone', FALSE, 3),
  ('01B00000-0000-4000-8000-000000001104', '01B00000-0000-4000-8000-000000000526', 'No permissions needed', FALSE, 4),
  -- Q9 (525)q3: global LB
  ('01B00000-0000-4000-8000-000000001105', '01B00000-0000-4000-8000-000000000527', 'Global external HTTPS load balancer', TRUE,  1),
  ('01B00000-0000-4000-8000-000000001106', '01B00000-0000-4000-8000-000000000527', 'Internal passthrough load balancer', FALSE, 2),
  ('01B00000-0000-4000-8000-000000001107', '01B00000-0000-4000-8000-000000000527', 'Cloud NAT', FALSE, 3),
  ('01B00000-0000-4000-8000-000000001108', '01B00000-0000-4000-8000-000000000527', 'VPC peering', FALSE, 4),
  -- Q9 (525)q4: snapshot restore
  ('01B00000-0000-4000-8000-000000001109', '01B00000-0000-4000-8000-000000000528', 'Restore from a snapshot', TRUE,  1),
  ('01B00000-0000-4000-8000-000000001110', '01B00000-0000-4000-8000-000000000528', 'Delete and recreate the disk', FALSE, 2),
  ('01B00000-0000-4000-8000-000000001111', '01B00000-0000-4000-8000-000000000528', 'Wait for autoscaling', FALSE, 3),
  ('01B00000-0000-4000-8000-000000001112', '01B00000-0000-4000-8000-000000000528', 'Rebuild the firewall', FALSE, 4),
  -- Q9 (525)q5: serverless value
  ('01B00000-0000-4000-8000-000000001113', '01B00000-0000-4000-8000-000000000529', 'Scale-to-zero and per-use billing', TRUE,  1),
  ('01B00000-0000-4000-8000-000000001114', '01B00000-0000-4000-8000-000000000529', 'Always-on dedicated VMs', FALSE, 2),
  ('01B00000-0000-4000-8000-000000001115', '01B00000-0000-4000-8000-000000000529', 'Static bare-metal racks', FALSE, 3),
  ('01B00000-0000-4000-8000-000000001116', '01B00000-0000-4000-8000-000000000529', 'Hourly minimum instance fees', FALSE, 4)
ON CONFLICT (id) DO NOTHING;
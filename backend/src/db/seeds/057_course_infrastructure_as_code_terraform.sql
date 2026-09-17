-- ============================================================================
-- SEED 057: Complete course — "Infrastructure as Code with Terraform"
-- ----------------------------------------------------------------------------
-- Instructor : David Kim        (10000000-0000-4000-8000-000000000004)
-- Category   : Cloud Computing  (20000000-0000-4000-8000-000000000004)
-- Level      : ADVANCED · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 IaC Foundations                 → C1 IaC Concepts · C2 Terraform CLI Workflow
--   M2 HCL & Providers                 → C3 HCL Syntax · C4 Providers, Resources & Data Sources
--   M3 Variables, Outputs & State      → C5 Variables & Outputs · C6 State Management
--   M4 Modules & Workspaces            → C7 Modules & Reusability · C8 Workspaces & Dynamic HCL
--   M5 Security, Practices & Capstone  → C9 Best Practices & Security · C10 Capstone: Web Tier
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
  '03900000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000004',
  '20000000-0000-4000-8000-000000000004',
  'Infrastructure as Code with Terraform',
  'infrastructure-as-code-terraform',
  'Treat your infrastructure like application code. Master infrastructure as code principles, the Terraform core workflow, HCL syntax, providers and resources, state management with locking, reusable modules, workspaces, and security — then deploy a complete web server stack.',
  'PUBLISHED',
  'ADVANCED',
  'SUBSCRIPTION',
  55
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('03900000-0000-4000-8000-000000000011', '03900000-0000-4000-8000-000000000001', 'Apply infrastructure as code principles and the Terraform core workflow to real projects.', 1),
  ('03900000-0000-4000-8000-000000000012', '03900000-0000-4000-8000-000000000001', 'Author HCL configuration with providers, resources, data sources, and built-in functions.',      2),
  ('03900000-0000-4000-8000-000000000013', '03900000-0000-4000-8000-000000000001', 'Parameterize configuration with typed variables, locals, and reusable outputs.',               3),
  ('03900000-0000-4000-8000-000000000014', '03900000-0000-4000-8000-000000000001', 'Manage Terraform state with remote backends, locking, and safe operational commands.',         4),
  ('03900000-0000-4000-8000-000000000015', '03900000-0000-4000-8000-000000000001', 'Design reusable modules, isolate environments with workspaces, and harden a capstone deployment.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('03900000-0000-4000-8000-000000000101', '03900000-0000-4000-8000-000000000001', 1, 'IaC Foundations',        'Ground infrastructure as code in theory and the Terraform core workflow.',      'PUBLISHED'),
  ('03900000-0000-4000-8000-000000000102', '03900000-0000-4000-8000-000000000001', 2, 'HCL & Providers',        'Author configuration in HCL and connect Terraform to cloud APIs.',              'PUBLISHED'),
  ('03900000-0000-4000-8000-000000000103', '03900000-0000-4000-8000-000000000001', 3, 'Variables, Outputs & State', 'Parameterize configuration and manage Terraform state safely.',              'PUBLISHED'),
  ('03900000-0000-4000-8000-000000000104', '03900000-0000-4000-8000-000000000001', 4, 'Modules & Workspaces',   'Package reusable building blocks and isolate environments.',                     'PUBLISHED'),
  ('03900000-0000-4000-8000-000000000105', '03900000-0000-4000-8000-000000000001', 5, 'Security, Practices & Capstone', 'Follow best practices and deploy a complete web server stack.',        'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('03900000-0000-4000-8000-000000000201', '03900000-0000-4000-8000-000000000101', 1, 'IaC Concepts', 'Why modern platforms treat infrastructure as software.',                  'PUBLISHED'),
  ('03900000-0000-4000-8000-000000000202', '03900000-0000-4000-8000-000000000101', 2, 'Terraform CLI Workflow', 'Tools, the command line, and the init/plan/apply loop.',          'PUBLISHED'),
  ('03900000-0000-4000-8000-000000000203', '03900000-0000-4000-8000-000000000102', 1, 'HCL Syntax', 'Blocks, arguments, expressions, and built-in functions.',                 'PUBLISHED'),
  ('03900000-0000-4000-8000-000000000204', '03900000-0000-4000-8000-000000000102', 2, 'Providers, Resources & Data Sources', 'Connect to APIs and describe what to create.',              'PUBLISHED'),
  ('03900000-0000-4000-8000-000000000205', '03900000-0000-4000-8000-000000000103', 1, 'Variables & Outputs', 'Parameterize input and surface computed results.',                   'PUBLISHED'),
  ('03900000-0000-4000-8000-000000000206', '03900000-0000-4000-8000-000000000103', 2, 'State Management', 'Track infrastructure and keep operations safe.',                        'PUBLISHED'),
  ('03900000-0000-4000-8000-000000000207', '03900000-0000-4000-8000-000000000104', 1, 'Modules & Reusability', 'Package and version infrastructure building blocks.',                 'PUBLISHED'),
  ('03900000-0000-4000-8000-000000000208', '03900000-0000-4000-8000-000000000104', 2, 'Workspaces & Dynamic HCL', 'Environments and flexible dynamic blocks.',                     'PUBLISHED'),
  ('03900000-0000-4000-8000-000000000209', '03900000-0000-4000-8000-000000000105', 1, 'Best Practices & Security', 'Quality planning and secrets hygiene.',                            'PUBLISHED'),
  ('03900000-0000-4000-8000-000000000210', '03900000-0000-4000-8000-000000000105', 2, 'Capstone: Web Tier', 'Plan and apply a complete web server stack.',                            'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 03900000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('03900000-0000-4000-8000-000000000301', '03900000-0000-4000-8000-000000000201', 1, 'What is Infrastructure as Code?',   'See why modern platforms treat infrastructure as software.',        'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('03900000-0000-4000-8000-000000000302', '03900000-0000-4000-8000-000000000201', 2, 'Managing Infrastructure with Code', 'Compare provisioners and configuration managers, then meet Terraform.', 'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('03900000-0000-4000-8000-000000000303', '03900000-0000-4000-8000-000000000201', 3, 'IaC Concepts Quiz',                 'Check your grasp of infrastructure as code fundamentals.',           'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03900000-0000-4000-8000-000000000304', '03900000-0000-4000-8000-000000000202', 1, 'The Terraform Core Workflow',       'Initialize a project, plan a change, and apply it safely.',          'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03900000-0000-4000-8000-000000000305', '03900000-0000-4000-8000-000000000202', 2, 'Reading Plans & Applying Changes',  'Interpret plan output and run apply and destroy.',                   'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03900000-0000-4000-8000-000000000306', '03900000-0000-4000-8000-000000000202', 3, 'Terraform Workflow Quiz',           'Test your command-line workflow knowledge.',                          'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03900000-0000-4000-8000-000000000307', '03900000-0000-4000-8000-000000000203', 1, 'HCL Blocks & Arguments',            'Write blocks, arguments, and references that talk to APIs.',         'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03900000-0000-4000-8000-000000000308', '03900000-0000-4000-8000-000000000203', 2, 'Types, Expressions & Functions',    'Model data with HCL types and built-in functions.',                  'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03900000-0000-4000-8000-000000000309', '03900000-0000-4000-8000-000000000203', 3, 'HCL Syntax Quiz',                   'Verify your HCL authoring skills.',                                  'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03900000-0000-4000-8000-000000000310', '03900000-0000-4000-8000-000000000204', 1, 'Providers: Connecting to Clouds',   'Discover, version, and configure provider plugins.',                 'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03900000-0000-4000-8000-000000000311', '03900000-0000-4000-8000-000000000204', 2, 'Resources & Data Sources',          'Declare what to create and read what already exists.',               'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03900000-0000-4000-8000-000000000312', '03900000-0000-4000-8000-000000000204', 3, 'Providers & Resources Quiz',        'Confirm you can wire providers and resources.',                      'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03900000-0000-4000-8000-000000000313', '03900000-0000-4000-8000-000000000205', 1, 'Input Variables & Validation',      'Parameterize configuration with typed, validated inputs.',           'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03900000-0000-4000-8000-000000000314', '03900000-0000-4000-8000-000000000205', 2, 'Locals & Outputs',                  'Rename expressions with locals and surface results with outputs.',   'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('03900000-0000-4000-8000-000000000315', '03900000-0000-4000-8000-000000000205', 3, 'Variables & Outputs Quiz',          'Check your parameterization knowledge.',                             'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03900000-0000-4000-8000-000000000316', '03900000-0000-4000-8000-000000000206', 1, 'Understanding State',               'Learn why Terraform tracks every resource it manages.',              'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03900000-0000-4000-8000-000000000317', '03900000-0000-4000-8000-000000000206', 2, 'Backends & State Locking',          'Store state remotely and prevent concurrent writes.',                'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03900000-0000-4000-8000-000000000318', '03900000-0000-4000-8000-000000000206', 3, 'State Management Quiz',             'Prove you can manage state safely.',                                 'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03900000-0000-4000-8000-000000000319', '03900000-0000-4000-8000-000000000207', 1, 'Modules & Reusability',             'Package configuration into reusable building blocks.',               'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03900000-0000-4000-8000-000000000320', '03900000-0000-4000-8000-000000000207', 2, 'Module Structure & Versioning',     'Design module interfaces and pin versions.',                         'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03900000-0000-4000-8000-000000000321', '03900000-0000-4000-8000-000000000207', 3, 'Modules Quiz',                      'Test your module authoring skills.',                                 'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03900000-0000-4000-8000-000000000322', '03900000-0000-4000-8000-000000000208', 1, 'Workspaces & Environments',         'Isolate environments with named workspaces.',                        'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('03900000-0000-4000-8000-000000000323', '03900000-0000-4000-8000-000000000208', 2, 'Dynamic Blocks & HCL Functions',    'Generate nested blocks and compose values with functions.',          'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03900000-0000-4000-8000-000000000324', '03900000-0000-4000-8000-000000000208', 3, 'Scaling Terraform Quiz',            'Check your workspace and dynamic HCL knowledge.',                    'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03900000-0000-4000-8000-000000000325', '03900000-0000-4000-8000-000000000209', 1, 'Best Practices & Code Quality',     'Format, validate, document, and review infrastructure code.',        'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03900000-0000-4000-8000-000000000326', '03900000-0000-4000-8000-000000000209', 2, 'Secrets, Security & Remote Operation', 'Keep sensitive values out of state and lock operations.',        'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03900000-0000-4000-8000-000000000327', '03900000-0000-4000-8000-000000000210', 1, 'Capstone: Deploying a Web Server Stack', 'Plan and apply a real three-resource web tier.',               'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03900000-0000-4000-8000-000000000328', '03900000-0000-4000-8000-000000000210', 2, 'Final Assessment',                   'Prove you can manage infrastructure as code with Terraform.',        'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 03900000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES

(
  '03900000-0000-4000-8000-000000000401',
  '03900000-0000-4000-8000-000000000301',
  1,
  'What is Infrastructure as Code?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What is Infrastructure as Code?</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>What is Infrastructure as Code?</h1>
  <p>For decades, servers were clicked into existence. An engineer opened a dashboard, picked a machine type, waited for a wizard, and manually recorded what was created. The result was <strong>snowflake infrastructure</strong> — environments nobody could reproduce exactly, and nobody dared to rebuild.</p>
  <p><strong>Infrastructure as Code (IaC)</strong> changes the deal: you describe your entire platform — networks, instances, databases, load balancers — as <em>files in version control</em>. The tools then create, update, and delete real infrastructure to match those files.</p>
  <h2>From clicks to code</h2>
  <ul>
    <li><strong>Manual consoles</strong> — fast for one server, impossible to audit or repeat.</li>
    <li><strong>Imperative scripts</strong> — a shell script that issues API calls step by step.</li>
    <li><strong>Declarative IaC</strong> — you state the <em>desired end state</em>; the tool figures out the steps.</li>
  </ul>
  <h2>Declarative means: describe, do not script</h2>
  <p>With Terraform you write the end state — three subnets, two instances, one load balancer — and let the engine compute the differences:</p>
  <pre class="code-block">provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0abcdef1234567890"
  instance_type = "t3.micro"
}</pre>
  <h2>Provisioning vs configuration management</h2>
  <table>
    <tr><th>Concern</th><th>Provisioning (Terraform)</th><th>Configuration mgmt (Ansible)</th></tr>
    <tr><td>Creates the host</td><td>Yes — instance, VPC, subnets</td><td>Usually not</td></tr>
    <tr><td>Installs software</td><td>Just a hook (user_data)</td><td>Yes — playbooks</td></tr>
    <tr><td>Ideal fit</td><td>Creating cloud resources</td><td>Setting up running systems</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Focus</strong>
    <p>This course is provisioning-first. Terraform creates and destroys infrastructure; configuration tools layer on top of the servers it builds.</p>
  </div>
  <h2>Why teams adopt it</h2>
  <ul>
    <li><strong>Reviewable</strong> — changes go through pull requests, not pray-and-click.</li>
    <li><strong>Reproducible</strong> — the same files yield the same platform.</li>
    <li><strong>Disposable</strong> — throw environments away and rebuild in minutes.</li>
    <li><strong>Auditable</strong> — every change to the platform is a change in git.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>First principle</strong>
    <p>If a human describes it in a ticket, it can probably be expressed as code. The moment you need three identical copies, IaC stops being a nice-to-have.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03900000-0000-4000-8000-000000000402',
  '03900000-0000-4000-8000-000000000302',
  1,
  'Managing Infrastructure with Code',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Managing Infrastructure with Code</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Managing Infrastructure with Code</h1>
  <p>IaC would be pointless if every team wrote its own tool. The ecosystem settled on a few mature players; this course centers on <strong>HashiCorp Terraform</strong>, the most widely adopted provisioning tool.</p>
  <h2>Where Terraform fits</h2>
  <ul>
    <li><strong>Cloud-agnostic</strong> — the same workflow drives AWS, Azure, GCP, and on-prem platforms.</li>
    <li><strong>Single source of truth</strong> — one language (HCL) for planners, networking, and compute.</li>
    <li><strong>Plan before change</strong> — nothing touches the cloud until you approve a diff.</li>
  </ul>
  <h2>Alternative approaches</h2>
  <table>
    <tr><th>Tool</th><th>Style</th><th>Best at</th></tr>
    <tr><td>Terraform</td><td>Declarative provisioner</td><td>Creating and destroying resources</td></tr>
    <tr><td>CloudFormation</td><td>Declarative (AWS-only)</td><td>Deep AWS-native stacks</td></tr>
    <tr><td>Ansible</td><td>Imperative playbooks</td><td>Configuring running hosts</td></tr>
    <tr><td>Pulumi</td><td>General-purpose languages</td><td>Code-first platforms</td></tr>
  </table>
  <h2>The core loop</h2>
  <p>Every Terraform session follows the same three beats — <span class="ic">init</span>, <span class="ic">plan</span>, <span class="ic">apply</span>:</p>
  <pre class="code-block">terraform init     # download providers, wire the backend
terraform plan     # compute a diff against reality, show it
terraform apply    # make reality match the code (after approval)</pre>
  <div class="callout callout-info">
    <strong>Configuration is a graph</strong>
    <p>Terraform orders work for you. It knows the load balancer depends on the instances and the instances depend on the subnets — your config does not need to sequence anything.</p>
  </div>
  <h2>What you will build</h2>
  <p>By the end of this course you will run these commands for real and ship a <strong>web server stack</strong>: a VPC, a security group, and an EC2 instance that serves a page — every piece created, updated, reviewed, and destroyed from code.</p>
  <div class="callout callout-tip">
    <strong>Prerequisites</strong>
    <p>Comfort with the command line and a basic idea of cloud concepts (instances, networks) is enough. All Terraform specifics are taught from zero.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03900000-0000-4000-8000-000000000404',
  '03900000-0000-4000-8000-000000000304',
  1,
  'The Terraform Core Workflow',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Terraform Core Workflow</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>The Terraform Core Workflow</h1>
  <p>Terraform is a single binary you drive from the terminal. After installing it, your everyday rhythm is <span class="ic">init</span> once, then <span class="ic">plan</span> and <span class="ic">apply</span> for each change.</p>
  <h2>1. terraform init</h2>
  <p>Run <span class="ic">init</span> once in a directory before anything else. It locates provider plugins named in your configuration, downloads them, and prepares the backend that will hold state:</p>
  <pre class="code-block">$ terraform init

Initializing the backend...
Terraform has been successfully initialized!
* hashicorp/aws: Downloading provider</pre>
  <div class="callout">
    <strong>Init is idempotent</strong>
    <p>You can (and should) re-run <span class="ic">init</span> as often as you like. It only creates what is missing, so it is safe to run inside CI.</p>
  </div>
  <h2>2. terraform plan</h2>
  <p>Plan compares your configuration against real infrastructure and prints a <em>diff</em> of every resource that would be added, changed, or destroyed. Nothing is modified:</p>
  <pre class="code-block">$ terraform plan

Terraform will perform the following actions:
  # aws_instance.web will be created
  + resource "aws_instance" "web" {
      + instance_type = "t3.micro"
    }

Plan: 1 to add, 0 to change, 0 to destroy.</pre>
  <h2>3. terraform apply</h2>
  <p>Apply executes the plan. By default it shows the same diff and asks you to type <span class="ic">yes</span>. Add <span class="ic">-auto-approve</span> to skip the prompt (CI scripts love this):</p>
  <pre class="code-block">$ terraform apply -auto-approve

aws_instance.web: Creating...
aws_instance.web: Creation complete after 32s [id=i-0abc123...]</pre>
  <h2>Cleanup with terraform destroy</h2>
  <p>When the environment is no longer needed, <span class="ic">destroy</span> removes every tracked resource in dependency order — no orphaned instances, no surprise bills.</p>
  <h2>Command map</h2>
  <table>
    <tr><th>Command</th><th>Purpose</th></tr>
    <tr><td>terraform init</td><td>Download providers, wire the backend</td></tr>
    <tr><td>terraform validate</td><td>Check syntax and internal consistency</td></tr>
    <tr><td>terraform plan</td><td>Preview changes, make no changes</td></tr>
    <tr><td>terraform apply</td><td>Execute the planned changes</td></tr>
    <tr><td>terraform destroy</td><td>Tear everything down</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Make plan the gate</strong>
    <p>In teams, plan output is reviewed by another engineer before anyone runs apply. That review — not the apply — is where mistakes die.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03900000-0000-4000-8000-000000000405',
  '03900000-0000-4000-8000-000000000305',
  1,
  'Reading Plans & Applying Changes',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reading Plans & Applying Changes</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Reading Plans &amp; Applying Changes</h1>
  <p>A plan is not Greek — it is a compact diff. Learn to read it and you can review any teammate change with confidence.</p>
  <h2>Decoding the symbols</h2>
  <ul>
    <li><span class="ic">+</span> create — the resource will be added.</li>
    <li><span class="ic">-</span> destroy — the resource will be removed.</li>
    <li><span class="ic">~</span> update — in-place changes with old and new values shown.</li>
    <li><span class="ic">-/+</span> replace — destroyed and recreated, usually because an input forced it.</li>
  </ul>
  <pre class="code-block">  # aws_instance.web must be replaced
-/+ resource "aws_instance" "web" {
      ~ instance_type = "t3.micro" -&gt; "t3.small"
    }</pre>
  <div class="callout">
    <strong>Conversations happen in the plan</strong>
    <p>A review comment like &ldquo;this replaces your database&rdquo; is normal. If you ever see a destroy you did not intend, stop and ask before applying.</p>
  </div>
  <h2>The bottom line</h2>
  <p>The final line summarizes the whole operation:</p>
  <pre class="code-block">Plan: 1 to add, 0 to change, 1 to destroy.</pre>
  <h2>Apply and its flavors</h2>
  <p><span class="ic">terraform apply</span> re-plans first, then waits for approval. Two common flags:</p>
  <table>
    <tr><th>Flag</th><th>Effect</th></tr>
    <tr><td>-auto-approve</td><td>Skip the confirmation prompt</td></tr>
    <tr><td>-target aws_instance.web</td><td>Operate on one resource (debugging only)</td></tr>
    <tr><td>-out plan.bin</td><td>Save a plan to apply verbatim later</td></tr>
  </table>
  <h2>Reading apply output</h2>
  <pre class="code-block">aws_security_group.web: Creating...
aws_security_group.web: Creation complete after 4s
aws_instance.web: Creating...
aws_instance.web: Still creating... [10s elapsed]
aws_instance.web: Creation complete after 22s

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.</pre>
  <p>Chunks print in dependency order: security group before the instance that references it.</p>
  <div class="callout callout-tip">
    <strong>Use the -out lockstep</strong>
    <p>Save a reviewed plan with <span class="ic">-out</span>, then apply exactly that file in CI. It guarantees the apply matches the reviewed plan bit-for-bit.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03900000-0000-4000-8000-000000000407',
  '03900000-0000-4000-8000-000000000307',
  1,
  'HCL Blocks & Arguments',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HCL Blocks & Arguments</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>HCL Blocks &amp; Arguments</h1>
  <p>HashiCorp Configuration Language (<span class="ic">HCL</span>) is the JSON-like language Terraform reads. Everything in HCL is a <strong>block</strong> containing <strong>arguments</strong>.</p>
  <h2>The anatomy of a block</h2>
  <pre class="code-block">resource "aws_instance" "web" {
  instance_type = "t3.micro"
  ami           = "ami-0abcdef1234567890"

  tags = {
    Name = "web-server"
  }
}</pre>
  <ul>
    <li><span class="ic">resource</span> — the block type.</li>
    <li><span class="ic">"aws_instance"</span> — a label identifying the resource type within the provider.</li>
    <li><span class="ic">"web"</span> — a second label; a name unique within the configuration.</li>
    <li><span class="ic">instance_type = "t3.micro"</span> — an argument with a value.</li>
  </ul>
  <h2>Block types you will use</h2>
  <table>
    <tr><th>Block</th><th>Declares</th></tr>
    <tr><td>terraform</td><td>Required version, backend settings</td></tr>
    <tr><td>provider</td><td>Which cloud API to talk to</td></tr>
    <tr><td>resource</td><td>Something to create and manage</td></tr>
    <tr><td>data</td><td>Something to read from an API</td></tr>
    <tr><td>variable</td><td>A typed input parameter</td></tr>
    <tr><td>output</td><td>Result exposed to callers</td></tr>
    <tr><td>module</td><td>An instance of a reusable module</td></tr>
  </table>
  <h2>References and expressions</h2>
  <p>Arguments can reference other resources, which is how Terraform builds its dependency graph:</p>
  <pre class="code-block">resource "aws_instance" "web" {
  subnet_id = aws_subnet.web.id
  tags = {
    Name = "${var.prefix}-web"
  }
}</pre>
  <h2>Comments</h2>
  <p>Use <span class="ic">#</span> for single-line comments and <span class="ic">/* ... */</span> for blocks. Tend toward few comments; the configuration should read itself.</p>
  <div class="callout callout-info">
    <strong>Attribute vs nested block</strong>
    <p>Values that are lists/maps can often be written as nested blocks instead of arguments. The provider documentation tells you which form each setting accepts.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03900000-0000-4000-8000-000000000408',
  '03900000-0000-4000-8000-000000000308',
  1,
  'Types, Expressions & Functions',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Types, Expressions & Functions</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Types, Expressions &amp; Functions</h1>
  <p>HCL values have types, expressions combine them, and functions transform them. Master these three and configuration stops being repetitive.</p>
  <h2>Primitive types</h2>
  <table>
    <tr><th>Type</th><th>Example</th><th>Notes</th></tr>
    <tr><td>string</td><td>"t3.micro"</td><td>Double-quoted text, with ${} interpolation</td></tr>
    <tr><td>number</td><td>80, 0.5</td><td>Integers and decimals</td></tr>
    <tr><td>bool</td><td>true / false</td><td>Literal keywords</td></tr>
  </table>
  <h2>Collection types</h2>
  <ul>
    <li><span class="ic">list(string)</span> — ordered, indexed like <span class="ic">var.zones[0]</span>.</li>
    <li><span class="ic">set(string)</span> — unordered, unique; great for <span class="ic">for_each</span>.</li>
    <li><span class="ic">map(string)</span> — key/value pairs, looked up like <span class="ic">var.tags["env"]</span>.</li>
    <li><span class="ic">object(...)</span> and <span class="ic">tuple(...)</span> — structured records.</li>
  </ul>
  <h2>Expressions</h2>
  <pre class="code-block">name = "web-${var.env}"            # interpolation
port = var.https_enabled ? 443 : 80   # conditional
ips  = concat(var.allowlist, local.extra) # function call</pre>
  <h2>Collection operations</h2>
  <p><span class="ic">for</span> expressions transform lists and maps into new collections:</p>
  <pre class="code-block"># Turn ["a", "b"] into { "A" = "a", "B" = "b" }
mapped = { for n in var.names : upper(n) =&gt; n }</pre>
  <div class="callout">
    <strong>Splat</strong>
    <p><span class="ic">var.instances[*].id</span> visits every element and collects the <span class="ic">id</span> attributes — the quickest way to harvest values out of a list of resources.</p>
  </div>
  <h2>Common functions</h2>
  <table>
    <tr><th>Function</th><th>Returns</th></tr>
    <tr><td>upper / lower</td><td>Case-converted string</td></tr>
    <tr><td>join(", ", list)</td><td>Concatenated string</td></tr>
    <tr><td>length(list)</td><td>Element count</td></tr>
    <tr><td>toset(list)</td><td>A set usable with for_each</td></tr>
    <tr><td>lookup(map, "k", "dflt")</td><td>Map value with a fallback</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Experiments are free</strong>
    <p><span class="ic">terraform console</span> lets you evaluate expressions against your real variables and state before committing them to a file.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03900000-0000-4000-8000-000000000410',
  '03900000-0000-4000-8000-000000000310',
  1,
  'Providers: Connecting to Clouds',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Providers: Connecting to Clouds</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Providers: Connecting to Clouds</h1>
  <p>A <strong>provider</strong> is a plugin that translates HCL into real API calls. Terraform itself is cloud-agnostic; the provider brings the cloud.</p>
  <h2>Declaring a provider</h2>
  <p>You enable a provider with the <span class="ic">provider</span> block and pin your required versions in a <span class="ic">terraform</span> block:</p>
  <pre class="code-block">terraform {
  required_version = "&gt;= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~&gt; 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}</pre>
  <h2>Where providers come from</h2>
  <p><span class="ic">terraform init</span> fetches them from the <strong>Terraform Registry</strong> (registry.terraform.io). Providers are signed and versioned, just like software libraries.</p>
  <h2>Common providers</h2>
  <table>
    <tr><th>Provider</th><th>Resource families</th></tr>
    <tr><td>hashicorp/aws</td><td>EC2, VPC, RDS, S3, IAM...</td></tr>
    <tr><td>hashicorp/google</td><td>Compute Engine, GKE, Cloud SQL...</td></tr>
    <tr><td>hashicorp/azurerm</td><td>VMs, App Service, AKS...</td></tr>
    <tr><td>hashicorp/kubernetes</td><td>Deployments, Services, Ingress...</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Version pinning</strong>
    <p><span class="ic">~&gt; 5.0</span> means &ldquo;any 5.x, but not 6.x&rdquo;. This removes surprise while letting patch releases through. Never drift onto &ldquo;latest&rdquo; silently.</p>
  </div>
  <h2>Credentials</h2>
  <p>Providers read credentials from well-known environment variables or shared config files, so secrets never need to appear in HCL:</p>
  <pre class="code-block">set AWS_REGION=us-east-1
set AWS_PROFILE=iac-course   # from ~/.aws/credentials</pre>
  <div class="callout callout-tip">
    <strong>Never bake credentials</strong>
    <p>Hard-coding keys in <span class="ic">main.tf</span> leaks them through git history. Real projects use environment variables, assumed roles, or a secrets store — covered in module 5.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03900000-0000-4000-8000-000000000411',
  '03900000-0000-4000-8000-000000000311',
  1,
  'Resources & Data Sources',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Resources & Data Sources</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Resources &amp; Data Sources</h1>
  <p>Two block types do the heavy lifting: <strong>resources</strong> create and manage infrastructure, <strong>data sources</strong> read infrastructure that already exists.</p>
  <h2>Resources</h2>
  <p>A resource declares a specific cloud object. Terraform creates it on apply and tracks it in state:</p>
  <pre class="code-block">resource "aws_instance" "web" {
  ami           = "ami-0abcdef1234567890"
  instance_type = "t3.micro"
}

resource "aws_security_group" "web" {
  name = "web-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}</pre>
  <h2>Referencing attributes</h2>
  <p>Resources expose read-only attributes through dotted references. The security group is wired to the instance:</p>
  <pre class="code-block">resource "aws_instance" "web" {
  vpc_security_group_ids = [aws_security_group.web.id]
}</pre>
  <h2>count and for_each</h2>
  <p>One resource block can fan out into many instances:</p>
  <pre class="code-block">resource "aws_instance" "pool" {
  count         = 3
  instance_type = "t3.micro"
  ami           = "ami-0abcdef1234567890"
}
# aws_instance.pool[0], [1], [2]</pre>
  <div class="callout callout-info">
    <strong>Meta-arguments</strong>
    <p><span class="ic">count</span>, <span class="ic">for_each</span>, <span class="ic">depends_on</span>, and <span class="ic">lifecycle</span> are meta-arguments — every resource accepts them, whatever the provider.</p>
  </div>
  <h2>Data sources</h2>
  <p>Use a data source when the platform or another team owns something you only need to <em>use</em>:</p>
  <pre class="code-block">data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-22.04-*"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
}</pre>
  <div class="callout callout-tip">
    <strong>Read, do not recreate</strong>
    <p>Prefer data sources for anything you did not create (shared VPCs, official AMIs). Terraform imports nothing and destroys nothing: it just reads.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03900000-0000-4000-8000-000000000413',
  '03900000-0000-4000-8000-000000000313',
  1,
  'Input Variables & Validation',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Input Variables & Validation</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Input Variables &amp; Validation</h1>
  <p>Hard-coding values makes a configuration a one-off. <strong>Input variables</strong> turn it into a parameterized template.</p>
  <h2>Declaring a variable</h2>
  <pre class="code-block">variable "environment" {
  type        = string
  description = "Where this stack runs: dev, staging, or prod."
  default     = "dev"
}

variable "instance_count" {
  type    = number
  default = 2
}</pre>
  <p>Reference values as <span class="ic">var.environment</span> anywhere in the configuration.</p>
  <h2>How values are supplied</h2>
  <table>
    <tr><th>Source</th><th>Example</th><th>Priority</th></tr>
    <tr><td>-var-file</td><td>-var-file=terraform.tfvars</td><td>Explicit files, highest</td></tr>
    <tr><td>-var</td><td>-var instance_count=3</td><td>Overrides file values</td></tr>
    <tr><td>Environment</td><td>TF_VAR_instance_count</td><td>Overrides tfvars</td></tr>
    <tr><td>default</td><td>default = 2</td><td>Used when nothing supplies one</td></tr>
  </table>
  <div class="callout">
    <strong>Keep secrets out of tfvars in git</strong>
    <p>File <span class="ic">terraform.tfvars</span> is read automatically — great for config. For secrets, use a separate file added to <span class="ic">.gitignore</span> or an external secrets store (module 5).</p>
  </div>
  <h2>Validation</h2>
  <p>Guard the edges with a <span class="ic">validation</span> block so bad input fails at plan time, not after a create:</p>
  <pre class="code-block">variable "cidr_block" {
  type = string

  validation {
    condition     = can(cidrhost(var.cidr_block, 0))
    error_message = "Must be a valid IPv4 CIDR, like 10.0.0.0/16."
  }
}</pre>
  <h2>Sensitive variables</h2>
  <p>Mark secrets so the CLI redacts them from plan output and state display:</p>
  <pre class="code-block">variable "db_password" {
  type      = string
  sensitive = true
}</pre>
  <div class="callout callout-tip">
    <strong>Descriptions become docs</strong>
    <p>Describe every variable and output. Tools like <span class="ic">terraform-docs</span> render a README from them automatically.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03900000-0000-4000-8000-000000000414',
  '03900000-0000-4000-8000-000000000314',
  1,
  'Locals & Outputs',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Locals & Outputs</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Locals &amp; Outputs</h1>
  <p>Between input and real infrastructure sit two quiet helpers: <span class="ic">locals</span> for intermediate values and <span class="ic">outputs</span> for results you hand back.</p>
  <h2>Locals — name your expressions</h2>
  <p>Locals are computed values that other blocks can reference. They cannot be set from outside and never appear in the plan as inputs:</p>
  <pre class="code-block">locals {
  name_prefix = "${var.project}-${var.environment}"
  common_tags = {
    Project     = var.project
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

resource "aws_instance" "web" {
  tags = local.common_tags
  tags_all = {
    Name = local.name_prefix
  }
}</pre>
  <div class="callout callout-info">
    <strong>Locals are purely local</strong>
    <p>You cannot set a local from the CLI, and its value only exists inside this configuration. Use them to remove duplication, not to pass data in.</p>
  </div>
  <h2>Outputs — hand results back</h2>
  <p>Outputs surface attributes after apply, feed parent modules, and make the CLI genuinely useful:</p>
  <pre class="code-block">output "web_public_ip" {
  value       = aws_instance.web.public_ip
  description = "Public IP of the web server"
}

output "web_url" {
  value = "http://${aws_instance.web.public_dns}"
}</pre>
  <pre class="code-block">$ terraform output
web_public_ip = "54.123.45.67"
web_url = "http://ec2-54-123-45-67.compute-1.amazonaws.com"</pre>
  <h2>Designing a contract</h2>
  <p>Think of a configuration (or module) as a function: variables are the arguments, outputs the return value. Keep outputs minimal and well-described — they are the public API.</p>
  <div class="callout callout-tip">
    <strong>Sensitive outputs</strong>
    <p>Mark password-like outputs <span class="ic">sensitive = true</span> so they are hidden from plain terminal output. The value is still stored encrypted in proper backends.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03900000-0000-4000-8000-000000000416',
  '03900000-0000-4000-8000-000000000316',
  1,
  'Understanding State',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Understanding State</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Understanding State</h1>
  <p>After you apply, Terraform writes a <strong>state file</strong>. It is the system of record: a mapping between your configuration and the real hardware it created.</p>
  <h2>What state does</h2>
  <ul>
    <li><strong>Tracks what exists</strong> — resource IDs, ARNs, and attributes you need later.</li>
    <li><strong>Enables diffs</strong> — plan compares configuration to state, not blindly to the whole account.</li>
    <li><strong>Stores references</strong> — attribute values (like subnet ids) that providers return at creation.</li>
  </ul>
  <p>Inside, state looks like a flat JSON document:</p>
  <pre class="code-block">{ "resources": [
    {
      "type": "aws_instance",
      "name": "web",
      "instances": [
        { "attributes": { "id": "i-0abc123", "instance_type": "t3.micro" } }
      ]
    }
] }</pre>
  <div class="callout">
    <strong>State is a sensitive file</strong>
    <p>State often contains credentials and plaintext attributes. Commit it to version control only if the backend guarantees encryption; prefer a remote backend instead (next lesson).</p>
  </div>
  <h2>State commands</h2>
  <table>
    <tr><th>Command</th><th>Purpose</th></tr>
    <tr><td>terraform state list</td><td>List every tracked resource</td></tr>
    <tr><td>terraform state show</td><td>Dump one resource&rsquo;s attributes</td></tr>
    <tr><td>terraform state mv</td><td>Rename a resource without recreating it</td></tr>
    <tr><td>terraform state rm</td><td>Forget a resource (stop managing it)</td></tr>
    <tr><td>terraform import</td><td>Adopt existing infra into state</td></tr>
  </table>
  <h2>Importing existing resources</h2>
  <pre class="code-block">resource "aws_instance" "legacy" {
  # ... matching arguments ...
}

terraform import aws_instance.legacy i-0existing123456789</pre>
  <div class="callout callout-tip">
    <strong>Never hand-edit state</strong>
    <p>Editing the JSON by hand corrupts it. Use the state subcommands — they are designed to keep the file valid while you refactor names.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03900000-0000-4000-8000-000000000417',
  '03900000-0000-4000-8000-000000000317',
  1,
  'Backends & State Locking',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Backends & State Locking</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Backends &amp; State Locking</h1>
  <p>Local state (a <span class="ic">terraform.tfstate</span> file) works for a demo. Teams need a <strong>remote backend</strong> — shared storage that also provides <strong>locking</strong>.</p>
  <h2>Local vs remote</h2>
  <table>
    <tr><th>Quality</th><th>Local</th><th>Remote</th></tr>
    <tr><td>Shared between engineers</td><td>No</td><td>Yes</td></tr>
    <tr><td>Locking</td><td>None</td><td>Yes (most backends)</td></tr>
    <tr><td>Encrypted at rest</td><td>Your disk</td><td>Provider-managed</td></tr>
    <tr><td>Backups / audit</td><td>On your own</td><td>Provider-managed</td></tr>
  </table>
  <h2>Declaring a backend</h2>
  <p>The classic team setup stores state in object storage (here S3) and locks with a table that supports lease semantics (DynamoDB):</p>
  <pre class="code-block">terraform {
  backend "s3" {
    bucket         = "iac-state-2026"
    key            = "web/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}</pre>
  <p>After editing the backend, run <span class="ic">terraform init -reconfigure</span> to re-point state. Terraform offers a guided state migration during init.</p>
  <div class="callout callout-info">
    <strong>Locking in action</strong>
    <p>While one run holds the lock, a second <span class="ic">apply</span> waits with <span class="ic">Acquiring state lock...</span> instead of clobbering the file. That is the safety net teams rely on.</p>
  </div>
  <h2>Forcing a stale lock</h2>
  <p>Only break a lock when a crashed process really left it behind — like a crashed CI job:</p>
  <pre class="code-block">terraform force-unlock &lt;LOCK_ID&gt;</pre>
  <h2>Partial configuration</h2>
  <p>Keep static settings in code and inject account-specific values at init time (safe for keys):</p>
  <pre class="code-block">terraform init \
  -backend-config="bucket=iac-state-2026" \
  -backend-config="dynamodb_table=terraform-locks"</pre>
  <div class="callout callout-tip">
    <strong>Version control, not secrets</strong>
    <p>The state file itself holds secrets, so a remote backend that encrypts at rest and never enters git is the correct home for it.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03900000-0000-4000-8000-000000000419',
  '03900000-0000-4000-8000-000000000319',
  1,
  'Modules & Reusability',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Modules & Reusability</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Modules &amp; Reusability</h1>
  <p>A <strong>module</strong> is simply a directory of <span class="ic">.tf</span> files with a defined input/output contract. Every Terraform project is really a <em>root module</em>; reusable packages are <em>child modules</em>.</p>
  <h2>A first module call</h2>
  <pre class="code-block">module "web" {
  source        = "./modules/web"
  environment   = var.environment
  instance_type = "t3.small"
}</pre>
  <p>Anything quoted after <span class="ic">source</span> can live somewhere other than disk: a git URL, a registry, a tarball. Terraform fetches it during <span class="ic">init</span>.</p>
  <h2>Reasons to modularize</h2>
  <ul>
    <li><strong>Compose</strong> — a web tier, a database tier, and a VPC become building blocks.</li>
    <li><strong>Consistency</strong> — the same security defaults in every environment.</li>
    <li><strong>Testability</strong> — a module with a clean contract can be validated in isolation.</li>
  </ul>
  <h2>Using a module output</h2>
  <p>Once the module runs, its declared outputs become available on the module reference:</p>
  <pre class="code-block">output "instance_ip" {
  value = module.web.public_ip
}</pre>
  <h2>Repeating a module</h2>
  <pre class="code-block">module "app_zone" {
  source   = "./modules/site"
  for_each = toset(var.zones)
  zone     = each.key
}</pre>
  <div class="callout callout-info">
    <strong>Modules share a provider</strong>
    <p>Child modules normally inherit providers from the root. Explicit <span class="ic">providers = { ... }</span> blocks exist for multi-region setups.</p>
  </div>
  <h2>Registry naming</h2>
  <p>Public modules use a <span class="ic">&lt;namespace&gt;/&lt;name&gt;/&lt;provider&gt;</span> convention — for example <span class="ic">terraform-aws-modules/vpc/aws</span>. Read their READMEs; the wrapper does a lot for you.</p>
  <div class="callout callout-tip">
    <strong>Choose your boundaries</strong>
    <p>Start with the seams you already feel (repeated 200-line files). Force-modularizing a 20-line config adds indirection, not value.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03900000-0000-4000-8000-000000000420',
  '03900000-0000-4000-8000-000000000320',
  1,
  'Module Structure & Versioning',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Module Structure & Versioning</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Module Structure &amp; Versioning</h1>
  <p>Well-built modules look like small libraries: obvious files, a narrow contract, and disciplined versioning.</p>
  <h2>Canonical file layout</h2>
  <pre class="code-block">modules/web/
  main.tf      # resources — what the module creates
  variables.tf # inputs — what callers must provide
  outputs.tf   # results — what callers get back
  README.md    # usage, defaults, examples, semantics
  versions.tf  # required_providers + terraform version</pre>
  <div class="callout callout-info">
    <strong>Optional by convention</strong>
    <p>Terraform only requires any file with <span class="ic">.tf</span> to exist; the split above is a widely-followed style that keeps reviews fast.</p>
  </div>
  <h2>Designing the contract</h2>
  <p>Give every variable a <span class="ic">type</span>, a <span class="ic">description</span>, and — where safe — a sensible <span class="ic">default</span>:</p>
  <pre class="code-block">variable "availability_zones" {
  description = "AZs to spread subnets across"
  type        = set(string)
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}</pre>
  <p>Keep outputs few and meaningful — callers treat them as an API:</p>
  <pre class="code-block">output "security_group_id" {
  value = aws_security_group.web.id
}

output "instance_ids" {
  value = aws_instance.pool[*].id
}</pre>
  <h2>Versioning modules</h2>
  <p>Registry modules are versioned by tag; git-sourced modules can be pinned by ref or tag:</p>
  <pre class="code-block">module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.17.0"
}

module "web" {
  source = "git::https://example.com/infra.git//modules/web?ref=v1.4.2"
}</pre>
  <div class="callout">
    <strong>Why pin</strong>
    <p>Without a version, <span class="ic">init</span> pulls whatever is latest and your stack can change under you. Pinning makes upgrades deliberate, reviewable changes.</p>
  </div>
  <h2>Locking dependencies</h2>
  <p>After installs, commit <span class="ic">.terraform.lock.hcl</span> so provider and module checksums are fixed for everyone.</p>
  <div class="callout callout-tip">
    <strong>Write the README first</strong>
    <p>A module you can document is a module you understand. Include a minimal <span class="ic">examples/</span> directory so new callers copy a working start.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03900000-0000-4000-8000-000000000422',
  '03900000-0000-4000-8000-000000000322',
  1,
  'Workspaces & Environments',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Workspaces & Environments</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Workspaces &amp; Environments</h1>
  <p>Running the same configuration for dev, staging, and production used to mean copying directories. <strong>Workspaces</strong> keep one directory while isolating each environment&rsquo;s state.</p>
  <h2>The workspace commands</h2>
  <pre class="code-block">terraform workspace new dev
terraform workspace new staging
terraform workspace list
terraform workspace select dev</pre>
  <p>Each workspace carries its own state snapshot, so <span class="ic">apply</span> in one never touches another.</p>
  <h2>Making configuration workspace-aware</h2>
  <pre class="code-block">resource "aws_instance" "web" {
  ami           = "ami-0abcdef1234567890"
  instance_type = terraform.workspace == "production" ? "t3.large" : "t3.micro"
  tags = {
    Name        = "web-${terraform.workspace}"
    Environment = terraform.workspace
  }
}</pre>
  <div class="callout callout-info">
    <strong>Interpolation keyword</strong>
    <p><span class="ic">terraform.workspace</span> is a read-only value available anywhere in HCL. It is the idiomatic switch for environment-specific behavior.</p>
  </div>
  <h2>Workspaces vs directories</h2>
  <table>
    <tr><th>Aspect</th><th>Workspaces</th><th>Separate directories</th></tr>
    <tr><td>One codebase</td><td>Yes</td><td>Reused via modules</td></tr>
    <tr><td>State isolation</td><td>Per workspace</td><td>Per directory</td></tr>
    <tr><td>Best for</td><td>Same shape, different size</td><td>Meaningfully different stacks</td></tr>
  </table>
  <div class="callout">
    <strong>Practice: directories for big divergence</strong>
    <p>When environments drift in structure — different VPC topologies, different peering — prefer separate root configurations that compose shared modules. Workspaces assume near-identical templates.</p>
  </div>
  <h2>Backend + workspaces</h2>
  <p>With an S3 backend, key and workspace combine: <span class="ic">env:/staging</span> and <span class="ic">env:/production</span> create distinct state objects under one bucket — sharing locking without sharing truth.</p>
  <div class="callout callout-tip">
    <strong>Name things</strong>
    <p>Never write business logic on the default workspace name (<span class="ic">default</span>). Create explicit workspaces so behavior never silently depends on a name nobody set.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03900000-0000-4000-8000-000000000423',
  '03900000-0000-4000-8000-000000000323',
  1,
  'Dynamic Blocks & HCL Functions',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dynamic Blocks & HCL Functions</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Dynamic Blocks &amp; HCL Functions</h1>
  <p>Some resources accept <em>nested blocks</em> that need to appear a variable number of times — think ingress rules. <strong>Dynamic blocks</strong> emit them from a collection.</p>
  <h2>An example: security-group rules</h2>
  <pre class="code-block">variable "web_ports" {
  type    = set(number)
  default = [80, 443]
}

resource "aws_security_group" "web" {
  name = "web-sg"

  dynamic "ingress" {
    for_each = var.web_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}</pre>
  <p>Each iteration builds one <span class="ic">ingress</span> block; <span class="ic">ingress.value</span> gives the current element.</p>
  <h2>When to reach for it</h2>
  <ul>
    <li>The provider nests blocks, but your values come from a list or map.</li>
    <li>You need zero-or-more blocks (an empty set emits nothing).</li>
    <li><span class="ic">count</span> / <span class="ic">for_each</span> already cover the resource level above it.</li>
  </ul>
  <div class="callout">
    <strong>Prefer static blocks when you can</strong>
    <p>Dynamic blocks are harder to read and review. If the shape is truly fixed, write the block literally — clarity beats cleverness.</p>
  </div>
  <h2>Functions that multiply power</h2>
  <table>
    <tr><th>Function</th><th>Typical use</th></tr>
    <tr><td>merge(map...)</td><td>Combine tag maps instead of repeating them</td></tr>
    <tr><td>flatten(list)</td><td>Collapse nested lists before feeding for_each</td></tr>
    <tr><td>can(expr)</td><td>Check whether an expression would error</td></tr>
    <tr><td>try(primary, fallback)</td><td>Graceful fallback for optional attributes</td></tr>
    <tr><td>coalesce(a, b)</td><td>Pick the first non-empty value</td></tr>
  </table>
  <h2>Putting it together</h2>
  <pre class="code-block">locals {
  all_tags = merge(var.required_tags, { CostCenter = var.cost_center })
}

resource "aws_instance" "web" {
  instance_type = coalesce(var.instance_type, "t3.micro")
  tags          = local.all_tags
}</pre>
  <div class="callout callout-tip">
    <strong>Keep applied functions cheap</strong>
    <p>Functions run at plan time, not every second in production. Abusing them for runtime behavior is a smell — they shape the config, not the traffic.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03900000-0000-4000-8000-000000000425',
  '03900000-0000-4000-8000-000000000325',
  1,
  'Best Practices & Code Quality',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Best Practices & Code Quality</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Best Practices &amp; Code Quality</h1>
  <p>Infrastructure code deserves the same review culture as application code. These habits keep a Terraform repo boring, readable, and safe to change.</p>
  <h2>Format and lint</h2>
  <pre class="code-block">terraform fmt -recursive   # canonical HCL formatting
tflint                      # catches unused declarations, bad versions, provider errors</pre>
  <p>Run both in CI. Formatting disputes disappear; the linter catches what a fresh pair of eyes might miss.</p>
  <h2>Small, reviewable changes</h2>
  <p>A plan of +300 resources is a plan nobody reviews. Prefer changes that touch one concern — a single module, a single environment — so the diff stays honest.</p>
  <h2>Structure that communicates</h2>
  <pre class="code-block">infra/
  environments/
    dev/         # thin root: variables, outputs, backend
      main.tf
      backend.tf
  modules/
    vpc/
    web/
    database/</pre>
  <div class="callout callout-info">
    <strong>Environments are thin</strong>
    <p>Root configurations should mostly wire variables into modules. Logic lives in modules; each environment only supplies its differences.</p>
  </div>
  <h2>Tests and plans everywhere</h2>
  <ul>
    <li><strong>terratest</strong> — integration tests that apply, assert, and clean up real resources.</li>
    <li><strong>Plan reviews</strong> — every merge runs <span class="ic">terraform plan</span> and stores the output next to the PR.</li>
    <li><strong>Destroy on merge</strong> to a cancel branch for fire-drill.</li>
  </ul>
  <h2>Guardrails</h2>
  <p>Policies catch drift before it lands:</p>
  <pre class="code-block"># Sentinel / OPA-style policy idea
# e.g. "instances may not be public" or "regions must be allow-listed"</pre>
  <div class="callout callout-tip">
    <strong>Treat output as documentation</strong>
    <p>A well-named resource (<span class="ic">aws_instance.web</span>), honest descriptions, and <span class="ic">fmt</span>-clean code let the next engineer understand intent at a glance.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03900000-0000-4000-8000-000000000426',
  '03900000-0000-4000-8000-000000000326',
  1,
  'Secrets, Security & Remote Operation',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Secrets, Security & Remote Operation</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Secrets, Security &amp; Remote Operation</h1>
  <p>Terraform touches credentials from many angles; a professional setup treats each one deliberately.</p>
  <h2>The threat model</h2>
  <ul>
    <li><strong>State</strong> — holds every attribute, including secrets (DB passwords appear in resource attributes).</li>
    <li><strong>tfvars</strong> — plaintext values that find their way into git.</li>
    <li><strong>Plan/apply output</strong> — secrets can show up in diffs unless marked sensitive.</li>
    <li><strong>Compute</strong> — secrets copied into the OS or the image are exposed at runtime.</li>
  </ul>
  <h2>Storing secrets outside HCL</h2>
  <pre class="code-block"># 1. Reference an external store via data source
data "aws_secretsmanager_secret_version" "db" {
  secret_id = "proj/db/main"
}

resource "aws_db_instance" "main" {
  password = jsondecode(data.aws_secretsmanager_secret_version.db.secret_string).password
}</pre>
  <pre class="code-block"># 2. Or read an env var into a variable at plan time
variable "db_password" {
  type      = string
  sensitive = true
}
# TF_VAR_db_password=... terraform apply</pre>
  <div class="callout">
    <strong>Choose one pattern, stick to it</strong>
    <p>A secrets manager makes rotation and audit possible. Environment variables are fine for bootstrapping. Never put the literal in a <span class="ic">.tf</span> file that reaches git.</p>
  </div>
  <h2>The secret lifecycle</h2>
  <table>
    <tr><th>Stage</th><th>Practice</th></tr>
    <tr><td>Creation</td><td>Let Secrets Manager generate; reference, don&rsquo;t inline</td></tr>
    <tr><td>Storage</td><td>Encrypted in state + at rest in the manager</td></tr>
    <tr><td>Use</td><td>Inject at provision time; never bake into an AMI</td></tr>
    <tr><td>Rotate</td><td>Trigger rotation; rerun apply if references must refresh</td></tr>
    <tr><td>Revoke</td><td>Delete the version; blow away cached copies on instances</td></tr>
  </table>
  <h2>Remote operations</h2>
  <p>For teams, runs should happen in a controlled place — CI or a hosted workspace (Terraform Cloud) — never ad hoc on a laptop pointed at production. Centralize to get:</p>
  <ul>
    <li>audit logs of who ran what,</li>
    <li>consistent credentials,</li>
    <li>approvals before <span class="ic">apply</span>.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Least-privilege is a habit</strong>
    <p>Give the run role only what the plan needs. Errors then happen loudly and early, instead of silently widening a blast radius.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03900000-0000-4000-8000-000000000427',
  '03900000-0000-4000-8000-000000000327',
  1,
  'Capstone: Deploying a Web Server Stack',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Deploying a Web Server Stack</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Deploying a Web Server Stack</h1>
  <p>Everything converges in one project. A VPC, a web server, and a database — composed through modules and driven by variables.</p>
  <h2>Project layout</h2>
  <pre class="code-block">iac-stack/
  environments/prod/
    main.tf
    terraform.tfvars
    backend.tf
  modules/
    vpc/main.tf
    web/main.tf
    db/main.tf</pre>
  <h2>Root composition</h2>
  <pre class="code-block">module "vpc" {
  source          = "./modules/vpc"
  environment     = var.environment
  cidr_block      = var.vpc_cidr
}

module "db" {
  source      = "./modules/db"
  subnet_ids  = module.vpc.private_subnet_ids
  db_password = var.db_password   # sensitive
}

module "web" {
  source          = "./modules/web"
  vpc_id          = module.vpc.id
  subnet_ids      = module.vpc.public_subnet_ids
  instance_type   = var.web_instance_type
}</pre>
  <h2>Workflow from scratch</h2>
  <pre class="code-block">terraform init                1. download providers + modules
terraform workspace new prod  2. separate state
terraform plan                3. review the diff carefully
terraform apply               4. create the stack
terraform output web_url      5. grab the endpoint</pre>
  <div class="callout callout-info">
    <strong>Runbook before destroy</strong>
    <p>Write down how to get into the box and confirm you can wipe the database before a destructive branch. Every recovery story starts with notes you wrote while calm.</p>
  </div>
  <h2>Verifying the deploy</h2>
  <ul>
    <li><span class="ic">terraform state list</span> — every tracked resource exists.</li>
    <li>Hit the web endpoint and check the load balancer/health route.</li>
    <li>Run a second <span class="ic">plan</span> — it should report clean, no changes.</li>
    <li>Break a value, rerun <span class="ic">plan</span>, and confirm the diff is exactly one resource.</li>
  </ul>
  <h2>The takeaway</h2>
  <p>You now own the loop: <strong>write → preview → apply → verify → destroy cleanly</strong>. That loop is the whole value of infrastructure as code — repeatable, reviewable, reversible.</p>
  <div class="callout callout-tip">
    <strong>Next steps</strong>
    <p>Take the final quiz, then try real sandboxes: free tiers exist on most clouds, and your modules plus a destroy script cost nothing to practice.</p>
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
  ('03900000-0000-4000-8000-000000000501', '03900000-0000-4000-8000-000000000303',
   'Which benefit makes infrastructure-as-code the default choice for teams?',
   'Code makes infrastructure reviewable, auditable, and repeatable instead of console click-through.', 1),
  ('03900000-0000-4000-8000-000000000502', '03900000-0000-4000-8000-000000000303',
   'How does automation help when a resource is deleted unexpectedly?',
   'Automation compares configuration to reality and recreates the resource on the next plan and apply.', 2),
  ('03900000-0000-4000-8000-000000000503', '03900000-0000-4000-8000-000000000303',
   'What does Terraform fundamentally provide?',
   'It declares the desired infrastructure and converges the real cloud to match.', 3),
  ('03900000-0000-4000-8000-000000000504', '03900000-0000-4000-8000-000000000306',
   'What is the first command in the Terraform core workflow?',
   'terraform init sets up the working directory, downloads providers, and prepares the lock file.', 1),
  ('03900000-0000-4000-8000-000000000505', '03900000-0000-4000-8000-000000000306',
   'Which command previews changes before they are made?',
   'terraform plan computes the diff against state without touching real infrastructure.', 2),
  ('03900000-0000-4000-8000-000000000506', '03900000-0000-4000-8000-000000000306',
   'What does a normal apply do before it changes anything?',
   'Apply is interactive by default: it shows the plan and asks for confirmation before acting.', 3),
  ('03900000-0000-4000-8000-000000000507', '03900000-0000-4000-8000-000000000309',
   'Which block type declares an object Terraform creates and manages?',
   'resource blocks manage real infrastructure; variables and outputs only move data around.', 1),
  ('03900000-0000-4000-8000-000000000508', '03900000-0000-4000-8000-000000000309',
   'In native HCL, which character starts a comment?',
   'A hash begins a comment in native syntax, alongside //; <!-- belongs to HTML.', 2),
  ('03900000-0000-4000-8000-000000000509', '03900000-0000-4000-8000-000000000309',
   'How do you interpolate an expression inside a quoted string in HCL?',
   'String templating in HCL uses ${...} interpolation.', 3),
  ('03900000-0000-4000-8000-000000000510', '03900000-0000-4000-8000-000000000312',
   'Where does terraform init download providers from?',
   'Providers are distributed from the Terraform Registry and pinned in the lock file.', 1),
  ('03900000-0000-4000-8000-000000000511', '03900000-0000-4000-8000-000000000312',
   'When should you reach for a data source instead of a resource?',
   'Data sources read existing objects without claiming ownership of them.', 2),
  ('03900000-0000-4000-8000-000000000512', '03900000-0000-4000-8000-000000000312',
   'Why does editing an argument sometimes plan a resource replacement?',
   'Immutable attributes force a destroy and create, and the plan shows it explicitly.', 3),
  ('03900000-0000-4000-8000-000000000513', '03900000-0000-4000-8000-000000000315',
   'Which keyword makes a configuration value settable from outside the project?',
   'Input variables accept values from flags, tfvars files, and the environment.', 1),
  ('03900000-0000-4000-8000-000000000514', '03900000-0000-4000-8000-000000000315',
   'Why are locals useful inside a configuration?',
   'Locals hold computed values and remove duplication within one configuration.', 2),
  ('03900000-0000-4000-8000-000000000515', '03900000-0000-4000-8000-000000000315',
   'Which element returns values to the caller of a module?',
   'output blocks publish attributes for the root module or a parent module to consume.', 3),
  ('03900000-0000-4000-8000-000000000516', '03900000-0000-4000-8000-000000000318',
   'What is Terraform state?',
   'State maps configuration to real infrastructure so plans can diff accurately.', 1),
  ('03900000-0000-4000-8000-000000000517', '03900000-0000-4000-8000-000000000318',
   'Which setup should a team use to share state safely?',
   'Remote backends provide shared, encrypted state with locking.', 2),
  ('03900000-0000-4000-8000-000000000518', '03900000-0000-4000-8000-000000000318',
   'What does state locking protect against?',
   'The lock serializes runs so two applies cannot clobber each other.', 3),
  ('03900000-0000-4000-8000-000000000519', '03900000-0000-4000-8000-000000000321',
   'What is a Terraform module?',
   'A module is a directory of .tf files exposing variables and outputs to callers.', 1),
  ('03900000-0000-4000-8000-000000000520', '03900000-0000-4000-8000-000000000321',
   'What is the main job of a module output?',
   'Outputs form the module API, letting callers use the attributes it created.', 2),
  ('03900000-0000-4000-8000-000000000521', '03900000-0000-4000-8000-000000000321',
   'Why pin a version when calling a registry module?',
   'Version pins make upgrades deliberate; otherwise init can pull unknown changes.', 3),
  ('03900000-0000-4000-8000-000000000522', '03900000-0000-4000-8000-000000000324',
   'What do workspaces allow you to do?',
   'Each workspace keeps its own state snapshot, isolating environments like dev and prod.', 1),
  ('03900000-0000-4000-8000-000000000523', '03900000-0000-4000-8000-000000000324',
   'Which construct emits nested blocks from a collection?',
   'Dynamic blocks expand zero or more nested provider blocks from collection values.', 2),
  ('03900000-0000-4000-8000-000000000524', '03900000-0000-4000-8000-000000000324',
   'What does length() compute for a list or map?',
   'length() returns the element count of a string, list, map, or set.', 3),
  ('03900000-0000-4000-8000-000000000525', '03900000-0000-4000-8000-000000000328',
   'Which sequence is the correct Terraform core workflow?',
   'You initialize, preview the plan, then apply - in that order.', 1),
  ('03900000-0000-4000-8000-000000000526', '03900000-0000-4000-8000-000000000328',
   'Where should production database credentials live?',
   'Secrets belong in an encrypted store and are injected by reference, never committed.', 2),
  ('03900000-0000-4000-8000-000000000527', '03900000-0000-4000-8000-000000000328',
   'What makes outputs useful to a root module?',
   'Outputs publish attributes such as IPs and endpoints after apply for scripts and humans.', 3),
  ('03900000-0000-4000-8000-000000000528', '03900000-0000-4000-8000-000000000328',
   'How should automation runs handle credentials?',
   'Automation should read secrets from a managed store so nothing sensitive touches logs or git.', 4),
  ('03900000-0000-4000-8000-000000000529', '03900000-0000-4000-8000-000000000328',
   'What is the recommended module design principle?',
   'Small modules with clear contracts compose well and are easier to review and test.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): IaC benefits
  ('03900000-0000-4000-8000-000000001001', '03900000-0000-4000-8000-000000000501', 'Version-controlled, reviewable infrastructure', TRUE,  1),
  ('03900000-0000-4000-8000-000000001002', '03900000-0000-4000-8000-000000000501', 'It removes the need for cloud accounts', FALSE, 2),
  ('03900000-0000-4000-8000-000000001003', '03900000-0000-4000-8000-000000000501', 'It applies changes with no plan step', FALSE, 3),
  ('03900000-0000-4000-8000-000000001004', '03900000-0000-4000-8000-000000000501', 'It replaces cloud provider APIs entirely', FALSE, 4),
  -- Q1 (501)q2: drift recovery
  ('03900000-0000-4000-8000-000000001005', '03900000-0000-4000-8000-000000000502', 'Monitoring alerts page a human', FALSE, 1),
  ('03900000-0000-4000-8000-000000001006', '03900000-0000-4000-8000-000000000502', 'Resources are recreated from configuration', TRUE,  2),
  ('03900000-0000-4000-8000-000000001007', '03900000-0000-4000-8000-000000000502', 'The backup service restores the resource verbatim', FALSE, 3),
  ('03900000-0000-4000-8000-000000001008', '03900000-0000-4000-8000-000000000502', 'Nothing - the resource is gone forever', FALSE, 4),
  -- Q1 (501)q3: what Terraform is
  ('03900000-0000-4000-8000-000000001009', '03900000-0000-4000-8000-000000000503', 'A remote shell tool for cloud servers', FALSE, 1),
  ('03900000-0000-4000-8000-000000001010', '03900000-0000-4000-8000-000000000503', 'A usage dashboard for your accounts', FALSE, 2),
  ('03900000-0000-4000-8000-000000001011', '03900000-0000-4000-8000-000000000503', 'A declarative provisioning tool', TRUE,  3),
  ('03900000-0000-4000-8000-000000001012', '03900000-0000-4000-8000-000000000503', 'A container orchestration platform', FALSE, 4),
  -- Q2 (504): init first
  ('03900000-0000-4000-8000-000000001013', '03900000-0000-4000-8000-000000000504', 'terraform init', TRUE,  1),
  ('03900000-0000-4000-8000-000000001014', '03900000-0000-4000-8000-000000000504', 'terraform plan', FALSE, 2),
  ('03900000-0000-4000-8000-000000001015', '03900000-0000-4000-8000-000000000504', 'terraform apply', FALSE, 3),
  ('03900000-0000-4000-8000-000000001016', '03900000-0000-4000-8000-000000000504', 'terraform destroy', FALSE, 4),
  -- Q2 (504)q2: plan preview
  ('03900000-0000-4000-8000-000000001017', '03900000-0000-4000-8000-000000000505', 'terraform apply', FALSE, 1),
  ('03900000-0000-4000-8000-000000001018', '03900000-0000-4000-8000-000000000505', 'terraform plan', TRUE,  2),
  ('03900000-0000-4000-8000-000000001019', '03900000-0000-4000-8000-000000000505', 'terraform refresh', FALSE, 3),
  ('03900000-0000-4000-8000-000000001020', '03900000-0000-4000-8000-000000000505', 'terraform validate', FALSE, 4),
  -- Q2 (504)q3: apply behavior
  ('03900000-0000-4000-8000-000000001021', '03900000-0000-4000-8000-000000000506', 'It applies all changes automatically', FALSE, 1),
  ('03900000-0000-4000-8000-000000001022', '03900000-0000-4000-8000-000000000506', 'It fails with an authentication error', FALSE, 2),
  ('03900000-0000-4000-8000-000000001023', '03900000-0000-4000-8000-000000000506', 'It shows the plan and asks before changing', TRUE,  3),
  ('03900000-0000-4000-8000-000000001024', '03900000-0000-4000-8000-000000000506', 'It rewrites the backend configuration', FALSE, 4),
  -- Q3 (507): resource block
  ('03900000-0000-4000-8000-000000001025', '03900000-0000-4000-8000-000000000507', 'resource', TRUE,  1),
  ('03900000-0000-4000-8000-000000001026', '03900000-0000-4000-8000-000000000507', 'variable', FALSE, 2),
  ('03900000-0000-4000-8000-000000001027', '03900000-0000-4000-8000-000000000507', 'terraform', FALSE, 3),
  ('03900000-0000-4000-8000-000000001028', '03900000-0000-4000-8000-000000000507', 'output', FALSE, 4),
  -- Q3 (507)q2: comment char
  ('03900000-0000-4000-8000-000000001029', '03900000-0000-4000-8000-000000000508', '&lt;!--', FALSE, 1),
  ('03900000-0000-4000-8000-000000001030', '03900000-0000-4000-8000-000000000508', '#', TRUE,  2),
  ('03900000-0000-4000-8000-000000001031', '03900000-0000-4000-8000-000000000508', '"', FALSE, 3),
  ('03900000-0000-4000-8000-000000001032', '03900000-0000-4000-8000-000000000508', '%', FALSE, 4),
  -- Q3 (507)q3: interpolation
  ('03900000-0000-4000-8000-000000001033', '03900000-0000-4000-8000-000000000509', '&lt;%% expr %%&gt;', FALSE, 1),
  ('03900000-0000-4000-8000-000000001034', '03900000-0000-4000-8000-000000000509', '[expr]', FALSE, 2),
  ('03900000-0000-4000-8000-000000001035', '03900000-0000-4000-8000-000000000509', '${ expr }', TRUE,  3),
  ('03900000-0000-4000-8000-000000001036', '03900000-0000-4000-8000-000000000509', '{{ expr }}', FALSE, 4),
  -- Q4 (510): registry
  ('03900000-0000-4000-8000-000000001037', '03900000-0000-4000-8000-000000000510', 'The Terraform Registry', TRUE,  1),
  ('03900000-0000-4000-8000-000000001038', '03900000-0000-4000-8000-000000000510', 'The cloud provider API portal', FALSE, 2),
  ('03900000-0000-4000-8000-000000001039', '03900000-0000-4000-8000-000000000510', 'A local package cache', FALSE, 3),
  ('03900000-0000-4000-8000-000000001040', '03900000-0000-4000-8000-000000000510', 'The state file', FALSE, 4),
  -- Q4 (510)q2: data sources
  ('03900000-0000-4000-8000-000000001041', '03900000-0000-4000-8000-000000000511', 'To ignore existing infrastructure completely', FALSE, 1),
  ('03900000-0000-4000-8000-000000001042', '03900000-0000-4000-8000-000000000511', 'To read infrastructure someone else manages', TRUE,  2),
  ('03900000-0000-4000-8000-000000001043', '03900000-0000-4000-8000-000000000511', 'To speed up apply by skipping writes', FALSE, 3),
  ('03900000-0000-4000-8000-000000001044', '03900000-0000-4000-8000-000000000511', 'To store outputs across runs', FALSE, 4),
  -- Q4 (510)q3: replacement plans
  ('03900000-0000-4000-8000-000000001045', '03900000-0000-4000-8000-000000000512', 'Because the state file was deleted', FALSE, 1),
  ('03900000-0000-4000-8000-000000001046', '03900000-0000-4000-8000-000000000512', 'Because the provider runs twice', FALSE, 2),
  ('03900000-0000-4000-8000-000000001047', '03900000-0000-4000-8000-000000000512', 'Because the argument requires a new resource', TRUE,  3),
  ('03900000-0000-4000-8000-000000001048', '03900000-0000-4000-8000-000000000512', 'Because apply conflicts with the lock', FALSE, 4),
  -- Q5 (513): variables
  ('03900000-0000-4000-8000-000000001049', '03900000-0000-4000-8000-000000000513', 'variable', TRUE,  1),
  ('03900000-0000-4000-8000-000000001050', '03900000-0000-4000-8000-000000000513', 'local', FALSE, 2),
  ('03900000-0000-4000-8000-000000001051', '03900000-0000-4000-8000-000000000513', 'provider', FALSE, 3),
  ('03900000-0000-4000-8000-000000001052', '03900000-0000-4000-8000-000000000513', 'backend', FALSE, 4),
  -- Q5 (513)q2: locals
  ('03900000-0000-4000-8000-000000001053', '03900000-0000-4000-8000-000000000514', 'They run shell commands at apply', FALSE, 1),
  ('03900000-0000-4000-8000-000000001054', '03900000-0000-4000-8000-000000000514', 'They name repeated expressions', TRUE,  2),
  ('03900000-0000-4000-8000-000000001055', '03900000-0000-4000-8000-000000000514', 'They expose values to other modules', FALSE, 3),
  ('03900000-0000-4000-8000-000000001056', '03900000-0000-4000-8000-000000000514', 'They authorize cloud credentials', FALSE, 4),
  -- Q5 (513)q3: outputs
  ('03900000-0000-4000-8000-000000001057', '03900000-0000-4000-8000-000000000515', 'variable', FALSE, 1),
  ('03900000-0000-4000-8000-000000001058', '03900000-0000-4000-8000-000000000515', 'data', FALSE, 2),
  ('03900000-0000-4000-8000-000000001059', '03900000-0000-4000-8000-000000000515', 'output', TRUE,  3),
  ('03900000-0000-4000-8000-000000001060', '03900000-0000-4000-8000-000000000515', 'terraform', FALSE, 4),
  -- Q6 (516): state
  ('03900000-0000-4000-8000-000000001061', '03900000-0000-4000-8000-000000000516', 'The record of what your configuration created', TRUE,  1),
  ('03900000-0000-4000-8000-000000001062', '03900000-0000-4000-8000-000000000516', 'The source code of your modules', FALSE, 2),
  ('03900000-0000-4000-8000-000000001063', '03900000-0000-4000-8000-000000000516', 'A cache of provider binaries', FALSE, 3),
  ('03900000-0000-4000-8000-000000001064', '03900000-0000-4000-8000-000000000516', 'Your cloud credentials file', FALSE, 4),
  -- Q6 (516)q2: shared state
  ('03900000-0000-4000-8000-000000001065', '03900000-0000-4000-8000-000000000517', 'A git repo containing terraform.tfstate', FALSE, 1),
  ('03900000-0000-4000-8000-000000001066', '03900000-0000-4000-8000-000000000517', 'A remote backend with locking', TRUE,  2),
  ('03900000-0000-4000-8000-000000001067', '03900000-0000-4000-8000-000000000517', 'A local file copied to each laptop', FALSE, 3),
  ('03900000-0000-4000-8000-000000001068', '03900000-0000-4000-8000-000000000517', 'A spreadsheet of resource IDs', FALSE, 4),
  -- Q6 (516)q3: locking
  ('03900000-0000-4000-8000-000000001069', '03900000-0000-4000-8000-000000000518', 'Losing the provider plugins', FALSE, 1),
  ('03900000-0000-4000-8000-000000001070', '03900000-0000-4000-8000-000000000518', 'Accidentally deleting the config', FALSE, 2),
  ('03900000-0000-4000-8000-000000001071', '03900000-0000-4000-8000-000000000518', 'Concurrent applies overwriting each other', TRUE,  3),
  ('03900000-0000-4000-8000-000000001072', '03900000-0000-4000-8000-000000000518', 'Plan output verbosity', FALSE, 4),
  -- Q7 (519): modules
  ('03900000-0000-4000-8000-000000001073', '03900000-0000-4000-8000-000000000519', 'A reusable set of configuration files', TRUE,  1),
  ('03900000-0000-4000-8000-000000001074', '03900000-0000-4000-8000-000000000519', 'A cloud instance type', FALSE, 2),
  ('03900000-0000-4000-8000-000000001075', '03900000-0000-4000-8000-000000000519', 'A single provider plugin', FALSE, 3),
  ('03900000-0000-4000-8000-000000001076', '03900000-0000-4000-8000-000000000519', 'A workspace environment', FALSE, 4),
  -- Q7 (519)q2: module outputs
  ('03900000-0000-4000-8000-000000001077', '03900000-0000-4000-8000-000000000520', 'To log plan events', FALSE, 1),
  ('03900000-0000-4000-8000-000000001078', '03900000-0000-4000-8000-000000000520', 'To expose values to the parent configuration', TRUE,  2),
  ('03900000-0000-4000-8000-000000001079', '03900000-0000-4000-8000-000000000520', 'To set environment variables', FALSE, 3),
  ('03900000-0000-4000-8000-000000001080', '03900000-0000-4000-8000-000000000520', 'To pin provider versions', FALSE, 4),
  -- Q7 (519)q3: versioning
  ('03900000-0000-4000-8000-000000001081', '03900000-0000-4000-8000-000000000521', 'To speed up plan time', FALSE, 1),
  ('03900000-0000-4000-8000-000000001082', '03900000-0000-4000-8000-000000000521', 'To skip the lock file', FALSE, 2),
  ('03900000-0000-4000-8000-000000001083', '03900000-0000-4000-8000-000000000521', 'To pin module dependencies to known versions', TRUE,  3),
  ('03900000-0000-4000-8000-000000001084', '03900000-0000-4000-8000-000000000521', 'To follow any future release automatically', FALSE, 4),
  -- Q8 (522): workspaces
  ('03900000-0000-4000-8000-000000001085', '03900000-0000-4000-8000-000000000522', 'Several isolated environments from one configuration', TRUE,  1),
  ('03900000-0000-4000-8000-000000001086', '03900000-0000-4000-8000-000000000522', 'Merge two cloud accounts', FALSE, 2),
  ('03900000-0000-4000-8000-000000001087', '03900000-0000-4000-8000-000000000522', 'Version the state file over time', FALSE, 3),
  ('03900000-0000-4000-8000-000000001088', '03900000-0000-4000-8000-000000000522', 'Share one state across all environments', FALSE, 4),
  -- Q8 (522)q2: dynamic blocks
  ('03900000-0000-4000-8000-000000001089', '03900000-0000-4000-8000-000000000523', 'A conditional expression', FALSE, 1),
  ('03900000-0000-4000-8000-000000001090', '03900000-0000-4000-8000-000000000523', 'A dynamic block', TRUE,  2),
  ('03900000-0000-4000-8000-000000001091', '03900000-0000-4000-8000-000000000523', 'A data source', FALSE, 3),
  ('03900000-0000-4000-8000-000000001092', '03900000-0000-4000-8000-000000000523', 'A provider alias', FALSE, 4),
  -- Q8 (522)q3: length()
  ('03900000-0000-4000-8000-000000001093', '03900000-0000-4000-8000-000000000524', 'The JSON representation of the value', FALSE, 1),
  ('03900000-0000-4000-8000-000000001094', '03900000-0000-4000-8000-000000000524', 'The first element of the value', FALSE, 2),
  ('03900000-0000-4000-8000-000000001095', '03900000-0000-4000-8000-000000000524', 'The number of elements in a collection', TRUE,  3),
  ('03900000-0000-4000-8000-000000001096', '03900000-0000-4000-8000-000000000524', 'The type name of the value', FALSE, 4),
  -- Q9 (525): core workflow
  ('03900000-0000-4000-8000-000000001097', '03900000-0000-4000-8000-000000000525', 'init, plan, apply', TRUE,  1),
  ('03900000-0000-4000-8000-000000001098', '03900000-0000-4000-8000-000000000525', 'apply, plan, init', FALSE, 2),
  ('03900000-0000-4000-8000-000000001099', '03900000-0000-4000-8000-000000000525', 'plan, init, apply', FALSE, 3),
  ('03900000-0000-4000-8000-000000001100', '03900000-0000-4000-8000-000000000525', 'validate, destroy, apply', FALSE, 4),
  -- Q9 (525)q2: secrets
  ('03900000-0000-4000-8000-000000001101', '03900000-0000-4000-8000-000000000526', 'Directly inside main.tf for readability', FALSE, 1),
  ('03900000-0000-4000-8000-000000001102', '03900000-0000-4000-8000-000000000526', 'In a managed secrets store, referenced by variables', TRUE,  2),
  ('03900000-0000-4000-8000-000000001103', '03900000-0000-4000-8000-000000000526', 'In terraform.tfvars committed to the repo', FALSE, 3),
  ('03900000-0000-4000-8000-000000001104', '03900000-0000-4000-8000-000000000526', 'In the README for the operations team', FALSE, 4),
  -- Q9 (525)q3: outputs purpose
  ('03900000-0000-4000-8000-000000001105', '03900000-0000-4000-8000-000000000527', 'They hide errors from apply', FALSE, 1),
  ('03900000-0000-4000-8000-000000001106', '03900000-0000-4000-8000-000000000527', 'They speed up the provider download', FALSE, 2),
  ('03900000-0000-4000-8000-000000001107', '03900000-0000-4000-8000-000000000527', 'They expose resource attributes for reuse', TRUE,  3),
  ('03900000-0000-4000-8000-000000001108', '03900000-0000-4000-8000-000000000527', 'They disable the state lock', FALSE, 4),
  -- Q9 (525)q4: automation creds
  ('03900000-0000-4000-8000-000000001109', '03900000-0000-4000-8000-000000000528', 'Hard-code them in the module defaults', FALSE, 1),
  ('03900000-0000-4000-8000-000000001110', '03900000-0000-4000-8000-000000000528', 'Print them to the plan output for audit', FALSE, 2),
  ('03900000-0000-4000-8000-000000001111', '03900000-0000-4000-8000-000000000528', 'Commit an .env file alongside the sources', FALSE, 3),
  ('03900000-0000-4000-8000-000000001112', '03900000-0000-4000-8000-000000000528', 'Reference them from a secrets manager at runtime', TRUE,  4),
  -- Q9 (525)q5: module design
  ('03900000-0000-4000-8000-000000001113', '03900000-0000-4000-8000-000000000529', 'One giant module that does everything', FALSE, 1),
  ('03900000-0000-4000-8000-000000001114', '03900000-0000-4000-8000-000000000529', 'Compose small, focused modules', TRUE,  2),
  ('03900000-0000-4000-8000-000000001115', '03900000-0000-4000-8000-000000000529', 'Copy resource blocks into every root config', FALSE, 3),
  ('03900000-0000-4000-8000-000000001116', '03900000-0000-4000-8000-000000000529', 'Avoid fetching modules from the registry', FALSE, 4)
ON CONFLICT (id) DO NOTHING;

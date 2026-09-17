-- ============================================================================
-- SEED 052: Complete course — "Ansible & Configuration Management"
-- ----------------------------------------------------------------------------
-- Instructor : David Kim          (10000000-0000-4000-8000-000000000004)
-- Category   : DevOps & CI/CD     (20000000-0000-4000-8000-000000000009)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Configuration Management Foundations → C1 What is Configuration Management · C2 Idempotency & Managed Nodes
--   M2 Inventory & the Ansible CLI           → C3 Inventory · C4 Ad-Hoc Commands & Configuration
--   M3 Playbook Essentials                   → C5 Playbooks & Modules · C6 Variables & Facts
--   M4 Language & Structure                  → C7 Conditionals & Loops · C8 Roles, Templates & Handlers
--   M5 Security & Capstone                   → C9 Vault & Execution Order · C10 Capstone Playbook
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
  '03400000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000004',
  '20000000-0000-4000-8000-000000000009',
  'Ansible & Configuration Management',
  'ansible-and-configuration-management',
  'Automate server configuration with Ansible. Master configuration management, idempotency, inventories, ad-hoc commands, playbooks, modules, variables, facts, conditionals, loops, roles, templates, handlers, and Vault — then build a complete role-based webserver playbook that converges on every run.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  50
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('03400000-0000-4000-8000-000000000011', '03400000-0000-4000-8000-000000000001', 'Explain configuration management, drift, and the declarative idempotent model at its core.', 1),
  ('03400000-0000-4000-8000-000000000012', '03400000-0000-4000-8000-000000000001', 'Manage inventories and run ad-hoc commands with safe authentication and privilege escalation.',  2),
  ('03400000-0000-4000-8000-000000000013', '03400000-0000-4000-8000-000000000001', 'Author playbooks with modules, variables, facts, conditionals, and loops.',                      3),
  ('03400000-0000-4000-8000-000000000014', '03400000-0000-4000-8000-000000000001', 'Organize automation with roles, Jinja2 templates, and change-triggered handlers.',               4),
  ('03400000-0000-4000-8000-000000000015', '03400000-0000-4000-8000-000000000001', 'Protect secrets with Ansible Vault and control execution order for a reliable capstone playbook.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('03400000-0000-4000-8000-000000000101', '03400000-0000-4000-8000-000000000001', 1, 'Configuration Management Foundations', 'Why automation exists and the declarative idempotent model at the core of it.',   'PUBLISHED'),
  ('03400000-0000-4000-8000-000000000102', '03400000-0000-4000-8000-000000000001', 2, 'Inventory & the Ansible CLI',         'List, select, and drive your managed hosts from the command line.',              'PUBLISHED'),
  ('03400000-0000-4000-8000-000000000103', '03400000-0000-4000-8000-000000000001', 3, 'Playbook Essentials',                'Author plays with modules, variables, and the facts Ansible learns.',            'PUBLISHED'),
  ('03400000-0000-4000-8000-000000000104', '03400000-0000-4000-8000-000000000001', 4, 'Language & Structure',               'Conditionals, loops, roles, templates, and handlers.',                           'PUBLISHED'),
  ('03400000-0000-4000-8000-000000000105', '03400000-0000-4000-8000-000000000001', 5, 'Security & Capstone',                'Protect secrets and ship a complete role-based playbook end to end.',            'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('03400000-0000-4000-8000-000000000201', '03400000-0000-4000-8000-000000000101', 1, 'What is Configuration Management', 'The snowflake problem and what configuration management promises.',        'PUBLISHED'),
  ('03400000-0000-4000-8000-000000000202', '03400000-0000-4000-8000-000000000101', 2, 'Idempotency & Managed Nodes',      'Desired state, re-runnable tasks, and the push model.',                    'PUBLISHED'),
  ('03400000-0000-4000-8000-000000000203', '03400000-0000-4000-8000-000000000102', 1, 'Inventory',                         'Static and dynamic listings of managed hosts, groups, and patterns.',     'PUBLISHED'),
  ('03400000-0000-4000-8000-000000000204', '03400000-0000-4000-8000-000000000102', 2, 'Ad-Hoc Commands & Configuration',   'One-off module runs and the Ansible control-plane settings.',              'PUBLISHED'),
  ('03400000-0000-4000-8000-000000000205', '03400000-0000-4000-8000-000000000103', 1, 'Playbooks & Modules',               'The structure of a playbook and the modules that do the work.',            'PUBLISHED'),
  ('03400000-0000-4000-8000-000000000206', '03400000-0000-4000-8000-000000000103', 2, 'Variables & Facts',                 'Data that flows into tasks and facts learned straight from nodes.',         'PUBLISHED'),
  ('03400000-0000-4000-8000-000000000207', '03400000-0000-4000-8000-000000000104', 1, 'Conditionals & Loops',              'Decision-making and repetition inside plays.',                             'PUBLISHED'),
  ('03400000-0000-4000-8000-000000000208', '03400000-0000-4000-8000-000000000104', 2, 'Roles, Templates & Handlers',       'Organize projects, render config files, and react to change.',            'PUBLISHED'),
  ('03400000-0000-4000-8000-000000000209', '03400000-0000-4000-8000-000000000105', 1, 'Vault & Execution Order',           'Encrypted secrets and how Ansible sequences work across a fleet.',          'PUBLISHED'),
  ('03400000-0000-4000-8000-000000000210', '03400000-0000-4000-8000-000000000105', 2, 'Capstone Playbook',                 'Assemble every skill into one production webserver playbook.',             'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 03400000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('03400000-0000-4000-8000-000000000301', '03400000-0000-4000-8000-000000000201', 1, 'The Configuration Management Problem',     'Why hand-managed servers drift and what automation changes.',                'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('03400000-0000-4000-8000-000000000302', '03400000-0000-4000-8000-000000000201', 2, 'Config Management Tools & Ansible',        'Where Ansible sits in the tool landscape and how it talks to machines.',     'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('03400000-0000-4000-8000-000000000303', '03400000-0000-4000-8000-000000000201', 3, 'CM Foundations Quiz',                      'Check your configuration management fundamentals.',                          'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('03400000-0000-4000-8000-000000000304', '03400000-0000-4000-8000-000000000202', 1, 'Idempotency & Declarative State',          'Tasks that converge to the same result every single run.',                   'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('03400000-0000-4000-8000-000000000305', '03400000-0000-4000-8000-000000000202', 2, 'Push vs Pull & Node Management',           'How Ansible pushes change and how nodes stay managed.',                      'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  9),
  ('03400000-0000-4000-8000-000000000306', '03400000-0000-4000-8000-000000000202', 3, 'Idempotency Quiz',                         'Verify your idempotent, declarative automation knowledge.',                  'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('03400000-0000-4000-8000-000000000307', '03400000-0000-4000-8000-000000000203', 1, 'Inventory Files & Groups',                 'List managed hosts, group them, and attach variables.',                      'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('03400000-0000-4000-8000-000000000308', '03400000-0000-4000-8000-000000000203', 2, 'Dynamic Inventory & Patterns',             'Inventories that change with the cloud and host-pattern selection.',         'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  9),
  ('03400000-0000-4000-8000-000000000309', '03400000-0000-4000-8000-000000000203', 3, 'Inventory Quiz',                           'Test your inventory and host-pattern skills.',                               'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('03400000-0000-4000-8000-000000000310', '03400000-0000-4000-8000-000000000204', 1, 'Ad-Hoc Commands',                          'Run modules against a group without writing a playbook.',                    'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('03400000-0000-4000-8000-000000000311', '03400000-0000-4000-8000-000000000204', 2, 'ansible.cfg & Privilege Escalation',      'Control-plane settings, connection defaults, and become.',                   'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('03400000-0000-4000-8000-000000000312', '03400000-0000-4000-8000-000000000204', 3, 'Ad-Hoc & Configuration Quiz',              'Check your ad-hoc command and configuration knowledge.',                      'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('03400000-0000-4000-8000-000000000313', '03400000-0000-4000-8000-000000000205', 1, 'Playbook Fundamentals',                    'The structure of a playbook and how to run it.',                              'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 11),
  ('03400000-0000-4000-8000-000000000314', '03400000-0000-4000-8000-000000000205', 2, 'Essential Modules Deep Dive',              'Package, service, file, user, and other building blocks.',                   'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 11),
  ('03400000-0000-4000-8000-000000000315', '03400000-0000-4000-8000-000000000205', 3, 'Playbooks & Modules Quiz',                 'Verify your play-writing and module-selection skills.',                       'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('03400000-0000-4000-8000-000000000316', '03400000-0000-4000-8000-000000000206', 1, 'Variables & Precedence',                   'Define variables at the right scope and win the precedence game.',            'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('03400000-0000-4000-8000-000000000317', '03400000-0000-4000-8000-000000000206', 2, 'Facts & Magic Variables',                  'Learn about your nodes automatically and put the result to work.',            'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('03400000-0000-4000-8000-000000000318', '03400000-0000-4000-8000-000000000206', 3, 'Variables & Facts Quiz',                   'Test your variables, facts, and precedence knowledge.',                       'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('03400000-0000-4000-8000-000000000319', '03400000-0000-4000-8000-000000000207', 1, 'Conditionals',                             'Gate tasks with when, changed_when, and failed_when.',                        'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('03400000-0000-4000-8000-000000000320', '03400000-0000-4000-8000-000000000207', 2, 'Loops',                                    'Repeat tasks over lists and dictionaries with loop.',                         'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('03400000-0000-4000-8000-000000000321', '03400000-0000-4000-8000-000000000207', 3, 'Conditionals & Loops Quiz',                'Check your conditionals and loops skills.',                                   'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('03400000-0000-4000-8000-000000000322', '03400000-0000-4000-8000-000000000208', 1, 'Roles & Directory Structure',              'Package plays into reusable, shareable roles.',                               'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 11),
  ('03400000-0000-4000-8000-000000000323', '03400000-0000-4000-8000-000000000208', 2, 'Templates & Handlers',                     'Render config from Jinja2 and react to change with handlers.',                'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 11),
  ('03400000-0000-4000-8000-000000000324', '03400000-0000-4000-8000-000000000208', 3, 'Roles, Templates & Handlers Quiz',         'Verify role layout, template rendering, and handler behavior.',               'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('03400000-0000-4000-8000-000000000325', '03400000-0000-4000-8000-000000000209', 1, 'Ansible Vault & Secrets',                  'Encrypt secrets at rest and load them safely into plays.',                    'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('03400000-0000-4000-8000-000000000326', '03400000-0000-4000-8000-000000000209', 2, 'Task Execution Order & Strategies',        'How Ansible batches work and how to control it.',                             'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  9),
  ('03400000-0000-4000-8000-000000000327', '03400000-0000-4000-8000-000000000210', 1, 'Capstone: The Webserver Playbook',         'A role-based nginx playbook that ties every skill together.',                 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('03400000-0000-4000-8000-000000000328', '03400000-0000-4000-8000-000000000210', 2, 'Final Assessment',                         'Prove your Ansible and configuration management skills end to end.',          'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 03400000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '03400000-0000-4000-8000-000000000401',
  '03400000-0000-4000-8000-000000000301',
  1,
  'The Configuration Management Problem',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Configuration Management Problem</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #ef4444; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #f87171; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>The Configuration Management Problem</h1>
  <p>Every server starts life identical: a clean OS image, a fresh install. Within weeks it becomes a <strong>snowflake</strong> — a machine where the web server was patched by hand, the timeout tuned on a Tuesday, and two packages installed that nobody else knows about. <strong>Configuration management</strong> is the discipline of preventing, detecting, and repairing that drift automatically.</p>
  <h2>What configuration management does</h2>
  <p>Instead of recording your actions, it records your <em>intent</em> — the desired end state of the machine:</p>
  <ul>
    <li>Which packages must be installed, and which must be absent.</li>
    <li>Which services must run and how they are configured.</li>
    <li>Which users, files, directories, and permissions must exist.</li>
    <li>Which values, from firewalls to MOTD banners, must hold.</li>
  </ul>
  <h2>The cost of drift</h2>
  <p>A hand-maintained node works until it does not. Fat-fingered edits, half-applied runbooks, OS updates that change behavior, and "temporary" fixes all compound into infrastructure that cannot be audited, recreated, or trusted. The classic symptom: <span class="ic">it works on this server but not on the new one</span>.</p>
  <div class="callout">
    <strong>Snowflake servers</strong>
    <p>A snowflake is a node whose exact state nobody fully understands. Snowflakes freeze releases: if you cannot rebuild it, you cannot scale, recover, or audit it. Configuration management aims for a fleet that is <em>boring</em>.</p>
  </div>
  <h2>What tools promise</h2>
  <table>
    <tr><th>Promise</th><th>Meaning</th></tr>
    <tr><td>Declarative</td><td>You describe state, not steps.</td></tr>
    <tr><td>Idempotent</td><td>Re-running is safe and converges.</td></tr>
    <tr><td>Automated</td><td>Apply to hundreds of nodes, not one.</td></tr>
    <tr><td>Auditable</td><td>Change is code, reviewed and versioned.</td></tr>
    <tr><td>Self-healing</td><td>Drift is corrected, not just reported.</td></tr>
  </table>
  <h2>Configuration management vs orchestration</h2>
  <p>Configuration management keeps nodes in a known state. <strong>Orchestration</strong> coordinates an ordered workflow across systems — deploy the new version, then migrate the database, then cut traffic. Ansible does both, but this course focuses on the state half.</p>
  <div class="callout callout-tip">
    <strong>Start with state</strong>
    <p>Before orchestrating, make nodes reproducible. A fleet you can rebuild from code removes most of the risk from any later change.</p>
  </div>
  <div class="callout callout-info">
    <strong>Scope</strong>
    <p>This course uses Ansible, but the mental model — declarative, idempotent, automated — transfers to any configuration management tool you meet later.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03400000-0000-4000-8000-000000000402',
  '03400000-0000-4000-8000-000000000302',
  1,
  'Config Management Tools & Ansible',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Config Management Tools & Ansible</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #ef4444; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #f87171; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Config Management Tools &amp; Ansible</h1>
  <p>Ansible is one of several configuration management tools. Understanding the landscape explains why teams pick it and where it fits on a team.</p>
  <h2>The landscape</h2>
  <table>
    <tr><th>Tool</th><th>Model</th><th>Agent</th><th>Language</th></tr>
    <tr><td>Ansible</td><td>Push over SSH</td><td>None</td><td>YAML</td></tr>
    <tr><td>Puppet</td><td>Pull</td><td>Yes</td><td>Declarative DSL</td></tr>
    <tr><td>Chef</td><td>Pull</td><td>Yes</td><td>Ruby DSL</td></tr>
    <tr><td>Salt</td><td>Push / pull</td><td>Optional</td><td>YAML / Python</td></tr>
    <tr><td>Terraform</td><td>Provisioning</td><td>None</td><td>HCL</td></tr>
  </table>
  <h2>Why Ansible is agentless</h2>
  <p>Ansible connects to managed nodes over SSH and executes small programs called <span class="ic">modules</span>. No daemon is installed on the node, no agent port is opened, and nothing keeps running between runs. Nodes only need SSH and Python (or, for the minimalist fallback, a POSIX shell).</p>
  <ul>
    <li>Bootstrap machines fresh from imaging with zero install steps.</li>
    <li>No agent versions, certificates, or scheduled-behavior surprises to reconcile.</li>
    <li>One control node drives any fleet it can reach over SSH.</li>
  </ul>
  <h2>How it runs</h2>
  <p>A playbook (YAML) is read by the control node. For each host Ansible opens an SSH connection, copies the module with its arguments, executes it on the node, and collects a structured JSON result:</p>
  <pre class="code-block">$ ansible all -m ping

web-01 | SUCCESS =&gt; {
    "changed": false,
    "ping": "pong"
}</pre>
  <h2>Control node vs managed nodes</h2>
  <div class="callout callout-info">
    <strong>Two roles</strong>
    <p>The control node runs Ansible — usually your laptop or a CI runner. Managed nodes are everything Ansible drives. Ansible needs Python 3; managed nodes need Python or just a POSIX shell.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Learn YAML</strong>
    <p>Playbooks are YAML. Indentation is structure — two spaces per level, never tabs. If a playbook errors near the top of a file, it is almost always an indentation slip.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03400000-0000-4000-8000-000000000403',
  '03400000-0000-4000-8000-000000000304',
  1,
  'Idempotency & Declarative State',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Idempotency & Declarative State</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #ef4444; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #f87171; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Idempotency &amp; Declarative State</h1>
  <p>The two ideas that make configuration management safe are <strong>declarative state</strong> and <strong>idempotency</strong>.</p>
  <h2>Idempotency</h2>
  <p>An operation is idempotent when running it any number of times leaves the system in the same end state. A task that checks "is nginx installed?" and installs it only when missing is idempotent; a task that blindly runs <span class="ic">apt install nginx</span> every time is not.</p>
  <h2>Desired state vs current state</h2>
  <p>Every Ansible task holds a goal (the <em>desired</em> state) and reads the node to learn the <em>current</em> state. It changes the node only when the two differ:</p>
  <pre class="code-block">- name: Ensure nginx is present
  ansible.builtin.package:
    name: nginx
    state: present</pre>
  <h2>Reading task results</h2>
  <p>First run installs the package (<span class="ic">changed</span>); second run finds it present and does nothing (<span class="ic">ok</span>):</p>
  <table>
    <tr><th>Result</th><th>Meaning</th></tr>
    <tr><td>ok</td><td>The node already matched; nothing to do.</td></tr>
    <tr><td>changed</td><td>The node was modified toward the desired state.</td></tr>
    <tr><td>skipped</td><td>A condition (when) excluded it this run.</td></tr>
    <tr><td>failed</td><td>A task could not reach the desired state.</td></tr>
  </table>
  <h2>Declarative beats imperative</h2>
  <p>Imperative code says <em>how</em>; declarative code says <em>what</em>:</p>
  <pre class="code-block"># Imperative — fragile, non-idempotent
- name: Install nginx (bad)
  ansible.builtin.shell: |
    apt update
    apt install -y nginx</pre>
  <pre class="code-block"># Declarative — idempotent
- name: Ensure nginx is present
  ansible.builtin.apt:
    name: nginx
    state: present
    update_cache: true</pre>
  <div class="callout">
    <strong>Idempotency is not "nothing ever changes"</strong>
    <p>It means changes happen only when needed. If a config value differs, a well-formed playbook corrects it — exactly once per run.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Check mode</strong>
    <p><span class="ic">ansible-playbook --check</span> predicts what would change without touching nodes. Run it before every risky rollout.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03400000-0000-4000-8000-000000000404',
  '03400000-0000-4000-8000-000000000305',
  1,
  'Push vs Pull & Node Management',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Push vs Pull & Node Management</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #ef4444; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #f87171; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Push vs Pull &amp; Node Management</h1>
  <p>Configuration management tools get state onto a machine with one of two philosophies: <strong>push</strong> or <strong>pull</strong>.</p>
  <h2>Push model</h2>
  <p>The control node initiates every run, reaching over SSH to apply state right now. Ansible is a push tool: whoever runs <span class="ic">ansible-playbook</span> decides when change happens.</p>
  <h2>Pull model</h2>
  <p>Each node runs a small agent on a schedule, asking a central server "what am I supposed to look like?" Puppet and Chef work this way. Agents keep enforcing even when nobody watches, but they need installs, keys, and ongoing care.</p>
  <table>
    <tr><th>Aspect</th><th>Push (Ansible)</th><th>Pull (Agent)</th></tr>
    <tr><td>Initiation</td><td>Control node</td><td>Node on a timer</td></tr>
    <tr><td>Agent required</td><td>None</td><td>Yes</td></tr>
    <tr><td>Change timing</td><td>Immediate, on demand</td><td>Next scheduled check</td></tr>
    <tr><td>Bootstrap</td><td>SSH access only</td><td>Agent install plus trust</td></tr>
    <tr><td>Offline nodes</td><td>The run simply fails</td><td>Waits and retries later</td></tr>
  </table>
  <h2>Managing your nodes</h2>
  <p>Push still needs to know three things about every node: its address (the <strong>inventory</strong>), the SSH user, and how to escalate privileges. In Ansible, that bookkeeping — <em>not</em> agents — is what node management means.</p>
  <div class="callout callout-info">
    <strong>Who pushes</strong>
    <p>The control node can be a laptop for labs or a CI runner for production. Operate it through guardrails: version-control the playbooks, use a dedicated deploy user, and gate deploys with code review.</p>
  </div>
  <h2>Mixing models when needed</h2>
  <p>Teams that want hands-off drift correction pair Ansible with a scheduler — cron or an alert that triggers a playbook. The push stays; the schedule just fires it.</p>
  <div class="callout callout-tip">
    <strong>SSH comfort</strong>
    <p>Ansible reuses SSH sessions. Configure connection keepalive and use key-based auth (no passwords) so a twenty-node run finishes quickly without prompts.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03400000-0000-4000-8000-000000000405',
  '03400000-0000-4000-8000-000000000307',
  1,
  'Inventory Files & Groups',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Inventory Files & Groups</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #ef4444; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #f87171; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Inventory Files &amp; Groups</h1>
  <p>The <strong>inventory</strong> is Ansible's list of managed nodes. Everything you target with patterns, ad-hoc commands, or playbooks comes from here.</p>
  <h2>INI-style inventory</h2>
  <pre class="code-block"># inventory/hosts
[webservers]
web-01.example.com
web-02.example.com

[dbservers]
db-01.example.com

[all:vars]
ansible_user=deploy</pre>
  <h2>Groups, children, and variables</h2>
  <p>Groups nest with <span class="ic">children</span>, and a group can carry variables that apply to every host inside it:</p>
  <pre class="code-block">[loadbalancers]
lb-01.example.com

[production:children]
webservers
dbservers
loadbalancers

[webservers:vars]
http_port=8080</pre>
  <h2>Host-level variables</h2>
  <pre class="code-block">[webservers]
web-01.example.com ansible_host=10.0.0.11 http_port=8080
web-02.example.com ansible_host=10.0.0.12</pre>
  <p><span class="ic">ansible_host</span> overrides the connection address; <span class="ic">http_port</span> is a plain variable any play can read.</p>
  <h2>YAML inventory</h2>
  <pre class="code-block">all:
  children:
    webservers:
      hosts:
        web-01:
          ansible_host: 10.0.0.11
    dbservers:
      hosts:
        db-01: {}</pre>
  <h2>Selecting hosts with patterns</h2>
  <pre class="code-block">$ ansible webservers -m ping
$ ansible all -m ping
$ ansible 'webservers:!dbservers' -m ping
$ ansible 'webservers:&amp;production' -m ping</pre>
  <ul>
    <li><span class="ic">:</span> union of groups</li>
    <li><span class="ic">!</span> exclude a group</li>
    <li><span class="ic">&amp;</span> intersection of groups</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Validate inventories</strong>
    <p><span class="ic">ansible-inventory --list</span> prints the resolved inventory — groups, children, and variables — so you can verify intent before running anything.</p>
  </div>
  <div class="callout">
    <strong>Implicit localhost</strong>
    <p>Every inventory includes an implicit <span class="ic">localhost</span>. Use it for control-node chores such as provisioning the fleet, not for server configuration.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03400000-0000-4000-8000-000000000406',
  '03400000-0000-4000-8000-000000000308',
  1,
  'Dynamic Inventory & Patterns',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dynamic Inventory & Patterns</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #ef4444; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #f87171; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Dynamic Inventory &amp; Patterns</h1>
  <p>Static files are perfect for fixed lab machines. Real clouds breathe: instances appear, disappear, and change addresses. <strong>Dynamic inventory</strong> queries the provider on demand.</p>
  <h2>Inventory plugins</h2>
  <p>Plugins replace the static file with a data source. The modern way is a YAML plugin configuration naming the backend:</p>
  <pre class="code-block"># inventory/aws_ec2.yml
plugin: amazon.aws.aws_ec2
regions:
  - us-east-1
filters:
  tag:Environment: production
keyed_groups:
  - key: tags.Name
    prefix: tag
    separator: ''</pre>
  <p>The same file is used like any other inventory: <span class="ic">ansible -i inventory/aws_ec2.yml all -m ping</span>. Plugins exist for GCP, Azure, VMware, and Kubernetes; a plain <span class="ic">script</span> inventory covers the long tail.</p>
  <h2>Combining static and dynamic</h2>
  <pre class="code-block">all:
  children:
    evaluation:
      hosts:
        lab-01.example.com
    webservers:
      hosts: {}</pre>
  <p><span class="ic">webservers</span> stays empty until a plugin fills it from the cloud; <span class="ic">evaluation</span> keeps its always-on lab box.</p>
  <h2>Patterns at scale</h2>
  <pre class="code-block">$ ansible 'web*' -m ping
$ ansible '*.compute.amazonaws.com' -a 'uptime'
$ ansible all --limit web-01 -m ping</pre>
  <p>Globs match hostnames; <span class="ic">--limit</span> shaves a run down to one host for a focused check.</p>
  <h2>Caching dynamic data</h2>
  <p>Every run can hit the cloud API. Plugins support caching (for example with the <span class="ic">ansible.builtin.jsonfile</span> cache plugin) so a long play does not re-query mid-run.</p>
  <div class="callout callout-tip">
    <strong>Keys, not IPs</strong>
    <p>Group by tags or lifecycle (such as <span class="ic">tag_environment_production</span>) rather than hostname lists. Patterns then become semantic: "patch the production fleet" is one command.</p>
  </div>
  <div class="callout callout-info">
    <strong>Try it empty</strong>
    <p>Before pointing a playbook at a dynamic source, run <span class="ic">ansible-inventory --graph</span> to confirm the plugin resolves hosts the way you expect.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03400000-0000-4000-8000-000000000407',
  '03400000-0000-4000-8000-000000000310',
  1,
  'Ad-Hoc Commands',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Ad-Hoc Commands</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #ef4444; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #f87171; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Ad-Hoc Commands</h1>
  <p>When you need a quick answer or a one-off action across a fleet, the <span class="ic">ansible</span> CLI runs a single module without writing a playbook.</p>
  <h2>Shape of the command</h2>
  <pre class="code-block">ansible &lt;pattern&gt; -m &lt;module&gt; -a "&lt;arguments&gt;"</pre>
  <pre class="code-block">$ ansible webservers -m ping</pre>
  <p>The output prints each host with a status (SUCCESS), a result, and whether anything changed. When no <span class="ic">-m</span> is given the default module is <span class="ic">command</span>.</p>
  <h2>Everyday examples</h2>
  <pre class="code-block">$ ansible all -m command -a "uptime"
$ ansible dbservers -m command -a "df -h /var/lib/postgresql"
$ ansible webservers -m ansible.builtin.service \
    -a "name=nginx state=restarted"
$ ansible all -m ansible.builtin.copy \
    -a "src=./motd dest=/etc/motd mode=0644"</pre>
  <h2>Gathering facts on demand</h2>
  <p><span class="ic">setup</span> dumps the automatically discovered facts for a node:</p>
  <pre class="code-block">$ ansible web-01 -m ansible.builtin.setup | head -40</pre>
  <h2>Module quick reference</h2>
  <table>
    <tr><th>Module</th><th>Typical job</th></tr>
    <tr><td>ping</td><td>Connection and privilege check</td></tr>
    <tr><td>command / shell</td><td>Run a raw command</td></tr>
    <tr><td>ansible.builtin.apt / dnf</td><td>Install or remove packages</td></tr>
    <tr><td>ansible.builtin.service</td><td>Start, stop, or restart services</td></tr>
    <tr><td>ansible.builtin.copy</td><td>Push a local file</td></tr>
    <tr><td>ansible.builtin.setup</td><td>Dump the gathered facts</td></tr>
  </table>
  <h2>Ad-hoc or playbook?</h2>
  <div class="callout callout-tip">
    <strong>Ad-hoc for exploration</strong>
    <p>Use ad-hoc while learning and investigating: check uptime, test connectivity, restart one service. The moment an action needs to be repeatable or reviewed, promote it to a playbook.</p>
  </div>
  <div class="callout">
    <strong>Reusable beats clever</strong>
    <p>Command-line one-liners do not get code review. Anything that must survive is a named task in a version-controlled playbook.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03400000-0000-4000-8000-000000000408',
  '03400000-0000-4000-8000-000000000311',
  1,
  'ansible.cfg & Privilege Escalation',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ansible.cfg & Privilege Escalation</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #ef4444; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #f87171; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>ansible.cfg &amp; Privilege Escalation</h1>
  <p>Ansible reads its settings from, in order, <span class="ic">ANSIBLE_*</span> environment variables, <span class="ic">ansible.cfg</span> in the current directory (or home), then compiled defaults. A repo-local <span class="ic">ansible.cfg</span> makes runs reproducible across the team.</p>
  <h2>A minimal ansible.cfg</h2>
  <pre class="code-block">[defaults]
inventory = inventory/hosts
remote_user = deploy
forks = 10
timeout = 30
gathering = smart
stdout_callback = yaml

[privilege_escalation]
become = True
become_method = sudo
become_user = root</pre>
  <h2>Settings that matter</h2>
  <table>
    <tr><th>Setting</th><th>Effect</th></tr>
    <tr><td>inventory</td><td>Default inventory file or directory</td></tr>
    <tr><td>remote_user</td><td>SSH login user by default</td></tr>
    <tr><td>host_key_checking</td><td>Verify host keys (leave on in production)</td></tr>
    <tr><td>forks</td><td>Parallel host batches (default 5)</td></tr>
    <tr><td>timeout</td><td>SSH connect timeout in seconds</td></tr>
    <tr><td>stdout_callback</td><td>Output format, such as yaml for readability</td></tr>
  </table>
  <h2>Privilege escalation</h2>
  <p>Most system state needs root. Ansible escalates with <span class="ic">become</span> rather than logging in as root. The same keyword exists per task, so only the tasks that need elevation use it:</p>
  <pre class="code-block">- name: Install nginx
  ansible.builtin.apt:
    name: nginx
    state: present
  become: true</pre>
  <p>Global defaults live in <span class="ic">[privilege_escalation]</span>; per-run control comes from CLI flags:</p>
  <pre class="code-block">$ ansible-playbook web.yml --become --ask-become-pass</pre>
  <div class="callout callout-tip">
    <strong>Least privilege</strong>
    <p>A dedicated deploy user with narrowly scoped sudo rules beats a fleet of shared root logins. Escalate per task, not everywhere, unless the play genuinely needs root throughout.</p>
  </div>
  <div class="callout">
    <strong>Never hard-code passwords</strong>
    <p>Keep become passwords out of files. Prompt for them, or let Ansible Vault supply them (covered later) — never hard-code them in a playbook that lands in the repo.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03400000-0000-4000-8000-000000000409',
  '03400000-0000-4000-8000-000000000313',
  1,
  'Playbook Fundamentals',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Playbook Fundamentals</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #ef4444; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #f87171; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Playbook Fundamentals</h1>
  <p>A <strong>playbook</strong> is a YAML file that declares automation: which hosts to target and which states to enforce. It is the unit you run, review, and version.</p>
  <h2>Your first playbook</h2>
  <pre class="code-block">---
- name: Configure the web tier
  hosts: webservers
  become: true
  tasks:
    - name: Ensure nginx is installed
      ansible.builtin.apt:
        name: nginx
        state: present

    - name: Ensure nginx is running
      ansible.builtin.service:
        name: nginx
        state: started
        enabled: true</pre>
  <h2>Anatomy</h2>
  <ul>
    <li><span class="ic">hosts</span> — which inventory pattern this play targets.</li>
    <li><span class="ic">become</span> — escalate privileges for the play (or per task).</li>
    <li><span class="ic">tasks</span> — a list of named states to enforce, in order.</li>
    <li><span class="ic">name</span> — every task's human-readable label shown in output.</li>
  </ul>
  <h2>One file, many plays</h2>
  <pre class="code-block">---
- name: Patch web servers
  hosts: webservers
  tasks:
    - name: Apply security updates
      ansible.builtin.apt:
        upgrade: security
        update_cache: true

- name: Check the proxy config
  hosts: loadbalancers
  tasks:
    - name: Syntax-check haproxy
      ansible.builtin.command: haproxy -c -f /etc/haproxy/haproxy.cfg
      changed_when: false</pre>
  <h2>Running a playbook</h2>
  <pre class="code-block">$ ansible-playbook -i inventory/hosts web.yml</pre>
  <p>Flags you will use constantly:</p>
  <table>
    <tr><th>Flag</th><th>Effect</th></tr>
    <tr><td>--check</td><td>Dry run; report what would change</td></tr>
    <tr><td>--diff</td><td>Show file-level diffs when changing</td></tr>
    <tr><td>--syntax-check</td><td>Validate the YAML and play structure</td></tr>
    <tr><td>--limit web-01</td><td>Restrict the target pattern</td></tr>
    <tr><td>--step</td><td>Confirm each task interactively</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Always name tasks</strong>
    <p>Output prints task names and failures reference them. Unnamed tasks make debugging a needle hunt. There is no good excuse for skipping the name.</p>
  </div>
  <div class="callout">
    <strong>YAML gotchas</strong>
    <p>Two-space indentation, one task list under <span class="ic">tasks:</span>, and the <span class="ic">---</span> document marker keep playbooks valid. When in doubt run <span class="ic">--syntax-check</span>.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03400000-0000-4000-8000-000000000410',
  '03400000-0000-4000-8000-000000000314',
  1,
  'Essential Modules Deep Dive',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Essential Modules Deep Dive</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #ef4444; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #f87171; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Essential Modules Deep Dive</h1>
  <p>Modules are Ansible's building blocks: small, purpose-built programs with defined arguments, an idempotent contract, and a structured result. Learn the core set and you can express almost any server state.</p>
  <h2>Packages — apt / dnf / package</h2>
  <pre class="code-block">- name: Ensure nginx is present
  ansible.builtin.apt:
    name: nginx
    state: present
    update_cache: true

- name: Ensure a package is absent
  ansible.builtin.apt:
    name: apache2
    state: absent</pre>
  <p><span class="ic">ansible.builtin.package</span> is distro-agnostic — one task that picks apt or dnf from the gathered facts.</p>
  <h2>Services — service / systemd</h2>
  <pre class="code-block">- name: nginx is running and enabled at boot
  ansible.builtin.service:
    name: nginx
    state: started
    enabled: true</pre>
  <h2>Files — file, copy, lineinfile</h2>
  <pre class="code-block">- name: Ensure the app directory exists
  ansible.builtin.file:
    path: /srv/app
    state: directory
    owner: www-data
    mode: '0755'

- name: Push a config file
  ansible.builtin.copy:
    src: files/nginx.conf
    dest: /etc/nginx/nginx.conf
    mode: '0644'

- name: Guarantee a setting exists
  ansible.builtin.lineinfile:
    path: /etc/nginx/nginx.conf
    regexp: '^worker_processes'
    line: 'worker_processes auto;'</pre>
  <h2>Users and groups</h2>
  <pre class="code-block">- name: Create the deploy user
  ansible.builtin.user:
    name: deploy
    groups: www-data
    shell: /usr/sbin/nologin
    create_home: false</pre>
  <h2>Choosing the right module</h2>
  <table>
    <tr><th>Job</th><th>Module</th></tr>
    <tr><td>Install or remove a package</td><td>ansible.builtin.apt, dnf, package</td></tr>
    <tr><td>Service running and enabled</td><td>ansible.builtin.service</td></tr>
    <tr><td>Directory or file attributes</td><td>ansible.builtin.file</td></tr>
    <tr><td>Copy a local file</td><td>ansible.builtin.copy</td></tr>
    <tr><td>Edit a single line in place</td><td>ansible.builtin.lineinfile</td></tr>
    <tr><td>Download a remote file</td><td>ansible.builtin.get_url</td></tr>
    <tr><td>Clone a repository</td><td>ansible.builtin.git</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Prefer purpose-built modules</strong>
    <p>Everyone reaches for <span class="ic">shell</span> first. Prefer the module that expresses the intent — <span class="ic">service</span> over a raw restart command — and reserve shell for what no module covers.</p>
  </div>
  <div class="callout callout-info">
    <strong>Check-mode aware</strong>
    <p>Well-written modules support <span class="ic">--check</span>: they report what would change without acting. Raw shell tasks cannot make that promise — another reason to avoid them.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03400000-0000-4000-8000-000000000411',
  '03400000-0000-4000-8000-000000000316',
  1,
  'Variables & Precedence',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Variables & Precedence</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #ef4444; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #f87171; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Variables &amp; Precedence</h1>
  <p>Hard-coded values make playbooks brittle. Variables let one playbook shape itself per group, host, or environment.</p>
  <h2>Defining variables in a play</h2>
  <pre class="code-block">- name: Configure web servers
  hosts: webservers
  vars:
    nginx_port: 8080
    doc_root: /srv/www/html
  tasks:
    - name: Deploy the config
      ansible.builtin.template:
        src: nginx.conf.j2
        dest: /etc/nginx/nginx.conf</pre>
  <h2>Where variables live</h2>
  <pre class="code-block">inventory/
  group_vars/
    all.yml            # every host
    webservers.yml     # every webserver
  host_vars/
    web-01.yml         # web-01 only</pre>
  <h2>group_vars and host_vars</h2>
  <pre class="code-block"># group_vars/webservers.yml — picked up automatically
nginx_port: 8080
doc_root: /srv/www/html
upstreams:
  - 10.0.1.10
  - 10.0.1.11</pre>
  <h2>Precedence, low to high</h2>
  <table>
    <tr><th>Source</th><th>Wins against</th></tr>
    <tr><td>command-line extra vars (-e)</td><td>everything</td></tr>
    <tr><td>play vars / vars_files</td><td>group_vars, host_vars</td></tr>
    <tr><td>host_vars</td><td>group_vars</td></tr>
    <tr><td>group_vars (child beats parent)</td><td>inventory</td></tr>
    <tr><td>inventory defaults</td><td>role defaults</td></tr>
  </table>
  <p>The three you will juggle daily: <span class="ic">host_vars</span> beats <span class="ic">group_vars</span>, and <span class="ic">vars:</span> inside the play beats both. Everything else is advanced territory.</p>
  <h2>Referencing variables</h2>
  <pre class="code-block">- name: Show a variable
  ansible.builtin.debug:
    msg: "doc_root is {{ doc_root }}"</pre>
  <div class="callout callout-tip">
    <strong>Debug before you trust</strong>
    <p><span class="ic">ansible -m debug -a "var=doc_root"</span> prints the value for any host or group — the fastest way to verify what a task will see.</p>
  </div>
  <div class="callout">
    <strong>Keep secrets out of plain vars</strong>
    <p>Anything in <span class="ic">group_vars</span> is plaintext in the repo. Passwords belong in an encrypted vault file, covered later in this course.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03400000-0000-4000-8000-000000000412',
  '03400000-0000-4000-8000-000000000317',
  1,
  'Facts & Magic Variables',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Facts & Magic Variables</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #ef4444; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #f87171; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Facts &amp; Magic Variables</h1>
  <p>Before the first task, Ansible can interrogate every node and store the answers as <strong>facts</strong>: operating system, CPU, memory, addresses, mounts, and more. Reference them like any other variable.</p>
  <h2>Collecting facts</h2>
  <pre class="code-block">$ ansible web-01 -m ansible.builtin.setup | head -60</pre>
  <p>Facts appear under <span class="ic">ansible_facts</span>, and Ansible lets you drop the prefix in most places.</p>
  <h2>Facts worth knowing</h2>
  <table>
    <tr><th>Fact</th><th>Value example</th></tr>
    <tr><td>ansible_facts['os_family']</td><td>Debian, RedHat, Suse</td></tr>
    <tr><td>ansible_facts['distribution']</td><td>Ubuntu, CentOS</td></tr>
    <tr><td>ansible_facts['distribution_major_version']</td><td>22, 9</td></tr>
    <tr><td>ansible_facts['architecture']</td><td>x86_64, aarch64</td></tr>
    <tr><td>ansible_facts['default_ipv4']['address']</td><td>primary IPv4</td></tr>
  </table>
  <h2>Facts in action — distro-aware tasks</h2>
  <pre class="code-block">- name: Install nginx on Debian family
  ansible.builtin.apt:
    name: nginx
    state: present
  when: ansible_facts['os_family'] == 'Debian'</pre>
  <p>The same pattern gates <span class="ic">dnf</span> for RedHat, making one playbook cover a mixed fleet safely.</p>
  <h2>Controlling fact gathering</h2>
  <pre class="code-block">- name: Speed-focused check without facts
  hosts: all
  gather_facts: false
  tasks:
    - name: Just ping
      ansible.builtin.ping:</pre>
  <p><span class="ic">gather_facts: false</span> skips setup; <span class="ic">gather_subset</span> trims what is collected. Facts can also be cached (Redis, jsonfile) so large fleets do not re-collect on every run.</p>
  <h2>Magic variables</h2>
  <p>Supplied by Ansible itself rather than the node:</p>
  <ul>
    <li><span class="ic">inventory_hostname</span> — the host as listed in inventory.</li>
    <li><span class="ic">groups</span> — a dictionary of every group to its hosts.</li>
    <li><span class="ic">hostvars</span> — facts and vars of any host, for example <span class="ic">hostvars['web-01']['ansible_facts']</span>.</li>
    <li><span class="ic">ansible_play_hosts_all</span> — every host in the current play.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Read them live</strong>
    <p><span class="ic">ansible all -m debug -a "msg={{ ansible_facts['os_family'] }}"</span> prints the value every host sees — a five-second sanity check for distro-sensitive plays.</p>
  </div>
  <div class="callout callout-info">
    <strong>Facts are truth from the node</strong>
    <p>Do not guess a team member's distribution; ask the node. Facts make conditionals honest.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03400000-0000-4000-8000-000000000413',
  '03400000-0000-4000-8000-000000000319',
  1,
  'Conditionals',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Conditionals</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #ef4444; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #f87171; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Conditionals</h1>
  <p>A task always runs — until you gate it. The <span class="ic">when</span> keyword makes a task conditional on a fact, a variable, or a prior result.</p>
  <h2>Basic when</h2>
  <pre class="code-block">- name: Apply extra tuning on production
  ansible.builtin.template:
    src: prod.conf.j2
    dest: /etc/app/prod.conf
  when: env == 'production'</pre>
  <h2>Conditions on facts</h2>
  <pre class="code-block">- name: Use dnf on RedHat systems
  ansible.builtin.dnf:
    name: git
    state: present
  when: ansible_facts['os_family'] == 'RedHat'</pre>
  <h2>React to a registered result</h2>
  <p>Capture a task's result, then let later tasks act on it:</p>
  <pre class="code-block">- name: Check current kernel
  ansible.builtin.command: uname -r
  register: kernel

- name: Flag older kernels
  ansible.builtin.debug:
    msg: "Node needs a reboot window."
  when: "'5.15' not in kernel.stdout"</pre>
  <h2>changed_when and failed_when</h2>
  <p>Raw commands do not report change truthfully — you define it:</p>
  <pre class="code-block">- name: Reload the daemon list
  ansible.builtin.shell: |
    systemctl daemon-reload
  changed_when: false

- name: Probe service health
  ansible.builtin.command: curl -sSf http://localhost:8080/health
  register: health
  failed_when:
    - health.rc != 0
    - "'maintenance' not in health.stderr"</pre>
  <h2>Combining conditions</h2>
  <pre class="code-block">when:
  - ansible_facts['os_family'] == 'Debian'
  - env == 'production'
  - not maintenance_mode</pre>
  <p>Booleans, comparisons (<span class="ic">==</span>, <span class="ic">!=</span>, <span class="ic">in</span>, <span class="ic">not in</span>), and the <span class="ic">and</span>, <span class="ic">or</span>, <span class="ic">not</span> keywords all work inside Jinja conditions.</p>
  <div class="callout callout-tip">
    <strong>Keep it readable</strong>
    <p>If a <span class="ic">when</span> grows past two clauses, move the logic to a variable. Readable conditionals are reviewable conditionals.</p>
  </div>
  <div class="callout">
    <strong>Trust the result</strong>
    <p>React to a registered result rather than assuming what "should" have happened. The result object is the truth of the run.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03400000-0000-4000-8000-000000000414',
  '03400000-0000-4000-8000-000000000320',
  1,
  'Loops',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale="1.0">
<title>Loops</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #ef4444; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #f87171; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Loops</h1>
  <p>One task, many values. The <span class="ic">loop</span> keyword runs a task once per item, and each iteration is available as <span class="ic">item</span>.</p>
  <h2>Loop over a list</h2>
  <pre class="code-block">- name: Create app users
  ansible.builtin.user:
    name: "{{ item }}"
    state: present
  loop:
    - alice
    - bob
    - carol</pre>
  <h2>Loop over a dictionary from vars</h2>
  <pre class="code-block">users:
  alice: { uid: 2001, shell: /bin/bash }
  bob:   { uid: 2002, shell: /usr/sbin/nologin }</pre>
  <pre class="code-block">- name: Create users with per-user settings
  ansible.builtin.user:
    name: "{{ item.key }}"
    uid: "{{ item.value.uid }}"
    shell: "{{ item.value.shell }}"
    state: present
  loop: "{{ users | dict2items }}"</pre>
  <h2>Loop over a registered result</h2>
  <pre class="code-block">- name: Find unit files
  ansible.builtin.command: find /etc/systemd/system
  register: found

- name: Show the candidates
  ansible.builtin.debug:
    msg: "{{ item }}"
  loop: "{{ found.stdout_lines }}"</pre>
  <h2>loop_control</h2>
  <pre class="code-block">- name: Create directories
  ansible.builtin.file:
    path: "/srv/{{ item }}"
    state: directory
  loop:
    - app
    - logs
    - backups
  loop_control:
    loop_var: dirname</pre>
  <p>Renaming the loop variable avoids clashes inside nested loops.</p>
  <h2>Old with_items vs loop</h2>
  <p><span class="ic">loop</span> is the modern keyword. <span class="ic">with_items</span> and friends still appear in older code and largely work, but new playbooks should use <span class="ic">loop</span>.</p>
  <h2>Wait-for with retries</h2>
  <pre class="code-block">- name: Wait for the app port
  ansible.builtin.wait_for:
    port: 8080
    delay: 5
    timeout: 60</pre>
  <p>Jobs that need time to become true pair this wait with <span class="ic">retries</span> and <span class="ic">until</span> rather than blind sleeps.</p>
  <div class="callout callout-tip">
    <strong>Combine loop with when</strong>
    <p>A <span class="ic">loop</span> plus a <span class="ic">when</span> on <span class="ic">item</span> lets you filter items inline — one task instead of three near-identical copies.</p>
  </div>
  <div class="callout">
    <strong>Watch restart fan-out</strong>
    <p>Looping over services that notify a shared handler is fine — handlers deduplicate. Looping over a restart inside the loop body is not. Notify, do not restart inline.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03400000-0000-4000-8000-000000000415',
  '03400000-0000-4000-8000-000000000322',
  1,
  'Roles & Directory Structure',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Roles & Directory Structure</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #ef4444; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #f87171; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Roles &amp; Directory Structure</h1>
  <p>Playbooks stay clean for a few tasks. When a play needs packages, config, templates, handlers, and metadata, the answer is a <strong>role</strong>: a reusable, standardized bundle of playbook content.</p>
  <h2>Scaffold with ansible-galaxy</h2>
  <pre class="code-block">$ ansible-galaxy init roles/nginx
roles/nginx/
  defaults/main.yml     # lowest-priority variables
  vars/main.yml         # role-internal variables
  tasks/main.yml        # the main task list
  handlers/main.yml     # handlers this role can notify
  templates/            # Jinja2 templates
  files/                # static files to copy
  meta/main.yml         # metadata and dependencies
  README.md</pre>
  <h2>Running a role from a playbook</h2>
  <pre class="code-block">---
- name: Configure the web tier
  hosts: webservers
  become: true
  roles:
    - nginx
    - node-exporter</pre>
  <p>You can also bring roles in on demand with <span class="ic">ansible.builtin.include_role</span>, which is handy when the role choice depends on facts.</p>
  <h2>Inside tasks/main.yml</h2>
  <pre class="code-block">---
- name: Install nginx
  ansible.builtin.package:
    name: nginx
    state: present

- name: Deploy each site
  ansible.builtin.template:
    src: site.conf.j2
    dest: "/etc/nginx/sites-available/{{ item }}"
  loop: "{{ nginx_sites }}"
  notify: reload nginx</pre>
  <h2>defaults vs vars</h2>
  <table>
    <tr><th>Directory</th><th>Priority</th><th>Use for</th></tr>
    <tr><td>defaults/main.yml</td><td>Lowest</td><td>Overridable defaults</td></tr>
    <tr><td>vars/main.yml</td><td>High</td><td>Role-internal constants</td></tr>
  </table>
  <p>Because play <span class="ic">vars:</span> beats role defaults, other teams can reuse your role with their own values — no fork required.</p>
  <h2>Dependencies</h2>
  <pre class="code-block"># meta/main.yml
dependencies:
  - role: common
    vars:
      packages:
        - curl
        - jq</pre>
  <div class="callout callout-tip">
    <strong>One job per role</strong>
    <p>Roles with a single responsibility — nginx, postgres, node-exporter — compose cleanly and test independently. A role that does everything is a monolith with extra steps.</p>
  </div>
  <div class="callout callout-info">
    <strong>Reuse from the community</strong>
    <p>Ansible Galaxy hosts thousands of roles. Favor maintained, install-able roles for common software, and write your own for what is unique to you.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03400000-0000-4000-8000-000000000416',
  '03400000-0000-4000-8000-000000000323',
  1,
  'Templates & Handlers',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Templates & Handlers</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #ef4444; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #f87171; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Templates &amp; Handlers</h1>
  <p>Two features turn static file management into dynamic, reactive configuration: <strong>templates</strong> render files with variables, and <strong>handlers</strong> react to change.</p>
  <h2>Templates with Jinja2</h2>
  <p>A template is a file with placeholders, rendered on the control node before upload:</p>
  <pre class="code-block"># templates/site.conf.j2
server {
  listen {{ nginx_port | default(80) }};
  server_name {{ inventory_hostname }};
  root {{ doc_root }};
  {% if enable_https %}
  listen 443 ssl;
  {% endif %}
}</pre>
  <h2>Applying a template</h2>
  <pre class="code-block">- name: Deploy the site config
  ansible.builtin.template:
    src: site.conf.j2
    dest: /etc/nginx/sites-available/default
  notify: reload nginx</pre>
  <p>The <span class="ic">template</span> module compares before and after: unchanged means <span class="ic">ok</span>, a real difference means <span class="ic">changed</span>.</p>
  <h2>Handlers: change-triggered tasks</h2>
  <pre class="code-block"># handlers/main.yml
- name: reload nginx
  ansible.builtin.service:
    name: nginx
    state: reloaded</pre>
  <p>Tasks <span class="ic">notify</span> the handler. Handlers run <em>once</em>, at the end of the play, and only if a change happened:</p>
  <ul>
    <li>Five tasks notify <span class="ic">reload nginx</span> — it runs once, not five times.</li>
    <li>No task changed — the handler never runs.</li>
  </ul>
  <h2>Controlling handler timing</h2>
  <pre class="code-block">- name: Roll out new config
  hosts: webservers
  tasks:
    - name: Deploy the config
      ansible.builtin.template:
        src: site.conf.j2
        dest: /etc/nginx/sites-available/default
      notify: reload nginx

    - name: Validate before reload
      ansible.builtin.shell: nginx -t
      changed_when: false

    - name: Force the reload now
      ansible.builtin.meta: flush_handlers</pre>
  <div class="callout callout-tip">
    <strong>Reload beats restart</strong>
    <p><span class="ic">reloaded</span> re-reads config without dropping connections; <span class="ic">restarted</span> stops and starts the service. For config changes, prefer reload.</p>
  </div>
  <div class="callout">
    <strong>Validate, then reload</strong>
    <p>Always syntax-check a generated config (nginx -t) before the reload fires. A handler that reloads a broken config is a bug with an outage attached.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03400000-0000-4000-8000-000000000417',
  '03400000-0000-4000-8000-000000000325',
  1,
  'Ansible Vault & Secrets',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Ansible Vault & Secrets</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #ef4444; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #f87171; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Ansible Vault &amp; Secrets</h1>
  <p>Playbooks live in git. Secrets do not. <strong>Ansible Vault</strong> encrypts files or individual values so passwords, tokens, and keys can live beside the code that needs them.</p>
  <h2>Core commands</h2>
  <pre class="code-block">$ ansible-vault create group_vars/all/vault.yml   # new encrypted file
$ ansible-vault edit group_vars/all/vault.yml     # edit safely
$ ansible-vault view group_vars/all/vault.yml     # read only
$ ansible-vault rekey group_vars/all/vault.yml    # change the password
$ ansible-vault encrypt_string 'p@ssword' --name db_password</pre>
  <p>Encrypted files stay valid YAML:</p>
  <pre class="code-block"># group_vars/all/vault.yml (encrypted on disk)
db_password: !vault |
  $ANSIBLE_VAULT;1.1;AES256
  a0d3e1...ffa01d
  ...</pre>
  <h2>Loading vault files</h2>
  <pre class="code-block">- name: Configure the database
  hosts: dbservers
  vars_files:
    - group_vars/all/vault.yml</pre>
  <p>Vault variables behave like any other variable — reference them exactly the same way:</p>
  <pre class="code-block">db_password: "{{ vault_db_password }}"</pre>
  <h2>Vault ids and password sources</h2>
  <pre class="code-block">$ ansible-playbook web.yml --ask-vault-pass
$ ansible-playbook web.yml --vault-password-file ~/.vault/prod-pass
$ ansible-vault encrypt_string --vault-id prod@prompt 'secret' \
    --name monitor_token</pre>
  <p>Vault IDs (labels) let one repo hold several secret sets — dev and prod — each with its own password.</p>
  <h2>Plaintext is the enemy</h2>
  <table>
    <tr><th>Avoid</th><th>Prefer</th></tr>
    <tr><td>db_password: hunter2 in vars</td><td>db_password: "{{ vault_db_password }}"</td></tr>
    <tr><td>Become password in a script</td><td>--ask-become-pass or a vault</td></tr>
    <tr><td>API token committed</td><td>ansible-vault encrypt_string</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Gate the gatekeeper</strong>
    <p>Store the vault password itself in a secret manager or a CI secret, never in the repo. Rotate passwords on a schedule — <span class="ic">rekey</span> makes it painless.</p>
  </div>
  <div class="callout">
    <strong>Vault encrypts, it does not hide</strong>
    <p>Encrypted values are unreadable without the password, but playbook structure stays plaintext. Do not put hostnames or filenames you consider secret inside the vault either.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03400000-0000-4000-8000-000000000418',
  '03400000-0000-4000-8000-000000000326',
  1,
  'Task Execution Order & Strategies',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Task Execution Order & Strategies</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #ef4444; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #f87171; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Task Execution Order &amp; Strategies</h1>
  <p>Knowing <em>how</em> Ansible sequences work prevents the classic fence-post failures: migrations before deploys, reloads before checks, and races between hosts.</p>
  <h2>The default: linear</h2>
  <p>With the <strong>linear</strong> strategy (the default), Ansible runs task 1 on every host, waits for them all, then task 2 on every host, and so on. The fleet moves in lockstep.</p>
  <pre class="code-block">- hosts: all
  tasks:
    - name: Step A (every host)
      ...
    - name: Step B (only after A finished everywhere)</pre>
  <h2>Batching: serial and forks</h2>
  <pre class="code-block">- name: Rolling deploy
  hosts: webservers
  serial: 2
  tasks:
    - name: Upgrade the app</pre>
  <p><span class="ic">forks</span> (in ansible.cfg) caps parallel connections; <span class="ic">serial</span> caps how many hosts face a risky task at once. Rolling deploys rely on <span class="ic">serial</span>.</p>
  <h2>Strategies</h2>
  <table>
    <tr><th>Strategy</th><th>Behavior</th></tr>
    <tr><td>linear (default)</td><td>Full sync, one task across all hosts</td></tr>
    <tr><td>free</td><td>Each host runs tasks as fast as it can</td></tr>
    <tr><td>debug</td><td>Pause after each task for interactive testing</td></tr>
  </table>
  <pre class="code-block">- hosts: all
  strategy: free
  tasks:
    - name: Harden the firewall</pre>
  <h2>Per-task control</h2>
  <pre class="code-block">- name: Migrate the database once
  ansible.builtin.shell: /srv/app/bin/migrate
  run_once: true
  delegate_to: db-01
  when: env == 'production'</pre>
  <p><span class="ic">run_once</span> pairs with <span class="ic">delegate_to</span> for cluster-wide steps: schema migrations, cache clears, token generation.</p>
  <h2>Play phases</h2>
  <pre class="code-block">- name: Full pipeline
  hosts: webservers
  pre_tasks:
    - name: Update the package cache

  roles:
    - nginx

  tasks:
    - name: Deploy the app

  post_tasks:
    - name: Verify with curl</pre>
  <p>Order: <span class="ic">pre_tasks</span>, roles, tasks, <span class="ic">post_tasks</span>, then handlers fire last — unless a <span class="ic">flush_handlers</span> forces them early.</p>
  <div class="callout callout-tip">
    <strong>Design for serial</strong>
    <p>If a play is safe to repeat against one host at a time, it survives a <span class="ic">serial: 1</span> full-canary rollout. Write plays assuming the fleet moves in batches.</p>
  </div>
  <div class="callout callout-info">
    <strong>free is a trade-off</strong>
    <p><span class="ic">strategy: free</span> speeds heterogeneous fleets but breaks coordination — a task might run on host 2 before host 1 finished the prerequisite. Use it only for independent per-host work.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03400000-0000-4000-8000-000000000419',
  '03400000-0000-4000-8000-000000000327',
  1,
  'Capstone: The Webserver Playbook',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: The Webserver Playbook</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #ef4444; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #f87171; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: The Webserver Playbook</h1>
  <p>Everything in this course comes together in one artifact: a role-based, idempotent, templated, vault-backed playbook that configures an nginx webserver — and survives a second run with zero changes.</p>
  <h2>Layout</h2>
  <pre class="code-block">ansible-ws/
  ansible.cfg
  inventory/
    hosts
  group_vars/
    webservers.yml
    all/
      vault.yml            # encrypted with Ansible Vault
  roles/
    nginx/
      tasks/main.yml
      handlers/main.yml
      templates/site.conf.j2
  web.yml</pre>
  <h2>The playbook</h2>
  <pre class="code-block">---
- name: Configure the web tier
  hosts: webservers
  become: true
  vars:
    nginx_port: 8080
  vars_files:
    - group_vars/all/vault.yml
  roles:
    - nginx
  post_tasks:
    - name: Confirm the site answers
      ansible.builtin.uri:
        url: "http://localhost:{{ nginx_port }}"
        status_code: 200</pre>
  <h2>Role tasks</h2>
  <pre class="code-block"># roles/nginx/tasks/main.yml
---
- name: Install nginx
  ansible.builtin.package:
    name: nginx
    state: present

- name: Deploy the site template
  ansible.builtin.template:
    src: site.conf.j2
    dest: /etc/nginx/sites-available/default
  notify: reload nginx

- name: Write the monitor token
  ansible.builtin.copy:
    content: "{{ vault_monitor_token }}"
    dest: /etc/nginx/token
    mode: '0600'</pre>
  <h2>Handler and template</h2>
  <pre class="code-block"># roles/nginx/handlers/main.yml
- name: reload nginx
  ansible.builtin.service:
    name: nginx
    state: reloaded</pre>
  <pre class="code-block"># roles/nginx/templates/site.conf.j2
server {
  listen {{ nginx_port }};
  server_name {{ inventory_hostname }};
  root {{ doc_root | default('/usr/share/nginx/html') }};
}</pre>
  <h2>Running it properly</h2>
  <pre class="code-block">$ ansible-playbook --syntax-check web.yml
$ ansible-playbook web.yml --check --diff \
    --vault-password-file ~/.vault/prod-pass
$ ansible-playbook web.yml \
    --vault-password-file ~/.vault/prod-pass</pre>
  <p>Then the proof is repetition:</p>
  <pre class="code-block">$ ansible-playbook web.yml --vault-password-file ~/.vault/prod-pass
...
ok: [web-01]    # second run changed nothing
ok: [web-02]</pre>
  <div class="callout callout-tip">
    <strong>Verify like a user</strong>
    <p>After the play, hit the site from outside the cluster and confirm status code and body. Automation that validates its own output is automation you can trust.</p>
  </div>
  <div class="callout callout-info">
    <strong>Rerun is the test</strong>
    <p>An idempotent playbook reports all <span class="ic">ok</span> on the second run. If run two still shows <span class="ic">changed</span>, something is drifting — exactly what configuration management exists to eliminate.</p>
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
  ('03400000-0000-4000-8000-000000000501', '03400000-0000-4000-8000-000000000303',
   'What does configuration management primarily prevent?',
   'Configuration management keeps nodes at a declared, reproducible state instead of allowing drift.', 1),
  ('03400000-0000-4000-8000-000000000502', '03400000-0000-4000-8000-000000000303',
   'Why is Ansible described as agentless?',
   'Ansible drives nodes over SSH with modules; no persistent agent runs on the managed node.', 2),
  ('03400000-0000-4000-8000-000000000503', '03400000-0000-4000-8000-000000000303',
   'Which best describes a snowflake server?',
   'A snowflake accumulates undocumented changes and cannot be rebuilt from code.', 3),
  ('03400000-0000-4000-8000-000000000504', '03400000-0000-4000-8000-000000000306',
   'An idempotent operation is one that...',
   'Idempotency means repeated runs converge to the same end state without side effects.', 1),
  ('03400000-0000-4000-8000-000000000505', '03400000-0000-4000-8000-000000000306',
   'What will ansible-playbook --check do?',
   'Check mode simulates the run and reports what would change without applying it.', 2),
  ('03400000-0000-4000-8000-000000000506', '03400000-0000-4000-8000-000000000306',
   'A task result of changed means that...',
   'changed means the current state did not match and Ansible modified the node to match.', 3),
  ('03400000-0000-4000-8000-000000000507', '03400000-0000-4000-8000-000000000309',
   'Where does Ansible learn which hosts it can manage?',
   'The inventory lists managed hosts, groups, and host-level variables.', 1),
  ('03400000-0000-4000-8000-000000000508', '03400000-0000-4000-8000-000000000309',
   'What does the pattern webservers:!dbservers target?',
   'The exclamation mark excludes a group from the pattern.', 2),
  ('03400000-0000-4000-8000-000000000509', '03400000-0000-4000-8000-000000000309',
   'When is dynamic inventory most valuable?',
   'Dynamic inventory queries a provider so ephemeral cloud hosts stay manageable.', 3),
  ('03400000-0000-4000-8000-000000000510', '03400000-0000-4000-8000-000000000312',
   'Which CLI runs one module against a pattern without a playbook?',
   'The ansible CLI runs ad-hoc module calls; ansible-playbook runs playbooks.', 1),
  ('03400000-0000-4000-8000-000000000511', '03400000-0000-4000-8000-000000000312',
   'What does the become keyword control?',
   'become makes a task run with escalated privileges instead of logging in as root.', 2),
  ('03400000-0000-4000-8000-000000000512', '03400000-0000-4000-8000-000000000312',
   'Which file carries default settings like the inventory path?',
   'ansible.cfg holds control-plane defaults for the current directory tree.', 3),
  ('03400000-0000-4000-8000-000000000513', '03400000-0000-4000-8000-000000000315',
   'Playbooks are written in...',
   'A playbook is a YAML document describing hosts, tasks, and other sections.', 1),
  ('03400000-0000-4000-8000-000000000514', '03400000-0000-4000-8000-000000000315',
   'Which module installs a package regardless of the operating system family?',
   'The generic package module picks apt, dnf, or yum based on gathered facts.', 2),
  ('03400000-0000-4000-8000-000000000515', '03400000-0000-4000-8000-000000000315',
   'What does the name keyword on a task provide?',
   'Named tasks make run output and failure reports easy to read.', 3),
  ('03400000-0000-4000-8000-000000000516', '03400000-0000-4000-8000-000000000318',
   'What are Ansible facts?',
   'Facts are collected from the node and referenced like variables.', 1),
  ('03400000-0000-4000-8000-000000000517', '03400000-0000-4000-8000-000000000318',
   'Which source overrides group_vars for one specific host?',
   'host_vars beats group_vars in the Ansible precedence order.', 2),
  ('03400000-0000-4000-8000-000000000518', '03400000-0000-4000-8000-000000000318',
   'How is a variable referenced inside a playbook or template?',
   'Double braces evaluate the expression in a Jinja2 context.', 3),
  ('03400000-0000-4000-8000-000000000519', '03400000-0000-4000-8000-000000000321',
   'Which keyword makes a task conditional?',
   'when gates a task on a boolean Jinja2 expression.', 1),
  ('03400000-0000-4000-8000-000000000520', '03400000-0000-4000-8000-000000000321',
   'A later task needs the output of an earlier task. What do you use?',
   'register saves a module result for later conditionals and loops.', 2),
  ('03400000-0000-4000-8000-000000000521', '03400000-0000-4000-8000-000000000321',
   'In a task that uses loop, which variable holds the current element?',
   'item (or a loop_var you choose) names the current iteration value.', 3),
  ('03400000-0000-4000-8000-000000000522', '03400000-0000-4000-8000-000000000324',
   'Which directory is NOT part of a standard role?',
   'Inventory lives at the project or inventory level, not inside a role.', 1),
  ('03400000-0000-4000-8000-000000000523', '03400000-0000-4000-8000-000000000324',
   'What is a handler?',
   'Handlers run only when a task notifies them and only when change occurred.', 2),
  ('03400000-0000-4000-8000-000000000524', '03400000-0000-4000-8000-000000000324',
   'Jinja2 templates used by the template module belong in which role directory?',
   'The template module looks in templates/; files/ holds static files for copy.', 3),
  ('03400000-0000-4000-8000-000000000525', '03400000-0000-4000-8000-000000000328',
   'How should database passwords be stored in a playbook repository?',
   'Vault encrypts secrets so the repository stays safe to commit.', 1),
  ('03400000-0000-4000-8000-000000000526', '03400000-0000-4000-8000-000000000328',
   'Under the default linear strategy, Ansible...',
   'Linear keeps the fleet in lockstep, one task across all hosts at a time.', 2),
  ('03400000-0000-4000-8000-000000000527', '03400000-0000-4000-8000-000000000328',
   'What does run_once: true do to a task?',
   'run_once performs cluster-level steps such as migrations or tokens exactly once.', 3),
  ('03400000-0000-4000-8000-000000000528', '03400000-0000-4000-8000-000000000328',
   'Which module manages file attributes and directories idempotently?',
   'The file module sets state (directory, touch) plus owner, group, and mode safely.', 4),
  ('03400000-0000-4000-8000-000000000529', '03400000-0000-4000-8000-000000000328',
   'A teammate asks how to preview a playbook without changing servers. What do you tell them?',
   'Check mode (--check) reports predicted changes without applying anything.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): config mgmt
  ('03400000-0000-4000-8000-000000001001', '03400000-0000-4000-8000-000000000501', 'Server drift from untracked manual changes', TRUE,  1),
  ('03400000-0000-4000-8000-000000001002', '03400000-0000-4000-8000-000000000501', 'Slow network throughput', FALSE, 2),
  ('03400000-0000-4000-8000-000000001003', '03400000-0000-4000-8000-000000000501', 'Hardware aging', FALSE, 3),
  ('03400000-0000-4000-8000-000000001004', '03400000-0000-4000-8000-000000000501', 'Metered internet usage', FALSE, 4),
  -- Q1 (501)q2: agentless
  ('03400000-0000-4000-8000-000000001005', '03400000-0000-4000-8000-000000000502', 'It manages nodes over SSH with no daemon installed', TRUE,  1),
  ('03400000-0000-4000-8000-000000001006', '03400000-0000-4000-8000-000000000502', 'It uses no servers at all', FALSE, 2),
  ('03400000-0000-4000-8000-000000001007', '03400000-0000-4000-8000-000000000502', 'It hides its own internal process', FALSE, 3),
  ('03400000-0000-4000-8000-000000001008', '03400000-0000-4000-8000-000000000502', 'It compiles playbooks to machine code', FALSE, 4),
  -- Q1 (501)q3: snowflake
  ('03400000-0000-4000-8000-000000001009', '03400000-0000-4000-8000-000000000503', 'A node whose exact state nobody can reproduce', TRUE,  1),
  ('03400000-0000-4000-8000-000000001010', '03400000-0000-4000-8000-000000000503', 'A server with extra liquid cooling', FALSE, 2),
  ('03400000-0000-4000-8000-000000001011', '03400000-0000-4000-8000-000000000503', 'A freshly imaged server', FALSE, 3),
  ('03400000-0000-4000-8000-000000001012', '03400000-0000-4000-8000-000000000503', 'A machine in a cold-region data center', FALSE, 4),
  -- Q2 (504): idempotency
  ('03400000-0000-4000-8000-000000001013', '03400000-0000-4000-8000-000000000504', 'It reaches the same end state however many times it runs', TRUE,  1),
  ('03400000-0000-4000-8000-000000001014', '03400000-0000-4000-8000-000000000504', 'It always changes at least one thing', FALSE, 2),
  ('03400000-0000-4000-8000-000000001015', '03400000-0000-4000-8000-000000000504', 'It runs at maximum CPU speed', FALSE, 3),
  ('03400000-0000-4000-8000-000000001016', '03400000-0000-4000-8000-000000000504', 'It requires login as root', FALSE, 4),
  -- Q2 (504)q2: check mode
  ('03400000-0000-4000-8000-000000001017', '03400000-0000-4000-8000-000000000505', 'It reports what would change without changing anything', TRUE,  1),
  ('03400000-0000-4000-8000-000000001018', '03400000-0000-4000-8000-000000000505', 'It applies the changes and verifies them', FALSE, 2),
  ('03400000-0000-4000-8000-000000001019', '03400000-0000-4000-8000-000000000505', 'It deletes failing tasks from the play', FALSE, 3),
  ('03400000-0000-4000-8000-000000001020', '03400000-0000-4000-8000-000000000505', 'It skips every conditional task', FALSE, 4),
  -- Q2 (504)q3: changed
  ('03400000-0000-4000-8000-000000001021', '03400000-0000-4000-8000-000000000506', 'Ansible modified the node toward the desired state', TRUE,  1),
  ('03400000-0000-4000-8000-000000001022', '03400000-0000-4000-8000-000000000506', 'The module crashed during the run', FALSE, 2),
  ('03400000-0000-4000-8000-000000001023', '03400000-0000-4000-8000-000000000506', 'The host was skipped by a condition', FALSE, 3),
  ('03400000-0000-4000-8000-000000001024', '03400000-0000-4000-8000-000000000506', 'A handler was never notified', FALSE, 4),
  -- Q3 (507): inventory
  ('03400000-0000-4000-8000-000000001025', '03400000-0000-4000-8000-000000000507', 'The inventory', TRUE,  1),
  ('03400000-0000-4000-8000-000000001026', '03400000-0000-4000-8000-000000000507', 'The handler list', FALSE, 2),
  ('03400000-0000-4000-8000-000000001027', '03400000-0000-4000-8000-000000000507', 'The strategy block', FALSE, 3),
  ('03400000-0000-4000-8000-000000001028', '03400000-0000-4000-8000-000000000507', 'The vault file', FALSE, 4),
  -- Q3 (507)q2: pattern
  ('03400000-0000-4000-8000-000000001029', '03400000-0000-4000-8000-000000000508', 'Hosts in webservers that are not in dbservers', TRUE,  1),
  ('03400000-0000-4000-8000-000000001030', '03400000-0000-4000-8000-000000000508', 'The union of both groups', FALSE, 2),
  ('03400000-0000-4000-8000-000000001031', '03400000-0000-4000-8000-000000000508', 'Only the dbservers', FALSE, 3),
  ('03400000-0000-4000-8000-000000001032', '03400000-0000-4000-8000-000000000508', 'Every host except webservers', FALSE, 4),
  -- Q3 (507)q3: dynamic inventory
  ('03400000-0000-4000-8000-000000001033', '03400000-0000-4000-8000-000000000509', 'When hosts are created and destroyed frequently', TRUE,  1),
  ('03400000-0000-4000-8000-000000001034', '03400000-0000-4000-8000-000000000509', 'When every host is static for years', FALSE, 2),
  ('03400000-0000-4000-8000-000000001035', '03400000-0000-4000-8000-000000000509', 'When SSH is disabled fleet-wide', FALSE, 3),
  ('03400000-0000-4000-8000-000000001036', '03400000-0000-4000-8000-000000000509', 'When DNS is unreachable', FALSE, 4),
  -- Q4 (510): ad-hoc CLI
  ('03400000-0000-4000-8000-000000001037', '03400000-0000-4000-8000-000000000510', 'ansible', TRUE,  1),
  ('03400000-0000-4000-8000-000000001038', '03400000-0000-4000-8000-000000000510', 'ansible-playbook', FALSE, 2),
  ('03400000-0000-4000-8000-000000001039', '03400000-0000-4000-8000-000000000510', 'ansible-galaxy', FALSE, 3),
  ('03400000-0000-4000-8000-000000001040', '03400000-0000-4000-8000-000000000510', 'ansible-vault', FALSE, 4),
  -- Q4 (510)q2: become
  ('03400000-0000-4000-8000-000000001041', '03400000-0000-4000-8000-000000000511', 'Privilege escalation, typically to root', TRUE,  1),
  ('03400000-0000-4000-8000-000000001042', '03400000-0000-4000-8000-000000000511', 'Host key verification', FALSE, 2),
  ('03400000-0000-4000-8000-000000001043', '03400000-0000-4000-8000-000000000511', 'Parallelism across hosts', FALSE, 3),
  ('03400000-0000-4000-8000-000000001044', '03400000-0000-4000-8000-000000000511', 'Which facts to gather', FALSE, 4),
  -- Q4 (510)q3: ansible.cfg
  ('03400000-0000-4000-8000-000000001045', '03400000-0000-4000-8000-000000000512', 'ansible.cfg', TRUE,  1),
  ('03400000-0000-4000-8000-000000001046', '03400000-0000-4000-8000-000000000512', '.gitignore', FALSE, 2),
  ('03400000-0000-4000-8000-000000001047', '03400000-0000-4000-8000-000000000512', 'Vagrantfile', FALSE, 3),
  ('03400000-0000-4000-8000-000000001048', '03400000-0000-4000-8000-000000000512', 'Dockerfile', FALSE, 4),
  -- Q5 (513): playbooks YAML
  ('03400000-0000-4000-8000-000000001049', '03400000-0000-4000-8000-000000000513', 'YAML', TRUE,  1),
  ('03400000-0000-4000-8000-000000001050', '03400000-0000-4000-8000-000000000513', 'JSON only', FALSE, 2),
  ('03400000-0000-4000-8000-000000001051', '03400000-0000-4000-8000-000000000513', 'Ruby', FALSE, 3),
  ('03400000-0000-4000-8000-000000001052', '03400000-0000-4000-8000-000000000513', 'Bash', FALSE, 4),
  -- Q5 (513)q2: package module
  ('03400000-0000-4000-8000-000000001053', '03400000-0000-4000-8000-000000000514', 'ansible.builtin.package', TRUE,  1),
  ('03400000-0000-4000-8000-000000001054', '03400000-0000-4000-8000-000000000514', 'ansible.builtin.shell', FALSE, 2),
  ('03400000-0000-4000-8000-000000001055', '03400000-0000-4000-8000-000000000514', 'ansible.builtin.debug', FALSE, 3),
  ('03400000-0000-4000-8000-000000001056', '03400000-0000-4000-8000-000000000514', 'ansible.builtin.copy', FALSE, 4),
  -- Q5 (513)q3: task name
  ('03400000-0000-4000-8000-000000001057', '03400000-0000-4000-8000-000000000515', 'A readable label shown in the run output', TRUE,  1),
  ('03400000-0000-4000-8000-000000001058', '03400000-0000-4000-8000-000000000515', 'Elevated root privileges', FALSE, 2),
  ('03400000-0000-4000-8000-000000001059', '03400000-0000-4000-8000-000000000515', 'A new inventory group', FALSE, 3),
  ('03400000-0000-4000-8000-000000001060', '03400000-0000-4000-8000-000000000515', 'A faster SSH transport', FALSE, 4),
  -- Q6 (516): facts
  ('03400000-0000-4000-8000-000000001061', '03400000-0000-4000-8000-000000000516', 'Details discovered about a node, like OS and CPUs', TRUE,  1),
  ('03400000-0000-4000-8000-000000001062', '03400000-0000-4000-8000-000000000516', 'Comments inside playbooks', FALSE, 2),
  ('03400000-0000-4000-8000-000000001063', '03400000-0000-4000-8000-000000000516', 'Module dependency trees', FALSE, 3),
  ('03400000-0000-4000-8000-000000001064', '03400000-0000-4000-8000-000000000516', 'Encrypted secret values', FALSE, 4),
  -- Q6 (516)q2: precedence
  ('03400000-0000-4000-8000-000000001065', '03400000-0000-4000-8000-000000000517', 'host_vars', TRUE,  1),
  ('03400000-0000-4000-8000-000000001066', '03400000-0000-4000-8000-000000000517', 'role defaults', FALSE, 2),
  ('03400000-0000-4000-8000-000000001067', '03400000-0000-4000-8000-000000000517', 'inventory comments', FALSE, 3),
  ('03400000-0000-4000-8000-000000001068', '03400000-0000-4000-8000-000000000517', 'handler names', FALSE, 4),
  -- Q6 (516)q3: variable reference
  ('03400000-0000-4000-8000-000000001069', '03400000-0000-4000-8000-000000000518', '{{ variable_name }}', TRUE,  1),
  ('03400000-0000-4000-8000-000000001070', '03400000-0000-4000-8000-000000000518', '(variable_name)', FALSE, 2),
  ('03400000-0000-4000-8000-000000001071', '03400000-0000-4000-8000-000000000518', '${variable_name}', FALSE, 3),
  ('03400000-0000-4000-8000-000000001072', '03400000-0000-4000-8000-000000000518', '&variable_name;', FALSE, 4),
  -- Q7 (519): when
  ('03400000-0000-4000-8000-000000001073', '03400000-0000-4000-8000-000000000519', 'when', TRUE,  1),
  ('03400000-0000-4000-8000-000000001074', '03400000-0000-4000-8000-000000000519', 'unless', FALSE, 2),
  ('03400000-0000-4000-8000-000000001075', '03400000-0000-4000-8000-000000000519', 'until', FALSE, 3),
  ('03400000-0000-4000-8000-000000001076', '03400000-0000-4000-8000-000000000519', 'ifdef', FALSE, 4),
  -- Q7 (519)q2: register
  ('03400000-0000-4000-8000-000000001077', '03400000-0000-4000-8000-000000000520', 'register', TRUE,  1),
  ('03400000-0000-4000-8000-000000001078', '03400000-0000-4000-8000-000000000520', 'notify', FALSE, 2),
  ('03400000-0000-4000-8000-000000001079', '03400000-0000-4000-8000-000000000520', 'handlers', FALSE, 3),
  ('03400000-0000-4000-8000-000000001080', '03400000-0000-4000-8000-000000000520', 'vault', FALSE, 4),
  -- Q7 (519)q3: loop item
  ('03400000-0000-4000-8000-000000001081', '03400000-0000-4000-8000-000000000521', 'item', TRUE,  1),
  ('03400000-0000-4000-8000-000000001082', '03400000-0000-4000-8000-000000000521', 'current', FALSE, 2),
  ('03400000-0000-4000-8000-000000001083', '03400000-0000-4000-8000-000000000521', 'each', FALSE, 3),
  ('03400000-0000-4000-8000-000000001084', '03400000-0000-4000-8000-000000000521', 'value', FALSE, 4),
  -- Q8 (522): role directory
  ('03400000-0000-4000-8000-000000001085', '03400000-0000-4000-8000-000000000522', 'inventory', TRUE,  1),
  ('03400000-0000-4000-8000-000000001086', '03400000-0000-4000-8000-000000000522', 'tasks', FALSE, 2),
  ('03400000-0000-4000-8000-000000001087', '03400000-0000-4000-8000-000000000522', 'handlers', FALSE, 3),
  ('03400000-0000-4000-8000-000000001088', '03400000-0000-4000-8000-000000000522', 'templates', FALSE, 4),
  -- Q8 (522)q2: handler
  ('03400000-0000-4000-8000-000000001089', '03400000-0000-4000-8000-000000000523', 'A task that runs once per play when notified and a change happened', TRUE,  1),
  ('03400000-0000-4000-8000-000000001090', '03400000-0000-4000-8000-000000000523', 'A module for HTTP requests', FALSE, 2),
  ('03400000-0000-4000-8000-000000001091', '03400000-0000-4000-8000-000000000523', 'A fact-gathering flag', FALSE, 3),
  ('03400000-0000-4000-8000-000000001092', '03400000-0000-4000-8000-000000000523', 'A name for the vault password', FALSE, 4),
  -- Q8 (522)q3: templates dir
  ('03400000-0000-4000-8000-000000001093', '03400000-0000-4000-8000-000000000524', 'templates', TRUE,  1),
  ('03400000-0000-4000-8000-000000001094', '03400000-0000-4000-8000-000000000524', 'files', FALSE, 2),
  ('03400000-0000-4000-8000-000000001095', '03400000-0000-4000-8000-000000000524', 'meta', FALSE, 3),
  ('03400000-0000-4000-8000-000000001096', '03400000-0000-4000-8000-000000000524', 'tests', FALSE, 4),
  -- Q9 (525): vault
  ('03400000-0000-4000-8000-000000001097', '03400000-0000-4000-8000-000000000525', 'Encrypted with Ansible Vault', TRUE,  1),
  ('03400000-0000-4000-8000-000000001098', '03400000-0000-4000-8000-000000000525', 'In plaintext group_vars', FALSE, 2),
  ('03400000-0000-4000-8000-000000001099', '03400000-0000-4000-8000-000000000525', 'In the README file', FALSE, 3),
  ('03400000-0000-4000-8000-000000001100', '03400000-0000-4000-8000-000000000525', 'In the shell history', FALSE, 4),
  -- Q9 (525)q2: linear strategy
  ('03400000-0000-4000-8000-000000001101', '03400000-0000-4000-8000-000000000526', 'Runs every task on all hosts before starting the next', TRUE,  1),
  ('03400000-0000-4000-8000-000000001102', '03400000-0000-4000-8000-000000000526', 'Lets every host race through tasks by itself', FALSE, 2),
  ('03400000-0000-4000-8000-000000001103', '03400000-0000-4000-8000-000000000526', 'Runs handlers before tasks', FALSE, 3),
  ('03400000-0000-4000-8000-000000001104', '03400000-0000-4000-8000-000000000526', 'Skips hosts randomly', FALSE, 4),
  -- Q9 (525)q3: run_once
  ('03400000-0000-4000-8000-000000001105', '03400000-0000-4000-8000-000000000527', 'Runs the task on a single host only', TRUE,  1),
  ('03400000-0000-4000-8000-000000001106', '03400000-0000-4000-8000-000000000527', 'Runs the task once per hour', FALSE, 2),
  ('03400000-0000-4000-8000-000000001107', '03400000-0000-4000-8000-000000000527', 'Disables the notify list', FALSE, 3),
  ('03400000-0000-4000-8000-000000001108', '03400000-0000-4000-8000-000000000527', 'Forces a service restart', FALSE, 4),
  -- Q9 (525)q4: file module
  ('03400000-0000-4000-8000-000000001109', '03400000-0000-4000-8000-000000000528', 'ansible.builtin.file', TRUE,  1),
  ('03400000-0000-4000-8000-000000001110', '03400000-0000-4000-8000-000000000528', 'ansible.builtin.command', FALSE, 2),
  ('03400000-0000-4000-8000-000000001111', '03400000-0000-4000-8000-000000000528', 'ansible.builtin.setup', FALSE, 3),
  ('03400000-0000-4000-8000-000000001112', '03400000-0000-4000-8000-000000000528', 'ansible.builtin.debug', FALSE, 4),
  -- Q9 (525)q5: preview
  ('03400000-0000-4000-8000-000000001113', '03400000-0000-4000-8000-000000000529', 'Run ansible-playbook --check', TRUE,  1),
  ('03400000-0000-4000-8000-000000001114', '03400000-0000-4000-8000-000000000529', 'Run ansible-playbook twice', FALSE, 2),
  ('03400000-0000-4000-8000-000000001115', '03400000-0000-4000-8000-000000000529', 'Delete the inventory and rerun', FALSE, 3),
  ('03400000-0000-4000-8000-000000001116', '03400000-0000-4000-8000-000000000529', 'Use a cron job instead', FALSE, 4)
ON CONFLICT (id) DO NOTHING;
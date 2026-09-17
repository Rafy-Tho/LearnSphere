-- ============================================================================
-- SEED 022: Complete course - "Linux for DevOps"
-- ----------------------------------------------------------------------------
-- Instructor : David Kim          (10000000-0000-4000-8000-000000000004)
-- Category   : DevOps & CI/CD     (20000000-0000-4000-8000-000000000009)
-- Level      : BEGINNER - Access : FREE - Status : PUBLISHED
--
-- Structure (5 modules -> 10 chapters -> 28 lessons):
--   M1 Linux Foundations & the Filesystem -> C1 Filesystem & Navigation - C2 Working with Files & Text
--   M2 Users, Groups & Permissions         -> C3 Users & Groups - C4 Permissions & Ownership
--   M3 Processes & Software                -> C5 Processes & Job Control - C6 Package Management
--   M4 Shell & System Administration       -> C7 Bash Scripting - C8 systemd & Services
--   M5 Networking, Monitoring & Capstone   -> C9 Networking, Logs & Monitoring - C10 Capstone: Web Server Setup
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
  '01600000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000004',
  '20000000-0000-4000-8000-000000000009',
  'Linux for DevOps',
  'linux-for-devops',
  'Everything a DevOps engineer must know to survive on a Linux server: filesystems, permissions, processes, package management, shell scripting, systemd, networking, and monitoring - capped by building a real Nginx web server.',
  'PUBLISHED',
  'BEGINNER',
  'FREE',
  20
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('01600000-0000-4000-8000-000000000011', '01600000-0000-4000-8000-000000000001', 'Navigate and manage the Linux filesystem confidently from the command line.',          1),
  ('01600000-0000-4000-8000-000000000012', '01600000-0000-4000-8000-000000000001', 'Secure systems with users, groups, and file permissions, including sudo and advanced modes.', 2),
  ('01600000-0000-4000-8000-000000000013', '01600000-0000-4000-8000-000000000001', 'Inspect and control processes, jobs, and installed software.',                               3),
  ('01600000-0000-4000-8000-000000000014', '01600000-0000-4000-8000-000000000001', 'Write reusable Bash scripts and manage dependable services under systemd.',                 4),
  ('01600000-0000-4000-8000-000000000015', '01600000-0000-4000-8000-000000000001', 'Diagnose servers with networking tools and logs, then provision a production web server.',  5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('01600000-0000-4000-8000-000000000101', '01600000-0000-4000-8000-000000000001', 1, 'Linux Foundations & the Filesystem', 'The core mental model: files, text, and the command line every DevOps workflow depends on.', 'PUBLISHED'),
  ('01600000-0000-4000-8000-000000000102', '01600000-0000-4000-8000-000000000001', 2, 'Users, Groups & Permissions',       'Identity and access control: accounts, sudo, and permission modes.',                            'PUBLISHED'),
  ('01600000-0000-4000-8000-000000000103', '01600000-0000-4000-8000-000000000001', 3, 'Processes & Software',              'Observe and control running programs, then manage software with apt.',                          'PUBLISHED'),
  ('01600000-0000-4000-8000-000000000104', '01600000-0000-4000-8000-000000000001', 4, 'Shell & System Administration',     'Automate with Bash and run dependable services under systemd.',                                 'PUBLISHED'),
  ('01600000-0000-4000-8000-000000000105', '01600000-0000-4000-8000-000000000001', 5, 'Networking, Monitoring & Capstone', 'Diagnose networks, read logs, and ship a real web server.',                                     'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('01600000-0000-4000-8000-000000000201', '01600000-0000-4000-8000-000000000101', 1, 'Filesystem & Navigation',         'Where files live and how to move around the hierarchy.',          'PUBLISHED'),
  ('01600000-0000-4000-8000-000000000202', '01600000-0000-4000-8000-000000000101', 2, 'Working with Files & Text',       'Create, copy, find, and search files from the shell.',            'PUBLISHED'),
  ('01600000-0000-4000-8000-000000000203', '01600000-0000-4000-8000-000000000102', 1, 'Users & Groups',                  'Accounts, identity files, and the policy-based power of sudo.',   'PUBLISHED'),
  ('01600000-0000-4000-8000-000000000204', '01600000-0000-4000-8000-000000000102', 2, 'Permissions & Ownership',         'Read, write, and execute for owner, group, and others.',          'PUBLISHED'),
  ('01600000-0000-4000-8000-000000000205', '01600000-0000-4000-8000-000000000103', 1, 'Processes & Job Control',         'Watch running programs, send signals, and schedule jobs.',        'PUBLISHED'),
  ('01600000-0000-4000-8000-000000000206', '01600000-0000-4000-8000-000000000103', 2, 'Package Management',              'Install, update, and remove software the distro way.',            'PUBLISHED'),
  ('01600000-0000-4000-8000-000000000207', '01600000-0000-4000-8000-000000000104', 1, 'Bash Scripting',                  'Turn repeated command lines into dependable scripts.',            'PUBLISHED'),
  ('01600000-0000-4000-8000-000000000208', '01600000-0000-4000-8000-000000000104', 2, 'systemd & Services',              'Run services as first-class units and read their logs.',          'PUBLISHED'),
  ('01600000-0000-4000-8000-000000000209', '01600000-0000-4000-8000-000000000105', 1, 'Networking, Logs & Monitoring',   'Tools to inspect connectivity and keep a server healthy.',        'PUBLISHED'),
  ('01600000-0000-4000-8000-000000000210', '01600000-0000-4000-8000-000000000105', 2, 'Capstone: Web Server Setup',      'Provision a hardened Nginx server from a clean VM.',              'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 01600000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('01600000-0000-4000-8000-000000000301', '01600000-0000-4000-8000-000000000201', 1, 'Linux & the DevOps Mindset',         'Understand how Linux powers servers and why the command line is the DevOps home.',        'TEXT',  'PUBLISHED', 'FREE', 10,  6),
  ('01600000-0000-4000-8000-000000000302', '01600000-0000-4000-8000-000000000201', 2, 'Navigating the Filesystem',          'Learn the filesystem layout and move around with pwd, ls, and cd.',                       'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01600000-0000-4000-8000-000000000303', '01600000-0000-4000-8000-000000000201', 3, 'Filesystem Basics Quiz',              'Check your understanding of filesystem basics.',                                           'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01600000-0000-4000-8000-000000000304', '01600000-0000-4000-8000-000000000202', 1, 'Managing Files & Directories',        'Create, copy, move, and delete files and directories safely.',                             'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01600000-0000-4000-8000-000000000305', '01600000-0000-4000-8000-000000000202', 2, 'Reading & Searching Text',            'View and search text files and compose commands with pipes.',                              'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01600000-0000-4000-8000-000000000306', '01600000-0000-4000-8000-000000000202', 3, 'Files & Text Quiz',                   'Test your skills with files, text, and pipelines.',                                        'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01600000-0000-4000-8000-000000000307', '01600000-0000-4000-8000-000000000203', 1, 'Users & Groups',                      'Manage accounts, groups, and identity files on a Linux box.',                              'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01600000-0000-4000-8000-000000000308', '01600000-0000-4000-8000-000000000203', 2, 'sudo & Privilege Management',         'Grant precise privileges with sudo and the sudoers policy.',                               'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01600000-0000-4000-8000-000000000309', '01600000-0000-4000-8000-000000000203', 3, 'Users & Privileges Quiz',             'Verify your users and privilege knowledge.',                                                'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01600000-0000-4000-8000-000000000310', '01600000-0000-4000-8000-000000000204', 1, 'File Permissions & Ownership',        'Decode and change permissions with chmod and chown.',                                      'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01600000-0000-4000-8000-000000000311', '01600000-0000-4000-8000-000000000204', 2, 'Advanced Permissions & umask',        'Master umask, special bits, and ACLs for real-world access control.',                       'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01600000-0000-4000-8000-000000000312', '01600000-0000-4000-8000-000000000204', 3, 'Permissions Quiz',                    'Confirm you can secure files with the right modes.',                                       'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01600000-0000-4000-8000-000000000313', '01600000-0000-4000-8000-000000000205', 1, 'Processes & Resource Monitoring',     'Inspect running processes and diagnose memory and CPU pressure.',                           'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01600000-0000-4000-8000-000000000314', '01600000-0000-4000-8000-000000000205', 2, 'Signals, Job Control & Scheduling',   'Send signals, control background jobs, and schedule with cron.',                            'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01600000-0000-4000-8000-000000000315', '01600000-0000-4000-8000-000000000205', 3, 'Processes Quiz',                      'Test your process knowledge.',                                                              'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01600000-0000-4000-8000-000000000316', '01600000-0000-4000-8000-000000000206', 1, 'Package Management with apt',         'Install, update, and remove software with apt and dpkg.',                                  'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01600000-0000-4000-8000-000000000317', '01600000-0000-4000-8000-000000000206', 2, 'Package Management Beyond apt',       'Handle software beyond apt: dnf, snap, and single packages.',                               'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01600000-0000-4000-8000-000000000318', '01600000-0000-4000-8000-000000000206', 3, 'Packages Quiz',                       'Check your package management skills.',                                                     'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01600000-0000-4000-8000-000000000319', '01600000-0000-4000-8000-000000000207', 1, 'Bash Scripting Fundamentals',         'Write your first Bash scripts with variables, arguments, and conditionals.',               'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01600000-0000-4000-8000-000000000320', '01600000-0000-4000-8000-000000000207', 2, 'Scripting Patterns for DevOps',       'Build dependable automation with loops, functions, and safety flags.',                      'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01600000-0000-4000-8000-000000000321', '01600000-0000-4000-8000-000000000207', 3, 'Bash Scripting Quiz',                 'Test your Bash scripting knowledge.',                                                       'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01600000-0000-4000-8000-000000000322', '01600000-0000-4000-8000-000000000208', 1, 'systemd & Service Units',             'Run services under systemd and write your own unit files.',                                 'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01600000-0000-4000-8000-000000000323', '01600000-0000-4000-8000-000000000208', 2, 'Managing Services & the Journal',     'Manage boot targets and read service logs from the journal.',                               'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01600000-0000-4000-8000-000000000324', '01600000-0000-4000-8000-000000000208', 3, 'systemd Quiz',                        'Verify you can manage services and their logs.',                                            'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01600000-0000-4000-8000-000000000325', '01600000-0000-4000-8000-000000000209', 1, 'Networking Tools',                    'Diagnose connectivity and ports with ip, ss, curl, and friends.',                           'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01600000-0000-4000-8000-000000000326', '01600000-0000-4000-8000-000000000209', 2, 'Logs & Monitoring',                   'Find, rotate, and monitor logs to keep a server healthy.',                                  'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01600000-0000-4000-8000-000000000327', '01600000-0000-4000-8000-000000000210', 1, 'Capstone: Provisioning a Web Server', 'Provision a firewall-hardened Nginx server from scratch.',                                  'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('01600000-0000-4000-8000-000000000328', '01600000-0000-4000-8000-000000000210', 2, 'Final Assessment',                    'Prove what you learned across the whole course.',                                           'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 01600000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '01600000-0000-4000-8000-000000000401',
  '01600000-0000-4000-8000-000000000301',
  1,
  'Linux & the DevOps Mindset',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Linux &amp; the DevOps Mindset</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #052e16; color: #6ee7b7; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Linux &amp; the DevOps Mindset</h1>
  <p>Every DevOps engineer works on Linux eventually. The servers that run the internet - web, databases, pipelines, containers - are overwhelmingly Linux. This course gives you the operational core: filesystems, permissions, processes, packages, scripts, systemd, networking, and logs, and ends with you provisioning a real web server.</p>
  <h2>The kernel and the distribution</h2>
  <p>Linux is two layered things. The <strong>kernel</strong> manages hardware, memory, and processes. A <strong>distribution</strong> is the kernel plus the tools around it: the GNU utilities, a package manager, and an init system. You almost never touch the kernel directly - you interact with the distribution.</p>
  <table>
    <tr><th>Distribution family</th><th>Package manager</th><th>Where you meet it</th></tr>
    <tr><td>Debian / Ubuntu</td><td>apt, dpkg</td><td>Virtual servers, Docker base images</td></tr>
    <tr><td>RHEL / AlmaLinux / Rocky</td><td>dnf, yum</td><td>Enterprise, Kubernetes nodes</td></tr>
    <tr><td>Amazon Linux</td><td>dnf</td><td>AWS instances</td></tr>
    <tr><td>Alpine</td><td>apk</td><td>Small container images</td></tr>
  </table>
  <div class="callout">
    <strong>You will learn one, understand two</strong>
    <p>This course uses Debian/Ubuntu and <span class="ic">apt</span>. Once the concepts stick, the RHEL family (<span class="ic">dnf</span>) will feel familiar.</p>
  </div>
  <h2>The terminal is the interface</h2>
  <p>A server usually has no screen. You reach it over SSH and work in a shell. Start by confirming who and where you are:</p>
  <pre class="code-block">whoami      # your username
hostname    # the machine name
uname -r    # running kernel version</pre>
  <p>Every command you type can be combined, scripted, and repeated - that is exactly what makes Linux automation-friendly.</p>
  <div class="callout callout-tip">
    <strong>Read the manual</strong>
    <p><span class="ic">man ls</span> (or <span class="ic">ls --help</span>) is always available and always accurate for that system.</p>
  </div>
  <div class="callout callout-info">
    <strong>Privilege rule</strong>
    <p>Work as a normal user and escalate with <span class="ic">sudo</span> only when a task needs it. This habit prevents most accidental server damage.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01600000-0000-4000-8000-000000000402',
  '01600000-0000-4000-8000-000000000302',
  1,
  'Navigating the Filesystem',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Navigating the Filesystem</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #052e16; color: #6ee7b7; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Navigating the Filesystem</h1>
  <p>Before you manage anything, you must know where it lives. Linux organizes everything under a single root directory <span class="ic">/</span>, and every path starts there.</p>
  <h2>The Filesystem Hierarchy Standard</h2>
  <table>
    <tr><th>Directory</th><th>Purpose</th></tr>
    <tr><td>/</td><td>Root of the whole system</td></tr>
    <tr><td>/etc</td><td>System-wide configuration files</td></tr>
    <tr><td>/home</td><td>Normal users, one folder each (/home/alice)</td></tr>
    <tr><td>/root</td><td>The root user home</td></tr>
    <tr><td>/var</td><td>Variable data: logs, queues, mail</td></tr>
    <tr><td>/tmp</td><td>Temporary files cleared on boot</td></tr>
    <tr><td>/usr /bin</td><td>Executables and libraries</td></tr>
    <tr><td>/opt</td><td>Third-party application files</td></tr>
    <tr><td>/proc /dev</td><td>Kernel and device views</td></tr>
  </table>
  <h2>Moving around</h2>
  <pre class="code-block">pwd              # print working directory - where am I?
cd /var/log      # change directory (absolute path)
cd ../..         # up two levels
cd ~             # home directory
cd -             # back to the previous directory</pre>
  <p>A path that starts with <span class="ic">/</span> is <strong>absolute</strong>; one relative to your current location is <strong>relative</strong>. The special entries <span class="ic">.</span> (this directory) and <span class="ic">..</span> (parent) exist in every directory.</p>
  <h2>Listing files</h2>
  <pre class="code-block">ls               # names only
ls -l            # long format: perms, owner, group, size, date
ls -a            # including hidden files (.config, .ssh)
ls -lh           # human-readable sizes</pre>
  <div class="callout callout-tip">
    <strong>Tab completion</strong>
    <p>Type the start of a name and press Tab to complete it. Press the Up/Down arrows to recall history. These two habits save more time than any flag.</p>
  </div>
  <div class="callout callout-info">
    <strong>Hidden does not mean secure</strong>
    <p>Dotfiles hide configuration, not secrets. Anything world-readable is visible to anyone who can log in.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01600000-0000-4000-8000-000000000404',
  '01600000-0000-4000-8000-000000000304',
  1,
  'Managing Files & Directories',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Managing Files &amp; Directories</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #052e16; color: #6ee7b7; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Managing Files &amp; Directories</h1>
  <p>Creating, copying, moving, and deleting are the day-to-day verbs of server work. All of them are careful operations here - there is no undo.</p>
  <h2>Create and remove</h2>
  <pre class="code-block">touch app.log            # create an empty file
mkdir -p deploy/nginx    # create parents too
rmdir empty_dir          # remove an empty directory
rm -r old_dir            # remove a directory and its contents</pre>
  <h2>Copy and move</h2>
  <pre class="code-block">cp app.conf app.conf.bak         # copy a file
cp -r /opt/app /opt/app-backup   # copy a whole tree
mv config.yaml config.yaml.old   # rename
mv app /srv/app                  # move elsewhere</pre>
  <div class="callout">
    <strong>rm is permanent</strong>
    <p>There is no trash can on a server. <span class="ic">rm -rf</span> wipes a directory without asking. Verify the path with <span class="ic">ls</span> and <span class="ic">pwd</span> before you run it, and never combine it with a variable you have not checked.</p>
  </div>
  <h2>Finding files</h2>
  <pre class="code-block">find /var/log -name "*.log"            # by name pattern
find /etc -type d                       # directories only
find /home -mtime -3                    # changed in the last 3 days
find / -name "nginx.conf" 2&gt;/dev/null   # ignore permission noise</pre>
  <h2>Symbolic links</h2>
  <p>A symlink is a shortcut that points elsewhere; the target keeps the real data.</p>
  <pre class="code-block">ln -s /srv/app/current /var/www/app</pre>
  <div class="callout callout-tip">
    <strong>Prefer absolute targets</strong>
    <p>Relative symlinks break when anything above them moves. Point at an absolute path unless you have a reason not to.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01600000-0000-4000-8000-000000000405',
  '01600000-0000-4000-8000-000000000305',
  1,
  'Reading & Searching Text',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reading &amp; Searching Text</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #052e16; color: #6ee7b7; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Reading &amp; Searching Text</h1>
  <p>Configuration and logs are text, and Linux ships a toolset for consuming text fast. Small commands wired together with pipes are the classic Unix way to work.</p>
  <h2>Viewing files</h2>
  <pre class="code-block">cat nginx.conf           # dump the whole file
less nginx.conf          # page through: q quits, / searches
head -n 20 access.log    # first 20 lines
tail -n 5 error.log      # last 5 lines
tail -f error.log        # follow the file as it grows</pre>
  <div class="callout">
    <strong>tail -f is the debugging loop</strong>
    <p>Start a service in one terminal, follow its log in another, and you will see errors the instant they happen.</p>
  </div>
  <h2>Counting, sorting, slicing</h2>
  <pre class="code-block">wc -l access.log               # count lines
sort log.txt | uniq -c         # count repeated lines
cut -d " " -f 1 log.txt        # extract the first field</pre>
  <h2>Searching with grep</h2>
  <pre class="code-block">grep "ERROR" app.log            # lines containing ERROR
grep -i "timeout" syslog        # case-insensitive
grep -n "listen" nginx.conf     # with line numbers
grep -r "keepalive" /etc/nginx  # recursive search</pre>
  <h2>One real pipeline</h2>
  <pre class="code-block">cut -d " " -f 8 access.log | sort | uniq -c | sort -rn | head -n 5</pre>
  <p>Read it left to right: extract the status-code field, sort it, count the runs, re-sort highest first, and keep the top five. The five most frequent HTTP status codes in your access log, in one line.</p>
  <div class="callout callout-tip">
    <strong>Build, then compose</strong>
    <p>Test each stage of a pipeline on real data before assembling it. A wrong field number silently produces garbage.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01600000-0000-4000-8000-000000000407',
  '01600000-0000-4000-8000-000000000307',
  1,
  'Users & Groups',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Users &amp; Groups</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #052e16; color: #6ee7b7; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Users &amp; Groups</h1>
  <p>Linux is a multi-user system: accounts, identities, and membership control who can do what. As a DevOps engineer you provision users, grants, and service accounts every day.</p>
  <h2>Where accounts are stored</h2>
  <table>
    <tr><th>File</th><th>Holds</th></tr>
    <tr><td>/etc/passwd</td><td>Username, UID, primary GID, home directory, shell</td></tr>
    <tr><td>/etc/shadow</td><td>Password hashes (readable only by root)</td></tr>
    <tr><td>/etc/group</td><td>Group names, GIDs, supplementary membership</td></tr>
  </table>
  <pre class="code-block">id alice        # UID, GID, and group membership
whoami          # current user
groups          # groups the current user belongs to</pre>
  <h2>Creating users and groups</h2>
  <pre class="code-block">sudo groupadd devops
sudo useradd -m -s /bin/bash alice      # -m home dir, -s login shell
sudo passwd alice                       # set a password
sudo usermod -aG devops alice           # add to group, keep others</pre>
  <div class="callout">
    <strong>Remember the -a in usermod</strong>
    <p>Without <span class="ic">-a</span>, <span class="ic">usermod -G</span> replaces all supplementary groups. The <span class="ic">-aG</span> combination appends - almost always what you want.</p>
  </div>
  <h2>UID conventions</h2>
  <p>Root is <span class="ic">UID 0</span>. System accounts use low IDs (below 1000). Human users begin at <span class="ic">1000</span>, so a service account running at 1000+ is worth a second look.</p>
  <div class="callout callout-tip">
    <strong>Sessions cache group membership</strong>
    <p>Membership changes apply on the next login. Ask the user to log out and back in (or use <span class="ic">newgrp</span>) after being added to a group.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01600000-0000-4000-8000-000000000408',
  '01600000-0000-4000-8000-000000000308',
  1,
  'sudo & Privilege Management',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>sudo &amp; Privilege Management</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #052e16; color: #6ee7b7; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>sudo &amp; Privilege Management</h1>
  <p>Running everything as root is how servers get destroyed. <span class="ic">sudo</span> gives specific users the right to run specific commands with elevated privileges - and every execution is logged.</p>
  <h2>Why sudo instead of root</h2>
  <ul>
    <li><strong>Least privilege</strong> - you grant only what each person needs.</li>
    <li><strong>Audit trail</strong> - every elevated command is recorded.</li>
    <li><strong>Your password</strong> - the invoking user must authenticate, not the target account.</li>
  </ul>
  <h2>The sudoers policy</h2>
  <p>One file, <span class="ic">/etc/sudoers</span>, is edited only with <span class="ic">visudo</span>, which validates syntax before you can break it:</p>
  <pre class="code-block"># username   host = (run-as) commands
alice        ALL = (ALL:ALL) ALL
%devops      ALL = (ALL) NOPASSWD: /usr/bin/systemctl restart nginx
%admin       ALL = (ALL:ALL) ALL</pre>
  <p><span class="ic">%devops</span> addresses a group. The final rule lets the group restart nginx with no password, and nothing else.</p>
  <div class="callout">
    <strong>NOPASSWD trades convenience for safety</strong>
    <p>It means anyone possessing the account already has that escalated right with zero proof. Scope it to a single command, never to a whole shell.</p>
  </div>
  <h2>su and friends</h2>
  <pre class="code-block">sudo -i            # root shell
sudo -u alice whoami   # run one command as another user
su - alice         # switch users (needs alice password)</pre>
  <div class="callout callout-tip">
    <strong>Prefer sudo -u</strong>
    <p>Running one command as another user is narrower and audited, unlike full <span class="ic">su</span> sessions.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01600000-0000-4000-8000-000000000410',
  '01600000-0000-4000-8000-000000000310',
  1,
  'File Permissions & Ownership',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>File Permissions &amp; Ownership</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #052e16; color: #6ee7b7; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>File Permissions &amp; Ownership</h1>
  <p>Every file has an owner user, an owner group, and three permission groups: what applies to the <strong>user</strong>, the <strong>group</strong>, and everyone else (<strong>other</strong>).</p>
  <h2>Reading the permission string</h2>
  <pre class="code-block">-rwxr-x---  1 alice  devops  2094 Sep 12 10:31 deploy.sh</pre>
  <p>Broken down: <span class="ic">-</span> is the file type, <span class="ic">rwx</span> means the owner (alice) can read/write/execute, <span class="ic">r-x</span> means the group (devops) can read/execute, and <span class="ic">---</span> denies others. Then link count, owner, group, size, date, and name.</p>
  <table>
    <tr><th>Permission</th><th>On a file</th><th>On a directory</th></tr>
    <tr><td>r (4)</td><td>Read contents</td><td>List entries</td></tr>
    <tr><td>w (2)</td><td>Modify contents</td><td>Create or delete entries</td></tr>
    <tr><td>x (1)</td><td>Execute</td><td>Enter and use the entries</td></tr>
  </table>
  <div class="callout">
    <strong>Directories behave differently</strong>
    <p>Write on a directory lets you delete or rename <em>any</em> entry inside it, whether you own that entry or not. That is why shared directories treat x and w with care.</p>
  </div>
  <h2>Changing permissions: chmod</h2>
  <pre class="code-block">chmod u+x deploy.sh       # add execute for the owner
chmod o-r secret.txt      # remove read for others
chmod 750 deploy.sh       # rwxr-x--- in octal</pre>
  <table>
    <tr><th>Octal</th><th>Bits</th></tr>
    <tr><td>4</td><td>r</td></tr>
    <tr><td>2</td><td>w</td></tr>
    <tr><td>1</td><td>x</td></tr>
    <tr><td>7</td><td>rwx</td></tr>
    <tr><td>5</td><td>r-x</td></tr>
    <tr><td>6</td><td>rw-</td></tr>
  </table>
  <h2>Changing ownership: chown</h2>
  <pre class="code-block">sudo chown alice:devops deploy.sh   # owner alice, group devops</pre>
  <div class="callout callout-tip">
    <strong>Debug with a checklist</strong>
    <p>&ldquo;Permission denied&rdquo; on a path is often a parent directory you cannot traverse. Check <span class="ic">ls -ld</span> on every level from <span class="ic">/</span> down.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01600000-0000-4000-8000-000000000411',
  '01600000-0000-4000-8000-000000000311',
  1,
  'Advanced Permissions & umask',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Advanced Permissions &amp; umask</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #052e16; color: #6ee7b7; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Advanced Permissions &amp; umask</h1>
  <p>Beyond rwx, Linux adds three special modes and a default-permission policy that every new file inherits.</p>
  <h2>umask: default permissions</h2>
  <p>The mask strips permissions from the default (files start as 666, directories as 777). A <span class="ic">022</span> umask produces files of <span class="ic">644</span> and directories of <span class="ic">755</span> - the classic web-server defaults.</p>
  <pre class="code-block">umask        # show current mask: usually 022
umask 077    # tighten it for this shell: files 600, dirs 700</pre>
  <h2>Special bits</h2>
  <table>
    <tr><th>Bit</th><th>Octal</th><th>Effect</th></tr>
    <tr><td>setuid</td><td>4</td><td>File runs as its owner; often set on privileged helpers</td></tr>
    <tr><td>setgid</td><td>2</td><td>File runs as its group; new files in the dir inherit its group</td></tr>
    <tr><td>sticky</td><td>1</td><td>Only the owner (or root) can delete entries in the dir</td></tr>
  </table>
  <pre class="code-block">chmod 4755 /usr/local/bin/helper   # setuid: runs as owner
chmod 2770 /srv/shared             # setgid: group inheritance
chmod 1777 /tmp/data               # sticky: safe shared space</pre>
  <div class="callout">
    <strong>Setuid is power</strong>
    <p>setuid binaries like <span class="ic">sudo</span> and <span class="ic">passwd</span> escalate privileges. Audit what has that bit set:</p>
    <pre class="code-block">find / -perm -4000 -type f 2&gt;/dev/null</pre>
  </div>
  <h2>ACLs for finer control</h2>
  <p>When users outside the owner group need specific access, POSIX ACLs extend the model without reshuffling groups:</p>
  <pre class="code-block">sudo setfacl -m u:alice:rwx /srv/app   # give alice rights on this dir
getfacl /srv/app                        # show the ACL</pre>
  <div class="callout callout-tip">
    <strong>Prefer groups to ACLs</strong>
    <p>ACLs are powerful but invisible in <span class="ic">ls -l</span> output (you will see a trailing <span class="ic">+</span>). Reserve them for cases groups cannot express cleanly.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01600000-0000-4000-8000-000000000413',
  '01600000-0000-4000-8000-000000000313',
  1,
  'Processes & Resource Monitoring',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Processes &amp; Resource Monitoring</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #052e16; color: #6ee7b7; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Processes &amp; Resource Monitoring</h1>
  <p>A process is a running program - one instance with its own memory, state, and identifier. DevOps work is full of &ldquo;why is my server slow?&rdquo;, and processes are where the answer lives.</p>
  <h2>Listing processes</h2>
  <pre class="code-block">ps aux                       # every process, with a snapshot
ps -ef                        # alternative view
pgrep -a nginx                # find by name, show the command
pstree                        # parent-child relationships</pre>
  <h2>Live views: top and htop</h2>
  <p><span class="ic">top</span> refreshes continuously. Key columns: <span class="ic">PID</span>, <span class="ic">USER</span>, <span class="ic">%CPU</span> (per core, so 100 means one full core), <span class="ic">%MEM</span>, <span class="ic">RES</span> (resident RAM), and <span class="ic">TIME</span> (CPU seconds used).</p>
  <pre class="code-block">top                  # then press Shift+P to sort by CPU
top -o %MEM          # sort by memory directly
htop                 # friendlier, if installed</pre>
  <h2>Reading a suspicious box</h2>
  <pre class="code-block">uptime               # load average over 1, 5, and 15 minutes
free -h              # memory: total, used, available
df -h                # disk space per filesystem</pre>
  <p>A load average near the number of cores means the machine is saturated. High <span class="ic">%CPU</span> with a low load average? Suspect I/O wait instead.</p>
  <h2>Process details in the kernel</h2>
  <p>Every process has a directory under <span class="ic">/proc</span>:</p>
  <pre class="code-block">ls /proc/1234   # cmdline, environ, cwd, fd/ and more
cat /proc/cpuinfo</pre>
  <div class="callout callout-tip">
    <strong>Start with %MEM and RES</strong>
    <p>For runaway memory, sort by <span class="ic">%MEM</span> first. Nine times out of ten the culprit is a process you can spot in the top three rows.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01600000-0000-4000-8000-000000000414',
  '01600000-0000-4000-8000-000000000314',
  1,
  'Signals, Job Control & Scheduling',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Signals, Job Control &amp; Scheduling</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #052e16; color: #6ee7b7; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Signals, Job Control &amp; Scheduling</h1>
  <p>Stopping and resuming processes, and scheduling work to run unattended, are daily server operations.</p>
  <h2>Signals</h2>
  <p>A signal is a short, asynchronous message to a process. The four you will use most:</p>
  <table>
    <tr><th>Signal</th><th>Number</th><th>Meaning</th></tr>
    <tr><td>SIGTERM</td><td>15</td><td>Please exit gracefully (kill default)</td></tr>
    <tr><td>SIGHUP</td><td>1</td><td>Usually reload configuration</td></tr>
    <tr><td>SIGKILL</td><td>9</td><td>Force kill, cannot be caught</td></tr>
    <tr><td>SIGINT</td><td>2</td><td>Interrupt (Ctrl+C)</td></tr>
  </table>
  <pre class="code-block">kill 1234            # SIGTERM by PID
kill -HUP 1234       # reload
kill -9 1234         # last resort
pkill -f app.jar     # by command-line pattern</pre>
  <div class="callout">
    <strong>Graceful first</strong>
    <p>Always try <span class="ic">SIGTERM</span> before <span class="ic">SIGKILL</span>. A graceful exit lets the process flush state and close files; <span class="ic">-9</span> cuts it off mid-write.</p>
  </div>
  <h2>Foreground and background jobs</h2>
  <pre class="code-block">sleep 300 &           # run in the background immediately
jobs                  # list background jobs
fg                    # bring the latest job to the foreground
Ctrl+Z                # suspend the foreground job
bg                    # resume it in the background
nohup backup.sh &     # survive when you log out</pre>
  <h2>Scheduling with cron</h2>
  <pre class="code-block">crontab -e           # edit your schedule; 5 fields then the command</pre>
  <table>
    <tr><th>Field</th><th>Values</th></tr>
    <tr><td>minute</td><td>0-59</td></tr>
    <tr><td>hour</td><td>0-23</td></tr>
    <tr><td>day of month</td><td>1-31</td></tr>
    <tr><td>month</td><td>1-12</td></tr>
    <tr><td>day of week</td><td>0-7 (0 and 7 are Sunday)</td></tr>
  </table>
  <pre class="code-block">30 2 * * *  /opt/scripts/backup.sh    # every day at 02:30
*/5 * * * * /opt/scripts/health.sh    # every 5 minutes</pre>
  <div class="callout callout-tip">
    <strong>Log your cron output</strong>
    <p>Redirect output or it lands in the mail spool and gets black-holed:</p>
    <pre class="code-block">0 3 * * 1 /opt/scripts/report.sh &gt;&gt; /var/log/report.log 2&gt;&amp;1</pre>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01600000-0000-4000-8000-000000000416',
  '01600000-0000-4000-8000-000000000316',
  1,
  'Package Management with apt',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Package Management with apt</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #052e16; color: #6ee7b7; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Package Management with apt</h1>
  <p>Almost all software on a Debian/Ubuntu server arrives through <span class="ic">apt</span> - a high-level front end over <span class="ic">dpkg</span> that resolves dependencies and tracks what is installed.</p>
  <h2>The workflow</h2>
  <pre class="code-block">sudo apt update             # refresh the package index
sudo apt install nginx      # install a package
sudo apt remove nginx       # remove it
sudo apt purge nginx        # also delete its config files</pre>
  <div class="callout">
    <strong>update before install</strong>
    <p>On a fresh box, <span class="ic">apt install</span> without a prior <span class="ic">apt update</span> resolves against a stale index and can fail or install outdated versions.</p>
  </div>
  <h2>Upgrading the system</h2>
  <pre class="code-block">sudo apt upgrade            # upgrade installed packages
sudo apt full-upgrade       # upgrade even if it removes others</pre>
  <h2>Searching and inspecting</h2>
  <pre class="code-block">apt search "web server"     # find candidates
apt show nginx              # metadata: version, size, dependencies
apt list --installed        # what is already there
apt-cache policy nginx      # available vs installed version</pre>
  <h2>Working at the dpkg level</h2>
  <pre class="code-block">dpkg -l | grep nginx        # installed packages matching nginx
dpkg -S /etc/nginx/nginx.conf   # which package owns this file
dpkg -L nginx               # every file the package installed</pre>
  <h2>Holding and cleaning</h2>
  <pre class="code-block">sudo apt-mark hold nginx    # block accidental upgrades
sudo apt autoremove         # drop unused dependencies</pre>
  <div class="callout callout-tip">
    <strong>Config files live on</strong>
    <p><span class="ic">apt remove</span> keeps <span class="ic">/etc</span> changes; <span class="ic">purge</span> deletes them. Use <span class="ic">remove</span> while troubleshooting so you can reinstall without losing customizations.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01600000-0000-4000-8000-000000000417',
  '01600000-0000-4000-8000-000000000317',
  1,
  'Package Management Beyond apt',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Package Management Beyond apt</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #052e16; color: #6ee7b7; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Package Management Beyond apt</h1>
  <p>Different distributions and ecosystems use different package formats. A DevOps engineer recognizes all of them on sight.</p>
  <h2>Two families dominate the server world</h2>
  <table>
    <tr><th>Task</th><th>Debian/Ubuntu</th><th>RHEL/Amazon Linux</th></tr>
    <tr><td>Install</td><td>apt install X</td><td>dnf install X</td></tr>
    <tr><td>Upgrade all</td><td>apt upgrade</td><td>dnf upgrade</td></tr>
    <tr><td>Remove</td><td>apt remove X</td><td>dnf remove X</td></tr>
    <tr><td>Search</td><td>apt search X</td><td>dnf search X</td></tr>
  </table>
  <p>Repositories live in <span class="ic">/etc/apt/sources.list</span> on Debian and <span class="ic">/etc/yum.repos.d/</span> on RHEL systems.</p>
  <h2>Snaps and other formats</h2>
  <pre class="code-block">sudo snap install kubectl            # confined by default
sudo snap install certbot --classic  # classic where confinement blocks
snap list</pre>
  <p>You will also meet <span class="ic">flatpak</span>, AppImages, and language-manager installs such as <span class="ic">npm</span> and <span class="ic">pip</span>. They install into user or opt locations rather than the distro database.</p>
  <h2>Downloading one package</h2>
  <p>When a vendor ships a single file, you can install it directly - dependencies become your responsibility:</p>
  <pre class="code-block">wget https://example.com/pkg.deb
sudo apt install ./pkg.deb       # apt resolves its distro deps
sudo dpkg -i pkg.deb             # raw install, skips dependency checks</pre>
  <div class="callout">
    <strong>Know your supply chain</strong>
    <p>Prefer the distribution repositories, then vendor official repos, then third-party packages. Every source you add is a new place a compromised package could slip in.</p>
  </div>
  <h2>Check what you actually run</h2>
  <pre class="code-block">which nginx          # path used by PATH lookup
nginx -v             # version from the real binary</pre>
  <div class="callout callout-tip">
    <strong>One package manager per install</strong>
    <p>Mixing <span class="ic">dpkg -i</span> with <span class="ic">apt</span> over the same software can silently drift versions. Reinstall via apt to resync the database.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01600000-0000-4000-8000-000000000419',
  '01600000-0000-4000-8000-000000000319',
  1,
  'Bash Scripting Fundamentals',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bash Scripting Fundamentals</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #052e16; color: #6ee7b7; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Bash Scripting Fundamentals</h1>
  <p>A script is a file of commands executed together. Bash is the default shell on most Linux systems - the DevOps glue language.</p>
  <h2>Your first script</h2>
  <pre class="code-block">#!/bin/bash
# deps-check.sh - report whether nginx is installed
echo "Checking for nginx..."
if command -v nginx &gt;/dev/null 2&gt;&amp;1; then
  echo "nginx is installed: $(nginx -v 2&gt;&amp;1)"
else
  echo "nginx is missing"
  exit 1
fi</pre>
  <p>The shebang <span class="ic">#!/bin/bash</span> selects the interpreter. Make the file executable, then run it:</p>
  <pre class="code-block">chmod +x deps-check.sh
./deps-check.sh</pre>
  <h2>Variables, quoting, and expansion</h2>
  <pre class="code-block">APP_NAME="api"
echo "$APP_NAME"          # double quotes expand variables
echo '$APP_NAME'          # single quotes keep them literal
echo ${APP_NAME:-fallback}  # default value</pre>
  <div class="callout">
    <strong>Quote everything</strong>
    <p><span class="ic">"$var"</span> protects spaces. A bare <span class="ic">$var</span> is the classic source of &ldquo;argument not found&rdquo; bugs on files with spaces.</p>
  </div>
  <h2>Arguments and exit codes</h2>
  <pre class="code-block">echo "First arg: $1"    # first argument
echo "All args: $@"
echo "Count: $#"
echo "$?"               # exit status of the last command</pre>
  <h2>Conditionals</h2>
  <pre class="code-block">if [ -f /etc/nginx/nginx.conf ]; then
  echo "config exists"
elif [ -z "$1" ]; then
  echo "usage: $0 &lt;dir&gt;"
else
  echo "unknown"
fi</pre>
  <p>Common tests: <span class="ic">-f</span> file exists, <span class="ic">-d</span> directory, <span class="ic">-z</span> empty string, <span class="ic">=</span> string equal, <span class="ic">-lt</span> less than.</p>
  <div class="callout callout-tip">
    <strong>Check before you run</strong>
    <p><span class="ic">bash -n script.sh</span> checks syntax without executing. <span class="ic">shellcheck script.sh</span> (an external linter) catches the rest. Both belong in your workflow.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01600000-0000-4000-8000-000000000420',
  '01600000-0000-4000-8000-000000000320',
  1,
  'Scripting Patterns for DevOps',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Scripting Patterns for DevOps</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #052e16; color: #6ee7b7; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Scripting Patterns for DevOps</h1>
  <p>Real scripts are more than command lists: they loop, they take flags, they are idempotent, and they fail loudly.</p>
  <h2>Loops</h2>
  <pre class="code-block">for svc in nginx redis postgresql; do
  systemctl is-active "$svc" || echo "$svc is down"
done

while IFS= read -r server; do
  echo "Pinging $server"
  ping -c 1 "$server" &gt;/dev/null || echo "$server unreachable"
done &lt; servers.txt</pre>
  <h2>Functions</h2>
  <pre class="code-block">say() {
  local msg="$1"
  echo "[$(date '+%F %T')] $msg"
}
say "deploy started"</pre>
  <h2>A small deploy script</h2>
  <pre class="code-block">#!/bin/bash
set -euo pipefail                    # fail fast on any error
cd /srv/app
git pull --ff-only
npm ci --omit=dev
sudo systemctl restart app.service
echo "deployed branch: $(git rev-parse --short HEAD)"</pre>
  <div class="callout">
    <strong>set -euo pipefail</strong>
    <p><span class="ic">set -e</span> exits on error, <span class="ic">-u</span> treats unset variables as errors, and <span class="ic">pipefail</span> surfaces failures in the middle of pipelines. Start every production script with it.</p>
  </div>
  <h2>Idempotency: safe to re-run</h2>
  <pre class="code-block">if [ ! -d /srv/app ]; then
  sudo mkdir -p /srv/app
fi</pre>
  <p>Checks like this make a script safe to run twice, which is exactly what automation demands.</p>
  <div class="callout callout-tip">
    <strong>Make it repeatable</strong>
    <p>Design scripts to be re-runnable at any point. A script that only works on a brand-new box will fail a Monday-morning retry.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01600000-0000-4000-8000-000000000422',
  '01600000-0000-4000-8000-000000000322',
  1,
  'systemd & Service Units',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>systemd &amp; Service Units</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #052e16; color: #6ee7b7; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>systemd &amp; Service Units</h1>
  <p>systemd is the init system that PID 1 runs today on almost every mainstream Linux distribution. It starts, supervises, and logs the services you depend on.</p>
  <h2>The daily commands</h2>
  <pre class="code-block">sudo systemctl start nginx       # start now
sudo systemctl stop nginx        # stop
sudo systemctl restart nginx     # stop then start
sudo systemctl reload nginx      # re-read config, no downtime
sudo systemctl enable --now nginx   # start now + at every boot
systemctl status nginx           # state, PID, recent log tail</pre>
  <div class="callout">
    <strong>start vs enable</strong>
    <p><span class="ic">start</span> is for today; <span class="ic">enable</span> is for every boot. Forget <span class="ic">enable</span> and your service dies on the next reboot - the classic DevOps own-goal.</p>
  </div>
  <h2>Anatomy of a unit file</h2>
  <pre class="code-block">[Unit]
Description=Acme API server
After=network-online.target

[Service]
User=acme
WorkingDirectory=/srv/acme
ExecStart=/usr/bin/node server.js
Environment=NODE_ENV=production
EnvironmentFile=/etc/acme/env
Restart=on-failure

[Install]
WantedBy=multi-user.target</pre>
  <p>Place it at <span class="ic">/etc/systemd/system/acme.service</span>, then:</p>
  <pre class="code-block">sudo systemctl daemon-reload
sudo systemctl enable --now acme</pre>
  <div class="callout callout-tip">
    <strong>Restart=on-failure</strong>
    <p>systemd restarts the service after an error exit. For a web process this is often the difference between a blip and an outage.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01600000-0000-4000-8000-000000000423',
  '01600000-0000-4000-8000-000000000323',
  1,
  'Managing Services & the Journal',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Managing Services &amp; the Journal</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #052e16; color: #6ee7b7; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Managing Services &amp; the Journal</h1>
  <p>systemd is also the log backbone. The <strong>journal</strong> collects structured logs from systemd units, the kernel, and anything that logs to the system logger.</p>
  <h2>Inspecting units</h2>
  <pre class="code-block">systemctl list-units --type=service        # running/loaded services
systemctl list-unit-files | grep enabled   # what starts at boot
systemctl is-active nginx                  # active / inactive
systemctl is-enabled nginx                 # enabled / disabled</pre>
  <h2>Boot targets</h2>
  <pre class="code-block">systemctl get-default              # what boots: usually multi-user.target
sudo systemctl set-default graphical.target
sudo reboot                        # graceful reboot
sudo poweroff                      # shut down</pre>
  <h2>Reading the journal</h2>
  <pre class="code-block">journalctl -u nginx.service            # all entries for the unit
journalctl -u nginx.service -n 50      # last 50 lines
journalctl -f                          # follow, like tail -f
journalctl --since "1 hour ago"
journalctl -p err                      # errors and worse</pre>
  <p>The journal lives in <span class="ic">/run/log/journal</span> (lost on reboot) unless persistent storage is enabled, which keeps it in <span class="ic">/var/log/journal</span>. Classic syslog apps also write plain files under <span class="ic">/var/log</span>, like <span class="ic">/var/log/syslog</span>.</p>
  <div class="callout">
    <strong>journalctl -xe is your friend</strong>
    <p><span class="ic">-x</span> decodes unit descriptions and hints, <span class="ic">-e</span> jumps to the newest entries - the fastest way to see why a service just failed.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Follow your own service</strong>
    <p>When you deploy something new, keep <span class="ic">journalctl -fu unit</span> open in a terminal. You will see startup errors the moment they happen.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01600000-0000-4000-8000-000000000425',
  '01600000-0000-4000-8000-000000000325',
  1,
  'Networking Tools',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Networking Tools</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #052e16; color: #6ee7b7; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Networking Tools</h1>
  <p>Every service eventually comes down to sockets. These tools answer the four questions that dominate DevOps debugging: is the host up, is the port open, what does the server answer, and who listens where.</p>
  <h2>Interface and routing state</h2>
  <pre class="code-block">ip addr         # addresses on every interface
ip link         # interface state: UP or DOWN
ip route        # the routing table
hostname -I     # concise IP list</pre>
  <h2>Listening sockets: ss</h2>
  <pre class="code-block">ss -tlnp        # TCP listening sockets + the owning process
ss -tulnp       # also UDP
ss -an          # all connections, no resolver</pre>
  <div class="callout">
    <strong>ss replaces netstat</strong>
    <p>Old tutorials say <span class="ic">netstat</span>. On modern systems <span class="ic">ss</span> is the default (and faster) tool. <span class="ic">-p</span> shows the process - the &ldquo;which app owns this port?&rdquo; answer.</p>
  </div>
  <h2>Reachability and DNS</h2>
  <pre class="code-block">ping -c 4 example.com    # host reachable?
dig example.com          # full DNS answer
dig +short example.com   # just the address
getent hosts example.com # system resolution</pre>
  <h2>HTTP checks with curl</h2>
  <pre class="code-block">curl -I http://localhost       # headers only, fast health check
curl -v http://localhost       # verbose exchange, great for TLS
curl -o /dev/null -s -w '%{http_code}' http://localhost</pre>
  <h2>Moving files over the network</h2>
  <pre class="code-block">scp backup.tgz user@host:/srv/backups/
rsync -av /srv/app/ user@host:/srv/app/   # incremental sync over ssh
ssh -i ~/.ssh/id_ed25519 user@host</pre>
  <div class="callout callout-tip">
    <strong>Test locally before blaming the network</strong>
    <p><span class="ic">curl http://localhost:8080</span> first. If it works locally but not remotely, it is the firewall or the bound interface - not your app.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01600000-0000-4000-8000-000000000426',
  '01600000-0000-4000-8000-000000000326',
  1,
  'Logs & Monitoring',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Logs &amp; Monitoring</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #052e16; color: #6ee7b7; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Logs &amp; Monitoring</h1>
  <p>Logs tell you what happened; monitoring tells you when to look. A healthy ops habit is: know where your logs live, rotate them, and check a short set of numbers daily.</p>
  <h2>Where logs live</h2>
  <table>
    <tr><th>Location</th><th>Content</th></tr>
    <tr><td>/var/log/syslog</td><td>General system messages (Debian/Ubuntu)</td></tr>
    <tr><td>/var/log/auth.log</td><td>Logins, sudo, SSH activity</td></tr>
    <tr><td>/var/log/kern.log</td><td>Kernel messages (hardware, OOM)</td></tr>
    <tr><td>/var/log/nginx/</td><td>Web server access and error logs</td></tr>
  </table>
  <p>systemd services log to the journal (<span class="ic">journalctl -u unit</span>). Many also write their own files under <span class="ic">/var/log</span>, so check both.</p>
  <h2>Reading logs efficiently</h2>
  <pre class="code-block">tail -f /var/log/auth.log          # watch login attempts live
grep -i "failed" /var/log/auth.log | tail -n 20
journalctl -u nginx -p err --since "2 hours ago"</pre>
  <h2>logrotate: keep the disk healthy</h2>
  <p><span class="ic">logrotate</span> renames, compresses, and prunes old logs from <span class="ic">/etc/logrotate.d/</span>:</p>
  <pre class="code-block">/var/log/myapp/*.log {
  daily
  rotate 14
  compress
  missingok
  notifempty
}</pre>
  <div class="callout">
    <strong>A full /var is a silent killer</strong>
    <p>When the disk that holds <span class="ic">/var/log</span> fills up, apps fail, logins break, and cron silently dies. Rotation is the first line of defense; <span class="ic">df -h</span> and <span class="ic">df -i</span> are the daily check.</p>
  </div>
  <h2>The five-number health check</h2>
  <pre class="code-block">uptime          # load versus cores
free -h         # memory pressure
df -h           # disk space
df -i           # inodes
systemctl --failed   # any unit in a failed state</pre>
  <div class="callout callout-tip">
    <strong>Read logs backwards in time</strong>
    <p>An error that seems to appear on its own is usually the last in a chain. Find the first unusual line before the crash, not the loudest one after it.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01600000-0000-4000-8000-000000000427',
  '01600000-0000-4000-8000-000000000327',
  1,
  'Capstone: Provisioning a Web Server',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Provisioning a Web Server</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #052e16; color: #6ee7b7; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Provisioning a Web Server</h1>
  <p>The capstone pulls the whole course together: provision a fresh Ubuntu server, install and run Nginx, harden it with a firewall, and verify a real HTTP response. Do this on a VM or a cheap cloud instance.</p>
  <h2>1. Update and install</h2>
  <pre class="code-block">sudo apt update
sudo apt install -y nginx
nginx -v                    # sanity check</pre>
  <h2>2. Start it, and make it survive reboots</h2>
  <pre class="code-block">sudo systemctl enable --now nginx
systemctl status nginx --no-pager</pre>
  <p>Leave this terminal open and follow the service&rsquo;s journal in another:</p>
  <pre class="code-block">journalctl -fu nginx.service</pre>
  <h2>3. Let traffic through the firewall</h2>
  <pre class="code-block">sudo ufw allow OpenSSH
sudo ufw allow 'Nginx Full'       # ports 80 and 443
sudo ufw enable
sudo ufw status verbose</pre>
  <div class="callout">
    <strong>Allow SSH first</strong>
    <p>The classic lockout: <span class="ic">ufw enable</span> with no allow rule drops your SSH session instantly. Whitelist OpenSSH before you enable the firewall.</p>
  </div>
  <h2>4. Verify end to end</h2>
  <pre class="code-block">curl -I http://localhost
ss -tlnp | grep :80
curl -I http://1.2.3.4       # from your laptop</pre>
  <p>You should see <span class="ic">HTTP/1.1 200 OK</span>. The default page is Nginx&rsquo;s welcome file at <span class="ic">/var/www/html/index.nginx-debian.html</span>.</p>
  <h2>5. Make it yours</h2>
  <pre class="code-block">echo "&lt;h1&gt;Hello from $(hostname)&lt;/h1&gt;" | sudo tee /var/www/html/index.html</pre>
  <div class="callout callout-tip">
    <strong>The deliverable</strong>
    <p>A server that answers HTTP after a reboot, with SSH keys, a firewall, and logs you can read. That is a production-ready floor for any future service you deploy.</p>
  </div>
</div>
</body>
</html>
$html$
)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 6. QUIZZES  (29 questions)
--    Q1-3 for lesson 303 - Q4-6 for 306 - Q7-9 for 309 - Q10-12 for 312
--    Q13-15 for 315 - Q16-18 for 318 - Q19-21 for 321 - Q22-24 for 324
--    Q25-29 for final assessment 328.
-- ----------------------------------------------------------------------------

INSERT INTO quizzes (id, lesson_id, question, explanation, position) VALUES
  ('01600000-0000-4000-8000-000000000501', '01600000-0000-4000-8000-000000000303',
   'Which top-level directory holds most system-wide configuration files?',
   '/etc stores configuration; /var holds variable data such as logs, and /usr holds executables.', 1),
  ('01600000-0000-4000-8000-000000000502', '01600000-0000-4000-8000-000000000303',
   'Which command prints the full path of your current directory?',
   'pwd stands for print working directory and prints where you are right now.', 2),
  ('01600000-0000-4000-8000-000000000503', '01600000-0000-4000-8000-000000000303',
   'In a listing, the entry named .. inside a directory points to what?',
   '.. is the parent of the current directory; a single . is the directory itself.', 3),
  ('01600000-0000-4000-8000-000000000504', '01600000-0000-4000-8000-000000000306',
   'Which command copies a directory and all of its contents?',
   'cp copies files; you must add -r to copy directories recursively.', 1),
  ('01600000-0000-4000-8000-000000000505', '01600000-0000-4000-8000-000000000306',
   'What does tail -f /var/log/syslog do?',
   'The -f flag follows the file, printing new lines as they are appended - essential for watching logs live.', 2),
  ('01600000-0000-4000-8000-000000000506', '01600000-0000-4000-8000-000000000306',
   'Which command prints lines that match a text pattern?',
   'grep searches files line by line and prints matches, for example grep error /var/log/syslog.', 3),
  ('01600000-0000-4000-8000-000000000507', '01600000-0000-4000-8000-000000000309',
   'Which file stores account details such as the UID and home directory?',
   '/etc/passwd lists accounts; password hashes live in the shadow file.', 1),
  ('01600000-0000-4000-8000-000000000508', '01600000-0000-4000-8000-000000000309',
   'What is the UID of the root account?',
   'root is always UID 0; normal human users usually start at 1000.', 2),
  ('01600000-0000-4000-8000-000000000509', '01600000-0000-4000-8000-000000000309',
   'Which file must be edited to grant a user sudo rights, and only via its dedicated editor?',
   '/etc/sudoers is edited with visudo, which validates syntax before saving.', 3),
  ('01600000-0000-4000-8000-000000000510', '01600000-0000-4000-8000-000000000312',
   'The permission string -rwxr-xr-- decodes to which octal mode?',
   'Owner rwx is 7, group r-x is 5, other r-- is 4, so the mode is 754.', 1),
  ('01600000-0000-4000-8000-000000000511', '01600000-0000-4000-8000-000000000312',
   'Which command changes the owner and the group of a file?',
   'chown user:group file sets the owning user and the owning group in one call.', 2),
  ('01600000-0000-4000-8000-000000000512', '01600000-0000-4000-8000-000000000312',
   'Which command prints the permission mask applied by default to newly created files?',
   'umask shows or sets the default mask; a 022 mask makes new files 644 and directories 755.', 3),
  ('01600000-0000-4000-8000-000000000513', '01600000-0000-4000-8000-000000000315',
   'Which command shows every process running on the system, including other users?',
   'ps aux displays all processes; top or htop gives an always-updating view.', 1),
  ('01600000-0000-4000-8000-000000000514', '01600000-0000-4000-8000-000000000315',
   'What does kill (with no options) send to a process by default?',
   'kill sends SIGTERM (15), which asks the process to shut down gracefully; SIGKILL (9) cannot be caught.', 2),
  ('01600000-0000-4000-8000-000000000515', '01600000-0000-4000-8000-000000000315',
   'A command was started in the background with &.  Which command resumes it in the foreground?',
   'fg brings the most recent background job back into the foreground.', 3),
  ('01600000-0000-4000-8000-000000000516', '01600000-0000-4000-8000-000000000318',
   'On a fresh Debian or Ubuntu server, what must you run before installing a package?',
   'apt update refreshes the local package index so install resolves available versions correctly.', 1),
  ('01600000-0000-4000-8000-000000000517', '01600000-0000-4000-8000-000000000318',
   'Which command removes packages installed as dependencies that are no longer required?',
   'apt autoremove cleans up unused dependencies left behind by past removals.', 2),
  ('01600000-0000-4000-8000-000000000518', '01600000-0000-4000-8000-000000000318',
   'Which file defines the apt repositories a Debian system installs from?',
   '/etc/apt/sources.list (plus files in /etc/apt/sources.list.d/) lists the configured mirrors.', 3),
  ('01600000-0000-4000-8000-000000000519', '01600000-0000-4000-8000-000000000321',
   'What does the first line of a Bash script, #!/bin/bash, do?',
   'The shebang tells the operating system which interpreter to use when the file is executed.', 1),
  ('01600000-0000-4000-8000-000000000520', '01600000-0000-4000-8000-000000000321',
   'After any command finishes, what does $? contain?',
   '$? holds the exit status of the most recent command; 0 means success and any non-zero value means failure.', 2),
  ('01600000-0000-4000-8000-000000000521', '01600000-0000-4000-8000-000000000321',
   'Which line placed at the top of a script makes it abort on the first failing command?',
   'set -e exits the script as soon as a command returns a non-zero status.', 3),
  ('01600000-0000-4000-8000-000000000522', '01600000-0000-4000-8000-000000000324',
   'After adding a new unit file under /etc/systemd/system, which command re-reads the configuration?',
   'systemctl daemon-reload scans for changed unit files so your edits are honored.', 1),
  ('01600000-0000-4000-8000-000000000523', '01600000-0000-4000-8000-000000000324',
   'Which command makes a service start automatically when the machine boots?',
   'systemctl enable registers the unit to start at boot; enable --now also starts it immediately.', 2),
  ('01600000-0000-4000-8000-000000000524', '01600000-0000-4000-8000-000000000324',
   'Which setting in a service unit restarts a service after it stops because of an error?',
   'Restart=on-failure tells systemd to relaunch the service when it exits with a non-zero status.', 3),
  ('01600000-0000-4000-8000-000000000525', '01600000-0000-4000-8000-000000000328',
   'Which command lists the ports a process is currently listening on?',
   'ss -tlnp shows TCP listening sockets with the owning process via -p.', 1),
  ('01600000-0000-4000-8000-000000000526', '01600000-0000-4000-8000-000000000328',
   'Which tools copy files to a remote host over SSH?',
   'scp and rsync both transfer over SSH; rsync adds delta transfer and is ideal for syncs.', 2),
  ('01600000-0000-4000-8000-000000000527', '01600000-0000-4000-8000-000000000328',
   'Which command shows error-priority log entries for nginx.service?',
   'journalctl -u nginx.service -p err filters the journal to error-and-worse entries for that unit.', 3),
  ('01600000-0000-4000-8000-000000000528', '01600000-0000-4000-8000-000000000328',
   'After installing nginx with apt, which single command starts it now and at boot?',
   'systemctl enable --now nginx combines enable (at boot) and start (now) in one call.', 4),
  ('01600000-0000-4000-8000-000000000529', '01600000-0000-4000-8000-000000000328',
   'Which command shows disk space usage for each mounted filesystem?',
   'df -h reports filesystem capacity and usage in human-readable units; du measures directory sizes.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; exactly one is correct, positions vary.
--    Q1 options 1001-1012 - Q2 1013-1024 - Q3 1025-1036 - Q4 1037-1048
--    Q5 1049-1060 - Q6 1061-1072 - Q7 1073-1084 - Q8 1085-1096 - Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): /etc
  ('01600000-0000-4000-8000-000000001001', '01600000-0000-4000-8000-000000000501', '/etc', TRUE,  1),
  ('01600000-0000-4000-8000-000000001002', '01600000-0000-4000-8000-000000000501', '/usr', FALSE, 2),
  ('01600000-0000-4000-8000-000000001003', '01600000-0000-4000-8000-000000000501', '/var', FALSE, 3),
  ('01600000-0000-4000-8000-000000001004', '01600000-0000-4000-8000-000000000501', '/bin', FALSE, 4),
  -- Q1 (501)q2: pwd
  ('01600000-0000-4000-8000-000000001005', '01600000-0000-4000-8000-000000000502', 'ls', FALSE, 1),
  ('01600000-0000-4000-8000-000000001006', '01600000-0000-4000-8000-000000000502', 'pwd', TRUE,  2),
  ('01600000-0000-4000-8000-000000001007', '01600000-0000-4000-8000-000000000502', 'cd', FALSE, 3),
  ('01600000-0000-4000-8000-000000001008', '01600000-0000-4000-8000-000000000502', 'whoami', FALSE, 4),
  -- Q1 (501)q3: ..
  ('01600000-0000-4000-8000-000000001009', '01600000-0000-4000-8000-000000000503', 'A hidden file', FALSE, 1),
  ('01600000-0000-4000-8000-000000001010', '01600000-0000-4000-8000-000000000503', 'The root filesystem', FALSE, 2),
  ('01600000-0000-4000-8000-000000001011', '01600000-0000-4000-8000-000000000503', 'Its parent directory', TRUE,  3),
  ('01600000-0000-4000-8000-000000001012', '01600000-0000-4000-8000-000000000503', 'A symlink', FALSE, 4),
  -- Q2 (504): cp -r
  ('01600000-0000-4000-8000-000000001013', '01600000-0000-4000-8000-000000000504', 'mv source destination', FALSE, 1),
  ('01600000-0000-4000-8000-000000001014', '01600000-0000-4000-8000-000000000504', 'ln -s source destination', FALSE, 2),
  ('01600000-0000-4000-8000-000000001015', '01600000-0000-4000-8000-000000000504', 'rm -r source', FALSE, 3),
  ('01600000-0000-4000-8000-000000001016', '01600000-0000-4000-8000-000000000504', 'cp -r source destination', TRUE,  4),
  -- Q2 (504)q2: tail -f
  ('01600000-0000-4000-8000-000000001017', '01600000-0000-4000-8000-000000000505', 'Formats the file for printing', FALSE, 1),
  ('01600000-0000-4000-8000-000000001018', '01600000-0000-4000-8000-000000000505', 'Deletes lines matching a pattern', FALSE, 2),
  ('01600000-0000-4000-8000-000000001019', '01600000-0000-4000-8000-000000000505', 'Follows the file, showing new lines as they are written', TRUE,  3),
  ('01600000-0000-4000-8000-000000001020', '01600000-0000-4000-8000-000000000505', 'Displays only the first ten lines', FALSE, 4),
  -- Q2 (504)q3: grep
  ('01600000-0000-4000-8000-000000001021', '01600000-0000-4000-8000-000000000506', 'wc', FALSE, 1),
  ('01600000-0000-4000-8000-000000001022', '01600000-0000-4000-8000-000000000506', 'sort', FALSE, 2),
  ('01600000-0000-4000-8000-000000001023', '01600000-0000-4000-8000-000000000506', 'cut', FALSE, 3),
  ('01600000-0000-4000-8000-000000001024', '01600000-0000-4000-8000-000000000506', 'grep', TRUE,  4),
  -- Q3 (507): /etc/passwd
  ('01600000-0000-4000-8000-000000001025', '01600000-0000-4000-8000-000000000507', '/etc/shadow', FALSE, 1),
  ('01600000-0000-4000-8000-000000001026', '01600000-0000-4000-8000-000000000507', '/etc/passwd', TRUE,  2),
  ('01600000-0000-4000-8000-000000001027', '01600000-0000-4000-8000-000000000507', '/etc/group', FALSE, 3),
  ('01600000-0000-4000-8000-000000001028', '01600000-0000-4000-8000-000000000507', '/etc/hosts', FALSE, 4),
  -- Q3 (507)q2: UID 0
  ('01600000-0000-4000-8000-000000001029', '01600000-0000-4000-8000-000000000508', '0', TRUE,  1),
  ('01600000-0000-4000-8000-000000001030', '01600000-0000-4000-8000-000000000508', '100', FALSE, 2),
  ('01600000-0000-4000-8000-000000001031', '01600000-0000-4000-8000-000000000508', '1000', FALSE, 3),
  ('01600000-0000-4000-8000-000000001032', '01600000-0000-4000-8000-000000000508', '1', FALSE, 4),
  -- Q3 (507)q3: sudoers via visudo
  ('01600000-0000-4000-8000-000000001033', '01600000-0000-4000-8000-000000000509', '/etc/group (via vim)', FALSE, 1),
  ('01600000-0000-4000-8000-000000001034', '01600000-0000-4000-8000-000000000509', '/etc/profile (via visudo)', FALSE, 2),
  ('01600000-0000-4000-8000-000000001035', '01600000-0000-4000-8000-000000000509', '/etc/sudoers (via visudo)', TRUE,  3),
  ('01600000-0000-4000-8000-000000001036', '01600000-0000-4000-8000-000000000509', '/etc/sudoers (via vim)', FALSE, 4),
  -- Q4 (510): 754
  ('01600000-0000-4000-8000-000000001037', '01600000-0000-4000-8000-000000000510', '751', FALSE, 1),
  ('01600000-0000-4000-8000-000000001038', '01600000-0000-4000-8000-000000000510', '754', TRUE,  2),
  ('01600000-0000-4000-8000-000000001039', '01600000-0000-4000-8000-000000000510', '744', FALSE, 3),
  ('01600000-0000-4000-8000-000000001040', '01600000-0000-4000-8000-000000000510', '765', FALSE, 4),
  -- Q4 (510)q2: chown
  ('01600000-0000-4000-8000-000000001041', '01600000-0000-4000-8000-000000000511', 'chown', TRUE,  1),
  ('01600000-0000-4000-8000-000000001042', '01600000-0000-4000-8000-000000000511', 'chmod', FALSE, 2),
  ('01600000-0000-4000-8000-000000001043', '01600000-0000-4000-8000-000000000511', 'umask', FALSE, 3),
  ('01600000-0000-4000-8000-000000001044', '01600000-0000-4000-8000-000000000511', 'setfacl', FALSE, 4),
  -- Q4 (510)q3: umask
  ('01600000-0000-4000-8000-000000001045', '01600000-0000-4000-8000-000000000512', 'chmod', FALSE, 1),
  ('01600000-0000-4000-8000-000000001046', '01600000-0000-4000-8000-000000000512', 'chattr', FALSE, 2),
  ('01600000-0000-4000-8000-000000001047', '01600000-0000-4000-8000-000000000512', 'chgrp', FALSE, 3),
  ('01600000-0000-4000-8000-000000001048', '01600000-0000-4000-8000-000000000512', 'umask', TRUE,  4),
  -- Q5 (513): ps aux
  ('01600000-0000-4000-8000-000000001049', '01600000-0000-4000-8000-000000000513', 'jobs', FALSE, 1),
  ('01600000-0000-4000-8000-000000001050', '01600000-0000-4000-8000-000000000513', 'ps aux', TRUE,  2),
  ('01600000-0000-4000-8000-000000001051', '01600000-0000-4000-8000-000000000513', 'hostname', FALSE, 3),
  ('01600000-0000-4000-8000-000000001052', '01600000-0000-4000-8000-000000000513', 'crontab -l', FALSE, 4),
  -- Q5 (513)q2: SIGTERM
  ('01600000-0000-4000-8000-000000001053', '01600000-0000-4000-8000-000000000514', 'SIGKILL, an unblockable force stop', FALSE, 1),
  ('01600000-0000-4000-8000-000000001054', '01600000-0000-4000-8000-000000000514', 'SIGHUP, a reload signal', FALSE, 2),
  ('01600000-0000-4000-8000-000000001055', '01600000-0000-4000-8000-000000000514', 'SIGINT, an interrupt', FALSE, 3),
  ('01600000-0000-4000-8000-000000001056', '01600000-0000-4000-8000-000000000514', 'SIGTERM, a request to exit gracefully', TRUE,  4),
  -- Q5 (513)q3: fg
  ('01600000-0000-4000-8000-000000001057', '01600000-0000-4000-8000-000000000515', 'bg', FALSE, 1),
  ('01600000-0000-4000-8000-000000001058', '01600000-0000-4000-8000-000000000515', 'disown', FALSE, 2),
  ('01600000-0000-4000-8000-000000001059', '01600000-0000-4000-8000-000000000515', 'jobs', FALSE, 3),
  ('01600000-0000-4000-8000-000000001060', '01600000-0000-4000-8000-000000000515', 'fg', TRUE,  4),
  -- Q6 (516): apt update
  ('01600000-0000-4000-8000-000000001061', '01600000-0000-4000-8000-000000000516', 'apt autoremove', FALSE, 1),
  ('01600000-0000-4000-8000-000000001062', '01600000-0000-4000-8000-000000000516', 'dpkg -i', FALSE, 2),
  ('01600000-0000-4000-8000-000000001063', '01600000-0000-4000-8000-000000000516', 'apt show', FALSE, 3),
  ('01600000-0000-4000-8000-000000001064', '01600000-0000-4000-8000-000000000516', 'apt update', TRUE,  4),
  -- Q6 (516)q2: apt autoremove
  ('01600000-0000-4000-8000-000000001065', '01600000-0000-4000-8000-000000000517', 'apt search', FALSE, 1),
  ('01600000-0000-4000-8000-000000001066', '01600000-0000-4000-8000-000000000517', 'apt autoremove', TRUE,  2),
  ('01600000-0000-4000-8000-000000001067', '01600000-0000-4000-8000-000000000517', 'apt full-upgrade', FALSE, 3),
  ('01600000-0000-4000-8000-000000001068', '01600000-0000-4000-8000-000000000517', 'apt list --upgradable', FALSE, 4),
  -- Q6 (516)q3: sources.list
  ('01600000-0000-4000-8000-000000001069', '01600000-0000-4000-8000-000000000518', '/etc/apt/sources.list', TRUE,  1),
  ('01600000-0000-4000-8000-000000001070', '01600000-0000-4000-8000-000000000518', '/etc/dpkg/install', FALSE, 2),
  ('01600000-0000-4000-8000-000000001071', '01600000-0000-4000-8000-000000000518', '/var/lib/apt/db', FALSE, 3),
  ('01600000-0000-4000-8000-000000001072', '01600000-0000-4000-8000-000000000518', '/usr/share/sources', FALSE, 4),
  -- Q7 (519): shebang
  ('01600000-0000-4000-8000-000000001073', '01600000-0000-4000-8000-000000000519', 'Comments out the script', FALSE, 1),
  ('01600000-0000-4000-8000-000000001074', '01600000-0000-4000-8000-000000000519', 'Makes the script executable', FALSE, 2),
  ('01600000-0000-4000-8000-000000001075', '01600000-0000-4000-8000-000000000519', 'Defines the first variable', FALSE, 3),
  ('01600000-0000-4000-8000-000000001076', '01600000-0000-4000-8000-000000000519', 'Selects the interpreter used to run the script', TRUE,  4),
  -- Q7 (519)q2: $?
  ('01600000-0000-4000-8000-000000001077', '01600000-0000-4000-8000-000000000520', 'The PID of the previous command', FALSE, 1),
  ('01600000-0000-4000-8000-000000001078', '01600000-0000-4000-8000-000000000520', 'The number of arguments passed', FALSE, 2),
  ('01600000-0000-4000-8000-000000001079', '01600000-0000-4000-8000-000000000520', 'The exit status of the previous command', TRUE,  3),
  ('01600000-0000-4000-8000-000000001080', '01600000-0000-4000-8000-000000000520', 'The current working directory', FALSE, 4),
  -- Q7 (519)q3: set -e
  ('01600000-0000-4000-8000-000000001081', '01600000-0000-4000-8000-000000000521', 'set -x', FALSE, 1),
  ('01600000-0000-4000-8000-000000001082', '01600000-0000-4000-8000-000000000521', 'set -n', FALSE, 2),
  ('01600000-0000-4000-8000-000000001083', '01600000-0000-4000-8000-000000000521', 'export -e', FALSE, 3),
  ('01600000-0000-4000-8000-000000001084', '01600000-0000-4000-8000-000000000521', 'set -e', TRUE,  4),
  -- Q8 (522): daemon-reload
  ('01600000-0000-4000-8000-000000001085', '01600000-0000-4000-8000-000000000522', 'systemctl daemon-reload', TRUE,  1),
  ('01600000-0000-4000-8000-000000001086', '01600000-0000-4000-8000-000000000522', 'systemctl reboot', FALSE, 2),
  ('01600000-0000-4000-8000-000000001087', '01600000-0000-4000-8000-000000000522', 'systemctl target', FALSE, 3),
  ('01600000-0000-4000-8000-000000001088', '01600000-0000-4000-8000-000000000522', 'systemctl restart', FALSE, 4),
  -- Q8 (522)q2: enable at boot
  ('01600000-0000-4000-8000-000000001089', '01600000-0000-4000-8000-000000000523', 'systemctl start', FALSE, 1),
  ('01600000-0000-4000-8000-000000001090', '01600000-0000-4000-8000-000000000523', 'systemctl enable', TRUE,  2),
  ('01600000-0000-4000-8000-000000001091', '01600000-0000-4000-8000-000000000523', 'systemctl status', FALSE, 3),
  ('01600000-0000-4000-8000-000000001092', '01600000-0000-4000-8000-000000000523', 'systemctl list-units', FALSE, 4),
  -- Q8 (522)q3: Restart=on-failure
  ('01600000-0000-4000-8000-000000001093', '01600000-0000-4000-8000-000000000524', 'Restart=no', FALSE, 1),
  ('01600000-0000-4000-8000-000000001094', '01600000-0000-4000-8000-000000000524', 'StartMode=always', FALSE, 2),
  ('01600000-0000-4000-8000-000000001095', '01600000-0000-4000-8000-000000000524', 'KeepAlive=true', FALSE, 3),
  ('01600000-0000-4000-8000-000000001096', '01600000-0000-4000-8000-000000000524', 'Restart=on-failure', TRUE,  4),
  -- Q9 (525): ss
  ('01600000-0000-4000-8000-000000001097', '01600000-0000-4000-8000-000000000525', 'ss -tlnp', TRUE,  1),
  ('01600000-0000-4000-8000-000000001098', '01600000-0000-4000-8000-000000000525', 'top -l', FALSE, 2),
  ('01600000-0000-4000-8000-000000001099', '01600000-0000-4000-8000-000000000525', 'who -a', FALSE, 3),
  ('01600000-0000-4000-8000-000000001100', '01600000-0000-4000-8000-000000000525', 'uname -r', FALSE, 4),
  -- Q9 (525)q2: scp/rsync
  ('01600000-0000-4000-8000-000000001101', '01600000-0000-4000-8000-000000000526', 'cp and ln', FALSE, 1),
  ('01600000-0000-4000-8000-000000001102', '01600000-0000-4000-8000-000000000526', 'cat and tee', FALSE, 2),
  ('01600000-0000-4000-8000-000000001103', '01600000-0000-4000-8000-000000000526', 'dd and find', FALSE, 3),
  ('01600000-0000-4000-8000-000000001104', '01600000-0000-4000-8000-000000000526', 'scp and rsync', TRUE,  4),
  -- Q9 (525)q3: journalctl err
  ('01600000-0000-4000-8000-000000001105', '01600000-0000-4000-8000-000000000527', 'tail /etc/nginx/nginx.conf', FALSE, 1),
  ('01600000-0000-4000-8000-000000001106', '01600000-0000-4000-8000-000000000527', 'ls /var/log/nginx', FALSE, 2),
  ('01600000-0000-4000-8000-000000001107', '01600000-0000-4000-8000-000000000527', 'systemctl set-default', FALSE, 3),
  ('01600000-0000-4000-8000-000000001108', '01600000-0000-4000-8000-000000000527', 'journalctl -u nginx.service -p err', TRUE,  4),
  -- Q9 (525)q4: enable --now
  ('01600000-0000-4000-8000-000000001109', '01600000-0000-4000-8000-000000000528', 'nginx --foreground', FALSE, 1),
  ('01600000-0000-4000-8000-000000001110', '01600000-0000-4000-8000-000000000528', 'systemctl enable --now nginx', TRUE,  2),
  ('01600000-0000-4000-8000-000000001111', '01600000-0000-4000-8000-000000000528', 'apt service nginx', FALSE, 3),
  ('01600000-0000-4000-8000-000000001112', '01600000-0000-4000-8000-000000000528', 'sh nginx start', FALSE, 4),
  -- Q9 (525)q5: df -h
  ('01600000-0000-4000-8000-000000001113', '01600000-0000-4000-8000-000000000529', 'top -m', FALSE, 1),
  ('01600000-0000-4000-8000-000000001114', '01600000-0000-4000-8000-000000000529', 'uptime -d', FALSE, 2),
  ('01600000-0000-4000-8000-000000001115', '01600000-0000-4000-8000-000000000529', 'ps -d', FALSE, 3),
  ('01600000-0000-4000-8000-000000001116', '01600000-0000-4000-8000-000000000529', 'df -h', TRUE,  4)
ON CONFLICT (id) DO NOTHING;
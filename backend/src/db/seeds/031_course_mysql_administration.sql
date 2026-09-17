-- ============================================================================
-- SEED 031: Complete course — "MySQL Administration"
-- ----------------------------------------------------------------------------
-- Instructor : Anita Patel        (10000000-0000-4000-8000-000000000003)
-- Category   : Database & Administration (20000000-0000-4000-8000-000000000008)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
-- Position   : 29
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 MySQL Foundations             → C1 Introducing MySQL · C2 Configuration & Exploration
--   M2 User Accounts & Security      → C3 User Accounts & Privileges · C4 Security Hardening
--   M3 Storage Engines & Schema      → C5 Storage Engines · C6 Schema Design
--   M4 Query Performance             → C7 Indexing · C8 Query Optimization
--   M5 Operations & Capstone         → C9 Backup & Recovery · C10 High Availability & Capstone
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
  '01F00000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000003',
  '20000000-0000-4000-8000-000000000008',
  'MySQL Administration',
  'mysql-administration',
  'Run MySQL like a professional DBA. Install and configure the server, manage user accounts and privileges, secure it, design sound schemas, tune queries with indexing and EXPLAIN, and keep production data safe with backups, replication, and monitoring.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  29
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('01F00000-0000-4000-8000-000000000011', '01F00000-0000-4000-8000-000000000001', 'Install and configure a MySQL server for your own environment.',                  1),
  ('01F00000-0000-4000-8000-000000000012', '01F00000-0000-4000-8000-000000000001', 'Create user accounts and grant least-privilege access with roles.',             2),
  ('01F00000-0000-4000-8000-000000000013', '01F00000-0000-4000-8000-000000000001', 'Harden a MySQL server against credential and network attacks.',                3),
  ('01F00000-0000-4000-8000-000000000014', '01F00000-0000-4000-8000-000000000001', 'Design efficient schemas and use indexes plus EXPLAIN to keep queries fast.',   4),
  ('01F00000-0000-4000-8000-000000000015', '01F00000-0000-4000-8000-000000000001', 'Protect data with backups, replication, and monitoring in a real capstone.',    5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('01F00000-0000-4000-8000-000000000101', '01F00000-0000-4000-8000-000000000001', 1, 'MySQL Foundations',             'Install, configure, and explore a running MySQL server.',        'PUBLISHED'),
  ('01F00000-0000-4000-8000-000000000102', '01F00000-0000-4000-8000-000000000001', 2, 'User Accounts & Security',      'Create accounts, grant least-privilege access, and harden it.',  'PUBLISHED'),
  ('01F00000-0000-4000-8000-000000000103', '01F00000-0000-4000-8000-000000000001', 3, 'Storage Engines & Schema',      'Understand engines and transactions; model data correctly.',     'PUBLISHED'),
  ('01F00000-0000-4000-8000-000000000104', '01F00000-0000-4000-8000-000000000001', 4, 'Query Performance',             'Use indexes and execution plans to keep queries fast.',          'PUBLISHED'),
  ('01F00000-0000-4000-8000-000000000105', '01F00000-0000-4000-8000-000000000001', 5, 'Operations & Capstone',         'Back up, replicate, monitor, and complete the admin capstone.',  'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('01F00000-0000-4000-8000-000000000201', '01F00000-0000-4000-8000-000000000101', 1, 'Introducing MySQL',              'What MySQL is and how the pieces fit together.',                 'PUBLISHED'),
  ('01F00000-0000-4000-8000-000000000202', '01F00000-0000-4000-8000-000000000101', 2, 'Configuration & Exploration',     'Options files, system variables, and the client toolkit.',       'PUBLISHED'),
  ('01F00000-0000-4000-8000-000000000203', '01F00000-0000-4000-8000-000000000102', 1, 'User Accounts & Privileges',     'Accounts, grants, and the least-privilege model.',               'PUBLISHED'),
  ('01F00000-0000-4000-8000-000000000204', '01F00000-0000-4000-8000-000000000102', 2, 'Security Hardening',             'Passwords, authentication, and network controls.',               'PUBLISHED'),
  ('01F00000-0000-4000-8000-000000000205', '01F00000-0000-4000-8000-000000000103', 1, 'Storage Engines',                'How engines store, lock, and transact on data.',                 'PUBLISHED'),
  ('01F00000-0000-4000-8000-000000000206', '01F00000-0000-4000-8000-000000000103', 2, 'Schema Design',                  'Data types, keys, and constraints done right.',                  'PUBLISHED'),
  ('01F00000-0000-4000-8000-000000000207', '01F00000-0000-4000-8000-000000000104', 1, 'Indexing',                       'Indexes from first principles to practical strategy.',           'PUBLISHED'),
  ('01F00000-0000-4000-8000-000000000208', '01F00000-0000-4000-8000-000000000104', 2, 'Query Optimization',             'EXPLAIN plans, profiling, and faster SQL.',                      'PUBLISHED'),
  ('01F00000-0000-4000-8000-000000000209', '01F00000-0000-4000-8000-000000000105', 1, 'Backup & Recovery',              'mysqldump, restore, and point-in-time workflows.',               'PUBLISHED'),
  ('01F00000-0000-4000-8000-000000000210', '01F00000-0000-4000-8000-000000000105', 2, 'High Availability & Capstone',   'Replication, monitoring, and the final operations project.',     'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 01F00000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('01F00000-0000-4000-8000-000000000301', '01F00000-0000-4000-8000-000000000201', 1, 'What is MySQL?',                      'Understand the client-server architecture and what a DBA owns.',  'TEXT',  'PUBLISHED', 'FREE', 10,  5),
  ('01F00000-0000-4000-8000-000000000302', '01F00000-0000-4000-8000-000000000201', 2, 'Installing MySQL Server',              'Install MySQL on Linux, macOS, or Windows and verify it runs.',   'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01F00000-0000-4000-8000-000000000303', '01F00000-0000-4000-8000-000000000201', 3, 'MySQL Foundations Quiz',               'Check your understanding of MySQL basics.',                       'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01F00000-0000-4000-8000-000000000304', '01F00000-0000-4000-8000-000000000202', 1, 'Configuring the Server',               'Tune my.cnf options and inspect runtime system variables.',       'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01F00000-0000-4000-8000-000000000305', '01F00000-0000-4000-8000-000000000202', 2, 'Exploring with the MySQL Client',      'Drive the mysql shell and query the information schema.',         'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01F00000-0000-4000-8000-000000000306', '01F00000-0000-4000-8000-000000000202', 3, 'Configuration & Client Quiz',          'Verify your server configuration and client skills.',             'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01F00000-0000-4000-8000-000000000307', '01F00000-0000-4000-8000-000000000203', 1, 'Creating & Managing User Accounts',    'Create, alter, rename, and drop login accounts safely.',          'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01F00000-0000-4000-8000-000000000308', '01F00000-0000-4000-8000-000000000203', 2, 'Privileges & Grants',                  'Grant scoped privileges and organize them with roles.',           'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01F00000-0000-4000-8000-000000000309', '01F00000-0000-4000-8000-000000000203', 3, 'Users & Privileges Quiz',              'Test your account and grant management skills.',                  'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01F00000-0000-4000-8000-000000000310', '01F00000-0000-4000-8000-000000000204', 1, 'Password & Authentication Hardening',  'Enforce strong passwords and modern authentication.',             'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01F00000-0000-4000-8000-000000000311', '01F00000-0000-4000-8000-000000000204', 2, 'Network & Server Security',            'Lock down ports, TLS, and server-side exposure.',                 'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01F00000-0000-4000-8000-000000000312', '01F00000-0000-4000-8000-000000000204', 3, 'Security Hardening Quiz',              'Check what you know about hardening a MySQL server.',             'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01F00000-0000-4000-8000-000000000313', '01F00000-0000-4000-8000-000000000205', 1, 'Understanding Storage Engines',        'Compare InnoDB, MyISAM, MEMORY, and friends.',                    'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01F00000-0000-4000-8000-000000000314', '01F00000-0000-4000-8000-000000000205', 2, 'Transactions & Isolation Levels',      'Use ACID transactions and pick an isolation level.',              'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01F00000-0000-4000-8000-000000000315', '01F00000-0000-4000-8000-000000000205', 3, 'Storage Engines Quiz',                 'Test your engine and transaction knowledge.',                     'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01F00000-0000-4000-8000-000000000316', '01F00000-0000-4000-8000-000000000206', 1, 'Data Types & Schema Design',           'Choose the right column types and build clean tables.',           'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01F00000-0000-4000-8000-000000000317', '01F00000-0000-4000-8000-000000000206', 2, 'Keys, Constraints & Normalization',    'Enforce integrity with keys, constraints, and 3NF.',              'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01F00000-0000-4000-8000-000000000318', '01F00000-0000-4000-8000-000000000206', 3, 'Schema Design Quiz',                   'Verify you can model data correctly.',                            'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01F00000-0000-4000-8000-000000000319', '01F00000-0000-4000-8000-000000000207', 1, 'How Indexes Work',                     'See the B-tree structure behind fast lookups.',                   'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01F00000-0000-4000-8000-000000000320', '01F00000-0000-4000-8000-000000000207', 2, 'Index Strategy & Design',              'Build composite, covering, and prefix indexes that pay off.',     'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('01F00000-0000-4000-8000-000000000321', '01F00000-0000-4000-8000-000000000207', 3, 'Indexing Quiz',                        'Check your index knowledge.',                                     'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01F00000-0000-4000-8000-000000000322', '01F00000-0000-4000-8000-000000000208', 1, 'Reading EXPLAIN Plans',                'Decode optimizer plans to find slow query causes.',               'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('01F00000-0000-4000-8000-000000000323', '01F00000-0000-4000-8000-000000000208', 2, 'Writing Faster Queries',               'Apply sargable predicates and avoid optimizer traps.',            'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('01F00000-0000-4000-8000-000000000324', '01F00000-0000-4000-8000-000000000208', 3, 'Query Optimization Quiz',              'Prove you can diagnose and speed up queries.',                    'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01F00000-0000-4000-8000-000000000325', '01F00000-0000-4000-8000-000000000209', 1, 'Backups with mysqldump',               'Produce logical backups and restore them under pressure.',        'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01F00000-0000-4000-8000-000000000326', '01F00000-0000-4000-8000-000000000210', 1, 'Replication & High Availability',      'Stream changes to replicas and plan for failover.',               'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('01F00000-0000-4000-8000-000000000327', '01F00000-0000-4000-8000-000000000210', 2, 'Monitoring & the Ops Capstone',        'Watch performance_schema and complete a full admin project.',     'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('01F00000-0000-4000-8000-000000000328', '01F00000-0000-4000-8000-000000000210', 3, 'Final Assessment',                     'Prove what you learned across the whole course.',                 'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 01F00000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '01F00000-0000-4000-8000-000000000401',
  '01F00000-0000-4000-8000-000000000301',
  1,
  'What is MySQL?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What is MySQL?</title>
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
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>What is MySQL?</h1>
  <p>MySQL is the world&rsquo;s most widely used <strong>open-source relational database</strong>. It stores structured data in tables, reads and writes that data using <strong>SQL</strong>, and serves everything from small web apps to huge e-commerce backends.</p>
  <p>As an administrator your job centers on the <span class="ic">mysqld</span> server process: installing it, configuring it, securing it, keeping it fast, and making sure its data survives any disaster.</p>
  <h2>Client and server</h2>
  <p>MySQL follows a <strong>client-server</strong> model. The server manages data; clients connect and issue statements. The most common client is the <span class="ic">mysql</span> shell:</p>
  <pre class="code-block">mysql -h database.example.com -u admin -p</pre>
  <p>Clients may also be your application code, ORM tools, or reporting scripts. They all speak the same MySQL protocol over TCP port 3306 by default.</p>
  <h2>Who talks to whom</h2>
  <table>
    <tr><th>Piece</th><th>Role</th></tr>
    <tr><td>mysql client</td><td>Runs your SQL and shows results</td></tr>
    <tr><td>mysqld server</td><td>Parses SQL, optimizes plans, enforces rules</td></tr>
    <tr><td>Storage engine</td><td>Physically stores and locks rows (InnoDB)</td></tr>
    <tr><td>Data files</td><td>Tables on disk; buffered in memory</td></tr>
  </table>
  <h2>What makes MySQL popular</h2>
  <ul>
    <li>Reliable <strong>ACID transactions</strong> with the InnoDB engine by default.</li>
    <li>Rich feature set: views, triggers, stored routines, full-text search, replication.</li>
    <li>Huge ecosystem and every tool speaks it.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Editions</strong>
    <p>MySQL has two families: <strong>Community</strong> (free, fully featured) and <strong>Enterprise</strong> (paid extras: backup, firewall, monitoring agents). Everything in this course runs on Community.</p>
  </div>
  <div class="callout callout-tip">
    <strong>What you will build</strong>
    <p>By the end you will run a complete administrator&rsquo;s project: a secured, backed-up, replicated MySQL deployment with a monitoring dashboard — exactly the checklist a new DBA is handed on day one.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01F00000-0000-4000-8000-000000000402',
  '01F00000-0000-4000-8000-000000000302',
  1,
  'Installing MySQL Server',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Installing MySQL Server</title>
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
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Installing MySQL Server</h1>
  <p>Installation used to be an afternoon of tarballs and build flags. Modern package managers make it trivial, but a DBA still verifies what was installed, what service landed on the box, and where the data lives.</p>
  <h2>Package installs</h2>
  <p>On Debian or Ubuntu, the official repository or the distro package both work:</p>
  <pre class="code-block">sudo apt update
sudo apt install mysql-server</pre>
  <p>On Red Hat family systems:</p>
  <pre class="code-block">sudo dnf install mysql-server</pre>
  <p>On macOS with Homebrew, and on Windows you use the installer wizard:</p>
  <pre class="code-block">brew install mysql
# Windows: run mysql-installer-community.msi</pre>
  <h2>Start the service</h2>
  <p>Linux systems manage the daemon as a systemd unit named <span class="ic">mysql</span> or <span class="ic">mysqld</span>:</p>
  <pre class="code-block">sudo systemctl enable --now mysql
sudo systemctl status mysql</pre>
  <div class="callout callout-info">
    <strong>Where things live</strong>
    <p>Key paths: <span class="ic">/etc/mysql/my.cnf</span> or <span class="ic">/etc/my.cnf</span> for configuration, <span class="ic">/var/lib/mysql</span> for the data directory, and <span class="ic">/var/log/mysql/error.log</span> for the error log.</p>
  </div>
  <h2>Verify the install</h2>
  <pre class="code-block">mysql --version
sudo mysqladmin ping
sudo mysql -u root</pre>
  <p>On default Ubuntu installs the <span class="ic">root</span> account uses the unix socket <span class="ic">auth_socket</span> plugin, so <span class="ic">sudo mysql</span> logs you straight in. We will fix this into a proper password account in the security module.</p>
  <div class="callout callout-tip">
    <strong>Check the port</strong>
    <p>Confirm the server is accepting TCP with <span class="ic">sudo ss -tlnp | grep 3306</span>. A missing listener usually means the service failed to start — read the error log first.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01F00000-0000-4000-8000-000000000404',
  '01F00000-0000-4000-8000-000000000304',
  1,
  'Configuring the Server',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Configuring the Server</title>
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
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Configuring the Server</h1>
  <p>Almost everything a MySQL server does is governed by <strong>system variables</strong>. You set their startup values in <strong>option files</strong> (commonly <span class="ic">my.cnf</span> on Unix or <span class="ic">my.ini</span> on Windows), and you can read or change them at runtime.</p>
  <h2>Option file anatomy</h2>
  <p>Option files are organized into sections that scope which program reads which keys:</p>
  <pre class="code-block">[mysqld]
port = 3306
bind_address = 0.0.0.0
max_connections = 200
innodb_buffer_pool_size = 2G
character_set_server = utf8mb4

[mysql]
auto-rehash</pre>
  <div class="callout">
    <strong>Read order</strong>
    <p>On Linux the server reads <span class="ic">/etc/my.cnf</span>, then <span class="ic">/etc/mysql/</span> files, then any file in <span class="ic">$MYSQL_HOME</span>. Later files win. Always confirm your effective values with <span class="ic">SHOW VARIABLES</span> rather than assuming the file is being read.</p>
  </div>
  <h2>Variables worth tuning</h2>
  <table>
    <tr><th>Variable</th><th>Purpose</th></tr>
    <tr><td>innodb_buffer_pool_size</td><td>InnoDB cache; the single biggest memory lever</td></tr>
    <tr><td>max_connections</td><td>Hard cap on concurrent client connections</td></tr>
    <tr><td>max_allowed_packet</td><td>Maximum size of a single statement or row</td></tr>
    <tr><td>slow_query_log</td><td>Logs statements slower than long_query_time</td></tr>
    <tr><td>log_bin</td><td>Turns on the binary log for replication and PITR</td></tr>
  </table>
  <h2>Inspect at runtime</h2>
  <pre class="code-block">SHOW VARIABLES LIKE 'innodb_buffer_pool_size';
SHOW VARIABLES LIKE 'character_set_server';</pre>
  <p>Rapid changes apply to the current session or globally with <span class="ic">SET</span>. MySQL 8.0 can persist them permanently without editing files:</p>
  <pre class="code-block">SET PERSIST max_connections = 250;
SET PERSIST_ONLY innodb_buffer_pool_size = 4G;</pre>
  <div class="callout callout-tip">
    <strong>Validate before restarting</strong>
    <p>Run <span class="ic">mysqld --validate-config</span> to catch syntax errors in option files before you bounce the server and take the database offline.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01F00000-0000-4000-8000-000000000405',
  '01F00000-0000-4000-8000-000000000305',
  1,
  'Exploring with the MySQL Client',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Exploring with the MySQL Client</title>
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
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Exploring with the MySQL Client</h1>
  <p>The <span class="ic">mysql</span> shell is your daily driver. Connect, set a default schema, and explore what the server knows about itself.</p>
  <h2>Connect</h2>
  <pre class="code-block">mysql -u admin -p
mysql -h db1.internal -u admin -p shop</pre>
  <p>The interactive prompt <span class="ic">mysql&gt;</span> waits for statements terminated by a semicolon.</p>
  <h2>Discover what exists</h2>
  <pre class="code-block">SHOW DATABASES;
USE shop;
SHOW TABLES;
DESCRIBE customers;</pre>
  <h2>Ask the server about itself</h2>
  <p>The <span class="ic">information_schema</span> database is a live catalog of objects and metadata. You query it with ordinary SQL:</p>
  <pre class="code-block">SELECT table_name, table_rows, engine
FROM information_schema.tables
WHERE table_schema = 'shop';</pre>
  <h2>Files and scripts</h2>
  <p>The client also runs statements from a file — how you apply schemas and restore backups:</p>
  <pre class="code-block">mysql -u admin -p shop &lt; schema.sql</pre>
  <p><span class="ic">HELP</span> lists available commands, and <span class="ic">EXIT</span> ends the session cleanly.</p>
  <div class="callout callout-tip">
    <strong>Batch mode</strong>
    <p>Pipe output to a file for auditing: <span class="ic">mysql -u admin -p -e &quot;SELECT * FROM orders&quot; &gt; orders.txt</span>. Non-interactive runs also behave well in cron scripts.</p>
  </div>
  <div class="callout callout-info">
    <strong>Never share the root password</strong>
    <p>Create a dedicated account for exploration with <span class="ic">SELECT</span> on <span class="ic">information_schema</span> only — the next chapters show exactly how.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01F00000-0000-4000-8000-000000000407',
  '01F00000-0000-4000-8000-000000000307',
  1,
  'Creating & Managing User Accounts',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Creating & Managing User Accounts</title>
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
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Creating &amp; Managing User Accounts</h1>
  <p>In MySQL a &ldquo;user&rdquo; is really a pair: <strong>name + host</strong>. Two accounts named <span class="ic">app</span> on different hosts are different users. This is how MySQL tells one application from another even over the same network.</p>
  <h2>Account anatomy</h2>
  <table>
    <tr><th>Host pattern</th><th>Meaning</th></tr>
    <tr><td>localhost</td><td>Connections via the local socket or loopback</td></tr>
    <tr><td>192.168.10.%</td><td>Any host inside that subnet</td></tr>
    <tr><td>%</td><td>Any host — use sparingly</td></tr>
  </table>
  <h2>Create, alter, drop</h2>
  <pre class="code-block">CREATE USER 'app'@'localhost' IDENTIFIED BY 'S3cure!Pass';
CREATE USER 'replica'@'192.168.10.%' IDENTIFIED BY 'Repl!2024';

ALTER USER 'app'@'localhost' IDENTIFIED BY 'New#Pass1';
ALTER USER 'app'@'localhost' PASSWORD EXPIRE INTERVAL 90 DAY;

RENAME USER 'app'@'localhost' TO 'app'@'10.0.0.%';
DROP USER IF EXISTS 'app'@'10.0.0.%';</pre>
  <div class="callout">
    <strong>Passwords are hashed, never stored</strong>
    <p>MySQL stores only a strong salted hash. The default <span class="ic">caching_sha2_password</span> plugin in 8.0 uses SHA-256 family hashing. Never pick an old plugin just to make a client work.</p>
  </div>
  <h2>Inspect accounts</h2>
  <pre class="code-block">SELECT user, host, plugin, password_expired
FROM mysql.user;</pre>
  <div class="callout callout-tip">
    <strong>One identity per purpose</strong>
    <p>Give every application and every administrator the narrowest possible account. An analyst rarely needs the same account as an app that writes.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01F00000-0000-4000-8000-000000000408',
  '01F00000-0000-4000-8000-000000000308',
  1,
  'Privileges & Grants',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Privileges & Grants</title>
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
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Privileges &amp; Grants</h1>
  <p>A new account can do nothing until you grant it privileges. Privileges in MySQL are scoped, so you can be precise: <strong>global</strong>, <strong>database</strong>, <strong>table</strong>, or even <strong>column</strong> level.</p>
  <h2>Scope syntax</h2>
  <pre class="code-block">-- Global
GRANT SELECT ON *.* TO 'analyst'@'localhost';

-- One database
GRANT SELECT, INSERT, UPDATE, DELETE
  ON shop.* TO 'app'@'localhost';

-- One table
GRANT SELECT ON shop.orders TO 'report'@'localhost';

-- Column-level read-only
GRANT SELECT (email, name) ON shop.customers TO 'support'@'localhost';</pre>
  <h2>Revoke</h2>
  <pre class="code-block">REVOKE DELETE ON shop.* FROM 'app'@'localhost';
REVOKE ALL PRIVILEGES ON shop.* FROM 'analyst'@'localhost';</pre>
  <h2>Inspect what users can do</h2>
  <pre class="code-block">SHOW GRANTS FOR 'app'@'localhost';</pre>
  <h2>Roles group privileges</h2>
  <p>Roles are named privilege bundles you assign to accounts — the same people concept as OS groups:</p>
  <pre class="code-block">CREATE ROLE 'readonly';
GRANT SELECT ON shop.* TO 'readonly';
GRANT 'readonly' TO 'analyst'@'localhost';

SET DEFAULT ROLE 'readonly' TO 'analyst'@'localhost';</pre>
  <h2>Everyday privileges</h2>
  <table>
    <tr><th>Privilege</th><th>Grants</th></tr>
    <tr><td>SELECT / INSERT / UPDATE / DELETE</td><td>Row operations</td></tr>
    <tr><td>CREATE / ALTER / DROP</td><td>DDL on objects in scope</td></tr>
    <tr><td>INDEX</td><td>Create and drop indexes</td></tr>
    <tr><td>RELOAD</td><td>FLUSH and reload grant tables</td></tr>
    <tr><td>PROCESS</td><td>See other users&rsquo; running statements</td></tr>
    <tr><td>SHUTDOWN</td><td>Stop the server — admin only</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Least privilege</strong>
    <p>Start with only <span class="ic">SELECT</span>, then widen as a real need appears. If you edit grant tables directly, run <span class="ic">FLUSH PRIVILEGES</span> so the server re-reads them.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01F00000-0000-4000-8000-000000000410',
  '01F00000-0000-4000-8000-000000000310',
  1,
  'Password & Authentication Hardening',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Password & Authentication Hardening</title>
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
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Password &amp; Authentication Hardening</h1>
  <p>Weak passwords are the number one way databases get owned. MySQL ships two helpers that stop the weakest links before they reach production: the <span class="ic">validate_password</span> component and <span class="ic">mysql_secure_installation</span>.</p>
  <h2>Enforce strong passwords</h2>
  <pre class="code-block">INSTALL COMPONENT 'file://component_validate_password';

SET PERSIST validate_password.policy = STRONG;
SET PERSIST validate_password.length = 12;</pre>
  <p>With the policy set, this statement is rejected before it reaches the user table:</p>
  <pre class="code-block">CREATE USER 'weak'@'%' IDENTIFIED BY 'password';  -- ERROR</pre>
  <h2>Use the modern plugin</h2>
  <p>MySQL 8.0 authenticates with <span class="ic">caching_sha2_password</span>, which resists offline dictionary attacks far better than the legacy <span class="ic">mysql_native_password</span>. Keep it. Clients that cannot speak it are outdated and should be upgraded.</p>
  <h2>Require secure connections per user</h2>
  <pre class="code-block">CREATE USER 'app'@'localhost'
  IDENTIFIED BY 'Str0ng!Pass'
  REQUIRE SSL;

ALTER USER 'app'@'localhost' PASSWORD EXPIRE INTERVAL 60 DAY;</pre>
  <div class="callout callout-tip">
    <strong>Password rotation</strong>
    <p>Pair <span class="ic">PASSWORD EXPIRE INTERVAL</span> with a secrets management tool that rotates app credentials automatically. For humans, announce expiry and offer self-service reset.</p>
  </div>
  <h2>The hardening script</h2>
  <p>Run <span class="ic">mysql_secure_installation</span> right after install. It walks you through:</p>
  <ul>
    <li>Setting a strong <span class="ic">root</span> password (or using auth_socket).</li>
    <li>Removing anonymous accounts.</li>
    <li>Disallowing <span class="ic">root</span> login over the network.</li>
    <li>Removing the throwaway <span class="ic">test</span> database.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Also audit lagging accounts</strong>
    <p>Query <span class="ic">mysql.user</span> for accounts with empty <span class="ic">authentication_string</span> and for any host using <span class="ic">%</span> that should be scoped down. Empty passwords are an instant breach window.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01F00000-0000-4000-8000-000000000411',
  '01F00000-0000-4000-8000-000000000311',
  1,
  'Network & Server Security',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Network & Server Security</title>
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
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Network &amp; Server Security</h1>
  <p>Passwords protect endpoints; the network prevents attacks from ever reaching them. A MySQL server should only be reachable where applications and DBAs honestly need it.</p>
  <h2>Shrink the attack surface</h2>
  <pre class="code-block">[mysqld]
# Listen on the private app network only
bind_address = 10.0.0.10

# Or go fully local
skip-networking</pre>
  <p>Then close the port in the host firewall except for the allowed clients:</p>
  <pre class="code-block">sudo ufw allow from 10.0.1.0/24 to any port 3306
sudo ufw deny 3306
sudo ufw enable</pre>
  <h2>Encrypt in transit</h2>
  <p>MySQL 8.0 enables TLS by default with auto-generated certificates; real deployments replace them with signed ones. Then require the encrypted channel:</p>
  <pre class="code-block">[mysqld]
require_secure_transport = ON
ssl_ca = /etc/mysql/certs/ca.pem
ssl_cert = /etc/mysql/certs/server-cert.pem
ssl_key = /etc/mysql/certs/server-key.pem</pre>
  <h2>Filesystem and runtime hazards</h2>
  <table>
    <tr><th>Risk</th><th>Fix</th></tr>
    <tr><td>LOAD DATA from client files</td><td>local_infile = OFF and secure-file-priv limited</td></tr>
    <tr><td>Server running as OS root</td><td>Dedicated unprivileged mysql user</td></tr>
    <tr><td>World-readable data directory</td><td>chmod 750 on the datadir</td></tr>
    <tr><td>Credential leakage in shell history</td><td>.mylogin.cnf with restrictive perms</td></tr>
  </table>
  <div class="callout">
    <strong>Replication secrets</strong>
    <p>Replica credentials sit in <span class="ic">master.info</span> and options files. Lock perms to the mysql user and consider <span class="ic">CHANGE REPLICATION SOURCE TO</span> with a dedicated low-privilege account.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Test like an attacker</strong>
    <p>From outside the trusted range run <span class="ic">nmap -p 3306</span>; the port should be filtered or closed. Also verify <span class="ic">root</span> cannot log in over the network.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01F00000-0000-4000-8000-000000000413',
  '01F00000-0000-4000-8000-000000000313',
  1,
  'Understanding Storage Engines',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Understanding Storage Engines</title>
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
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Understanding Storage Engines</h1>
  <p>MySQL is pluggable: the SQL layer above stays identical while a <strong>storage engine</strong> decides how rows are physically stored, locked, and recovered. Your choice controls durability, concurrency, and speed.</p>
  <h2>The engine landscape</h2>
  <table>
    <tr><th>Engine</th><th>Transactions</th><th>Locking</th><th>Use for</th></tr>
    <tr><td>InnoDB</td><td>Yes</td><td>Row</td><td>Default; real applications</td></tr>
    <tr><td>MyISAM</td><td>No</td><td>Table</td><td>Legacy read-only tables</td></tr>
    <tr><td>MEMORY</td><td>No</td><td>Table</td><td>Short-lived in-memory cache</td></tr>
    <tr><td>ARCHIVE</td><td>No</td><td>Row</td><td>Append-only archives</td></tr>
    <tr><td>CSV</td><td>No</td><td>Table</td><td>Exchange with spreadsheets</td></tr>
  </table>
  <h2>Why InnoDB wins</h2>
  <ul>
    <li><strong>ACID transactions</strong> with commit, rollback, and crash recovery.</li>
    <li><strong>Row-level locking</strong> lets many writers proceed in parallel.</li>
    <li><strong>Foreign keys</strong> enforce referential integrity at the engine level.</li>
    <li>Automatic <strong>crash recovery</strong> re-applies committed work after power loss.</li>
  </ul>
  <h2>See and change engines</h2>
  <pre class="code-block">SHOW ENGINES;

SELECT engine
FROM information_schema.tables
WHERE table_schema = 'shop' AND table_name = 'orders';

ALTER TABLE legacy_log ENGINE = InnoDB;</pre>
  <div class="callout callout-info">
    <strong>MyISAM is legacy</strong>
    <p>MyISAM was the default before MySQL 5.5. Table locks, no transactions, and a crash that can corrupt the table made it a poor fit for anything important. Prefer InnoDB unless a niche case demands otherwise.</p>
  </div>
  <div class="callout callout-tip">
    <strong>MEMORY tables are volatile</strong>
    <p>Everything in a MEMORY table disappears on restart. Fine for derived caches, dangerous for anything you promised to keep.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01F00000-0000-4000-8000-000000000414',
  '01F00000-0000-4000-8000-000000000314',
  1,
  'Transactions & Isolation Levels',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Transactions & Isolation Levels</title>
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
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Transactions &amp; Isolation Levels</h1>
  <p>A transaction is a group of statements that must all succeed together. Either every statement commits, or none does. This is the <strong>atom and backbone</strong> of trustworthy data.</p>
  <h2>The ACID contract</h2>
  <ul>
    <li><strong>Atomicity</strong> — all-or-nothing execution.</li>
    <li><strong>Consistency</strong> — constraints hold before and after.</li>
    <li><strong>Isolation</strong> — concurrent transactions do not trip over each other.</li>
    <li><strong>Durability</strong> — once committed, data survives crashes.</li>
  </ul>
  <h2>A classic money transfer</h2>
  <pre class="code-block">START TRANSACTION;

UPDATE accounts SET balance = balance - 100 WHERE id = 7;
UPDATE accounts SET balance = balance + 100 WHERE id = 9;

COMMIT;   -- make it permanent
-- ROLLBACK;  -- cancel everything instead</pre>
  <p>Set <span class="ic">autocommit</span> off in scripts that need many statements to move as one unit.</p>
  <h2>Isolation levels</h2>
  <table>
    <tr><th>Level</th><th>Dirty reads</th><th>Non-repeatable</th><th>Phantoms</th></tr>
    <tr><td>READ UNCOMMITTED</td><td>Yes</td><td>Yes</td><td>Yes</td></tr>
    <tr><td>READ COMMITTED</td><td>No</td><td>Yes</td><td>Yes</td></tr>
    <tr><td>REPEATABLE READ (default)</td><td>No</td><td>No</td><td>No</td></tr>
    <tr><td>SERIALIZABLE</td><td>No</td><td>No</td><td>No</td></tr>
  </table>
  <pre class="code-block">SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT @@transaction_isolation;</pre>
  <div class="callout callout-info">
    <strong>InnoDB default</strong>
    <p>REPEATABLE READ uses a consistent snapshot, so long SELECTs inside one transaction see a stable view of the database even as others commit.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Keep transactions short</strong>
    <p>Hold locks only while needed. Long transactions block writers and bloat undo data — commit quickly and never call the application layer mid-transaction.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01F00000-0000-4000-8000-000000000416',
  '01F00000-0000-4000-8000-000000000316',
  1,
  'Data Types & Schema Design',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Data Types & Schema Design</title>
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
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Data Types &amp; Schema Design</h1>
  <p>Every column needs a type, and the choices you make at design time echo through performance and correctness for years. The guiding rule: <strong>store the smallest and most precise type that honestly represents the data</strong>.</p>
  <h2>Numeric types</h2>
  <table>
    <tr><th>Type</th><th>Range (signed)</th><th>Good for</th></tr>
    <tr><td>TINYINT</td><td>-128 .. 127</td><td>Flags, small counters</td></tr>
    <tr><td>INT</td><td>-2^31 .. 2^31-1</td><td>IDs, counts</td></tr>
    <tr><td>BIGINT</td><td>-2^63 .. 2^63-1</td><td>Huge counters, snowflakes</td></tr>
    <tr><td>DECIMAL(p,s)</td><td>exact</td><td>Money, precise quantities</td></tr>
    <tr><td>FLOAT / DOUBLE</td><td>approximate</td><td>Scientific values, AVG</td></tr>
  </table>
  <h2>String and date families</h2>
  <ul>
    <li><span class="ic">CHAR(n)</span> — short fixed values; <span class="ic">VARCHAR(n)</span> for variable text.</li>
    <li><span class="ic">TEXT</span> / <span class="ic">BLOB</span> — large blocks; keep off indexed columns.</li>
    <li><span class="ic">ENUM</span> — a fixed menu of strings; hard to migrate, use sparingly.</li>
    <li><span class="ic">JSON</span> — native documents with efficient extraction.</li>
    <li><span class="ic">DATE</span>, <span class="ic">TIME</span>, <span class="ic">DATETIME</span>, <span class="ic">TIMESTAMP</span> — pick per precision need.</li>
  </ul>
  <h2>Design it right</h2>
  <pre class="code-block">CREATE TABLE customers (
  customer_id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  email          VARCHAR(255)    NOT NULL,
  first_name     VARCHAR(100)    NOT NULL,
  balance_cents  DECIMAL(12,2)   NOT NULL DEFAULT 0.00,
  status         VARCHAR(20)     NOT NULL DEFAULT 'active',
  created_at     DATETIME(3)     NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (customer_id),
  UNIQUE KEY uq_customers_email (email)
) ENGINE = InnoDB;</pre>
  <div class="callout callout-tip">
    <strong>Integers for statuses</strong>
    <p>A <span class="ic">VARCHAR(20)</span> status is readable; reference tables or <span class="ic">ENUM</span> are compact. Avoid both extreme: no magic numbers without documentation, and no free-form strings.</p>
  </div>
  <div class="callout callout-info">
    <strong>TIMESTAMP vs DATETIME</strong>
    <p>TIMESTAMP converts to UTC internally and stops at 2038; DATETIME stores literally. For business timestamps, DATETIME is usually the safer long-term choice.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01F00000-0000-4000-8000-000000000417',
  '01F00000-0000-4000-8000-000000000317',
  1,
  'Keys, Constraints & Normalization',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Keys, Constraints &amp; Normalization</title>
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
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Keys, Constraints &amp; Normalization</h1>
  <p>Constraints are the database enforcing your business rules for you, so invalid data never even gets stored. Keys identify rows; normalization removes redundant copies of facts so every fact lives in exactly one place.</p>
  <h2>The constraint toolbox</h2>
  <table>
    <tr><th>Constraint</th><th>Guarantees</th></tr>
    <tr><td>PRIMARY KEY</td><td>Unique, non-null row identity</td></tr>
    <tr><td>UNIQUE</td><td>No duplicate values in the column</td></tr>
    <tr><td>FOREIGN KEY</td><td>Child values exist in the parent</td></tr>
    <tr><td>CHECK</td><td>Values pass a predicate</td></tr>
    <tr><td>NOT NULL</td><td>Value is always supplied</td></tr>
  </table>
  <h2>Foreign key actions</h2>
  <pre class="code-block">CREATE TABLE orders (
  order_id    BIGINT UNSIGNED PRIMARY KEY,
  customer_id BIGINT UNSIGNED NOT NULL,
  total_cents DECIMAL(12,2) NOT NULL,
  CONSTRAINT fk_orders_customer
    FOREIGN KEY (customer_id)
    REFERENCES customers (customer_id)
    ON DELETE CASCADE
);</pre>
  <h2>Which action to pick</h2>
  <ul>
    <li><span class="ic">CASCADE</span> — delete children with the parent (orders die with their customer).</li>
    <li><span class="ic">RESTRICT</span> — block the delete while children exist (safe default).</li>
    <li><span class="ic">SET NULL</span> — keep rows, clear the link (child column must be nullable).</li>
  </ul>
  <h2>Normalization to 3NF</h2>
  <pre class="code-block">-- 1NF: one fact per cell, no repeating groups
-- 2NF: every column depends on the whole key
-- 3NF: every column depends on the key and nothing else</pre>
  <p>Split a table that repeats customer data on every order into <span class="ic">customers</span> and <span class="ic">orders</span>, and the database itself keeps the two consistent.</p>
  <div class="callout callout-tip">
    <strong>Index your foreign keys</strong>
    <p>InnoDB does not index FKs automatically in older versions. Joins and cascade deletes are far faster when the child column has an index — see the next module.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01F00000-0000-4000-8000-000000000419',
  '01F00000-0000-4000-8000-000000000319',
  1,
  'How Indexes Work',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>How Indexes Work</title>
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
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>How Indexes Work</h1>
  <p>Without an index, a lookup scans the whole table row by row. With an index, MySQL walks a <strong>B-tree</strong> — a balanced, sorted structure — to reach the wanted rows in a handful of steps regardless of table size.</p>
  <h2>The B-tree idea</h2>
  <pre class="code-block">-- Without index (full table scan): check O(n) rows
SELECT * FROM users WHERE email = 'ada@example.com';

-- With INDEX (email): jump to the branch and descend O(log n)</pre>
  <p>Each index node stores key values in order and pointers to deeper nodes or, at the leaf level, to the actual rows.</p>
  <h2>Clustered vs secondary</h2>
  <table>
    <tr><th>Index type</th><th>What leaves point to</th></tr>
    <tr><td>Primary (clustered)</td><td>The full row is stored in the leaf</td></tr>
    <tr><td>Secondary</td><td>The primary key value, then a row lookup</td></tr>
  </table>
  <p>A secondary index does two fetches: once in the index, then once into the clustered index. That second hop is called the <strong>primary key lookup</strong> and it is usually cheap.</p>
  <h2>Covering queries</h2>
  <pre class="code-block">-- All needed columns live in the index itself:
CREATE INDEX idx_users_email ON users (email);
SELECT email FROM users WHERE email = 'ada@example.com';
-- "Using index" in EXPLAIN: no row fetch at all</pre>
  <h2>Cardinality and selectivity</h2>
  <ul>
    <li><span class="ic">Cardinality</span> = number of distinct values in the index.</li>
    <li>High <strong>selectivity</strong> means each value matches few rows — ideal for a WHERE clause.</li>
    <li>Indexing a column with two values may only help if rows are evenly split.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Indexes cost writes</strong>
    <p>Every INSERT, UPDATE, or DELETE must also update each index. A table with six indexes pays six books to keep. Add indexes where reads win, not on every column.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01F00000-0000-4000-8000-000000000420',
  '01F00000-0000-4000-8000-000000000320',
  1,
  'Index Strategy & Design',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Index Strategy &amp; Design</title>
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
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Index Strategy &amp; Design</h1>
  <p>A good index strategy matches the queries your application actually runs. Design indexes around the <strong>real WHERE, JOIN, ORDER BY, and GROUP BY clauses</strong> — not every column you can think of.</p>
  <h2>Composite index column order</h2>
  <pre class="code-block">CREATE INDEX idx_orders_customer_status
  ON orders (customer_id, status, created_at);</pre>
  <p>MySQL follows the <strong>leftmost prefix rule</strong>: the index serves any query that filters a leading prefix of these columns — <span class="ic">customer_id</span>, <span class="ic">customer_id+status</span>, and all three. A query starting with <span class="ic">status</span> alone cannot use it.</p>
  <h2>Order columns by selectivity</h2>
  <ul>
    <li>Put <strong>equality filters first</strong> (customer_id = ...).</li>
    <li>Then the range column (status, a date) — its ordering benefits ORDER BY sorting.</li>
    <li>Leave the widest / sort column last in a range query.</li>
  </ul>
  <h2>Prefix indexes</h2>
  <p>For long text, index only the first chars to shrink the tree:</p>
  <pre class="code-block">CREATE INDEX idx_users_name_prefix
  ON users (name(15));</pre>
  <h2>Unique indexes</h2>
  <pre class="code-block">CREATE UNIQUE INDEX idx_users_email ON users (email);</pre>
  <p>Unique indexes both speed lookups and enforce correctness — use them for natural keys like emails or invoice numbers.</p>
  <h2>Indexing dos and don&rsquo;ts</h2>
  <table>
    <tr><th>Do</th><th>Don&rsquo;t</th></tr>
    <tr><td>Index foreign keys and join columns</td><td>Index columns never filtered</td></tr>
    <tr><td>Keep composite indexes tight</td><td>Add dozens of single-column indexes</td></tr>
    <tr><td>Cover hot read paths</td><td>Index low-selectivity booleans</td></tr>
    <tr><td>Dropp unused indexes</td><td>Assume more index = faster</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>UNDO vs DROP</strong>
    <p>Use <span class="ic">ALTER TABLE ... DROP INDEX</span> to remove unused indexes. InnoDB adds indexes online in 8.0 with <span class="ic">ALGORITHM=INPLACE</span>, so changes no longer block whole-table traffic.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Verify with EXPLAIN</strong>
    <p>Never guess. After creating an index, run <span class="ic">EXPLAIN</span> and confirm the <span class="ic">key</span> column changed from NULL to your index. That is the ground truth.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01F00000-0000-4000-8000-000000000422',
  '01F00000-0000-4000-8000-000000000322',
  1,
  'Reading EXPLAIN Plans',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reading EXPLAIN Plans</title>
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
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Reading EXPLAIN Plans</h1>
  <p><span class="ic">EXPLAIN SELECT ...</span> shows exactly how the optimizer plans to execute a query without running it. It is the cornerstone of every slow-query investigation.</p>
  <h2>Try it</h2>
  <pre class="code-block">EXPLAIN SELECT o.id, o.total_cents
FROM orders o
JOIN customers c ON c.id = o.customer_id
WHERE c.email = 'ada@example.com';</pre>
  <h2>Key columns</h2>
  <table>
    <tr><th>Column</th><th>Meaning</th></tr>
    <tr><td>table</td><td>Which table this step reads</td></tr>
    <tr><td>type</td><td>Access method (see below)</td></tr>
    <tr><td>possible_keys</td><td>Candidate indexes</td></tr>
    <tr><td>key</td><td>The index actually chosen (NULL = none)</td></tr>
    <tr><td>rows</td><td>Estimated rows the optimizer will examine</td></tr>
    <tr><td>Extra</td><td>Diagnostic flags such as Using filesort</td></tr>
  </table>
  <h2>Access types, best to worst</h2>
  <ul>
    <li><span class="ic">const</span> — one row matched, primary key hit.</li>
    <li><span class="ic">eq_ref</span> — unique join key per row.</li>
    <li><span class="ic">ref</span> — non-unique index lookup.</li>
    <li><span class="ic">range</span> — indexed range scan (BETWEEN, &gt;, LIKE&nbsp;prefix).</li>
    <li><span class="ic">index</span> — full index scan (still cheaper than a table scan).</li>
    <li><span class="ic">ALL</span> — full table scan; the signal of a missing index.</li>
  </ul>
  <h2>Extra flags that matter</h2>
  <pre class="code-block">Using index         -- index only, no row reads
Using filesort      -- mysql sorts a temp list; add a sortable index
Using temporary     -- temporary table built; check GROUP BY/ORDER BY
Using where         -- filtering applied after the access step</pre>
  <div class="callout callout-tip">
    <strong>EXPLAIN ANALYZE in 8.0</strong>
    <p>MySQL 8.0 adds <span class="ic">EXPLAIN ANALYZE</span>, which actually runs the query and reports measured milliseconds and row counts per node. Use it on copy of the data or during maintenance windows.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01F00000-0000-4000-8000-000000000423',
  '01F00000-0000-4000-8000-000000000323',
  1,
  'Writing Faster Queries',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Writing Faster Queries</title>
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
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Writing Faster Queries</h1>
  <p>Queries slow down for two reasons: the server reads too many rows, or it spends CPU sorting and joining after the read. Both problems are cured by the same habits — keep filters selective and avoid reading data nobody asked for.</p>
  <h2>Sargable predicates</h2>
  <p>Write WHERE clauses so an index can be used directly:</p>
  <pre class="code-block">-- Atrocious: wraps the column, blocks the index
SELECT * FROM orders WHERE YEAR(created_at) = 2026;

-- Better: range on the raw column
SELECT * FROM orders
WHERE created_at &gt;= '2026-01-01'
  AND created_at &lt;  '2027-01-01';</pre>
  <h2>Stop selecting useless columns</h2>
  <ul>
    <li>Dropp <span class="ic">SELECT *</span> when callers need two fields.</li>
    <li>Keep results small: fewer bytes over the wire, less sort memory.</li>
    <li>Use <span class="ic">LIMIT</span> on listing queries even when you expect few rows.</li>
  </ul>
  <h2>Join on indexed keys</h2>
  <pre class="code-block">SELECT c.name, COUNT(o.id)
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.id
GROUP BY c.name;</pre>
  <p>The join column <span class="ic">o.customer_id</span> must be indexed, otherwise the optimizer picks a nested loop full scan per customer. Leftmost-prefix indexes from the previous lesson cover this automatically when added for the foreign key.</p>
  <h2>Function on the column vs the value</h2>
  <table>
    <tr><th>Write</th><th>Instead of</th></tr>
    <tr><td>status = 'active'</td><td>UPPER(status) = 'ACTIVE'</td></tr>
    <tr><td>created_at &gt;= date</td><td>DATE(created_at) = date</td></tr>
    <tr><td>name LIKE 'Ann%'</td><td>name LIKE '%Ann%'</td></tr>
  </table>
  <h2>Use EXPLAIN to confirm</h2>
  <p>Every fix should be verified: re-run <span class="ic">EXPLAIN</span>, confirm <span class="ic">type</span> improved and <span class="ic">rows</span> shrank, and measure wall time on realistic data.</p>
  <div class="callout callout-tip">
    <strong>One query now, one million tomorrow</strong>
    <p>Benchmark with your real data volume. A <span class="ic">filesort</span> on a thousand rows is often fine; on a billion it is a fire drill.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01F00000-0000-4000-8000-000000000425',
  '01F00000-0000-4000-8000-000000000325',
  1,
  'Backups with mysqldump',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Backups with mysqldump</title>
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
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Backups with mysqldump</h1>
  <p><span class="ic">mysqldump</span> is the classic logical backup tool: it exports SQL statements that recreate tables and rows on any compatible server. Because the output is pure SQL, it is portable and easy to inspect.</p>
  <h2>A safe single-database backup</h2>
  <pre class="code-block">mysqldump -u root -p --single-transaction \
  --routines --triggers --events sales \
  &gt; sales_2026-09-17.sql</pre>
  <h2>Flag by flag</h2>
  <table>
    <tr><th>Flag</th><th>Why you want it</th></tr>
    <tr><td>--single-transaction</td><td>Consistent snapshot without blocking writers (InnoDB)</td></tr>
    <tr><td>--routines</td><td>Include stored procedures and functions</td></tr>
    <tr><td>--triggers</td><td>Include triggers</td></tr>
    <tr><td>--events</td><td>Include scheduled events</td></tr>
    <tr><td>--no-data / --no-create-info</td><td>Schema-only or data-only dumps</td></tr>
    <tr><td>--all-databases</td><td>Physical-ish full dump for the whole instance</td></tr>
  </table>
  <h2>Restoring</h2>
  <pre class="code-block">mysql -u root -p sales &lt; sales_2026-09-17.sql</pre>
  <h2>Backup hygiene</h2>
  <ul>
    <li>Compress dumps — SQL files shrink a lot with <span class="ic">gzip</span>.</li>
    <li>Store copies off the primary server (another region or object storage).</li>
    <li>Restore into a scratch database and run sanity queries before you trust a backup.</li>
    <li>Never keep backups on the same disk as the data file.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Point-in-time recovery</strong>
    <p>Full dumps restore the snapshot; the binary log replays changes after it. That is the foundational pair behind MySQL point-in-time recovery.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Practise the drill</strong>
    <p>A backup nobody has restored is a guess. Run a quarterly restore drill on your own test instance so the muscle memory is there before an incident.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01F00000-0000-4000-8000-000000000426',
  '01F00000-0000-4000-8000-000000000326',
  1,
  'Replication & High Availability',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Replication &amp; High Availability</title>
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
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Replication &amp; High Availability</h1>
  <p>Replication copies changes from a <strong>source</strong> server to one or more <strong>replicas</strong>. It powers read scaling, report offloading, and failover — the plumbing a high-availability architecture bends around.</p>
  <h2>How it works</h2>
  <pre class="code-block">Source writes --&gt; binary log --&gt; replica pulls
                          --&gt; relay log --&gt; replica applies</pre>
  <p>The replica reads a stream of <span class="ic">binary log events</span> and replays them locally. The delay between source and replica is called <strong>replication lag</strong>.</p>
  <h2>Configuring a replica</h2>
  <pre class="code-block">-- my.cnf on the source
server-id = 1
log_bin = mysql-bin

-- my.cnf on each replica
server-id = 2
read_only = ON</pre>
  <pre class="code-block">-- On the replica, in the mysql client
CHANGE REPLICATION SOURCE TO
  SOURCE_HOST = 'db-source',
  SOURCE_USER = 'repl',
  SOURCE_PASSWORD = 's3cr3t';

START REPLICA;

SHOW REPLICA STATUS\G</pre>
  <h2>Using replicas safely</h2>
  <ul>
    <li>Route reads to replicas, writes to the source.</li>
    <li><span class="ic">read_only</span> stops direct writes on replicas.</li>
    <li>Monitor <span class="ic">Seconds_Behind_Source</span> for lag spikes.</li>
    <li>Certificates and strong passwords protect the <span class="ic">repl</span> account.</li>
  </ul>
  <h2>Failover plan</h2>
  <ol>
    <li>Promote the most advanced replica by disabling <span class="ic">read_only</span>.</li>
    <li>Repoint your application to the new source.</li>
    <li>Repair or re-establish the old node as a fresh replica.</li>
  </ol>
  <div class="callout callout-tip">
    <strong>Managed options</strong>
    <p>MySQL InnoDB Cluster combines Group Replication with MySQL Router to automate failover and load balancing. Understand manual replication first — every managed layer still calls it underneath.</p>
  </div>
  <div class="callout callout-info">
    <strong>Backups give the starting point</strong>
    <p>A replica often starts as a restored <span class="ic">mysqldump</span> snapshot, then replays the binary log from that moment. Backups and replication are partners, not rivals.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01F00000-0000-4000-8000-000000000427',
  '01F00000-0000-4000-8000-000000000327',
  1,
  'Monitoring & the Ops Capstone',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Monitoring &amp; the Ops Capstone</title>
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
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Monitoring &amp; the Ops Capstone</h1>
  <p>Monitoring turns a database from a black box into an instrument you can read. This capstone lesson pulls the whole course together: check the vitals, watch the metrics, and build a sane operations routine.</p>
  <h2>Status and variables</h2>
  <pre class="code-block">SHOW GLOBAL STATUS LIKE 'Threads_connected';
SHOW GLOBAL VARIABLES LIKE 'max_connections';
SHOW PROCESSLIST;</pre>
  <p><span class="ic">Threads_connected</span> near <span class="ic">max_connections</span> means you are exhausting connection capacity. Investigate leaks in the app pool before raising the ceiling.</p>
  <h2>Performance Schema &amp; sys</h2>
  <pre class="code-block">SELECT * FROM sys.statement_analysis ORDER BY total_latency DESC LIMIT 10;</pre>
  <ul>
    <li><span class="ic">performance_schema</span> records fine-grained execution events.</li>
    <li>The <span class="ic">sys</span> schema is a set of friendly views over it — less setup, faster answers.</li>
    <li>Top offenders by latency are your rewrites of tomorrow.</li>
  </ul>
  <h2>Slow query log</h2>
  <pre class="code-block">slow_query_log = ON
long_query_time = 1</pre>
  <p>Statements slower than <span class="ic">long_query_time</span> seconds land in the slow query log. Mine that log — not guesswork — for the queries worth optimizing.</p>
  <h2>The operator&rsquo;s checklist</h2>
  <table>
    <tr><th>Action</th><th>Frequency</th></tr>
    <tr><td>Backup and restore drill</td><td>Daily dump, quarterly restore</td></tr>
    <tr><td>Check replication lag</td><td>Every few minutes</td></tr>
    <tr><td>Review slow log top queries</td><td>Weekly</td></tr>
    <tr><td>Audit grants and accounts</td><td>Monthly</td></tr>
    <tr><td>Disk, memory, CPU headroom</td><td>Continuously</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Thresholds move</strong>
    <p>Set alerts at levels that mean something: p95 latency crossing a budget makes better alarms than raw CPU percentage. You do the math and the MySQL does the work.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Capstone: your own instance</strong>
    <p>Install a scratch server, configure binlogs, take a dump, restore it, add a replication pair, and watch lag on a slow query log. Walk every step of the course on real data once and the concepts stop being slideware.</p>
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
  ('01F00000-0000-4000-8000-000000000501', '01F00000-0000-4000-8000-000000000303',
   'Which command installs the MySQL server on Ubuntu?',
   'apt installs the mysql-server package from the default repository.', 1),
  ('01F00000-0000-4000-8000-000000000502', '01F00000-0000-4000-8000-000000000303',
   'Which TCP port does MySQL use by default?',
   '3306 is the standard MySQL listener port.', 2),
  ('01F00000-0000-4000-8000-000000000503', '01F00000-0000-4000-8000-000000000303',
   'Where does MySQL usually keep data files on Linux?',
   '/var/lib/mysql is the default datadir in MySQL packaging.', 3),
  ('01F00000-0000-4000-8000-000000000504', '01F00000-0000-4000-8000-000000000306',
   'Which command opens the interactive MySQL client?',
   'mysql -u root -p starts the client and asks for the password.', 1),
  ('01F00000-0000-4000-8000-000000000505', '01F00000-0000-4000-8000-000000000306',
   'Which file group holds server startup settings?',
   'The [mysqld] group in my.cnf configures the server process.', 2),
  ('01F00000-0000-4000-8000-000000000506', '01F00000-0000-4000-8000-000000000306',
   'What does SHOW VARIABLES display?',
   'It lists system variables and their current values.', 3),
  ('01F00000-0000-4000-8000-000000000507', '01F00000-0000-4000-8000-000000000309',
   'Which statement creates a new database user account?',
   'CREATE USER defines the account before grants are added.', 1),
  ('01F00000-0000-4000-8000-000000000508', '01F00000-0000-4000-8000-000000000309',
   'What does the GRANT statement do?',
   'GRANT assigns privileges to a specific user account.', 2),
  ('01F00000-0000-4000-8000-000000000509', '01F00000-0000-4000-8000-000000000309',
   'Which statement takes privileges away from a user?',
   'REVOKE removes previously granted privileges.', 3),
  ('01F00000-0000-4000-8000-000000000510', '01F00000-0000-4000-8000-000000000312',
   'Which authentication plugin is the MySQL 8 default?',
   'caching_sha2_password provides strong password-based auth by default.', 1),
  ('01F00000-0000-4000-8000-000000000511', '01F00000-0000-4000-8000-000000000312',
   'What does bind-address = 127.0.0.1 accomplish?',
   'The server then accepts network connections only from localhost.', 2),
  ('01F00000-0000-4000-8000-000000000512', '01F00000-0000-4000-8000-000000000312',
   'Which database table stores account authentication data?',
   'The mysql.user table holds user accounts and auth plugin info.', 3),
  ('01F00000-0000-4000-8000-000000000513', '01F00000-0000-4000-8000-000000000315',
   'Which storage engine supports transactions and row-level locking?',
   'InnoDB is the transactional default engine of MySQL.' , 1),
  ('01F00000-0000-4000-8000-000000000514', '01F00000-0000-4000-8000-000000000315',
   'Which isolation level is MySQL default for InnoDB?',
   'REPEATABLE READ is the default isolation level.', 2),
  ('01F00000-0000-4000-8000-000000000515', '01F00000-0000-4000-8000-000000000315',
   'What makes transaction changes permanent?',
   'COMMIT persists the current transaction, ending it.', 3),
  ('01F00000-0000-4000-8000-000000000516', '01F00000-0000-4000-8000-000000000318',
   'Which type stores exact decimal values for currency?',
   'DECIMAL stores exact decimals without float rounding.', 1),
  ('01F00000-0000-4000-8000-000000000517', '01F00000-0000-4000-8000-000000000318',
   'What does a FOREIGN KEY constraint enforce?',
   'It enforces referential integrity with a parent table.', 2),
  ('01F00000-0000-4000-8000-000000000518', '01F00000-0000-4000-8000-000000000318',
   'Which normal form removes partial key dependencies?',
   '2NF removes partial dependencies on part of a composite key.', 3),
  ('01F00000-0000-4000-8000-000000000519', '01F00000-0000-4000-8000-000000000321',
   'What data structure does an InnoDB index use?',
   'A B-tree keeps data sorted for fast lookups.', 1),
  ('01F00000-0000-4000-8000-000000000520', '01F00000-0000-4000-8000-000000000321',
   'Indexing a low-selectivity column usually...',
   'A low-selectivity index matches too many rows to be useful.', 2),
  ('01F00000-0000-4000-8000-000000000521', '01F00000-0000-4000-8000-000000000321',
   'A composite index (a, b) can serve a filter on...',
   'MySQL uses the leftmost prefix, so a alone or a and b work.', 3),
  ('01F00000-0000-4000-8000-000000000522', '01F00000-0000-4000-8000-000000000324',
   'Which EXPLAIN column shows the index actually used?',
   'The key column names the chosen index, NULL when none.', 1),
  ('01F00000-0000-4000-8000-000000000523', '01F00000-0000-4000-8000-000000000324',
   'Which EXPLAIN access type means a full table scan?',
   'ALL scans every row and is the classic missing-index signal.', 2),
  ('01F00000-0000-4000-8000-000000000524', '01F00000-0000-4000-8000-000000000324',
   'How does YEAR(created_at) = 2026 affect a lookup?',
   'Wrapping the column in a function blocks index usage.', 3),
  ('01F00000-0000-4000-8000-000000000525', '01F00000-0000-4000-8000-000000000328',
   'Which tool produces portable logical backups?',
   'mysqldump exports tables as SQL statements.', 1),
  ('01F00000-0000-4000-8000-000000000526', '01F00000-0000-4000-8000-000000000328',
   'What does --single-transaction do in mysqldump?',
   'It takes a consistent InnoDB snapshot without long write locks.', 2),
  ('01F00000-0000-4000-8000-000000000527', '01F00000-0000-4000-8000-000000000328',
   'In replication, a replica reads changes from...',
   'The source binary log drives the replica apply stream.', 3),
  ('01F00000-0000-4000-8000-000000000528', '01F00000-0000-4000-8000-000000000328',
   'What is replication lag?',
   'Lag is how far behind the replica is from the source.', 4),
  ('01F00000-0000-4000-8000-000000000529', '01F00000-0000-4000-8000-000000000328',
   'Which schema offers low-level runtime performance data?',
   'performance_schema records execution events the server runs.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): install command
  ('01F00000-0000-4000-8000-000000001001', '01F00000-0000-4000-8000-000000000501', 'apt install mysql-server', TRUE,  1),
  ('01F00000-0000-4000-8000-000000001002', '01F00000-0000-4000-8000-000000000501', 'npm install mysql', FALSE, 2),
  ('01F00000-0000-4000-8000-000000001003', '01F00000-0000-4000-8000-000000000501', 'pip install mysql', FALSE, 3),
  ('01F00000-0000-4000-8000-000000001004', '01F00000-0000-4000-8000-000000000501', 'docker exec mysql', FALSE, 4),
  -- Q2 (502): default port
  ('01F00000-0000-4000-8000-000000001005', '01F00000-0000-4000-8000-000000000502', '5432', FALSE, 1),
  ('01F00000-0000-4000-8000-000000001006', '01F00000-0000-4000-8000-000000000502', '3306', TRUE,  2),
  ('01F00000-0000-4000-8000-000000001007', '01F00000-0000-4000-8000-000000000502', '8080', FALSE, 3),
  ('01F00000-0000-4000-8000-000000001008', '01F00000-0000-4000-8000-000000000502', '6379', FALSE, 4),
  -- Q3 (503): datadir
  ('01F00000-0000-4000-8000-000000001009', '01F00000-0000-4000-8000-000000000503', '/var/www', FALSE, 1),
  ('01F00000-0000-4000-8000-000000001010', '01F00000-0000-4000-8000-000000000503', '/log', FALSE, 2),
  ('01F00000-0000-4000-8000-000000001011', '01F00000-0000-4000-8000-000000000503', '/var/lib/mysql', TRUE,  3),
  ('01F00000-0000-4000-8000-000000001012', '01F00000-0000-4000-8000-000000000503', '/etc', FALSE, 4),
  -- Q4 (504): client command
  ('01F00000-0000-4000-8000-000000001013', '01F00000-0000-4000-8000-000000000504', 'mysql -u root -p', TRUE,  1),
  ('01F00000-0000-4000-8000-000000001014', '01F00000-0000-4000-8000-000000000504', 'mysqld --start', FALSE, 2),
  ('01F00000-0000-4000-8000-000000001015', '01F00000-0000-4000-8000-000000000504', 'mysqladmin shell', FALSE, 3),
  ('01F00000-0000-4000-8000-000000001016', '01F00000-0000-4000-8000-000000000504', 'mysqldump -i', FALSE, 4),
  -- Q5 (505): config group
  ('01F00000-0000-4000-8000-000000001017', '01F00000-0000-4000-8000-000000000505', '[client]', FALSE, 1),
  ('01F00000-0000-4000-8000-000000001018', '01F00000-0000-4000-8000-000000000505', '[mysqld]', TRUE,  2),
  ('01F00000-0000-4000-8000-000000001019', '01F00000-0000-4000-8000-000000000505', '[mysqlclust]', FALSE, 3),
  ('01F00000-0000-4000-8000-000000001020', '01F00000-0000-4000-8000-000000000505', '[backup]', FALSE, 4),
  -- Q6 (506): SHOW VARIABLES
  ('01F00000-0000-4000-8000-000000001021', '01F00000-0000-4000-8000-000000000506', 'Error messages', FALSE, 1),
  ('01F00000-0000-4000-8000-000000001022', '01F00000-0000-4000-8000-000000000506', 'Table schemas', FALSE, 2),
  ('01F00000-0000-4000-8000-000000001023', '01F00000-0000-4000-8000-000000000506', 'Server system variables', TRUE,  3),
  ('01F00000-0000-4000-8000-000000001024', '01F00000-0000-4000-8000-000000000506', 'Grant history', FALSE, 4),
  -- Q7 (507): CREATE USER
  ('01F00000-0000-4000-8000-000000001025', '01F00000-0000-4000-8000-000000000507', 'ADD USER', FALSE, 1),
  ('01F00000-0000-4000-8000-000000001026', '01F00000-0000-4000-8000-000000000507', 'CREATE USER', TRUE,  2),
  ('01F00000-0000-4000-8000-000000001027', '01F00000-0000-4000-8000-000000000507', 'NEW ACCOUNT', FALSE, 3),
  ('01F00000-0000-4000-8000-000000001028', '01F00000-0000-4000-8000-000000000507', 'INSERT LOGIN', FALSE, 4),
  -- Q8 (508): GRANT
  ('01F00000-0000-4000-8000-000000001029', '01F00000-0000-4000-8000-000000000508', 'Drops a database', FALSE, 1),
  ('01F00000-0000-4000-8000-000000001030', '01F00000-0000-4000-8000-000000000508', 'Resets the password', FALSE, 2),
  ('01F00000-0000-4000-8000-000000001031', '01F00000-0000-4000-8000-000000000508', 'Assigns privileges to an account', TRUE,  3),
  ('01F00000-0000-4000-8000-000000001032', '01F00000-0000-4000-8000-000000000508', 'Backs up grant tables', FALSE, 4),
  -- Q9 (509): REVOKE
  ('01F00000-0000-4000-8000-000000001033', '01F00000-0000-4000-8000-000000000509', 'REVOKE', TRUE,  1),
  ('01F00000-0000-4000-8000-000000001034', '01F00000-0000-4000-8000-000000000509', 'DROP PRIVILEGE', FALSE, 2),
  ('01F00000-0000-4000-8000-000000001035', '01F00000-0000-4000-8000-000000000509', 'DELETE USER', FALSE, 3),
  ('01F00000-0000-4000-8000-000000001036', '01F00000-0000-4000-8000-000000000509', 'CLEAR PERMS', FALSE, 4),
  -- Q10 (510): default auth plugin
  ('01F00000-0000-4000-8000-000000001037', '01F00000-0000-4000-8000-000000000510', 'mysql_old_password', FALSE, 1),
  ('01F00000-0000-4000-8000-000000001038', '01F00000-0000-4000-8000-000000000510', 'caching_sha2_password', TRUE,  2),
  ('01F00000-0000-4000-8000-000000001039', '01F00000-0000-4000-8000-000000000510', 'auth_socket_only', FALSE, 3),
  ('01F00000-0000-4000-8000-000000001040', '01F00000-0000-4000-8000-000000000510', 'pam_password', FALSE, 4),
  -- Q11 (511): bind-address
  ('01F00000-0000-4000-8000-000000001041', '01F00000-0000-4000-8000-000000000511', 'Listens on all interfaces', FALSE, 1),
  ('01F00000-0000-4000-8000-000000001042', '01F00000-0000-4000-8000-000000000511', 'Accepts local connections only', TRUE,  2),
  ('01F00000-0000-4000-8000-000000001043', '01F00000-0000-4000-8000-000000000511', 'Enables IPv6 only', FALSE, 3),
  ('01F00000-0000-4000-8000-000000001044', '01F00000-0000-4000-8000-000000000511', 'Turns off TCP entirely', FALSE, 4),
  -- Q12 (512): auth table
  ('01F00000-0000-4000-8000-000000001045', '01F00000-0000-4000-8000-000000000512', 'information_schema.tables', FALSE, 1),
  ('01F00000-0000-4000-8000-000000001046', '01F00000-0000-4000-8000-000000000512', 'performance_schema.users', FALSE, 2),
  ('01F00000-0000-4000-8000-000000001047', '01F00000-0000-4000-8000-000000000512', 'mysql.user', TRUE,  3),
  ('01F00000-0000-4000-8000-000000001048', '01F00000-0000-4000-8000-000000000512', 'sys.accounts', FALSE, 4),
  -- Q13 (513): default engine
  ('01F00000-0000-4000-8000-000000001049', '01F00000-0000-4000-8000-000000000513', 'InnoDB', TRUE,  1),
  ('01F00000-0000-4000-8000-000000001050', '01F00000-0000-4000-8000-000000000513', 'MyISAM', FALSE, 2),
  ('01F00000-0000-4000-8000-000000001051', '01F00000-0000-4000-8000-000000000513', 'MEMORY', FALSE, 3),
  ('01F00000-0000-4000-8000-000000001052', '01F00000-0000-4000-8000-000000000513', 'CSV', FALSE, 4),
  -- Q14 (514): isolation level
  ('01F00000-0000-4000-8000-000000001053', '01F00000-0000-4000-8000-000000000514', 'READ UNCOMMITTED', FALSE, 1),
  ('01F00000-0000-4000-8000-000000001054', '01F00000-0000-4000-8000-000000000514', 'REPEATABLE READ', TRUE,  2),
  ('01F00000-0000-4000-8000-000000001055', '01F00000-0000-4000-8000-000000000514', 'SERIALIZABLE', FALSE, 3),
  ('01F00000-0000-4000-8000-000000001056', '01F00000-0000-4000-8000-000000000514', 'READ COMMITTED', FALSE, 4),
  -- Q15 (515): COMMIT
  ('01F00000-0000-4000-8000-000000001057', '01F00000-0000-4000-8000-000000000515', 'COMMIT', TRUE,  1),
  ('01F00000-0000-4000-8000-000000001058', '01F00000-0000-4000-8000-000000000515', 'ROLLBACK', FALSE, 2),
  ('01F00000-0000-4000-8000-000000001059', '01F00000-0000-4000-8000-000000000515', 'SAVEPOINT', FALSE, 3),
  ('01F00000-0000-4000-8000-000000001060', '01F00000-0000-4000-8000-000000000515', 'LOCK TABLES', FALSE, 4),
  -- Q16 (516): DECIMAL
  ('01F00000-0000-4000-8000-000000001061', '01F00000-0000-4000-8000-000000000516', 'FLOAT', FALSE, 1),
  ('01F00000-0000-4000-8000-000000001062', '01F00000-0000-4000-8000-000000000516', 'DOUBLE', FALSE, 2),
  ('01F00000-0000-4000-8000-000000001063', '01F00000-0000-4000-8000-000000000516', 'DECIMAL', TRUE,  3),
  ('01F00000-0000-4000-8000-000000001064', '01F00000-0000-4000-8000-000000000516', 'REAL', FALSE, 4),
  -- Q17 (517): FOREIGN KEY
  ('01F00000-0000-4000-8000-000000001065', '01F00000-0000-4000-8000-000000000517', 'Stores JSON documents', FALSE, 1),
  ('01F00000-0000-4000-8000-000000001066', '01F00000-0000-4000-8000-000000000517', 'Enforces referential integrity', TRUE,  2),
  ('01F00000-0000-4000-8000-000000001067', '01F00000-0000-4000-8000-000000000517', 'Indexes full text', FALSE, 3),
  ('01F00000-0000-4000-8000-000000001068', '01F00000-0000-4000-8000-000000000517', 'Stores cached results', FALSE, 4),
  -- Q18 (518): 2NF
  ('01F00000-0000-4000-8000-000000001069', '01F00000-0000-4000-8000-000000000518', '1NF', FALSE, 1),
  ('01F00000-0000-4000-8000-000000001070', '01F00000-0000-4000-8000-000000000518', '2NF', TRUE,  2),
  ('01F00000-0000-4000-8000-000000001071', '01F00000-0000-4000-8000-000000000518', '3NF', FALSE, 3),
  ('01F00000-0000-4000-8000-000000001072', '01F00000-0000-4000-8000-000000000518', 'BCNF', FALSE, 4),
  -- Q19 (519): B-tree
  ('01F00000-0000-4000-8000-000000001073', '01F00000-0000-4000-8000-000000000519', 'B-tree', TRUE,  1),
  ('01F00000-0000-4000-8000-000000001074', '01F00000-0000-4000-8000-000000000519', 'Linked list', FALSE, 2),
  ('01F00000-0000-4000-8000-000000001075', '01F00000-0000-4000-8000-000000000519', 'Hash table only', FALSE, 3),
  ('01F00000-0000-4000-8000-000000001076', '01F00000-0000-4000-8000-000000000519', 'Heap tree', FALSE, 4),
  -- Q20 (520): low selectivity
  ('01F00000-0000-4000-8000-000000001077', '01F00000-0000-4000-8000-000000000520', 'Speeds up every write', FALSE, 1),
  ('01F00000-0000-4000-8000-000000001078', '01F00000-0000-4000-8000-000000000520', 'Matches most rows and rarely helps', TRUE,  2),
  ('01F00000-0000-4000-8000-000000001079', '01F00000-0000-4000-8000-000000000520', 'Replaces the primary key', FALSE, 3),
  ('01F00000-0000-4000-8000-000000001080', '01F00000-0000-4000-8000-000000000520', 'Shrinks the table file', FALSE, 4),
  -- Q21 (521): composite prefix
  ('01F00000-0000-4000-8000-000000001081', '01F00000-0000-4000-8000-000000000521', 'b alone', FALSE, 1),
  ('01F00000-0000-4000-8000-000000001082', '01F00000-0000-4000-8000-000000000521', 'a and b, or a alone', TRUE,  2),
  ('01F00000-0000-4000-8000-000000001083', '01F00000-0000-4000-8000-000000000521', 'Any column in any order', FALSE, 3),
  ('01F00000-0000-4000-8000-000000001084', '01F00000-0000-4000-8000-000000000521', 'Only the second column', FALSE, 4),
  -- Q22 (522): EXPLAIN key
  ('01F00000-0000-4000-8000-000000001085', '01F00000-0000-4000-8000-000000000522', 'key', TRUE,  1),
  ('01F00000-0000-4000-8000-000000001086', '01F00000-0000-4000-8000-000000000522', 'type', FALSE, 2),
  ('01F00000-0000-4000-8000-000000001087', '01F00000-0000-4000-8000-000000000522', 'Extra', FALSE, 3),
  ('01F00000-0000-4000-8000-000000001088', '01F00000-0000-4000-8000-000000000522', 'rows', FALSE, 4),
  -- Q23 (523): full scan type
  ('01F00000-0000-4000-8000-000000001089', '01F00000-0000-4000-8000-000000000523', 'const', FALSE, 1),
  ('01F00000-0000-4000-8000-000000001090', '01F00000-0000-4000-8000-000000000523', 'eq_ref', FALSE, 2),
  ('01F00000-0000-4000-8000-000000001091', '01F00000-0000-4000-8000-000000000523', 'ALL', TRUE,  3),
  ('01F00000-0000-4000-8000-000000001092', '01F00000-0000-4000-8000-000000000523', 'range', FALSE, 4),
  -- Q24 (524): function on column
  ('01F00000-0000-4000-8000-000000001093', '01F00000-0000-4000-8000-000000000524', 'Speeds up the lookup', FALSE, 1),
  ('01F00000-0000-4000-8000-000000001094', '01F00000-0000-4000-8000-000000000524', 'Blocks index usage', TRUE,  2),
  ('01F00000-0000-4000-8000-000000001095', '01F00000-0000-4000-8000-000000000524', 'Creates a temporary index', FALSE, 3),
  ('01F00000-0000-4000-8000-000000001096', '01F00000-0000-4000-8000-000000000524', 'Converts to a scan too', FALSE, 4),
  -- Q25 (525): logical backup
  ('01F00000-0000-4000-8000-000000001097', '01F00000-0000-4000-8000-000000000525', 'mysqldump', TRUE,  1),
  ('01F00000-0000-4000-8000-000000001098', '01F00000-0000-4000-8000-000000000525', 'mysqlcheck', FALSE, 2),
  ('01F00000-0000-4000-8000-000000001099', '01F00000-0000-4000-8000-000000000525', 'mysqladmin', FALSE, 3),
  ('01F00000-0000-4000-8000-000000001100', '01F00000-0000-4000-8000-000000000525', 'mysql_secure_installation', FALSE, 4),
  -- Q26 (526): --single-transaction
  ('01F00000-0000-4000-8000-000000001101', '01F00000-0000-4000-8000-000000000526', 'Locks the whole database', FALSE, 1),
  ('01F00000-0000-4000-8000-000000001102', '01F00000-0000-4000-8000-000000000526', 'Takes a consistent snapshot without long write locks', TRUE,  2),
  ('01F00000-0000-4000-8000-000000001103', '01F00000-0000-4000-8000-000000000526', 'Drops duplicate rows', FALSE, 3),
  ('01F00000-0000-4000-8000-000000001104', '01F00000-0000-4000-8000-000000000526', 'Encrypts the dump', FALSE, 4),
  -- Q27 (527): replication source
  ('01F00000-0000-4000-8000-000000001105', '01F00000-0000-4000-8000-000000000527', 'The slow query log', FALSE, 1),
  ('01F00000-0000-4000-8000-000000001106', '01F00000-0000-4000-8000-000000000527', 'The source binary log', TRUE,  2),
  ('01F00000-0000-4000-8000-000000001107', '01F00000-0000-4000-8000-000000000527', 'The error log', FALSE, 3),
  ('01F00000-0000-4000-8000-000000001108', '01F00000-0000-4000-8000-000000000527', 'The relay log of the client', FALSE, 4),
  -- Q28 (528): replication lag
  ('01F00000-0000-4000-8000-000000001109', '01F00000-0000-4000-8000-000000000528', 'Time to run mysqldump', FALSE, 1),
  ('01F00000-0000-4000-8000-000000001110', '01F00000-0000-4000-8000-000000000528', 'How far the replica trails the source', TRUE,  2),
  ('01F00000-0000-4000-8000-000000001111', '01F00000-0000-4000-8000-000000000528', 'Query response latency', FALSE, 3),
  ('01F00000-0000-4000-8000-000000001112', '01F00000-0000-4000-8000-000000000528', 'Binary log file size', FALSE, 4),
  -- Q29 (529): performance schema
  ('01F00000-0000-4000-8000-000000001113', '01F00000-0000-4000-8000-000000000529', 'performance_schema', TRUE,  1),
  ('01F00000-0000-4000-8000-000000001114', '01F00000-0000-4000-8000-000000000529', 'mysql', FALSE, 2),
  ('01F00000-0000-4000-8000-000000001115', '01F00000-0000-4000-8000-000000000529', 'test', FALSE, 3),
  ('01F00000-0000-4000-8000-000000001116', '01F00000-0000-4000-8000-000000000529', 'information_schema', FALSE, 4)
ON CONFLICT (id) DO NOTHING;

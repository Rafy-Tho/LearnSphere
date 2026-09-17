-- ============================================================================
-- SEED 032: Complete course — "CI/CD with GitHub Actions"
-- ----------------------------------------------------------------------------
-- Instructor : David Kim          (10000000-0000-4000-8000-000000000004)
-- Category   : DevOps & CI/CD     (20000000-0000-4000-8000-000000000009)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Foundations of CI/CD   → C1 Why CI/CD · C2 GitHub Actions Fundamentals
--   M2 Authoring Workflows    → C3 Anatomy of a Workflow · C4 Jobs, Steps & Runners
--   M3 Triggers & Config      → C5 Triggers, Env & Secrets · C6 Caching & Matrices
--   M4 Automation & Delivery  → C7 Testing & Reusable Workflows · C8 Artifacts & Deploys
--   M5 Capstone: PIPELINE     → C9 Security Hardening · C10 Building the Pipeline
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
  '02000000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000004',
  '20000000-0000-4000-8000-000000000009',
  'CI/CD with GitHub Actions',
  'cicd-with-github-actions',
  'Automate the whole delivery loop with GitHub Actions. Master workflows, jobs, triggers, runners, secrets, caching, matrix builds, artifacts, and deployments — then harden and ship a complete production-quality pipeline that builds, tests, and deploys on every push.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  30
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('02000000-0000-4000-8000-000000000011', '02000000-0000-4000-8000-000000000001', 'Explain the CI/CD workflow and define pipelines as version-controlled code.',  1),
  ('02000000-0000-4000-8000-000000000012', '02000000-0000-4000-8000-000000000001', 'Author correct workflow YAML: events, jobs, steps, and dependencies.',        2),
  ('02000000-0000-4000-8000-000000000013', '02000000-0000-4000-8000-000000000001', 'Accelerate pipelines with caching, matrix builds, and artifact reuse.',       3),
  ('02000000-0000-4000-8000-000000000014', '02000000-0000-4000-8000-000000000001', 'Automate quality gates, releases, and environment-guarded deployments.',      4),
  ('02000000-0000-4000-8000-000000000015', '02000000-0000-4000-8000-000000000001', 'Harden, build, and operate a complete production pipeline with confidence.',  5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('02000000-0000-4000-8000-000000000101', '02000000-0000-4000-8000-000000000001', 1, 'Foundations of CI/CD',    'Why teams automate building, testing, and shipping.',                              'PUBLISHED'),
  ('02000000-0000-4000-8000-000000000102', '02000000-0000-4000-8000-000000000001', 2, 'Authoring Workflows',     'Write and reason about workflow YAML from a blank file to a run.',                 'PUBLISHED'),
  ('02000000-0000-4000-8000-000000000103', '02000000-0000-4000-8000-000000000001', 3, 'Triggers & Configuration','Control when pipelines run and how they receive configuration and speed.',        'PUBLISHED'),
  ('02000000-0000-4000-8000-000000000104', '02000000-0000-4000-8000-000000000001', 4, 'Automation & Delivery',   'Quality gates, shared automation, artifacts, and guarded deployments.',           'PUBLISHED'),
  ('02000000-0000-4000-8000-000000000105', '02000000-0000-4000-8000-000000000001', 5, 'Capstone: Production Pipeline', 'Harden, assemble, and operate the capstone pipeline end to end.',            'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('02000000-0000-4000-8000-000000000201', '02000000-0000-4000-8000-000000000101', 1, 'Why CI/CD',                'The problem automation solves and the payoff.',   'PUBLISHED'),
  ('02000000-0000-4000-8000-000000000202', '02000000-0000-4000-8000-000000000101', 2, 'GitHub Actions Fundamentals', 'The mental model for pipelines as code.',        'PUBLISHED'),
  ('02000000-0000-4000-8000-000000000203', '02000000-0000-4000-8000-000000000102', 1, 'Anatomy of a Workflow',    'From a blank YAML file to a running pipeline.',   'PUBLISHED'),
  ('02000000-0000-4000-8000-000000000204', '02000000-0000-4000-8000-000000000102', 2, 'Jobs, Steps & Runners',    'How work is scheduled and where it executes.',    'PUBLISHED'),
  ('02000000-0000-4000-8000-000000000205', '02000000-0000-4000-8000-000000000103', 1, 'Triggers, Env & Secrets',  'What starts a run and what configuration it gets.','PUBLISHED'),
  ('02000000-0000-4000-8000-000000000206', '02000000-0000-4000-8000-000000000103', 2, 'Caching & Matrix Builds',  'Reuse work and test across many versions.',      'PUBLISHED'),
  ('02000000-0000-4000-8000-000000000207', '02000000-0000-4000-8000-000000000104', 1, 'Testing & Reusable Workflows', 'Quality gates and shared pipeline logic.',     'PUBLISHED'),
  ('02000000-0000-4000-8000-000000000208', '02000000-0000-4000-8000-000000000104', 2, 'Artifacts & Deployments',  'Shipping built results to guarded environments.', 'PUBLISHED'),
  ('02000000-0000-4000-8000-000000000209', '02000000-0000-4000-8000-000000000105', 1, 'Security Hardening',       'Locking down tokens, actions, and secrets.',     'PUBLISHED'),
  ('02000000-0000-4000-8000-000000000210', '02000000-0000-4000-8000-000000000105', 2, 'Building the Capstone Pipeline', 'From plan to production with confidence.',    'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 02000000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('02000000-0000-4000-8000-000000000301', '02000000-0000-4000-8000-000000000201', 1, 'What is CI/CD?',                    'Continuous integration and delivery explained with the business case.',      'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  6),
  ('02000000-0000-4000-8000-000000000302', '02000000-0000-4000-8000-000000000201', 2, 'GitHub Actions Core Concepts',       'Workflows, events, jobs, steps, runs, and runners.',                          'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('02000000-0000-4000-8000-000000000303', '02000000-0000-4000-8000-000000000201', 3, 'CI/CD Foundations Quiz',              'Check your understanding of CI and CD fundamentals.',                         'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('02000000-0000-4000-8000-000000000304', '02000000-0000-4000-8000-000000000202', 1, 'Anatomy of a Workflow File',          'The YAML sections every workflow needs and why.',                              'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('02000000-0000-4000-8000-000000000305', '02000000-0000-4000-8000-000000000202', 2, 'Jobs, Steps & Dependencies',          'Schedule steps, order jobs, and share values between them.',                  'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('02000000-0000-4000-8000-000000000306', '02000000-0000-4000-8000-000000000202', 3, 'Workflow Anatomy Quiz',               'Test your grasp of workflow structure and job dependencies.',                 'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('02000000-0000-4000-8000-000000000307', '02000000-0000-4000-8000-000000000203', 1, 'Triggers & Events',                   'Push, pull requests, schedules, and manual dispatch.',                        'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('02000000-0000-4000-8000-000000000308', '02000000-0000-4000-8000-000000000203', 2, 'Runners & Operating Systems',         'Hosted and self-hosted runners and choosing an OS.',                          'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('02000000-0000-4000-8000-000000000309', '02000000-0000-4000-8000-000000000203', 3, 'Triggers & Runners Quiz',             'Verify your trigger and runner knowledge.',                                   'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('02000000-0000-4000-8000-000000000310', '02000000-0000-4000-8000-000000000204', 1, 'Environment Variables & Secrets',     'Inject configuration without hard-coding credentials.',                       'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('02000000-0000-4000-8000-000000000311', '02000000-0000-4000-8000-000000000204', 2, 'Caching Dependencies',                'Speed up installs with actions/cache and lockfile-based keys.',                'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  9),
  ('02000000-0000-4000-8000-000000000312', '02000000-0000-4000-8000-000000000204', 3, 'Env, Secrets & Caching Quiz',         'Check your configuration and caching skills.',                               'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('02000000-0000-4000-8000-000000000313', '02000000-0000-4000-8000-000000000205', 1, 'Matrix Builds',                       'Run one job across many versions and platform combinations.',                 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('02000000-0000-4000-8000-000000000314', '02000000-0000-4000-8000-000000000205', 2, 'Artifacts & Dependency Management',   'Pass files between jobs and keep them for download.',                         'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('02000000-0000-4000-8000-000000000315', '02000000-0000-4000-8000-000000000205', 3, 'Matrices & Artifacts Quiz',           'Test your matrix and artifact knowledge.',                                   'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('02000000-0000-4000-8000-000000000316', '02000000-0000-4000-8000-000000000206', 1, 'Automating Tests & Coverage',         'Unit and integration gates, service containers, and coverage budgets.',       'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('02000000-0000-4000-8000-000000000317', '02000000-0000-4000-8000-000000000206', 2, 'Reusable Workflows',                  'Share pipeline logic with caller composition, inputs, and secrets.',          'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('02000000-0000-4000-8000-000000000318', '02000000-0000-4000-8000-000000000206', 3, 'Testing & Reuse Quiz',                'Verify your testing and reuse knowledge.',                                   'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('02000000-0000-4000-8000-000000000319', '02000000-0000-4000-8000-000000000207', 1, 'Building & Publishing Releases',      'Tag versions, build distributions, and publish to registries and releases.',  'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 11),
  ('02000000-0000-4000-8000-000000000320', '02000000-0000-4000-8000-000000000207', 2, 'Deployments & Environments',          'Gate deploys with environments, reviewers, and wait timers.',                 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 11),
  ('02000000-0000-4000-8000-000000000321', '02000000-0000-4000-8000-000000000207', 3, 'Build & Deploy Quiz',                 'Check your packaging and deployment knowledge.',                              'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('02000000-0000-4000-8000-000000000322', '02000000-0000-4000-8000-000000000208', 1, 'Security Hardening for Actions',      'Least-privilege tokens, pinned actions, and secret hygiene.',                 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('02000000-0000-4000-8000-000000000323', '02000000-0000-4000-8000-000000000208', 2, 'Designing a Production Pipeline',     'Plan stages, quality gates, concurrency, and rollback.',                      'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  9),
  ('02000000-0000-4000-8000-000000000324', '02000000-0000-4000-8000-000000000208', 3, 'Security & Pipeline Design Quiz',     'Verify hardening and pipeline design skills.',                                'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('02000000-0000-4000-8000-000000000325', '02000000-0000-4000-8000-000000000209', 1, 'Capstone: Building the Pipeline',     'Assemble the full pipeline: lint, test, build, and deploy.',                  'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('02000000-0000-4000-8000-000000000326', '02000000-0000-4000-8000-000000000210', 1, 'Capstone: Notifications, Badges & Docs', 'Status badges, commit statuses, and job summaries.',                       'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  9),
  ('02000000-0000-4000-8000-000000000327', '02000000-0000-4000-8000-000000000210', 2, 'Capstone: Troubleshooting & Optimization', 'Read logs, fix failing runs, and cut wasted time.',                       'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('02000000-0000-4000-8000-000000000328', '02000000-0000-4000-8000-000000000210', 3, 'Final Assessment',                    'Prove your CI/CD with GitHub Actions skills end to end.',                     'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 02000000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '02000000-0000-4000-8000-000000000401',
  '02000000-0000-4000-8000-000000000301',
  1,
  'What is CI/CD?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What is CI/CD?</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #22c55e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dcfce7; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #86efac; }
.dark .lesson-page .ic { background: #052e16; color: #4ade80; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>What is CI/CD?</h1>
  <p>CI/CD is a pair of practices that turn delivery from a frantic manual operation into a repeatable, automated process. <strong>Continuous integration (CI)</strong> merges every developer change into a shared branch frequently and verifies it automatically. <strong>Continuous delivery (CD)</strong> keeps that verified software ready to ship at any moment.</p>
  <h2>Why teams automate</h2>
  <p>Without automation, "it works on my machine" is a real threat. The build is done on a laptop, tests are skipped on Friday afternoons, and releases copy files by hand at midnight. Automation moves all of that into a machine-checked pipeline that runs the same way every time.</p>
  <ul>
    <li>Catch integration conflicts on every merge, not at release time.</li>
    <li>Reject broken changes before they reach teammates.</li>
    <li>Produce a built, tested artifact that is identical every build.</li>
    <li>Free developers from clicking through release checklists.</li>
  </ul>
  <h2>CI vs. continuous delivery vs. deployment</h2>
  <p>Teams often blur the three terms. This table keeps them straight:</p>
  <table>
    <tr><th>Practice</th><th>What it does</th><th>Last step</th></tr>
    <tr><td>CI</td><td>Merge and verify every change</td><td>Tests pass on the main branch</td></tr>
    <tr><td>Continuous delivery</td><td>Everything above + release-ready</td><td>Artifact is ready, deploy is manual</td></tr>
    <tr><td>Continuous deployment</td><td>Everything above + auto-publish</td><td>Change reaches production</td></tr>
  </table>
  <h2>A pipeline as code</h2>
  <p>In this course the pipeline lives in the repository as a YAML file, so it is versioned, reviewed, and shared like any other code:</p>
  <pre class="code-block">name: ci

on: push

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: npm ci
      - run: npm test</pre>
  <div class="callout callout-tip">
    <strong>Start small</strong>
    <p>You do not need a full CD story on day one. Get CI green first; add deployment stages once the pipeline earns trust.</p>
  </div>
  <div class="callout callout-info">
    <strong>Pipeline as code</strong>
    <p>Because the workflow is a file in the repo, a broken pipeline is fixed with a pull request, not a wiki page and a prayer.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02000000-0000-4000-8000-000000000402',
  '02000000-0000-4000-8000-000000000302',
  1,
  'GitHub Actions Core Concepts',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GitHub Actions Core Concepts</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #22c55e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dcfce7; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #86efac; }
.dark .lesson-page .ic { background: #052e16; color: #4ade80; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>GitHub Actions Core Concepts</h1>
  <p>GitHub Actions is CI/CD built directly into GitHub. It watches for <strong>events</strong>, executes <strong>workflows</strong> made of <strong>jobs</strong> and <strong>steps</strong>, and runs them on <strong>runners</strong>. Learn these five nouns and every workflow in existence becomes readable.</p>
  <h2>The five objects</h2>
  <table>
    <tr><th>Concept</th><th>Definition</th></tr>
    <tr><td>Event</td><td>Something that starts a run: a push, a PR, a timer, a button.</td></tr>
    <tr><td>Workflow</td><td>The automation defined in one YAML file under .github/workflows/.</td></tr>
    <tr><td>Job</td><td>A set of steps that run together on one runner.</td></tr>
    <tr><td>Step</td><td>A single unit of work: a command or a reusable action.</td></tr>
    <tr><td>Runner</td><td>The machine that executes the job, hosted or self-hosted.</td></tr>
  </table>
  <h2>A workflow in plain words</h2>
  <p>This tiny file runs the test job whenever someone pushes to main:</p>
  <pre class="code-block">name: Demo
on:
  push:
    branches: [main]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - name: Check out code
        uses: actions/checkout@v4
      - name: Install
        run: npm ci
      - name: Test
        run: npm test</pre>
  <ul>
    <li><span class="ic">events</span> decide <em>when</em> the pipeline runs.</li>
    <li><span class="ic">jobs</span> decide <em>where</em> and <em>what order</em>.</li>
    <li><span class="ic">steps</span> decide <em>what runs</em> on that machine.</li>
  </ul>
  <h2>Actions vs. commands</h2>
  <p>A step can be a plain shell command with <span class="ic">run:</span>, or a packaged action with <span class="ic">uses:</span>. Actions are community-reusable building blocks — check out, setup-node, upload-artifact — so you rarely reinvent the wheel.</p>
  <div class="callout callout-tip">
    <strong>Read runs like a report</strong>
    <p>A green check per job means deploy confidence. Every job and step appears in the Actions tab with its own log — that view is your console.</p>
  </div>
  <div class="callout callout-info">
    <strong>File location</strong>
    <p>Workflows live in <span class="ic">.github/workflows/*.yml</span> or <span class="ic">*.yaml</span>. Multiple workflow files can coexist; each has its own triggers.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02000000-0000-4000-8000-000000000403',
  '02000000-0000-4000-8000-000000000304',
  1,
  'Anatomy of a Workflow File',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Anatomy of a Workflow File</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #22c55e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dcfce7; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #86efac; }
.dark .lesson-page .ic { background: #052e16; color: #4ade80; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Anatomy of a Workflow File</h1>
  <p>A workflow file is YAML with a handful of top-level keys. Master the skeleton once and you can read any workflow in the wild. This annotated example shows every part you will use daily:</p>
  <pre class="code-block">name: Node CI            # display name in the Actions tab
run-name: ci on ${{ github.ref_name }}

on:                      # what starts this workflow
  push:
    branches: [main]
  pull_request:

permissions:             # least privilege for GITHUB_TOKEN
  contents: read

env:                     # variables visible to every job
  NODE_VERSION: "20"

jobs:
  install-test:          # job id — used by needs
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: npm ci
      - run: npm test</pre>
  <h2>The top-level keys</h2>
  <table>
    <tr><th>Key</th><th>Purpose</th></tr>
    <tr><td>name</td><td>Human-friendly label shown in the UI.</td></tr>
    <tr><td>run-name</td><td>Label for a specific run, often built from contexts.</td></tr>
    <tr><td>on</td><td>The triggering events — the only mandatory key.</td></tr>
    <tr><td>permissions</td><td>Scopes granted to the automatic GITHUB_TOKEN.</td></tr>
    <tr><td>env</td><td>Workflow-level environment variables.</td></tr>
    <tr><td>defaults</td><td>Default shell and working-directory for run steps.</td></tr>
    <tr><td>concurrency</td><td>Prevent overlapping runs of the same group.</td></tr>
    <tr><td>jobs</td><td>The work itself: one or more job definitions.</td></tr>
  </table>
  <h2>YAML gotchas</h2>
  <ul>
    <li>Indentation is meaning: two spaces is the convention, tabs break parsing.</li>
    <li>List items and map keys must line up consistently.</li>
    <li>Strings with special characters: quote them with double quotes.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Test locally</strong>
    <p>Run workflows on your laptop with <span class="ic">act</span> to catch YAML and logic errors before the queue does. It simulates events like push and pull_request.</p>
  </div>
  <div class="callout callout-info">
    <strong>A syntax error fails fast</strong>
    <p>GitHub validates the YAML before starting jobs; a malformed file produces an invalid workflow notice in the Actions tab instead of a confusing half-run.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02000000-0000-4000-8000-000000000404',
  '02000000-0000-4000-8000-000000000305',
  1,
  'Jobs, Steps & Dependencies',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Jobs, Steps & Dependencies</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #22c55e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dcfce7; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #86efac; }
.dark .lesson-page .ic { background: #052e16; color: #4ade80; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Jobs, Steps &amp; Dependencies</h1>
  <p>A job is one machine worth of work; a step is a single instruction on that machine. Jobs in the same file run in <strong>parallel</strong> by default. When order matters, express the dependency with <span class="ic">needs</span> so GitHub builds the graph for you.</p>
  <h2>Steps: commands and actions</h2>
  <pre class="code-block">steps:
  - uses: actions/checkout@v4
  - name: Install deps
    run: npm ci
  - name: Run checks
    run: |
      npm run lint
      npm test
  - name: Pick a shell
    shell: bash
    run: echo "hi from $RUNNER_OS"</pre>
  <ul>
    <li><span class="ic">uses:</span> runs a reusable action.</li>
    <li><span class="ic">run:</span> executes an inline command; the <span class="ic">|</span> block folds multiple lines.</li>
    <li><span class="ic">name:</span> makes a step readable in the log.</li>
    <li><span class="ic">shell:</span> chooses bash, pwsh, sh, cmd, or python on the fly.</li>
  </ul>
  <h2>Ordering jobs with needs</h2>
  <p>Here <span class="ic">deploy</span> always waits for <span class="ic">test</span> to pass, while <span class="ic">lint</span> runs at the same time as <span class="ic">test</span>:</p>
  <pre class="code-block">jobs:
  lint:
    runs-on: ubuntu-latest
    steps: [run: npm run lint]
  test:
    runs-on: ubuntu-latest
    steps: [run: npm test]
  deploy:
    runs-on: ubuntu-latest
    needs: [lint, test]
    steps:
      - uses: actions/checkout@v4
      - run: npm run build</pre>
  <h2>Sharing values between jobs</h2>
  <p>Each job gets a fresh machine and fresh environment. Use <span class="ic">job outputs</span> to pass small values, and artifacts (a later lesson) to pass files:</p>
  <pre class="code-block">jobs:
  compute:
    runs-on: ubuntu-latest
    outputs:
      version: ${{ steps.app-version.outputs.value }}
    steps:
      - id: app-version
        run: echo "value=1.2.3" &gt;&gt; "$GITHUB_OUTPUT"
  report:
    runs-on: ubuntu-latest
    needs: compute
    steps:
      - run: echo "Built version ${{ needs.compute.outputs.version }}"</pre>
  <p>The <span class="ic">GITHUB_OUTPUT</span> file writes step outputs; <span class="ic">needs.&lt;job&gt;.outputs.*</span> reads them downstream.</p>
  <div class="callout callout-tip">
    <strong>Small jobs, clear names</strong>
    <p>Split lint, test, build, deploy into separate jobs. Parallel work is faster and a single red job pinpoints the failure instead of a wall of red.</p>
  </div>
  <div class="callout callout-info">
    <strong>Steps never mix machines</strong>
    <p>A variable or file produced in one job is invisible to another unless you explicitly export it. That isolation is what keeps parallel jobs reliable.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02000000-0000-4000-8000-000000000405',
  '02000000-0000-4000-8000-000000000307',
  1,
  'Triggers & Events',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Triggers & Events</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #22c55e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dcfce7; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #86efac; }
.dark .lesson-page .ic { background: #052e16; color: #4ade80; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Triggers &amp; Events</h1>
  <p>The <span class="ic">on</span> key declares the events that start a workflow. Choose triggers deliberately — a noisy pipeline burns minutes and trust.</p>
  <h2>The two workhorses: push and pull_request</h2>
  <pre class="code-block">on:
  push:
    branches: [main]
    paths:
      - "src/**"
      - "package.json"
  pull_request:
    branches: [main]
    types: [opened, synchronize, reopened]</pre>
  <ul>
    <li><span class="ic">push</span> fires when commits land on a branch.</li>
    <li><span class="ic">pull_request</span> fires on PR activity; default types cover open, sync, and reopen.</li>
    <li><span class="ic">paths</span> filters by changed files — skip CI for a README tweak.</li>
  </ul>
  <h2>Scheduled and manual runs</h2>
  <pre class="code-block">on:
  schedule:
    - cron: "0 2 * * *"        # daily at 02:00 UTC, five fields
  workflow_dispatch:
    inputs:
      environment:
        description: Target environment
        required: true
        default: staging</pre>
  <p><span class="ic">schedule</span> uses cron in UTC; note GitHub can delay queued schedules under high load, so do not schedule urgent jobs. <span class="ic">workflow_dispatch</span> adds a <strong>Run workflow</strong> button with optional inputs.</p>
  <h2>Common events at a glance</h2>
  <table>
    <tr><th>Event</th><th>Fires when…</th></tr>
    <tr><td>push</td><td>commits are pushed to a branch or tag</td></tr>
    <tr><td>pull_request</td><td>a pull request is opened, updated, or re-opened</td></tr>
    <tr><td>pull_request_target</td><td>a PR activity with base-branch context (use with care)</td></tr>
    <tr><td>schedule</td><td>a cron expression matches</td></tr>
    <tr><td>workflow_dispatch</td><td>the manual run button is clicked</td></tr>
    <tr><td>workflow_call</td><td>another workflow invokes this one</td></tr>
  </table>
  <p>Inside the run, the <span class="ic">github</span> context exposes event details: <span class="ic">github.event_name</span>, <span class="ic">github.ref</span>, <span class="ic">github.sha</span>, <span class="ic">github.actor</span>, and for PRs <span class="ic">github.event.pull_request.number</span>.</p>
  <div class="callout callout-tip">
    <strong>Scope triggers to what matters</strong>
    <p>Run heavy test jobs on <span class="ic">push</span> to main and <span class="ic">pull_request</span>, but keep docs-only workflows off the critical path with <span class="ic">paths</span> filters.</p>
  </div>
  <div class="callout callout-info">
    <strong>One workflow, several triggers</strong>
    <p>An <span class="ic">on:</span> block can list many events at once. Use <span class="ic">if: github.event_name == 'pull_request'</span> inside a job to branch behavior per event.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02000000-0000-4000-8000-000000000406',
  '02000000-0000-4000-8000-000000000308',
  1,
  'Runners & Operating Systems',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Runners & Operating Systems</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #22c55e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dcfce7; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #86efac; }
.dark .lesson-page .ic { background: #052e16; color: #4ade80; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Runners &amp; Operating Systems</h1>
  <p>A runner is the machine that executes a job. GitHub provides <strong>hosted runners</strong> (managed, auto-updated, billed per minute) and lets you attach <strong>self-hosted runners</strong> on machines you operate.</p>
  <h2>Hosted runner labels</h2>
  <table>
    <tr><th>Label</th><th>Operating system</th><th>Great for</th></tr>
    <tr><td>ubuntu-latest</td><td>Ubuntu Linux</td><td>General CI: Node, Python, Go, containers</td></tr>
    <tr><td>windows-latest</td><td>Windows Server</td><td>.NET, desktop apps, PowerShell</td></tr>
    <tr><td>macos-latest</td><td>macOS</td><td>iOS/macOS builds and signing</td></tr>
    <tr><td>ubuntu-22.04 arm64</td><td>Ubuntu on ARM</td><td>ARM-native containers and builds</td></tr>
  </table>
  <p>Choose a runner with <span class="ic">runs-on</span>:</p>
  <pre class="code-block">jobs:
  linux-checks:
    runs-on: ubuntu-latest
    steps:
      - run: echo "${{ runner.os }} ${{ runner.arch }}"
  self-hosted-queue:
    runs-on: [self-hosted, linux, x64]
    steps:
      - run: echo "Runs on my own server"</pre>
  <p>The <span class="ic">runner</span> context exposes <span class="ic">runner.os</span>, <span class="ic">runner.arch</span>, and <span class="ic">runner.temp</span> — handy for conditional logic.</p>
  <h2>Self-hosted runners: when and why</h2>
  <ul>
    <li>You need private hardware, GPUs, or existing network access.</li>
    <li>You want to avoid per-minute billing on long jobs.</li>
    <li>You must run on a locked-down internal network.</li>
  </ul>
  <p>Costs and care: you patch the OS, keep the runner agent updated, and secure it (only trusted workflows, since it can reach your network). Under-provisioning starves queue throughput and bloats wait times.</p>
  <h2>Preinstalled software</h2>
  <p>Hosted images ship with common runtimes — Node, Python, Java, .NET, Go, Ruby — already installed and kept current on each refresh. Version-surface differences are a classic source of "works here, fails in CI"; pin tool versions with <span class="ic">actions/setup-node</span> to stay reproducible.</p>
  <div class="callout callout-tip">
    <strong>Prefer hosted first</strong>
    <p>Start on <span class="ic">ubuntu-latest</span>. Move to self-hosted only when a real constraint — hardware, network, or budget — requires it.</p>
  </div>
  <div class="callout callout-info">
    <strong>Latest is a moving target</strong>
    <p><span class="ic">ubuntu-latest</span> points at the current stable image and can rotate under you. For critical matrices, pin a specific version such as <span class="ic">ubuntu-22.04</span>.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02000000-0000-4000-8000-000000000407',
  '02000000-0000-4000-8000-000000000310',
  1,
  'Environment Variables & Secrets',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Environment Variables & Secrets</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #22c55e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dcfce7; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #86efac; }
.dark .lesson-page .ic { background: #052e16; color: #4ade80; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Environment Variables &amp; Secrets</h1>
  <p>Hard-coding credentials into a workflow is the fastest way to leak them. Instead, separate <strong>config</strong> (env vars, public) from <strong>credentials</strong> (secrets, encrypted) and let the runner inject both.</p>
  <h2>Environment variables at three scopes</h2>
  <pre class="code-block">env:                      # workflow scope
  APP_ENV: ci
  NODE_VERSION: "20"

jobs:
  test:
    runs-on: ubuntu-latest
    env:                  # job scope
      CACHE_DIR: ~/.npm
    steps:
      - name: Step scope
        env:              # step scope
          MODE: strict
        run: echo "$APP_ENV / $CACHE_DIR / $MODE"</pre>
  <p>Scope wins over parent scope. You can also set exported variables mid-run via <span class="ic">GITHUB_ENV</span>, which keeps the variable for the rest of the job.</p>
  <h2>Secrets</h2>
  <p>Secrets live outside the YAML: repository secrets (visible to all workflows), environment secrets (scoped to a deployment environment), and organization secrets (shared across repos). Values never appear in the file or in logs:</p>
  <pre class="code-block">steps:
  - name: Deploy with a secret
    env:
      API_TOKEN: ${{ secrets.DEPLOY_TOKEN }}
    run: |
      curl -X POST -H "Authorization: Bearer $API_TOKEN" https://api.example.com/deploy</pre>
  <div class="callout">
    <strong>Never echo secrets</strong>
    <p>Do not print a secret or put its literal value in a <span class="ic">run:</span> line. GitHub masks known secret values in logs, but masking is a safety net, not a strategy.</p>
  </div>
  <h2>Precedence and overrides</h2>
  <table>
    <tr><th>Source</th><th>Wins against</th></tr>
    <tr><td>Step env</td><td>job env, workflow env, and defaults</td></tr>
    <tr><td>Job env</td><td>workflow env and defaults</td></tr>
    <tr><td>Workflow env</td><td>defaults and OS-level variables</td></tr>
    <tr><td>Environment secrets</td><td>repository secrets with the same name</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Rotate and scope</strong>
    <p>Give each deployed service its own secret, store production credentials only in the production environment, and rotate on membership change.</p>
  </div>
  <div class="callout callout-info">
    <strong>Context reads</strong>
    <p>Reference secrets with <span class="ic">${{ secrets.NAME }}</span> and variables with <span class="ic">${{ vars.NAME }}</span> (non-secret config) or <span class="ic">${{ env.NAME }}</span> inside expressions and conditions.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02000000-0000-4000-8000-000000000408',
  '02000000-0000-4000-8000-000000000311',
  1,
  'Caching Dependencies',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Caching Dependencies</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #22c55e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dcfce7; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #86efac; }
.dark .lesson-page .ic { background: #052e16; color: #4ade80; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Caching Dependencies</h1>
  <p>Every run starts on a fresh machine, so a full <span class="ic">npm ci</span> or <span class="ic">pip install</span> re-downloads hundreds of megabytes each time. Caching restores that work from a prior run and routinely cuts job time in half.</p>
  <h2>The easy path: setup actions with built-in caching</h2>
  <pre class="code-block">steps:
  - uses: actions/checkout@v4
  - uses: actions/setup-node@v4
    with:
      node-version: "20"
      cache: "npm"        # reads package-lock.json automatically
  - run: npm ci</pre>
  <p><span class="ic">cache: npm</span> (also pip, gradle, maven, go, etc.) computes a sensible key from your lockfile, so the cache follows your dependencies automatically.</p>
  <h2>Custom caching with actions/cache</h2>
  <p>For any other directory, use <span class="ic">actions/cache</span> directly. The <span class="ic">key</span> must change when the content changes — <span class="ic">hashFiles</span> hashes a file to make that automatic:</p>
  <pre class="code-block">- uses: actions/cache@v4
  with:
    path: ~/.npm
    key: ${{ runner.os }}-npm-${{ hashFiles('**/package-lock.json') }}
    restore-keys: |
      ${{ runner.os }}-npm-</pre>
  <ul>
    <li><span class="ic">key</span> is the exact identity of a cache entry.</li>
    <li><span class="ic">restore-keys</span> are fallbacks; the newest prefix match is used when the exact key misses.</li>
    <li><span class="ic">path</span> can list multiple directories or use glob patterns.</li>
  </ul>
  <h2>Limits and rules of thumb</h2>
  <table>
    <tr><th>Fact</th><th>Value</th></tr>
    <tr><td>Storage per repository</td><td>10 GB total, oldest entries evicted first</td></tr>
    <tr><td>Retention</td><td>about 90 days on hosted storage</td></tr>
    <tr><td>Branch scope</td><td>caches are per branch (with fallback)</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Cache only reproducible inputs</strong>
    <p>Key caching on the lockfile, never on open-ended content. A stale cache from a bad key silently replays old behavior — that is how "works on my machine" sneaks into CI.</p>
  </div>
  <div class="callout callout-info">
    <strong>Cache miss is a normal run</strong>
    <p>On the first run or after a dependency bump, the cache just misses and re-installs once. Cache restore is always best-effort; your steps must work with a cold cache too.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02000000-0000-4000-8000-000000000409',
  '02000000-0000-4000-8000-000000000313',
  1,
  'Matrix Builds',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Matrix Builds</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #22c55e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dcfce7; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #86efac; }
.dark .lesson-page .ic { background: #052e16; color: #4ade80; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Matrix Builds</h1>
  <p>A matrix runs one job definition across many combinations of versions and platforms, so you catch incompatibilities your single local machine will never see.</p>
  <h2>A Node version matrix</h2>
  <pre class="code-block">strategy:
  matrix:
    node: [18, 20, 22]
    os: [ubuntu-latest, windows-latest]

runs-on: ${{ matrix.os }}

steps:
  - uses: actions/checkout@v4
  - uses: actions/setup-node@v4
    with:
      node-version: ${{ matrix.node }}
      cache: "npm"
  - run: npm ci
  - run: npm test</pre>
  <p>This expands into six parallel jobs: 2 OSes × 3 Node versions. Inside the job, <span class="ic">matrix.node</span> and <span class="ic">matrix.os</span> carry the current combination.</p>
  <h2>Slicing the matrix</h2>
  <pre class="code-block">strategy:
  matrix:
    include:
      - os: ubuntu-latest
        node: 20
        lint: true      # only in this combo
    exclude:
      - os: windows-latest
        node: 18        # skip one known-bad combo
  max-parallel: 4      # cap concurrency
  fail-fast: false     # keep other combos running after one fails</pre>
  <ul>
    <li><span class="ic">include</span> adds combos with extra variables — handy for attaching a lint job to just one cell.</li>
    <li><span class="ic">exclude</span> prunes an existing combination.</li>
    <li><span class="ic">fail-fast: false</span> lets the full matrix finish and report every failing combo, not just the first.</li>
  </ul>
  <h2>The full-cartesian mindset</h2>
  <table>
    <tr><th>Dimension</th><th>Example values</th></tr>
    <tr><td>Runtime version</td><td>Node 18 / 20 / 22, Python 3.11 / 3.12</td></tr>
    <tr><td>Operating system</td><td>Linux / Windows / macOS</td></tr>
    <tr><td>Browsers</td><td>chrome / firefox / webkit for end-to-end tests</td></tr>
    <tr><td>Deploy targets</td><td>staging / production</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Watch the bill</strong>
    <p>Every matrix cell is a separate paid job. Trim dimensions you do not actually support and cap <span class="ic">max-parallel</span> on bursty providers.</p>
  </div>
  <div class="callout callout-info">
    <strong>Dynamic matrices</strong>
    <p>When combos depend on runtime data, output a JSON array from a setup job with <span class="ic">outputs</span> and feed it to <span class="ic">strategy.matrix.include</span> as a context value.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02000000-0000-4000-8000-000000000410',
  '02000000-0000-4000-8000-000000000314',
  1,
  'Artifacts & Dependency Management',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Artifacts & Dependency Management</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #22c55e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dcfce7; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #86efac; }
.dark .lesson-page .ic { background: #052e16; color: #4ade80; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Artifacts &amp; Dependency Management</h1>
  <p>Artifacts are the <strong>outputs</strong> of your pipeline — build bundles, coverage reports, screenshots, deployment packages. Because each job starts on a clean machine, artifacts are how you move files between jobs and make them available for download after a run.</p>
  <h2>Upload and download</h2>
  <pre class="code-block">jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: npm ci
      - run: npm run build
      - uses: actions/upload-artifact@v4
        with:
          name: web-bundle
          path: dist/
          retention-days: 14
  deploy:
    runs-on: ubuntu-latest
    needs: build
    steps:
      - uses: actions/download-artifact@v4
        with:
          name: web-bundle
          path: release/
      - run: ls -R release/</pre>
  <p>Upload <span class="ic">path:</span> can target a directory, a single file, or a glob like <span class="ic">coverage/**</span>. Download in a later job restores exactly what the build job produced.</p>
  <h2>Artifacts vs. caches</h2>
  <table>
    <tr><th>Feature</th><th>Cache</th><th>Artifact</th></tr>
    <tr><td>Purpose</td><td>Reusable input (dependencies)</td><td>Build output worth keeping</td></tr>
    <tr><td>Life</td><td>~90 days, evicted on space</td><td>Default 90 days, configurable 1–400</td></tr>
    <tr><td>Between jobs</td><td>No — per branch only</td><td>Yes — explicit download</td></tr>
    <tr><td>Sharing</td><td>Private to the run</td><td>Downloadable from the run UI</td></tr>
  </table>
  <h2>Dependency management patterns</h2>
  <ul>
    <li>Commit <span class="ic">package-lock.json</span> so <span class="ic">npm ci</span> installs the exact tree.</li>
    <li>pin tool versions with setup actions (<span class="ic">node-version</span>, <span class="ic">java-version</span>) to match your runtime policy.</li>
    <li>Feed artifacts into the next stage so deploy always ships the tested build, never a fresh one.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Deploy the artifact, not the source</strong>
    <p>Re-downloading the artifact in the deploy job guarantees production runs the exact code that passed tests — no "rebuild just in case" drift.</p>
  </div>
  <div class="callout callout-info">
    <strong>Size discipline</strong>
    <p>Artifacts count against storage and download time. Set <span class="ic">retention-days</span> low for transient logs and large packages.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02000000-0000-4000-8000-000000000411',
  '02000000-0000-4000-8000-000000000316',
  1,
  'Automating Tests & Coverage',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Automating Tests & Coverage</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #22c55e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dcfce7; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #86efac; }
.dark .lesson-page .ic { background: #052e16; color: #4ade80; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Automating Tests &amp; Coverage</h1>
  <p>The whole point of CI is a machine that verifies every change. The test job transforms "we should really run tests" into a hard, automatic gate before anything merges.</p>
  <h2>A unit test gate</h2>
  <pre class="code-block">jobs:
  unit:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: "20"
          cache: "npm"
      - run: npm ci
      - run: npm test -- --coverage
      - run: npm run lint</pre>
  <p>Fail any step and the whole job (and any job that <span class="ic">needs</span> it) turns red — that is the quality gate. No pass, no merge checklist override.</p>
  <h2>Integration tests with service containers</h2>
  <p>Integration tests need a real dependency. Ephemeral <span class="ic">services</span> containers spin up beside the job and are torn down automatically:</p>
  <pre class="code-block">jobs:
  integration:
    runs-on: ubuntu-latest
    services:
      postgres:
        image: postgres:16-alpine
        env:
          POSTGRES_PASSWORD: testpass
        ports:
          - 5432:5432
        options: &gt;-
          --health-cmd "pg_isready -U postgres"
          --health-interval 10s
          --health-timeout 5s
          --health-retries 5
    steps:
      - uses: actions/checkout@v4
      - run: npm ci
      - run: npm run test:integration</pre>
  <p><span class="ic">options</span> feeds Docker flags to the container; health checks make the job wait until the database accepts connections.</p>
  <h2>Coverage as a budget</h2>
  <p>Coverage is a lagging metric, not a goal. Use it as a regression tripwire: fail the build if coverage drops by more than a few percent, but celebrate meaningful tests, not 100% lines.</p>
  <table>
    <tr><th>Layer</th><th>Typical runner speed</th><th>Gate on</th></tr>
    <tr><td>Lint + typecheck</td><td>Seconds</td><td>Style and type errors</td></tr>
    <tr><td>Unit tests</td><td>Minutes</td><td>Logic regressions</td></tr>
    <tr><td>Integration</td><td>Minutes</td><td>Real service behavior</td></tr>
    <tr><td>End-to-end</td><td>Longest</td><td>User journeys</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Run fast layers first</strong>
    <p>Static + unit jobs catch the cheap wins immediately. Keep slow suites on a separate job so one flaky browser test does not block lint feedback.</p>
  </div>
  <div class="callout callout-info">
    <strong>Flaky tests poison trust</strong>
    <p>A test that fails at random makes the gate noise. Developers learn to shrug off red builds — then real regressions slip through. Stabilize flakes before merging.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02000000-0000-4000-8000-000000000412',
  '02000000-0000-4000-8000-000000000317',
  1,
  'Reusable Workflows',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reusable Workflows</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #22c55e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dcfce7; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #86efac; }
.dark .lesson-page .ic { background: #052e16; color: #4ade80; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Reusable Workflows</h1>
  <p>When ten repositories need the same lint, test, and deploy jobs, do not copy-paste YAML. A <strong>reusable workflow</strong> defines the logic once and lets other workflows call it — a function call for your pipelines.</p>
  <h2>The caller side</h2>
  <pre class="code-block">name: CI
on: [push, pull_request]
jobs:
  quality:
    uses: my-org/shared-workflows/.github/workflows/node-checks.yml@v1
    with:
      node-version: "20"
      run-lint: true
    secrets:
      inherit</pre>
  <p><span class="ic">uses:</span> points at the file and a ref (branch, tag, or SHA). <span class="ic">with:</span> passes inputs; <span class="ic">secrets: inherit</span> forwards the caller secrets explicitly.</p>
  <h2>The called workflow</h2>
  <pre class="code-block">name: Node checks (reusable)
on:
  workflow_call:
    inputs:
      node-version:
        required: true
        type: string
      run-lint:
        type: boolean
        default: true
    secrets:
      registry-token:
        required: false
jobs:
  verify:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: ${{ inputs.node-version }}
          cache: "npm"
      - run: npm ci
      - if: fromJSON(inputs.run-lint)
        run: npm run lint
      - run: npm test</pre>
  <dl>
    <dt><span class="ic">workflow_call</span></dt><dd>the event that lets other workflows invoke this one</dd>
    <dt><span class="ic">inputs</span></dt><dd>typed parameters surfaced in the caller</dd>
    <dt><span class="ic">secrets</span></dt><dd>an interface listing the secrets this workflow may read</dd>
  </dl>
  <h2>Returning results</h2>
  <p>Define <span class="ic">outputs</span> at the top level and set them from job outputs, so the caller can branch on what the reusable run learned — for example a version number computed by a shared release job.</p>
  <h2>Security rules of thumb</h2>
  <ul>
    <li>Place shared workflows in a dedicated, reviewed <span class="ic">.github/workflows</span> repository.</li>
    <li>Pin the call to a tag or SHA and re-review before bumping — callers inherit whatever the ref contains.</li>
    <li>Do not pass secrets a workflow does not literally need.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Version the contract</strong>
    <p>Tag reusable workflows with <span class="ic">v1</span>, <span class="ic">v2</span>. Existing callers keep working on the old tag while you evolve the next major.</p>
  </div>
  <div class="callout callout-info">
    <strong>One layer deep</strong>
    <p>A workflow can call another workflow, but a called workflow cannot chain further calls. Keep hierarchies flat for clarity and debugging.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02000000-0000-4000-8000-000000000413',
  '02000000-0000-4000-8000-000000000319',
  1,
  'Building & Publishing Releases',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Building & Publishing Releases</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #22c55e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dcfce7; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #86efac; }
.dark .lesson-page .ic { background: #052e16; color: #4ade80; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Building &amp; Publishing Releases</h1>
  <p>The release path turns a green build into something people can consume: a versioned tag, a built artifact, and a pointer in a registry or the Releases page.</p>
  <h2>Tags drive releases</h2>
  <p>Semantic versions (<span class="ic">1.2.0</span>) on git tags are the convention: <span class="ic">major.minor.patch</span>, where patch fixes bugs, minor adds features, and major breaks compatibility. Trigger the publish job only when a tag arrives:</p>
  <pre class="code-block">on:
  push:
    tags:
      - "v*"
  workflow_dispatch:      # allow manual release builds

permissions:
  contents: write         # create the release

jobs:
  publish:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: "20"
          registry-url: "https://registry.npmjs.org"
      - run: npm ci
      - run: npx tsc
      - run: npm publish --access public
        env:
          NODE_AUTH_TOKEN: ${{ secrets.NPM_TOKEN }}</pre>
  <h2>Attach the build to a GitHub release</h2>
  <p>Produce the distribution archive in the build job and hand it to the release job via an artifact:</p>
  <pre class="code-block">steps:
  - uses: actions/download-artifact@v4
    with:
      name: dist
      path: dist/
  - name: Create GitHub Release
    uses: softprops/action-gh-release@v2
    with:
      files: |
        dist/*.tar.gz
        dist/*.zip
      generate_release_notes: true</pre>
  <h2>Registry and package publishing checklist</h2>
  <ul>
    <li>Publish from a tag checkout, never from an arbitrary commit on a branch.</li>
    <li>Ask <span class="ic">contents: write</span> only if you create releases or push tags; registry auth goes through <span class="ic">NODE_AUTH_TOKEN</span> set by setup-* with <span class="ic">registry-url</span>.</li>
    <li>Verify the built tarball contents before shipping — include files, license, and the right entry points.</li>
  </ul>
  <table>
    <tr><th>Target</th><th>Auth pattern</th></tr>
    <tr><td>npm registry</td><td>NODE_AUTH_TOKEN + registry-url</td></tr>
    <tr><td>GitHub Packages</td><td>GITHUB_TOKEN via setup-* with packages URL</td></tr>
    <tr><td>GitHub Release</td><td>GITHUB_TOKEN with contents: write</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Ship the tested artifact</strong>
    <p>Build once in CI, then test that exact archive. If you rebuild at publish time, the released bits were never verified.</p>
  </div>
  <div class="callout callout-info">
    <strong>Releases are immutable</strong>
    <p>Published versions stay public once pushed. Use <span class="ic">npm publish --dry-run</span> and a prerelease tag like <span class="ic">v1.2.0-rc.1</span> to rehearse before the real cut.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02000000-0000-4000-8000-000000000414',
  '02000000-0000-4000-8000-000000000320',
  1,
  'Deployments & Environments',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Deployments & Environments</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #22c55e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dcfce7; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #86efac; }
.dark .lesson-page .ic { background: #052e16; color: #4ade80; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Deployments &amp; Environments</h1>
  <p>Deploying straight to production from every green build is brave and usually wrong. <strong>Environments</strong> give you staging and production targets with their own secrets, protection rules, and deployment history.</p>
  <h2>Using an environment</h2>
  <pre class="code-block">jobs:
  deploy-staging:
    runs-on: ubuntu-latest
    environment:
      name: staging
      url: https://staging.example.com
    needs: [test, build]
    steps:
      - uses: actions/download-artifact@v4
        with:
          name: web-bundle
          path: release/
      - run: ./deploy.sh ${{ vars.STAGING_HOST }}
        env:
          DEPLOY_KEY: ${{ secrets.STAGING_KEY }}</pre>
  <p><span class="ic">environment.name</span> binds the job to a target; secrets and non-secret <span class="ic">vars</span> defined on that environment are injected just for this job.</p>
  <h2>Protection rules</h2>
  <p>Configure protection on the environment page:</p>
  <ul>
    <li><strong>Required reviewers</strong> — a named list of people or teams who must approve before the deploy runs.</li>
    <li><strong>Wait timer</strong> — a mandatory delay (minutes) before the job starts.</li>
    <li><strong>Deployment branch</strong> — only allow deploys from trusted branches such as <span class="ic">main</span>.</li>
  </ul>
  <p>This is how "deploy needs a human" survives while everything else is automated: CI runs freely, but touching production waits for an explicit approval.</p>
  <h2>Deploying to a cloud target</h2>
  <p>Each platform plugs in with its own action or CLI. The shape is the same everywhere: authenticate with a scoped secret or OIDC, ship the artifact, verify the health endpoint:</p>
  <pre class="code-block">steps:
  - name: Authenticate
    uses: aws-actions/configure-aws-credentials@v4
    with:
      role-to-assume: arn:aws:iam::123456789012:role/ci-deploy
      aws-region: eu-west-1
  - name: Publish bundle
    run: aws s3 sync dist/ s3://my-app-bucket --delete
  - name: Invalidate cache
    run: aws cloudfront create-invalidation --distribution-id ${{ vars.DIST_ID }} --paths "/*"</pre>
  <h2>Rollback is a run</h2>
  <p>Because deployments are recorded against the environment, a bad release is re-deployed to the previous known-good commit. Keep <span class="ic">concurrency</span> strict per environment so a failed deploy cannot race a fixed one.</p>
  <div class="callout callout-tip">
    <strong>Deploy the tested artifact</strong>
    <p>Download the artifact built and tested in CI. A deploy job that rebuilds is a second pipeline with its own bugs.</p>
  </div>
  <div class="callout callout-info">
    <strong>Separate secrets per environment</strong>
    <p>Staging and production keys must differ. An environment whose secrets equal production might as well be production.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02000000-0000-4000-8000-000000000415',
  '02000000-0000-4000-8000-000000000322',
  1,
  'Security Hardening for Actions',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Security Hardening for Actions</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #22c55e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dcfce7; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #86efac; }
.dark .lesson-page .ic { background: #052e16; color: #4ade80; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Security Hardening for Actions</h1>
  <p>A workflow has more power than a developer — it can write to the repo, push releases, and reach production. Treat it as infrastructure: least privilege, immutability, and no plaintext secrets.</p>
  <h2>Least privilege for GITHUB_TOKEN</h2>
  <pre class="code-block">permissions:
  contents: read          # only what the job needs
  issues: none
  pull-requests: none

# a deploy job that really needs to write:
permissions:
  contents: write
  deployments: write</pre>
  <p>Default token permissions can be set to read-only at the repository or organization level. Every <span class="ic">permissions:</span> block you add narrows the blast radius if a step is compromised.</p>
  <h2>Pin actions and audit them</h2>
  <ul>
    <li>Reference actions by full commit SHA instead of a mutable tag, or pin a tag you have reviewed and re-review on bumps.</li>
    <li>Prefer actions from publishers you trust; third-party actions run arbitrary code on your runner.</li>
    <li>Separate workflow runs on PRs from forks: the default token is read-only, so use <span class="ic">pull_request</span> for checks and reserve privileged steps for trusted <span class="ic">push</span> runs.</li>
  </ul>
  <h2>Secrets hygiene</h2>
  <pre class="code-block">steps:
  - name: Ship with a secret
    env:                    # env, never run:
      API_TOKEN: ${{ secrets.API_TOKEN }}
    run: ./deploy.sh        # reads $API_TOKEN, not in argv and not echoed</pre>
  <p>Putting a secret in the command line leaks it through process listings; echoing it dumps it into the log. Environment variables keep it out of both.</p>
  <h2>Cloud authentication: prefer OIDC</h2>
  <p>Instead of long-lived cloud keys, exchange the GitHub runner identity for short-lived cloud credentials with OpenID Connect. The token is minted on demand and expires, so there is no stored cloud secret to steal:</p>
  <pre class="code-block">permissions:
  id-token: write
  contents: read
steps:
  - uses: aws-actions/configure-aws-credentials@v4
    with:
      role-to-assume: arn:aws:iam::123456789012:role/ci-oidc</pre>
  <table>
    <tr><th>Hygiene rule</th><th>Why it matters</th></tr>
    <tr><td>Scoped permissions</td><td>Limits damage from a hijacked step</td></tr>
    <tr><td>Pinned actions</td><td>No silent code swaps between tags</td></tr>
    <tr><td>Secrets via env</td><td>Keeps values out of argv and logs</td></tr>
    <tr><td>OIDC auth</td><td>No long-lived cloud credentials</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Least privilege by default</strong>
    <p>Give jobs the read-only token they need and only widen it at the exact job that must write. Audit the permissions of public repos periodically.</p>
  </div>
  <div class="callout callout-info">
    <strong>Treat forks as untrusted</strong>
    <p>Forks can edit workflow files in their own repo. Never run unchecked fork PRs against privileged secrets.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02000000-0000-4000-8000-000000000416',
  '02000000-0000-4000-8000-000000000323',
  1,
  'Designing a Production Pipeline',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Designing a Production Pipeline</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #22c55e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dcfce7; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #86efac; }
.dark .lesson-page .ic { background: #052e16; color: #4ade80; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Designing a Production Pipeline</h1>
  <p>A production pipeline is a flowchart with gates. Sketch it on a napkin before writing YAML: what must be true for each stage to proceed, and what happens when a stage fails?</p>
  <h2>Stage by stage</h2>
  <table>
    <tr><th>Stage</th><th>Gate it enforces</th></tr>
    <tr><td>Lint + typecheck</td><td>Style and type errors stop early</td></tr>
    <tr><td>Unit tests</td><td>Logic regressions are rejected</td></tr>
    <tr><td>Build</td><td>Produces the deployment artifact</td></tr>
    <tr><td>Integration</td><td>System works against real services</td></tr>
    <tr><td>Deploy staging</td><td>Automated to a safe target</td></tr>
    <tr><td>Deploy production</td><td>Approval-gated to the real environment</td></tr>
  </table>
  <p>Each stage is a job that <span class="ic">needs</span> the previous ones, so a red stage short-circuits everything downstream.</p>
  <h2>Concurrency: do not race production</h2>
  <pre class="code-block">concurrency:
  group: deploy-${{ github.ref }}
  cancel-in-progress: false

jobs:
  deploy:
    environment: production
    runs-on: ubuntu-latest
    needs: [lint, unit, build, integration, deploy-staging]
    steps:
      - uses: actions/download-artifact@v4
        with:
          name: web-bundle
          path: release/
      - run: ./deploy.sh ${{ vars.PROD_HOST }}</pre>
  <p><span class="ic">concurrency</span> queues or cancels overlapping runs of the same group. For production, prefer <span class="ic">cancel-in-progress: false</span> so a second push waits instead of aborting a live deploy.</p>
  <h2>Failure and rollback strategy</h2>
  <ul>
    <li>Every deploy keeps the previous release one command away (re-run the prior successful run).</li>
    <li>Verify with a health check after deploy; a failed check flips the job red even if the upload succeeded.</li>
    <li>Alert on red production deploys — a failed deploy is an incident, not a log line.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Gate the risky stages</strong>
    <p>Automate everything that is safe; add human approval only at the last gate. If reviewers review every build, they will stop reviewing anything.</p>
  </div>
  <div class="callout callout-info">
    <strong>Design for the bad day</strong>
    <p>The pipeline you debug at 2am is the one nobody documented. Keep jobs small, names descriptive, and every stage runnable in isolation.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02000000-0000-4000-8000-000000000417',
  '02000000-0000-4000-8000-000000000325',
  1,
  'Capstone: Building the Pipeline',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Building the Pipeline</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #22c55e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dcfce7; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #86efac; }
.dark .lesson-page .ic { background: #052e16; color: #4ade80; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Building the Pipeline</h1>
  <p>Time to assemble everything. The capstone is a small Node/Express API you will take from push to production with one workflow: lint, unit tests, integration tests, build a Docker image, publish it, and deploy to a staging environment.</p>
  <h2>Project layout</h2>
  <pre class="code-block">capstone-api/
  .github/workflows/ci.yml
  src/                # Express app source
  test/               # unit + integration tests
  Dockerfile
  package.json        # scripts: lint, test, test:integration, start</pre>
  <h2>The workflow</h2>
  <pre class="code-block">name: Capstone CI/CD
on:
  push:
    branches: [main]
  pull_request:

permissions:
  contents: read
  packages: write      # push the image to GitHub Container Registry

env:
  IMAGE: ghcr.io/${{ github.repository }}:sha-${{ github.sha }}

concurrency:
  group: deploy-${{ github.ref }}
  cancel-in-progress: false

jobs:
  quality:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: "20"
          cache: "npm"
      - run: npm ci
      - run: npm run lint
      - run: npm test -- --coverage

  integration:
    runs-on: ubuntu-latest
    needs: quality
    services:
      postgres:
        image: postgres:16-alpine
        env:
          POSTGRES_PASSWORD: testpass
        ports:
          - 5432:5432
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: "20"
          cache: "npm"
      - run: npm ci
      - run: npm run test:integration

  docker:
    runs-on: ubuntu-latest
    needs: integration
    if: github.ref == 'refs/heads/main'
    steps:
      - uses: actions/checkout@v4
      - uses: docker/setup-buildx-action@v3
      - uses: docker/login-action@v3
        with:
          registry: ghcr.io
          username: ${{ github.actor }}
          password: ${{ secrets.GITHUB_TOKEN }}
      - uses: docker/build-push-action@v6
        with:
          push: true
          tags: ${{ env.IMAGE }}

  deploy-staging:
    runs-on: ubuntu-latest
    environment:
      name: staging
      url: https://staging.example.com
    needs: docker
    steps:
      - uses: actions/download-artifact@v4
      - run: echo "Deploy image ${{ env.IMAGE }}"</pre>
  <h2>Running it</h2>
  <ul>
    <li>Push to your branch: <span class="ic">quality</span> and <span class="ic">integration</span> run on every PR.</li>
    <li>Merge to main: the image is built, published, and staging is deployed.</li>
    <li>Production could reuse the same flow guarded by an environment with required reviewers — you just built the pattern.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>One artifact path</strong>
    <p>Tests run before the image is even built. The tag is a SHA, so what is on staging is exactly the commit that passed every gate — audit and rollback become trivial.</p>
  </div>
  <div class="callout callout-info">
    <strong>SHA tags are safe and inspectable</strong>
    <p>Tagging with the commit SHA means each run pushes a unique, reproducible image. Add a <span class="ic">latest</span> tag for convenience, but always deploy by SHA.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02000000-0000-4000-8000-000000000418',
  '02000000-0000-4000-8000-000000000326',
  1,
  'Capstone: Notifications, Badges & Docs',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Notifications, Badges & Docs</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #22c55e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dcfce7; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #86efac; }
.dark .lesson-page .ic { background: #052e16; color: #4ade80; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Notifications, Badges &amp; Docs</h1>
  <p>A pipeline nobody can read is a mystery, not an asset. Round out the capstone by making its status visible everywhere: badges in the README, summaries on the run, and alerts where your team lives.</p>
  <h2>Status badge</h2>
  <p>GitHub renders a live badge for any workflow; the URL is stable and needs no secrets:</p>
  <pre class="code-block"><p>![CI](https://github.com/OWNER/REPO/actions/workflows/ci.yml/badge.svg)</p></pre>
  <p>It turns green and red with the latest run, giving visitors and contributors an instant health check in the README.</p>
  <h2>Job summaries</h2>
  <p>Append a short Markdown report to each run with <span class="ic">GITHUB_STEP_SUMMARY</span> — coverage numbers, deploy targets, or timings:</p>
  <pre class="code-block">- name: Write summary
  run: |
    echo "## Coverage summary" &gt;&gt; "$GITHUB_STEP_SUMMARY"
    echo "- Lines: **82%**" &gt;&gt; "$GITHUB_STEP_SUMMARY"
    echo "- Branch: **74%**" &gt;&gt; "$GITHUB_STEP_SUMMARY"</pre>
  <h2>Alerts in chat</h2>
  <pre class="code-block">- name: Notify on failure
  if: failure()
  uses: slackapi/slack-github-action@v2
  with:
    channel-id: "C0123CI"
    slack-message: "CI failed on ${{ github.ref_name }} — <https://github.com/${{ github.repository }}/actions|view run>"
  env:
    SLACK_BOT_TOKEN: ${{ secrets.SLACK_BOT_TOKEN }}</pre>
  <p>The same pattern works for Discord and email. Notify on<br><span class="ic">failure()</span> and on successful production deploys only — anything more becomes noise.</p>
  <h2>Document the pipeline</h2>
  <table>
    <tr><th>Section</th><th>Content</th></tr>
    <tr><td>README badge</td><td>Live status at the top</td></tr>
    <tr><td>Workflow README</td><td>Triggers, stages, and what each job gates</td></tr>
    <tr><td>Run playbook</td><td>How to rerun, roll back, and force a deploy</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Noise discipline</strong>
    <p>Alert only on states a human must act on: broken main, failed production deploy, flaky suite exceeding budget. A quiet channel that fires meaningfully is the goal.</p>
  </div>
  <div class="callout callout-info">
    <strong>Commit statuses for free</strong>
    <p>GitHub already attaches the workflow result to every commit and PR. Branch protection rules can require <span class="ic">quality</span> and <span class="ic">integration</span> green before merge — no extra code needed.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02000000-0000-4000-8000-000000000419',
  '02000000-0000-4000-8000-000000000327',
  1,
  'Capstone: Troubleshooting & Optimization',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Troubleshooting & Optimization</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #22c55e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dcfce7; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #86efac; }
.dark .lesson-page .ic { background: #052e16; color: #4ade80; }
.dark .lesson-page .callout { background: #052e16; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #052e16; color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Troubleshooting &amp; Optimization</h1>
  <p>Every pipeline breaks. The skill is reading the failure and making the broken thing cheaper to break. Work top-down: check the failing job, then the failing step, then the log.</p>
  <h2>The usual suspects</h2>
  <table>
    <tr><th>Symptom</th><th>Likely cause</th><th>Fix</th></tr>
    <tr><td>Invalid workflow</td><td>YAML syntax or a bad expression</td><td>Validate locally with <span class="ic">act</span> or the Actions tab notice</td></tr>
    <tr><td>npm ci fails</td><td>Lockfile out of sync</td><td>Regenerate the lockfile in the same commit</td></tr>
    <tr><td>401/403 on push as a bot</td><td>Scoped token lacks a permission</td><td>Raise the permission on that one job only</td></tr>
    <tr><td>No space left</td><td>Artifacts and caches pile up</td><td>Reduce retention, prune caches</td></tr>
    <tr><td>Job times out</td><td>Long suite or slow dependency install</td><td>Cache deps, parallelize, raise timeout-minutes</td></tr>
    <tr><td>Flaky failures</td><td>Race conditions or network calls in tests</td><td>Stabilize; never rerun until green without a note</td></tr>
  </table>
  <h2>The debug toolkit</h2>
  <ul>
    <li>Add <span class="ic">ACTIONS_STEP_DEBUG: true</span> as a repository variable to get extra log detail in the next run.</li>
    <li>Use <span class="ic">github.*</span> context debug — echo the few values you rely on (ref, sha, event_name) early in a job.</li>
    <li>Re-run the failed jobs only, or re-run the whole workflow from the Actions tab; a re-run does not re-run pristine jobs unnecessarily.</li>
  </ul>
  <h2>Speed: the biggest wins</h2>
  <p>Measure the job-summary timings, then attack in this order:</p>
  <ol>
    <li>Cache dependencies (usually takes a minute off installs).</li>
    <li>Run independent jobs in parallel and trim the matrix to real supported combos.</li>
    <li>Skip irrelevant paths with <span class="ic">if:</span> and <span class="ic">paths</span> filters.</li>
    <li>Use a compiled toolchain once instead of installing it per job — setup actions cache these too.</li>
  </ol>
  <div class="callout callout-tip">
    <strong>Logs are the spec</strong>
    <p>The failing step prints exactly what it tried. Read that line before touching YAML — half of "CI issues" are environment mismatches, not workflow bugs.</p>
  </div>
  <div class="callout callout-info">
    <strong>Document every incident</strong>
    <p>A short note next to each fix (in the workflow README or PR description) turns 2am debugging into a lookup.</p>
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
  ('02000000-0000-4000-8000-000000000501', '02000000-0000-4000-8000-000000000303',
   'What does the CI part of CI/CD stand for?',
   'CI is continuous integration: merging developer changes frequently and verifying them automatically.', 1),
  ('02000000-0000-4000-8000-000000000502', '02000000-0000-4000-8000-000000000303',
   'What best describes pipeline as code?',
   'Pipeline definitions live in version control and are reviewed like application code.', 2),
  ('02000000-0000-4000-8000-000000000503', '02000000-0000-4000-8000-000000000303',
   'What is the main benefit of continuous delivery?',
   'Software is always release-ready because every change passes automated verification.', 3),
  ('02000000-0000-4000-8000-000000000504', '02000000-0000-4000-8000-000000000306',
   'Where do GitHub Actions workflows live?',
   'Workflows are YAML files stored in the .github/workflows directory of the repository.', 1),
  ('02000000-0000-4000-8000-000000000505', '02000000-0000-4000-8000-000000000306',
   'What is the relationship between a job and a step?',
   'A job groups steps onto one runner; steps are the individual commands or actions inside it.', 2),
  ('02000000-0000-4000-8000-000000000506', '02000000-0000-4000-8000-000000000306',
   'Which key declares the events that start a workflow?',
   'The on key lists the triggering events such as push and pull_request.', 3),
  ('02000000-0000-4000-8000-000000000507', '02000000-0000-4000-8000-000000000309',
   'Which event fires when a pull request is opened?',
   'The pull_request event triggers on PR open, synchronize, and reopen by default.', 1),
  ('02000000-0000-4000-8000-000000000508', '02000000-0000-4000-8000-000000000309',
   'Which label is provided by GitHub-hosted runners?',
   'ubuntu-latest, windows-latest, and macos-latest are the standard hosted labels.', 2),
  ('02000000-0000-4000-8000-000000000509', '02000000-0000-4000-8000-000000000309',
   'What is a self-hosted runner?',
   'A runner you install and operate on infrastructure you control.', 3),
  ('02000000-0000-4000-8000-000000000510', '02000000-0000-4000-8000-000000000312',
   'Where should API keys and passwords be stored for workflows?',
   'Sensitive values belong in GitHub Secrets, never in the workflow file.', 1),
  ('02000000-0000-4000-8000-000000000511', '02000000-0000-4000-8000-000000000312',
   'Why are dependency installs a good candidate for caching?',
   'The install step repeats on every run and restores much faster from a cache.', 2),
  ('02000000-0000-4000-8000-000000000512', '02000000-0000-4000-8000-000000000312',
   'What makes a cache key accurate over time?',
   'A prefix plus a hash of the lockfile changes the key only when dependencies change.', 3),
  ('02000000-0000-4000-8000-000000000513', '02000000-0000-4000-8000-000000000315',
   'What does a matrix build define?',
   'The combinations of versions and platforms one job expands into.', 1),
  ('02000000-0000-4000-8000-000000000514', '02000000-0000-4000-8000-000000000315',
   'Which key configures a build matrix?',
   'strategy.matrix defines the version and platform combinations.', 2),
  ('02000000-0000-4000-8000-000000000515', '02000000-0000-4000-8000-000000000315',
   'What is a workflow artifact?',
   'A build output stored for download or sharing between jobs.', 3),
  ('02000000-0000-4000-8000-000000000516', '02000000-0000-4000-8000-000000000318',
   'Why run automated tests inside CI?',
   'Every change is verified against the suite before it can merge.', 1),
  ('02000000-0000-4000-8000-000000000517', '02000000-0000-4000-8000-000000000318',
   'What is a reusable workflow?',
   'A workflow that other workflows call to reuse shared pipeline logic.', 2),
  ('02000000-0000-4000-8000-000000000518', '02000000-0000-4000-8000-000000000318',
   'Which event does a reusable workflow define to accept calls?',
   'The called workflow declares on: workflow_call to be invoked by callers.', 3),
  ('02000000-0000-4000-8000-000000000519', '02000000-0000-4000-8000-000000000321',
   'Which permission does a workflow commonly need to publish a release?',
   'Writing releases and tags requires contents: write on the GITHUB_TOKEN.', 1),
  ('02000000-0000-4000-8000-000000000520', '02000000-0000-4000-8000-000000000321',
   'What does a GitHub Environment add to a deployment?',
   'Protection rules such as required reviewers and wait timers.', 2),
  ('02000000-0000-4000-8000-000000000521', '02000000-0000-4000-8000-000000000321',
   'What should you do first when a staging deploy fails?',
   'Roll back the environment and inspect the failing job logs.', 3),
  ('02000000-0000-4000-8000-000000000522', '02000000-0000-4000-8000-000000000324',
   'What is the least-privilege principle for the GITHUB_TOKEN?',
   'Grant the token only the permissions the workflow actually uses.', 1),
  ('02000000-0000-4000-8000-000000000523', '02000000-0000-4000-8000-000000000324',
   'Why pin third-party actions to a commit SHA?',
   'A SHA is immutable, so the action code cannot be silently swapped between releases.', 2),
  ('02000000-0000-4000-8000-000000000524', '02000000-0000-4000-8000-000000000324',
   'What is the safest way to use a secret in a workflow step?',
   'Set it as an environment variable and reference that variable in the script.', 3),
  ('02000000-0000-4000-8000-000000000525', '02000000-0000-4000-8000-000000000328',
   'What is the correct order of core pipeline stages?',
   'Build, then test, then deploy — artifacts are verified before promotion.', 1),
  ('02000000-0000-4000-8000-000000000526', '02000000-0000-4000-8000-000000000328',
   'What does the concurrency key prevent?',
   'Two overlapping runs of the same group racing for the same environment.', 2),
  ('02000000-0000-4000-8000-000000000527', '02000000-0000-4000-8000-000000000328',
   'How do you make a workflow manually triggerable?',
   'Add workflow_dispatch to the on key to show a Run workflow button.', 3),
  ('02000000-0000-4000-8000-000000000528', '02000000-0000-4000-8000-000000000328',
   'What is a status badge?',
   'An image in the README that shows the latest workflow result.', 4),
  ('02000000-0000-4000-8000-000000000529', '02000000-0000-4000-8000-000000000328',
   'What is the right response to a flaky failing test?',
   'Investigate and stabilize the test before merging more work.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): continuous integration
  ('02000000-0000-4000-8000-000000001001', '02000000-0000-4000-8000-000000000501', 'Continuous Integration', TRUE, 1),
  ('02000000-0000-4000-8000-000000001002', '02000000-0000-4000-8000-000000000501', 'Continuous Innovation', FALSE, 2),
  ('02000000-0000-4000-8000-000000001003', '02000000-0000-4000-8000-000000000501', 'Code Integration', FALSE, 3),
  ('02000000-0000-4000-8000-000000001004', '02000000-0000-4000-8000-000000000501', 'Central Integration', FALSE, 4),
  -- Q1 (501)q2: pipeline as code
  ('02000000-0000-4000-8000-000000001005', '02000000-0000-4000-8000-000000000502', 'Writing pipelines in a planning spreadsheet', FALSE, 1),
  ('02000000-0000-4000-8000-000000001006', '02000000-0000-4000-8000-000000000502', 'Versioning pipeline definitions in the repository like application code', TRUE, 2),
  ('02000000-0000-4000-8000-000000001007', '02000000-0000-4000-8000-000000000502', 'Emailing pipeline files to teammates', FALSE, 3),
  ('02000000-0000-4000-8000-000000001008', '02000000-0000-4000-8000-000000000502', 'Rebuilding the pipeline on every machine manually', FALSE, 4),
  -- Q1 (501)q3: continuous delivery
  ('02000000-0000-4000-8000-000000001009', '02000000-0000-4000-8000-000000000503', 'Deployments never fail', FALSE, 1),
  ('02000000-0000-4000-8000-000000001010', '02000000-0000-4000-8000-000000000503', 'Developers stop reviewing code', FALSE, 2),
  ('02000000-0000-4000-8000-000000001011', '02000000-0000-4000-8000-000000000503', 'Software is always release-ready after automated verification', TRUE, 3),
  ('02000000-0000-4000-8000-000000001012', '02000000-0000-4000-8000-000000000503', 'Builds only run on dedicated hardware', FALSE, 4),
  -- Q2 (504): workflow location
  ('02000000-0000-4000-8000-000000001013', '02000000-0000-4000-8000-000000000504', 'JSON files in .github/actions/', FALSE, 1),
  ('02000000-0000-4000-8000-000000001014', '02000000-0000-4000-8000-000000000504', 'Shell scripts in the repository root', FALSE, 2),
  ('02000000-0000-4000-8000-000000001015', '02000000-0000-4000-8000-000000000504', 'Excel files in a shared drive', FALSE, 3),
  ('02000000-0000-4000-8000-000000001016', '02000000-0000-4000-8000-000000000504', 'YAML files in the .github/workflows directory', TRUE, 4),
  -- Q2 (504)q2: job vs step
  ('02000000-0000-4000-8000-000000001017', '02000000-0000-4000-8000-000000000505', 'A job groups steps on one runner; steps are the commands within it', TRUE, 1),
  ('02000000-0000-4000-8000-000000001018', '02000000-0000-4000-8000-000000000505', 'A job is a secret and a step is an environment', FALSE, 2),
  ('02000000-0000-4000-8000-000000001019', '02000000-0000-4000-8000-000000000505', 'A step sweeps across many runner labels', FALSE, 3),
  ('02000000-0000-4000-8000-000000001020', '02000000-0000-4000-8000-000000000505', 'Jobs and steps are names for triggering events', FALSE, 4),
  -- Q2 (504)q3: on key
  ('02000000-0000-4000-8000-000000001021', '02000000-0000-4000-8000-000000000506', 'jobs', FALSE, 1),
  ('02000000-0000-4000-8000-000000001022', '02000000-0000-4000-8000-000000000506', 'on', TRUE, 2),
  ('02000000-0000-4000-8000-000000001023', '02000000-0000-4000-8000-000000000506', 'runs-on', FALSE, 3),
  ('02000000-0000-4000-8000-000000001024', '02000000-0000-4000-8000-000000000506', 'env', FALSE, 4),
  -- Q3 (507): pull_request event
  ('02000000-0000-4000-8000-000000001025', '02000000-0000-4000-8000-000000000507', 'push', FALSE, 1),
  ('02000000-0000-4000-8000-000000001026', '02000000-0000-4000-8000-000000000507', 'schedule', FALSE, 2),
  ('02000000-0000-4000-8000-000000001027', '02000000-0000-4000-8000-000000000507', 'pull_request', TRUE, 3),
  ('02000000-0000-4000-8000-000000001028', '02000000-0000-4000-8000-000000000507', 'workflow_dispatch', FALSE, 4),
  -- Q3 (507)q2: hosted label
  ('02000000-0000-4000-8000-000000001029', '02000000-0000-4000-8000-000000000508', 'production-aws', FALSE, 1),
  ('02000000-0000-4000-8000-000000001030', '02000000-0000-4000-8000-000000000508', 'my-laptop', FALSE, 2),
  ('02000000-0000-4000-8000-000000001031', '02000000-0000-4000-8000-000000000508', 'gpu-cluster', FALSE, 3),
  ('02000000-0000-4000-8000-000000001032', '02000000-0000-4000-8000-000000000508', 'ubuntu-latest', TRUE, 4),
  -- Q3 (507)q3: self-hosted
  ('02000000-0000-4000-8000-000000001033', '02000000-0000-4000-8000-000000000509', 'A runner you install and operate on infrastructure you control', TRUE, 1),
  ('02000000-0000-4000-8000-000000001034', '02000000-0000-4000-8000-000000000509', 'A runner GitHub hosts for free', FALSE, 2),
  ('02000000-0000-4000-8000-000000001035', '02000000-0000-4000-8000-000000000509', 'A browser extension that simulates builds', FALSE, 3),
  ('02000000-0000-4000-8000-000000001036', '02000000-0000-4000-8000-000000000509', 'A cache server in the actions marketplace', FALSE, 4),
  -- Q4 (510): secrets
  ('02000000-0000-4000-8000-000000001037', '02000000-0000-4000-8000-000000000510', 'In the README for team visibility', FALSE, 1),
  ('02000000-0000-4000-8000-000000001038', '02000000-0000-4000-8000-000000000510', 'In GitHub Secrets', TRUE, 2),
  ('02000000-0000-4000-8000-000000001039', '02000000-0000-4000-8000-000000000510', 'In the workflow YAML as plain text', FALSE, 3),
  ('02000000-0000-4000-8000-000000001040', '02000000-0000-4000-8000-000000000510', 'In a public script committed to the repo', FALSE, 4),
  -- Q4 (510)q2: why cache
  ('02000000-0000-4000-8000-000000001041', '02000000-0000-4000-8000-000000000511', 'Caching removes the test suite', FALSE, 1),
  ('02000000-0000-4000-8000-000000001042', '02000000-0000-4000-8000-000000000511', 'Caching encrypts the repository', FALSE, 2),
  ('02000000-0000-4000-8000-000000001043', '02000000-0000-4000-8000-000000000511', 'The install step repeats on every run and restores faster from cache', TRUE, 3),
  ('02000000-0000-4000-8000-000000001044', '02000000-0000-4000-8000-000000000511', 'Caching replaces the need for a lockfile', FALSE, 4),
  -- Q4 (510)q3: cache key
  ('02000000-0000-4000-8000-000000001045', '02000000-0000-4000-8000-000000000512', 'The constant string cache', FALSE, 1),
  ('02000000-0000-4000-8000-000000001046', '02000000-0000-4000-8000-000000000512', 'The runner operating system alone', FALSE, 2),
  ('02000000-0000-4000-8000-000000001047', '02000000-0000-4000-8000-000000000512', 'The workflow file name alone', FALSE, 3),
  ('02000000-0000-4000-8000-000000001048', '02000000-0000-4000-8000-000000000512', 'A prefix plus a hash of the lockfile', TRUE, 4),
  -- Q5 (513): matrix definition
  ('02000000-0000-4000-8000-000000001049', '02000000-0000-4000-8000-000000000513', 'The combinations of versions and platforms one job expands into', TRUE, 1),
  ('02000000-0000-4000-8000-000000001050', '02000000-0000-4000-8000-000000000513', 'The list of secrets in an environment', FALSE, 2),
  ('02000000-0000-4000-8000-000000001051', '02000000-0000-4000-8000-000000000513', 'A table of all open pull requests', FALSE, 3),
  ('02000000-0000-4000-8000-000000001052', '02000000-0000-4000-8000-000000000513', 'The order of steps inside one job', FALSE, 4),
  -- Q5 (513)q2: strategy.matrix
  ('02000000-0000-4000-8000-000000001053', '02000000-0000-4000-8000-000000000514', 'jobs.matrix', FALSE, 1),
  ('02000000-0000-4000-8000-000000001054', '02000000-0000-4000-8000-000000000514', 'strategy.matrix', TRUE, 2),
  ('02000000-0000-4000-8000-000000001055', '02000000-0000-4000-8000-000000000514', 'env.values', FALSE, 3),
  ('02000000-0000-4000-8000-000000001056', '02000000-0000-4000-8000-000000000514', 'on.strategy', FALSE, 4),
  -- Q5 (513)q3: artifact
  ('02000000-0000-4000-8000-000000001057', '02000000-0000-4000-8000-000000000515', 'A secret used to authenticate deploys', FALSE, 1),
  ('02000000-0000-4000-8000-000000001058', '02000000-0000-4000-8000-000000000515', 'A workflow trigger type', FALSE, 2),
  ('02000000-0000-4000-8000-000000001059', '02000000-0000-4000-8000-000000000515', 'A build output stored for download or sharing between jobs', TRUE, 3),
  ('02000000-0000-4000-8000-000000001060', '02000000-0000-4000-8000-000000000515', 'A runner image label', FALSE, 4),
  -- Q6 (516): why test in CI
  ('02000000-0000-4000-8000-000000001061', '02000000-0000-4000-8000-000000000516', 'To replace unit tests with release notes', FALSE, 1),
  ('02000000-0000-4000-8000-000000001062', '02000000-0000-4000-8000-000000000516', 'To allow broken code to merge faster', FALSE, 2),
  ('02000000-0000-4000-8000-000000001063', '02000000-0000-4000-8000-000000000516', 'To move testing out of human memory', FALSE, 3),
  ('02000000-0000-4000-8000-000000001064', '02000000-0000-4000-8000-000000000516', 'To verify every change against the suite before it can merge', TRUE, 4),
  -- Q6 (516)q2: reusable workflow
  ('02000000-0000-4000-8000-000000001065', '02000000-0000-4000-8000-000000000517', 'A workflow other workflows call to reuse shared pipeline logic', TRUE, 1),
  ('02000000-0000-4000-8000-000000001066', '02000000-0000-4000-8000-000000000517', 'A workflow that only runs on demand', FALSE, 2),
  ('02000000-0000-4000-8000-000000001067', '02000000-0000-4000-8000-000000000517', 'A workflow stored in a local cache', FALSE, 3),
  ('02000000-0000-4000-8000-000000001068', '02000000-0000-4000-8000-000000000517', 'A job that restarts itself after failure', FALSE, 4),
  -- Q6 (516)q3: workflow_call
  ('02000000-0000-4000-8000-000000001069', '02000000-0000-4000-8000-000000000518', 'push', FALSE, 1),
  ('02000000-0000-4000-8000-000000001070', '02000000-0000-4000-8000-000000000518', 'workflow_call', TRUE, 2),
  ('02000000-0000-4000-8000-000000001071', '02000000-0000-4000-8000-000000000518', 'schedule', FALSE, 3),
  ('02000000-0000-4000-8000-000000001072', '02000000-0000-4000-8000-000000000518', 'pull_request', FALSE, 4),
  -- Q7 (519): publish permission
  ('02000000-0000-4000-8000-000000001073', '02000000-0000-4000-8000-000000000519', 'contents: read', FALSE, 1),
  ('02000000-0000-4000-8000-000000001074', '02000000-0000-4000-8000-000000000519', 'actions: none', FALSE, 2),
  ('02000000-0000-4000-8000-000000001075', '02000000-0000-4000-8000-000000000519', 'contents: write', TRUE, 3),
  ('02000000-0000-4000-8000-000000001076', '02000000-0000-4000-8000-000000000519', 'checks: none', FALSE, 4),
  -- Q7 (519)q2: environments
  ('02000000-0000-4000-8000-000000001077', '02000000-0000-4000-8000-000000000520', 'A second operating system for the job', FALSE, 1),
  ('02000000-0000-4000-8000-000000001078', '02000000-0000-4000-8000-000000000520', 'A guarantee of zero deployment failures', FALSE, 2),
  ('02000000-0000-4000-8000-000000001079', '02000000-0000-4000-8000-000000000520', 'A private package mirror', FALSE, 3),
  ('02000000-0000-4000-8000-000000001080', '02000000-0000-4000-8000-000000000520', 'Protection rules such as required reviewers and wait timers', TRUE, 4),
  -- Q7 (519)q3: failing deploy
  ('02000000-0000-4000-8000-000000001081', '02000000-0000-4000-8000-000000000521', 'Roll back the environment and inspect the failing job logs', TRUE, 1),
  ('02000000-0000-4000-8000-000000001082', '02000000-0000-4000-8000-000000000521', 'Deploy again without any change', FALSE, 2),
  ('02000000-0000-4000-8000-000000001083', '02000000-0000-4000-8000-000000000521', 'Disable the workflow permanently', FALSE, 3),
  ('02000000-0000-4000-8000-000000001084', '02000000-0000-4000-8000-000000000521', 'Delete the repository and start over', FALSE, 4),
  -- Q8 (522): least privilege
  ('02000000-0000-4000-8000-000000001085', '02000000-0000-4000-8000-000000000522', 'Always grant unlimited write permissions', FALSE, 1),
  ('02000000-0000-4000-8000-000000001086', '02000000-0000-4000-8000-000000000522', 'Give the token only the permissions the workflow uses', TRUE, 2),
  ('02000000-0000-4000-8000-000000001087', '02000000-0000-4000-8000-000000000522', 'Publish the token to a public repository', FALSE, 3),
  ('02000000-0000-4000-8000-000000001088', '02000000-0000-4000-8000-000000000522', 'Skip the permissions key entirely', FALSE, 4),
  -- Q8 (522)q2: pinning
  ('02000000-0000-4000-8000-000000001089', '02000000-0000-4000-8000-000000000523', 'SHAs make workflows run faster', FALSE, 1),
  ('02000000-0000-4000-8000-000000001090', '02000000-0000-4000-8000-000000000523', 'Pinning is required for hosted runners', FALSE, 2),
  ('02000000-0000-4000-8000-000000001091', '02000000-0000-4000-8000-000000000523', 'A SHA is immutable so action code cannot be silently swapped', TRUE, 3),
  ('02000000-0000-4000-8000-000000001092', '02000000-0000-4000-8000-000000000523', 'It prevents detailed logs from being written', FALSE, 4),
  -- Q8 (522)q3: secret in step
  ('02000000-0000-4000-8000-000000001093', '02000000-0000-4000-8000-000000000524', 'Type the secret inline in the command', FALSE, 1),
  ('02000000-0000-4000-8000-000000001094', '02000000-0000-4000-8000-000000000524', 'Echo the secret so it stays visible in logs', FALSE, 2),
  ('02000000-0000-4000-8000-000000001095', '02000000-0000-4000-8000-000000000524', 'Put the secret in a workflow comment', FALSE, 3),
  ('02000000-0000-4000-8000-000000001096', '02000000-0000-4000-8000-000000000524', 'Set it as an environment variable and reference it in the script', TRUE, 4),
  -- Q9 (525): stage order
  ('02000000-0000-4000-8000-000000001097', '02000000-0000-4000-8000-000000000525', 'Build, then test, then deploy', TRUE, 1),
  ('02000000-0000-4000-8000-000000001098', '02000000-0000-4000-8000-000000000525', 'Deploy, then build, then test', FALSE, 2),
  ('02000000-0000-4000-8000-000000001099', '02000000-0000-4000-8000-000000000525', 'Test, then deploy, then build', FALSE, 3),
  ('02000000-0000-4000-8000-000000001100', '02000000-0000-4000-8000-000000000525', 'Deploy only, skipping builds and tests', FALSE, 4),
  -- Q9 (525)q2: concurrency
  ('02000000-0000-4000-8000-000000001101', '02000000-0000-4000-8000-000000000526', 'It foils cache key hashing', FALSE, 1),
  ('02000000-0000-4000-8000-000000001102', '02000000-0000-4000-8000-000000000526', 'It stops overlapping runs from racing for the same environment', TRUE, 2),
  ('02000000-0000-4000-8000-000000001103', '02000000-0000-4000-8000-000000000526', 'It prevents branch creation', FALSE, 3),
  ('02000000-0000-4000-8000-000000001104', '02000000-0000-4000-8000-000000000526', 'It limits the number of secrets', FALSE, 4),
  -- Q9 (525)q3: workflow_dispatch
  ('02000000-0000-4000-8000-000000001105', '02000000-0000-4000-8000-000000000527', 'Rename the repository', FALSE, 1),
  ('02000000-0000-4000-8000-000000001106', '02000000-0000-4000-8000-000000000527', 'Add a new environment', FALSE, 2),
  ('02000000-0000-4000-8000-000000001107', '02000000-0000-4000-8000-000000000527', 'Add workflow_dispatch to the on key', TRUE, 3),
  ('02000000-0000-4000-8000-000000001108', '02000000-0000-4000-8000-000000000527', 'Increase the runner count', FALSE, 4),
  -- Q9 (525)q4: status badge
  ('02000000-0000-4000-8000-000000001109', '02000000-0000-4000-8000-000000000528', 'A secret encrypted token', FALSE, 1),
  ('02000000-0000-4000-8000-000000001110', '02000000-0000-4000-8000-000000000528', 'A cached dependency snapshot', FALSE, 2),
  ('02000000-0000-4000-8000-000000001111', '02000000-0000-4000-8000-000000000528', 'A commit message convention', FALSE, 3),
  ('02000000-0000-4000-8000-000000001112', '02000000-0000-4000-8000-000000000528', 'An image in the README showing the latest workflow result', TRUE, 4),
  -- Q9 (525)q5: flaky test
  ('02000000-0000-4000-8000-000000001113', '02000000-0000-4000-8000-000000000529', 'Investigate and stabilize the test before merging', TRUE, 1),
  ('02000000-0000-4000-8000-000000001114', '02000000-0000-4000-8000-000000000529', 'Remove the test from the suite', FALSE, 2),
  ('02000000-0000-4000-8000-000000001115', '02000000-0000-4000-8000-000000000529', 'Disable CI for the whole repository', FALSE, 3),
  ('02000000-0000-4000-8000-000000001116', '02000000-0000-4000-8000-000000000529', 'Skip tests that fail on weekends', FALSE, 4)
ON CONFLICT (id) DO NOTHING;
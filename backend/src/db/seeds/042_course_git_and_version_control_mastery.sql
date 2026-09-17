-- ============================================================================
-- SEED 042: Complete course — "Git & Version Control Mastery"
-- ----------------------------------------------------------------------------
-- Instructor : David Kim           (10000000-0000-4000-8000-000000000004)
-- Category   : DevOps & CI/CD      (20000000-0000-4000-8000-000000000009)
-- Level      : BEGINNER · Access : FREE · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Getting Started with Git   → C1 Why Version Control · C2 Git Fundamentals
--   M2 The Core Workflow          → C3 Staging & Commits · C4 History & Undo
--   M3 Branching & Merging        → C5 Branching · C6 Merging & Rebasing
--   M4 Remote Collaboration       → C7 Remotes & GitHub · C8 Team Workflows
--   M5 Advanced & Capstone        → C9 Advanced Git · C10 Capstone Project
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
  '02A00000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000004',
  '20000000-0000-4000-8000-000000000009',
  'Git & Version Control Mastery',
  'git-and-version-control-mastery',
  'Master Git from your first commit to a shipped release. Learn why version control matters, how Git stores history as immutable objects, and gain practical command of staging, commits, branches, merges, rebasing, GitHub collaboration, team workflows, conflict resolution, and releases — then deliver a complete feature-branch capstone project.',
  'PUBLISHED',
  'BEGINNER',
  'FREE',
  40
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('02A00000-0000-4000-8000-000000000011', '02A00000-0000-4000-8000-000000000001', 'Explain why version control matters and how distributed Git differs from centralized systems.', 1),
  ('02A00000-0000-4000-8000-000000000012', '02A00000-0000-4000-8000-000000000001', 'Create repositories, stage and commit changes, and navigate history with confidence.',              2),
  ('02A00000-0000-4000-8000-000000000013', '02A00000-0000-4000-8000-000000000001', 'Create, merge, and rebase branches and resolve conflicts cleanly.',                              3),
  ('02A00000-0000-4000-8000-000000000014', '02A00000-0000-4000-8000-000000000001', 'Collaborate on GitHub with remotes, pull requests, and healthy team workflows.',                 4),
  ('02A00000-0000-4000-8000-000000000015', '02A00000-0000-4000-8000-000000000001', 'Tag releases, use Git hooks, and deliver a polished feature-branch capstone project.',          5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('02A00000-0000-4000-8000-000000000101', '02A00000-0000-4000-8000-000000000001', 1, 'Getting Started with Git',   'Understand why version control exists and how Git stores history.',      'PUBLISHED'),
  ('02A00000-0000-4000-8000-000000000102', '02A00000-0000-4000-8000-000000000001', 2, 'The Core Workflow',          'Stage, commit, inspect, and undo changes with confidence.',             'PUBLISHED'),
  ('02A00000-0000-4000-8000-000000000103', '02A00000-0000-4000-8000-000000000001', 3, 'Branching & Merging',        'Isolate work on branches and combine it with merges and rebases.',      'PUBLISHED'),
  ('02A00000-0000-4000-8000-000000000104', '02A00000-0000-4000-8000-000000000001', 4, 'Remote Collaboration',       'Share code on GitHub and adopt healthy team workflows.',                 'PUBLISHED'),
  ('02A00000-0000-4000-8000-000000000105', '02A00000-0000-4000-8000-000000000001', 5, 'Advanced & Capstone',        'Tags, hooks, history rewriting, and a complete feature-branch project.', 'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('02A00000-0000-4000-8000-000000000201', '02A00000-0000-4000-8000-000000000101', 1, 'Why Version Control',       'The problems version control solves.',                              'PUBLISHED'),
  ('02A00000-0000-4000-8000-000000000202', '02A00000-0000-4000-8000-000000000101', 2, 'Git Fundamentals',           'Repositories, objects, and the commit graph.',                      'PUBLISHED'),
  ('02A00000-0000-4000-8000-000000000203', '02A00000-0000-4000-8000-000000000102', 1, 'Staging & Commits',          'Turn changes into recorded history.',                               'PUBLISHED'),
  ('02A00000-0000-4000-8000-000000000204', '02A00000-0000-4000-8000-000000000102', 2, 'History & Undo',             'Read the past and safely revise it.',                               'PUBLISHED'),
  ('02A00000-0000-4000-8000-000000000205', '02A00000-0000-4000-8000-000000000103', 1, 'Branching',                  'Parallel lines of development.',                                    'PUBLISHED'),
  ('02A00000-0000-4000-8000-000000000206', '02A00000-0000-4000-8000-000000000103', 2, 'Merging & Rebasing',         'Combine branches and rewrite local history safely.',               'PUBLISHED'),
  ('02A00000-0000-4000-8000-000000000207', '02A00000-0000-4000-8000-000000000104', 1, 'Remotes & GitHub',           'Publish and collaborate through remotes.',                          'PUBLISHED'),
  ('02A00000-0000-4000-8000-000000000208', '02A00000-0000-4000-8000-000000000104', 2, 'Team Workflows',             'Processes that keep shared repositories healthy.',                  'PUBLISHED'),
  ('02A00000-0000-4000-8000-000000000209', '02A00000-0000-4000-8000-000000000105', 1, 'Advanced Git',               'Tags, releases, hooks, and history rewriting.',                     'PUBLISHED'),
  ('02A00000-0000-4000-8000-000000000210', '02A00000-0000-4000-8000-000000000105', 2, 'Capstone Project',           'Apply everything in a realistic feature-branch project.',           'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 02A00000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('02A00000-0000-4000-8000-000000000301', '02A00000-0000-4000-8000-000000000201', 1, 'What is Version Control?',               'Understand why version control prevents file chaos and preserves history.','TEXT', 'PUBLISHED', 'FREE', 10,  6),
  ('02A00000-0000-4000-8000-000000000302', '02A00000-0000-4000-8000-000000000201', 2, 'Centralized vs Distributed VCS',          'Compare old server-based systems with the distributed model of Git.',     'TEXT', 'PUBLISHED', 'FREE', 10,  7),
  ('02A00000-0000-4000-8000-000000000303', '02A00000-0000-4000-8000-000000000201', 3, 'Version Control Essentials Quiz',          'Check your grasp of version control fundamentals.',                       'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('02A00000-0000-4000-8000-000000000304', '02A00000-0000-4000-8000-000000000202', 1, 'Git Objects & the .git Directory',        'Peek inside Git and meet blobs, trees, and commits.',                    'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('02A00000-0000-4000-8000-000000000305', '02A00000-0000-4000-8000-000000000202', 2, 'Initializing Your First Repository',      'Create a repository and configure Git for the first time.',               'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('02A00000-0000-4000-8000-000000000306', '02A00000-0000-4000-8000-000000000202', 3, 'Git Fundamentals Quiz',                   'Test your knowledge of Git internals and setup.',                         'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('02A00000-0000-4000-8000-000000000307', '02A00000-0000-4000-8000-000000000203', 1, 'Staging & Committing Changes',            'Move changes from the working tree into recorded commits.',               'TEXT', 'PUBLISHED', 'FREE', 10,  9),
  ('02A00000-0000-4000-8000-000000000308', '02A00000-0000-4000-8000-000000000203', 2, 'Reading History with git log',            'Explore what happened, when, and why.',                                   'TEXT', 'PUBLISHED', 'FREE', 10,  7),
  ('02A00000-0000-4000-8000-000000000309', '02A00000-0000-4000-8000-000000000203', 3, 'Staging & Commits Quiz',                  'Verify you can stage, commit, and inspect changes.',                      'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('02A00000-0000-4000-8000-000000000310', '02A00000-0000-4000-8000-000000000204', 1, 'Undoing Changes Safely',                  'Restore, reset, and revert without losing your work.',                    'TEXT', 'PUBLISHED', 'FREE', 10,  9),
  ('02A00000-0000-4000-8000-000000000311', '02A00000-0000-4000-8000-000000000204', 2, 'Commit Hygiene & Best Practices',         'Write messages and structures teams love to read.',                       'TEXT', 'PUBLISHED', 'FREE', 10,  7),
  ('02A00000-0000-4000-8000-000000000312', '02A00000-0000-4000-8000-000000000204', 3, 'History & Undo Quiz',                     'Check your history-reading and undo skills.',                              'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('02A00000-0000-4000-8000-000000000313', '02A00000-0000-4000-8000-000000000205', 1, 'Branches Explained',                      'See branches as movable pointers over the commit graph.',                 'TEXT', 'PUBLISHED', 'FREE', 10,  6),
  ('02A00000-0000-4000-8000-000000000314', '02A00000-0000-4000-8000-000000000205', 2, 'Creating & Switching Branches',           'Create, switch, list, and delete branches with modern commands.',          'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('02A00000-0000-4000-8000-000000000315', '02A00000-0000-4000-8000-000000000205', 3, 'Branches Quiz',                           'Test your branch anatomy knowledge.',                                      'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('02A00000-0000-4000-8000-000000000316', '02A00000-0000-4000-8000-000000000206', 1, 'Merging Strategies',                      'Combine branches with fast-forwards and merge commits.',                  'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('02A00000-0000-4000-8000-000000000317', '02A00000-0000-4000-8000-000000000206', 2, 'Rebasing & Conflict Resolution',          'Replay commits for a linear history and survive your first conflict.',     'TEXT', 'PUBLISHED', 'FREE', 10,  9),
  ('02A00000-0000-4000-8000-000000000318', '02A00000-0000-4000-8000-000000000206', 3, 'Merge & Rebase Quiz',                     'Check your merging and rebasing knowledge.',                               'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('02A00000-0000-4000-8000-000000000319', '02A00000-0000-4000-8000-000000000207', 1, 'Working with Remotes',                    'Connect local repositories to shared ones with origin.',                  'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('02A00000-0000-4000-8000-000000000320', '02A00000-0000-4000-8000-000000000207', 2, 'Pull Requests & GitHub Collaboration',    'Turn proposals into reviewed, merged changes on GitHub.',                 'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('02A00000-0000-4000-8000-000000000321', '02A00000-0000-4000-8000-000000000207', 3, 'Remotes & GitHub Quiz',                   'Verify you can push, pull, and collaborate remotely.',                    'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('02A00000-0000-4000-8000-000000000322', '02A00000-0000-4000-8000-000000000208', 1, 'Workflows: GitHub Flow & Trunk',           'Adopt processes that keep the default branch always releasable.',         'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('02A00000-0000-4000-8000-000000000323', '02A00000-0000-4000-8000-000000000208', 2, 'Resolving Conflicts in Practice',         'Walk through a real conflict from marker to clean merge.',                'TEXT', 'PUBLISHED', 'FREE', 10,  9),
  ('02A00000-0000-4000-8000-000000000324', '02A00000-0000-4000-8000-000000000208', 3, 'Workflows & Conflicts Quiz',               'Check your conflict-resolution and workflow skills.',                      'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('02A00000-0000-4000-8000-000000000325', '02A00000-0000-4000-8000-000000000209', 1, 'Tags, Releases & History Rewriting',      'Ship versions with tags and learn when rewriting is safe.',               'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('02A00000-0000-4000-8000-000000000326', '02A00000-0000-4000-8000-000000000210', 1, 'Capstone: Feature Branch Project Setup',  'Scaffold a realistic feature-branch project with a release plan.',        'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('02A00000-0000-4000-8000-000000000327', '02A00000-0000-4000-8000-000000000210', 2, 'Capstone: Merge, Release & Retrospective','Finish the capstone with a clean merge, a tag, and a release.',           'TEXT', 'PUBLISHED', 'FREE', 10,  9),
  ('02A00000-0000-4000-8000-000000000328', '02A00000-0000-4000-8000-000000000210', 3, 'Final Assessment',                        'Prove what you learned across the whole course.',                         'QUIZ', 'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 02A00000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '02A00000-0000-4000-8000-000000000401',
  '02A00000-0000-4000-8000-000000000301',
  1,
  'What is Version Control?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What is Version Control?</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>What is Version Control?</h1>
  <p>A <strong>version control system</strong> (VCS) records every change to your files over time, so you can always answer two questions developers dread: <em>what changed?</em> and <em>who changed it, and can we go back?</em></p>
  <h2>The problem: file chaos</h2>
  <p>Without version control, teams juggle confusing copies. Sound familiar?</p>
  <pre class="code-block">docs/
  report-draft.docx
  report-FINAL.docx
  report-FINAL-v2.docx
  report-FINAL-v2-JANET.docx
  report-FINAL-v2-JANET-REAL.docx</pre>
  <p>Each file copy is a silent lie: nobody knows which one is current, who edited what, or how to undo a bad idea without smashing somebody else's work.</p>
  <h2>What a VCS gives you</h2>
  <table>
    <tr><th>Ability</th><th>What it means day to day</th></tr>
    <tr><td>History</td><td>Every saved snapshot is permanent and searchable.</td></tr>
    <tr><td>Restore</td><td>Roll any file or whole project back to an earlier state.</td></tr>
    <tr><td>Collaboration</td><td>Many people edit safely without overwriting each other.</td></tr>
    <tr><td>Experimentation</td><td>Try risky ideas on branches and discard them if they fail.</td></tr>
    <tr><td>Accountability</td><td>Every change is linked to an author, message, and time.</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Think of it as a time machine</strong>
    <p>Version control lets you jump backward, inspect the past, and re-run history from any point. Saving is cheap, so save often.</p>
  </div>
  <h2>What you will build</h2>
  <p>Across this course you will build a <strong>capstone project</strong>: a small internal documentation site shipped the way real teams ship — feature branches, code review, a merge, a release tag, and clean commit history.</p>
  <div class="callout callout-info">
    <strong>No experience needed</strong>
    <p>You do not need past Git knowledge. You do need a command line and the Git binaries installed — you will set these up in lesson 305.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02A00000-0000-4000-8000-000000000402',
  '02A00000-0000-4000-8000-000000000302',
  1,
  'Centralized vs Distributed VCS',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Centralized vs Distributed VCS</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Centralized vs Distributed VCS</h1>
  <p>Not all version control systems are alike. They split into two families: <strong>centralized</strong> and <strong>distributed</strong>.</p>
  <h2>Centralized: one master copy</h2>
  <p>Tools like SVN and CVS keep the authoritative history on a <strong>single server</strong>. Developers check out a working copy, make edits, and <em>commit back to the server</em>. The server never goes away, so your history depends on one machine.</p>
  <ul>
    <li><strong>Single point of failure</strong> — if the server dies, history is gone.</li>
    <li><strong>Offline work is limited</strong> — no server, no commits or history commands.</li>
    <li>Simple mental model: one hub everyone writes to.</li>
  </ul>
  <h2>Distributed: every clone is a full repository</h2>
  <p>Git is <strong>distributed</strong>. When you clone a project, you get the <em>entire history</em>, not just the current files. Every working copy is a complete backup with its own branches, tags, and commit log.</p>
  <pre class="code-block">git clone https://github.com/demo/project.git
# now you have the full history locally, offline</pre>
  <div class="callout callout-tip">
    <strong>The offline superpower</strong>
    <p>Commit, branch, and inspect history while a plane is offline. Sincy the full repo lives on your disk, syncing later is just a push.</p>
  </div>
  <h2>How the two compare</h2>
  <table>
    <tr><th>Aspect</th><th>Centralized</th><th>Distributed</th></tr>
    <tr><td>History location</td><td>Single server</td><td>Every clone</td></tr>
    <tr><td>Works offline</td><td>Barely</td><td>Fully</td></tr>
    <tr><td>Backup resilience</td><td>One point of failure</td><td>As many backups as clones</td></tr>
    <tr><td>Local branches</td><td>Rare</td><td>Native and cheap</td></tr>
    <tr><td>Example tools</td><td>SVN, CVS</td><td>Git, Mercurial</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Git dominates the modern stack</strong>
    <p>Git powers GitHub, GitLab, and Bitbucket, and is the default choice for most open-source and professional projects. Its branch model makes distributed collaboration natural.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02A00000-0000-4000-8000-000000000404',
  '02A00000-0000-4000-8000-000000000304',
  1,
  'Git Objects & the .git Directory',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Git Objects & the .git Directory</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Git Objects &amp; the .git Directory</h1>
  <p>Every Git repository hides a tiny database in a hidden folder at the project root called <span class="ic">.git</span>. Understanding its contents demystifies everything Git does.</p>
  <pre class="code-block">project/
  .git/          <span>← the whole database</span>
  README.md      <span>← your working files</span>
  src/</pre>
  <p>Your working files are just files. The <span class="ic">.git</span> directory holds <em>every snapshot ever committed</em>, plus branches, tags, and settings.</p>
  <h2>The four object types</h2>
  <table>
    <tr><th>Object</th><th>Stores</th></tr>
    <tr><td>blob</td><td>The raw bytes of a single file at a point in time.</td></tr>
    <tr><td>tree</td><td>A directory listing: file names and the blobs or trees inside.</td></tr>
    <tr><td>commit</td><td>Metadata — author, message, timestamp — plus a tree and parent commits.</td></tr>
    <tr><td>tag</td><td>A named pointer to a specific commit (annotated tags carry a message).</td></tr>
  </table>
  <h2>Content-addressed storage</h2>
  <p>Git names every object by the <strong>SHA-1 hash</strong> of its contents. Identical content produces identical hashes, so Git stores duplicate data only once and can instantly tell when a file changed.</p>
  <pre class="code-block">git cat-file -t 7f9c2b3a   <span># what type of object is this hash?</span>
git cat-file -p 7f9c2b3a   <span># pretty-print the object</span></pre>
  <div class="callout callout-tip">
    <strong>Immutable by design</strong>
    <p>Objects never change once written. Editing history means writing new objects and moving references — the old ones remain in the database until garbage-collected. That is why recovery tools like <span class="ic">git reflog</span> work.</p>
  </div>
  <h2>Commits form a chain</h2>
  <p>A commit stores its <strong>parent</strong> hash. Follow parents and you walk the entire history like a linked list — this chain is the heart of every log, diff, and merge.</p>
  <div class="callout callout-info">
    <strong>You rarely touch these directly</strong>
    <p>Commands like <span class="ic">git add</span> and <span class="ic">git commit</span> create blobs and commits for you. Knowing the model makes their behavior predictable instead of magical.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02A00000-0000-4000-8000-000000000405',
  '02A00000-0000-4000-8000-000000000305',
  1,
  'Initializing Your First Repository',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Initializing Your First Repository</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Initializing Your First Repository</h1>
  <p>A Git <strong>repository</strong> is a project directory that Git tracks. Creating one is a single command, but first make sure Git is installed.</p>
  <h2>Install and verify</h2>
  <pre class="code-block">git --version
# git version 2.40.0  (any modern 2.x is fine)</pre>
  <p>If Git is missing, install it with your system package manager or from git-scm.com and reopen your terminal.</p>
  <h2>Create the repository</h2>
  <pre class="code-block">mkdir my-project
cd my-project
git init
# Initialized empty Git repository in ...my-project/.git/</pre>
  <p><span class="ic">git init</span> creates the hidden <span class="ic">.git</span> folder from lesson 304. Nothing else changes until you commit.</p>
  <h2>Tell Git who you are</h2>
  <p>Every commit records an author. Configure your identity once — <span class="ic">--global</span> applies to all your projects:</p>
  <pre class="code-block">git config --global user.name "David Kim"
git config --global user.email "david@example.com"

git config --list
# user.name=David Kim
# user.email=david@example.com</pre>
  <div class="callout callout-tip">
    <strong>Per-project overrides</strong>
    <p>Drop the <span class="ic">--global</span> flag inside one repository to use a different identity there (common for work versus personal email).</p>
  </div>
  <h2>Your first commit</h2>
  <pre class="code-block">echo "# My Project" &gt; README.md
git add README.md
git commit -m "Add project README"</pre>
  <div class="callout callout-info">
    <strong>Commit requires identity</strong>
    <p>If you commit before setting <span class="ic">user.name</span> and <span class="ic">user.email</span>, Git refuses with a helpful error telling you exactly what to run.</p>
  </div>
  <h2>What just happened</h2>
  <ul>
    <li><span class="ic">git add</span> copied the file into Git's index (staging area).</li>
    <li><span class="ic">git commit</span> froze that snapshot into a new, permanent commit object.</li>
    <li><span class="ic">git log</span> now shows one commit — the start of your history.</li>
  </ul>
  <p>From here, every safe point you need is one commit away.</p>
</div>
</body>
</html>
$html$
),
(
  '02A00000-0000-4000-8000-000000000407',
  '02A00000-0000-4000-8000-000000000307',
  1,
  'Staging & Committing Changes',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Staging & Committing Changes</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Staging &amp; Committing Changes</h1>
  <p>Git separates the moment you <em>save</em> a file from the moment you <em>record</em> it. That middle step is the <strong>staging area</strong> — a rehearsal room for your next commit.</p>
  <h2>The three states</h2>
  <table>
    <tr><th>State</th><th>Where content lives</th><th>Where it shows up</th></tr>
    <tr><td>Working tree</td><td>Your edited files on disk</td><td><span class="ic">git status</span> as modified</td></tr>
    <tr><td>Staging area</td><td>Git's index</td><td>added after <span class="ic">git add</span></td></tr>
    <tr><td>Repository</td><td>Commit objects</td><td>in <span class="ic">git log</span> after <span class="ic">git commit</span></td></tr>
  </table>
  <h2>The basic workflow</h2>
  <pre class="code-block">echo "<!-- <!DOCTYPE html>" > index.html
echo "<h1>Hello</h1>" >> index.html

git add index.html         # stage one file
git add -A                 # stage everything (new, modified, deleted)
git add src/               # stage a whole directory
git add -p                 # stage hunks interactively</pre>
  <p>Inspect what is in each state with <span class="ic">git status</span> and <span class="ic">git diff</span>:</p>
  <pre class="code-block">git status          # seen by humans, color-coded
git status --short  # compact
git diff            # unstaged changes
git diff --staged   # staged changes (what the commit will contain)</pre>
  <div class="callout callout-tip">
    <strong>Read the diff before committing</strong>
    <p>Keep a habit: stage, then <span class="ic">git diff --staged</span>, then commit. You catch accidental deletions and stray print statements before they poison history.</p>
  </div>
  <h2>Making the commit</h2>
  <pre class="code-block">git commit -m "Add landing page skeleton"</pre>
  <p>A commit freezes exactly what is staged — nothing more, nothing less. Files you edited but did not stage stay in the working tree, waiting for a future commit.</p>
  <div class="callout">
    <strong>Commit often, commit small</strong>
    <p>Each commit should be a coherent unit of work. A commit that mixes a bug fix with a rename forces reviewers (and future-you) to untangle unrelated changes.</p>
  </div>
  <h2>Two lifecycle details</h2>
  <ul>
    <li><span class="ic">git rm &lt;file&gt;</span> deletes a file and stages that deletion in one step.</li>
    <li><span class="ic">git mv old.txt new.txt</span> renames while preserving historical intent.</li>
    <li>Abbreviated: <span class="ic">git commit -am "msg"</span> stages tracked changes and commits — but skips new files.</li>
  </ul>
</div>
</body>
</html>
$html$
),
(
  '02A00000-0000-4000-8000-000000000408',
  '02A00000-0000-4000-8000-000000000308',
  1,
  'Reading History with git log',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reading History with git log</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Reading History with git log</h1>
  <p><span class="ic">git log</span> is your window into the past. Start with the essentials and grow your vocabulary as you need it.</p>
  <h2>Simple log</h2>
  <pre class="code-block">git log
# commit 8f6f1a2...
# Author: David Kim &lt;david@example.com&gt;
# Date:   Tue Sep 3 10:04 2026
#     Fix login redirect loop</pre>
  <h2>Everyday variants</h2>
  <table>
    <tr><th>Command</th><th>What it tells you</th></tr>
    <tr><td><span class="ic">git log --oneline</span></td><td>One condensed line per commit.</td></tr>
    <tr><td><span class="ic">git log --graph</span></td><td>ASCII picture of branches and merges.</td></tr>
    <tr><td><span class="ic">git log --oneline --graph --all</span></td><td>Every ref, visualized together.</td></tr>
    <tr><td><span class="ic">git log --stat</span></td><td>Files touched and lines changed per commit.</td></tr>
    <tr><td><span class="ic">git log -p</span></td><td>The full diff of every commit.</td></tr>
    <tr><td><span class="ic">git log --author=&lt;name&gt;</span></td><td>Only commits by one author.</td></tr>
    <tr><td><span class="ic">git log --oneline -3</span></td><td>Just the last three commits.</td></tr>
  </table>
  <h2>Digging into one commit</h2>
  <pre class="code-block">git show 8f6f1a2          # full commit: message + diff
git show HEAD             # the current commit
git show HEAD~1           # one commit before HEAD</pre>
  <div class="callout callout-info">
    <strong>Reading revision syntax</strong>
    <p><span class="ic">HEAD</span> means "where I am" and <span class="ic">HEAD~2</span> means "two commits behind HEAD". Branch names and hashes work anywhere a commit reference is expected.</p>
  </div>
  <h2>Finding who to blame</h2>
  <p><span class="ic">git blame &lt;file&gt;</span> annotates each line with the commit and author that introduced it:</p>
  <pre class="code-block">git blame src/settings.js
# 8f6f1a2 (David Kim 2026-09-03) const maxRetries = 3;</pre>
  <div class="callout callout-tip">
    <strong>Blame the code, not the person</strong>
    <p>Blame points you to the commit that introduced a behavior, so you can read its message and reasoning. Use it to understand intent, never to assign guilt.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02A00000-0000-4000-8000-000000000410',
  '02A00000-0000-4000-8000-000000000310',
  1,
  'Undoing Changes Safely',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Undoing Changes Safely</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Undoing Changes Safely</h1>
  <p>Nobody writes perfect history. The skill is knowing the <em>cheapest, safest</em> undo for each situation — and, crucially, when <em>not</em> to rewrite history at all.</p>
  <h2>Undo the working tree only</h2>
  <p>Discard edits you have not committed (and have not staged) with <span class="ic">git restore</span>:</p>
  <pre class="code-block">git restore README.md        # back to the index version
git restore .                # all tracked files in this folder
git restore --source HEAD~1  # from an earlier commit instead</pre>
  <div class="callout">
    <strong>This deletes real work</strong>
    <p><span class="ic">git restore</span> overwrites uncommitted edits. There is no undo for this undo — double-check with <span class="ic">git status</span> and <span class="ic">git diff</span> first.</p>
  </div>
  <h2>Unstage a mistake</h2>
  <pre class="code-block">git restore --staged README.md
# file leaves the staging area, edits are kept in the working tree</pre>
  <h2>Reset — moving a branch pointer</h2>
  <table>
    <tr><th>Mode</th><th>Moves branch</th><th>Unstages</th><th>Working tree</th></tr>
    <tr><td><span class="ic">git reset --soft</span></td><td>yes</td><td>no</td><td>kept</td></tr>
    <tr><td><span class="ic">git reset</span> (mixed)</td><td>yes</td><td>yes</td><td>kept</td></tr>
    <tr><td><span class="ic">git reset --hard</span></td><td>yes</td><td>yes</td><td>discarded</td></tr>
  </table>
  <pre class="code-block">git reset --soft HEAD~1   # commit again with a better message later
git reset HEAD~1          # redo the commit differently
git reset --hard HEAD~1   # burn the last commit AND its working edits</pre>
  <h2>Revert — the safe undo for shared history</h2>
  <p>Once a commit is pushed, teammates may be standing on it. <span class="ic">git revert</span> creates a <em>new</em> commit that undoes the old one, without rewriting anything:</p>
  <pre class="code-block">git revert 8f6f1a2
# a new commit appears: "Revert 'Fix login redirect loop'"</pre>
  <div class="callout callout-tip">
    <strong>Reset local, revert shared</strong>
    <p>Rewriting shared history corrupts other people's clones. Rule of thumb: branches you have not shared are free to reset; anything you pushed, revert with a new commit.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02A00000-0000-4000-8000-000000000411',
  '02A00000-0000-4000-8000-000000000311',
  1,
  'Commit Hygiene & Best Practices',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Commit Hygiene & Best Practices</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Commit Hygiene &amp; Best Practices</h1>
  <p>A commit message records <em>why</em> a change exists. After six months, it is the only human explanation left. Write messages so future teammates — including you — can reconstruct intent.</p>
  <h2>Atomic commits</h2>
  <ul>
    <li>Each commit is <strong>one logical change</strong>: a fix, a feature, or a refactor.</li>
    <li>If a commit needs three bullet points of unrelated detail, split it.</li>
    <li>Every commit leaves the project <em>buildable</em> — never commit half-working states. Snapshots are restorable checkpoints.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Good message anatomy</strong>
    <p>A terse subject plus a body that explains context: what was broken, why it happened, and what changed.</p>
  </div>
  <h2>The 50/72 shape</h2>
  <pre class="code-block">git commit -m "Fix double submission on the signup form"</pre>
  <p>Keep the subject under roughly 50 characters, imperative mood ("Fix", "Add", "Update"), and put longer reasoning in the body after a blank line.</p>
  <h2>Conventional-commit prefixes</h2>
  <table>
    <tr><th>Prefix</th><th>Meaning</th><th>Example</th></tr>
    <tr><td>feat</td><td>New capability</td><td>feat: add password reset flow</td></tr>
    <tr><td>fix</td><td>Bug repair</td><td>fix: correct timezone on schedules</td></tr>
    <tr><td>docs</td><td>Documentation only</td><td>docs: explain deploy steps</td></tr>
    <tr><td>refactor</td><td>No behavior change</td><td>refactor: extract form helper</td></tr>
    <tr><td>test</td><td>Tests only</td><td>test: cover retry logic</td></tr>
    <tr><td>chore</td><td>Maintenance</td><td>chore: bump dependency versions</td></tr>
  </table>
  <p>Machines (changelog tools, Git logs) and humans both benefit from a uniform vocabulary.</p>
  <h2>Never commit these</h2>
  <ul>
    <li>Secrets — API keys, passwords, tokens (rotate immediately if leaked).</li>
    <li>Generated noise — build output, dependencies, logs, OS files. Keep them out via <span class="ic">.gitignore</span>.</li>
    <li>Large binaries when a reference or submodule would do.</li>
  </ul>
  <pre class="code-block"># .gitignore
node_modules/
dist/
*.log
.env</pre>
  <div class="callout callout-info">
    <strong>Add .gitignore early</strong>
    <p>Ignoring files is cheaper than untracking them. Initialize a fresh repository with a sensible <span class="ic">.gitignore</span> before your first commit.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02A00000-0000-4000-8000-000000000413',
  '02A00000-0000-4000-8000-000000000313',
  1,
  'Branches Explained',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Branches Explained</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Branches Explained</h1>
  <p>A <strong>branch</strong> is just a named pointer to a commit. When you commit on a branch, the pointer moves forward. Create another branch, and suddenly two histories exist that can diverge and later rejoin.</p>
  <h2>The mental model</h2>
  <pre class="code-block">main:  A → B → C
                       (a branch points at C)
feature:            C → D → E</pre>
  <p>Both <span class="ic">main</span> and <span class="ic">feature</span> share commits A–C. The feature adds D and E on top — an independent line of work.</p>
  <h2>HEAD says where you are</h2>
  <p>The special reference <span class="ic">HEAD</span> points at the branch you currently have checked out. Committing advances that branch, and <span class="ic">HEAD</span> follows automatically.</p>
  <pre class="code-block">git branch --show-current   # which branch am I on?
# feature</pre>
  <h2>Why branches matter</h2>
  <ul>
    <li><strong>Isolation</strong> — experiment safely without touching stable code.</li>
    <li><strong>Review</strong> — inspect a whole body of work before it merges.</li>
    <li><strong>Parallel teams</strong> — many features in flight at once.</li>
    <li><strong>Releases</strong> — freeze a release line while development continues.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Cheap is the point</strong>
    <p>Branches are lightweight pointers, not copies. Creating a hundred costs almost nothing in storage or speed — so branch freely and merge deliberately.</p>
  </div>
  <h2>Branches are local by default</h2>
  <p>A branch you create lives only on your machine until you push it. The remote does not see it and does not care — until you decide to share it.</p>
  <div class="callout callout-tip">
    <strong>Default branch name</strong>
    <p>Modern Git and GitHub default to <span class="ic">main</span>. You may still meet <span class="ic">master</span> in older projects — everything you learn works the same either way.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02A00000-0000-4000-8000-000000000414',
  '02A00000-0000-4000-8000-000000000314',
  1,
  'Creating & Switching Branches',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Creating & Switching Branches</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Creating &amp; Switching Branches</h1>
  <p>Modern Git separates <strong>creation</strong> from <strong>switching</strong>, making each command predictable.</p>
  <h2>Create, list, switch</h2>
  <pre class="code-block">git branch feature/login      # create a branch (do not switch)
git branch                    # list local branches, * marks current
git switch feature/login      # switch to it
git switch -c feature/pricing # create AND switch in one step
git switch -                  # back to the previous branch</pre>
  <div class="callout callout-tip">
    <strong>switch - is magic</strong>
    <p>Jumping back and forth between two branches is a plain <span class="ic">git switch -</span>. Compare files, test both, then commit each in its own branch.</p>
  </div>
  <h2>What switching really does</h2>
  <ul>
    <li>Rewrites your <strong>working tree</strong> to match the branch tip.</li>
    <li>Moves <span class="ic">HEAD</span> to the target branch.</li>
    <li>Refuses to run if uncommitted changes would be overwritten — Git protects you.</li>
  </ul>
  <pre class="code-block"># to take your uncommitted work along:
git stash        # park changes
git switch main
git stash pop     # restore them here</pre>
  <h2>Naming branches</h2>
  <p>Adopt a convention the whole team can scan: <span class="ic">feature/&lt;slug&gt;</span>, <span class="ic">bugfix/&lt;slug&gt;</span>, <span class="ic">release/v1.2</span>.</p>
  <pre class="code-block">git switch -c feature/search-bar
git switch -c bugfix/login-redirect</pre>
  <h2>Deleting a branch</h2>
  <pre class="code-block">git branch -d feature/done    # safe: only if merged
git branch -D feature/done    # force: discarded, even if unmerged</pre>
  <div class="callout">
    <strong>Unmerged branches stay recoverable</strong>
    <p>Only the label is deleted — the commits remain in the object database until garbage collection. If you deleted a branch by accident, <span class="ic">git reflog</span> can usually point you back.</p>
  </div>
  <div class="callout callout-info">
    <strong>Old syntax still works</strong>
    <p>You will see <span class="ic">git checkout -b &lt;name&gt;</span> and <span class="ic">git checkout &lt;name&gt;</span> in tutorials and scripts. <span class="ic">git switch</span> is the modern, safer counterpart.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02A00000-0000-4000-8000-000000000416',
  '02A00000-0000-4000-8000-000000000316',
  1,
  'Merging Strategies',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Merging Strategies</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Merging Strategies</h1>
  <p>Merging folds one branch into another. Depending on history, Git picks one of two strategies — and you can force either one.</p>
  <h2>Fast-forward: a slide, not a merge</h2>
  <p>If your branch has not moved since the feature started, integrating is a straight line: move the branch pointer forward to the feature tip.</p>
  <pre class="code-block">origin: A → B → C
feature:        C → D → E

git switch main
git merge feature     # main slides to E — fast-forward</pre>
  <p>No commit is created; the records literally line up.</p>
  <h2>Three-way: joining diverged histories</h2>
  <pre class="code-block">main:      A → B → C → D
feature:   A → B →     C → E

git switch main
git merge feature</pre>
  <p>History diverged after B, so Git combines two tips plus their common ancestor — a <strong>three-way merge</strong> — and creates a <strong>merge commit</strong> with two parents.</p>
  <h2>Forcing a merge commit with --no-ff</h2>
  <p>Teams often want a visible "this feature landed here" marker even when history <em>could</em> fast-forward:</p>
  <pre class="code-block">git switch main
git merge --no-ff feature   # always a merge commit</pre>
  <div class="callout callout-info">
    <strong>Which one is right?</strong>
    <p>Fast-forward keeps a linear, easy-to-bisect history. Merge commits preserve the grouping and timeline of a feature's work. Many teams let Git choose for hotfixes and force <span class="ic">--no-ff</span> for features.</p>
  </div>
  <h2>When a merge goes wrong</h2>
  <p>Conflicts mark files as unmerged. You can pause any time:</p>
  <pre class="code-block">git merge --abort   # bail out, back to the pre-merge state</pre>
  <div class="callout callout-tip">
    <strong>Merge with a clean conscience</strong>
    <p>Merge often and merge small — daily, even. Long-lived branches drift and collide, and each collision is more painful than the last.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02A00000-0000-4000-8000-000000000417',
  '02A00000-0000-4000-8000-000000000317',
  1,
  'Rebasing & Conflict Resolution',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Rebasing & Conflict Resolution</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Rebasing &amp; Conflict Resolution</h1>
  <p>A merge joins histories; a <strong>rebase</strong> replays one line of commits on top of another, producing a linear story.</p>
  <h2>Rebase: replay, don't join</h2>
  <pre class="code-block">git switch feature
git rebase main
# feature commits D and E are recreated on top of main's new tip</pre>
  <p>Before: <span class="ic">main: A → B → C</span> • <span class="ic">feature: C → D → E</span></p>
  <p>After: <span class="ic">main → C → D' → E'</span> — a single, straight line.</p>
  <div class="callout">
    <strong>The golden rule</strong>
    <p>Rebase only commits nobody else has. Once you push a branch, rewriting it forces everyone to reconcile — use merge for shared branches and rebase for your own local work.</p>
  </div>
  <h2>Interactive rebase: shaping local history</h2>
  <pre class="code-block">git rebase -i HEAD~3</pre>
  <p>An editor opens with your three commits and picks like <span class="ic">squash</span>, <span class="ic">fixup</span>, <span class="ic">reword</span>, and <span class="ic">drop</span>. Squash merges several commits into one — perfect before opening a pull request.</p>
  <h2>Cherry-picking: grab one commit</h2>
  <pre class="code-block">git switch main
git cherry-pick 8f6f1a2   # apply a single commit here</pre>
  <h2>Meeting a conflict during rebase</h2>
  <p>If the replayed commits touch the same lines, the rebase pauses with files marked conflicted. Resolve, continue, repeat until the branch is finished:</p>
  <pre class="code-block"># fix the file(s)
git add README.md
git rebase --continue     # keep going
git rebase --abort        # or back out entirely</pre>
  <div class="callout callout-tip">
    <strong>Prefer main fresh</strong>
    <p>Pull the latest <span class="ic">main</span>, rebase your feature onto it, push — and the eventual merge is often a boring fast-forward. Fewer conflicts, cleaner history.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02A00000-0000-4000-8000-000000000419',
  '02A00000-0000-4000-8000-000000000319',
  1,
  'Working with Remotes',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Working with Remotes</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Working with Remotes</h1>
  <p>A <strong>remote</strong> is a named bookmark for another repository's URL — typically a hub like GitHub, GitLab, or Bitbucket. By convention the main one is called <span class="ic">origin</span>.</p>
  <h2>Connect a local repository</h2>
  <pre class="code-block">git remote add origin https://github.com/you/project.git
git remote -v
# origin  https://github.com/you/project.git (fetch)
# origin  https://github.com/you/project.git (push)</pre>
  <p>From a hosted project, clone instead — it sets up <span class="ic">origin</span> and every branch automatically:</p>
  <pre class="code-block">git clone https://github.com/you/project.git
cd project</pre>
  <div class="callout callout-info">
    <strong>Clone is a full local backup</strong>
    <p>Remember lesson 302: cloning downloads the <em>entire</em> history. Your local repository can survive the remote vanishing entirely.</p>
  </div>
  <h2>Push and pull</h2>
  <pre class="code-block">git push -u origin main   # publish, and remember the pairing
git push                  # later pushes need nothing extra
git fetch origin          # download new remote commits
git pull                  # fetch + merge into your branch</pre>
  <p>Track the relationship between local and remote branches:</p>
  <pre class="code-block">git status
# Your branch is up to date with 'origin/main'.</pre>
  <h2>Rejected pushes (and how to read them)</h2>
  <p>If the remote moved ahead of you, Git refuses your push — it never overwrites other people's work. The remedy is always: update first, then push.</p>
  <pre class="code-block">git pull --rebase   # replay your commits on the new remote tip
git push</pre>
  <div class="callout callout-tip">
    <strong>Never force-push casually</strong>
    <p>Rejected for good reason. Rewriting shared history breaks other clones; force-push is reserved for correcting a mistake <em>you</em> made and haven't shared.</p>
  </div>
  <h2>Keeping remotes tidy</h2>
  <pre class="code-block">git remote rename old-name new-name
git remote remove stale-remote
git remote show origin   # summary of tracked branches</pre>
</div>
</body>
</html>
$html$
),
(
  '02A00000-0000-4000-8000-000000000420',
  '02A00000-0000-4000-8000-000000000320',
  1,
  'Pull Requests & GitHub Collaboration',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pull Requests & GitHub Collaboration</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Pull Requests &amp; GitHub Collaboration</h1>
  <p>A <strong>pull request</strong> (PR) is a proposal: "here is a branch, please review it and merge it into the target branch." It is where code review, discussion, and automation meet.</p>
  <h2>The classic PR flow</h2>
  <ol>
    <li>Create a feature branch and commit focused work.</li>
    <li>Push the branch: <span class="ic">git push -u origin feature/login</span>.</li>
    <li>Open a PR on GitHub comparing your branch to <span class="ic">main</span>.</li>
    <li>Reviewers comment; CI runs tests and checks.</li>
    <li>Fix feedback with new commits on the same branch.</li>
    <li>Merge, then delete the branch.</li>
  </ol>
  <div class="callout callout-info">
    <strong>Small PRs merge faster</strong>
    <p>A 50-line PR gets read line by line. A 2,000-line PR gets skimmed and rubber-stamped — exactly the outcome you do not want for risky changes.</p>
  </div>
  <h2>Merge strategies on GitHub</h2>
  <table>
    <tr><th>Button</th><th>Effect</th><th>Good for</th></tr>
    <tr><td>Merge commit</td><td>Adds a merge commit</td><td>Keeping feature history grouped</td></tr>
    <tr><td>Squash and merge</td><td>Collapses all commits into one</td><td>Clean, tidy main history</td></tr>
    <tr><td>Rebase and merge</td><td>Replays commits linearly</td><td>Linear history, individual commits kept</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Squash hides the journey</strong>
    <p>WIP commits become invisible. Squash keeps <span class="ic">main</span> readable at the cost of fine-grained history — most teams consider that a fair trade.</p>
  </div>
  <h2>Protecting the default branch</h2>
  <p>Protected-branch rules force discipline:</p>
  <ul>
    <li>No direct pushes to <span class="ic">main</span> — everything arrives via PR.</li>
    <li>At least one approving review required before merge.</li>
    <li>Checks must pass (CI green) and branches must be up to date.</li>
  </ul>
  <div class="callout callout-info">
    <strong>PRs are for opinions too</strong>
    <p>Beyond review, PRs document decisions. The conversation attached to a merged PR is often the best comment you will ever find on a piece of code.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02A00000-0000-4000-8000-000000000422',
  '02A00000-0000-4000-8000-000000000322',
  1,
  'Workflows: GitHub Flow & Trunk',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Workflows: GitHub Flow & Trunk</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Workflows: GitHub Flow &amp; Trunk</h1>
  <p>A <strong>workflow</strong> is the set of rules a team agrees on for using branches. Two models dominate small and mid-size teams.</p>
  <h2>GitHub Flow</h2>
  <ol>
    <li><span class="ic">main</span> is always in a releasable, production-ready state.</li>
    <li>Anything else lives on a feature branch created from <span class="ic">main</span>.</li>
    <li>Work happens on that branch; commits stay small and descriptive.</li>
    <li>Open a PR early for feedback; keep it updated via new commits or rebases.</li>
    <li>After review and green checks, merge — and deploy the result.</li>
  </ol>
  <div class="callout callout-tip">
    <strong>Deploy after every merge</strong>
    <p>Because <span class="ic">main</span> is always shippable, the merge <em>is</em> the deployment trigger. Teams pair this with CI/CD so shipping becomes a habit, not a ceremony.</p>
  </div>
  <h2>Trunk-based development</h2>
  <p>The same spirit, pushed further: everyone works on <span class="ic">main</span> (the trunk) or on branches that live for <strong>hours to a few days</strong>. Incomplete work is hidden behind feature flags instead of behind long-lived branches.</p>
  <ul>
    <li>Short branches → fewer, smaller conflicts.</li>
    <li>Feature flags decouple <em>merging</em> code from <em>shipping</em> it.</li>
    <li>Continuous integration gives constant feedback.</li>
  </ul>
  <h2>Comparing the models</h2>
  <table>
    <tr><th>Aspect</th><th>GitHub Flow</th><th>Trunk-based</th></tr>
    <tr><td>Branch lifetime</td><td>Feature-sized</td><td>Very short</td></tr>
    <tr><td>Default branch</td><td>Always releasable</td><td>Integrated continuously</td></tr>
    <tr><td>Hidden work</td><td>In branches</td><td>Behind feature flags</td></tr>
    <tr><td>Review path</td><td>PR required</td><td>PR or pair review</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Git Flow, in contrast</strong>
    <p>The older Git Flow keeps long-lived <span class="ic">develop</span> and <span class="ic">release</span> branches. It suits scheduled releases and strict versioning, but its ceremony is overkill for most modern teams and slows continuous delivery.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02A00000-0000-4000-8000-000000000423',
  '02A00000-0000-4000-8000-000000000323',
  1,
  'Resolving Conflicts in Practice',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Resolving Conflicts in Practice</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Resolving Conflicts in Practice</h1>
  <p>A conflict is not an error — it is Git refusing to guess. Two branches changed the same lines, and only a human can decide the outcome.</p>
  <h2>Spot the conflict</h2>
  <pre class="code-block">git merge feature
# CONFLICT (content): Merge conflict in src/settings.js
# Automatic merge failed; fix conflicts and then commit the result.</pre>
  <p><span class="ic">git status</span> lists conflicted files under <em>Unmerged paths</em> with markers <span class="ic">UU</span> (both modified) and similar.</p>
  <h2>Read the markers</h2>
  <pre class="code-block">&lt;&lt;&lt;&lt;&lt;&lt;&lt; HEAD
const timeout = 5000;          // your current branch
=======
const timeout = 8000;          // the incoming branch
&gt;&gt;&gt;&gt;&gt;&gt;&gt; feature/adjust-timeouts</pre>
  <ul>
    <li><span class="ic">&lt;&lt;&lt;&lt;&lt;&lt;&lt;</span> opens the conflicted region.</li>
    <li><span class="ic">=======</span> separates your side from the incoming side.</li>
    <li><span class="ic">&gt;&gt;&gt;&gt;&gt;&gt;&gt;</span> marks the end and names the other branch.</li>
  </ul>
  <h2>Resolve and finish</h2>
  <pre class="code-block"># edit the file: keep yours, theirs, or a blend — then remove the markers
const timeout = 8000;

git add src/settings.js        # stage = resolved
git merge --continue           # finish the merge commit
# or: git commit               # (equivalent after a conflicted merge)</pre>
  <div class="callout callout-tip">
    <strong>Verify before you finish</strong>
    <p>Run the tests and build after resolving. A merge can be syntactically fine and still combine two functions into nonsense.</p>
  </div>
  <h2>Take one side wholesale</h2>
  <pre class="code-block">git checkout --ours src/settings.js    # keep the branch you are on
git checkout --theirs src/settings.js  # keep the incoming branch</pre>
  <p>Handy for obvious cases, dangerous for silent ones — review anyway.</p>
  <div class="callout callout-info">
    <strong>Prevention beats fixing</strong>
    <p>Sync your branch often, keep changes small, and focus each branch on one area of the code. Conflicts still happen; they just stop being scary.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02A00000-0000-4000-8000-000000000425',
  '02A00000-0000-4000-8000-000000000325',
  1,
  'Tags, Releases & History Rewriting',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tags, Releases & History Rewriting</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Tags, Releases &amp; History Rewriting</h1>
  <p>Scaling up means naming versions and — sparingly — reshaping history. Both are simple once you know the rules.</p>
  <h2>Tags: permanent version names</h2>
  <pre class="code-block">git tag v1.0.0                    # lightweight
git tag -a v1.0.0 -m "First public release"   # annotated
git tag                           # list tags
git push origin v1.0.0            # publish a tag
git show v1.0.0</pre>
  <p>Use <strong>semantic versioning</strong>: <span class="ic">MAJOR.MINOR.PATCH</span> — breaking change, additive feature, bug fix.</p>
  <div class="callout callout-tip">
    <strong>Annotated tags for releases</strong>
    <p>Annotated tags carry a message, an author, and a date — metadata releases deserve. GitHub turns a pushed tag into a downloadable <em>release</em> with notes.</p>
  </div>
  <h2>Rewriting history — the safe map</h2>
  <table>
    <tr><th>Operation</th><th>Command</th><th>Shared-safe?</th></tr>
    <tr><td>Fix last message</td><td><span class="ic">git commit --amend</span></td><td>Only if not pushed</td></tr>
    <tr><td>Reshape recent commits</td><td><span class="ic">git rebase -i</span></td><td>Only if not pushed</td></tr>
    <tr><td>Replay others onto yours</td><td><span class="ic">git rebase</span> / <span class="ic">git cherry-pick</span></td><td>Safe (new commits)</td></tr>
    <tr><td>Reverse a pushed commit</td><td><span class="ic">git revert</span></td><td>Yes — adds a commit</td></tr>
  </table>
  <pre class="code-block">git commit --amend -m "feat: retry failed uploads"</pre>
  <div class="callout">
    <strong>Rewrite only what you own</strong>
    <p>Once pushed and shared, history is public property. Amending or rebasing shared commits orphans everyone else's branch tips; <span class="ic">git revert</span> exists precisely for that case.</p>
  </div>
  <h2>Hooks: Git's automation levers</h2>
  <p>Hooks are scripts Git runs at lifecycle events. Store them as files in <span class="ic">.git/hooks</span> or manage them with tools like Husky and pre-commit.</p>
  <pre class="code-block">.git/hooks/
  pre-commit          # run checks before a commit is recorded
  prepare-commit-msg  # inject branch names / ticket ids
  pre-push            # run before uploading to a remote
  post-merge          # install new dependencies after pulls</pre>
  <div class="callout callout-info">
    <strong>The reflog safety net</strong>
    <p><span class="ic">git reflog</span> records every movement of HEAD for weeks. Even after a scary <span class="ic">reset --hard</span>, you can usually find the abandoned commit and restore it. Rewrite boldly, but know your net.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02A00000-0000-4000-8000-000000000426',
  '02A00000-0000-4000-8000-000000000326',
  1,
  'Capstone: Feature Branch Project Setup',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Feature Branch Project Setup</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Feature Branch Project Setup</h1>
  <p>Time to prove it. You will ship the <strong>docs site for Project Sprout</strong> — a small static documentation site — through a real feature-branch workflow with a teammate.</p>
  <h2>The plan</h2>
  <table>
    <tr><th>Step</th><th>Lesson</th><th>Goal</th></tr>
    <tr><td>Scaffold + publish</td><td>326</td><td>Repository, README, CI placeholder</td></tr>
    <tr><td>Feature branches + PRs</td><td>326</td><td>Two reviewed features merge into main</td></tr>
    <tr><td>Release tag</td><td>327</td><td>Tag v1.0.0 and open a GitHub release</td></tr>
    <tr><td>Retrospective</td><td>327</td><td>Review history quality, then reflect</td></tr>
  </table>
  <h2>1. Initialize and protect</h2>
  <pre class="code-block">mkdir docs-sprout &amp;&amp; cd docs-sprout
git init
git switch -c main
git config user.name "David Kim"

# a generous .gitignore
echo "node_modules/" &gt; .gitignore
echo "*.log"          &gt;&gt; .gitignore</pre>
  <h2>2. Baseline commit</h2>
  <pre class="code-block">echo "# Project Sprout Docs" &gt; README.md
git add -A
git commit -m "chore: scaffold docs site with README and gitignore"</pre>
  <h2>3. Publish to GitHub</h2>
  <pre class="code-block"># create the empty repo on GitHub, then:
git remote add origin https://github.com/you/docs-sprout.git
git push -u origin main
# enable branch protection: require PR review + status checks</pre>
  <h2>4. Work one feature per branch</h2>
  <pre class="code-block">git switch -c feature/installation-guide
# write docs/installation.md in a few atomic commits
git add docs/installation.md
git commit -m "docs: add installation guide"
git push -u origin feature/installation-guide
# open a PR → review → merge into main
git switch main
git pull</pre>
  <h2>5. Sync the branch teammate shares</h2>
  <pre class="code-block">git switch -c feature/faq
git pull --rebase origin main   # refresh on top of the merged guide
git push -u origin feature/faq</pre>
  <div class="callout callout-tip">
    <strong>One branch = one PR = one review</strong>
    <p>Reuse the habit: branch from a fresh <span class="ic">main</span>, commit small, push, PR, review, merge. Your history stays readable and your conflicts shrink.</p>
  </div>
  <div class="callout callout-info">
    <strong>Watch for the payoff in lesson 327</strong>
    <p>You will turn that second PR into a release: merge, tag, publish notes. Keep the branch names and commit messages tidy — you will be graded on a clean <span class="ic">git log</span>.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02A00000-0000-4000-8000-000000000427',
  '02A00000-0000-4000-8000-000000000327',
  1,
  'Capstone: Merge, Release & Retrospective',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Merge, Release & Retrospective</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Merge, Release &amp; Retrospective</h1>
  <p>Both features are approved. Now you finish the deliverable: merge cleanly, release as a tag, publish the release notes — and then be honest about how the project went.</p>
  <h2>1. Merging the last feature</h2>
  <pre class="code-block">git switch main
git pull
git merge --no-ff feature/faq     # visible merge commit
git log --oneline --graph</pre>
  <p>Confirm the graph shows both features arriving with their own merge commits. If the merge reported conflicts, resolve, stage, <span class="ic">git merge --continue</span>, then test the site once more.</p>
  <div class="callout callout-tip">
    <strong>Test after every merge</strong>
    <p>History is only as trustworthy as its last build. Run the site, click the links, then tag with confidence.</p>
  </div>
  <h2>2. Tag the release</h2>
  <pre class="code-block">git tag -a v1.0.0 -m "docs: first public release"
git push
git push origin v1.0.0
git tag -n</pre>
  <h2>3. Publish release notes on GitHub</h2>
  <ol>
    <li>Open the repository → Releases → Draft a new release.</li>
    <li>Choose the <span class="ic">v1.0.0</span> tag and target <span class="ic">main</span>.</li>
    <li>Generate rich notes from the commits between releases.</li>
    <li>List new features (installation guide, FAQ) and known limitations honestly.</li>
  </ol>
  <h2>4. Inspect the final history</h2>
  <pre class="code-block">git log --oneline --graph --all
git log --stat main
git status  # expect: working tree clean</pre>
  <p>Every commit should be atomic, messages imperative, and the graph a tidy series of merges from features.</p>
  <h2>5. Retrospective</h2>
  <ul>
    <li><strong>Went well</strong> — small branches, early PRs, clean messages.</li>
    <li><strong>Rough edges</strong> — a late conflict, a message that lied about scope.</li>
    <li><strong>Next time</strong> — sync with <span class="ic">git pull --rebase</span> before every feature.</li>
  </ul>
  <div class="callout callout-info">
    <strong>You just shipped like a team</strong>
    <p>Repository, protected branch, feature PRs, code review, clean merge history, release tag, and release notes — that is the entire lifecycle in ~150 commit-minutes. That is what this course trains you for.</p>
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
  ('02A00000-0000-4000-8000-000000000501', '02A00000-0000-4000-8000-000000000303',
   'Which of these is a core benefit of a version control system?',
   'A VCS records every snapshot so any state can be restored later.', 1),
  ('02A00000-0000-4000-8000-000000000502', '02A00000-0000-4000-8000-000000000303',
   'In a centralized VCS, where does the authoritative history live?',
   'Centralized systems keep the full history on a single server.', 2),
  ('02A00000-0000-4000-8000-000000000503', '02A00000-0000-4000-8000-000000000303',
   'Which Git command copies an existing remote repository to your machine?',
   'git clone downloads the repository and its entire history.', 3),
  ('02A00000-0000-4000-8000-000000000504', '02A00000-0000-4000-8000-000000000306',
   'Which directory inside a Git repository stores all commit history and metadata?',
   'The hidden .git folder is Git database of objects and references.', 1),
  ('02A00000-0000-4000-8000-000000000505', '02A00000-0000-4000-8000-000000000306',
   'Which hash algorithm does Git use to identify objects?',
   'Git names every object with the SHA-1 hash of its contents.', 2),
  ('02A00000-0000-4000-8000-000000000506', '02A00000-0000-4000-8000-000000000306',
   'Which of these is NOT a core Git object type?',
   'Branches are references to commits, not stored objects.', 3),
  ('02A00000-0000-4000-8000-000000000507', '02A00000-0000-4000-8000-000000000309',
   'Which command adds changes from the working tree into the staging area?',
   'git add copies files into Git index in preparation to commit.', 1),
  ('02A00000-0000-4000-8000-000000000508', '02A00000-0000-4000-8000-000000000309',
   'What does git commit create?',
   'A commit freezes the staged snapshot into a permanent commit object.', 2),
  ('02A00000-0000-4000-8000-000000000509', '02A00000-0000-4000-8000-000000000309',
   'Which command shows which files are staged, modified, or untracked?',
   'git status summarizes the state of the working tree and index.', 3),
  ('02A00000-0000-4000-8000-000000000510', '02A00000-0000-4000-8000-000000000312',
   'Which command shows a concise, one-line-per-commit history?',
   'git log --oneline prints each commit on a single condensed line.', 1),
  ('02A00000-0000-4000-8000-000000000511', '02A00000-0000-4000-8000-000000000312',
   'Which command restores a tracked file in the working tree from the index?',
   'git restore discards uncommitted edits and restores the file.', 2),
  ('02A00000-0000-4000-8000-000000000512', '02A00000-0000-4000-8000-000000000312',
   'Which command permanently discards both staged and unstaged changes to tracked files?',
   'git reset --hard moves the branch and discards working-tree edits.', 3),
  ('02A00000-0000-4000-8000-000000000513', '02A00000-0000-4000-8000-000000000315',
   'What does a branch point at?',
   'A branch is a movable pointer to a specific commit.', 1),
  ('02A00000-0000-4000-8000-000000000514', '02A00000-0000-4000-8000-000000000315',
   'Which command creates a new branch AND switches to it?',
   'git switch -c creates the branch and makes it current.', 2),
  ('02A00000-0000-4000-8000-000000000515', '02A00000-0000-4000-8000-000000000315',
   'What does HEAD reference?',
   'HEAD points to the branch that is currently checked out.', 3),
  ('02A00000-0000-4000-8000-000000000516', '02A00000-0000-4000-8000-000000000318',
   'What is a fast-forward merge?',
   'The target branch pointer simply moves forward to the source tip.', 1),
  ('02A00000-0000-4000-8000-000000000517', '02A00000-0000-4000-8000-000000000318',
   'What does git merge --no-ff guarantee?',
   'It always produces a dedicated merge commit.', 2),
  ('02A00000-0000-4000-8000-000000000518', '02A00000-0000-4000-8000-000000000318',
   'What does git rebase &lt;branch&gt; do?',
   'It replays your commits on top of the target branch tip.', 3),
  ('02A00000-0000-4000-8000-000000000519', '02A00000-0000-4000-8000-000000000321',
   'Which command uploads your local commits to a remote?',
   'git push sends local commits to the configured remote branch.', 1),
  ('02A00000-0000-4000-8000-000000000520', '02A00000-0000-4000-8000-000000000321',
   'Which command downloads new remote commits and integrates them locally?',
   'git pull is a fetch followed by a merge into the current branch.', 2),
  ('02A00000-0000-4000-8000-000000000521', '02A00000-0000-4000-8000-000000000321',
   'What is a pull request?',
   'It is a proposal to review and merge a branch into a target branch.', 3),
  ('02A00000-0000-4000-8000-000000000522', '02A00000-0000-4000-8000-000000000324',
   'In GitHub Flow, what state must main always be in?',
   'The default branch must stay releasable and production-ready.', 1),
  ('02A00000-0000-4000-8000-000000000523', '02A00000-0000-4000-8000-000000000324',
   'Which marker divides the two sides of a merge conflict?',
   'The equals marker separates your version from the incoming version.', 2),
  ('02A00000-0000-4000-8000-000000000524', '02A00000-0000-4000-8000-000000000324',
   'What is the first step after editing a conflicted file to keep both changes?',
   'Stage the file with git add to mark the conflict resolved.', 3),
  ('02A00000-0000-4000-8000-000000000525', '02A00000-0000-4000-8000-000000000328',
   'What does a tree object store?',
   'A tree maps file and directory names to blob and tree hashes.', 1),
  ('02A00000-0000-4000-8000-000000000526', '02A00000-0000-4000-8000-000000000328',
   'You pushed a commit with a typo to a shared branch. What is the safest fix?',
   'Add a new corrective commit instead of rewriting shared history.', 2),
  ('02A00000-0000-4000-8000-000000000527', '02A00000-0000-4000-8000-000000000328',
   'What does a protected branch on GitHub enforce?',
   'Protected branches block direct and force pushes until reviews pass.', 3),
  ('02A00000-0000-4000-8000-000000000528', '02A00000-0000-4000-8000-000000000328',
   'What does git reflog record?',
   'The reflog tracks the local movement of HEAD and branch tips.', 4),
  ('02A00000-0000-4000-8000-000000000529', '02A00000-0000-4000-8000-000000000328',
   'Which command names a commit as a release point?',
   'git tag attaches a version name to a specific commit.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; exactly one is correct.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): core benefit of VCS
  ('02A00000-0000-4000-8000-000000001001', '02A00000-0000-4000-8000-000000000501', 'Keeps a complete, recoverable history of changes', FALSE, 1),
  ('02A00000-0000-4000-8000-000000001002', '02A00000-0000-4000-8000-000000000501', 'Deletes duplicate files automatically', FALSE, 2),
  ('02A00000-0000-4000-8000-000000001003', '02A00000-0000-4000-8000-000000000501', 'Preserves snapshots of the project over time', TRUE,  3),
  ('02A00000-0000-4000-8000-000000001004', '02A00000-0000-4000-8000-000000000501', 'Compiles the code for you', FALSE, 4),
  -- Q1 (501) q2: centralized
  ('02A00000-0000-4000-8000-000000001005', '02A00000-0000-4000-8000-000000000502', 'On a single central server', TRUE,  1),
  ('02A00000-0000-4000-8000-000000001006', '02A00000-0000-4000-8000-000000000502', 'On each developer laptop', FALSE, 2),
  ('02A00000-0000-4000-8000-000000001007', '02A00000-0000-4000-8000-000000000502', 'In the CI pipeline cache', FALSE, 3),
  ('02A00000-0000-4000-8000-000000001008', '02A00000-0000-4000-8000-000000000502', 'On a shared USB drive', FALSE, 4),
  -- Q1 (501) q3: clone
  ('02A00000-0000-4000-8000-000000001009', '02A00000-0000-4000-8000-000000000503', 'git pull &lt;url&gt;', FALSE, 1),
  ('02A00000-0000-4000-8000-000000001010', '02A00000-0000-4000-8000-000000000503', 'git clone &lt;url&gt;', TRUE,  2),
  ('02A00000-0000-4000-8000-000000001011', '02A00000-0000-4000-8000-000000000503', 'git init &lt;url&gt;', FALSE, 3),
  ('02A00000-0000-4000-8000-000000001012', '02A00000-0000-4000-8000-000000000503', 'git sync &lt;url&gt;', FALSE, 4),
  -- Q2 (504): .git directory
  ('02A00000-0000-4000-8000-000000001013', '02A00000-0000-4000-8000-000000000504', 'The full commit history, objects and config', TRUE,  1),
  ('02A00000-0000-4000-8000-000000001014', '02A00000-0000-4000-8000-000000000504', 'Only the tracked source files', FALSE, 2),
  ('02A00000-0000-4000-8000-000000001015', '02A00000-0000-4000-8000-000000000504', 'The IDE workspace settings', FALSE, 3),
  ('02A00000-0000-4000-8000-000000001016', '02A00000-0000-4000-8000-000000000504', 'The compiled build output', FALSE, 4),
  -- Q2 (504) q2: hash algorithm
  ('02A00000-0000-4000-8000-000000001017', '02A00000-0000-4000-8000-000000000505', 'MD5', FALSE, 1),
  ('02A00000-0000-4000-8000-000000001018', '02A00000-0000-4000-8000-000000000505', 'CRC-32', FALSE, 2),
  ('02A00000-0000-4000-8000-000000001019', '02A00000-0000-4000-8000-000000000505', 'SHA-1', TRUE,  3),
  ('02A00000-0000-4000-8000-000000001020', '02A00000-0000-4000-8000-000000000505', 'Base64', FALSE, 4),
  -- Q2 (504) q3: not an object type
  ('02A00000-0000-4000-8000-000000001021', '02A00000-0000-4000-8000-000000000506', 'Blob', FALSE, 1),
  ('02A00000-0000-4000-8000-000000001022', '02A00000-0000-4000-8000-000000000506', 'Branch', TRUE,  2),
  ('02A00000-0000-4000-8000-000000001023', '02A00000-0000-4000-8000-000000000506', 'Tree', FALSE, 3),
  ('02A00000-0000-4000-8000-000000001024', '02A00000-0000-4000-8000-000000000506', 'Commit', FALSE, 4),
  -- Q3 (507): git add
  ('02A00000-0000-4000-8000-000000001025', '02A00000-0000-4000-8000-000000000507', 'git commit', FALSE, 1),
  ('02A00000-0000-4000-8000-000000001026', '02A00000-0000-4000-8000-000000000507', 'git push', FALSE, 2),
  ('02A00000-0000-4000-8000-000000001027', '02A00000-0000-4000-8000-000000000507', 'git apply', FALSE, 3),
  ('02A00000-0000-4000-8000-000000001028', '02A00000-0000-4000-8000-000000000507', 'git add', TRUE,  4),
  -- Q3 (507) q2: commit
  ('02A00000-0000-4000-8000-000000001029', '02A00000-0000-4000-8000-000000000508', 'A commit object that snapshots the staged content', TRUE,  1),
  ('02A00000-0000-4000-8000-000000001030', '02A00000-0000-4000-8000-000000000508', 'A backup zip of the whole folder', FALSE, 2),
  ('02A00000-0000-4000-8000-000000001031', '02A00000-0000-4000-8000-000000000508', 'A new remote repository', FALSE, 3),
  ('02A00000-0000-4000-8000-000000001032', '02A00000-0000-4000-8000-000000000508', 'A temporary patch file', FALSE, 4),
  -- Q3 (507) q3: git status
  ('02A00000-0000-4000-8000-000000001033', '02A00000-0000-4000-8000-000000000509', 'git diff', FALSE, 1),
  ('02A00000-0000-4000-8000-000000001034', '02A00000-0000-4000-8000-000000000509', 'git config --list', FALSE, 2),
  ('02A00000-0000-4000-8000-000000001035', '02A00000-0000-4000-8000-000000000509', 'git status', TRUE,  3),
  ('02A00000-0000-4000-8000-000000001036', '02A00000-0000-4000-8000-000000000509', 'git stash', FALSE, 4),
  -- Q4 (510): git log --oneline
  ('02A00000-0000-4000-8000-000000001037', '02A00000-0000-4000-8000-000000000510', 'git log --oneline', TRUE,  1),
  ('02A00000-0000-4000-8000-000000001038', '02A00000-0000-4000-8000-000000000510', 'git status --short', FALSE, 2),
  ('02A00000-0000-4000-8000-000000001039', '02A00000-0000-4000-8000-000000000510', 'git history --all', FALSE, 3),
  ('02A00000-0000-4000-8000-000000001040', '02A00000-0000-4000-8000-000000000510', 'git commit --list', FALSE, 4),
  -- Q4 (510) q2: git restore
  ('02A00000-0000-4000-8000-000000001041', '02A00000-0000-4000-8000-000000000511', 'git erase &lt;file&gt;', FALSE, 1),
  ('02A00000-0000-4000-8000-000000001042', '02A00000-0000-4000-8000-000000000511', 'git restore &lt;file&gt;', TRUE,  2),
  ('02A00000-0000-4000-8000-000000001043', '02A00000-0000-4000-8000-000000000511', 'git drop &lt;file&gt;', FALSE, 3),
  ('02A00000-0000-4000-8000-000000001044', '02A00000-0000-4000-8000-000000000511', 'git clean &lt;file&gt;', FALSE, 4),
  -- Q4 (510) q3: reset hard
  ('02A00000-0000-4000-8000-000000001045', '02A00000-0000-4000-8000-000000000512', 'git stash pop', FALSE, 1),
  ('02A00000-0000-4000-8000-000000001046', '02A00000-0000-4000-8000-000000000512', 'git commit --amend', FALSE, 2),
  ('02A00000-0000-4000-8000-000000001047', '02A00000-0000-4000-8000-000000000512', 'git reset --hard', TRUE,  3),
  ('02A00000-0000-4000-8000-000000001048', '02A00000-0000-4000-8000-000000000512', 'git revert HEAD', FALSE, 4),
  -- Q5 (513): branch points to commit
  ('02A00000-0000-4000-8000-000000001049', '02A00000-0000-4000-8000-000000000513', 'A specific commit', TRUE,  1),
  ('02A00000-0000-4000-8000-000000001050', '02A00000-0000-4000-8000-000000000513', 'A remote server URL', FALSE, 2),
  ('02A00000-0000-4000-8000-000000001051', '02A00000-0000-4000-8000-000000000513', 'An access token', FALSE, 3),
  ('02A00000-0000-4000-8000-000000001052', '02A00000-0000-4000-8000-000000000513', 'A list of file names', FALSE, 4),
  -- Q5 (513) q2: switch -c
  ('02A00000-0000-4000-8000-000000001053', '02A00000-0000-4000-8000-000000000514', 'git branch -d &lt;name&gt;', FALSE, 1),
  ('02A00000-0000-4000-8000-000000001054', '02A00000-0000-4000-8000-000000000514', 'git merge &lt;name&gt;', FALSE, 2),
  ('02A00000-0000-4000-8000-000000001055', '02A00000-0000-4000-8000-000000000514', 'git switch -c &lt;name&gt;', TRUE,  3),
  ('02A00000-0000-4000-8000-000000001056', '02A00000-0000-4000-8000-000000000514', 'git tag &lt;name&gt;', FALSE, 4),
  -- Q5 (513) q3: HEAD
  ('02A00000-0000-4000-8000-000000001057', '02A00000-0000-4000-8000-000000000515', 'The newest commit on every branch', FALSE, 1),
  ('02A00000-0000-4000-8000-000000001058', '02A00000-0000-4000-8000-000000000515', 'A reference to the branch you are on', TRUE,  2),
  ('02A00000-0000-4000-8000-000000001059', '02A00000-0000-4000-8000-000000000515', 'The remote origin URL', FALSE, 3),
  ('02A00000-0000-4000-8000-000000001060', '02A00000-0000-4000-8000-000000000515', 'The commit timestamp clock', FALSE, 4),
  -- Q6 (516): fast-forward
  ('02A00000-0000-4000-8000-000000001061', '02A00000-0000-4000-8000-000000000516', 'The target branch must be deleted first', FALSE, 1),
  ('02A00000-0000-4000-8000-000000001062', '02A00000-0000-4000-8000-000000000516', 'Two unrelated lines meet in a merge commit', FALSE, 2),
  ('02A00000-0000-4000-8000-000000001063', '02A00000-0000-4000-8000-000000000516', 'The source branch tip is discarded', FALSE, 3),
  ('02A00000-0000-4000-8000-000000001064', '02A00000-0000-4000-8000-000000000516', 'The target pointer moves forward to the source tip', TRUE,  4),
  -- Q6 (516) q2: no-ff
  ('02A00000-0000-4000-8000-000000001065', '02A00000-0000-4000-8000-000000000517', 'Always creates a dedicated merge commit', TRUE,  1),
  ('02A00000-0000-4000-8000-000000001066', '02A00000-0000-4000-8000-000000000517', 'Always rewrites the source branch', FALSE, 2),
  ('02A00000-0000-4000-8000-000000001067', '02A00000-0000-4000-8000-000000000517', 'Fast-forwards without any merge commit', FALSE, 3),
  ('02A00000-0000-4000-8000-000000001068', '02A00000-0000-4000-8000-000000000517', 'Requires an empty repository', FALSE, 4),
  -- Q6 (516) q3: rebase
  ('02A00000-0000-4000-8000-000000001069', '02A00000-0000-4000-8000-000000000518', 'Deletes the source branch', FALSE, 1),
  ('02A00000-0000-4000-8000-000000001070', '02A00000-0000-4000-8000-000000000518', 'Replays your commits on top of the branch tip', TRUE,  2),
  ('02A00000-0000-4000-8000-000000001071', '02A00000-0000-4000-8000-000000000518', 'Stashes all local changes', FALSE, 3),
  ('02A00000-0000-4000-8000-000000001072', '02A00000-0000-4000-8000-000000000518', 'Fast-forwards the remote', FALSE, 4),
  -- Q7 (519): push
  ('02A00000-0000-4000-8000-000000001073', '02A00000-0000-4000-8000-000000000519', 'git push', TRUE,  1),
  ('02A00000-0000-4000-8000-000000001074', '02A00000-0000-4000-8000-000000000519', 'git fetch', FALSE, 2),
  ('02A00000-0000-4000-8000-000000001075', '02A00000-0000-4000-8000-000000000519', 'git clone', FALSE, 3),
  ('02A00000-0000-4000-8000-000000001076', '02A00000-0000-4000-8000-000000000519', 'git checkout', FALSE, 4),
  -- Q7 (519) q2: pull
  ('02A00000-0000-4000-8000-000000001077', '02A00000-0000-4000-8000-000000000520', 'git status', FALSE, 1),
  ('02A00000-0000-4000-8000-000000001078', '02A00000-0000-4000-8000-000000000520', 'git revert', FALSE, 2),
  ('02A00000-0000-4000-8000-000000001079', '02A00000-0000-4000-8000-000000000520', 'git pull', TRUE,  3),
  ('02A00000-0000-4000-8000-000000001080', '02A00000-0000-4000-8000-000000000520', 'git sync', FALSE, 4),
  -- Q7 (519) q3: pull request
  ('02A00000-0000-4000-8000-000000001081', '02A00000-0000-4000-8000-000000000521', 'A script that merges at midnight', FALSE, 1),
  ('02A00000-0000-4000-8000-000000001082', '02A00000-0000-4000-8000-000000000521', 'An alias for git clone', FALSE, 2),
  ('02A00000-0000-4000-8000-000000001083', '02A00000-0000-4000-8000-000000000521', 'A report of merge conflicts', FALSE, 3),
  ('02A00000-0000-4000-8000-000000001084', '02A00000-0000-4000-8000-000000000521', 'A proposal to review and merge a branch', TRUE,  4),
  -- Q8 (522): GitHub Flow main
  ('02A00000-0000-4000-8000-000000001085', '02A00000-0000-4000-8000-000000000522', 'Contain only experimental code', FALSE, 1),
  ('02A00000-0000-4000-8000-000000001086', '02A00000-0000-4000-8000-000000000522', 'Be in a releasable, production-ready state', TRUE,  2),
  ('02A00000-0000-4000-8000-000000001087', '02A00000-0000-4000-8000-000000000522', 'Never be pushed to the remote', FALSE, 3),
  ('02A00000-0000-4000-8000-000000001088', '02A00000-0000-4000-8000-000000000522', 'Mirror the machine it was built on', FALSE, 4),
  -- Q8 (522) q2: conflict marker
  ('02A00000-0000-4000-8000-000000001089', '02A00000-0000-4000-8000-000000000523', '=======', TRUE,  1),
  ('02A00000-0000-4000-8000-000000001090', '02A00000-0000-4000-8000-000000000523', '&lt;&lt;&lt;&lt;&lt;&lt;&lt;', FALSE, 2),
  ('02A00000-0000-4000-8000-000000001091', '02A00000-0000-4000-8000-000000000523', '&gt;&gt;&gt;&gt;&gt;&gt;&gt;', FALSE, 3),
  ('02A00000-0000-4000-8000-000000001092', '02A00000-0000-4000-8000-000000000523', '#########', FALSE, 4),
  -- Q8 (522) q3: resolve step
  ('02A00000-0000-4000-8000-000000001093', '02A00000-0000-4000-8000-000000000524', 'Force-push to the remote', FALSE, 1),
  ('02A00000-0000-4000-8000-000000001094', '02A00000-0000-4000-8000-000000000524', 'Re-clone the repository', FALSE, 2),
  ('02A00000-0000-4000-8000-000000001095', '02A00000-0000-4000-8000-000000000524', 'Stage it with git add as resolved', TRUE,  3),
  ('02A00000-0000-4000-8000-000000001096', '02A00000-0000-4000-8000-000000000524', 'Rename the file', FALSE, 4),
  -- Q9 (525): tree object
  ('02A00000-0000-4000-8000-000000001097', '02A00000-0000-4000-8000-000000000525', 'Directory entries mapping names to blobs and trees', TRUE,  1),
  ('02A00000-0000-4000-8000-000000001098', '02A00000-0000-4000-8000-000000000525', 'The raw bytes of a single file', FALSE, 2),
  ('02A00000-0000-4000-8000-000000001099', '02A00000-0000-4000-8000-000000000525', 'Author and timestamp data', FALSE, 3),
  ('02A00000-0000-4000-8000-000000001100', '02A00000-0000-4000-8000-000000000525', 'The remote fetch URL', FALSE, 4),
  -- Q9 (525) q2: safe typo fix
  ('02A00000-0000-4000-8000-000000001101', '02A00000-0000-4000-8000-000000000526', 'Add a new commit that corrects the mistake', TRUE,  1),
  ('02A00000-0000-4000-8000-000000001102', '02A00000-0000-4000-8000-000000000526', 'Amend and force-push immediately', FALSE, 2),
  ('02A00000-0000-4000-8000-000000001103', '02A00000-0000-4000-8000-000000000526', 'Delete the remote branch', FALSE, 3),
  ('02A00000-0000-4000-8000-000000001104', '02A00000-0000-4000-8000-000000000526', 'Reset hard to the first commit', FALSE, 4),
  -- Q9 (525) q3: protected branch
  ('02A00000-0000-4000-8000-000000001105', '02A00000-0000-4000-8000-000000000527', 'Blocks all Git commands locally', FALSE, 1),
  ('02A00000-0000-4000-8000-000000001106', '02A00000-0000-4000-8000-000000000527', 'Prevents normal clones of the repo', FALSE, 2),
  ('02A00000-0000-4000-8000-000000001107', '02A00000-0000-4000-8000-000000000527', 'Reviews each file on every keystroke', FALSE, 3),
  ('02A00000-0000-4000-8000-000000001108', '02A00000-0000-4000-8000-000000000527', 'Blocks direct and forced pushes without approval', TRUE,  4),
  -- Q9 (525) q4: reflog
  ('02A00000-0000-4000-8000-000000001109', '02A00000-0000-4000-8000-000000000528', 'The local movement of HEAD and branch tips', TRUE,  1),
  ('02A00000-0000-4000-8000-000000001110', '02A00000-0000-4000-8000-000000000528', 'Passwords typed into other tools', FALSE, 2),
  ('02A00000-0000-4000-8000-000000001111', '02A00000-0000-4000-8000-000000000528', 'The remote build logs', FALSE, 3),
  ('02A00000-0000-4000-8000-000000001112', '02A00000-0000-4000-8000-000000000528', 'The GitHub issue history', FALSE, 4),
  -- Q9 (525) q5: tag
  ('02A00000-0000-4000-8000-000000001113', '02A00000-0000-4000-8000-000000000529', 'git branch &lt;name&gt;', FALSE, 1),
  ('02A00000-0000-4000-8000-000000001114', '02A00000-0000-4000-8000-000000000529', 'git tag &lt;name&gt;', TRUE,  2),
  ('02A00000-0000-4000-8000-000000001115', '02A00000-0000-4000-8000-000000000529', 'git release &lt;name&gt;', FALSE, 3),
  ('02A00000-0000-4000-8000-000000001116', '02A00000-0000-4000-8000-000000000529', 'git version &lt;name&gt;', FALSE, 4)
ON CONFLICT (id) DO NOTHING;
-- ============================================================================
-- SEED 023: Complete course — "Clean Code & Refactoring"
-- ----------------------------------------------------------------------------
-- Instructor : Elena Rodriguez    (10000000-0000-4000-8000-000000000005)
-- Category   : Software Design & Architecture (20000000-0000-4000-8000-000000000010)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Foundations of Clean Code  → C1 Naming & Meaning · C2 Writing Clean Functions
--   M2 Readability & Style         → C3 Comments, Formatting & Structure · C4 Error Handling & Defensive Coding
--   M3 Detecting Code Smells       → C5 Recognizing Code Smells · C6 Coupling & Structural Smells
--   M4 Refactoring Techniques      → C7 Core Refactoring Techniques · C8 Test-Backed Refactoring
--   M5 Capstone: Review & Refactor → C9 Code Review · C10 The Capstone Refactor
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
  '01700000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000005',
  '20000000-0000-4000-8000-000000000010',
  'Clean Code & Refactoring',
  'clean-code-and-refactoring',
  'Write code your future self will thank you for. Master expressive naming, small honest functions, and robust error handling — then learn to spot code smells and refactor them away safely, one unit test at a time, through a guided capstone refactor.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  21
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('01700000-0000-4000-8000-000000000011', '01700000-0000-4000-8000-000000000001', 'Explain why clean code matters and apply one working definition to your own work.',         1),
  ('01700000-0000-4000-8000-000000000012', '01700000-0000-4000-8000-000000000001', 'Write expressive names, small single-purpose functions, and readable formatting.',         2),
  ('01700000-0000-4000-8000-000000000013', '01700000-0000-4000-8000-000000000001', 'Recognize common code smells and identify where they hide in real codebases.',               3),
  ('01700000-0000-4000-8000-000000000014', '01700000-0000-4000-8000-000000000001', 'Apply safe, test-backed refactoring techniques in small verifiable steps.',                4),
  ('01700000-0000-4000-8000-000000000015', '01700000-0000-4000-8000-000000000001', 'Conduct code reviews and refactor a legacy feature end to end in the capstone.',           5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('01700000-0000-4000-8000-000000000101', '01700000-0000-4000-8000-000000000001', 1, 'Foundations of Clean Code',  'Why cleanliness matters, meaningful names, and small honest functions.',    'PUBLISHED'),
  ('01700000-0000-4000-8000-000000000102', '01700000-0000-4000-8000-000000000001', 2, 'Readability & Style',        'Comments, formatting, and error handling that make code easy to read.',     'PUBLISHED'),
  ('01700000-0000-4000-8000-000000000103', '01700000-0000-4000-8000-000000000001', 3, 'Detecting Code Smells',      'Learn to spot the smells that signal a need to refactor.',                  'PUBLISHED'),
  ('01700000-0000-4000-8000-000000000104', '01700000-0000-4000-8000-000000000001', 4, 'Refactoring Techniques',     'Refactor safely with proven techniques and unit tests.',                    'PUBLISHED'),
  ('01700000-0000-4000-8000-000000000105', '01700000-0000-4000-8000-000000000001', 5, 'Capstone: Review & Refactor','Review a real codebase and refactor it end to end.',                        'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('01700000-0000-4000-8000-000000000201', '01700000-0000-4000-8000-000000000101', 1, 'Naming & Meaning',                 'The single most important act of communication in code.',      'PUBLISHED'),
  ('01700000-0000-4000-8000-000000000202', '01700000-0000-4000-8000-000000000101', 2, 'Writing Clean Functions',          'Small, honest, single-purpose building blocks.',               'PUBLISHED'),
  ('01700000-0000-4000-8000-000000000203', '01700000-0000-4000-8000-000000000102', 1, 'Comments, Formatting & Structure', 'Let the code itself carry the message.',                       'PUBLISHED'),
  ('01700000-0000-4000-8000-000000000204', '01700000-0000-4000-8000-000000000102', 2, 'Error Handling & Defensive Coding','Fail fast, fail loudly, stay readable.',                       'PUBLISHED'),
  ('01700000-0000-4000-8000-000000000205', '01700000-0000-4000-8000-000000000103', 1, 'Recognizing Code Smells',          'Smell detection is the first step of refactoring.',            'PUBLISHED'),
  ('01700000-0000-4000-8000-000000000206', '01700000-0000-4000-8000-000000000103', 2, 'Coupling & Structural Smells',     'Smells hiding in parameters and dependencies.',                'PUBLISHED'),
  ('01700000-0000-4000-8000-000000000207', '01700000-0000-4000-8000-000000000104', 1, 'Core Refactoring Techniques',      'The moves that make code cleaner without changing behavior.',  'PUBLISHED'),
  ('01700000-0000-4000-8000-000000000208', '01700000-0000-4000-8000-000000000104', 2, 'Test-Backed Refactoring',          'Refactor with a safety net, one small step at a time.',        'PUBLISHED'),
  ('01700000-0000-4000-8000-000000000209', '01700000-0000-4000-8000-000000000105', 1, 'Code Review',                      'Four eyes make code better — if you review the right things.', 'PUBLISHED'),
  ('01700000-0000-4000-8000-000000000210', '01700000-0000-4000-8000-000000000105', 2, 'The Capstone Refactor',            'Put it all together on a legacy codebase.',                    'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 01700000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('01700000-0000-4000-8000-000000000301', '01700000-0000-4000-8000-000000000201', 1, 'Why Clean Code Matters',              'Why clean code matters more than cleverness and what the habit costs to build.',    'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01700000-0000-4000-8000-000000000302', '01700000-0000-4000-8000-000000000201', 2, 'Naming That Communicates',             'Choose intention-revealing, pronounceable, searchable names for everything.',       'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01700000-0000-4000-8000-000000000303', '01700000-0000-4000-8000-000000000201', 3, 'Naming Foundations Quiz',              'Check your understanding of naming and communication.',                            'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01700000-0000-4000-8000-000000000304', '01700000-0000-4000-8000-000000000202', 1, 'Small Functions & One Job Each',       'Keep functions small, at one level of abstraction, doing exactly one thing.',       'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01700000-0000-4000-8000-000000000305', '01700000-0000-4000-8000-000000000202', 2, 'Parameters, Defaults & Pure Functions','Tame parameter lists, avoid flag arguments, and prefer pure functions.',           'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01700000-0000-4000-8000-000000000306', '01700000-0000-4000-8000-000000000202', 3, 'Functions Quiz',                       'Verify you can write small, honest functions.',                                     'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01700000-0000-4000-8000-000000000307', '01700000-0000-4000-8000-000000000203', 1, 'Comments: When Less Is More',          'Let the code explain itself and use comments only where intent needs a push.',      'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01700000-0000-4000-8000-000000000308', '01700000-0000-4000-8000-000000000203', 2, 'Formatting & Code Layout',             'Vertical rhythm, consistent layout, and automated formatting tools.',               'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01700000-0000-4000-8000-000000000309', '01700000-0000-4000-8000-000000000203', 3, 'Communication & Style Quiz',            'Check your communication and style knowledge.',                                     'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01700000-0000-4000-8000-000000000310', '01700000-0000-4000-8000-000000000204', 1, 'Error Handling Done Right',            'Prefer exceptions to return codes, add context, and never return null for failures.','TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('01700000-0000-4000-8000-000000000311', '01700000-0000-4000-8000-000000000204', 2, 'Guard Clauses & Early Returns',        'Flatten nested conditionals with guard clauses and early exits.',                   'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01700000-0000-4000-8000-000000000312', '01700000-0000-4000-8000-000000000204', 3, 'Error Handling Quiz',                  'Check your error handling reflexes.',                                               'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01700000-0000-4000-8000-000000000313', '01700000-0000-4000-8000-000000000205', 1, 'What Are Code Smells?',                'Learn what code smells are and why detecting them matters.',                        'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01700000-0000-4000-8000-000000000314', '01700000-0000-4000-8000-000000000205', 2, 'Long Functions, Duplication & God Objects','The three most damaging smells: long functions, duplication, and god objects.', 'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('01700000-0000-4000-8000-000000000315', '01700000-0000-4000-8000-000000000205', 3, 'Code Smells Quiz',                     'Check your ability to spot common smells.',                                         'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01700000-0000-4000-8000-000000000316', '01700000-0000-4000-8000-000000000206', 1, 'Data Clumps & Long Parameter Lists',   'Data clumps, long parameter lists, and primitive obsession.',                       'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01700000-0000-4000-8000-000000000317', '01700000-0000-4000-8000-000000000206', 2, 'Coupling & Dependency Smells',         'Message chains, feature envy, hidden dependencies, and speculative generality.',    'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01700000-0000-4000-8000-000000000318', '01700000-0000-4000-8000-000000000206', 3, 'Structural Smells Quiz',               'Check your knowledge of structural and coupling smells.',                           'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01700000-0000-4000-8000-000000000319', '01700000-0000-4000-8000-000000000207', 1, 'Refactoring Fundamentals',             'Refactoring defined: changing structure without changing behavior.',                'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01700000-0000-4000-8000-000000000320', '01700000-0000-4000-8000-000000000207', 2, 'Extract Methods & Related Moves',      'The mechanical moves: extract function, extract variable, rename, inline, and friends.','TEXT','PUBLISHED','FREE', 10, 12),
  ('01700000-0000-4000-8000-000000000321', '01700000-0000-4000-8000-000000000207', 3, 'Refactoring Techniques Quiz',          'Check your grasp of core refactoring techniques.',                                  'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01700000-0000-4000-8000-000000000322', '01700000-0000-4000-8000-000000000208', 1, 'The Safe Refactoring Workflow',        'Characterization tests, tiny steps, and a green run after every move.',             'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01700000-0000-4000-8000-000000000323', '01700000-0000-4000-8000-000000000208', 2, 'Unit Tests as a Safety Net',           'Write focused unit tests that let you refactor without fear.',                     'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('01700000-0000-4000-8000-000000000324', '01700000-0000-4000-8000-000000000208', 3, 'Test-Backed Refactoring Quiz',         'Check your test-backed refactoring workflow.',                                     'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01700000-0000-4000-8000-000000000325', '01700000-0000-4000-8000-000000000209', 1, 'Conducting Effective Code Review',     'Review design before trivia, ask questions, and keep diffs small.',                 'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01700000-0000-4000-8000-000000000326', '01700000-0000-4000-8000-000000000210', 1, 'Reading & Refactoring Legacy Code',    'Feathers algorithm for safely changing code that has no tests.',                   'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('01700000-0000-4000-8000-000000000327', '01700000-0000-4000-8000-000000000210', 2, 'The Capstone Refactor Project',        'Apply every technique to a messy order processing feature end to end.',            'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('01700000-0000-4000-8000-000000000328', '01700000-0000-4000-8000-000000000210', 3, 'Final Assessment',                     'Prove what you learned across the whole course.',                                  'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 01700000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '01700000-0000-4000-8000-000000000401',
  '01700000-0000-4000-8000-000000000301',
  1,
  'Why Clean Code Matters',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Why Clean Code Matters</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #7c3aed; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #7c3aed; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #7c3aed; }
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
  <h1>Why Clean Code Matters</h1>
  <p>Clean code is not a luxury reserved for pristine greenfield projects. It is the difference between a codebase you can change confidently and one that resists every new requirement.</p>
  <p>Reading code takes far more time than writing it. Developers spend the majority of their day reading existing code, so the way code reads determines how fast the whole team ships.</p>
  <h2>The real cost of messy code</h2>
  <ul>
    <li><strong>Context switching:</strong> every unclear identifier forces you to stop and trace its meaning.</li>
    <li><strong>Late surprises:</strong> tangled code hides assumptions that only explode in production.</li>
    <li><strong>Slow onboarding:</strong> new engineers take weeks instead of days to get productive.</li>
    <li><strong>Moral decline:</strong> one messy corner invites the next developer to add more mess.</li>
  </ul>
  <div class="callout">
    <strong>Broken windows</strong>
    <p>In criminology the &ldquo;broken windows&rdquo; effect applies to code too. A single ugly shortcut tells neighboring code &ldquo;this level of care is acceptable.&rdquo; Fix the small messes and the large ones stop appearing.</p>
  </div>
  <h2>What clean code means</h2>
  <table>
    <tr><th>Characteristic</th><th>What it looks like</th></tr>
    <tr><td>Readable</td><td>A reader understands the intent at a glance</td></tr>
    <tr><td>Small</td><td>Short modules, short functions, focused classes</td></tr>
    <tr><td>Testable</td><td>Behavior is reachable through small seams</td></tr>
    <tr><td>Minimal</td><td>Every element earns its place</td></tr>
    <tr><td>Honest</td><td>Names and code say the same thing</td></tr>
  </table>
  <h2>A working definition</h2>
  <p>For this course, memorize one sentence:</p>
  <div class="callout callout-tip">
    <strong>Definition</strong>
    <p>Clean code is code you can read like a story and change without fear.</p>
  </div>
  <p>Every technique in this course — naming, function size, comments, formatting, error handling, refactoring — serves that one sentence. When a choice makes code read better or changes it more safely, make that choice.</p>
  <div class="callout callout-info">
    <strong>It is a trade, not a talent</strong>
    <p>Cleanliness is a habit you train. Toward the end of this course you will refactor a genuinely messy legacy feature and feel the difference yourself.</p>
  </div>
  <h2>A habit, not a project</h2>
  <p>Treat cleanliness like brushing your teeth: a little every day, not a marathon twice a year. The habits you build now — reaching for a better name, splitting one function, deleting a redundant comment — are what protect you in month six of a long-lived product.</p>
</div>
</body>
</html>
$html$
),
(
  '01700000-0000-4000-8000-000000000402',
  '01700000-0000-4000-8000-000000000302',
  1,
  'Naming That Communicates',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Naming That Communicates</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #7c3aed; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #7c3aed; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #7c3aed; }
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
  <h1>Naming That Communicates</h1>
  <p>Most code failures are not logic failures; they are communication failures. The single cheapest and most valuable habit in clean code is choosing names that carry meaning.</p>
  <h2>Intention-revealing names</h2>
  <p>A name should answer the question the reader would otherwise have to dig into the body for. Compare:</p>
  <pre class="code-block">int d;  // elapsed time in days since last login

int daysSinceLastLogin;</pre>
  <p>Both compile identically. Only one communicates. An intention-revealing name lets the next reader skip your implementation entirely.</p>
  <pre class="code-block">// BAD — what is actually being checked?
if (list[0] &gt; 0 &amp;&amp; list[1] &gt; 9) { ... }

// GOOD — the condition reads like a sentence
boolean hasInventory = stock.pending() &gt; 0
    || stock.onHold() &gt; 9
    || stock.available() &gt; 0;</pre>
  <h2>Pronounceable, searchable, unmistakable</h2>
  <table>
    <tr><th>Avoid</th><th>Prefer</th><th>Why</th></tr>
    <tr><td>genymdhms</td><td>generationTimestamp</td><td>You can say it and search it</td></tr>
    <tr><td>x</td><td>orderCount</td><td>Meaning survives without context</td></tr>
    <tr><td>data / info</td><td>customerProfile</td><td>Type words add no meaning</td></tr>
    <tr><td>order&nbsp;o1, o2</td><td>sourceOrder, targetOrder</td><td>No silent suffix differences</td></tr>
  </table>
  <h2>Nouns for things, verbs for actions</h2>
  <ul>
    <li>Classes and variables are nouns: <span class="ic">Invoice</span>, <span class="ic">activeSubscription</span>.</li>
    <li>Functions are verbs: <span class="ic">refund()</span>, <span class="ic">generateReport()</span>.</li>
    <li>Booleans read as questions: <span class="ic">isEnabled</span>, <span class="ic">hasPaid</span>.</li>
  </ul>
  <h2>Avoid disinformation and noise</h2>
  <p>Do not name something <span class="ic">accountList</span> when it is a dictionary, and do not smuggle meaning into suffixes like <span class="ic">_tmp</span> or <span class="ic">Copy2</span>. The suffix only matters if a reader notices it.</p>
  <div class="callout callout-tip">
    <strong>Rename freely</strong>
    <p>Names are cheap to change with an IDE&rsquo;s rename refactoring. When a better name arrives, use it immediately instead of leaving a comment explaining the old one.</p>
  </div>
  <h2>A quick renaming checklist</h2>
  <ol>
    <li>Say each identifier in a sentence. Does the sentence make sense?</li>
    <li>If two names differ only by a suffix, they are begging for confusion.</li>
    <li>Rename the concept everywhere at once with the IDE, then re-read the diff.</li>
    <li>When a name fights the code, the name usually wins the debate about meaning.</li>
  </ol>
</div>
</body>
</html>
$html$
),
(
  '01700000-0000-4000-8000-000000000404',
  '01700000-0000-4000-8000-000000000304',
  1,
  'Small Functions & One Job Each',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Small Functions & One Job Each</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #7c3aed; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #7c3aed; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #7c3aed; }
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
  <h1>Small Functions &amp; One Job Each</h1>
  <p>Functions are the workhorse of clean code. The rules are easy to state: make them small, make them do one thing, and make their name match that one thing.</p>
  <h2>Smallness</h2>
  <p>There is no magic line count — a function is &ldquo;right-sized&rdquo; when you can see everything it does in a single glance. Twenty lines is already a lot. If a function needs vertical scrolling to be understood, it is too big.</p>
  <h2>One level of abstraction</h2>
  <p>A function should speak one vocabulary. Mixing high-level concepts (validating a payment) with low-level details (byte offsets in a buffer) forces the reader to jump between levels constantly.</p>
  <pre class="code-block">// BAD — three jobs and two abstraction levels
function processOrder(order) {
  validateStock(order.items);                 // policy level
  const rows = serializeRows(order);          // detail level
  for (const row of rows) {
    insertRow(row);                           // detail level
  }
  updateCustomerBalance(order.customer, order.total); // policy again
}

// GOOD — each step has a name and a single job
function processOrder(order) {
  order.validate();
  repository.save(order);
  billing.updateBalance(order.customer, order.total);
}</pre>
  <h2>Do one thing</h2>
  <p>Ask a simple test: can you describe the function with one &ldquo;and&rdquo;-free sentence? A <span class="ic">checkout()</span> that also sends a newsletter is doing two things.</p>
  <h2>The step-down rule</h2>
  <p>Arrange code like a newspaper: a summary at the top, then the details further down. A reader can stop at any depth and still have a coherent picture.</p>
  <div class="callout callout-info">
    <strong>Side effects</strong>
    <p>A function that does its stated job <em>and</em> silently changes shared state violates &ldquo;one thing.&rdquo; Prefer returning values and letting the caller decide where they go.</p>
  </div>
  <div class="callout callout-tip">
    <strong>The goal</strong>
    <p>When you read a small function you should be able to trust it without reading its body. That trust is the whole point of the exercise.</p>
  </div>
  <h2>Blocks and indentation</h2>
  <p>Deep indentation is a warning sign long before it is a style problem. Every level of nesting multiplies the states a reader must hold in memory. Extract blocks into functions to refund that nesting early:</p>
  <pre class="code-block">function applyPolicy(user, order) {
  if (!user) return null;
  if (order.items.length === 0) return null;
  return computeTotal(user, order);    // the actual work, one level deep
}</pre>
</div>
</body>
</html>
$html$
),
(
  '01700000-0000-4000-8000-000000000405',
  '01700000-0000-4000-8000-000000000305',
  1,
  'Parameters, Defaults & Pure Functions',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Parameters, Defaults & Pure Functions</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #7c3aed; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #7c3aed; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Parameters, Defaults &amp; Pure Functions</h1>
  <p>The signature of a function is its front door. Parameter lists and side effects deserve exactly the same discipline as names.</p>
  <h2>Fewer parameters</h2>
  <p>Zero to two parameters is ideal. Three is a smell; four or more demand an object. Long lists are hard to call correctly, hard to read, and easy to misorder.</p>
  <pre class="code-block">// BAD — five positional arguments
createOrder('Elena', 'VISA••4242', 129.90, 'EUR', true);

// GOOD — an encapsulating parameter object
const order = createOrder({
  customer: customer,
  payment: paymentMethod,
  total: { amount: 129.90, currency: 'EUR' },
  expressShipping: true,
});</pre>
  <h2>No flag parameters</h2>
  <p>A boolean parameter that switches behavior means the function does two things. Split it into two functions with honest names:</p>
  <pre class="code-block">render(entity, true)        // BAD — the flag hides the real choice
renderPdf(entity)           // GOOD — the names tell the difference
renderHtml(entity)</pre>
  <h2>Default values</h2>
  <p>Defaults make optional behavior explicit without exploding the parameter list:</p>
  <pre class="code-block">function formatMoney(cents, currency = 'EUR') {
  return new Intl.NumberFormat('en', {
    style: 'currency',
    currency,
  }).format(cents / 100);
}</pre>
  <div class="callout callout-tip">
    <strong>Prefer pure functions</strong>
    <p>A pure function is deterministic (same inputs, same output) and has no side effects. It can be tested in isolation, reasoned about in any order, and reused without fear. Push I/O to the edges and keep the core pure.</p>
  </div>
  <p>Command-query separation keeps behavior predictable: methods that change state (&ldquo;commands&rdquo;) return nothing; methods that return answers (&ldquo;queries&rdquo;) change nothing.</p>
  <div class="callout callout-info">
    <strong>Output parameters are a trap</strong>
    <p>Passing a mutable collection in and mutating it behind the caller&rsquo;s back is confusing. Return the new value instead and let the caller decide what to keep.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01700000-0000-4000-8000-000000000407',
  '01700000-0000-4000-8000-000000000307',
  1,
  'Comments: When Less Is More',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Comments: When Less Is More</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #7c3aed; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #7c3aed; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #7c3aed; }
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
  <h1>Comments: When Less Is More</h1>
  <p>A comment is often a failure of naming or structure. If you need a comment to explain what a line does, the line was probably named or shaped wrong.</p>
  <h2>Comments are not a substitute for clean code</h2>
  <pre class="code-block">// BAD — the comment restates the code
// check if the user is an admin
if (user.role == 'ADMIN') { ... }

// GOOD — the name says it
if (user.isAdmin()) { ... }</pre>
  <h2>Comments that earn their place</h2>
  <table>
    <tr><th>Kind</th><th>Example</th></tr>
    <tr><td>Legal</td><td>License headers that must appear by law</td></tr>
    <tr><td>Intent</td><td>Why a non-obvious approach was chosen over an obvious one</td></tr>
    <tr><td>Warning</td><td>Consequences of an action, e.g. &ldquo;this endpoint is rate-limited&rdquo;</td></tr>
    <tr><td>Contract</td><td>Preconditions, postconditions, and invariants at a boundary</td></tr>
  </table>
  <pre class="code-block">// This endpoint fan-outs to analytics — callers must tolerate latency.
// Slow path only: invoked from the nightly reconciliation job.
export async function reconcileLedger(accounts) { ... }</pre>
  <p>An intent comment records a reason the code itself cannot state:</p>
  <pre class="code-block">// Retry once — the registry replicates asynchronously and the
// first read often lands before the replica has caught up.
const record = await registry.get(id, { retries: 1 });</pre>
  <h2>Comments that always lie</h2>
  <ul>
    <li><strong>Redundant:</strong> repeating the identifier that is doing the work.</li>
    <li><strong>Misleading:</strong> accurate today, wrong after the next edit.</li>
    <li><strong>Journaling:</strong> &ldquo;Changed 2024-06-02 to fix the timeout&rdquo; — history belongs in version control.</li>
    <li><strong>Blame:</strong> &ldquo;Do not touch, only this team understands it&rdquo; — improve the code, do not memorialize the mystery.</li>
  </ul>
  <div class="callout">
    <strong>The golden rule</strong>
    <p>Write the comment that explains the <em>why</em>, never the <em>what</em>. The what is already in the code; the why lives in your head.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Comments as a signal</strong>
    <p>If you are about to write a paragraph of commentary, the real fix is usually extracting a function or choosing a better name.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01700000-0000-4000-8000-000000000408',
  '01700000-0000-4000-8000-000000000308',
  1,
  'Formatting & Code Layout',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Formatting & Code Layout</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #7c3aed; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #7c3aed; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #7c3aed; }
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
  <h1>Formatting &amp; Code Layout</h1>
  <p>Formatting is the typography of code — invisible when done well, exhausting when not. Its purpose is to make the structure visible at a glance.</p>
  <h2>Vertical formatting</h2>
  <ul>
    <li><strong>Openness:</strong> blank lines separate concepts; a wall of text hides every boundary.</li>
    <li><strong>Density:</strong> related lines stay close — the declaration sits beside its first use.</li>
    <li><strong>Distance:</strong> dependencies appear near their usage, not hundreds of lines away.</li>
    <li><strong>Order:</strong> arrange by flow. A reader should rarely scroll up and down to connect ideas.</li>
  </ul>
  <pre class="code-block"># BAD — no rhythm
def process(items):
    total = 0
    for item in items:
        total += item.price
    tax = total * 0.2
    return total + tax

# GOOD — one idea per block
def price_with_tax(items):
    subtotal = sum(item.price for item in items)
    tax = subtotal * TAX_RATE
    return subtotal + tax</pre>
  <h2>Horizontal formatting</h2>
  <p>Short lines keep diffs reviewable and nesting shallow. When a line overflows, indent the continuation so the structure survives the wrap.</p>
  <h2>Ordering &amp; grouping</h2>
  <table>
    <tr><th>Level</th><th>Convention</th></tr>
    <tr><td>File</td><td>Imports, constants, types, then behavior</td></tr>
    <tr><td>Class</td><td>Static first, then instance; public before private</td></tr>
    <tr><td>Function</td><td>Local state, then the steps that consume it</td></tr>
  </table>
  <h2>Let machines do it</h2>
  <p>Disputes about tabs versus spaces are noise. Adopt a formatter (<span class="ic">prettier</span>, <span class="ic">gofmt</span>, <span class="ic">black</span>, <span class="ic">clang-format</span>) and run it in CI. What is enforced is never debated.</p>
  <table>
    <tr><th>Formatter</th><th>Best known in</th></tr>
    <tr><td>Prettier</td><td>JavaScript, TypeScript, JSON, CSS</td></tr>
    <tr><td>Black</td><td>Python</td></tr>
    <tr><td>gofmt</td><td>Go</td></tr>
    <tr><td>clang-format</td><td>C, C++</td></tr>
    <tr><td>rustfmt</td><td>Rust</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Follow the house style</strong>
    <p>Consistency beats any single choice. If the codebase puts brackets on their own lines, do that. Clean code is code that reads predictably.</p>
  </div>
  <div class="callout callout-info">
    <strong>Formatting is not cosmetics</strong>
    <p>Good layout reveals the architecture and the flow. Reviews become conversations about design instead of alignment.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01700000-0000-4000-8000-000000000410',
  '01700000-0000-4000-8000-000000000310',
  1,
  'Error Handling Done Right',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Error Handling Done Right</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #7c3aed; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #7c3aed; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Error Handling Done Right</h1>
  <p>Error handling is part of the product, not an afterthought. Handling failure with the same care as success is what separates prototypes from production software.</p>
  <h2>Exceptions over return codes</h2>
  <pre class="code-block">// BAD — every call site re-checks the code
int status = save(record);
if (status == -1) rollback();

// GOOD — the happy path reads like a story
try {
  repository.save(record);
  notification.send(record);
} catch (PersistenceException e) {
  log.error('Failed to persist order {}', record.id, e);
  notifySupport(record.id, e);
}</pre>
  <h2>Give failures context</h2>
  <p>An exception that says <span class="ic">Error: null</span> sends the team hunting. At each boundary, wrap and enrich:</p>
  <pre class="code-block">catch (SQLException e) {
  throw new OrderLoadException(
    'Could not load orders for account ' + accountId, e);
}</pre>
  <h2>Fail fast</h2>
  <p>Validate at the edges: reject an invalid input the moment it arrives instead of carrying a poisoned value through the pipeline.</p>
  <pre class="code-block">function applyDiscount(invoice, rate) {
  if (rate &lt; 0 || rate &gt; 1) {
    throw new RangeError('discount rate must be between 0 and 1');
  }
  return invoice.total * (1 - rate);
}</pre>
  <div class="callout">
    <strong>Do not return null for failures</strong>
    <p><span class="ic">null</span> forces every caller to remember a check. Return an empty collection, use an optional, or throw — pick one and be consistent across the codebase.</p>
  </div>
  <h2>The three questions</h2>
  <ul>
    <li>What can fail here? (I/O, parsing, external calls)</li>
    <li>What does the user or caller need to know?</li>
    <li>What must be released or reset even on failure? (<span class="ic">finally</span>)</li>
  </ul>
  <h2>Anti-patterns to avoid</h2>
  <table>
    <tr><th>Anti-pattern</th><th>Why it hurts</th></tr>
    <tr><td>Swallowing every exception</td><td>The bug disappears with no trace</td></tr>
    <tr><td>Catching and rethrowing with less info</td><td>Context is destroyed on the way up</td></tr>
    <tr><td>Using strings as errors</td><td>Handlers must parse prose to decide</td></tr>
    <tr><td>Returning null on bad input</td><td>Null checks leak into every caller</td></tr>
  </table>
</div>
</body>
</html>
$html$
),
(
  '01700000-0000-4000-8000-000000000411',
  '01700000-0000-4000-8000-000000000311',
  1,
  'Guard Clauses & Early Returns',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Guard Clauses & Early Returns</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #7c3aed; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #7c3aed; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Guard Clauses &amp; Early Returns</h1>
  <p>Deeply nested conditionals are the fastest way to make a function unreadable. Guard clauses keep the happy path flat.</p>
  <h2>Before: nested fortresses</h2>
  <pre class="code-block">function finalPrice(cart, userId, coupon) {
  if (cart) {
    if (cart.items.length &gt; 0) {
      let price = sum(cart.items);
      if (coupon) {
        if (coupon.validFor(userId)) {
          price = price * (1 - coupon.rate);
        } else {
          throw new Error('coupon not valid for this user');
        }
      }
      return price;
    }
  }
  return 0;
}</pre>
  <h2>After: a hallway, not a fortress</h2>
  <pre class="code-block">function finalPrice(cart, userId, coupon) {
  if (!cart || cart.items.length === 0) return 0;

  let price = sum(cart.items);
  if (coupon) {
    if (!coupon.validFor(userId)) {
      throw new Error('coupon not valid for this user');
    }
    price = price * (1 - coupon.rate);
  }
  return price;
}</pre>
  <h2>Rules of thumb</h2>
  <ul>
    <li>Each guard clause catches <strong>one</strong> precondition and exits immediately.</li>
    <li>Guard clauses return early; they never continue into the body.</li>
    <li>After the guards, the remaining code runs with every guarantee already checked.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Name the condition</strong>
    <p>When a guard condition is complex, extract it into a function: <span class="ic">if (cart.isEmpty()) return 0;</span> reads better than the raw expression.</p>
  </div>
  <div class="callout callout-info">
    <strong>Watch your limit</strong>
    <p>More than a few guards usually mean the function is doing several jobs. Split it.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01700000-0000-4000-8000-000000000413',
  '01700000-0000-4000-8000-000000000313',
  1,
  'What Are Code Smells?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What Are Code Smells?</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #7c3aed; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #7c3aed; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #7c3aed; }
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
  <h1>What Are Code Smells?</h1>
  <p>A code smell is a structural signal that something in the design may be wrong. It is not a bug — the code still runs — but it points to places where bugs hide and changes hurt.</p>
  <h2>Smells are clues, not verdicts</h2>
  <div class="callout">
    <strong>The name</strong>
    <p>The term was popularized by Martin Fowler and Kent Beck: like a smell at the scene, it tells you something needs attention. You still have to investigate.</p>
  </div>
  <p>Treat a smell like a cheap alarm raised by a smoke detector: look, verify, and decide. Sometimes the right response is a short comment explaining why the smell is acceptable.</p>
  <h2>Why smell detection matters</h2>
  <ul>
    <li>Smells correlate with fault-proneness: duplicated code and long methods are the most common predictors of change and defects.</li>
    <li>Smells make behavior changes expensive, because the true location of a behavior is scattered.</li>
    <li>Smell literacy is the prerequisite for refactoring: you cannot fix what you cannot name.</li>
  </ul>
  <h2>Where smells accumulate</h2>
  <table>
    <tr><th>Smell group</th><th>Examples</th><th>Techniques to learn</th></tr>
    <tr><td>Function smells</td><td>Long methods, long parameter lists</td><td>Extract function, parameter object</td></tr>
    <tr><td>Duplication</td><td>Copy-paste, divergent change</td><td>Parameterize, extract</td></tr>
    <tr><td>Structure smells</td><td>Data clumps, god objects</td><td>Extract class</td></tr>
    <tr><td>Coupling smells</td><td>Message chains, feature envy</td><td>Move function, hide delegate</td></tr>
  </table>
  <h2>The classic catalog</h2>
  <p>You will meet the most famous offenders in the coming lessons; the full catalog is wider:</p>
  <ul>
    <li><strong>Long method</strong> and <strong>large class</strong> — too much in one unit.</li>
    <li><strong>Duplicated code</strong> and <strong>divergent change</strong> — the same idea in many places.</li>
    <li><strong>Feature envy</strong> and <strong>data clumps</strong> — data in the wrong neighborhood.</li>
    <li><strong>Primitive obsession</strong> — domain concepts squeezed into scalars.</li>
    <li><strong>Shotgun surgery</strong> — one logical change touching ten files.</li>
    <li><strong>Lazy class</strong> — a unit that stopped pulling its weight.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Train the radar</strong>
    <p>Reading well-factored code builds the taste for clean structure. Once you have seen a clean version of a pattern, the messy version starts to shout.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01700000-0000-4000-8000-000000000414',
  '01700000-0000-4000-8000-000000000314',
  1,
  'Long Functions, Duplication & God Objects',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Long Functions, Duplication & God Objects</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #7c3aed; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #7c3aed; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #7c3aed; }
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
  <h1>Long Functions, Duplication &amp; God Objects</h1>
  <p>Three smells deserve special attention because they are the most common and the most indicative of trouble: long functions, duplicated code, and classes that know and do everything.</p>
  <h2>Long function</h2>
  <p>A method of a hundred lines hides its flow behind its own bulk. Symptoms: deep nesting, many local variables, comments that label sections, and several responsibilities squeezed under one name.</p>
  <pre class="code-block">// A function split into "prose-comment sections" is section-jumps waiting
// to become extractions:
// 1) parse line      →  extract parseLine(line)
// 2) validate fields →  extract validateFields(record)
// 3) persist         →  extract persist(record)</pre>
  <h2>Duplicated code</h2>
  <p>Duplication means a change must be applied in N places — and it will be forgotten in N minus one of them.</p>
  <ul>
    <li><strong>Copy-paste duplication:</strong> extract the shared part and parameterize the differences.</li>
    <li><strong>Algorithmic duplication:</strong> two implementations of the same rule; keep the clearest one.</li>
    <li><strong>Structural duplication:</strong> the same shape repeated in different types; introduce a common parameter or interface.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Rule of three</strong>
    <p>The third time you write the same logic, extract it. Duplication is cheap twice and expensive forever after.</p>
  </div>
  <h2>God object</h2>
  <p>A class that knows about everything and is depended on by everything is a coordination point with a single point of failure. Every change touches it, and every test requires it.</p>
  <div class="callout callout-tip">
    <strong>Feature envy</strong>
    <p>When a method spends more time with another class&rsquo;s data than its own, the method probably belongs there. Move it, and the god object starts to shrink.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01700000-0000-4000-8000-000000000416',
  '01700000-0000-4000-8000-000000000316',
  1,
  'Data Clumps & Long Parameter Lists',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Data Clumps & Long Parameter Lists</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #7c3aed; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #7c3aed; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #7c3aed; }
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
  <h1>Data Clumps &amp; Long Parameter Lists</h1>
  <p>Some smells live in the signatures of your code — the places where values travel. Data clumps and parameter lists are two sides of the same problem: related data that never learned to travel together as one.</p>
  <h2>Data clumps</h2>
  <p>When the same three or four values appear together over and over — <span class="ic">customerId</span>, <span class="ic">deliveryAddress</span>, <span class="ic">zipCode</span> — they form a clump. The clump wants to become a first-class object.</p>
  <pre class="code-block">// BAD — the same trio everywhere
ship(customerName, customerZip, customerCountry, items);
invoice(customerName, customerZip, customerCountry);

// GOOD — one concept
Address address = new Address(customerName, zip, country);
ship(address, items);
invoice(address);</pre>
  <h2>Long parameter list</h2>
  <p>Every parameter is a contract with every caller. With five or more, callers misorder arguments, and the function becomes a grab-bag.</p>
  <table>
    <tr><th>Symptom</th><th>Fix</th></tr>
    <tr><td>Parameters travel together</td><td>Introduce a parameter object</td></tr>
    <tr><td>Several flags switch behavior</td><td>Split the function</td></tr>
    <tr><td>A value is derived from others</td><td>Compute it inside</td></tr>
    <tr><td>Callers pass whole objects then unpack them</td><td>Pass the object, not its parts</td></tr>
  </table>
  <h2>Primitive obsession</h2>
  <p>Using primitives for concepts that have rules — a <span class="ic">phoneNumber</span> that is just a string, a <span class="ic">percentage</span> that is just a float — scatters those rules across the codebase. Wrap the value, and the validation and formatting come with it.</p>
  <h2>Choosing the response</h2>
  <table>
    <tr><th>Smell</th><th>Refactoring move</th></tr>
    <tr><td>Data clump</td><td>Extract class / introduce parameter object</td></tr>
    <tr><td>Long parameter list</td><td>Introduce parameter object</td></tr>
    <tr><td>Primitive obsession</td><td>Replace primitive with object</td></tr>
    <tr><td>Middle man</td><td>Remove middle man, inline</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Clump to class</strong>
    <p>When two values never appear apart, that is strong evidence of a missing type. Extract the clump first; the refactoring of the callers becomes mechanical afterwards.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01700000-0000-4000-8000-000000000417',
  '01700000-0000-4000-8000-000000000317',
  1,
  'Coupling & Dependency Smells',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Coupling & Dependency Smells</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #7c3aed; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #7c3aed; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Coupling &amp; Dependency Smells</h1>
  <p>Coupling is the glue between modules. A little glue is necessary; too much makes every change an exploration and every test a setup marathon.</p>
  <h2>Message chains</h2>
  <pre class="code-block">order.getCustomer().getAddress().getCountry()   // BAD — a chain

order.customerCountry()                          // GOOD — one hop, one promise</pre>
  <p>Chains couple the caller to every type in the path. Hide the navigation behind a method, and the caller no longer cares about the shape of the object graph.</p>
  <h2>Feature envy</h2>
  <p>A function that reaches into another object&rsquo;s data for its whole body is in the wrong place. It wants to move next to that data.</p>
  <h2>Inappropriate intimacy</h2>
  <p>When two classes reach into each other&rsquo;s private details, they might be one class wearing two costumes — or two classes that need a third, shared collaborator.</p>
  <h2>Hidden dependencies &amp; global state</h2>
  <p>Static state, hidden singletons, or configuration read in the middle of logic are dependencies you cannot see from a call site. Make dependencies explicit:</p>
  <pre class="code-block">function report(store) { ... }   // GOOD — the store is visible
function report() { ... }        // BAD — which store? nobody knows</pre>
  <h2>Speculative generality</h2>
  <p>Abstract classes, interfaces, and parameters no behavior uses yet double the surface to read, test, and maintain. Write for today&rsquo;s requirement; the abstraction earns its keep when the second use arrives.</p>
  <div class="callout callout-tip">
    <strong>Coverage check</strong>
    <p>When you can answer &ldquo;what depends on this?&rdquo; in one breath and test the unit without a database, your coupling is in good shape.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01700000-0000-4000-8000-000000000419',
  '01700000-0000-4000-8000-000000000319',
  1,
  'Refactoring Fundamentals',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Refactoring Fundamentals</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #7c3aed; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #7c3aed; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #7c3aed; }
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
  <h1>Refactoring Fundamentals</h1>
  <p>Refactoring is restructuring existing code without changing its observable behavior — a series of small, safe transformations that improve the internal shape.</p>
  <h2>What refactoring is not</h2>
  <ul>
    <li>Not a rewrite: you reuse the moving parts, you do not replace them from scratch.</li>
    <li>Not feature work: no new behavior is added while refactoring.</li>
    <li>Not bug fixing: behavior is preserved — improvements to correctness happen in a separate, tested change.</li>
  </ul>
  <div class="callout">
    <strong>Behavior preservation</strong>
    <p>Before and after each refactoring step, the code runs the same. That is what lets you refactor on a tight schedule: nothing you do can break the product.</p>
  </div>
  <h2>When to refactor</h2>
  <table>
    <tr><th>Moment</th><th>Why it pays</th></tr>
    <tr><td>Before adding a feature</td><td>A clean base makes the new code trivial</td></tr>
    <tr><td>Before fixing a bug</td><td>Readable code reveals the real cause</td></tr>
    <tr><td>After a feature</td><td>Remove the scaffolding in its own commit</td></tr>
    <tr><td>Before a code review</td><td>The reviewer reviews design, not mess</td></tr>
  </table>
  <h2>The rule of three</h2>
  <p>The classic heuristic: if you have done something twice and are about to do it a third time, now is the time to generalize and reduce duplication.</p>
  <h2>Shape, not content</h2>
  <p>Refactoring changes the road, not the destination. The second version below does the same math with names and structure that tell the story.</p>
  <pre class="code-block">// Before — correct but buried
double t(double[] a) {
  double s = 0; for (int i = 0; i &lt; a.length; i++) s += a[i];
  return s / a.length;
}

// After — same behavior, a readable shape
double average(double[] values) {
  if (values.length == 0) return 0;
  return sum(values) / values.length;
}</pre>
  <h2>Two hats</h2>
  <p>Wear one hat at a time. In the <strong>refactoring hat</strong> you add no behavior; in the <strong>feature hat</strong> you add behavior and change no structure. Mixing them produces changes that are impossible to review and impossible to revert cleanly.</p>
  <div class="callout callout-tip">
    <strong>Small steps, always</strong>
    <p>Each transformation is minutes long and followed by a test run. The essence of refactoring is not the final shape — it is the sequence of safe steps that get you there.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01700000-0000-4000-8000-000000000420',
  '01700000-0000-4000-8000-000000000320',
  1,
  'Extract Methods & Related Moves',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Extract Methods & Related Moves</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #7c3aed; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #7c3aed; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #7c3aed; }
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
  <h1>Extract Methods &amp; Related Moves</h1>
  <p>A handful of mechanical transformations covers most cleanup work. They are safe precisely because they are mechanical — the semantics do not change, only the shape.</p>
  <h2>Extract function (extract method)</h2>
  <pre class="code-block">function renderReport(rows) {
  const header = '|  ID  |  Total  |';
  // 20 more lines building rows...
  console.log(header);
  console.log(body);
  console.log(footer());
}

function renderReport(rows) {
  printHeader();
  printBody(rows);
  printFooter();
}</pre>
  <p>Locate a cohesive block, give it a name that describes its single job, and replace the block with a call.</p>
  <h2>Other everyday moves</h2>
  <table>
    <tr><th>Move</th><th>When</th></tr>
    <tr><td>Extract variable</td><td>A sub-expression is used repeatedly or is hard to name in place</td></tr>
    <tr><td>Extract to parameter</td><td>Two callers need slight variations of the same logic</td></tr>
    <tr><td>Rename</td><td>The identifier no longer matches its meaning</td></tr>
    <tr><td>Inline</td><td>A tiny function whose name adds nothing is better at its call site</td></tr>
    <tr><td>Slide statements</td><td>Related statements were separated during edits</td></tr>
    <tr><td>Introduce parameter object</td><td>A data clump keeps appearing in signatures</td></tr>
  </table>
  <h2>Replace magic number with named constant</h2>
  <pre class="code-block">// BAD
finalPrice = base - base * 0.2;   // what is 0.2?

// GOOD
const VAT_RATE = 0.2;
finalPrice = base - base * VAT_RATE;</pre>
  <h2>Decompose conditionals</h2>
  <p>Turn each part of a complex <span class="ic">if</span> into a named function — the condition, the then-part, and the else-part each become one line that reads as prose.</p>
  <div class="callout callout-tip">
    <strong>Run after every move</strong>
    <p>These moves are safe, but only the tests can confirm it. One move, one run, one commit. Slow is fast.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01700000-0000-4000-8000-000000000422',
  '01700000-0000-4000-8000-000000000322',
  1,
  'The Safe Refactoring Workflow',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Safe Refactoring Workflow</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #7c3aed; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #7c3aed; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>The Safe Refactoring Workflow</h1>
  <p>Refactoring without tests is risky; refactoring with a verified safety net is boring in the good sense. Boring changes are reliable changes.</p>
  <h2>Step 1 — Get a safety net</h2>
  <p>Before changing anything, run the existing test suite. If the area has no tests, write <strong>characterization tests</strong> that record the current behavior:</p>
  <pre class="code-block">// A characterization test locks in what code does TODAY.
// Even if that behavior looks wrong, you will correct it in a
// separate, deliberate change.
test('legacy price() returns current known output', () =&gt; {
  expect(price({ base: 100, coupon: 'SAVE10' })).toBe(90);
});</pre>
  <h2>Step 2 — Pick the tiniest move</h2>
  <p>Choose one transformation from the toolbox — rename a variable, extract one function, slide one statement. Do nothing else.</p>
  <h2>Step 3 — Run the tests</h2>
  <p>Green? Commit and take the next tiny step. Red? Revert the single change — because it was one change, reverting is trivial.</p>
  <div class="callout">
    <strong>Small steps are the whole point</strong>
    <p>The power comes from the size, not the direction. A two-minute change that can be undone in seconds lets you refactor code you do not fully understand yet.</p>
  </div>
  <h2>Working on unfamiliar code</h2>
  <ul>
    <li>Read the tests first — they document the contracts.</li>
    <li>Refactor to <em>understand</em>: extract aggressively to surface hidden structure.</li>
    <li>Commit after each green run, even in the middle of a thought.</li>
  </ul>
  <h2>The campground rule</h2>
  <p>Leave the code better than you found it. Small, continuous improvement compounds: a five-minute cleanup during every change beats a quarterly &ldquo;refactor week&rdquo; that never arrives.</p>
</div>
</body>
</html>
$html$
),
(
  '01700000-0000-4000-8000-000000000423',
  '01700000-0000-4000-8000-000000000323',
  1,
  'Unit Tests as a Safety Net',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Unit Tests as a Safety Net</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #7c3aed; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #7c3aed; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Unit Tests as a Safety Net</h1>
  <p>Unit tests pin behavior so refactoring stays safe. A good test is fast, isolated, and describes the behavior a reader can trust.</p>
  <h2>Anatomy of a unit test</h2>
  <pre class="code-block">test('final_price applies a coupon rate', () =&gt; {
  // Arrange
  const cart = new Cart([{ price: 100 }]);
  const coupon = new Coupon(0.10);

  // Act
  const price = cart.finalPrice(coupon);

  // Assert
  expect(price).toBe(90);
});</pre>
  <h2>Name the behavior, not the plumbing</h2>
  <p>Test names are documentation. <span class="ic">applies a coupon rate</span> tells the future reader what the unit promises; <span class="ic">test_cart_1</span> tells nothing.</p>
  <h2>What belongs in a unit test</h2>
  <ul>
    <li>Happy paths and each meaningful failure branch.</li>
    <li>Boundaries: empty inputs, zero, one element, maximums.</li>
    <li>The contract the rest of the code depends on — that is exactly what a refactor must preserve.</li>
  </ul>
  <h2>The pyramid in practice</h2>
  <p>Most tests should be fast unit tests; a minority should exercise integration; a small number should walk through the whole system. When refactoring, the wide, fast base is what gives you the courage to move code freely.</p>
  <h2>Testability is a design reward</h2>
  <p>Code that is hard to test is usually code with hidden dependencies and scattered responsibilities. Removing the smell also fixes the test, which is why awkward tests lead to design improvements:</p>
  <pre class="code-block">// BAD — the clock is hidden; the test cannot control time
function orderDeadline() { return new Date() + ... }

// GOOD — inject the clock
function orderDeadline(now = new Date()) { ... }</pre>
  <div class="callout callout-tip">
    <strong>Test the seam, not the internals</strong>
    <p>You almost never need to test private methods. If a behavior is important enough to verify, it deserves a public surface — usually via extract function.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01700000-0000-4000-8000-000000000425',
  '01700000-0000-4000-8000-000000000325',
  1,
  'Conducting Effective Code Review',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Conducting Effective Code Review</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #7c3aed; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #7c3aed; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #7c3aed; }
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
  <h1>Conducting Effective Code Review</h1>
  <p>Review is the cheapest quality gate a team has. A focused review catches design mistakes minutes after they are written, not months after deployment.</p>
  <h2>What to review first</h2>
  <ol>
    <li><strong>Behavior:</strong> does this change do what the author claims?</li>
    <li><strong>Contract:</strong> does it break callers, APIs, or tests?</li>
    <li><strong>Nothing extra:</strong> is the diff limited to its stated purpose?</li>
    <li><strong>Tests:</strong> do they cover the new behavior, including failures?</li>
    <li><strong>Design:</strong> names, size, duplication, placement.</li>
    <li><strong>Style:</strong> only what the formatter did not already catch.</li>
  </ol>
  <h2>The reviewer&rsquo;s tone</h2>
  <table>
    <tr><th>Instead of</th><th>Say</th></tr>
    <tr><td>This code is wrong.</td><td>I think this can return an empty list here — let&rsquo;s check.</td></tr>
    <tr><td>Why did you do this?</td><td>What was the constraint behind this approach?</td></tr>
    <tr><td>Refactor everything.</td><td>This function is 80 lines; extract the parsing part?</td></tr>
  </table>
  <h2>The author&rsquo;s response</h2>
  <ul>
    <li>Treat comments as smoke signals about readability, not personal attacks.</li>
    <li>Answer quickly with a change or with the reasoning that makes the comment moot.</li>
    <li>If the exchange turns into a debate, take it offline and summarize the outcome in the thread.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Keep diffs small</strong>
    <p>Review effectiveness collapses past a few hundred lines. Request the split when a review is a wall of several thousand lines.</p>
  </div>
  <h2>A starting checklist</h2>
  <ul>
    <li>Is this the smallest correct version of the request?</li>
    <li>Do the tests fail for the right reason if I mentally break them?</li>
    <li>Are names consistent with the surrounding code?</li>
    <li>Would the author understand every comment tomorrow?</li>
    <li>Does the diff have a single purpose I could name in one line?</li>
  </ul>
</div>
</body>
</html>
$html$
),
(
  '01700000-0000-4000-8000-000000000426',
  '01700000-0000-4000-8000-000000000326',
  1,
  'Reading & Refactoring Legacy Code',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reading & Refactoring Legacy Code</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #7c3aed; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #7c3aed; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Reading &amp; Refactoring Legacy Code</h1>
  <p>Legacy code, in Michael Feathers&rsquo; sense, is code without tests. The problem with legacy code is not that it is old — it is that nobody can prove what it does.</p>
  <h2>Characterize before you change</h2>
  <ol>
    <li>Find the entry points and list the observable behaviors.</li>
    <li>Write characterization tests that pin the current outputs.</li>
    <li>Now you can refactor with those tests as a safety net.</li>
  </ol>
  <pre class="code-block">// Record the actual behavior BEFORE refactoring begins.
test('legacy total() matches the known production output', () =&gt; {
  const cart = { items: [100, 25, 40] };
  expect(total(cart)).toBe(165);
});</pre>
  <h2>Seams: where you can intercept</h2>
  <p>A <strong>seam</strong> is a place where you can change behavior without editing the code in question. Examples: an interface the class already implements, a method that can be overridden in a test subclass, an injected collaborator.</p>
  <pre class="code-block">// Legacy: creates its own printer — untestable
class InvoicePrinter {
  print(invoice) {
    const p = new NetworkPrinter('HQ');
    p.send(invoice.toXml());
  }
}

// Seam: inject the printer — testable, behavior unchanged elsewhere
class InvoicePrinter {
  constructor(printer = new NetworkPrinter('HQ')) {
    this.printer = printer;
  }
}</pre>
  <h2>The change algorithm</h2>
  <ul>
    <li>Identify the change point (one small behavior).</li>
    <li>Find seams that reach it.</li>
    <li>Break the dependencies behind those seams.</li>
    <li>Write tests, then make the change.</li>
    <li>Refactor the surrounding code — now safely.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Add tests at every public boundary</strong>
    <p>Even broad, shallow tests help. They stop the whole module from rotating when you touch one line.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01700000-0000-4000-8000-000000000427',
  '01700000-0000-4000-8000-000000000327',
  1,
  'The Capstone Refactor Project',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Capstone Refactor Project</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #7c3aed; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #7c3aed; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #7c3aed; }
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
  <h1>The Capstone Refactor Project</h1>
  <p>Every technique in this course converges here. You will take a messy <span class="ic">processOrder</span> and turn it into small, named, tested pieces — without changing what it does.</p>
  <h2>The starting point</h2>
  <pre class="code-block">function processOrder(input) {          // 200+ lines
  // 1) parse and validate the input manually, char by char
  // 2) apply discounts with a 0.1 and a 0.05 magic number
  // 3) save the order, then email, then log — all in one block
  // 4) return a 0 or -1 and hope the caller checks it
}</pre>
  <h2>The smells you will find</h2>
  <table>
    <tr><th>Smell</th><th>Your move</th></tr>
    <tr><td>Long function</td><td>Extract parse, validate, price, persist</td></tr>
    <tr><td>Magic numbers</td><td>Named constants</td></tr>
    <tr><td>Return codes</td><td>Exceptions with context</td></tr>
    <tr><td>Hidden I/O</td><td>Inject the email and log functions</td></tr>
    <tr><td>No tests</td><td>Characterization tests first</td></tr>
  </table>
  <h2>The workflow</h2>
  <ol>
    <li>Characterization tests capture the current outputs.</li>
    <li>One refactoring move per step; tests green after each.</li>
    <li>Commit after each green run with a message naming the move.</li>
    <li>Finish by reviewing the diff: is the new shape the story you wanted to tell?</li>
  </ol>
  <h2>Success criteria</h2>
  <ul>
    <li>Behavior identical: every characterization test still green.</li>
    <li>Each function fits in a glance and names its own job.</li>
    <li>Duplication eliminated; magic numbers replaced.</li>
    <li>A new feature — say, a student discount — now slots into one place.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>You know it worked</strong>
    <p>When the change you were dreading becomes a ten-minute, one-place edit, the refactor was worth every boring step.</p>
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
  ('01700000-0000-4000-8000-000000000501', '01700000-0000-4000-8000-000000000303',
   'Which statement best describes what clean code is mainly about?',
   'Clean code is judged by how easily humans can read and change it, not by cleverness or speed.', 1),
  ('01700000-0000-4000-8000-000000000502', '01700000-0000-4000-8000-000000000303',
   'Why should a name be intention-revealing?',
   'An intention-revealing name lets the reader understand the purpose without reading the body.', 2),
  ('01700000-0000-4000-8000-000000000503', '01700000-0000-4000-8000-000000000303',
   'Which identifier violates clean-code naming guidance?',
   'd2 conveys nothing; names like customerEmail and orderTotal describe their meaning.', 3),
  ('01700000-0000-4000-8000-000000000504', '01700000-0000-4000-8000-000000000306',
   'What is the single responsibility of a clean function?',
   'A clean function does one thing at one level of abstraction, so it is easy to name, test, and reuse.', 1),
  ('01700000-0000-4000-8000-000000000505', '01700000-0000-4000-8000-000000000306',
   'Which is a sign of a clean function?',
   'Short and single-purpose functions are the core of the small functions rule.', 2),
  ('01700000-0000-4000-8000-000000000506', '01700000-0000-4000-8000-000000000306',
   'What distinguishes a pure function?',
   'A pure function is deterministic and side-effect free, which makes it trivial to test.', 3),
  ('01700000-0000-4000-8000-000000000507', '01700000-0000-4000-8000-000000000309',
   'When are comments most useful?',
   'Comments earn their place only when they express intent or warn where the code cannot.', 1),
  ('01700000-0000-4000-8000-000000000508', '01700000-0000-4000-8000-000000000309',
   'Which comment is an example of a good comment?',
   'Warnings about subtle invariants carry information the code itself could not state clearly.', 2),
  ('01700000-0000-4000-8000-000000000509', '01700000-0000-4000-8000-000000000309',
   'What is the main benefit of consistent formatting?',
   'Consistent vertical and horizontal structure makes the architecture legible at a glance.', 3),
  ('01700000-0000-4000-8000-000000000510', '01700000-0000-4000-8000-000000000312',
   'Which practice describes failing fast?',
   'Fail fast means rejecting invalid state at the boundary before it propagates.', 1),
  ('01700000-0000-4000-8000-000000000511', '01700000-0000-4000-8000-000000000312',
   'Why prefer exceptions over return codes for error signaling?',
   'Exceptions keep the happy path flat and give failures a rich, actionable context.', 2),
  ('01700000-0000-4000-8000-000000000512', '01700000-0000-4000-8000-000000000312',
   'What should a guard clause do?',
   'A guard clause exits immediately for a bad precondition, leaving the main path unindented.', 3),
  ('01700000-0000-4000-8000-000000000513', '01700000-0000-4000-8000-000000000315',
   'What is a code smell?',
   'A smell is a warning sign pointing to underlying problems, not a defect itself.', 1),
  ('01700000-0000-4000-8000-000000000514', '01700000-0000-4000-8000-000000000315',
   'Which of these is one of the most common code smells?',
   'Duplicated code is one of the most common and reliable indicators of design trouble.', 2),
  ('01700000-0000-4000-8000-000000000515', '01700000-0000-4000-8000-000000000315',
   'Why is duplicated code considered a smell?',
   'Every copy must be patched; missed copies are where behavior silently drifts apart.', 3),
  ('01700000-0000-4000-8000-000000000516', '01700000-0000-4000-8000-000000000318',
   'What is a data clump?',
   'Fields that always appear together strongly suggest a missing, cohesive type.', 1),
  ('01700000-0000-4000-8000-000000000517', '01700000-0000-4000-8000-000000000318',
   'Which symptom signals a long parameter list?',
   'Long parameter lists make call sites error-prone; the parameters are usually a data clump.', 2),
  ('01700000-0000-4000-8000-000000000518', '01700000-0000-4000-8000-000000000318',
   'What is a message chain?',
   'Message chains couple the caller to the whole navigation path; hide the walk behind one method.', 3),
  ('01700000-0000-4000-8000-000000000519', '01700000-0000-4000-8000-000000000321',
   'What does refactoring preserve?',
   'Refactoring changes structure while preserving observable behavior exactly.', 1),
  ('01700000-0000-4000-8000-000000000520', '01700000-0000-4000-8000-000000000321',
   'What is Extract Function?',
   'Extract function moves a cohesive block into its own named unit — the core refactoring move.', 2),
  ('01700000-0000-4000-8000-000000000521', '01700000-0000-4000-8000-000000000321',
   'When is a good time to refactor?',
   'Refactoring just before new work makes the upcoming change smaller and safer.', 3),
  ('01700000-0000-4000-8000-000000000522', '01700000-0000-4000-8000-000000000324',
   'What role do characterization tests play in refactoring legacy code?',
   'Characterization tests record today behavior, giving you a safety net on untested legacy code.', 1),
  ('01700000-0000-4000-8000-000000000523', '01700000-0000-4000-8000-000000000324',
   'What is the right step size during refactoring?',
   'Tiny verifiable steps are what make refactoring safe on unfamiliar code.', 2),
  ('01700000-0000-4000-8000-000000000524', '01700000-0000-4000-8000-000000000324',
   'What does red, green, refactor refer to?',
   'Red, green, refactor is the test-driven loop: failing test, passing test, then design work.', 3),
  ('01700000-0000-4000-8000-000000000525', '01700000-0000-4000-8000-000000000328',
   'What is the first thing to check when reviewing a pull request?',
   'Reviews should first answer whether the change is correct and purposeful.', 1),
  ('01700000-0000-4000-8000-000000000526', '01700000-0000-4000-8000-000000000328',
   'How should you respond when a reviewer questions your design?',
   'Feedback is information; clarifying questions convert disagreement into shared understanding.', 2),
  ('01700000-0000-4000-8000-000000000527', '01700000-0000-4000-8000-000000000328',
   'A 300-line function with nested loops and magic numbers needs help. Which first step is safest?',
   'Small tested extractions are the safest first step on any oversized function.', 3),
  ('01700000-0000-4000-8000-000000000528', '01700000-0000-4000-8000-000000000328',
   'Which technique helps when a legacy class performs file I/O you want to avoid in tests?',
   'A seam lets you substitute the file I/O, so the test exercises the real logic.', 4),
  ('01700000-0000-4000-8000-000000000529', '01700000-0000-4000-8000-000000000328',
   'What is the clearest sign the capstone refactor succeeded?',
   'Success means identical behavior, simpler structure, and a green suite.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; exactly one is correct per question.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): clean code
  ('01700000-0000-4000-8000-000000001001', '01700000-0000-4000-8000-000000000501', 'Code that is easy to read and change', TRUE,  1),
  ('01700000-0000-4000-8000-000000001002', '01700000-0000-4000-8000-000000000501', 'Code that executes the fastest way possible', FALSE, 2),
  ('01700000-0000-4000-8000-000000001003', '01700000-0000-4000-8000-000000000501', 'Code with the fewest characters', FALSE, 3),
  ('01700000-0000-4000-8000-000000001004', '01700000-0000-4000-8000-000000000501', 'Code with the most explanatory comments', FALSE, 4),
  -- Q1 (501)q2: intention-revealing
  ('01700000-0000-4000-8000-000000001005', '01700000-0000-4000-8000-000000000502', 'Because short identifiers run faster', FALSE, 1),
  ('01700000-0000-4000-8000-000000001006', '01700000-0000-4000-8000-000000000502', 'So the purpose of the value is clear without extra explanation', TRUE,  2),
  ('01700000-0000-4000-8000-000000001007', '01700000-0000-4000-8000-000000000502', 'Because the compiler requires descriptive names', FALSE, 3),
  ('01700000-0000-4000-8000-000000001008', '01700000-0000-4000-8000-000000000502', 'So every identifier is unique across the codebase', FALSE, 4),
  -- Q1 (501)q3: bad name
  ('01700000-0000-4000-8000-000000001009', '01700000-0000-4000-8000-000000000503', 'customerEmail', FALSE, 1),
  ('01700000-0000-4000-8000-000000001010', '01700000-0000-4000-8000-000000000503', 'daysUntilExpiry', FALSE, 2),
  ('01700000-0000-4000-8000-000000001011', '01700000-0000-4000-8000-000000000503', 'd2', TRUE,  3),
  ('01700000-0000-4000-8000-000000001012', '01700000-0000-4000-8000-000000000503', 'orderTotal', FALSE, 4),
  -- Q2 (504): single responsibility
  ('01700000-0000-4000-8000-000000001013', '01700000-0000-4000-8000-000000000504', 'It does exactly one thing at one level of abstraction', TRUE,  1),
  ('01700000-0000-4000-8000-000000001014', '01700000-0000-4000-8000-000000000504', 'It performs as much work as possible in one call', FALSE, 2),
  ('01700000-0000-4000-8000-000000001015', '01700000-0000-4000-8000-000000000504', 'It changes several global variables', FALSE, 3),
  ('01700000-0000-4000-8000-000000001016', '01700000-0000-4000-8000-000000000504', 'It prints debug output at every step', FALSE, 4),
  -- Q2 (504)q2: clean function sign
  ('01700000-0000-4000-8000-000000001017', '01700000-0000-4000-8000-000000000505', 'It writes several global variables', FALSE, 1),
  ('01700000-0000-4000-8000-000000001018', '01700000-0000-4000-8000-000000000505', 'It is short and performs one obvious task', TRUE,  2),
  ('01700000-0000-4000-8000-000000001019', '01700000-0000-4000-8000-000000000505', 'It contains four levels of nested conditionals', FALSE, 3),
  ('01700000-0000-4000-8000-000000001020', '01700000-0000-4000-8000-000000000505', 'It mixes parsing, validation, and storage', FALSE, 4),
  -- Q2 (504)q3: pure function
  ('01700000-0000-4000-8000-000000001021', '01700000-0000-4000-8000-000000000506', 'It never takes any parameters', FALSE, 1),
  ('01700000-0000-4000-8000-000000001022', '01700000-0000-4000-8000-000000000506', 'It always returns a constant value', FALSE, 2),
  ('01700000-0000-4000-8000-000000001023', '01700000-0000-4000-8000-000000000506', 'Its output depends only on its inputs and it has no side effects', TRUE,  3),
  ('01700000-0000-4000-8000-000000001024', '01700000-0000-4000-8000-000000000506', 'It writes results directly to the database', FALSE, 4),
  -- Q3 (507): good comments
  ('01700000-0000-4000-8000-000000001025', '01700000-0000-4000-8000-000000000507', 'When they explain intent that the code cannot express', TRUE,  1),
  ('01700000-0000-4000-8000-000000001026', '01700000-0000-4000-8000-000000000507', 'When they repeat what the code already states', FALSE, 2),
  ('01700000-0000-4000-8000-000000001027', '01700000-0000-4000-8000-000000000507', 'When they replace descriptive names', FALSE, 3),
  ('01700000-0000-4000-8000-000000001028', '01700000-0000-4000-8000-000000000507', 'When they record every change as a journal', FALSE, 4),
  -- Q3 (507)q2: good comment example
  ('01700000-0000-4000-8000-000000001029', '01700000-0000-4000-8000-000000000508', 'A line that restates the next statement verbatim', FALSE, 1),
  ('01700000-0000-4000-8000-000000001030', '01700000-0000-4000-8000-000000000508', 'A warning that a subtle invariant must hold', TRUE,  2),
  ('01700000-0000-4000-8000-000000001031', '01700000-0000-4000-8000-000000000508', 'A changelog entry inside the function body', FALSE, 3),
  ('01700000-0000-4000-8000-000000001032', '01700000-0000-4000-8000-000000000508', 'A note blaming the previous author', FALSE, 4),
  -- Q3 (507)q3: formatting benefit
  ('01700000-0000-4000-8000-000000001033', '01700000-0000-4000-8000-000000000509', 'It makes the file smaller on disk', FALSE, 1),
  ('01700000-0000-4000-8000-000000001034', '01700000-0000-4000-8000-000000000509', 'It speeds up the compiler', FALSE, 2),
  ('01700000-0000-4000-8000-000000001035', '01700000-0000-4000-8000-000000000509', 'The eye can quickly discriminate structure and group related lines', TRUE,  3),
  ('01700000-0000-4000-8000-000000001036', '01700000-0000-4000-8000-000000000509', 'It removes the need for any formatter', FALSE, 4),
  -- Q4 (510): fail fast
  ('01700000-0000-4000-8000-000000001037', '01700000-0000-4000-8000-000000000510', 'Validate inputs at the boundary and raise an error immediately', TRUE,  1),
  ('01700000-0000-4000-8000-000000001038', '01700000-0000-4000-8000-000000000510', 'Continue as far as possible before reporting problems', FALSE, 2),
  ('01700000-0000-4000-8000-000000001039', '01700000-0000-4000-8000-000000000510', 'Log silently and return empty results', FALSE, 3),
  ('01700000-0000-4000-8000-000000001040', '01700000-0000-4000-8000-000000000510', 'Defer all errors to the end of the month', FALSE, 4),
  -- Q4 (510)q2: exceptions vs return codes
  ('01700000-0000-4000-8000-000000001041', '01700000-0000-4000-8000-000000000511', 'Return codes are slower to evaluate', FALSE, 1),
  ('01700000-0000-4000-8000-000000001042', '01700000-0000-4000-8000-000000000511', 'Success paths stay readable and failures carry context', TRUE,  2),
  ('01700000-0000-4000-8000-000000001043', '01700000-0000-4000-8000-000000000511', 'Exceptions can be safely ignored by the caller', FALSE, 3),
  ('01700000-0000-4000-8000-000000001044', '01700000-0000-4000-8000-000000000511', 'Return codes cannot express success', FALSE, 4),
  -- Q4 (510)q3: guard clause
  ('01700000-0000-4000-8000-000000001045', '01700000-0000-4000-8000-000000000512', 'Add another nesting level for the main logic', FALSE, 1),
  ('01700000-0000-4000-8000-000000001046', '01700000-0000-4000-8000-000000000512', 'Silently swallow invalid input', FALSE, 2),
  ('01700000-0000-4000-8000-000000001047', '01700000-0000-4000-8000-000000000512', 'Exit early when a precondition is not met, keeping the happy path unindented', TRUE,  3),
  ('01700000-0000-4000-8000-000000001048', '01700000-0000-4000-8000-000000000512', 'Duplicate the body of the function', FALSE, 4),
  -- Q5 (513): code smell definition
  ('01700000-0000-4000-8000-000000001049', '01700000-0000-4000-8000-000000000513', 'A structural hint that something may need refactoring', TRUE,  1),
  ('01700000-0000-4000-8000-000000001050', '01700000-0000-4000-8000-000000000513', 'A compile error that must be fixed immediately', FALSE, 2),
  ('01700000-0000-4000-8000-000000001051', '01700000-0000-4000-8000-000000000513', 'A security vulnerability in the runtime', FALSE, 3),
  ('01700000-0000-4000-8000-000000001052', '01700000-0000-4000-8000-000000000513', 'A style rule enforced by the linter', FALSE, 4),
  -- Q5 (513)q2: common smell
  ('01700000-0000-4000-8000-000000001053', '01700000-0000-4000-8000-000000000514', 'Immutable state', FALSE, 1),
  ('01700000-0000-4000-8000-000000001054', '01700000-0000-4000-8000-000000000514', 'Duplicated code', TRUE,  2),
  ('01700000-0000-4000-8000-000000001055', '01700000-0000-4000-8000-000000000514', 'Perfect encapsulation', FALSE, 3),
  ('01700000-0000-4000-8000-000000001056', '01700000-0000-4000-8000-000000000514', 'Empty requirements documents', FALSE, 4),
  -- Q5 (513)q3: why duplication hurts
  ('01700000-0000-4000-8000-000000001057', '01700000-0000-4000-8000-000000000515', 'It makes the tests run faster', FALSE, 1),
  ('01700000-0000-4000-8000-000000001058', '01700000-0000-4000-8000-000000000515', 'It always causes a crash at runtime', FALSE, 2),
  ('01700000-0000-4000-8000-000000001059', '01700000-0000-4000-8000-000000000515', 'A fix must be applied in every copy before behavior drifts', TRUE,  3),
  ('01700000-0000-4000-8000-000000001060', '01700000-0000-4000-8000-000000000515', 'It is impossible to compile', FALSE, 4),
  -- Q6 (516): data clump
  ('01700000-0000-4000-8000-000000001061', '01700000-0000-4000-8000-000000000516', 'A group of fields that always travel together and want to be an object', TRUE,  1),
  ('01700000-0000-4000-8000-000000001062', '01700000-0000-4000-8000-000000000516', 'A database table with too many columns', FALSE, 2),
  ('01700000-0000-4000-8000-000000001063', '01700000-0000-4000-8000-000000000516', 'An array that never changes size', FALSE, 3),
  ('01700000-0000-4000-8000-000000001064', '01700000-0000-4000-8000-000000000516', 'A compression algorithm for logs', FALSE, 4),
  -- Q6 (516)q2: long parameter list
  ('01700000-0000-4000-8000-000000001065', '01700000-0000-4000-8000-000000000517', 'The function uses no parameters at all', FALSE, 1),
  ('01700000-0000-4000-8000-000000001066', '01700000-0000-4000-8000-000000000517', 'The same arguments are passed together from many call sites', TRUE,  2),
  ('01700000-0000-4000-8000-000000001067', '01700000-0000-4000-8000-000000000517', 'The function is declared private', FALSE, 3),
  ('01700000-0000-4000-8000-000000001068', '01700000-0000-4000-8000-000000000517', 'The function returns a boolean', FALSE, 4),
  -- Q6 (516)q3: message chain
  ('01700000-0000-4000-8000-000000001069', '01700000-0000-4000-8000-000000000518', 'A queue of network messages waiting for retry', FALSE, 1),
  ('01700000-0000-4000-8000-000000001070', '01700000-0000-4000-8000-000000000518', 'A list of unhandled runtime errors', FALSE, 2),
  ('01700000-0000-4000-8000-000000001071', '01700000-0000-4000-8000-000000000518', 'Calls that walk through several objects to reach a value', TRUE,  3),
  ('01700000-0000-4000-8000-000000001072', '01700000-0000-4000-8000-000000000518', 'A sequence of commits in version control', FALSE, 4),
  -- Q7 (519): refactoring preserves
  ('01700000-0000-4000-8000-000000001073', '01700000-0000-4000-8000-000000000519', 'The observable behavior of the code', TRUE,  1),
  ('01700000-0000-4000-8000-000000001074', '01700000-0000-4000-8000-000000000519', 'The exact line numbers in the file', FALSE, 2),
  ('01700000-0000-4000-8000-000000001075', '01700000-0000-4000-8000-000000000519', 'The internal implementation of every method', FALSE, 3),
  ('01700000-0000-4000-8000-000000001076', '01700000-0000-4000-8000-000000000519', 'The commit history of the repository', FALSE, 4),
  -- Q7 (519)q2: extract function
  ('01700000-0000-4000-8000-000000001077', '01700000-0000-4000-8000-000000000520', 'Copy a block of code to three new places', FALSE, 1),
  ('01700000-0000-4000-8000-000000001078', '01700000-0000-4000-8000-000000000520', 'Move a cohesive block of code into its own named function', TRUE,  2),
  ('01700000-0000-4000-8000-000000001079', '01700000-0000-4000-8000-000000000520', 'Delete a function and inline every call', FALSE, 3),
  ('01700000-0000-4000-8000-000000001080', '01700000-0000-4000-8000-000000000520', 'Rename a variable using find and replace', FALSE, 4),
  -- Q7 (519)q3: when to refactor
  ('01700000-0000-4000-8000-000000001081', '01700000-0000-4000-8000-000000000521', 'Only during a planned rewrite-everything sprint', FALSE, 1),
  ('01700000-0000-4000-8000-000000001082', '01700000-0000-4000-8000-000000000521', 'Every time the tests fail because of new requirements', FALSE, 2),
  ('01700000-0000-4000-8000-000000001083', '01700000-0000-4000-8000-000000000521', 'Just before adding a feature or fixing a bug in that area', TRUE,  3),
  ('01700000-0000-4000-8000-000000001084', '01700000-0000-4000-8000-000000000521', 'After the deploy pipeline is frozen for a week', FALSE, 4),
  -- Q8 (522): characterization tests
  ('01700000-0000-4000-8000-000000001085', '01700000-0000-4000-8000-000000000522', 'They lock in current behavior so changes can be verified', TRUE,  1),
  ('01700000-0000-4000-8000-000000001086', '01700000-0000-4000-8000-000000000522', 'They replace the need for any future testing', FALSE, 2),
  ('01700000-0000-4000-8000-000000001087', '01700000-0000-4000-8000-000000000522', 'They delete dead code automatically', FALSE, 3),
  ('01700000-0000-4000-8000-000000001088', '01700000-0000-4000-8000-000000000522', 'They describe the intended new feature behavior', FALSE, 4),
  -- Q8 (522)q2: step size
  ('01700000-0000-4000-8000-000000001089', '01700000-0000-4000-8000-000000000523', 'One giant rewrite shipped in a single commit', FALSE, 1),
  ('01700000-0000-4000-8000-000000001090', '01700000-0000-4000-8000-000000000523', 'Small changes with a test run after each one', TRUE,  2),
  ('01700000-0000-4000-8000-000000001091', '01700000-0000-4000-8000-000000000523', 'Only renaming identifiers, never moving code', FALSE, 3),
  ('01700000-0000-4000-8000-000000001092', '01700000-0000-4000-8000-000000000523', 'Refactor everything first and write tests afterwards', FALSE, 4),
  -- Q8 (522)q3: red green refactor
  ('01700000-0000-4000-8000-000000001093', '01700000-0000-4000-8000-000000000524', 'Ship a feature, then label the release red', FALSE, 1),
  ('01700000-0000-4000-8000-000000001094', '01700000-0000-4000-8000-000000000524', 'Run lint, review, and deploy in that order', FALSE, 2),
  ('01700000-0000-4000-8000-000000001095', '01700000-0000-4000-8000-000000000524', 'Write a failing test, make it pass, then improve the design', TRUE,  3),
  ('01700000-0000-4000-8000-000000001096', '01700000-0000-4000-8000-000000000524', 'Deploy at the end of the week and fix red alerts', FALSE, 4),
  -- Q9 (525): review first check
  ('01700000-0000-4000-8000-000000001097', '01700000-0000-4000-8000-000000000525', 'Whether the change does the right thing for the right reason', TRUE,  1),
  ('01700000-0000-4000-8000-000000001098', '01700000-0000-4000-8000-000000000525', 'Whether the author used the team logo correctly', FALSE, 2),
  ('01700000-0000-4000-8000-000000001099', '01700000-0000-4000-8000-000000000525', 'Whether every file was touched at least once', FALSE, 3),
  ('01700000-0000-4000-8000-000000001100', '01700000-0000-4000-8000-000000000525', 'Whether the build number was incremented', FALSE, 4),
  -- Q9 (525)q2: reviewer feedback
  ('01700000-0000-4000-8000-000000001101', '01700000-0000-4000-8000-000000000526', 'Close the PR and resubmit under a new number', FALSE, 1),
  ('01700000-0000-4000-8000-000000001102', '01700000-0000-4000-8000-000000000526', 'Ask clarifying questions and consider the perspective', TRUE,  2),
  ('01700000-0000-4000-8000-000000001103', '01700000-0000-4000-8000-000000000526', 'Reject all feedback and merge anyway', FALSE, 3),
  ('01700000-0000-4000-8000-000000001104', '01700000-0000-4000-8000-000000000526', 'Rewrite the whole feature before replying', FALSE, 4),
  -- Q9 (525)q3: safest first step
  ('01700000-0000-4000-8000-000000001105', '01700000-0000-4000-8000-000000000527', 'Rewrite the entire function from scratch without tests', FALSE, 1),
  ('01700000-0000-4000-8000-000000001106', '01700000-0000-4000-8000-000000000527', 'Add more comments inside the loops to clarify them', FALSE, 2),
  ('01700000-0000-4000-8000-000000001107', '01700000-0000-4000-8000-000000000527', 'Extract cohesive blocks into small named functions one at a time, running tests after each', TRUE,  3),
  ('01700000-0000-4000-8000-000000001108', '01700000-0000-4000-8000-000000000527', 'Replace every magic number in one untested commit', FALSE, 4),
  -- Q9 (525)q4: seam technique
  ('01700000-0000-4000-8000-000000001109', '01700000-0000-4000-8000-000000000528', 'Make the test delete the file it reads', FALSE, 1),
  ('01700000-0000-4000-8000-000000001110', '01700000-0000-4000-8000-000000000528', 'Skip that test permanently', FALSE, 2),
  ('01700000-0000-4000-8000-000000001111', '01700000-0000-4000-8000-000000000528', 'Run the test only on Fridays', FALSE, 3),
  ('01700000-0000-4000-8000-000000001112', '01700000-0000-4000-8000-000000000528', 'Introduce a seam so the dependency can be faked', TRUE,  4),
  -- Q9 (525)q5: success sign
  ('01700000-0000-4000-8000-000000001113', '01700000-0000-4000-8000-000000000529', 'The file grew longer with more comments', FALSE, 1),
  ('01700000-0000-4000-8000-000000001114', '01700000-0000-4000-8000-000000000529', 'The function count dropped to one giant method', FALSE, 2),
  ('01700000-0000-4000-8000-000000001115', '01700000-0000-4000-8000-000000000529', 'No tests were changed or added', FALSE, 3),
  ('01700000-0000-4000-8000-000000001116', '01700000-0000-4000-8000-000000000529', 'The same behavior, lower complexity, and tests that all pass', TRUE,  4)
ON CONFLICT (id) DO NOTHING;
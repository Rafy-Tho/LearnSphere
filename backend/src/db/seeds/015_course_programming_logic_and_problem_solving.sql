-- ============================================================================
-- SEED 015: Complete course — "Programming Logic & Problem Solving"
-- ----------------------------------------------------------------------------
-- Instructor : Marcus Johnson      (10000000-0000-4000-8000-000000000002)
-- Category   : Programming Fundamentals (20000000-0000-4000-8000-000000000002)
-- Level      : BEGINNER · Access : FREE · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Problem-Solving Foundations → C1 What Is an Algorithm? · C2 Decomposition & Flowcharts
--   M2 Core Programming Concepts   → C3 Variables & Data · C4 Conditionals & Decisions
--   M3 Repetition & Abstraction    → C5 Loops & Iteration · C6 Functions & Abstraction
--   M4 Data & Debugging            → C7 Arrays & Working with Data · C8 Debugging & Testing
--   M5 Capstone: Number Guessing   → C9 Project Setup · C10 Building & Refining
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
  '0F000000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000002',
  '20000000-0000-4000-8000-000000000002',
  'Programming Logic & Problem Solving',
  'programming-logic-and-problem-solving',
  'Learn to think like a programmer. Master algorithmic thinking, decomposition, flowcharts, variables, conditionals, loops, functions, arrays, and debugging — then build a number guessing game that proves your problem-solving skills.',
  'PUBLISHED',
  'BEGINNER',
  'FREE',
  13
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('0F000000-0000-4000-8000-000000000011', '0F000000-0000-4000-8000-000000000001', 'Define algorithms and pseudocode, and evaluate whether steps are precise, ordered, and finite.',             1),
  ('0F000000-0000-4000-8000-000000000012', '0F000000-0000-4000-8000-000000000001', 'Break large problems into smaller pieces and visualize decisions with flowcharts.',                           2),
  ('0F000000-0000-4000-8000-000000000013', '0F000000-0000-4000-8000-000000000001', 'Store and transform data with variables, conditionals, and boolean logic.',                                      3),
  ('0F000000-0000-4000-8000-000000000014', '0F000000-0000-4000-8000-000000000001', 'Repeat work with loops and package reusable logic into functions.',                                                4),
  ('0F000000-0000-4000-8000-000000000015', '0F000000-0000-4000-8000-000000000001', 'Work with arrays and apply debugging and testing strategies to build a complete capstone program.',                5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('0F000000-0000-4000-8000-000000000101', '0F000000-0000-4000-8000-000000000001', 1, 'Problem-Solving Foundations', 'Learn what algorithms are, write pseudocode, decompose problems, and draw flowcharts.',     'PUBLISHED'),
  ('0F000000-0000-4000-8000-000000000102', '0F000000-0000-4000-8000-000000000001', 2, 'Core Programming Concepts',   'Store data in named variables and make decisions with conditionals and boolean logic.',       'PUBLISHED'),
  ('0F000000-0000-4000-8000-000000000103', '0F000000-0000-4000-8000-000000000001', 3, 'Repetition & Abstraction',    'Repeat work with loops and package reusable logic into functions.',                             'PUBLISHED'),
  ('0F000000-0000-4000-8000-000000000104', '0F000000-0000-4000-8000-000000000001', 4, 'Data & Debugging',            'Work with arrays and apply systematic debugging and testing strategies.',                      'PUBLISHED'),
  ('0F000000-0000-4000-8000-000000000105', '0F000000-0000-4000-8000-000000000001', 5, 'Capstone: Number Guessing',   'Plan, build, and refine a complete number guessing game that applies every module.',           'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('0F000000-0000-4000-8000-000000000201', '0F000000-0000-4000-8000-000000000101', 1, 'What Is an Algorithm?',        'The building blocks of computational thinking.',               'PUBLISHED'),
  ('0F000000-0000-4000-8000-000000000202', '0F000000-0000-4000-8000-000000000101', 2, 'Decomposition & Flowcharts',    'Break big problems into pieces and visualize decisions.',       'PUBLISHED'),
  ('0F000000-0000-4000-8000-000000000203', '0F000000-0000-4000-8000-000000000102', 1, 'Variables & Data',              'Store and name data inside your programs.',                     'PUBLISHED'),
  ('0F000000-0000-4000-8000-000000000204', '0F000000-0000-4000-8000-000000000102', 2, 'Conditionals & Decisions',      'Make programs choose between different paths.',                 'PUBLISHED'),
  ('0F000000-0000-4000-8000-000000000205', '0F000000-0000-4000-8000-000000000103', 1, 'Loops & Iteration',             'Repeat work efficiently without rewriting code.',               'PUBLISHED'),
  ('0F000000-0000-4000-8000-000000000206', '0F000000-0000-4000-8000-000000000103', 2, 'Functions & Abstraction',       'Package behavior into named, reusable blocks.',                 'PUBLISHED'),
  ('0F000000-0000-4000-8000-000000000207', '0F000000-0000-4000-8000-000000000104', 1, 'Arrays & Working with Data',    'Hold ordered collections of values and process them.',          'PUBLISHED'),
  ('0F000000-0000-4000-8000-000000000208', '0F000000-0000-4000-8000-000000000104', 2, 'Debugging & Testing',           'Find and fix errors systematically.',                            'PUBLISHED'),
  ('0F000000-0000-4000-8000-000000000209', '0F000000-0000-4000-8000-000000000105', 1, 'Project Setup',                 'Plan the capstone before writing a line of code.',              'PUBLISHED'),
  ('0F000000-0000-4000-8000-000000000210', '0F000000-0000-4000-8000-000000000105', 2, 'Building & Refining',           'Assemble, test, and extend the capstone game.',                 'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 0F000000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('0F000000-0000-4000-8000-000000000301', '0F000000-0000-4000-8000-000000000201', 1, 'What Is an Algorithm?',                   'Define algorithms and learn why precise, ordered steps matter.',  'TEXT',  'PUBLISHED', 'FREE', 10,  5),
  ('0F000000-0000-4000-8000-000000000302', '0F000000-0000-4000-8000-000000000201', 2, 'Writing Steps & Pseudocode',              'Turn plain-English recipes into structured pseudocode.',          'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('0F000000-0000-4000-8000-000000000303', '0F000000-0000-4000-8000-000000000201', 3, 'Problem-Solving Basics Quiz',             'Check your grasp of algorithms and pseudocode.',                   'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('0F000000-0000-4000-8000-000000000304', '0F000000-0000-4000-8000-000000000202', 1, 'Decomposition: Divide & Conquer',         'Split large problems into smaller, solvable pieces.',              'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('0F000000-0000-4000-8000-000000000305', '0F000000-0000-4000-8000-000000000202', 2, 'Flowcharts: Visualizing Logic',           'Map decisions and flow with standard flowchart symbols.',           'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('0F000000-0000-4000-8000-000000000306', '0F000000-0000-4000-8000-000000000202', 3, 'Decomposition & Flowcharts Quiz',         'Test your decomposition and flowchart skills.',                    'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('0F000000-0000-4000-8000-000000000307', '0F000000-0000-4000-8000-000000000203', 1, 'Variables: Naming & Storing Data',        'Store values in named boxes you can reuse.',                       'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('0F000000-0000-4000-8000-000000000308', '0F000000-0000-4000-8000-000000000203', 2, 'Data Types & Reading User Input',         'Work with numbers, text, and booleans from the user.',             'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('0F000000-0000-4000-8000-000000000309', '0F000000-0000-4000-8000-000000000203', 3, 'Variables & Data Quiz',                   'Check your variables and data types knowledge.',                   'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('0F000000-0000-4000-8000-000000000310', '0F000000-0000-4000-8000-000000000204', 1, 'Making Decisions with if/else',           'Branch your program on one or more conditions.',                   'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('0F000000-0000-4000-8000-000000000311', '0F000000-0000-4000-8000-000000000204', 2, 'Comparisons & Boolean Logic',             'Combine conditions with comparisons and and/or/not.',              'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('0F000000-0000-4000-8000-000000000312', '0F000000-0000-4000-8000-000000000204', 3, 'Conditionals & Decisions Quiz',           'Test conditionals and boolean logic.',                              'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('0F000000-0000-4000-8000-000000000313', '0F000000-0000-4000-8000-000000000205', 1, 'Loops: Repeating Work',                   'Repeat a block while a condition holds.',                          'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('0F000000-0000-4000-8000-000000000314', '0F000000-0000-4000-8000-000000000205', 2, 'Loop Patterns That Solve Problems',       'Accumulate, search, validate, and count with loops.',              'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('0F000000-0000-4000-8000-000000000315', '0F000000-0000-4000-8000-000000000205', 3, 'Loops & Iteration Quiz',                  'Test loops and loop patterns.',                                    'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('0F000000-0000-4000-8000-000000000316', '0F000000-0000-4000-8000-000000000206', 1, 'Functions: Reusable Logic',               'Package behavior into named, reusable functions.',                 'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('0F000000-0000-4000-8000-000000000317', '0F000000-0000-4000-8000-000000000206', 2, 'Parameters, Return Values & Scope',       'Pass data in, return results out, keep names local.',              'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('0F000000-0000-4000-8000-000000000318', '0F000000-0000-4000-8000-000000000206', 3, 'Functions & Abstraction Quiz',            'Test functions, parameters, and scope.',                           'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('0F000000-0000-4000-8000-000000000319', '0F000000-0000-4000-8000-000000000207', 1, 'Arrays: Ordered Collections',             'Store lists of values and index into them.',                       'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('0F000000-0000-4000-8000-000000000320', '0F000000-0000-4000-8000-000000000207', 2, 'Processing Data with Arrays',             'Sum, search, find extremes, and transform lists.',                 'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('0F000000-0000-4000-8000-000000000321', '0F000000-0000-4000-8000-000000000207', 3, 'Arrays & Data Quiz',                      'Test arrays and data processing.',                                 'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('0F000000-0000-4000-8000-000000000322', '0F000000-0000-4000-8000-000000000208', 1, 'Debugging Strategies',                    'Track down bugs with prints, tracing, and divide and conquer.',    'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('0F000000-0000-4000-8000-000000000323', '0F000000-0000-4000-8000-000000000208', 2, 'Testing & Tracing Your Logic',            'Write test cases and trace tables for edge cases.',                'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('0F000000-0000-4000-8000-000000000324', '0F000000-0000-4000-8000-000000000208', 3, 'Debugging & Testing Quiz',                'Test debugging and testing strategies.',                           'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('0F000000-0000-4000-8000-000000000325', '0F000000-0000-4000-8000-000000000209', 1, 'Capstone: Planning the Number Guessing Game', 'Plan the game requirements and pseudocode before coding.',         'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('0F000000-0000-4000-8000-000000000326', '0F000000-0000-4000-8000-000000000210', 1, 'Capstone: Building the Program',         'Turn the plan into a working, structured program.',                'TEXT',  'PUBLISHED', 'FREE', 10, 11),
  ('0F000000-0000-4000-8000-000000000327', '0F000000-0000-4000-8000-000000000210', 2, 'Capstone: Refining & Extending the Game', 'Add validation, replay, and polish to the game.',                   'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('0F000000-0000-4000-8000-000000000328', '0F000000-0000-4000-8000-000000000210', 3, 'Final Assessment',                       'Prove what you learned across the whole course.',                  'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 0F000000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '0F000000-0000-4000-8000-000000000401',
  '0F000000-0000-4000-8000-000000000301',
  1,
  'What Is an Algorithm?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What Is an Algorithm?</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>What Is an Algorithm?</h1>
  <p>An <strong>algorithm</strong> is a finite sequence of precise steps that solves a problem or performs a task. You already use them every day: a recipe, a driving route, an instruction manual — each is an algorithm written for humans. Programming is, at its core, the art of writing algorithms that a computer can follow exactly.</p>
  <h2>Five properties of every algorithm</h2>
  <table>
    <tr><th>Property</th><th>Meaning</th><th>Bad example</th></tr>
    <tr><td>Finite</td><td>It ends after a limited number of steps</td><td>Keep warming up forever</td></tr>
    <tr><td>Precise</td><td>Each step has exactly one meaning</td><td>Add a little water</td></tr>
    <tr><td>Ordered</td><td>Steps run in a defined sequence</td><td>Serve the cake first, bake it later</td></tr>
    <tr><td>Effective</td><td>Every step is simple enough to do</td><td>Compute the answer at the speed of light</td></tr>
    <tr><td>Output</td><td>It produces a useful result</td><td>Do something and stop</td></tr>
  </table>
  <h2>From recipe to program</h2>
  <p>Order matters. Reversing two steps of a cake recipe ruins the cake; doing the same in code breaks the program. Consider computing the average of two numbers:</p>
  <pre class="code-block">INPUT first
INPUT second
SET sum = first + second
OUTPUT sum / 2</pre>
  <p>The example is tiny, but the skeleton is exactly how real programs behave: read data, <em>process</em> it, then produce output.</p>
  <div class="callout callout-tip">
    <strong>Try it now</strong>
    <p>Write the steps to make your favorite sandwich as a numbered list. Then ask a friend to follow it literally — nothing more. The gaps you discover are the exact gaps between a human task and an algorithm.</p>
  </div>
  <div class="callout callout-info">
    <strong>Language-agnostic</strong>
    <p>An algorithm is the idea; Python, JavaScript, and Java are different ways to express it. Reasoning about the steps first makes you a stronger programmer in every language.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Computers are literal</strong>
    <p>A computer executes exactly what you write, nothing more. When a program misbehaves, the mistake is almost always in the algorithm — not in the machine.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0F000000-0000-4000-8000-000000000402',
  '0F000000-0000-4000-8000-000000000302',
  1,
  'Writing Steps & Pseudocode',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Writing Steps &amp; Pseudocode</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Writing Steps &amp; Pseudocode</h1>
  <p>Before you write code, you write <strong>pseudocode</strong>: a half-English, half-structured description of your algorithm. Pseudocode has no compiler and no syntax errors — it exists only to get the logic right before fixing it becomes expensive.</p>
  <h2>A recipe, made precise</h2>
  <p>Humans survive vague instructions; computers do not. Compare:</p>
  <pre class="code-block">Vague:   Add some sugar. Stir it. Wait. Serve.
Precise: ADD 2 teaspoons of sugar
         STIR for 30 seconds
         WAIT 5 minutes
         POUR into a cup and SERVE</pre>
  <h2>Useful pseudocode keywords</h2>
  <table>
    <tr><th>Keyword</th><th>What it means</th></tr>
    <tr><td>INPUT / READ</td><td>Get a value from the user</td></tr>
    <tr><td>OUTPUT / PRINT</td><td>Show a value</td></tr>
    <tr><td>SET name = value</td><td>Store a value in a variable</td></tr>
    <tr><td>IF condition THEN ...</td><td>Choose one path</td></tr>
    <tr><td>WHILE condition</td><td>Repeat while true</td></tr>
    <tr><td>FOR each item</td><td>Repeat for each item</td></tr>
    <tr><td>FUNCTION name(...)</td><td>Package reusable steps</td></tr>
  </table>
  <h2>Number the steps</h2>
  <p>When steps are numbered and indented, structure becomes visible and mistakes are easier to spot:</p>
  <pre class="code-block">1. IF the total bill is more than 50 THEN
2.    apply a 10 percent discount
3. ELSE
4.    keep the original price
5. END IF
6. OUTPUT the final price</pre>
  <div class="callout callout-tip">
    <strong>Action verbs only</strong>
    <p>Write each line as a command: "calculate", "compare", "store", "print". If a line has no verb, it is probably not a step.</p>
  </div>
  <div class="callout callout-info">
    <strong>Not a language</strong>
    <p>There is no "correct" pseudocode dialect. The goal is a description any programmer can translate into real code within minutes.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0F000000-0000-4000-8000-000000000404',
  '0F000000-0000-4000-8000-000000000304',
  1,
  'Decomposition: Divide & Conquer',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Decomposition: Divide &amp; Conquer</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Decomposition: Divide &amp; Conquer</h1>
  <p><strong>Decomposition</strong> is breaking a large problem into smaller pieces that are each simple enough to solve on their own. It is the most important habit in programming: big problems feel impossible; small problems do not.</p>
  <h2>Why it works</h2>
  <ul>
    <li>Small pieces are easier to understand and get right the first time.</li>
    <li>Each piece can be tested in isolation.</li>
    <li>Pieces can be reused in other programs.</li>
    <li>Different people can work on different pieces at once.</li>
  </ul>
  <h2>Example: report a letter grade</h2>
  <p>A task like "report a letter grade" sounds vague. Decompose it:</p>
  <pre class="code-block">1. READ the three exam scores
2. CALCULATE the average
3. CONVERT the average to a letter grade
4. OUTPUT the letter grade</pre>
  <p>Step 3 is still too big. Break it further:</p>
  <pre class="code-block">3.1 IF average is 90 or above THEN grade = A
3.2 ELSE IF average is 80 or above THEN grade = B
3.3 ELSE IF average is 70 or above THEN grade = C
3.4 ELSE grade = F
3.5 END IF</pre>
  <h2>Keep going until it is trivial</h2>
  <p>A good rule: keep splitting until every sub-step is one line a beginner could type without thinking. You now have two levels: the top-level plan and a detailed expansion only where it is needed.</p>
  <div class="callout callout-tip">
    <strong>Practice</strong>
    <p>Decompose "plan a birthday party" into four or five sub-tasks, then expand one of them into three or four sub-steps. Notice that some sub-tasks expand easily and others need another level — that is exactly how real projects are planned.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Top-down refinement</strong>
    <p>Start with a one-line goal. Expand it into a few bullet points. Expand each bullet that still feels hard. Stop when the leaves are obvious.</p>
  </div>
  <div class="callout callout-info">
    <strong>Functions will make this permanent</strong>
    <p>Each decomposed piece becomes a named function in later modules. Decomposition is not just planning — it is a blueprint for real code.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0F000000-0000-4000-8000-000000000405',
  '0F000000-0000-4000-8000-000000000305',
  1,
  'Flowcharts: Visualizing Logic',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Flowcharts: Visualizing Logic</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Flowcharts: Visualizing Logic</h1>
  <p>A <strong>flowchart</strong> is a diagram of your algorithm. Boxes and arrows show the flow of control, making decisions and order visible at a glance. Flowcharts and pseudocode are two views of the same logic: draw the diagram to see the shape, then write the steps.</p>
  <h2>Standard symbols</h2>
  <table>
    <tr><th>Symbol</th><th>Name</th><th>Use it for</th></tr>
    <tr><td>Oval</td><td>Terminator</td><td>Start and end of the program</td></tr>
    <tr><td>Parallelogram</td><td>Input / output</td><td>Reading data or printing it</td></tr>
    <tr><td>Rectangle</td><td>Process</td><td>A calculation or assignment</td></tr>
    <tr><td>Diamond</td><td>Decision</td><td>A yes/no question with two exits</td></tr>
    <tr><td>Arrow</td><td>Flow line</td><td>Direction of execution</td></tr>
  </table>
  <h2>Reading a flowchart</h2>
  <p>Start at the terminator. Follow arrows. Every diamond forks into two paths — a YES path and a NO path — and both eventually rejoin. Here is the logic of a temperature check in pseudocode, which is exactly what the flowchart would draw:</p>
  <pre class="code-block">START
READ temperature
IF temperature is below 18 THEN
    PRINT "It is cold"
ELSE
    PRINT "It is warm"
END IF
STOP</pre>
  <h2>Why bother drawing?</h2>
  <ul>
    <li>You notice missing branches ("what if the temperature is exactly 18?").</li>
    <li>You see infinite loops before they freeze the computer.</li>
    <li>You can explain a design to a teammate without sharing code.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>One question per diamond</strong>
    <p>A diamond should hold a single yes/no question. Two questions per diamond force four messy exits; two diamonds stay readable.</p>
  </div>
  <div class="callout callout-info">
    <strong>Loops are arrows that go back</strong>
    <p>A loop in a flowchart is simply an arrow that points from a decision back up to an earlier box — that is the shape of repetition.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Translate both ways</strong>
    <p>Draw the flowchart for the temperature example above, then translate the diagram back into pseudocode. Being fluent in both directions makes you flexible: diagrams to design, steps to type.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0F000000-0000-4000-8000-000000000407',
  '0F000000-0000-4000-8000-000000000307',
  1,
  'Variables: Naming & Storing Data',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Variables: Naming &amp; Storing Data</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Variables: Naming &amp; Storing Data</h1>
  <p>A <strong>variable</strong> is a named box in memory that holds a value your program can read and change. Instead of re-typing a value everywhere, you store it once under a meaningful name and refer to the name.</p>
  <pre class="code-block">score = 0             # store zero in a box named score
score = score + 10    # read it, add 10, store the result back
print(score)          # 10</pre>
  <p>The right side is evaluated first: the computer reads the current value of <span class="ic">score</span>, adds 10, then stores the new value into the same box. That is why <span class="ic">score = score + 10</span> works.</p>
  <h2>Naming rules</h2>
  <ul>
    <li>Use descriptive names: <span class="ic">student_grade</span> not <span class="ic">g</span>.</li>
    <li>Use lowercase words joined by underscores: <span class="ic">number_of_guesses</span>.</li>
    <li>Start with a letter or underscore, never a digit.</li>
    <li>No spaces, no hyphens, and no reserved words like <span class="ic">if</span> or <span class="ic">for</span>.</li>
  </ul>
  <table>
    <tr><th>Good name</th><th>Why</th></tr>
    <tr><td>total_price</td><td>Describes its content</td></tr>
    <tr><td>player_name</td><td>The reader understands instantly</td></tr>
    <tr><td>max_attempts</td><td>Names intended values clearly</td></tr>
  </table>
  <div class="callout">
    <strong>= means assignment, not equality</strong>
    <p>In most beginner languages, one equals sign hands a value to a variable. Two equals signs ask a question. Mixing them is one of the most common beginner bugs.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Constants</strong>
    <p>Values that never change get a name too, often written in capitals: <span class="ic">MAX_SCORE = 100</span>. A name explains a number better than the number itself.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0F000000-0000-4000-8000-000000000408',
  '0F000000-0000-4000-8000-000000000308',
  1,
  'Data Types & Reading User Input',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Data Types &amp; Reading User Input</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Data Types &amp; Reading User Input</h1>
  <p>Values in memory have <strong>types</strong> — the computer must know whether a value is a number to add, text to join, or a truth value to test.</p>
  <h2>The core types</h2>
  <table>
    <tr><th>Type</th><th>Example</th><th>Notes</th></tr>
    <tr><td>integer</td><td>42</td><td>Whole numbers</td></tr>
    <tr><td>float</td><td>3.14</td><td>Numbers with a decimal part</td></tr>
    <tr><td>string</td><td>"hello"</td><td>Text, stored between quotes</td></tr>
    <tr><td>boolean</td><td>True / False</td><td>Exactly two values</td></tr>
  </table>
  <h2>Reading input</h2>
  <p>Programs become useful when users supply data. Reading input usually returns <strong>text</strong>, so you convert it before arithmetic:</p>
  <pre class="code-block">age_text = input("Enter your age: ")
age = int(age_text)
print("Next year you will be", age + 1)</pre>
  <p><span class="ic">int()</span> and <span class="ic">float()</span> convert text to numbers; <span class="ic">str()</span> converts back for display. Without the conversion, <span class="ic">"25" + 1</span> would fail because you cannot add text and a number.</p>
  <div class="callout">
    <strong>Conversion errors</strong>
    <p>If the user types "abc", <span class="ic">int("abc")</span> fails at runtime. Real-world programs catch that failure and ask again — you will build that pattern in the capstone.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Clean your text</strong>
    <p>Trim stray spaces before converting. A leading space makes " 25" behave differently from "25" when compared or stored.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0F000000-0000-4000-8000-000000000410',
  '0F000000-0000-4000-8000-000000000310',
  1,
  'Making Decisions with if/else',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Making Decisions with if/else</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Making Decisions with if/else</h1>
  <p><strong>Conditionals</strong> let a program choose between paths. The pattern is always the same: test a true/false condition, then run one block or another.</p>
  <pre class="code-block">if score &gt;= 60:
    print("Passed")
else:
    print("Failed")</pre>
  <h2>The if/else ladder</h2>
  <p>When more than two outcomes exist, chain branches. The first condition that is true wins; the rest are skipped:</p>
  <pre class="code-block">if score &gt;= 90:
    grade = "A"
elif score &gt;= 80:
    grade = "B"
elif score &gt;= 70:
    grade = "C"
else:
    grade = "F"
print("Grade:", grade)</pre>
  <table>
    <tr><th>Case</th><th>score</th><th>grade</th></tr>
    <tr><td>Tests the A branch</td><td>95</td><td>A</td></tr>
    <tr><td>Tests the B branch</td><td>85</td><td>B</td></tr>
    <tr><td>Boundary: exactly 90</td><td>90</td><td>A</td></tr>
    <tr><td>Boundary: exactly 69</td><td>69</td><td>F</td></tr>
  </table>
  <p>Walking the ladder with a few hand-picked values — including both boundary scores — confirms the branches are ordered correctly.</p>
  <div class="callout">
    <strong>Order matters</strong>
    <p>Check the broad rule last and specific rules first. If you tested <span class="ic">score &gt;= 70</span> before <span class="ic">score &gt;= 90</span>, nobody would ever receive an A.</p>
  </div>
  <h2>Nesting</h2>
  <p>Sometimes one decision depends on another:</p>
  <pre class="code-block">if delivery == "express":
    if urgent_customer:
        print("Ship today")
    else:
        print("Ship tomorrow")</pre>
  <p>Nesting works, but deep nesting gets hard to read. Whenever a branch contains another conditional, ask whether a ladder or a helper function would be clearer.</p>
  <div class="callout callout-tip">
    <strong>Draw it first</strong>
    <p>The decision diamond in a flowchart maps directly to <span class="ic">if</span>. Sketch the diamond, name both exits, then write the code. The code writes itself after that.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0F000000-0000-4000-8000-000000000411',
  '0F000000-0000-4000-8000-000000000311',
  1,
  'Comparisons & Boolean Logic',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Comparisons &amp; Boolean Logic</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Comparisons &amp; Boolean Logic</h1>
  <p>A single condition captures little of the real world. Combine and negate conditions with <strong>boolean logic</strong> — the math of true and false.</p>
  <h2>Comparison operators</h2>
  <table>
    <tr><th>Operator</th><th>Meaning</th><th>True example</th></tr>
    <tr><td>==</td><td>equal to</td><td>5 == 5</td></tr>
    <tr><td>!=</td><td>not equal to</td><td>5 != 6</td></tr>
    <tr><td>&lt;</td><td>less than</td><td>3 &lt; 8</td></tr>
    <tr><td>&lt;=</td><td>less than or equal</td><td>8 &lt;= 8</td></tr>
    <tr><td>&gt;</td><td>greater than</td><td>9 &gt; 2</td></tr>
    <tr><td>&gt;=</td><td>greater than or equal</td><td>9 &gt;= 9</td></tr>
  </table>
  <h2>and / or / not</h2>
  <p><span class="ic">and</span> is true only when both sides are true. <span class="ic">or</span> is true when at least one side is true. <span class="ic">not</span> flips a single value.</p>
  <table>
    <tr><th>A</th><th>B</th><th>A and B</th><th>A or B</th></tr>
    <tr><td>True</td><td>True</td><td>True</td><td>True</td></tr>
    <tr><td>True</td><td>False</td><td>False</td><td>True</td></tr>
    <tr><td>False</td><td>True</td><td>False</td><td>True</td></tr>
    <tr><td>False</td><td>False</td><td>False</td><td>False</td></tr>
  </table>
  <pre class="code-block">if age &gt;= 18 and has_ticket:
    print("Welcome in")
if not blocked:
    print("Account available")</pre>
  <div class="callout">
    <strong>The single equals bug</strong>
    <p>Writing <span class="ic">if score = 5</span> assigns instead of comparing. One equals sign stores; two equals signs test. Read your code twice with that in mind.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Check the boundaries</strong>
    <p>Decide whether the value 18 belongs inside or outside the rule. Use <span class="ic">&gt;=</span> to include it, <span class="ic">&gt;</span> to exclude it. Testing the exact boundary value is the fastest way to verify.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0F000000-0000-4000-8000-000000000413',
  '0F000000-0000-4000-8000-000000000313',
  1,
  'Loops: Repeating Work',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Loops: Repeating Work</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Loops: Repeating Work</h1>
  <p>A <strong>loop</strong> repeats a block of code. Computers never get bored, so repetition shifts from the programmer to the machine. Two families cover almost everything: <span class="ic">while</span> loops for "repeat until a condition fails" and <span class="ic">for</span> loops for "repeat a known number of times".</p>
  <pre class="code-block"># while — repeat while true
energy = 100
while energy &gt; 0:
    print("Running, energy:", energy)
    energy = energy - 25

# for — fixed number of times
for day in range(1, 4):
    print("Day", day)</pre>
  <p>Loops can also sit inside other loops. The inner loop completes fully for every single run of the outer loop:</p>
  <pre class="code-block">for row in range(1, 4):
    for column in range(1, 3):
        print(row, column)</pre>
  <p>Count the output lines: three rows times two columns equals six lines. Nested loops are the engine behind grid-based programs and timetable problems.</p>
  <h2>The three parts of a counting loop</h2>
  <ul>
    <li><strong>Initialize</strong> — set the counter before the loop.</li>
    <li><strong>Test</strong> — the condition checked before each run.</li>
    <li><strong>Update</strong> — change the counter so the test eventually fails.</li>
  </ul>
  <p>Miss the update and the test never fails — the program loops forever.</p>
  <h2>Which loop to choose?</h2>
  <table>
    <tr><th>Situation</th><th>Best loop</th></tr>
    <tr><td>I know the count in advance</td><td>for over a range or list</td></tr>
    <tr><td>Repeat until the user quits</td><td>while</td></tr>
    <tr><td>Repeat until a valid value arrives</td><td>while with a flag</td></tr>
    <tr><td>Process each item of an array</td><td>for each item</td></tr>
  </table>
  <div class="callout">
    <strong>Infinite loops</strong>
    <p>If a program freezes or floods output, suspect a loop whose condition can never become false. Add a print of the counter while debugging to watch it move — or fail to move.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Read loops aloud</strong>
    <p>"While the guess is wrong, ask again." Loops read like sentences and write themselves the same way: start from the sentence, not from the keyboard.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0F000000-0000-4000-8000-000000000414',
  '0F000000-0000-4000-8000-000000000314',
  1,
  'Loop Patterns That Solve Problems',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Loop Patterns That Solve Problems</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Loop Patterns That Solve Problems</h1>
  <p>A handful of loop patterns solves most real problems. Learn the shape, and you can fill in the details on demand.</p>
  <h2>Accumulate: sums and totals</h2>
  <pre class="code-block">total = 0
for price in prices:
    total = total + price</pre>
  <h2>Search: find the first match</h2>
  <pre class="code-block">found = None
for item in stock:
    if item == target_item:
        found = item
        break
if found is None:
    print("Not in stock")</pre>
  <p><span class="ic">break</span> exits the loop immediately; the variable <span class="ic">found</span> tells you whether a match existed.</p>
  <h2>Validate: repeat until input is good</h2>
  <pre class="code-block">guess = None
while guess is None:
    raw = input("Guess 1 to 100: ")
    guess = try_parse(raw)   # returns None when invalid
print("Accepted:", guess)</pre>
  <h2>Count: tally the matches</h2>
  <pre class="code-block">passed = 0
for score in scores:
    if score &gt;= 60:
        passed = passed + 1</pre>
  <div class="callout callout-tip">
    <strong>Name the exit condition</strong>
    <p>Before writing the loop, say the exit out loud: "stop when the user enters a valid number". Then your condition is the opposite: keep going while the input is invalid.</p>
  </div>
  <div class="callout callout-info">
    <strong>Sentinel values</strong>
    <p>A sentinel is a special value that ends a loop, like an empty string meaning "I am done". It is the classic pattern for menus and data entry screens.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0F000000-0000-4000-8000-000000000416',
  '0F000000-0000-4000-8000-000000000316',
  1,
  'Functions: Reusable Logic',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Functions: Reusable Logic</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Functions: Reusable Logic</h1>
  <p>A <strong>function</strong> is a named block of steps you can run whenever you need it. Every call behaves like running that algorithm again, with its own input.</p>
  <pre class="code-block">def midpoint(a, b):
    return (a + b) / 2

mid = midpoint(10, 20)
print(mid)   # 15.0</pre>
  <p>Define a function once with <span class="ic">def</span>, then call it by name as many times as you like. The program pauses, runs the function steps, and hands back the result where the call appeared.</p>
  <h2>Why functions matter</h2>
  <ul>
    <li><strong>Reuse</strong> — one definition, many call sites.</li>
    <li><strong>Naming</strong> — <span class="ic">calculate_tax</span> documents intent.</li>
    <li><strong>Testing</strong> — a small function is easy to verify.</li>
    <li><strong>Repair</strong> — fix the bug in one place, not twenty.</li>
  </ul>
  <h2>Decomposition, delivered</h2>
  <p>Remember the module on decomposition? Each fully decomposed piece becomes a function. The grade-reporting problem becomes:</p>
  <pre class="code-block">def read_scores(): ...
def round_average(scores): ...
def letter_grade(avg): ...
def report(grade): ...</pre>
  <p>The main flow is now four lines that read like a summary of the goal.</p>
  <h2>Guard clauses</h2>
  <p>Validate inputs at the top of a function and return early. This keeps the happy path un-nested and easy to read:</p>
  <pre class="code-block">def classify(score):
    if score &lt; 0 or score &gt; 100:
        return "invalid score"
    if score &gt;= 90:
        return "A"
    return "B"</pre>
  <p>Each guard removes an entire class of bad input before the real logic ever runs.</p>
  <div class="callout callout-tip">
    <strong>One job per function</strong>
    <p>If you need the word "and" to describe what a function does, split it. Small single-purpose functions are the most reliable code you can write.</p>
  </div>
  <div class="callout callout-info">
    <strong>Name functions with verbs</strong>
    <p><span class="ic">calculate</span>, <span class="ic">validate</span>, <span class="ic">convert</span>, <span class="ic">print</span> — a verb prefix tells the reader what the function does, like a command.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0F000000-0000-4000-8000-000000000417',
  '0F000000-0000-4000-8000-000000000317',
  1,
  'Parameters, Return Values & Scope',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Parameters, Return Values &amp; Scope</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Parameters, Return Values &amp; Scope</h1>
  <p>Two doors connect a function to the rest of the program: inputs flowing in through <strong>parameters</strong> and results flowing out through <strong>return values</strong>.</p>
  <pre class="code-block">def celsius_to_fahrenheit(c):
    return c * 9 / 5 + 32

print(celsius_to_fahrenheit(25))   # 77.0</pre>
  <p>The parameter <span class="ic">c</span> is a local name that receives whatever value the caller passes. The <span class="ic">return</span> keyword hands a value back and immediately ends the function.</p>
  <h2>Default parameters</h2>
  <pre class="code-block">def greet(name, greeting = "Hello"):
    return greeting + ", " + name + "!"

print(greet("Ana"))            # Hello, Ana!
print(greet("Ana", "Hi"))      # Hi, Ana!</pre>
  <h2>Scope: where names live</h2>
  <p>A variable created inside a function is <strong>local</strong>: it exists only while that function runs and cannot be seen outside. A variable created at the top level is <strong>global</strong> and visible everywhere.</p>
  <pre class="code-block">factor = 2                  # global

def scale(value):
    temp = value * factor    # temp is local, factor is global
    return temp</pre>
  <div class="callout">
    <strong>Guards and early returns</strong>
    <p>Validate a parameter at the top of the function and return early when it is bad. This flattens the code and removes the deepest nesting level.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Prefer pure functions</strong>
    <p>A <strong>pure function</strong> only reads its parameters and returns a result — it never touches the outside world. Pure functions are the easiest code to test and reason about. Write most of your logic that way.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0F000000-0000-4000-8000-000000000419',
  '0F000000-0000-4000-8000-000000000319',
  1,
  'Arrays: Ordered Collections',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Arrays: Ordered Collections</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Arrays: Ordered Collections</h1>
  <p>Storing one value per variable breaks down with collections. An <strong>array</strong> (or list) holds many values of the same kind in one named variable, in a fixed order.</p>
  <pre class="code-block">temperatures = [19, 22, 18, 25, 21]
print(temperatures[0])    # 19 — first element
print(temperatures[4])    # 21 — last element
print(len(temperatures))  # 5 — number of elements</pre>
  <h2>Counting starts at zero</h2>
  <p>Most languages index arrays from 0. The table below shows the positions in the array above:</p>
  <table>
    <tr><th>Index</th><th>0</th><th>1</th><th>2</th><th>3</th><th>4</th></tr>
    <tr><td>Value</td><td>19</td><td>22</td><td>18</td><td>25</td><td>21</td></tr>
  </table>
  <p>The last element always sits at <span class="ic">len(array) - 1</span>.</p>
  <h2>Looping through an array</h2>
  <p>Reading the whole collection with a loop is the heart of data processing:</p>
  <pre class="code-block">for temp in temperatures:
    print(temp)

# with index, when the position matters
for i in range(len(temperatures)):
    print(i, "->", temperatures[i])</pre>
  <h2>Common operations</h2>
  <ul>
    <li><span class="ic">append</span> — add a value to the end.</li>
    <li><span class="ic">len</span> — ask how many values there are.</li>
    <li><span class="ic">array[i] = x</span> — replace the value at a position.</li>
    <li>Loop plus test — search, count, filter, transform.</li>
  </ul>
  <h2>Building arrays</h2>
  <p>Arrays can start empty and grow as data arrives:</p>
  <pre class="code-block">scores = []
scores.append(85)
scores.append(92)
scores[1] = 95     # replace the second value
print(len(scores)) # 2</pre>
  <p>This is exactly how a program collects guesses or user answers before processing them as a group.</p>
  <div class="callout">
    <strong>Index out of range</strong>
    <p>Reading <span class="ic">temperatures[5]</span> on five elements is a runtime error. When debugging such an error, check whether the loop can ever step past <span class="ic">len - 1</span>.</p>
  </div>
  <div class="callout callout-tip">
    <strong>An array is one answer to one question</strong>
    <p>Ask: "what real collection does this stand for?" Student scores, product prices, game guesses — naming the collection after the real thing keeps the whole program readable.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0F000000-0000-4000-8000-000000000420',
  '0F000000-0000-4000-8000-000000000320',
  1,
  'Processing Data with Arrays',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Processing Data with Arrays</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Processing Data with Arrays</h1>
  <p>Arrays exist to be processed. The same small toolkit — accumulate, search, compare, transform — answers most questions asked of a list.</p>
  <h2>Sum and average</h2>
  <pre class="code-block">total = 0
for price in prices:
    total = total + price
average = total / len(prices)</pre>
  <h2>Find the largest</h2>
  <pre class="code-block">largest = prices[0]     # start with the first element
for price in prices:
    if price &gt; largest:
        largest = price</pre>
  <p>Start with the first element rather than zero; with negative data, zero-based answers are silently wrong.</p>
  <h2>Search for a value</h2>
  <pre class="code-block">target = "chair"
position = -1
for i in range(len(products)):
    if products[i] == target:
        position = i
        break
if position == -1:
    print("Not found")</pre>
  <h2>Transform into a new array</h2>
  <pre class="code-block">doubled = []
for price in prices:
    doubled.append(price * 2)</pre>
  <h2>Count matches</h2>
  <pre class="code-block">hots = 0
for temp in temperatures:
    if temp &gt;= 25:
        hots = hots + 1</pre>
  <div class="callout callout-tip">
    <strong>The accumulator pattern</strong>
    <p>Sum, count, largest, smallest, and search are all the same skeleton: start a result, loop, update inside, use the result after. Master the skeleton once.</p>
  </div>
  <div class="callout callout-info">
    <strong>Read the loop aloud</strong>
    <p>"Start the largest with the first. For each price, if bigger, replace." Describing loops in words surfaces wrong conditions instantly.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0F000000-0000-4000-8000-000000000422',
  '0F000000-0000-4000-8000-000000000322',
  1,
  'Debugging Strategies',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Debugging Strategies</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Debugging Strategies</h1>
  <p><strong>Debugging</strong> is finding and removing errors. Every programmer debugs daily; the skill is not avoiding bugs but reducing how long they take to find.</p>
  <h2>The three error families</h2>
  <table>
    <tr><th>Family</th><th>Example</th><th>Detected when</th></tr>
    <tr><td>Syntax</td><td>Missing colon</td><td>Before running — the program will not start</td></tr>
    <tr><td>Runtime</td><td>Index out of range</td><td>While running — the program crashes</td></tr>
    <tr><td>Logic</td><td>Using &gt; instead of &gt;=</td><td>Never — it runs, but the answers are wrong</td></tr>
  </table>
  <h2>Divide and conquer</h2>
  <p>Find the halfway point of the computation. Test smaller inputs until you isolate the exact step that goes wrong, then focus on that one step. Half-sized tests halve the search each time.</p>
  <h2>Watch the values move</h2>
  <p>Print the intermediate results at key points:</p>
  <pre class="code-block">print("i =", i, "total =", total)     # temporary debug line
print("guess =", guess, "target =", target)</pre>
  <p>The wrong-looking value in the output points straight at the offending line. Remove the debug prints once the bug is fixed.</p>
  <div class="callout">
    <strong>Logic bugs are silent</strong>
    <p>No crash, no error message — just a wrong answer. They hide the longest, and they are exactly why tests and trace tables (next lesson) matter.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Change one thing at a time</strong>
    <p>Adjust a single line, re-run, and compare. Changing five things at once makes it impossible to know which one helped.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0F000000-0000-4000-8000-000000000423',
  '0F000000-0000-4000-8000-000000000323',
  1,
  'Testing & Tracing Your Logic',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Testing &amp; Tracing Your Logic</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Testing &amp; Tracing Your Logic</h1>
  <p>Testing answers "does this program produce the right output?" The habit is simple: before you trust a function, run it on inputs where you already know the answer.</p>
  <h2>Test cases</h2>
  <p>Pick representative inputs — the happy path and the boundaries:</p>
  <table>
    <tr><th>Input</th><th>Expected</th><th>Why it matters</th></tr>
    <tr><td>0 and 4</td><td>average 2</td><td>Normal case</td></tr>
    <tr><td>-2 and 2</td><td>average 0</td><td>Negative values</td></tr>
    <tr><td>10</td><td>average 10</td><td>Single element</td></tr>
    <tr><td>empty list</td><td>clear error, no crash</td><td>Edge case</td></tr>
  </table>
  <p>A function that passes the normal case but fails on the empty list is exactly the kind of bug that escapes to production.</p>
  <h2>Trace tables</h2>
  <p>A <strong>trace table</strong> simulates the program by hand, recording every variable at every step. It converts a program you do not understand into a table you do.</p>
  <pre class="code-block">total = 0
for item in [2, 4, 3]:
    total = total + item</pre>
  <table>
    <tr><th>Step</th><th>item</th><th>total</th></tr>
    <tr><td>start</td><td>—</td><td>0</td></tr>
    <tr><td>1st iteration</td><td>2</td><td>2</td></tr>
    <tr><td>2nd iteration</td><td>4</td><td>6</td></tr>
    <tr><td>3rd iteration</td><td>3</td><td>9</td></tr>
  </table>
  <p>Expect 9; if your own run says otherwise, the error is now in plain sight on paper.</p>
  <div class="callout callout-tip">
    <strong>Test boundaries relentlessly</strong>
    <p>Zero, one element, negative values, empty data, the exact threshold. The boundaries are where logic bugs live.</p>
  </div>
  <div class="callout callout-info">
    <strong>Automate later</strong>
    <p>Hand testing is step one. Every testing framework in the industry automates exactly the cases you practice here by hand.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0F000000-0000-4000-8000-000000000425',
  '0F000000-0000-4000-8000-000000000325',
  1,
  'Capstone: Planning the Number Guessing Game',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Planning the Number Guessing Game</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Capstone: Planning the Number Guessing Game</h1>
  <p>Every skill in this course lands in one program: a <strong>number guessing game</strong>. The computer picks a secret number from 1 to 100; the player guesses; the program says "higher" or "lower" until the player lands on it, then reports how many guesses it took.</p>
  <h2>Requirements</h2>
  <ul>
    <li>Pick a random secret number between 1 and 100.</li>
    <li>Repeat: read a guess, answer "too high" or "too low".</li>
    <li>End with a congratulation and the guess count.</li>
    <li>Refuse invalid input (text, or numbers outside the range).</li>
    <li>Offer a replay at the end.</li>
  </ul>
  <h2>Decompose before coding</h2>
  <p>Apply module 1. The whole game, split:</p>
  <pre class="code-block">1. CREATE the secret number
2. PLAY one round until the guess is correct
3. SHOW the summary
4. ASK about replay
   IF yes, go back to step 1</pre>
  <p>Step 2 is still big — split again into read, compare, message:</p>
  <pre class="code-block">2.1 READ a number between 1 and 100
2.2 IF guess &lt; secret THEN print "Higher"
2.3 ELSE IF guess &gt; secret THEN print "Lower"
2.4 ELSE print "Correct!"</pre>
  <h2>The future functions</h2>
  <p>The decomposition maps straight onto functions:</p>
  <pre class="code-block">pick_secret()          # random 1..100
read_valid_guess()     # loop until a valid number
check_guess(guess, secret)
print_summary(guesses)
ask_replay()</pre>
  <div class="callout callout-tip">
    <strong>Plan before code</strong>
    <p>An hour of planning saves a day of debugging. If you can explain the whole game in ten lines before writing any code, the only hard work left is translation.</p>
  </div>
  <div class="callout callout-info">
    <strong>Scope discipline</strong>
    <p>Ship the five requirements first. Ideas like difficulty levels are welcome — after the base game works. Scope creep kills unfinished projects.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0F000000-0000-4000-8000-000000000426',
  '0F000000-0000-4000-8000-000000000326',
  1,
  'Capstone: Building the Program',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Building the Program</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Capstone: Building the Program</h1>
  <p>Build in small, runnable steps. After every step the program still runs, so the surface for failure stays tiny.</p>
  <h2>Step 1: guess mechanics</h2>
  <pre class="code-block">secret = pick_secret()
guesses = 0

while True:
    guess = read_valid_guess()
    guesses = guesses + 1

    if guess &lt; secret:
        print("Higher")
    elif guess &gt; secret:
        print("Lower")
    else:
        print("Correct! It took", guesses, "guesses")
        break</pre>
  <h2>The functions in the plan</h2>
  <table>
    <tr><th>Function</th><th>Job</th></tr>
    <tr><td>pick_secret</td><td>Return a random integer from 1 to 100</td></tr>
    <tr><td>read_valid_guess</td><td>Loop until the input is a valid number, then return it</td></tr>
    <tr><td>check_guess</td><td>Compare and print Higher, Lower, or Correct</td></tr>
    <tr><td>print_summary</td><td>Show the final guess count and a rating</td></tr>
    <tr><td>ask_replay</td><td>Return True or False based on user input</td></tr>
  </table>
  <h2>Build order</h2>
  <ol>
    <li>Pick the secret; print it once for testing, remove it later.</li>
    <li>Read one valid guess.</li>
    <li>Add the higher/lower response.</li>
    <li>Add the loop until correct.</li>
    <li>Count guesses and print the summary.</li>
  </ol>
  <p>The main flow ties the functions together into a single readable statement of intent:</p>
  <pre class="code-block">def main():
    secret = pick_secret()
    guesses = play_round(secret)
    print_summary(guesses)</pre>
  <p>Test each step with your eyes: guess the number yourself, then read the trace table of the loop. When the basic flow works, move to refining.</p>
  <div class="callout">
    <strong>Testing the secret</strong>
    <p>While building, hard-code <span class="ic">secret = 42</span> so you always know the answer. Swap in the random function only after everything else works.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Run early, run often</strong>
    <p>Five small successful runs beat one large failed run. Each new feature rides on top of a working program, not a broken one.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0F000000-0000-4000-8000-000000000427',
  '0F000000-0000-4000-8000-000000000327',
  1,
  'Capstone: Refining & Extending the Game',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Refining &amp; Extending the Game</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Capstone: Refining &amp; Extending the Game</h1>
  <p>The base game works. Refinement turns a working program into a trustworthy one: validate anything a user types, respond with friendly messages, and give the player a reason to come back.</p>
  <h2>1. Validate the guess</h2>
  <pre class="code-block">def read_valid_guess():
    while True:
        raw = input("Guess 1 to 100: ")
        try:
            value = int(raw)
        except ValueError:
            print("Enter a whole number.")
            continue
        if value &lt; 1 or value &gt; 100:
            print("Use a number from 1 to 100.")
            continue
        return value</pre>
  <p>Every path either returns a valid number or loops again — the caller can always trust the result.</p>
  <h2>2. Add replay</h2>
  <pre class="code-block">def ask_replay():
    answer = input("Play again? (yes/no): ").lower()
    return answer == "yes"</pre>
  <h2>3. Wrap it in a main flow</h2>
  <pre class="code-block">def main():
    while True:
        play_once()
        if not ask_replay():
            break</pre>
  <h2>Extensions to try</h2>
  <ul>
    <li>A rating: "amazing" for 1 to 3 guesses, "sharp" for 4 to 7, otherwise "keep practicing".</li>
    <li>Difficulty: easy from 1 to 50, hard from 1 to 500.</li>
    <li>A best-score record kept for the session.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Review your own work</strong>
    <p>Re-read the final program once with fresh eyes: names, one job per function, no leftover debug prints, constants at the top. That pass separates finished from finished-and-clean.</p>
  </div>
  <div class="callout callout-info">
    <strong>You did it</strong>
    <p>You planned, built, tested, and hardened a complete program. Every larger project — web apps, games, tools — follows this exact sequence. The logic you practiced here is the foundation for everything ahead.</p>
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
  ('0F000000-0000-4000-8000-000000000501', '0F000000-0000-4000-8000-000000000303',
   'Which of these best describes an algorithm?',
   'An algorithm is a limited sequence of precise steps that solves a problem.', 1),
  ('0F000000-0000-4000-8000-000000000502', '0F000000-0000-4000-8000-000000000303',
   'An algorithm must terminate. What does that mean?',
   'Termination means the algorithm stops after a finite number of steps.', 2),
  ('0F000000-0000-4000-8000-000000000503', '0F000000-0000-4000-8000-000000000303',
   'What is pseudocode?',
   'Pseudocode is structured plain language that describes algorithm steps without real syntax.', 3),
  ('0F000000-0000-4000-8000-000000000504', '0F000000-0000-4000-8000-000000000306',
   'What is decomposition?',
   'Decomposition splits a hard problem into pieces that are each easy to solve.', 1),
  ('0F000000-0000-4000-8000-000000000505', '0F000000-0000-4000-8000-000000000306',
   'Which flowchart shape represents a decision?',
   'A diamond holds a yes/no decision with two outgoing branches.', 2),
  ('0F000000-0000-4000-8000-000000000506', '0F000000-0000-4000-8000-000000000306',
   'Which flowchart symbol marks the start or the end of a program?',
   'An oval terminator marks the start and end of the flow.', 3),
  ('0F000000-0000-4000-8000-000000000507', '0F000000-0000-4000-8000-000000000309',
   'Which variable name follows good naming conventions?',
   'student_gpa is descriptive and follows underscore naming.', 1),
  ('0F000000-0000-4000-8000-000000000508', '0F000000-0000-4000-8000-000000000309',
   'What does the statement total = total + 10 do?',
   'The right side is evaluated first, then the result is stored back into total.', 2),
  ('0F000000-0000-4000-8000-000000000509', '0F000000-0000-4000-8000-000000000309',
   'A program reads the string "25" from the user and must compute the age next year. What must happen first?',
   'Numeric input arrives as text, so it must be converted before arithmetic.', 3),
  ('0F000000-0000-4000-8000-000000000510', '0F000000-0000-4000-8000-000000000312',
   'A program should print "Hot" only when the temperature is above 30. Which condition does that?',
   'The greater-than check is true only for temperatures above 30.', 1),
  ('0F000000-0000-4000-8000-000000000511', '0F000000-0000-4000-8000-000000000312',
   'Which comparison operator means "not equal to"?',
   '!= means not equal to in many programming languages.', 2),
  ('0F000000-0000-4000-8000-000000000512', '0F000000-0000-4000-8000-000000000312',
   'The expression (score >= 60) and (absent == False) is true in which situation?',
   'Both sides must be true: a passing score and full attendance.', 3),
  ('0F000000-0000-4000-8000-000000000513', '0F000000-0000-4000-8000-000000000315',
   'Which loop fits a fixed number of repetitions?',
   'A for loop repeats a known number of times.', 1),
  ('0F000000-0000-4000-8000-000000000514', '0F000000-0000-4000-8000-000000000315',
   'How many times does "Go" print in: for i in range(3): print("Go")?',
   'range(3) produces three values: 0, 1, and 2.', 2),
  ('0F000000-0000-4000-8000-000000000515', '0F000000-0000-4000-8000-000000000315',
   'Which is the most common cause of an infinite loop?',
   'An infinite loop repeats because the exit condition never becomes false.', 3),
  ('0F000000-0000-4000-8000-000000000516', '0F000000-0000-4000-8000-000000000318',
   'What is the main benefit of using functions?',
   'Functions let you write tested logic once and call it from many places.', 1),
  ('0F000000-0000-4000-8000-000000000517', '0F000000-0000-4000-8000-000000000318',
   'A function with no return statement returns what?',
   'Without return, falling off the end of the function yields nothing usable.', 2),
  ('0F000000-0000-4000-8000-000000000518', '0F000000-0000-4000-8000-000000000318',
   'What is a local variable?',
   'Local variables are created when the function runs and disappear when it ends.', 3),
  ('0F000000-0000-4000-8000-000000000519', '0F000000-0000-4000-8000-000000000321',
   'In most programming languages, what index holds the first element of an array?',
   'Array indexes start at 0 in nearly every language.', 1),
  ('0F000000-0000-4000-8000-000000000520', '0F000000-0000-4000-8000-000000000321',
   'An array has 5 elements. What is the index of its last element?',
   'With 5 elements the valid indexes are 0 through 4.', 2),
  ('0F000000-0000-4000-8000-000000000521', '0F000000-0000-4000-8000-000000000321',
   'Which pattern sums all elements of an array?',
   'Total starts at 0 and each array element is added inside the loop.', 3),
  ('0F000000-0000-4000-8000-000000000522', '0F000000-0000-4000-8000-000000000324',
   'A bug only appears with very large inputs. Which strategy narrows it down fastest?',
   'Smaller test inputs shrink the search space until the failing step is found.', 1),
  ('0F000000-0000-4000-8000-000000000523', '0F000000-0000-4000-8000-000000000324',
   'What is a trace table?',
   'A trace table lists every step with the current value of each variable.', 2),
  ('0F000000-0000-4000-8000-000000000524', '0F000000-0000-4000-8000-000000000324',
   'What is an edge case?',
   'Edge cases sit at the boundaries of valid input, like zero or an empty list.', 3),
  ('0F000000-0000-4000-8000-000000000525', '0F000000-0000-4000-8000-000000000328',
   'You must write a program that checks a password. What is the most valuable first step?',
   'Precise rules on paper turn into clean tests and code before a line is typed.', 1),
  ('0F000000-0000-4000-8000-000000000526', '0F000000-0000-4000-8000-000000000328',
   'Why is planning with pseudocode or a flowchart worthwhile?',
   'Planning surfaces logic problems while a fix costs minutes, not hours.', 2),
  ('0F000000-0000-4000-8000-000000000527', '0F000000-0000-4000-8000-000000000328',
   'A loop should print the numbers 1 to 10. Which loop fits best?',
   'A for loop with a known range fits an exact number of repetitions.', 3),
  ('0F000000-0000-4000-8000-000000000528', '0F000000-0000-4000-8000-000000000328',
   'A program runs without crashing but prints a wrong answer. What is the best way to start?',
   'Intermediate prints reveal exactly where the calculation first goes wrong.', 4),
  ('0F000000-0000-4000-8000-000000000529', '0F000000-0000-4000-8000-000000000328',
   'What makes a Celsius-to-Fahrenheit function easy to trust?',
   'Known hand-computed pairs confirm the conversion across its range.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): algorithm definition
  ('0F000000-0000-4000-8000-000000001001', '0F000000-0000-4000-8000-000000000501', 'A finite sequence of precise steps that solves a problem', TRUE,  1),
  ('0F000000-0000-4000-8000-000000001002', '0F000000-0000-4000-8000-000000000501', 'A high-level programming language', FALSE, 2),
  ('0F000000-0000-4000-8000-000000001003', '0F000000-0000-4000-8000-000000000501', 'A type of computer hardware', FALSE, 3),
  ('0F000000-0000-4000-8000-000000001004', '0F000000-0000-4000-8000-000000000501', 'Any sentence that contains a condition', FALSE, 4),
  -- Q1 (502): termination
  ('0F000000-0000-4000-8000-000000001005', '0F000000-0000-4000-8000-000000000502', 'It always finishes after a finite number of steps', FALSE, 1),
  ('0F000000-0000-4000-8000-000000001006', '0F000000-0000-4000-8000-000000000502', 'It runs until the user manually quits', FALSE, 2),
  ('0F000000-0000-4000-8000-000000001007', '0F000000-0000-4000-8000-000000000502', 'It stops when it has produced an answer in a limited number of steps', TRUE,  3),
  ('0F000000-0000-4000-8000-000000001008', '0F000000-0000-4000-8000-000000000502', 'It only runs on the fastest machines', FALSE, 4),
  -- Q1 (503): pseudocode
  ('0F000000-0000-4000-8000-000000001009', '0F000000-0000-4000-8000-000000000503', 'A diagram that shows the shape of the flow', FALSE, 1),
  ('0F000000-0000-4000-8000-000000001010', '0F000000-0000-4000-8000-000000000503', 'A structured plain-language description of the algorithm steps', TRUE,  2),
  ('0F000000-0000-4000-8000-000000001011', '0F000000-0000-4000-8000-000000000503', 'The final compiled program binary', FALSE, 3),
  ('0F000000-0000-4000-8000-000000001012', '0F000000-0000-4000-8000-000000000503', 'Code written in the Python language', FALSE, 4),
  -- Q2 (504): decomposition
  ('0F000000-0000-4000-8000-000000001013', '0F000000-0000-4000-8000-000000000504', 'Breaking a large problem into smaller, solvable pieces', TRUE,  1),
  ('0F000000-0000-4000-8000-000000001014', '0F000000-0000-4000-8000-000000000504', 'Deleting the hard parts of a problem', FALSE, 2),
  ('0F000000-0000-4000-8000-000000001015', '0F000000-0000-4000-8000-000000000504', 'Combining several programs into one file', FALSE, 3),
  ('0F000000-0000-4000-8000-000000001016', '0F000000-0000-4000-8000-000000000504', 'Drawing a flowchart of the program', FALSE, 4),
  -- Q2 (505): decision symbol
  ('0F000000-0000-4000-8000-000000001017', '0F000000-0000-4000-8000-000000000505', 'Parallelogram', FALSE, 1),
  ('0F000000-0000-4000-8000-000000001018', '0F000000-0000-4000-8000-000000000505', 'Rectangle', FALSE, 2),
  ('0F000000-0000-4000-8000-000000001019', '0F000000-0000-4000-8000-000000000505', 'Oval', FALSE, 3),
  ('0F000000-0000-4000-8000-000000001020', '0F000000-0000-4000-8000-000000000505', 'Diamond', TRUE,  4),
  -- Q2 (506): terminator symbol
  ('0F000000-0000-4000-8000-000000001021', '0F000000-0000-4000-8000-000000000506', 'Parallelogram', FALSE, 1),
  ('0F000000-0000-4000-8000-000000001022', '0F000000-0000-4000-8000-000000000506', 'Oval terminator', TRUE,  2),
  ('0F000000-0000-4000-8000-000000001023', '0F000000-0000-4000-8000-000000000506', 'Rectangle process', FALSE, 3),
  ('0F000000-0000-4000-8000-000000001024', '0F000000-0000-4000-8000-000000000506', 'Diamond decision', FALSE, 4),
  -- Q3 (507): naming conventions
  ('0F000000-0000-4000-8000-000000001025', '0F000000-0000-4000-8000-000000000507', 'score', FALSE, 1),
  ('0F000000-0000-4000-8000-000000001026', '0F000000-0000-4000-8000-000000000507', 'student_gpa', TRUE,  2),
  ('0F000000-0000-4000-8000-000000001027', '0F000000-0000-4000-8000-000000000507', '2nd_score', FALSE, 3),
  ('0F000000-0000-4000-8000-000000001028', '0F000000-0000-4000-8000-000000000507', 'final score', FALSE, 4),
  -- Q3 (508): assignment
  ('0F000000-0000-4000-8000-000000001029', '0F000000-0000-4000-8000-000000000508', 'Reads the current total, adds 10, and stores the result back', TRUE,  1),
  ('0F000000-0000-4000-8000-000000001030', '0F000000-0000-4000-8000-000000000508', 'Checks whether total is equal to 10', FALSE, 2),
  ('0F000000-0000-4000-8000-000000001031', '0F000000-0000-4000-8000-000000000508', 'Sets total to the value 10', FALSE, 3),
  ('0F000000-0000-4000-8000-000000001032', '0F000000-0000-4000-8000-000000000508', 'Divides total by 10', FALSE, 4),
  -- Q3 (509): input conversion
  ('0F000000-0000-4000-8000-000000001033', '0F000000-0000-4000-8000-000000000509', 'Add 1 to the string and print it', FALSE, 1),
  ('0F000000-0000-4000-8000-000000001034', '0F000000-0000-4000-8000-000000000509', 'Multiply the string by 2', FALSE, 2),
  ('0F000000-0000-4000-8000-000000001035', '0F000000-0000-4000-8000-000000000509', 'Skip arithmetic and print the string', FALSE, 3),
  ('0F000000-0000-4000-8000-000000001036', '0F000000-0000-4000-8000-000000000509', 'Convert the string to a number with int() first', TRUE,  4),
  -- Q4 (510): hot condition
  ('0F000000-0000-4000-8000-000000001037', '0F000000-0000-4000-8000-000000000510', 'if temp <= 30', FALSE, 1),
  ('0F000000-0000-4000-8000-000000001038', '0F000000-0000-4000-8000-000000000510', 'if temp == 30', FALSE, 2),
  ('0F000000-0000-4000-8000-000000001039', '0F000000-0000-4000-8000-000000000510', 'if temp > 30', TRUE,  3),
  ('0F000000-0000-4000-8000-000000001040', '0F000000-0000-4000-8000-000000000510', 'if temp < 30', FALSE, 4),
  -- Q4 (511): not equal
  ('0F000000-0000-4000-8000-000000001041', '0F000000-0000-4000-8000-000000000511', '!=', TRUE,  1),
  ('0F000000-0000-4000-8000-000000001042', '0F000000-0000-4000-8000-000000000511', '==', FALSE, 2),
  ('0F000000-0000-4000-8000-000000001043', '0F000000-0000-4000-8000-000000000511', '=!', FALSE, 3),
  ('0F000000-0000-4000-8000-000000001044', '0F000000-0000-4000-8000-000000000511', '=<', FALSE, 4),
  -- Q4 (512): boolean and
  ('0F000000-0000-4000-8000-000000001045', '0F000000-0000-4000-8000-000000000512', 'The student failed or was absent', FALSE, 1),
  ('0F000000-0000-4000-8000-000000001046', '0F000000-0000-4000-8000-000000000512', 'The student passed and attended', TRUE,  2),
  ('0F000000-0000-4000-8000-000000001047', '0F000000-0000-4000-8000-000000000512', 'The student passed or attended', FALSE, 3),
  ('0F000000-0000-4000-8000-000000001048', '0F000000-0000-4000-8000-000000000512', 'Attendance does not matter', FALSE, 4),
  -- Q5 (513): for loop choice
  ('0F000000-0000-4000-8000-000000001049', '0F000000-0000-4000-8000-000000000513', 'A for loop over a known range', TRUE,  1),
  ('0F000000-0000-4000-8000-000000001050', '0F000000-0000-4000-8000-000000000513', 'A single if statement', FALSE, 2),
  ('0F000000-0000-4000-8000-000000001051', '0F000000-0000-4000-8000-000000000513', 'A recursive function call', FALSE, 3),
  ('0F000000-0000-4000-8000-000000001052', '0F000000-0000-4000-8000-000000000513', 'A flowchart with one branch', FALSE, 4),
  -- Q5 (514): range count
  ('0F000000-0000-4000-8000-000000001053', '0F000000-0000-4000-8000-000000000514', '2 times', FALSE, 1),
  ('0F000000-0000-4000-8000-000000001054', '0F000000-0000-4000-8000-000000000514', '4 times', FALSE, 2),
  ('0F000000-0000-4000-8000-000000001055', '0F000000-0000-4000-8000-000000000514', '0 times', FALSE, 3),
  ('0F000000-0000-4000-8000-000000001056', '0F000000-0000-4000-8000-000000000514', '3 times', TRUE,  4),
  -- Q5 (515): infinite loop
  ('0F000000-0000-4000-8000-000000001057', '0F000000-0000-4000-8000-000000000515', 'Using print() inside the loop body', FALSE, 1),
  ('0F000000-0000-4000-8000-000000001058', '0F000000-0000-4000-8000-000000000515', 'Declaring too many variables', FALSE, 2),
  ('0F000000-0000-4000-8000-000000001059', '0F000000-0000-4000-8000-000000000515', 'The loop condition never becomes false', TRUE,  3),
  ('0F000000-0000-4000-8000-000000001060', '0F000000-0000-4000-8000-000000000515', 'Naming the loop variable poorly', FALSE, 4),
  -- Q6 (516): function benefit
  ('0F000000-0000-4000-8000-000000001061', '0F000000-0000-4000-8000-000000000516', 'Code that runs only once', FALSE, 1),
  ('0F000000-0000-4000-8000-000000001062', '0F000000-0000-4000-8000-000000000516', 'Reusing one tested block of logic', TRUE,  2),
  ('0F000000-0000-4000-8000-000000001063', '0F000000-0000-4000-8000-000000000516', 'Making all variables global', FALSE, 3),
  ('0F000000-0000-4000-8000-000000001064', '0F000000-0000-4000-8000-000000000516', 'Removing the need for loops', FALSE, 4),
  -- Q6 (517): no return
  ('0F000000-0000-4000-8000-000000001065', '0F000000-0000-4000-8000-000000000517', 'The value zero', FALSE, 1),
  ('0F000000-0000-4000-8000-000000001066', '0F000000-0000-4000-8000-000000000517', 'An empty string', FALSE, 2),
  ('0F000000-0000-4000-8000-000000001067', '0F000000-0000-4000-8000-000000000517', 'None, meaning nothing usable', TRUE,  3),
  ('0F000000-0000-4000-8000-000000001068', '0F000000-0000-4000-8000-000000000517', 'The last local variable', FALSE, 4),
  -- Q6 (518): local variable
  ('0F000000-0000-4000-8000-000000001069', '0F000000-0000-4000-8000-000000000518', 'A variable visible to the whole program', FALSE, 1),
  ('0F000000-0000-4000-8000-000000001070', '0F000000-0000-4000-8000-000000000518', 'A variable stored on disk for later runs', FALSE, 2),
  ('0F000000-0000-4000-8000-000000001071', '0F000000-0000-4000-8000-000000000518', 'A special constant', FALSE, 3),
  ('0F000000-0000-4000-8000-000000001072', '0F000000-0000-4000-8000-000000000518', 'A variable that exists only inside its function', TRUE,  4),
  -- Q7 (519): zero-based index
  ('0F000000-0000-4000-8000-000000001073', '0F000000-0000-4000-8000-000000000519', '0', TRUE,  1),
  ('0F000000-0000-4000-8000-000000001074', '0F000000-0000-4000-8000-000000000519', '1', FALSE, 2),
  ('0F000000-0000-4000-8000-000000001075', '0F000000-0000-4000-8000-000000000519', '-1', FALSE, 3),
  ('0F000000-0000-4000-8000-000000001076', '0F000000-0000-4000-8000-000000000519', 'The length of the array', FALSE, 4),
  -- Q7 (520): last index
  ('0F000000-0000-4000-8000-000000001077', '0F000000-0000-4000-8000-000000000520', '5', FALSE, 1),
  ('0F000000-0000-4000-8000-000000001078', '0F000000-0000-4000-8000-000000000520', '4', TRUE,  2),
  ('0F000000-0000-4000-8000-000000001079', '0F000000-0000-4000-8000-000000000520', '6', FALSE, 3),
  ('0F000000-0000-4000-8000-000000001080', '0F000000-0000-4000-8000-000000000520', '0', FALSE, 4),
  -- Q7 (521): sum pattern
  ('0F000000-0000-4000-8000-000000001081', '0F000000-0000-4000-8000-000000000521', 'Total starts at 0 and each element is added inside a loop', TRUE,  1),
  ('0F000000-0000-4000-8000-000000001082', '0F000000-0000-4000-8000-000000000521', 'Only the first element is read', FALSE, 2),
  ('0F000000-0000-4000-8000-000000001083', '0F000000-0000-4000-8000-000000000521', 'Elements are multiplied in pairs', FALSE, 3),
  ('0F000000-0000-4000-8000-000000001084', '0F000000-0000-4000-8000-000000000521', 'The array is sorted in place', FALSE, 4),
  -- Q8 (522): divide and conquer
  ('0F000000-0000-4000-8000-000000001085', '0F000000-0000-4000-8000-000000000522', 'Isolate it by testing smaller inputs, narrowing the failing half', TRUE,  1),
  ('0F000000-0000-4000-8000-000000001086', '0F000000-0000-4000-8000-000000000522', 'Rewrite the entire program from scratch', FALSE, 2),
  ('0F000000-0000-4000-8000-000000001087', '0F000000-0000-4000-8000-000000000522', 'Add comments explaining the bug', FALSE, 3),
  ('0F000000-0000-4000-8000-000000001088', '0F000000-0000-4000-8000-000000000522', 'Install a faster computer', FALSE, 4),
  -- Q8 (523): trace table
  ('0F000000-0000-4000-8000-000000001089', '0F000000-0000-4000-8000-000000000523', 'A table recording how each variable changes step by step', FALSE, 1),
  ('0F000000-0000-4000-8000-000000001090', '0F000000-0000-4000-8000-000000000523', 'A diagram of the folders in the project', FALSE, 2),
  ('0F000000-0000-4000-8000-000000001091', '0F000000-0000-4000-8000-000000000523', 'A log of which buttons the user clicked', FALSE, 3),
  ('0F000000-0000-4000-8000-000000001092', '0F000000-0000-4000-8000-000000000523', 'A table that shows each step and the value of every variable', TRUE,  4),
  -- Q8 (524): edge case
  ('0F000000-0000-4000-8000-000000001093', '0F000000-0000-4000-8000-000000000524', 'Any input typed by a new user', FALSE, 1),
  ('0F000000-0000-4000-8000-000000001094', '0F000000-0000-4000-8000-000000000524', 'The first test case you happen to write', FALSE, 2),
  ('0F000000-0000-4000-8000-000000001095', '0F000000-0000-4000-8000-000000000524', 'A boundary input such as zero or an empty list', TRUE,  3),
  ('0F000000-0000-4000-8000-000000001096', '0F000000-0000-4000-8000-000000000524', 'A misspelled variable name', FALSE, 4),
  -- Q9 (525): plan first
  ('0F000000-0000-4000-8000-000000001097', '0F000000-0000-4000-8000-000000000525', 'Open the editor and start typing code at once', FALSE, 1),
  ('0F000000-0000-4000-8000-000000001098', '0F000000-0000-4000-8000-000000000525', 'Write the rules down as precise, testable steps first', TRUE,  2),
  ('0F000000-0000-4000-8000-000000001099', '0F000000-0000-4000-8000-000000000525', 'Copy code from another project', FALSE, 3),
  ('0F000000-0000-4000-8000-000000001100', '0F000000-0000-4000-8000-000000000525', 'Pick a programming language before reading the task', FALSE, 4),
  -- Q9 (526): planning value
  ('0F000000-0000-4000-8000-000000001101', '0F000000-0000-4000-8000-000000000526', 'It catches logic errors while they are cheap to fix', TRUE,  1),
  ('0F000000-0000-4000-8000-000000001102', '0F000000-0000-4000-8000-000000000526', 'Compilers require a flowchart as input', FALSE, 2),
  ('0F000000-0000-4000-8000-000000001103', '0F000000-0000-4000-8000-000000000526', 'It replaces the need for testing', FALSE, 3),
  ('0F000000-0000-4000-8000-000000001104', '0F000000-0000-4000-8000-000000000526', 'It makes the code run twice as fast', FALSE, 4),
  -- Q9 (527): loop 1 to 10
  ('0F000000-0000-4000-8000-000000001105', '0F000000-0000-4000-8000-000000000527', 'A while loop with no condition', FALSE, 1),
  ('0F000000-0000-4000-8000-000000001106', '0F000000-0000-4000-8000-000000000527', 'An if/else pair for each number', FALSE, 2),
  ('0F000000-0000-4000-8000-000000001107', '0F000000-0000-4000-8000-000000000527', 'A for loop over the range 1 to 10', TRUE,  3),
  ('0F000000-0000-4000-8000-000000001108', '0F000000-0000-4000-8000-000000000527', 'One long expression', FALSE, 4),
  -- Q9 (528): logic bug
  ('0F000000-0000-4000-8000-000000001109', '0F000000-0000-4000-8000-000000000528', 'Ignore it and ship anyway', FALSE, 1),
  ('0F000000-0000-4000-8000-000000001110', '0F000000-0000-4000-8000-000000000528', 'Print intermediate variable values at the key steps', TRUE,  2),
  ('0F000000-0000-4000-8000-000000001111', '0F000000-0000-4000-8000-000000000528', 'Rename every variable in uppercase', FALSE, 3),
  ('0F000000-0000-4000-8000-000000001112', '0F000000-0000-4000-8000-000000000528', 'Remove the loop and write it again', FALSE, 4),
  -- Q9 (529): trustworthy function
  ('0F000000-0000-4000-8000-000000001113', '0F000000-0000-4000-8000-000000000529', 'Checking known conversions such as 0 to 32 and 100 to 212', TRUE,  1),
  ('0F000000-0000-4000-8000-000000001114', '0F000000-0000-4000-8000-000000000529', 'Writing its name in ALL CAPITALS', FALSE, 2),
  ('0F000000-0000-4000-8000-000000001115', '0F000000-0000-4000-8000-000000000529', 'Adding many global variables', FALSE, 3),
  ('0F000000-0000-4000-8000-000000001116', '0F000000-0000-4000-8000-000000000529', 'Running it once with an empty list', FALSE, 4)
ON CONFLICT (id) DO NOTHING;
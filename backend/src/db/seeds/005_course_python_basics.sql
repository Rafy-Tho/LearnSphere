-- ============================================================================
-- SEED 005: Complete course — "Python Programming Basics"
-- ----------------------------------------------------------------------------
-- Instructor : Marcus Johnson    (10000000-0000-4000-8000-000000000002)
-- Category   : Programming Fundamentals (20000000-0000-4000-8000-000000000002)
-- Level      : BEGINNER · Access : FREE · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Python Foundations       → C1 Getting Started with Python · C2 Variables, Types & Operators
--   M2 Control & Functions      → C3 Control Flow & Loops · C4 Functions & Modules
--   M3 Working with Data        → C5 Strings, Lists & Dictionaries · C6 Error Handling & File I/O
--   M4 OOP & Pythonic Code      → C7 Classes & Objects · C8 Comprehensions & the Standard Library
--   M5 Capstone: Expense Tracker CLI → C9 Project Setup & Planning · C10 Building & Polishing
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
  '50000000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000002',
  '20000000-0000-4000-8000-000000000002',
  'Python Programming Basics',
  'python-programming-basics',
  'Learn Python from zero and write real programs on your first day. Master syntax, data structures, functions, and object-oriented programming — then build a complete expense tracker CLI you can actually run.',
  'PUBLISHED',
  'BEGINNER',
  'FREE',
  3
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('50000000-0000-4000-8000-000000000011', '50000000-0000-4000-8000-000000000001', 'Write clean, working Python: variables, types, and operators.',                 1),
  ('50000000-0000-4000-8000-000000000012', '50000000-0000-4000-8000-000000000001', 'Control program flow with conditionals and loops, and organize code into reusable functions and modules.',  2),
  ('50000000-0000-4000-8000-000000000013', '50000000-0000-4000-8000-000000000001', 'Work with strings, lists, and dictionaries to store and manipulate data.',   3),
  ('50000000-0000-4000-8000-000000000014', '50000000-0000-4000-8000-000000000001', 'Handle errors gracefully, read and write files, and model problems with classes.', 4),
  ('50000000-0000-4000-8000-000000000015', '50000000-0000-4000-8000-000000000001', 'Build and polish a complete expense tracker command-line application.',       5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('50000000-0000-4000-8000-000000000101', '50000000-0000-4000-8000-000000000001', 1, 'Python Foundations',            'Install Python and learn the core building blocks: variables, types, and operators.', 'PUBLISHED'),
  ('50000000-0000-4000-8000-000000000102', '50000000-0000-4000-8000-000000000001', 2, 'Control & Functions',           'Make decisions with conditionals and loops, then organize logic into functions and modules.', 'PUBLISHED'),
  ('50000000-0000-4000-8000-000000000103', '50000000-0000-4000-8000-000000000001', 3, 'Working with Data',             'Master strings, lists, and dictionaries, and read and write files safely.',            'PUBLISHED'),
  ('50000000-0000-4000-8000-000000000104', '50000000-0000-4000-8000-000000000001', 4, 'OOP & Pythonic Code',           'Model real problems with classes and write idiomatic Python using comprehensions and the standard library.', 'PUBLISHED'),
  ('50000000-0000-4000-8000-000000000105', '50000000-0000-4000-8000-000000000001', 5, 'Capstone: Expense Tracker CLI', 'Plan, build, and polish a complete command-line expense tracker.',                     'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('50000000-0000-4000-8000-000000000201', '50000000-0000-4000-8000-000000000101', 1, 'Getting Started with Python',     'Install the interpreter, use the REPL, and run your first scripts.', 'PUBLISHED'),
  ('50000000-0000-4000-8000-000000000202', '50000000-0000-4000-8000-000000000101', 2, 'Variables, Types & Operators',    'Store data in variables and perform calculations.',                'PUBLISHED'),
  ('50000000-0000-4000-8000-000000000203', '50000000-0000-4000-8000-000000000102', 1, 'Control Flow & Loops',            'Branch with conditionals and repeat work with loops.',             'PUBLISHED'),
  ('50000000-0000-4000-8000-000000000204', '50000000-0000-4000-8000-000000000102', 2, 'Functions & Modules',             'Package logic into reusable functions and separate modules.',      'PUBLISHED'),
  ('50000000-0000-4000-8000-000000000205', '50000000-0000-4000-8000-000000000103', 1, 'Strings, Lists & Dictionaries',   'Work with the most useful built-in data structures.',              'PUBLISHED'),
  ('50000000-0000-4000-8000-000000000206', '50000000-0000-4000-8000-000000000103', 2, 'Error Handling & File I/O',       'Handle failures gracefully and persist data to disk.',             'PUBLISHED'),
  ('50000000-0000-4000-8000-000000000207', '50000000-0000-4000-8000-000000000104', 1, 'Classes & Objects',               'Model real-world things with object-oriented programming.',        'PUBLISHED'),
  ('50000000-0000-4000-8000-000000000208', '50000000-0000-4000-8000-000000000104', 2, 'Comprehensions & the Standard Library', 'Write concise, idiomatic code using batteries included.',    'PUBLISHED'),
  ('50000000-0000-4000-8000-000000000209', '50000000-0000-4000-8000-000000000105', 1, 'Project Setup & Planning',        'Design the features and structure of the capstone project.',       'PUBLISHED'),
  ('50000000-0000-4000-8000-000000000210', '50000000-0000-4000-8000-000000000105', 2, 'Building & Polishing',            'Assemble, test, and harden the final application.',                'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 50000000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('50000000-0000-4000-8000-000000000301', '50000000-0000-4000-8000-000000000201', 1, 'Welcome to Python',                     'Meet Python and learn why it is one of the friendliest languages to start with.',     'TEXT',  'PUBLISHED', 'FREE', 10,  5),
  ('50000000-0000-4000-8000-000000000302', '50000000-0000-4000-8000-000000000201', 2, 'Installing Python & Running Scripts',   'Set up Python, explore the REPL, and run your first script file.',                    'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('50000000-0000-4000-8000-000000000303', '50000000-0000-4000-8000-000000000201', 3, 'Python Foundations Quiz',               'Check your understanding of Python fundamentals.',                                     'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('50000000-0000-4000-8000-000000000304', '50000000-0000-4000-8000-000000000202', 1, 'Variables & Naming Conventions',        'Store values in variables with clear, Pythonic names.',                               'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('50000000-0000-4000-8000-000000000305', '50000000-0000-4000-8000-000000000202', 2, 'Numbers, Strings & Booleans',           'Work with Python core data types and operators.',                                     'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('50000000-0000-4000-8000-000000000306', '50000000-0000-4000-8000-000000000202', 3, 'Variables & Types Quiz',                'Test your grasp of variables, types, and operators.',                                 'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('50000000-0000-4000-8000-000000000307', '50000000-0000-4000-8000-000000000203', 1, 'Conditionals: if, elif & else',         'Make decisions with branching statements.',                                            'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('50000000-0000-4000-8000-000000000308', '50000000-0000-4000-8000-000000000203', 2, 'Loops: for & while',                    'Repeat work efficiently with both kinds of loops.',                                   'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('50000000-0000-4000-8000-000000000309', '50000000-0000-4000-8000-000000000203', 3, 'Control Flow Quiz',                     'Verify you can branch and loop correctly.',                                            'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('50000000-0000-4000-8000-000000000310', '50000000-0000-4000-8000-000000000204', 1, 'Writing Functions',                     'Define reusable functions with parameters and return values.',                        'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('50000000-0000-4000-8000-000000000311', '50000000-0000-4000-8000-000000000204', 2, 'Parameters, Scope & Modules',           'Master argument passing, variable scope, and imports.',                               'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('50000000-0000-4000-8000-000000000312', '50000000-0000-4000-8000-000000000204', 3, 'Functions & Modules Quiz',              'Check your function and module knowledge.',                                            'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('50000000-0000-4000-8000-000000000313', '50000000-0000-4000-8000-000000000205', 1, 'Strings & String Methods',              'Manipulate text with slicing and built-in methods.',                                  'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('50000000-0000-4000-8000-000000000314', '50000000-0000-4000-8000-000000000205', 2, 'Lists, Tuples & Dictionaries',          'Store ordered and keyed collections of data.',                                        'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('50000000-0000-4000-8000-000000000315', '50000000-0000-4000-8000-000000000205', 3, 'Data Structures Quiz',                  'Test your working knowledge of Python data structures.',                              'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('50000000-0000-4000-8000-000000000316', '50000000-0000-4000-8000-000000000206', 1, 'Exceptions & try/except',               'Handle errors gracefully instead of crashing.',                                       'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('50000000-0000-4000-8000-000000000317', '50000000-0000-4000-8000-000000000206', 2, 'Reading & Writing Files',               'Persist data to disk with the with statement.',                                       'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('50000000-0000-4000-8000-000000000318', '50000000-0000-4000-8000-000000000206', 3, 'Errors & File I/O Quiz',                'Check your error handling and file skills.',                                          'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('50000000-0000-4000-8000-000000000319', '50000000-0000-4000-8000-000000000207', 1, 'Classes & Objects',                     'Model real-world things with classes and instances.',                                 'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('50000000-0000-4000-8000-000000000320', '50000000-0000-4000-8000-000000000207', 2, 'Methods, Inheritance & Dunder Methods', 'Extend classes and customize built-in behavior.',                                     'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('50000000-0000-4000-8000-000000000321', '50000000-0000-4000-8000-000000000207', 3, 'Object-Oriented Python Quiz',           'Verify your object-oriented programming fundamentals.',                               'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('50000000-0000-4000-8000-000000000322', '50000000-0000-4000-8000-000000000208', 1, 'List & Dictionary Comprehensions',     'Build collections concisely and readably.',                                           'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('50000000-0000-4000-8000-000000000323', '50000000-0000-4000-8000-000000000208', 2, 'The Standard Library',                 'Leverage batteries included: math, random, datetime, and json.',                      'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('50000000-0000-4000-8000-000000000324', '50000000-0000-4000-8000-000000000208', 3, 'Standard Library Quiz',                'Check your idiomatic Python and standard library skills.',                            'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('50000000-0000-4000-8000-000000000325', '50000000-0000-4000-8000-000000000209', 1, 'Planning the Expense Tracker',         'Design the features and structure of your capstone project.',                         'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('50000000-0000-4000-8000-000000000326', '50000000-0000-4000-8000-000000000210', 1, 'Building the Expense Tracker',         'Implement the CLI menu, core logic, and file storage.',                               'TEXT',  'PUBLISHED', 'FREE', 10, 15),
  ('50000000-0000-4000-8000-000000000327', '50000000-0000-4000-8000-000000000210', 2, 'Polishing & Error Handling',           'Harden input handling, add summaries, and polish the output.',                        'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('50000000-0000-4000-8000-000000000328', '50000000-0000-4000-8000-000000000210', 3, 'Final Assessment',                     'Prove what you learned across the whole course.',                                      'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 50000000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '50000000-0000-4000-8000-000000000401',
  '50000000-0000-4000-8000-000000000301',
  1,
  'Welcome to Python',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome to Python</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Welcome to Python</h1>
  <p>Python is a <strong>general-purpose, high-level programming language</strong> famous for readable, beginner-friendly code. It powers web applications, data analysis, artificial intelligence, automation, and countless other projects.</p>
  <p>Python is <strong>interpreted</strong>: you type code, the interpreter runs it immediately, and you see results right away. That instant feedback loop makes it the fastest way to start programming.</p>
  <h2>Why beginners love it</h2>
  <ul>
    <li>Readable syntax that stays close to plain English.</li>
    <li>Automatic memory management.</li>
    <li>A huge standard library that covers everyday tasks.</li>
    <li>A massive community with answers everywhere.</li>
  </ul>
  <h2>Your first line of code</h2>
  <pre class="code-block">print("Hello, World!")</pre>
  <p><span class="ic">print()</span> writes text to the screen. Type it into the REPL or a script and watch it run.</p>
  <div class="callout callout-info">
    <strong>Python 3</strong>
    <p>Always use Python 3 — never the retired Python 2. Every example here is Python 3.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Throughout this course you will build an <strong>expense tracker CLI</strong>. Every concept you learn feeds directly into that final project.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '50000000-0000-4000-8000-000000000402',
  '50000000-0000-4000-8000-000000000302',
  1,
  'Installing Python & Running Scripts',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Installing Python &amp; Running Scripts</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Installing Python &amp; Running Scripts</h1>
  <p>Download the installer from <span class="ic">python.org</span> and check <strong>Add Python to PATH</strong> during setup. Verify it from your terminal:</p>
  <pre class="code-block">python --version
python3 --version   # macOS and many Linux systems</pre>
  <p>You should see something like <span class="ic">Python 3.12.x</span>. If the command is not found, restart your terminal.</p>
  <h2>The REPL</h2>
  <p>Typing <span class="ic">python</span> with no file opens the <strong>REPL</strong> — an interactive prompt where code runs instantly:</p>
  <pre class="code-block">&gt;&gt;&gt; 2 + 2
4
&gt;&gt;&gt; print("Hello from the REPL")
Hello from the REPL
&gt;&gt;&gt; exit()</pre>
  <h2>Running script files</h2>
  <p>Create <span class="ic">hello.py</span>, then run it from the terminal:</p>
  <pre class="code-block">python hello.py</pre>
  <table>
    <thead>
      <tr><th>Command</th><th>What it does</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">python hello.py</span></td><td>Runs the script in that file.</td></tr>
      <tr><td><span class="ic">python</span></td><td>Opens the interactive REPL.</td></tr>
      <tr><td><span class="ic">python --version</span></td><td>Prints the installed version.</td></tr>
    </tbody>
  </table>
  <div class="callout callout-tip">
    <strong>Naming files</strong>
    <p>Use lowercase names with underscores, like <span class="ic">expense_tracker.py</span>. Python files must end in <span class="ic">.py</span>.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '50000000-0000-4000-8000-000000000403',
  '50000000-0000-4000-8000-000000000304',
  1,
  'Variables & Naming Conventions',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Variables &amp; Naming Conventions</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Variables &amp; Naming Conventions</h1>
  <p>A <strong>variable</strong> is a named label for a value in memory. Assignment uses a single equals sign, and Python infers the type for you:</p>
  <pre class="code-block">total = 42
price = 19.99
title = "Python Basics"
is_free = True</pre>
  <h2>Reassignment</h2>
  <p>Python reads the right side first, computes it, then stores the result back:</p>
  <pre class="code-block">balance = 100
balance = balance - 35
print(balance)   # 65</pre>
  <h2>Naming conventions</h2>
  <table>
    <thead>
      <tr><th>Style</th><th>Example</th><th>Used for</th></tr>
    </thead>
    <tbody>
      <tr><td>snake_case</td><td><span class="ic">monthly_rent</span></td><td>Variables and functions</td></tr>
      <tr><td>UPPER_SNAKE_CASE</td><td><span class="ic">MAX_BUDGET</span></td><td>Constants</td></tr>
      <tr><td>PascalCase</td><td><span class="ic">ExpenseTracker</span></td><td>Class names</td></tr>
    </tbody>
  </table>
  <ul>
    <li>Names start with a letter or underscore, never a digit.</li>
    <li>Use descriptive names — <span class="ic">amount</span> beats <span class="ic">x</span>.</li>
    <li>Never name a variable a Python keyword like <span class="ic">class</span> or <span class="ic">def</span>.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Multiple assignment</strong>
    <p><span class="ic">a, b = 1, 2</span> assigns both names at once, and <span class="ic">a, b = b, a</span> swaps values with no temporary variable.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '50000000-0000-4000-8000-000000000404',
  '50000000-0000-4000-8000-000000000305',
  1,
  'Numbers, Strings & Booleans',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Numbers, Strings &amp; Booleans</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Numbers, Strings &amp; Booleans</h1>
  <p>Every value has a <strong>type</strong> that decides what you can do with it. These four cover most beginner code:</p>
  <table>
    <thead>
      <tr><th>Type</th><th>Example</th><th>Notes</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">int</span></td><td><span class="ic">42</span></td><td>Whole numbers</td></tr>
      <tr><td><span class="ic">float</span></td><td><span class="ic">19.99</span></td><td>Decimal numbers</td></tr>
      <tr><td><span class="ic">str</span></td><td><span class="ic">"coffee"</span></td><td>Text in quotes</td></tr>
      <tr><td><span class="ic">bool</span></td><td><span class="ic">True</span>, <span class="ic">False</span></td><td>Yes or no</td></tr>
    </tbody>
  </table>
  <h2>Arithmetic operators</h2>
  <pre class="code-block">print(7 + 3)    # 10
print(7 / 2)    # 3.5  (float division)
print(7 // 2)   # 3    (floor division)
print(7 % 2)    # 1    (modulo, remainder)
print(2 ** 3)   # 8    (exponent)</pre>
  <h2>Strings and f-strings</h2>
  <pre class="code-block">name = "Ana"
amount = 12.5
print(f"{name} spent ${amount:.2f}")   # Ana spent $12.50</pre>
  <h2>Booleans and comparisons</h2>
  <pre class="code-block">age = 21
print(age &gt;= 18)                          # True
print(age &gt; 18 and age &lt; 65)             # True</pre>
  <div class="callout callout-info">
    <strong>type()</strong>
    <p><span class="ic">type(value)</span> tells you what kind of value you have — the debugger of first resort for type surprises.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '50000000-0000-4000-8000-000000000405',
  '50000000-0000-4000-8000-000000000307',
  1,
  'Conditionals: if, elif & else',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Conditionals: if, elif &amp; else</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Conditionals: if, elif &amp; else</h1>
  <p>Programs make decisions with <strong>conditionals</strong>. Python checks a condition and runs the matching block:</p>
  <pre class="code-block">balance = 20

if balance &lt; 0:
    print("Overdrawn")
elif balance == 0:
    print("Broke")
else:
    print("All good")</pre>
  <p>Step through it: if the first condition is true, Python runs that block and skips the rest. Otherwise it tries <span class="ic">elif</span>, then falls back to <span class="ic">else</span>.</p>
  <h2>Membership with in</h2>
  <pre class="code-block">category = "food"

if category in ("food", "transport"):
    print("Everyday expense")
else:
    print("Other expense")</pre>
  <h2>Truthiness</h2>
  <p>Some values act like <span class="ic">False</span> in a condition even though they are not booleans:</p>
  <table>
    <thead>
      <tr><th>Falsy value</th><th>Why it is falsy</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">0</span>, <span class="ic">0.0</span></td><td>Zero numbers</td></tr>
      <tr><td><span class="ic">""</span></td><td>Empty string</td></tr>
      <tr><td><span class="ic">[]</span>, <span class="ic">{}</span></td><td>Empty collections</td></tr>
      <tr><td><span class="ic">None</span></td><td>Not-a-value</td></tr>
    </tbody>
  </table>
  <pre class="code-block">if not name:
    print("Please enter your name")</pre>
  <div class="callout">
    <strong>Indentation is syntax</strong>
    <p>Python uses indentation, not braces, to define blocks. Stay consistent with four spaces per level and you will never fight scope bugs.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Ternary shorthand</strong>
    <p>For one-line choices use <span class="ic">status = "ok" if ok else "fail"</span>. It is compact but keeps the same logic.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '50000000-0000-4000-8000-000000000406',
  '50000000-0000-4000-8000-000000000308',
  1,
  'Loops: for & while',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Loops: for &amp; while</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Loops: for &amp; while</h1>
  <p>Loops repeat work. Use <span class="ic">for</span> to walk over a sequence and <span class="ic">while</span> to repeat until a condition changes.</p>
  <h2>The for loop</h2>
  <pre class="code-block">for fruit in ["apple", "banana", "cherry"]:
    print(fruit)</pre>
  <p>Pair it with <span class="ic">range()</span> to count:</p>
  <pre class="code-block">for i in range(5):        # 0 1 2 3 4
    print(i)

for i in range(1, 6):     # 1 2 3 4 5
    print(i)

for i in range(0, 10, 2): # 0 2 4 6 8  (step 2)
    print(i)</pre>
  <h2>The while loop</h2>
  <p><span class="ic">while</span> keeps running as long as its condition is true. Update the condition inside, or the loop never ends:</p>
  <pre class="code-block">balance = 500
while balance &gt; 0:
    print("Spending...", balance)
    balance -= 100
print("Done: you are at zero.")</pre>
  <h2>break, continue and else</h2>
  <ul>
    <li><span class="ic">break</span> exits the loop immediately.</li>
    <li><span class="ic">continue</span> jumps to the next iteration.</li>
    <li>A loop <span class="ic">else</span> runs when the loop ends normally without a break.</li>
  </ul>
  <pre class="code-block">for amount in [3, 15, 60]:
    if amount &gt; 50:
        print("Overspent!", amount)
        break
else:
    print("No overspending today.")</pre>
  <div class="callout callout-tip">
    <strong>Looping over dicts</strong>
    <p><span class="ic">for key in prices:</span> yields keys. Use <span class="ic">prices.items()</span> when you want the key and its value together.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '50000000-0000-4000-8000-000000000407',
  '50000000-0000-4000-8000-000000000310',
  1,
  'Writing Functions',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Writing Functions</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Writing Functions</h1>
  <p>A <strong>function</strong> is a reusable package of behavior. It takes inputs (<em>parameters</em>) and can hand back a result (<em>return value</em>). Define one with <span class="ic">def</span>:</p>
  <pre class="code-block">def greet(name):
    print(f"Hello, {name}!")

greet("Ana")          # Hello, Ana!
greet("Marcus")       # Hello, Marcus!</pre>
  <h2>Return values</h2>
  <p>A function hands results back with <span class="ic">return</span>. Without one, it implicitly returns <span class="ic">None</span>:</p>
  <pre class="code-block">def add(a, b):
    return a + b

total = add(5, 7)
print(total)          # 12</pre>
  <h2>Default parameters</h2>
  <pre class="code-block">def power(base, exponent=2):
    return base ** exponent

power(4)              # 16
power(4, 3)           # 64</pre>
  <div class="callout callout-info">
    <strong>Docstrings</strong>
    <p>A triple-quoted string right under <span class="ic">def</span> documents the function. Editors and <span class="ic">help()</span> surface it automatically.</p>
  </div>
  <div class="callout callout-tip">
    <strong>One job per function</strong>
    <p>Small functions with clear names — like <span class="ic">total_expenses()</span> — are easier to test and reuse. If one is doing three things, split it.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '50000000-0000-4000-8000-000000000408',
  '50000000-0000-4000-8000-000000000311',
  1,
  'Parameters, Scope & Modules',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Parameters, Scope &amp; Modules</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Parameters, Scope &amp; Modules</h1>
  <p>Functions accept arguments two ways. <strong>Positional</strong> arguments follow the definition order; <strong>keyword</strong> arguments name the parameter explicitly:</p>
  <pre class="code-block">def describe(amount, currency="USD", note=""):
    return f"{currency} {amount} ({note})"

describe(12.5)                       # USD 12.5 ()
describe(12.5, "EUR", "coffee")      # positional
describe(amount=12.5, note="lunch")  # keyword</pre>
  <h2>Scope: local and global</h2>
  <p>Names created inside a function are <strong>local</strong> to it. Top-level names are <strong>global</strong> and readable anywhere:</p>
  <pre class="code-block">budget = 500.0                # global

def spend(amount):
    local_used = budget       # can READ a global
    return amount

print(local_used)             # NameError: local is gone</pre>
  <p>To change a global from inside a function you need <span class="ic">global</span> — and you usually should not.</p>
  <h2>Modules and imports</h2>
  <table>
    <thead>
      <tr><th>Import style</th><th>Usage</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">import math</span></td><td><span class="ic">math.sqrt(16)</span> — namespace prefix</td></tr>
      <tr><td><span class="ic">from math import sqrt</span></td><td><span class="ic">sqrt(16)</span> — bring one name in</td></tr>
      <tr><td><span class="ic">import math as m</span></td><td><span class="ic">m.sqrt(16)</span> — shorter alias</td></tr>
    </tbody>
  </table>
  <pre class="code-block">import math
from random import randint

print(math.sqrt(16))     # 4.0
print(randint(1, 6))     # a dice roll</pre>
  <div class="callout callout-info">
    <strong>Import placement</strong>
    <p>Put imports at the top of the file. It makes dependencies obvious and keeps linters happy.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '50000000-0000-4000-8000-000000000409',
  '50000000-0000-4000-8000-000000000313',
  1,
  'Strings & String Methods',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Strings &amp; String Methods</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Strings &amp; String Methods</h1>
  <p>Strings are <strong>immutable</strong> — methods never change the original; they return a new string. Indexing counts from zero and slicing extracts ranges:</p>
  <pre class="code-block">word = "python"
print(len(word))      # 6
print(word[0])        # p
print(word[-1])       # n
print(word[0:3])      # pyt
print(word[:3])       # pyt   (start defaults to 0)
print(word[3:])       # hon   (end defaults to end)</pre>
  <h2>Handy methods</h2>
  <table>
    <thead>
      <tr><th>Method</th><th>Example</th><th>Result</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">lower()</span></td><td><span class="ic">"ANA".lower()</span></td><td>ana</td></tr>
      <tr><td><span class="ic">strip()</span></td><td><span class="ic">"  x  ".strip()</span></td><td>x</td></tr>
      <tr><td><span class="ic">split()</span></td><td><span class="ic">"a,b".split(",")</span></td><td>[a, b]</td></tr>
      <tr><td><span class="ic">startswith()</span></td><td><span class="ic">"coffee".startswith("co")</span></td><td>True</td></tr>
      <tr><td><span class="ic">join()</span></td><td><span class="ic">"-".join(["a", "b"])</span></td><td>a-b</td></tr>
    </tbody>
  </table>
  <pre class="code-block">name = "  Ana Garcia  "
cleaned = name.strip().title()
print(cleaned)                # Ana Garcia</pre>
  <h2>f-strings for display</h2>
  <pre class="code-block">label = "groceries"
amount = 42.7634
print(f"{label}: ${amount:.2f}")    # groceries: $42.76</pre>
  <div class="callout callout-tip">
    <strong>Trim user input</strong>
    <p>A user typing <span class="ic">" Ana "</span> is a classic bug. <span class="ic">strip()</span> removes surrounding whitespace before you compare or store anything.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '50000000-0000-4000-8000-000000000410',
  '50000000-0000-4000-8000-000000000314',
  1,
  'Lists, Tuples & Dictionaries',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Lists, Tuples &amp; Dictionaries</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Lists, Tuples &amp; Dictionaries</h1>
  <p><strong>Lists</strong> are ordered and mutable — add, remove, and change items freely:</p>
  <pre class="code-block">items = ["coffee", "bus", "rent"]
items.append("lunch")       # add to the end
items.remove("bus")
print(items[0])             # coffee
print(items[-1])            # lunch</pre>
  <h2>Tuples: ordered and immutable</h2>
  <p>Tuples cannot change after creation. Use them for fixed records like coordinates:</p>
  <pre class="code-block">coords = (10, 20)
x, y = coords              # unpack
# coords[0] = 99          # TypeError: immutable</pre>
  <h2>Dictionaries: lookup by key</h2>
  <pre class="code-block">prices = {"coffee": 3.5, "bus": 2.0, "rent": 650.0}

print(prices["coffee"])    # 3.5
prices["lunch"] = 8.5      # add a new key
print(prices.get("taxi", "no such key"))

for category, amount in prices.items():
    print(category, amount)</pre>
  <h2>Which structure when</h2>
  <table>
    <thead>
      <tr><th>Structure</th><th>Ordered?</th><th>Mutable?</th><th>Best for</th></tr>
    </thead>
    <tbody>
      <tr><td>list</td><td>Yes</td><td>Yes</td><td>Sequences you change</td></tr>
      <tr><td>tuple</td><td>Yes</td><td>No</td><td>Fixed records</td></tr>
      <tr><td>dict</td><td>Insertion order</td><td>Yes</td><td>Lookup by key</td></tr>
    </tbody>
  </table>
  <div class="callout callout-tip">
    <strong>Membership</strong>
    <p><span class="ic">"coffee" in prices</span> checks a key in a dict, or an item in a list. It reads naturally and is the clearest way to test existence.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '50000000-0000-4000-8000-000000000411',
  '50000000-0000-4000-8000-000000000316',
  1,
  'Exceptions & try/except',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Exceptions &amp; try/except</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Exceptions &amp; try/except</h1>
  <p>When a program runs into trouble it <strong>raises an exception</strong>. Unhandled, it crashes the script. The <span class="ic">try/except</span> pattern catches and responds:</p>
  <pre class="code-block">try:
    number = int("not a number")
except ValueError:
    print("That is not a valid number.")</pre>
  <h2>Common exceptions</h2>
  <table>
    <thead>
      <tr><th>Exception</th><th>Raised when</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">SyntaxError</span></td><td>The code itself is invalid.</td></tr>
      <tr><td><span class="ic">TypeError</span></td><td>An operation gets the wrong type.</td></tr>
      <tr><td><span class="ic">ValueError</span></td><td>A value has the right type but invalid value.</td></tr>
      <tr><td><span class="ic">ZeroDivisionError</span></td><td>Division by zero.</td></tr>
      <tr><td><span class="ic">FileNotFoundError</span></td><td>Opening a file that does not exist.</td></tr>
    </tbody>
  </table>
  <h2>else and finally</h2>
  <pre class="code-block">try:
    with open("data.txt") as f:
        content = f.read()
except FileNotFoundError:
    print("No data file yet.")
else:
    print("Read", len(content), "characters")
finally:
    print("Done trying.")</pre>
  <p><span class="ic">else</span> runs when no exception happens; <span class="ic">finally</span> always runs.</p>
  <div class="callout">
    <strong>Catch specifically</strong>
    <p>A bare <span class="ic">except:</span> swallows every error silently. Catch the exception you expect and let unexpected ones surface so you can fix them.</p>
  </div>
  <div class="callout callout-tip">
    <strong>raise on purpose</strong>
    <p>Make your own validation fail loudly: <span class="ic">if amount &lt;= 0: raise ValueError("Amount must be positive")</span>.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '50000000-0000-4000-8000-000000000412',
  '50000000-0000-4000-8000-000000000317',
  1,
  'Reading & Writing Files',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reading &amp; Writing Files</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Reading &amp; Writing Files</h1>
  <p>The <strong>with statement</strong> opens a file and guarantees it is closed — even when an exception happens. Reading a whole text file is three lines:</p>
  <pre class="code-block">with open("notes.txt", encoding="utf-8") as f:
    content = f.read()
print(content)</pre>
  <h2>Reading line by line</h2>
  <pre class="code-block">with open("expenses.csv") as f:
    for line in f:
        print(line.strip())</pre>
  <h2>Writing and appending</h2>
  <pre class="code-block">with open("output.txt", "w", encoding="utf-8") as f:
    f.write("First line\n")
    f.write("Second line\n")

with open("output.txt", "a") as f:
    f.write("Appended line\n")</pre>
  <h2>File modes</h2>
  <table>
    <thead>
      <tr><th>Mode</th><th>Behavior</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">r</span></td><td>Read only (default).</td></tr>
      <tr><td><span class="ic">w</span></td><td>Write; truncates the file or creates it.</td></tr>
      <tr><td><span class="ic">a</span></td><td>Append; adds to the end, keeps existing content.</td></tr>
      <tr><td><span class="ic">r+</span></td><td>Read and write without truncating.</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Why with wins</strong>
    <p>Forgetting <span class="ic">f.close()</span> leaks resources and can leave your file half-written. <span class="ic">with</span> removes the whole class of bugs.</p>
  </div>
  <div class="callout callout-tip">
    <strong>encoding="utf-8"</strong>
    <p>Text files with accents and emoji need explicit UTF-8 on some systems. Passing <span class="ic">encoding="utf-8"</span> makes your file handling predictable everywhere.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '50000000-0000-4000-8000-000000000413',
  '50000000-0000-4000-8000-000000000319',
  1,
  'Classes & Objects',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Classes &amp; Objects</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Classes &amp; Objects</h1>
  <p>A <strong>class</strong> is a blueprint; an <strong>object</strong> (instance) is a concrete copy built from it. The <span class="ic">__init__</span> method runs when you create an instance:</p>
  <pre class="code-block">class Expense:
    def __init__(self, amount, category, note=""):
        self.amount = amount
        self.category = category
        self.note = note

lunch = Expense(8.5, "food", "sandwich")
print(lunch.amount)       # 8.5
print(lunch.category)     # food</pre>
  <h2>Attributes and methods</h2>
  <p>Instance data lives on <span class="ic">self</span>; methods act on it:</p>
  <pre class="code-block">class Expense:
    def __init__(self, amount, category):
        self.amount = amount
        self.category = category
        self.tax = 0.0

    def add_tax(self, rate):
        self.tax = self.amount * rate

lunch = Expense(8.5, "food")
lunch.add_tax(0.10)
print(lunch.tax)          # 0.85</pre>
  <h2>Why model with objects</h2>
  <ul>
    <li>Code and its data stay together — <span class="ic">expense.add_tax()</span> not <span class="ic">add_tax(expense)</span>.</li>
    <li>You can have many instances of the same blueprint.</li>
    <li>Your code reads like the domain: expenses, students, orders.</li>
  </ul>
  <div class="callout callout-info">
    <strong>self</strong>
    <p><span class="ic">self</span> names the instance inside its own methods. Example calls pass it automatically — only non-self parameters appear between the parentheses.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Check your math</strong>
    <p>Notice <span class="ic">0.10 * 8.5</span> is <span class="ic">0.85</span>. Floats are fine for teaching, but for money in production code, prefer the <span class="ic">decimal</span> module.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '50000000-0000-4000-8000-000000000414',
  '50000000-0000-4000-8000-000000000320',
  1,
  'Methods, Inheritance & Dunder Methods',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Methods, Inheritance &amp; Dunder Methods</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Methods, Inheritance &amp; Dunder Methods</h1>
  <p><strong>Dunder methods</strong> (double underscore) hook objects into built-in behavior. <span class="ic">__str__</span> controls how <span class="ic">print()</span> shows your object:</p>
  <pre class="code-block">class Expense:
    def __init__(self, amount, category):
        self.amount = amount
        self.category = category

    def __str__(self):
        return f"Expense: {self.category} ${self.amount:.2f}"

lunch = Expense(8.5, "food")
print(lunch)          # Expense: food $8.50</pre>
  <h2>Inheritance</h2>
  <p>A <strong>child class</strong> inherits everything from its <strong>parent</strong> and can override or extend it:</p>
  <pre class="code-block">class Account:
    def __init__(self, balance=0.0):
        self.balance = balance

    def deposit(self, amount):
        self.balance += amount

class SavingsAccount(Account):
    def apply_interest(self, rate):
        self.balance *= 1 + rate

savings = SavingsAccount(100)
savings.deposit(50)
print(savings.balance)         # 150.0</pre>
  <h2>super()</h2>
  <p>To run the parent constructor too, call <span class="ic">super()</span>:</p>
  <pre class="code-block">class SavingsAccount(Account):
    def __init__(self, balance=0.0, limit=5000.0):
        super().__init__(balance)
        self.limit = limit</pre>
  <div class="callout callout-tip">
    <strong>Keep hierarchies shallow</strong>
    <p>One or two levels of inheritance solve most problems. Prefer composition (a list or dict of objects) over deep chains — it stays easier to reason about.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '50000000-0000-4000-8000-000000000415',
  '50000000-0000-4000-8000-000000000322',
  1,
  'List & Dictionary Comprehensions',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>List &amp; Dictionary Comprehensions</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>List &amp; Dictionary Comprehensions</h1>
  <p>A <strong>comprehension</strong> builds a new collection from an existing one in a single readable expression. A list comprehension:</p>
  <pre class="code-block">squares = [x * x for x in range(5)]
print(squares)          # [0, 1, 4, 9, 16]</pre>
  <p>Compare it with the equivalent loop — far fewer lines, same meaning:</p>
  <pre class="code-block">squares = []
for x in range(5):
    squares.append(x * x)</pre>
  <h2>Adding a condition</h2>
  <pre class="code-block">evens = [x for x in range(10) if x % 2 == 0]
print(evens)            # [0, 2, 4, 6, 8]</pre>
  <h2>Dictionary comprehension</h2>
  <pre class="code-block">squared = {x: x * x for x in range(5)}
print(squared)          # {0: 0, 1: 1, 2: 4, 3: 9, 4: 16}

doubled = {k: v * 2 for k, v in squared.items()}</pre>
  <h2>Real-world example</h2>
  <pre class="code-block">amounts = [3.5, 12.0, 8.25]
with_tax = [round(a * 1.1, 2) for a in amounts]
print(with_tax)         # [3.85, 13.2, 9.08]</pre>
  <div class="callout">
    <strong>Readability counts</strong>
    <p>Comprehensions shine when short. If a comprehension sprawls across many lines, a plain loop will be easier for the next reader — clarity wins, always.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '50000000-0000-4000-8000-000000000416',
  '50000000-0000-4000-8000-000000000323',
  1,
  'The Standard Library',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Standard Library</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>The Standard Library</h1>
  <p>Python ships with <strong>batteries included</strong> — a standard library covering math, randomness, dates, JSON, files, and more. Import what you need and you barely ever stretch for third-party tools.</p>
  <h2>Modules you will reach for</h2>
  <table>
    <thead>
      <tr><th>Module</th><th>What it is for</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">math</span></td><td>Floor, ceiling, sqrt, constants like pi.</td></tr>
      <tr><td><span class="ic">random</span></td><td>Random integers, choices, and shuffles.</td></tr>
      <tr><td><span class="ic">datetime</span></td><td>Dates, times, and their arithmetic.</td></tr>
      <tr><td><span class="ic">json</span></td><td>Encode and decode JSON data.</td></tr>
      <tr><td><span class="ic">os.path</span></td><td>Join and inspect file paths safely.</td></tr>
      <tr><td><span class="ic">csv</span></td><td>Read and write CSV tables.</td></tr>
    </tbody>
  </table>
  <h2>json in a few lines</h2>
  <pre class="code-block">import json

data = {"category": "food", "amount": 8.5}

with open("expense.json", "w") as f:
    json.dump(data, f)

with open("expense.json") as f:
    loaded = json.load(f)
print(loaded["category"])    # food</pre>
  <h2>random and math together</h2>
  <pre class="code-block">import math
import random

print(math.floor(3.9))       # 3
print(random.randint(1, 6))  # a dice roll 1..6
print(random.choice(["east", "west"]))</pre>
  <div class="callout callout-tip">
    <strong>help()</strong>
    <p>Typing <span class="ic">help(math)</span> in the REPL shows the full module with examples. The standard library is self-documenting — read it before you build it.</p>
  </div>
  <div class="callout callout-info">
    <strong>csv for later</strong>
    <p>Your capstone stores expenses in a CSV file. The <span class="ic">csv</span> module handles quoting and newlines for you — never hand-roll CSV parsing.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '50000000-0000-4000-8000-000000000417',
  '50000000-0000-4000-8000-000000000325',
  1,
  'Planning the Expense Tracker',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Planning the Expense Tracker</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Planning the Expense Tracker</h1>
  <p>Your capstone is a <strong>command-line expense tracker</strong>: add expenses, list them, total them by category, and save them to a CSV file so they survive across runs. Planning before coding makes the build predictable.</p>
  <h2>Features</h2>
  <ul>
    <li>Add an expense: amount, category, and a note.</li>
    <li>List all recorded expenses.</li>
    <li>Show a summary of totals by category.</li>
    <li>Persist everything to <span class="ic">expenses.csv</span>.</li>
    <li>Keep running after bad input — no crashes.</li>
  </ul>
  <h2>Project layout</h2>
  <pre class="code-block">expense_tracker.py     # the whole program
expenses.csv           # created automatically by the app</pre>
  <h2>Sketch the data model</h2>
  <pre class="code-block">expense = {
    "category": "food",
    "amount": 8.5,
    "note": "sandwich",
}</pre>
  <h2>Map features to skills</h2>
  <table>
    <thead>
      <tr><th>Feature</th><th>Python skill</th></tr>
    </thead>
    <tbody>
      <tr><td>Menu loop</td><td>while + conditionals</td></tr>
      <tr><td>Adding expenses</td><td>functions + input()</td></tr>
      <tr><td>Categories</td><td>dictionaries</td></tr>
      <tr><td>Bad input</td><td>try/except</td></tr>
      <tr><td>Storage</td><td>csv + with open()</td></tr>
    </tbody>
  </table>
  <div class="callout">
    <strong>Plan before you code</strong>
    <p>Sketch the functions on paper first: a <span class="ic">main()</span> loop that calls small helpers like <span class="ic">add_expense()</span>, <span class="ic">list_expenses()</span>, and <span class="ic">summary()</span>. Clean structure now saves debugging later.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Start minimal</strong>
    <p>Build the simplest working version first — one category, one save — then grow it. A tiny program that runs beats a giant one that never does.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '50000000-0000-4000-8000-000000000418',
  '50000000-0000-4000-8000-000000000326',
  1,
  'Building the Expense Tracker',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Building the Expense Tracker</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Building the Expense Tracker</h1>
  <p>With the plan in place, the app is a <span class="ic">main()</span> loop around a set of small helper functions. This function-based skeleton holds the whole experience:</p>
  <pre class="code-block">MENU = """
1. Add expense
2. List expenses
3. Show summary
4. Quit
"""

def main():
    while True:
        print(MENU)
        choice = input("Choose an option: ").strip()
        if choice == "1":
            add_expense()
        elif choice == "2":
            list_expenses()
        elif choice == "3":
            summary()
        elif choice == "4":
            break
        else:
            print("Unknown option.")

if __name__ == "__main__":
    main()</pre>
  <h2>Adding an expense</h2>
  <p>Collect input, validate the amount, and append to storage:</p>
  <pre class="code-block">def add_expense():
    category = input("Category: ").strip().lower()
    note = input("Note: ").strip()
    try:
        amount = float(input("Amount: "))
    except ValueError:
        print("Invalid amount.")
        return
    if amount &lt;= 0:
        print("Amount must be positive.")
        return
    save_expense([category, amount, note])
    print("Saved.")</pre>
  <h2>Reading and writing the CSV</h2>
  <pre class="code-block">import csv

def save_expense(row):
    with open("expenses.csv", "a", newline="") as f:
        csv.writer(f).writerow(row)

def load_expenses():
    try:
        with open("expenses.csv") as f:
            return list(csv.reader(f))
    except FileNotFoundError:
        return []</pre>
  <div class="callout callout-tip">
    <strong>Small functions</strong>
    <p>Each helper has one job: read a number, save a row, load rows. When a feature misbehaves, you know exactly which helper to inspect.</p>
  </div>
  <div class="callout callout-info">
    <strong>if __name__ guard</strong>
    <p>The guard runs <span class="ic">main()</span> only when the file is run directly — never when it is imported. It keeps your script import-clean and test-friendly.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '50000000-0000-4000-8000-000000000419',
  '50000000-0000-4000-8000-000000000327',
  1,
  'Polishing & Error Handling',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Polishing &amp; Error Handling</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Polishing &amp; Error Handling</h1>
  <p>Your tracker works. Now make it <strong>survive bad input</strong>, format output nicely, and feel finished. First, a summary that totals each category:</p>
  <pre class="code-block">def summary():
    rows = load_expenses()
    totals = {}
    for row in rows:
        if len(row) &lt; 3:
            continue
        category = row[0].strip().lower()
        try:
            amount = float(row[1])
        except ValueError:
            continue
        totals[category] = totals.get(category, 0) + amount

    for category, total in totals.items():
        print(f"{category:&gt;12}  ${total:.2f}")

    print("TOTAL" + " " * 8 + f"  ${sum(totals.values()):.2f}")</pre>
  <h2>Guard every data touch</h2>
  <ul>
    <li>Invalid amounts are rejected before saving.</li>
    <li>A missing CSV yields an empty list, not a crash.</li>
    <li>Ragged or malformed rows are skipped, never fatal.</li>
  </ul>
  <h2>Nicer listing</h2>
  <pre class="code-block">def list_expenses():
    rows = load_expenses()
    if not rows:
        print("No expenses yet.")
        return
    for category, amount, *rest in rows:
        print(f"{category:&gt;12}  ${amount}")</pre>
  <h2>Next steps</h2>
  <ol>
    <li>Add a delete option to the menu.</li>
    <li>Sort expenses by amount.</li>
    <li>Show a monthly total using <span class="ic">datetime</span>.</li>
    <li>Test with empty files, typos, and huge numbers.</li>
  </ol>
  <div class="callout callout-tip">
    <strong>Test the edges</strong>
    <p>Try zero, negatives, empty strings, and a file with one bad row. Polishing means your app shrugs at each of these instead of crashing.</p>
  </div>
  <div class="callout callout-info">
    <strong>You made it</strong>
    <p>From variables to classes to a running tool — that is the whole beginner loop. Take the final assessment to earn this course certificate.</p>
  </div>
</div>
</body>
</html>
$html$
)
ON CONFLICT (id) DO NOTHING;
-- ----------------------------------------------------------------------------
-- 6. QUIZZES (9 quiz lessons, 29 questions)
--    Q1 → lesson L3  (501) · Q2 → L6 (502) · Q3 → L9 (503) · Q4 → L12 (504)
--    Q5 → L15 (505)  · Q6 → L18 (506) · Q7 → L21 (507) · Q8 → L24 (508)
--    Q9 → L28 (525-529)
-- ----------------------------------------------------------------------------

INSERT INTO quizzes (id, lesson_id, question, explanation, position) VALUES
(
  '50000000-0000-4000-8000-000000000501',
  '50000000-0000-4000-8000-000000000303',
  'Which statement best describes Python''s design philosophy?',
  'The Zen of Python teaches "Readability counts." Python rewards clear, easy-to-read code.',
  1
),
(
  '50000000-0000-4000-8000-000000000502',
  '50000000-0000-4000-8000-000000000303',
  'Which command runs a Python script saved as hello.py?',
  'You run a script from the terminal with: python hello.py',
  2
),
(
  '50000000-0000-4000-8000-000000000503',
  '50000000-0000-4000-8000-000000000303',
  'What does the REPL allow you to do?',
  'REPL stands for Read-Eval-Print Loop: you type a line of Python and see the result immediately.',
  3
),
(
  '50000000-0000-4000-8000-000000000504',
  '50000000-0000-4000-8000-000000000306',
  'Which variable name follows the PEP 8 snake_case convention?',
  'PEP 8 recommends lowercase words separated by underscores, so total_expenses is idiomatic.',
  1
),
(
  '50000000-0000-4000-8000-000000000505',
  '50000000-0000-4000-8000-000000000306',
  'What does 7 // 2 evaluate to?',
  'The floor division // drops the remainder, so 7 // 2 is 3.',
  2
),
(
  '50000000-0000-4000-8000-000000000506',
  '50000000-0000-4000-8000-000000000306',
  'Which value is falsy in Python?',
  'Zero (0) is falsy. Non-zero numbers, and any non-empty string or collection, are truthy.',
  3
),
(
  '50000000-0000-4000-8000-000000000507',
  '50000000-0000-4000-8000-000000000309',
  'Which keyword starts a conditional branch?',
  'An if statement starts a conditional branch, optionally followed by elif and else.',
  1
),
(
  '50000000-0000-4000-8000-000000000508',
  '50000000-0000-4000-8000-000000000309',
  'When does the else block of a for loop run?',
  'The loop else runs when the loop finishes normally — it is skipped when you leave with break.',
  2
),
(
  '50000000-0000-4000-8000-000000000509',
  '50000000-0000-4000-8000-000000000309',
  'Which loop prints the numbers 0 through 4?',
  'range(5) yields 0, 1, 2, 3, 4 — five values, starting at zero.',
  3
),
(
  '50000000-0000-4000-8000-000000000510',
  '50000000-0000-4000-8000-000000000312',
  'Which keyword defines a function?',
  'Functions start with def, followed by the name, parentheses, and a colon.',
  1
),
(
  '50000000-0000-4000-8000-000000000511',
  '50000000-0000-4000-8000-000000000312',
  'What does a function return if it has no return statement?',
  'Functions without a return implicitly return None, Python''s null-like value.',
  2
),
(
  '50000000-0000-4000-8000-000000000512',
  '50000000-0000-4000-8000-000000000312',
  'Which import brings the sqrt function into scope?',
  'from math import sqrt claims just sqrt; import math would require math.sqrt instead.',
  3
),
(
  '50000000-0000-4000-8000-000000000513',
  '50000000-0000-4000-8000-000000000315',
  'What does "Python".upper() return?',
  'upper() returns the string uppercased: "PYTHON".',
  1
),
(
  '50000000-0000-4000-8000-000000000514',
  '50000000-0000-4000-8000-000000000315',
  'Which expression creates a list?',
  'Square brackets build a list; [1, 2, 3] is a list of three numbers.',
  2
),
(
  '50000000-0000-4000-8000-000000000515',
  '50000000-0000-4000-8000-000000000315',
  'How do you add the key apple with value 1.5 to the dictionary prices?',
  'Assignment using square brackets — prices["apple"] = 1.5 — inserts or updates the key.',
  3
),
(
  '50000000-0000-4000-8000-000000000516',
  '50000000-0000-4000-8000-000000000318',
  'Which keyword starts the block that handles an exception?',
  'try wraps risky code and except handles the specific exception(s) that may be raised.',
  1
),
(
  '50000000-0000-4000-8000-000000000517',
  '50000000-0000-4000-8000-000000000318',
  'What does the "w" file mode do?',
  'Mode "w" creates the file for writing and truncates any existing content first.',
  2
),
(
  '50000000-0000-4000-8000-000000000518',
  '50000000-0000-4000-8000-000000000318',
  'What does the with statement guarantee?',
  'The with statement closes the file when the block ends, even if an exception occurs.',
  3
),
(
  '50000000-0000-4000-8000-000000000519',
  '50000000-0000-4000-8000-000000000321',
  'Which method runs automatically when a new instance is created?',
  'The __init__ method initializes a fresh instance with its starting attributes.',
  1
),
(
  '50000000-0000-4000-8000-000000000520',
  '50000000-0000-4000-8000-000000000321',
  'Which line defines a class Child that inherits from Parent?',
  'Inheritance is written with the parent in parentheses: class Child(Parent):',
  2
),
(
  '50000000-0000-4000-8000-000000000521',
  '50000000-0000-4000-8000-000000000321',
  'What is a dunder method?',
  'Dunder (double underscore) methods like __str__ customize built-in behavior for your objects.',
  3
),
(
  '50000000-0000-4000-8000-000000000522',
  '50000000-0000-4000-8000-000000000324',
  'What does [x * x for x in range(5)] produce?',
  'The comprehension squares every value: [0, 1, 4, 9, 16].',
  1
),
(
  '50000000-0000-4000-8000-000000000523',
  '50000000-0000-4000-8000-000000000324',
  'Which module provides the randint function?',
  'random.randint picks a random integer; random is the standard module for randomness.',
  2
),
(
  '50000000-0000-4000-8000-000000000524',
  '50000000-0000-4000-8000-000000000324',
  'Which module provides namedtuple?',
  'namedtuple lives in the collections module and creates lightweight immutable records.',
  3
),
(
  '50000000-0000-4000-8000-000000000525',
  '50000000-0000-4000-8000-000000000328',
  'Which value is immutable?',
  'A tuple cannot change after creation, so it is immutable — unlike a list.',
  1
),
(
  '50000000-0000-4000-8000-000000000526',
  '50000000-0000-4000-8000-000000000328',
  'What does 10 % 3 evaluate to?',
  'The modulo operator returns the remainder of 10 divided by 3, which is 1.',
  2
),
(
  '50000000-0000-4000-8000-000000000527',
  '50000000-0000-4000-8000-000000000328',
  'Which keyword exits a loop immediately?',
  'break stops the loop and jumps to the code after it. continue skips just one iteration.',
  3
),
(
  '50000000-0000-4000-8000-000000000528',
  '50000000-0000-4000-8000-000000000328',
  'How do you add the number 4 to the end of the list items?',
  'The append method adds one item to the end: items.append(4).',
  4
),
(
  '50000000-0000-4000-8000-000000000529',
  '50000000-0000-4000-8000-000000000328',
  'Which snippet reads a whole file safely?',
  'The with statement opens the file and closes it automatically after reading.',
  5
)
ON CONFLICT (id) DO NOTHING;
-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the first listed (position of the correct
--    answer) varies. Correct answers are flagged with is_correct = TRUE.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096
--    Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): Python design philosophy
  ('50000000-0000-4000-8000-000000001001', '50000000-0000-4000-8000-000000000501', 'Code that is readable and easy to understand', TRUE,  1),
  ('50000000-0000-4000-8000-000000001002', '50000000-0000-4000-8000-000000000501', 'Code that runs as fast as possible at any cost', FALSE, 2),
  ('50000000-0000-4000-8000-000000001003', '50000000-0000-4000-8000-000000000501', 'Code with as few lines as possible', FALSE, 3),
  ('50000000-0000-4000-8000-000000001004', '50000000-0000-4000-8000-000000000501', 'Code that hides details from every reader', FALSE, 4),
  -- Q1 (501)q2: running a script
  ('50000000-0000-4000-8000-000000001005', '50000000-0000-4000-8000-000000000502', 'python hello.py', TRUE,  1),
  ('50000000-0000-4000-8000-000000001006', '50000000-0000-4000-8000-000000000502', 'run hello.py', FALSE, 2),
  ('50000000-0000-4000-8000-000000001007', '50000000-0000-4000-8000-000000000502', 'execute hello.py', FALSE, 3),
  ('50000000-0000-4000-8000-000000001008', '50000000-0000-4000-8000-000000000502', 'python --run hello.py', FALSE, 4),
  -- Q1 (501)q3: the REPL
  ('50000000-0000-4000-8000-000000001009', '50000000-0000-4000-8000-000000000503', 'Type Python code and see the result immediately', TRUE,  1),
  ('50000000-0000-4000-8000-000000001010', '50000000-0000-4000-8000-000000000503', 'Compile your whole project in one go', FALSE, 2),
  ('50000000-0000-4000-8000-000000001011', '50000000-0000-4000-8000-000000000503', 'Install third-party libraries automatically', FALSE, 3),
  ('50000000-0000-4000-8000-000000001012', '50000000-0000-4000-8000-000000000503', 'Turn Python code into machine code permanently', FALSE, 4),
  -- Q2 (504): snake_case variable
  ('50000000-0000-4000-8000-000000001013', '50000000-0000-4000-8000-000000000504', 'total_expenses', TRUE,  1),
  ('50000000-0000-4000-8000-000000001014', '50000000-0000-4000-8000-000000000504', 'totalExpenses', FALSE, 2),
  ('50000000-0000-4000-8000-000000001015', '50000000-0000-4000-8000-000000000504', 'TotalExpenses', FALSE, 3),
  ('50000000-0000-4000-8000-000000001016', '50000000-0000-4000-8000-000000000504', 'total.expenses', FALSE, 4),
  -- Q2 (504)q2: floor division
  ('50000000-0000-4000-8000-000000001017', '50000000-0000-4000-8000-000000000505', '3', TRUE,  1),
  ('50000000-0000-4000-8000-000000001018', '50000000-0000-4000-8000-000000000505', '3.5', FALSE, 2),
  ('50000000-0000-4000-8000-000000001019', '50000000-0000-4000-8000-000000000505', '2', FALSE, 3),
  ('50000000-0000-4000-8000-000000001020', '50000000-0000-4000-8000-000000000505', '1', FALSE, 4),
  -- Q2 (504)q3: falsy value
  ('50000000-0000-4000-8000-000000001021', '50000000-0000-4000-8000-000000000506', '0', TRUE,  1),
  ('50000000-0000-4000-8000-000000001022', '50000000-0000-4000-8000-000000000506', '1', FALSE, 2),
  ('50000000-0000-4000-8000-000000001023', '50000000-0000-4000-8000-000000000506', '-1', FALSE, 3),
  ('50000000-0000-4000-8000-000000001024', '50000000-0000-4000-8000-000000000506', '"0"', FALSE, 4),
  -- Q3 (507): conditional keyword
  ('50000000-0000-4000-8000-000000001025', '50000000-0000-4000-8000-000000000507', 'if', TRUE,  1),
  ('50000000-0000-4000-8000-000000001026', '50000000-0000-4000-8000-000000000507', 'when', FALSE, 2),
  ('50000000-0000-4000-8000-000000001027', '50000000-0000-4000-8000-000000000507', 'switch', FALSE, 3),
  ('50000000-0000-4000-8000-000000001028', '50000000-0000-4000-8000-000000000507', 'unless', FALSE, 4),
  -- Q3 (507)q2: loop else
  ('50000000-0000-4000-8000-000000001029', '50000000-0000-4000-8000-000000000508', 'When the loop finishes without break', TRUE,  1),
  ('50000000-0000-4000-8000-000000001030', '50000000-0000-4000-8000-000000000508', 'When the loop is skipped entirely', FALSE, 2),
  ('50000000-0000-4000-8000-000000001031', '50000000-0000-4000-8000-000000000508', 'When the loop hits continue', FALSE, 3),
  ('50000000-0000-4000-8000-000000001032', '50000000-0000-4000-8000-000000000508', 'When the loop iterates more than ten times', FALSE, 4),
  -- Q3 (507)q3: print 0 through 4
  ('50000000-0000-4000-8000-000000001033', '50000000-0000-4000-8000-000000000509', 'for i in range(5):', TRUE,  1),
  ('50000000-0000-4000-8000-000000001034', '50000000-0000-4000-8000-000000000509', 'for i in range(1, 5):', FALSE, 2),
  ('50000000-0000-4000-8000-000000001035', '50000000-0000-4000-8000-000000000509', 'for i in range(4):', FALSE, 3),
  ('50000000-0000-4000-8000-000000001036', '50000000-0000-4000-8000-000000000509', 'for i in range(5, 1):', FALSE, 4),
  -- Q4 (510): define a function
  ('50000000-0000-4000-8000-000000001037', '50000000-0000-4000-8000-000000000510', 'def', TRUE,  1),
  ('50000000-0000-4000-8000-000000001038', '50000000-0000-4000-8000-000000000510', 'func', FALSE, 2),
  ('50000000-0000-4000-8000-000000001039', '50000000-0000-4000-8000-000000000510', 'function', FALSE, 3),
  ('50000000-0000-4000-8000-000000001040', '50000000-0000-4000-8000-000000000510', 'method', FALSE, 4),
  -- Q4 (510)q2: default return
  ('50000000-0000-4000-8000-000000001041', '50000000-0000-4000-8000-000000000511', 'None', TRUE,  1),
  ('50000000-0000-4000-8000-000000001042', '50000000-0000-4000-8000-000000000511', '0', FALSE, 2),
  ('50000000-0000-4000-8000-000000001043', '50000000-0000-4000-8000-000000000511', 'True', FALSE, 3),
  ('50000000-0000-4000-8000-000000001044', '50000000-0000-4000-8000-000000000511', 'An empty string', FALSE, 4),
  -- Q4 (510)q3: import sqrt
  ('50000000-0000-4000-8000-000000001045', '50000000-0000-4000-8000-000000000512', 'from math import sqrt', TRUE,  1),
  ('50000000-0000-4000-8000-000000001046', '50000000-0000-4000-8000-000000000512', 'import sqrt from math', FALSE, 2),
  ('50000000-0000-4000-8000-000000001047', '50000000-0000-4000-8000-000000000512', 'from math include sqrt', FALSE, 3),
  ('50000000-0000-4000-8000-000000001048', '50000000-0000-4000-8000-000000000512', 'use math.sqrt as sqrt', FALSE, 4),
  -- Q5 (513): upper() result
  ('50000000-0000-4000-8000-000000001049', '50000000-0000-4000-8000-000000000513', '"PYTHON"', TRUE,  1),
  ('50000000-0000-4000-8000-000000001050', '50000000-0000-4000-8000-000000000513', '"Python"', FALSE, 2),
  ('50000000-0000-4000-8000-000000001051', '50000000-0000-4000-8000-000000000513', '"python"', FALSE, 3),
  ('50000000-0000-4000-8000-000000001052', '50000000-0000-4000-8000-000000000513', '"pYTHON"', FALSE, 4),
  -- Q5 (513)q2: create a list
  ('50000000-0000-4000-8000-000000001053', '50000000-0000-4000-8000-000000000514', '[1, 2, 3]', TRUE,  1),
  ('50000000-0000-4000-8000-000000001054', '50000000-0000-4000-8000-000000000514', '(1, 2, 3)', FALSE, 2),
  ('50000000-0000-4000-8000-000000001055', '50000000-0000-4000-8000-000000000514', '{1, 2, 3}', FALSE, 3),
  ('50000000-0000-4000-8000-000000001056', '50000000-0000-4000-8000-000000000514', '"1, 2, 3"', FALSE, 4),
  -- Q5 (513)q3: add dict key
  ('50000000-0000-4000-8000-000000001057', '50000000-0000-4000-8000-000000000515', 'prices["apple"] = 1.5', TRUE,  1),
  ('50000000-0000-4000-8000-000000001058', '50000000-0000-4000-8000-000000000515', 'prices.add("apple", 1.5)', FALSE, 2),
  ('50000000-0000-4000-8000-000000001059', '50000000-0000-4000-8000-000000000515', 'prices.append("apple", 1.5)', FALSE, 3),
  ('50000000-0000-4000-8000-000000001060', '50000000-0000-4000-8000-000000000515', 'insert prices[apple] = 1.5', FALSE, 4),
  -- Q6 (516): exception keyword
  ('50000000-0000-4000-8000-000000001061', '50000000-0000-4000-8000-000000000516', 'except', TRUE,  1),
  ('50000000-0000-4000-8000-000000001062', '50000000-0000-4000-8000-000000000516', 'catch', FALSE, 2),
  ('50000000-0000-4000-8000-000000001063', '50000000-0000-4000-8000-000000000516', 'handle', FALSE, 3),
  ('50000000-0000-4000-8000-000000001064', '50000000-0000-4000-8000-000000000516', 'rescue', FALSE, 4),
  -- Q6 (516)q2: "w" mode
  ('50000000-0000-4000-8000-000000001065', '50000000-0000-4000-8000-000000000517', 'Creates the file and truncates existing content', TRUE,  1),
  ('50000000-0000-4000-8000-000000001066', '50000000-0000-4000-8000-000000000517', 'Adds content to the end of the file', FALSE, 2),
  ('50000000-0000-4000-8000-000000001067', '50000000-0000-4000-8000-000000000517', 'Opens the file in read-only mode', FALSE, 3),
  ('50000000-0000-4000-8000-000000001068', '50000000-0000-4000-8000-000000000517', 'Raises an error if the file exists', FALSE, 4),
  -- Q6 (516)q3: with statement
  ('50000000-0000-4000-8000-000000001069', '50000000-0000-4000-8000-000000000518', 'The file is automatically closed when the block ends', TRUE,  1),
  ('50000000-0000-4000-8000-000000001070', '50000000-0000-4000-8000-000000000518', 'The file is deleted when the block ends', FALSE, 2),
  ('50000000-0000-4000-8000-000000001071', '50000000-0000-4000-8000-000000000518', 'The file must be closed manually with close()', FALSE, 3),
  ('50000000-0000-4000-8000-000000001072', '50000000-0000-4000-8000-000000000518', 'The file is opened without any checks', FALSE, 4),
  -- Q7 (519): instance setup
  ('50000000-0000-4000-8000-000000001073', '50000000-0000-4000-8000-000000000519', '__init__', TRUE,  1),
  ('50000000-0000-4000-8000-000000001074', '50000000-0000-4000-8000-000000000519', 'constructor()', FALSE, 2),
  ('50000000-0000-4000-8000-000000001075', '50000000-0000-4000-8000-000000000519', 'initialize', FALSE, 3),
  ('50000000-0000-4000-8000-000000001076', '50000000-0000-4000-8000-000000000519', '__construct__', FALSE, 4),
  -- Q7 (519)q2: inheritance syntax
  ('50000000-0000-4000-8000-000000001077', '50000000-0000-4000-8000-000000000520', 'class Child(Parent):', TRUE,  1),
  ('50000000-0000-4000-8000-000000001078', '50000000-0000-4000-8000-000000000520', 'class Child extends Parent:', FALSE, 2),
  ('50000000-0000-4000-8000-000000001079', '50000000-0000-4000-8000-000000000520', 'class Child inherits Parent:', FALSE, 3),
  ('50000000-0000-4000-8000-000000001080', '50000000-0000-4000-8000-000000000520', 'parent class Child:', FALSE, 4),
  -- Q7 (519)q3: dunder method
  ('50000000-0000-4000-8000-000000001081', '50000000-0000-4000-8000-000000000521', 'A method that customizes built-in behavior', TRUE,  1),
  ('50000000-0000-4000-8000-000000001082', '50000000-0000-4000-8000-000000000521', 'A method that only runs in debug mode', FALSE, 2),
  ('50000000-0000-4000-8000-000000001083', '50000000-0000-4000-8000-000000000521', 'A method that cannot be overridden', FALSE, 3),
  ('50000000-0000-4000-8000-000000001084', '50000000-0000-4000-8000-000000000521', 'A private method with two underscores', FALSE, 4),
  -- Q8 (522): comprehension
  ('50000000-0000-4000-8000-000000001085', '50000000-0000-4000-8000-000000000522', '[0, 1, 4, 9, 16]', TRUE,  1),
  ('50000000-0000-4000-8000-000000001086', '50000000-0000-4000-8000-000000000522', '[1, 2, 3, 4, 5]', FALSE, 2),
  ('50000000-0000-4000-8000-000000001087', '50000000-0000-4000-8000-000000000522', '[0, 1, 2, 3, 4]', FALSE, 3),
  ('50000000-0000-4000-8000-000000001088', '50000000-0000-4000-8000-000000000522', '[1, 4, 9, 16, 25]', FALSE, 4),
  -- Q8 (522)q2: random module
  ('50000000-0000-4000-8000-000000001089', '50000000-0000-4000-8000-000000000523', 'random', TRUE,  1),
  ('50000000-0000-4000-8000-000000001090', '50000000-0000-4000-8000-000000000523', 'math', FALSE, 2),
  ('50000000-0000-4000-8000-000000001091', '50000000-0000-4000-8000-000000000523', 'datetime', FALSE, 3),
  ('50000000-0000-4000-8000-000000001092', '50000000-0000-4000-8000-000000000523', 'json', FALSE, 4),
  -- Q8 (522)q3: namedtuple module
  ('50000000-0000-4000-8000-000000001093', '50000000-0000-4000-8000-000000000524', 'collections', TRUE,  1),
  ('50000000-0000-4000-8000-000000001094', '50000000-0000-4000-8000-000000000524', 'itertools', FALSE, 2),
  ('50000000-0000-4000-8000-000000001095', '50000000-0000-4000-8000-000000000524', 'functools', FALSE, 3),
  ('50000000-0000-4000-8000-000000001096', '50000000-0000-4000-8000-000000000524', 'tupletools', FALSE, 4),
  -- Q9 (525): immutable value
  ('50000000-0000-4000-8000-000000001097', '50000000-0000-4000-8000-000000000525', 'A tuple', TRUE,  1),
  ('50000000-0000-4000-8000-000000001098', '50000000-0000-4000-8000-000000000525', 'A list', FALSE, 2),
  ('50000000-0000-4000-8000-000000001099', '50000000-0000-4000-8000-000000000525', 'A dictionary', FALSE, 3),
  ('50000000-0000-4000-8000-000000001100', '50000000-0000-4000-8000-000000000525', 'A set', FALSE, 4),
  -- Q9 (525)q2: modulo
  ('50000000-0000-4000-8000-000000001101', '50000000-0000-4000-8000-000000000526', '1', TRUE,  1),
  ('50000000-0000-4000-8000-000000001102', '50000000-0000-4000-8000-000000000526', '3.33', FALSE, 2),
  ('50000000-0000-4000-8000-000000001103', '50000000-0000-4000-8000-000000000526', '0', FALSE, 3),
  ('50000000-0000-4000-8000-000000001104', '50000000-0000-4000-8000-000000000526', '7', FALSE, 4),
  -- Q9 (525)q3: exit a loop
  ('50000000-0000-4000-8000-000000001105', '50000000-0000-4000-8000-000000000527', 'break', TRUE,  1),
  ('50000000-0000-4000-8000-000000001106', '50000000-0000-4000-8000-000000000527', 'continue', FALSE, 2),
  ('50000000-0000-4000-8000-000000001107', '50000000-0000-4000-8000-000000000527', 'pass', FALSE, 3),
  ('50000000-0000-4000-8000-000000001108', '50000000-0000-4000-8000-000000000527', 'return', FALSE, 4),
  -- Q9 (525)q4: append to list
  ('50000000-0000-4000-8000-000000001109', '50000000-0000-4000-8000-000000000528', 'items.append(4)', TRUE,  1),
  ('50000000-0000-4000-8000-000000001110', '50000000-0000-4000-8000-000000000528', 'items += 4', FALSE, 2),
  ('50000000-0000-4000-8000-000000001111', '50000000-0000-4000-8000-000000000528', 'items.add(4)', FALSE, 3),
  ('50000000-0000-4000-8000-000000001112', '50000000-0000-4000-8000-000000000528', 'items.push(4)', FALSE, 4),
  -- Q9 (525)q5: read a file safely
  ('50000000-0000-4000-8000-000000001113', '50000000-0000-4000-8000-000000000529', 'with open("data.txt") as f: content = f.read()', TRUE,  1),
  ('50000000-0000-4000-8000-000000001114', '50000000-0000-4000-8000-000000000529', 'content = open("data.txt").read()', FALSE, 2),
  ('50000000-0000-4000-8000-000000001115', '50000000-0000-4000-8000-000000000529', 'f = open("data.txt"); content = f.read()', FALSE, 3),
  ('50000000-0000-4000-8000-000000001116', '50000000-0000-4000-8000-000000000529', 'content = read("data.txt")', FALSE, 4)
ON CONFLICT (id) DO NOTHING;
-- ============================================================================
-- SEED 055: Complete course — "C Programming from Scratch"
-- ----------------------------------------------------------------------------
-- Instructor : Marcus Johnson        (10000000-0000-4000-8000-000000000002)
-- Category   : Programming Fundamentals (20000000-0000-4000-8000-000000000002)
-- Level      : BEGINNER · Access : FREE · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Getting Started with C     → C1 History, Toolchain & First Program · C2 Variables, Types & I/O
--   M2 Operators & Control Flow   → C3 Operators & Expressions · C4 Conditionals & Loops
--   M3 Functions & Collections    → C5 Functions & Recursion · C6 Arrays & Strings
--   M4 Pointers & Memory          → C7 Pointers & Address Arithmetic · C8 Dynamic Memory & Structs
--   M5 Files, Debugging & Capstone→ C9 Files & Debugging · C10 Capstone: Console Task Manager
--
-- Content: 19 TEXT lessons with lesson_contents (self-contained HTML + inline
-- CSS, dollar-quoted so apostrophes need no escaping) and 9 QUIZ lessons with
-- 29 questions / 116 options across `quizzes` and `quiz_options`.
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
  '03700000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000002',
  '20000000-0000-4000-8000-000000000002',
  'C Programming from Scratch',
  'c-programming-from-scratch',
  'Learn the language that built Unix, Linux, and the modern software world. Start from your very first program and progress to pointers, dynamic memory, structs, file handling, and a complete console task manager.',
  'PUBLISHED',
  'BEGINNER',
  'FREE',
  53
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('03700000-0000-4000-8000-000000000011', '03700000-0000-4000-8000-000000000001', 'Write, compile, and run C programs with confidence on any toolchain.',      1),
  ('03700000-0000-4000-8000-000000000012', '03700000-0000-4000-8000-000000000001', 'Master variables, operators, conditionals, and loops in C.',                2),
  ('03700000-0000-4000-8000-000000000013', '03700000-0000-4000-8000-000000000001', 'Structure programs with functions, arrays, strings, and structs.',          3),
  ('03700000-0000-4000-8000-000000000014', '03700000-0000-4000-8000-000000000001', 'Understand pointers and manage memory safely with malloc and free.',        4),
  ('03700000-0000-4000-8000-000000000015', '03700000-0000-4000-8000-000000000001', 'Read and write files, debug with gdb, and ship a console task manager.',    5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('03700000-0000-4000-8000-000000000101', '03700000-0000-4000-8000-000000000001', 1, 'Getting Started with C',      'Meet C, install a toolchain, and write your first program.',      'PUBLISHED'),
  ('03700000-0000-4000-8000-000000000102', '03700000-0000-4000-8000-000000000001', 2, 'Operators & Control Flow',    'Compute values and steer the program with conditions and loops.', 'PUBLISHED'),
  ('03700000-0000-4000-8000-000000000103', '03700000-0000-4000-8000-000000000001', 3, 'Functions & Collections',     'Break problems into functions and store data in arrays.',         'PUBLISHED'),
  ('03700000-0000-4000-8000-000000000104', '03700000-0000-4000-8000-000000000001', 4, 'Pointers & Memory',           'Address variables, allocate the heap, and model data with structs.','PUBLISHED'),
  ('03700000-0000-4000-8000-000000000105', '03700000-0000-4000-8000-000000000001', 5, 'Files, Debugging & Capstone', 'Persist data, hunt bugs, and build a complete application.',      'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('03700000-0000-4000-8000-000000000201', '03700000-0000-4000-8000-000000000101', 1, 'History, Toolchain & First Program', 'Where C came from and how source becomes a program.', 'PUBLISHED'),
  ('03700000-0000-4000-8000-000000000202', '03700000-0000-4000-8000-000000000101', 2, 'Variables, Types & I/O',             'Store values and talk to the user with printf and scanf.', 'PUBLISHED'),
  ('03700000-0000-4000-8000-000000000203', '03700000-0000-4000-8000-000000000102', 1, 'Operators & Expressions',            'Arithmetic, logic, and the rules of evaluation.',      'PUBLISHED'),
  ('03700000-0000-4000-8000-000000000204', '03700000-0000-4000-8000-000000000102', 2, 'Conditionals & Loops',               'Make decisions and repeat work efficiently.',          'PUBLISHED'),
  ('03700000-0000-4000-8000-000000000205', '03700000-0000-4000-8000-000000000103', 1, 'Functions & Recursion',              'Reusable logic, scope, and functions that call themselves.', 'PUBLISHED'),
  ('03700000-0000-4000-8000-000000000206', '03700000-0000-4000-8000-000000000103', 2, 'Arrays & Strings',                   'Contiguous collections and C-style text handling.',    'PUBLISHED'),
  ('03700000-0000-4000-8000-000000000207', '03700000-0000-4000-8000-000000000104', 1, 'Pointers & Address Arithmetic',      'Understand memory addresses and pointer math.',        'PUBLISHED'),
  ('03700000-0000-4000-8000-000000000208', '03700000-0000-4000-8000-000000000104', 2, 'Dynamic Memory & Structs',           'Allocate at runtime and group related data.',          'PUBLISHED'),
  ('03700000-0000-4000-8000-000000000209', '03700000-0000-4000-8000-000000000105', 1, 'Files & Debugging',                  'Persist data to disk and inspect running programs.',   'PUBLISHED'),
  ('03700000-0000-4000-8000-000000000210', '03700000-0000-4000-8000-000000000105', 2, 'Capstone: Console Task Manager',     'Assemble everything into a real command-line app.',    'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 03700000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('03700000-0000-4000-8000-000000000301', '03700000-0000-4000-8000-000000000201', 1, 'The C Language & Your Toolchain',      'Discover why C still matters and how the compiler turns source into a program.', 'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('03700000-0000-4000-8000-000000000302', '03700000-0000-4000-8000-000000000201', 2, 'Your First C Program',                 'Write, compile, and run hello world line by line.',                              'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03700000-0000-4000-8000-000000000303', '03700000-0000-4000-8000-000000000201', 3, 'Getting Started Quiz',                 'Check your grasp of the language and the toolchain.',                            'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03700000-0000-4000-8000-000000000304', '03700000-0000-4000-8000-000000000202', 1, 'Variables & Data Types',               'Declare integers, floats, and characters and understand their limits.',          'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03700000-0000-4000-8000-000000000305', '03700000-0000-4000-8000-000000000202', 2, 'printf & scanf',                       'Format output and read typed input from the keyboard.',                          'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03700000-0000-4000-8000-000000000306', '03700000-0000-4000-8000-000000000202', 3, 'Types & I/O Quiz',                     'Verify your understanding of types and input/output.',                           'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03700000-0000-4000-8000-000000000307', '03700000-0000-4000-8000-000000000203', 1, 'Operators',                            'Arithmetic, relational, logical, assignment, and bitwise operators.',            'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03700000-0000-4000-8000-000000000308', '03700000-0000-4000-8000-000000000203', 2, 'Expressions & Type Conversion',        'Control how values convert between integer and floating point.',                 'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03700000-0000-4000-8000-000000000309', '03700000-0000-4000-8000-000000000203', 3, 'Operators Quiz',                       'Test your command of C operators and evaluation.',                               'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03700000-0000-4000-8000-000000000310', '03700000-0000-4000-8000-000000000204', 1, 'Conditionals',                         'Branch with if, else, switch, and the ternary operator.',                        'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03700000-0000-4000-8000-000000000311', '03700000-0000-4000-8000-000000000204', 2, 'Loops',                                'Repeat work with for, while, and do-while loops.',                               'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03700000-0000-4000-8000-000000000312', '03700000-0000-4000-8000-000000000204', 3, 'Control Flow Quiz',                    'Check how well you direct the flow of a program.',                               'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03700000-0000-4000-8000-000000000313', '03700000-0000-4000-8000-000000000205', 1, 'Functions',                            'Declare, define, and call functions with parameters and return values.',         'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03700000-0000-4000-8000-000000000314', '03700000-0000-4000-8000-000000000205', 2, 'Scope & Recursion',                    'Understand lifetime, visibility, and functions that call themselves.',           'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03700000-0000-4000-8000-000000000315', '03700000-0000-4000-8000-000000000205', 3, 'Functions Quiz',                       'Test your knowledge of functions, scope, and recursion.',                        'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03700000-0000-4000-8000-000000000316', '03700000-0000-4000-8000-000000000206', 1, 'Arrays',                               'Store many values of one type in contiguous memory.',                            'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03700000-0000-4000-8000-000000000317', '03700000-0000-4000-8000-000000000206', 2, 'Strings',                              'Work with C strings as null-terminated character arrays.',                       'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03700000-0000-4000-8000-000000000318', '03700000-0000-4000-8000-000000000206', 3, 'Arrays & Strings Quiz',                'Verify your array indexing and string handling.',                                'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03700000-0000-4000-8000-000000000319', '03700000-0000-4000-8000-000000000207', 1, 'Pointers',                             'Learn addresses, dereferencing, and why NULL matters.',                          'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03700000-0000-4000-8000-000000000320', '03700000-0000-4000-8000-000000000207', 2, 'Pointers & Arrays',                    'Walk memory with pointer arithmetic and pass arrays to functions.',              'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03700000-0000-4000-8000-000000000321', '03700000-0000-4000-8000-000000000207', 3, 'Pointers Quiz',                        'Prove you can follow an address to its value.',                                  'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03700000-0000-4000-8000-000000000322', '03700000-0000-4000-8000-000000000208', 1, 'Dynamic Memory',                       'Allocate the heap with malloc, calloc, realloc, and free.',                      'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03700000-0000-4000-8000-000000000323', '03700000-0000-4000-8000-000000000208', 2, 'Structs',                              'Group related fields and reach them through pointers.',                          'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03700000-0000-4000-8000-000000000324', '03700000-0000-4000-8000-000000000208', 3, 'Memory & Structs Quiz',                'Check your heap hygiene and struct syntax.',                                     'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03700000-0000-4000-8000-000000000325', '03700000-0000-4000-8000-000000000209', 1, 'File I/O',                             'Read and write text files safely with the stdio file API.',                      'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03700000-0000-4000-8000-000000000326', '03700000-0000-4000-8000-000000000209', 2, 'Debugging with gdb',                   'Turn on warnings and step through code with the GNU debugger.',                  'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03700000-0000-4000-8000-000000000327', '03700000-0000-4000-8000-000000000210', 1, 'Capstone: Console Task Manager',       'Plan the data model and assemble the complete application.',                     'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03700000-0000-4000-8000-000000000328', '03700000-0000-4000-8000-000000000210', 2, 'Final Assessment',                     'Prove what you learned across the whole course.',                                'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 03700000-…-0401 .. 0427)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '03700000-0000-4000-8000-000000000401',
  '03700000-0000-4000-8000-000000000301',
  1,
  'The C Language & Your Toolchain',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The C Language &amp; Your Toolchain</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #0d9488; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #042f2e; color: #5eead4; }
.dark .lesson-page .callout { background: #042f2e; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #042f2e; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>The C Language &amp; Your Toolchain</h1>
  <p>C is a small, fast, and remarkably long-lived language. It was created to write operating systems, and it still powers the kernels, databases, and embedded devices that everything else runs on. Learning C teaches you what actually happens when a program runs — memory, addresses, and bytes are right there in front of you.</p>
  <h2>A short history</h2>
  <ul>
    <li><strong>1972</strong> — Dennis Ritchie creates C at Bell Labs to build the Unix operating system.</li>
    <li><strong>1978</strong> — <em>The C Programming Language</em> (K&amp;R) becomes the de-facto reference.</li>
    <li><strong>1989</strong> — ANSI standardizes the language, later known as C89 / C90.</li>
    <li><strong>1999 onward</strong> — C99, C11, C17, and C23 add modern features while staying compatible.</li>
  </ul>
  <h2>Why learn C in a world of Python and JavaScript?</h2>
  <ul>
    <li>It reveals how memory, the stack, and the heap really work.</li>
    <li>It is the foundation of operating systems, embedded firmware, and other languages.</li>
    <li>Its discipline — types, pointers, explicit allocation — makes you a sharper programmer everywhere.</li>
  </ul>
  <h2>The compilation pipeline</h2>
  <p>Unlike interpreted languages, C source must be translated into machine code before it runs. One command hides four steps:</p>
  <pre class="code-block">hello.c  →  [preprocess]  →  [compile]  →  [assemble]  →  [link]  →  a.out</pre>
  <table>
    <tr><th>Stage</th><th>Tool</th><th>Output</th></tr>
    <tr><td>Preprocess</td><td>cpp</td><td>Expanded source (<span class="ic">#include</span>, macros)</td></tr>
    <tr><td>Compile</td><td>cc1</td><td>Assembly for your CPU</td></tr>
    <tr><td>Assemble</td><td>as</td><td>An object file (<span class="ic">.o</span>)</td></tr>
    <tr><td>Link</td><td>ld</td><td>A runnable executable</td></tr>
  </table>
  <h2>Install a toolchain</h2>
  <ul>
    <li><strong>Linux</strong> — <span class="ic">gcc</span> is usually preinstalled; otherwise install <span class="ic">build-essential</span>.</li>
    <li><strong>macOS</strong> — install the Xcode command line tools to get <span class="ic">clang</span>.</li>
    <li><strong>Windows</strong> — use WSL, MSYS2 (MinGW), or the MSVC build tools.</li>
  </ul>
  <pre class="code-block">gcc --version
# gcc (GCC) 13.2.0
# Copyright (C) 2023 Free Software Foundation, Inc.</pre>
  <div class="callout callout-info">
    <strong>ANSI C</strong>
    <p>This course targets standard C. Your compiler may default to an older standard; add <span class="ic">-std=c17</span> to be explicit.</p>
  </div>
  <div class="callout callout-tip">
    <strong>One terminal, one folder</strong>
    <p>Create a folder such as <span class="ic">c-course</span> and run every example from there. Keeping source and executables together makes the compile commands in this course predictable.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03700000-0000-4000-8000-000000000402',
  '03700000-0000-4000-8000-000000000302',
  1,
  'Your First C Program',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Your First C Program</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #0d9488; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #042f2e; color: #5eead4; }
.dark .lesson-page .callout { background: #042f2e; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #042f2e; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Your First C Program</h1>
  <p>Tradition demands that your first program greets the world. Save this as <span class="ic">hello.c</span>.</p>
  <pre class="code-block">#include &lt;stdio.h&gt;

int main(void) {
    printf("Hello, world!\n");
    return 0;
}</pre>
  <h2>Line by line</h2>
  <ul>
    <li><span class="ic">#include &lt;stdio.h&gt;</span> — a preprocessor directive that pulls in the declarations for input and output.</li>
    <li><span class="ic">int main(void)</span> — the entry point. Execution starts here; <span class="ic">void</span> means no parameters.</li>
    <li><span class="ic">{ }</span> — braces delimit the body of the function.</li>
    <li><span class="ic">printf(...)</span> — prints the text between the quotes. <span class="ic">\n</span> is a newline.</li>
    <li><span class="ic">return 0</span> — reports success to the operating system. A non-zero value signals an error.</li>
  </ul>
  <h2>Compile and run</h2>
  <pre class="code-block">gcc -Wall -Wextra -o hello hello.c
./hello
# Hello, world!</pre>
  <div class="callout">
    <strong>Read the flags</strong>
    <p><span class="ic">-Wall</span> and <span class="ic">-Wextra</span> enable warnings. Compile with them from day one — the compiler catches many bugs before your program ever runs.</p>
  </div>
  <h2>Comments</h2>
  <pre class="code-block">// A single-line comment (C99 and later)

/* A block comment
   that spans several lines. */</pre>
  <h2>Common first errors</h2>
  <table>
    <tr><th>Message</th><th>Cause</th></tr>
    <tr><td>expected ';' before ...</td><td>A missing semicolon at the end of a statement.</td></tr>
    <tr><td>'printf' undeclared</td><td>The <span class="ic">#include &lt;stdio.h&gt;</span> line is missing.</td></tr>
    <tr><td>undefined reference to 'main'</td><td>The function is not named <span class="ic">main</span> or is mis-typed.</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>C is case-sensitive</strong>
    <p><span class="ic">Main</span>, <span class="ic">MAIN</span>, and <span class="ic">main</span> are three different names. Almost every identifier in C is lowercase by convention.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03700000-0000-4000-8000-000000000404',
  '03700000-0000-4000-8000-000000000304',
  1,
  'Variables & Data Types',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Variables &amp; Data Types</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #0d9488; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #042f2e; color: #5eead4; }
.dark .lesson-page .callout { background: #042f2e; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #042f2e; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Variables &amp; Data Types</h1>
  <p>Every value in C has a <strong>type</strong>, and every variable must be declared with that type before it is used. The type decides how much memory the value occupies and how the bits are interpreted.</p>
  <h2>Declaring and initializing</h2>
  <pre class="code-block">int   age      = 30;       // an integer
float price    = 19.99f;   // single-precision real
double pi      = 3.14159;  // double-precision real
char  grade    = 'A';      // one character

int count;                 // declared, but uninitialized
count = 10;                // assigned later

int a = 1, b = 2, c = 3;   // several at once</pre>
  <div class="callout">
    <strong>Always initialize</strong>
    <p>An uninitialized local variable holds garbage — whatever bits happened to be in that memory. Reading it is undefined behavior and a classic source of mysterious bugs.</p>
  </div>
  <h2>The fundamental types</h2>
  <table>
    <tr><th>Type</th><th>Typical size</th><th>Stores</th></tr>
    <tr><td>char</td><td>1 byte</td><td>A single character or small integer</td></tr>
    <tr><td>int</td><td>4 bytes</td><td>Whole numbers, usually ±2 billion</td></tr>
    <tr><td>float</td><td>4 bytes</td><td>Real numbers, about 7 digits</td></tr>
    <tr><td>double</td><td>8 bytes</td><td>Real numbers, about 15 digits</td></tr>
    <tr><td>void</td><td>—</td><td>No value (used for functions)</td></tr>
  </table>
  <p>Prefixes and qualifiers refine them:</p>
  <pre class="code-block">short int     small;        // at least 2 bytes
long int      large;        // at least 4 bytes, often 8
unsigned int  nonNegative;  // 0 .. ~4 billion
signed char   maybeNeg;</pre>
  <h2>sizeof and limits</h2>
  <p><span class="ic">sizeof</span> reports the size in bytes; <span class="ic">limits.h</span> and <span class="ic">float.h</span> define the exact ranges for your platform.</p>
  <pre class="code-block">#include &lt;stdio.h&gt;
#include &lt;limits.h&gt;

int main(void) {
    printf("int is %zu bytes\n", sizeof(int));
    printf("int max is %d\n", INT_MAX);
    return 0;
}</pre>
  <h2>Naming rules</h2>
  <ul>
    <li>Names may contain letters, digits, and underscores, but cannot start with a digit.</li>
    <li>They are case-sensitive and cannot be a keyword such as <span class="ic">int</span> or <span class="ic">return</span>.</li>
    <li>Choose descriptive names: <span class="ic">total_minutes</span>, not <span class="ic">tm</span>.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Use double by default</strong>
    <p>Unless memory is tight, prefer <span class="ic">double</span> over <span class="ic">float</span> for real numbers. It has more precision and avoids surprising rounding errors in calculations.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03700000-0000-4000-8000-000000000405',
  '03700000-0000-4000-8000-000000000305',
  1,
  'printf & scanf',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>printf &amp; scanf</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #0d9488; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #042f2e; color: #5eead4; }
.dark .lesson-page .callout { background: #042f2e; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #042f2e; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>printf &amp; scanf</h1>
  <p>Programs are useless without input and output. C gives you two workhorses from <span class="ic">&lt;stdio.h&gt;</span>: <span class="ic">printf</span> to write formatted text and <span class="ic">scanf</span> to read typed values.</p>
  <h2>printf basics</h2>
  <p>The first argument is a <em>format string</em>. Each <span class="ic">%</span> placeholder consumes one of the values that follow.</p>
  <pre class="code-block">int    items = 3;
double price = 4.50;
char   code  = 'B';

printf("Order: %d items\n", items);
printf("Total: %.2f currency\n", items * price);
printf("Code:  %c\n", code);</pre>
  <h2>Common format specifiers</h2>
  <table>
    <tr><th>Specifier</th><th>Prints</th></tr>
    <tr><td>%d / %i</td><td>signed integer</td></tr>
    <tr><td>%u</td><td>unsigned integer</td></tr>
    <tr><td>%f</td><td>floating point (default 6 decimals)</td></tr>
    <tr><td>%e</td><td>scientific notation</td></tr>
    <tr><td>%c</td><td>a single character</td></tr>
    <tr><td>%s</td><td>a string</td></tr>
    <tr><td>%%</td><td>a literal percent sign</td></tr>
  </table>
  <h2>Width and precision</h2>
  <pre class="code-block">printf("%5d\n", 42);          // "   42"  right-aligned in 5 columns
printf("%-5d|\n", 42);        // "42   |" left-aligned
printf("%08.2f\n", 3.14159);  // "00003.14"
printf("%.3s\n", "hello");    // "hel"</pre>
  <h2>Reading input with scanf</h2>
  <p><span class="ic">scanf</span> takes the same placeholders but needs the <strong>address</strong> of each variable, written with <span class="ic">&amp;</span>.</p>
  <pre class="code-block">int age;
double height;

printf("Enter your age: ");
scanf("%d", &amp;age);

printf("Enter your height in metres: ");
scanf("%lf", &amp;height);

printf("You are %d years old and %.2f m tall.\n", age, height);</pre>
  <div class="callout">
    <strong>The ampersand is mandatory</strong>
    <p>Forgetting <span class="ic">&amp;</span> passes the value instead of the address. The compiler often cannot catch it, and the program may crash or corrupt memory. Remember: <span class="ic">scanf</span> needs somewhere to store the result.</p>
  </div>
  <h2>Reading a string</h2>
  <p><span class="ic">scanf("%s", ...)</span> stops at the first space, so use <span class="ic">fgets</span> to read a whole line safely into a buffer.</p>
  <pre class="code-block">char name[64];

printf("Enter your full name: ");
if (fgets(name, sizeof name, stdin) != NULL) {
    printf("Hello, %s", name);   // fgets keeps the newline
}</pre>
  <div class="callout callout-tip">
    <strong>floating point with scanf needs %lf</strong>
    <p>In <span class="ic">printf</span> you use <span class="ic">%f</span> for a double, but in <span class="ic">scanf</span> you must use <span class="ic">%lf</span>. It is an easy detail to miss.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03700000-0000-4000-8000-000000000407',
  '03700000-0000-4000-8000-000000000307',
  1,
  'Operators',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Operators</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #0d9488; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #042f2e; color: #5eead4; }
.dark .lesson-page .callout { background: #042f2e; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #042f2e; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Operators</h1>
  <p>Operators are the verbs of a programming language. C groups them into a few families, and understanding their precedence lets you read and write expressions correctly.</p>
  <h2>Arithmetic</h2>
  <pre class="code-block">int sum  = 7 + 3;    // 10
int diff = 7 - 3;    // 4
int prod = 7 * 3;    // 21
int quot = 7 / 3;    // 2   -- integer division truncates
int rem  = 7 % 3;    // 1   -- remainder (modulo)</pre>
  <h2>Relational and logical</h2>
  <p>Relational operators produce <span class="ic">1</span> for true and <span class="ic">0</span> for false. Combine them with logical operators.</p>
  <pre class="code-block">int a = 5, b = 8;

int less     = a &lt; b;             // 1
int equal    = a == b;            // 0
int notEqual = a != b;            // 1
int inRange  = (a &gt; 0 &amp;&amp; b &lt; 10); // 1 (both true)
int either   = (a &gt; 10 || b &gt; 5); // 1 (one true)
int inverted = !less;             // 0</pre>
  <div class="callout">
    <strong>= versus ==</strong>
    <p>A single <span class="ic">=</span> assigns; a double <span class="ic">==</span> compares. Writing <span class="ic">if (x = 5)</span> assigns five and is always true — a bug the compiler warns about with <span class="ic">-Wall</span>.</p>
  </div>
  <h2>Assignment and increment</h2>
  <pre class="code-block">int n = 10;
n += 5;    // n is now 15
n -= 3;    // 12
n *= 2;    // 24
n /= 4;    // 6

int i = 0;
i++;       // post-increment: yields 0, then i becomes 1
++i;       // pre-increment: i becomes 2, yields 2</pre>
  <h2>Bitwise operators</h2>
  <p>These act on the individual bits of integers. They are essential for flags and low-level work.</p>
  <pre class="code-block">unsigned int flags = 0b0101;   // binary literal (C23) or 5

flags = flags | 0x2;    // set a bit
flags = flags &amp; ~0x1;   // clear a bit
flags = flags ^ 0x4;    // toggle a bit
int low = flags &amp; 0x1;  // test a bit</pre>
  <h2>Precedence at a glance</h2>
  <table>
    <tr><th>Priority</th><th>Operators</th></tr>
    <tr><td>Highest</td><td>() then ++ -- ! (type casts)</td></tr>
    <tr><td></td><td>* / %</td></tr>
    <tr><td></td><td>+ -</td></tr>
    <tr><td></td><td>&lt; &lt;= &gt; &gt;=</td></tr>
    <tr><td></td><td>== !=</td></tr>
    <tr><td></td><td>&amp;&amp;</td></tr>
    <tr><td></td><td>||</td></tr>
    <tr><td>Lowest</td><td>= += -= ...</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Parenthesize for clarity</strong>
    <p>Even when you remember precedence, your reader might not. Write <span class="ic">(a + b) * c</span> rather than relying on the rules.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03700000-0000-4000-8000-000000000408',
  '03700000-0000-4000-8000-000000000308',
  1,
  'Expressions & Type Conversion',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Expressions &amp; Type Conversion</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #0d9488; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #042f2e; color: #5eead4; }
.dark .lesson-page .callout { background: #042f2e; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Expressions &amp; Type Conversion</h1>
  <p>When an expression mixes types, C quietly converts values according to a set of rules. Knowing those rules prevents the single most common beginner bug: integer division that silently drops the fraction.</p>
  <h2>Integer vs floating division</h2>
  <pre class="code-block">int    a = 5, b = 2;
double good = (double)a / b;   // 2.5
double bad  = a / b;           // 2.0 — the division happens first!</pre>
  <p>Both operands are integers, so the result is an integer and the fraction is truncated <em>before</em> it is stored in the double.</p>
  <h2>Explicit casts</h2>
  <p>A cast converts a value to another type for a single expression:</p>
  <pre class="code-block">double ratio = (double)correct / total * 100.0;
int    whole = (int)3.99;      // 3 — truncates toward zero
char   ch    = (char)65;       // 'A'</pre>
  <div class="callout">
    <strong>Casts truncate, they do not round</strong>
    <p>Converting <span class="ic">3.99</span> to an int gives <span class="ic">3</span>. To round, use <span class="ic">round()</span> from <span class="ic">&lt;math.h&gt;</span> (and link with <span class="ic">-lm</span>).</p>
  </div>
  <h2>Implicit promotion</h2>
  <p>In a binary operation, the smaller type is promoted to the larger one. The usual order is:</p>
  <pre class="code-block">char → short → int → long → long long → float → double → long double</pre>
  <pre class="code-block">double result = 3 + 0.5;   // 3 is promoted to 3.0, result is 3.5
printf("%.1f\n", result);</pre>
  <h2>Overflow and truncation</h2>
  <pre class="code-block">int big = 2000000000;
big = big + big;          // wraps around — undefined for signed int
printf("%d\n", big);      // not the 4 billion you expected

unsigned char tiny = 300; // stored modulo 256, becomes 44</pre>
  <div class="callout callout-tip">
    <strong>Do the cast early</strong>
    <p>When you want floating-point math, cast one operand at the start: <span class="ic">(double)a / b</span>. Casting the result afterwards is too late.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03700000-0000-4000-8000-000000000410',
  '03700000-0000-4000-8000-000000000310',
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
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #0d9488; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #042f2e; color: #5eead4; }
.dark .lesson-page .callout { background: #042f2e; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Conditionals</h1>
  <p>A conditional lets a program choose between paths. C provides <span class="ic">if</span>, <span class="ic">switch</span>, and the ternary operator, each suited to a different situation.</p>
  <h2>if / else if / else</h2>
  <pre class="code-block">int score = 72;

if (score &gt;= 90) {
    printf("Grade A\n");
} else if (score &gt;= 80) {
    printf("Grade B\n");
} else if (score &gt;= 70) {
    printf("Grade C\n");
} else {
    printf("Keep practising\n");
}</pre>
  <p>Use braces even for a single statement. Omitting them invites bugs when a second line is added later.</p>
  <h2>Comparing floating point</h2>
  <div class="callout">
    <strong>Never test floats with ==</strong>
    <p>Values such as <span class="ic">0.1 + 0.2</span> are rarely exactly equal to <span class="ic">0.3</span>. Compare the absolute difference against a small tolerance instead.</p>
  </div>
  <pre class="code-block">#include &lt;math.h&gt;

if (fabs(a - b) &lt; 1e-9) {
    printf("Close enough\n");
}</pre>
  <h2>switch</h2>
  <p>When one integer variable is compared against several constant cases, <span class="ic">switch</span> reads more clearly than a chain of <span class="ic">else if</span>.</p>
  <pre class="code-block">char op = '+';
int  x = 6, y = 3;

switch (op) {
    case '+': printf("%d\n", x + y); break;
    case '-': printf("%d\n", x - y); break;
    case '*': printf("%d\n", x * y); break;
    case '/':
        if (y != 0) printf("%d\n", x / y);
        else        printf("Cannot divide by zero\n");
        break;
    default:  printf("Unknown operator\n"); break;
}</pre>
  <div class="callout callout-info">
    <strong>Do not forget break</strong>
    <p>Without a <span class="ic">break</span>, execution falls through to the next case. That is occasionally useful, but usually a bug.</p>
  </div>
  <h2>The ternary operator</h2>
  <p>For a simple either/or value, the ternary keeps the code compact:</p>
  <pre class="code-block">int age = 20;
const char *category = (age &gt;= 18) ? "adult" : "minor";
printf("%s\n", category);</pre>
  <div class="callout callout-tip">
    <strong>Prefer clarity</strong>
    <p>The ternary is great for choosing one of two values, but nesting them makes code hard to read. Use an <span class="ic">if</span> statement when the branches get complex.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03700000-0000-4000-8000-000000000411',
  '03700000-0000-4000-8000-000000000311',
  1,
  'Loops',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Loops</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #0d9488; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #042f2e; color: #5eead4; }
.dark .lesson-page .callout { background: #042f2e; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Loops</h1>
  <p>Loops repeat a block of code. C offers three forms, and choosing the right one makes intent obvious.</p>
  <h2>for — when you know how many times</h2>
  <pre class="code-block">for (int i = 1; i &lt;= 5; i++) {
    printf("Day %d\n", i);
}</pre>
  <p>The three clauses are initialization, condition, and update. All are optional but the semicolons are not.</p>
  <h2>while — repeat while a condition holds</h2>
  <pre class="code-block">int energy = 100;
while (energy &gt; 0) {
    printf("Working... %d left\n", energy);
    energy -= 25;
}</pre>
  <h2>do-while — run at least once</h2>
  <p>The condition is checked <em>after</em> the body, so the body always executes at least one time. This is ideal for menus.</p>
  <pre class="code-block">int choice;
do {
    printf("1) Play  2) Quit\n&gt; ");
    scanf("%d", &amp;choice);
} while (choice != 2);</pre>
  <h2>break and continue</h2>
  <pre class="code-block">for (int i = 1; i &lt;= 10; i++) {
    if (i == 5) continue;   // skip the rest of this iteration
    if (i == 8) break;      // stop the loop entirely
    printf("%d ", i);       // prints 1 2 3 4 6 7
}</pre>
  <h2>Nested loops</h2>
  <pre class="code-block">for (int row = 1; row &lt;= 3; row++) {
    for (int col = 1; col &lt;= 3; col++) {
        printf("%d ", row * col);
    }
    printf("\n");
}</pre>
  <div class="callout callout-info">
    <strong>Infinite loops</strong>
    <p><span class="ic">while (1)</span> loops forever until a <span class="ic">break</span> (or <span class="ic">return</span>) exits it. Make sure the condition or the body guarantees progress, or your program will hang.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Off-by-one errors</strong>
    <p>Decide whether your range is inclusive before you write the condition. <span class="ic">i &lt; n</span> visits n elements starting at zero; <span class="ic">i &lt;= n</span> visits n items starting at one.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03700000-0000-4000-8000-000000000413',
  '03700000-0000-4000-8000-000000000313',
  1,
  'Functions',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Functions</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #0d9488; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #042f2e; color: #5eead4; }
.dark .lesson-page .callout { background: #042f2e; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Functions</h1>
  <p>A function is a named block of code that performs one task. Functions let you avoid repetition, name your intent, and test logic in isolation.</p>
  <h2>Prototype, definition, and call</h2>
  <p>A <strong>prototype</strong> tells the compiler a function exists before it is used. The <strong>definition</strong> contains the body.</p>
  <pre class="code-block">#include &lt;stdio.h&gt;

double rectangle_area(double width, double height);   // prototype

int main(void) {
    double area = rectangle_area(4.0, 2.5);           // call
    printf("Area = %.2f\n", area);
    return 0;
}

double rectangle_area(double width, double height) {  // definition
    return width * height;
}</pre>
  <h2>Return values and void</h2>
  <ul>
    <li>A function returns a single value with <span class="ic">return</span>.</li>
    <li><span class="ic">return</span> ends the function immediately.</li>
    <li>Use <span class="ic">void</span> when a function returns nothing.</li>
  </ul>
  <pre class="code-block">void print_line(int length) {
    for (int i = 0; i &lt; length; i++) {
        putchar('-');
    }
    putchar('\n');
}</pre>
  <h2>Pass by value</h2>
  <p>C passes arguments by value: the function receives a <em>copy</em>. Changing a parameter never changes the caller variable.</p>
  <pre class="code-block">void double_it(int n) {
    n = n * 2;               // changes only the local copy
}

int main(void) {
    int value = 5;
    double_it(value);
    printf("%d\n", value);   // still 5
    return 0;
}</pre>
  <div class="callout">
    <strong>To change the caller, pass an address</strong>
    <p>Because arguments are copied, functions that must modify the caller value take a pointer and dereference it. You will do this in the pointers module.</p>
  </div>
  <div class="callout callout-tip">
    <strong>One task, one name</strong>
    <p>A function called <span class="ic">compute_invoice_total</span> should do exactly that. If you struggle to name it without the word &ldquo;and&rdquo;, split it in two.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03700000-0000-4000-8000-000000000414',
  '03700000-0000-4000-8000-000000000314',
  1,
  'Scope & Recursion',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Scope &amp; Recursion</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #0d9488; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #042f2e; color: #5eead4; }
.dark .lesson-page .callout { background: #042f2e; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Scope &amp; Recursion</h1>
  <p>Where a name can be seen, and for how long it lives, is its <strong>scope</strong>. Recursion, in turn, is a technique where a function solves a problem by calling itself on a smaller version of it.</p>
  <h2>Local variables</h2>
  <p>A variable declared inside a function exists only during that call. Each call gets a fresh copy.</p>
  <pre class="code-block">void count_up(void) {
    int counter = 0;      // created on every call
    counter++;
    printf("%d\n", counter);
}

count_up();   // 1
count_up();   // 1 — it did not remember</pre>
  <h2>Global variables</h2>
  <p>Declared outside every function, globals are visible everywhere and live for the whole program. Use them sparingly — they make programs hard to reason about.</p>
  <pre class="code-block">int total = 0;            // global

void add(int n) {
    total += n;           // reaches the global
}</pre>
  <h2>static — remember between calls</h2>
  <pre class="code-block">void tick(void) {
    static int calls = 0; // initialized once, keeps its value
    calls++;
    printf("Call number %d\n", calls);
}</pre>
  <div class="callout callout-info">
    <strong>Block scope</strong>
    <p>A variable declared inside <span class="ic">{ }</span> is visible only until the closing brace. Reusing a short name like <span class="ic">i</span> in separate loops is therefore fine.</p>
  </div>
  <h2>Recursion</h2>
  <p>Every recursive function needs a <strong>base case</strong> that stops the recursion, plus a step that moves closer to it.</p>
  <pre class="code-block">long factorial(int n) {
    if (n &lt;= 1) return 1;          // base case
    return n * factorial(n - 1);   // recursive case
}

printf("%ld\n", factorial(5));     // 120</pre>
  <h2>The call stack</h2>
  <p>Each call adds a frame to the call stack. <span class="ic">factorial(5)</span> stacks five frames before any multiplication happens, then unwinds them on the way back.</p>
  <pre class="code-block">factorial(5)
  factorial(4)
    factorial(3)
      factorial(2)
        factorial(1)  -> returns 1
      returns 2
    returns 6
  returns 24
returns 120</pre>
  <div class="callout">
    <strong>Stack overflow</strong>
    <p>Recursion without a reachable base case — or too deep for the stack — crashes the program. Always verify the base case and that each call gets smaller.</p>
  </div>
  <div class="callout callout-tip">
    <strong>When to use recursion</strong>
    <p>Recursion shines on tree-shaped problems and divide-and-conquer algorithms. For simple counting, an ordinary loop is usually clearer and faster.</p>
  </div>
</div>
</body>
</html>
$html$
),
-- @@CONTENT@@

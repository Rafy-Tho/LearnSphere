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
(
  '03700000-0000-4000-8000-000000000416',
  '03700000-0000-4000-8000-000000000316',
  1,
  'Arrays',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Arrays</title>
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
  <h1>Arrays</h1>
  <p>An array stores a fixed number of values of the same type in one contiguous block of memory. Because the elements sit side by side, they can be accessed instantly by index.</p>
  <h2>Declaring and initializing</h2>
  <pre class="code-block">int    scores[5];                     // five uninitialized ints
int    primes[4] = {2, 3, 5, 7};      // explicit values
int    zeros[10] = {0};               // first is 0, rest filled with 0
int    more[] = {1, 1, 2, 3, 5, 8};   // size inferred as 6</pre>
  <h2>Indexing starts at zero</h2>
  <pre class="code-block">int primes[4] = {2, 3, 5, 7};

printf("%d\n", primes[0]);   // 2  — the first element
printf("%d\n", primes[3]);   // 7  — the last element

primes[1] = 11;              // overwrite the second element</pre>
  <h2>Iterating</h2>
  <pre class="code-block">int numbers[5] = {10, 20, 30, 40, 50};
int sum = 0;

for (int i = 0; i &lt; 5; i++) {
    sum += numbers[i];
}
printf("Total = %d\n", sum);   // 150</pre>
  <h2>Size and element count</h2>
  <pre class="code-block">int numbers[5];

size_t bytes = sizeof numbers;                   // 20 (5 * 4)
size_t count = sizeof numbers / sizeof numbers[0]; // 5</pre>
  <p>This only works where the array type is still known. Once an array is passed to a function it decays to a pointer, and you must pass the length separately.</p>
  <pre class="code-block">int sum_array(const int values[], size_t count) {
    int total = 0;
    for (size_t i = 0; i &lt; count; i++) {
        total += values[i];
    }
    return total;
}</pre>
  <div class="callout">
    <strong>C does not check bounds</strong>
    <p>Accessing <span class="ic">primes[4]</span> on a four-element array is undefined behavior. The compiler will not stop you, and the program may read or corrupt unrelated memory.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pass the length</strong>
    <p>Whenever you hand an array to a function, also hand it the element count. Functions have no reliable way to discover the length on their own.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03700000-0000-4000-8000-000000000417',
  '03700000-0000-4000-8000-000000000317',
  1,
  'Strings',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Strings</title>
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
  <h1>Strings</h1>
  <p>C has no built-in string type. A string is simply an array of <span class="ic">char</span> whose last element is the <strong>null terminator</strong>, the character <span class="ic">'\0'</span>.</p>
  <h2>A string is a char array</h2>
  <pre class="code-block">char greeting[6] = {'H', 'e', 'l', 'l', 'o', '\0'};
char same[]     = "Hello";   // the compiler adds '\0' for you</pre>
  <p>Both arrays hold six bytes. The visible text is five characters; the sixth marks the end.</p>
  <h2>The null terminator</h2>
  <pre class="code-block">"Hello"
 H   e   l   l   o   \0
[0] [1] [2] [3] [4] [5]</pre>
  <p>Every string function walks the array until it sees <span class="ic">'\0'</span>. Forget it and functions will read past the end of your buffer.</p>
  <h2>Useful functions from string.h</h2>
  <table>
    <tr><th>Function</th><th>Purpose</th></tr>
    <tr><td>strlen(s)</td><td>number of characters before <span class="ic">'\0'</span></td></tr>
    <tr><td>strcpy(dst, src)</td><td>copy a string (ensure dst is large enough)</td></tr>
    <tr><td>strcat(dst, src)</td><td>append src to the end of dst</td></tr>
    <tr><td>strcmp(a, b)</td><td>0 if equal, negative/positive if ordered</td></tr>
  </table>
  <pre class="code-block">#include &lt;string.h&gt;

char name[32] = "Ada";

printf("%zu\n", strlen(name));      // 3

strcat(name, " Lovelace");
printf("%s\n", name);               // "Ada Lovelace"

if (strcmp(name, "Ada Lovelace") == 0) {
    printf("Match\n");
}</pre>
  <div class="callout">
    <strong>Strings are not values</strong>
    <p>You cannot assign one array to another with <span class="ic">=</span> or compare them with <span class="ic">==</span>. Use <span class="ic">strcpy</span> to copy and <span class="ic">strcmp</span> to compare.</p>
  </div>
  <h2>Reading a line safely with fgets</h2>
  <pre class="code-block">char line[100];

printf("Your name: ");
if (fgets(line, sizeof line, stdin) != NULL) {
    line[strcspn(line, "\n")] = '\0';   // remove the newline
    printf("Hello, %s!\n", line);
}</pre>
  <div class="callout callout-tip">
    <strong>Never use gets</strong>
    <p><span class="ic">gets</span> cannot limit how many characters it reads, so it overflows buffers and was removed from the C standard. Always prefer <span class="ic">fgets</span>.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03700000-0000-4000-8000-000000000419',
  '03700000-0000-4000-8000-000000000319',
  1,
  'Pointers',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pointers</title>
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
  <h1>Pointers</h1>
  <p>Every variable lives at a memory address. A <strong>pointer</strong> is a variable that stores such an address instead of a plain value. Two operators drive the whole idea: <span class="ic">&amp;</span> takes an address, <span class="ic">*</span> follows one.</p>
  <h2>Addresses with &amp;</h2>
  <pre class="code-block">int value = 42;

printf("%p\n", (void *)&amp;value);   // some address like 0x7ffc8f1a</pre>
  <h2>Declaring and dereferencing</h2>
  <pre class="code-block">int  value = 42;
int *ptr   = &amp;value;    // ptr stores the address of value

printf("%d\n", *ptr);   // 42 — dereference: follow ptr to the value

*ptr = 99;              // writes THROUGH the pointer
printf("%d\n", value);  // 99 — value changed too</pre>
  <h2>NULL — a pointer worth nothing</h2>
  <p>A pointer that does not yet hold a real address must be initialized to <span class="ic">NULL</span> or <span class="ic">0</span>. Dereferencing NULL crashes the program.</p>
  <pre class="code-block">int *ptr = NULL;

if (ptr != NULL) {
    printf("%d\n", *ptr);   // safe
} else {
    printf("Not pointing anywhere\n");
}</pre>
  <div class="callout">
    <strong>Check before you dereference</strong>
    <p>Functions like <span class="ic">malloc</span> return NULL on failure. Always test the result before using a pointer — this single habit prevents a whole class of crashes.</p>
  </div>
  <h2>Why pointers matter</h2>
  <ul>
    <li>They let a function modify a caller variable (pass by reference).</li>
    <li>They let programs share one copy of large data instead of copying it.</li>
    <li>They are how arrays, strings, and dynamic memory all work under the hood.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Read declarations right to left</strong>
    <p><span class="ic">int *ptr</span> means &ldquo;ptr is a pointer to an int.&rdquo; The star binds to the variable name, not to the int.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03700000-0000-4000-8000-000000000420',
  '03700000-0000-4000-8000-000000000320',
  1,
  'Pointers & Arrays',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pointers &amp; Arrays</title>
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
  <h1>Pointers &amp; Arrays</h1>
  <p>Arrays and pointers are close cousins in C. When you use an array name, C silently converts it to the address of its first element. Indexing is just pointer arithmetic in disguise.</p>
  <h2>The array name is an address</h2>
  <pre class="code-block">int scores[3] = {90, 95, 91};
int *p = scores;          // same as &amp;scores[0]

printf("%d\n", *p);       // 90 — first element</pre>
  <h2>Pointer arithmetic</h2>
  <p>Adding one to an <span class="ic">int *</span> moves it forward by one int (four bytes), not one byte. The compiler scales by the size of the pointed-to type.</p>
  <pre class="code-block">int scores[3] = {90, 95, 91};

printf("%d\n", *(scores + 1));   // 95 — same as scores[1]
printf("%d\n", scores[2]);       // 91
printf("%d\n", *(scores + 2));   // 91</pre>
  <h2>Passing arrays to functions</h2>
  <p>Passing an array passes its address, so a function can modify the caller data — and receives no length. Pass the count separately.</p>
  <pre class="code-block">void bump_all(int *arr, size_t count) {
    for (size_t i = 0; i &lt; count; i++) {
        arr[i] += 1;       // arr[i] is *(arr + i)
    }
}

int main(void) {
    int temps[3] = {20, 21, 19};
    bump_all(temps, 3);    // the caller array changed
    printf("%d %d %d\n", temps[0], temps[1], temps[2]);   // 21 22 20
    return 0;
}</pre>
  <h2>Strings as const char *</h2>
  <pre class="code-block">const char *greeting = "Hello";   // points at a read-only literal
char        buffer[16];
strcpy(buffer, greeting);          // copy into an editable buffer</pre>
  <div class="callout">
    <strong>Do not modify string literals</strong>
    <p>A literal such as <span class="ic">"Hello"</span> lives in read-only memory. Writing through a <span class="ic">char *</span> pointing at it is undefined behavior. Copy it first.</p>
  </div>
  <div class="callout callout-tip">
    <strong>indexing is pointer arithmetic</strong>
    <p>The compiler treats <span class="ic">arr[i]</span> and <span class="ic">*(arr + i)</span> identically. Pointer arithmetic explains why arrays start at index zero: <span class="ic">*(arr + 0)</span> is the first element.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03700000-0000-4000-8000-000000000422',
  '03700000-0000-4000-8000-000000000322',
  1,
  'Dynamic Memory',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dynamic Memory</title>
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
  <h1>Dynamic Memory</h1>
  <p>So far, every variable lived on the <strong>stack</strong> with a size fixed at compile time. Dynamic memory — the <strong>heap</strong> — lets a program ask for memory while it runs and keep it as long as needed.</p>
  <h2>Stack vs heap</h2>
  <table>
    <tr><th></th><th>Stack</th><th>Heap</th></tr>
    <tr><td>Size</td><td>Known at compile time</td><td>Decided at runtime</td></tr>
    <tr><td>Lifetime</td><td>Ends at block end</td><td>Until you free it</td></tr>
    <tr><td>Speed</td><td>Very fast</td><td>Slower to allocate</td></tr>
    <tr><td>Limit</td><td>Tight, must be small</td><td>Limited by available RAM</td></tr>
  </table>
  <h2>malloc — allocate uninitialized memory</h2>
  <p><span class="ic">malloc</span> takes a byte count and returns a pointer, or NULL on failure. Always include <span class="ic">&lt;stdlib.h&gt;</span>.</p>
  <pre class="code-block">int *nums = malloc(5 * sizeof(int));
if (nums != NULL) {
    nums[0] = 10;                  // ready to use
    nums[4] = 50;
    free(nums);                    // give the memory back
}</pre>
  <div class="callout">
    <strong>Always check the result</strong>
    <p>Allocation can fail, returning NULL. Dereferencing NULL crashes the program, so test every allocation before using it.</p>
  </div>
  <h2>calloc and realloc</h2>
  <p><span class="ic">calloc</span> clears the memory to zero. <span class="ic">realloc</span> resizes an existing block, copying the old contents when it has to move.</p>
  <pre class="code-block">int *a = calloc(5, sizeof(int));   // five zeroed ints
a[0] = 7;

int *b = realloc(a, 10 * sizeof(int));
if (b != NULL) {
    a = b;                         // adopt the resized block
    a[9] = 99;
    free(a);
}</pre>
  <h2>free — always return what you take</h2>
  <pre class="code-block">char *name = malloc(64);
strcpy(name, "Grace Hopper");
printf("%s\n", name);
free(name);       // memory is returned to the heap
// name is now a DANGEROUS pointer: do not use it again</pre>
  <div class="callout callout-info">
    <strong>Memory leaks</strong>
    <p>Forgetting to free memory — especially in a long-running program — lets the heap grow until the system runs out. Every malloc must eventually have a matching free.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Set the pointer to NULL after free</strong>
    <p>After <span class="ic">free(ptr)</span>, set <span class="ic">ptr = NULL</span>. It turns accidental reuse into a safe NULL check instead of a subtle crash or corruption.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03700000-0000-4000-8000-000000000423',
  '03700000-0000-4000-8000-000000000323',
  1,
  'Structs',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Structs</title>
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
  <h1>Structs</h1>
  <p>A <strong>struct</strong> groups related values into one named type. Where arrays hold many values of the same type, structs hold a few values of different types.</p>
  <h2>Defining a struct</h2>
  <pre class="code-block">struct Student {
    char  name[50];
    int   age;
    float gpa;
};</pre>
  <h2>Creating and accessing</h2>
  <p>Use the dot operator <span class="ic">.</span> to read and write members of a struct value.</p>
  <pre class="code-block">struct Student s1;
strcpy(s1.name, "Ada");
s1.age = 36;
s1.gpa = 3.9;

s1.age = 37;                       // update a member
printf("%s is %d years old\n", s1.name, s1.age);</pre>
  <p>You can initialize all members at once with a brace list:</p>
  <pre class="code-block">struct Student s2 = {"Alan", 41, 3.7};</pre>
  <h2>typedef — a shorter name</h2>
  <pre class="code-block">typedef struct Student Student;

Student s3;                        // no need to write "struct" again
Student s4 = {"Grace", 45, 4.0};</pre>
  <h2>Pointers to structs</h2>
  <p>Accessing a member through a pointer uses <span class="ic">-&gt;</span> (arrow) instead of a dot.</p>
  <pre class="code-block">Student *sp = &amp;s4;

sp-&gt;age = 46;                 // same as (*sp).age = 46;
printf("%s\n", sp-&gt;name);     // Grace</pre>
  <h2>Arrays of structs</h2>
  <pre class="code-block">Student class[3] = { {"Ada", 36, 3.9}, {"Alan", 41, 3.7}, {"Grace", 45, 4.0} };

for (int i = 0; i &lt; 3; i++) {
    printf("%-10s %.1f\n", class[i].name, class[i].gpa);
}</pre>
  <div class="callout callout-tip">
    <strong>Think of structs as nouns</strong>
    <p>Structs model real things — a student, a point, a task. The capstone task manager models each to-do as a struct, exactly like you will here.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03700000-0000-4000-8000-000000000425',
  '03700000-0000-4000-8000-000000000325',
  1,
  'File I/O',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>File I/O</title>
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
  <h1>File I/O</h1>
  <p>Memory disappears when a program exits. To persist data — settings, scores, todo lists — you write it to a file. The <span class="ic">&lt;stdio.h&gt;</span> file API mirrors the console functions you already know.</p>
  <h2>Opening a file</h2>
  <p><span class="ic">fopen</span> takes a path and a mode, and returns a <span class="ic">FILE *</span> or NULL on failure.</p>
  <table>
    <tr><th>Mode</th><th>Meaning</th></tr>
    <tr><td>"r"</td><td>read (file must exist)</td></tr>
    <tr><td>"w"</td><td>write (truncates existing content)</td></tr>
    <tr><td>"a"</td><td>append (create if missing)</td></tr>
    <tr><td>"r+" / "w+"</td><td>read and write</td></tr>
  </table>
  <pre class="code-block">FILE *file = fopen("notes.txt", "w");
if (file == NULL) {
    perror("notes.txt");
    return 1;                       // exit with an error code
}</pre>
  <div class="callout">
    <strong>Check every fopen</strong>
    <p>Files fail to open all the time — wrong path, missing permissions, a full disk. Test the returned pointer before writing; perror prints a helpful reason.</p>
  </div>
  <h2>Writing with fprintf</h2>
  <pre class="code-block">int   level = 3;
char  name[32] = "Mario";

FILE *file = fopen("save.txt", "w");
if (file != NULL) {
    fprintf(file, "%s %d\n", name, level);
    fclose(file);
}</pre>
  <h2>Reading a line with fgets</h2>
  <pre class="code-block">char line[256];

FILE *file = fopen("save.txt", "r");
if (file != NULL) {
    while (fgets(line, sizeof line, file) != NULL) {
        printf("%s", line);          // each line, one at a time
    }
    fclose(file);
}</pre>
  <p><span class="ic">fgets</span> reads at most size-1 characters, plants a terminating NUL, and stops safely — never any buffer overflow.</p>
  <h2>Parsing structured data with fscanf</h2>
  <pre class="code-block">char name[32];
int  level;

FILE *file = fopen("save.txt", "r");
if (file != NULL) {
    while (fscanf(file, "%31s %d", name, &amp;level) == 2) {
        printf("%s is level %d\n", name, level);
    }
    fclose(file);
}</pre>
  <h2>Always close</h2>
  <pre class="code-block">if (fclose(file) != 0) {
    perror("fclose");
}</pre>
  <div class="callout callout-tip">
    <strong>Close before exiting</strong>
    <p><span class="ic">fclose</span> flushes buffered writes to disk. If a program exits without closing (or flushing with <span class="ic">fflush</span>), data can be silently lost.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03700000-0000-4000-8000-000000000426',
  '03700000-0000-4000-8000-000000000326',
  1,
  'Debugging with gdb',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Debugging with gdb</title>
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
  <h1>Debugging with gdb</h1>
  <p>When a program crashes or misbehaves, you need to see inside it. Two tools cover nearly every case: compiler warnings catch mistakes at build time, and the GNU debugger (<span class="ic">gdb</span>) lets you stop and inspect a running program.</p>
  <h2>Hear the compiler first</h2>
  <pre class="code-block">gcc -Wall -Wextra -std=c17 -o prog prog.c</pre>
  <div class="callout">
    <strong>Warnings are almost always bugs</strong>
    <p>Treat <span class="ic">-Wall -Wextra</span> output as errors: uninitialized variables, sign mismatches, and careless returns are usually reported before the program even runs. Fix them.</p>
  </div>
  <h2>Compile with symbols</h2>
  <p>The <span class="ic">-g</span> flag embeds source and variable information so gdb can show you line numbers and names.</p>
  <pre class="code-block">gcc -g -Wall -Wextra -o prog prog.c</pre>
  <h2>A gdb session</h2>
  <pre class="code-block">gdb ./prog

(gdb) break main          # stop at the start of main
(gdb) run                 # start the program
(gdb) next                # one line, step over functions
(gdb) step                # one line, step INTO functions
(gdb) print total         # show a variable's value
(gdb) backtrace           # show the call stack (bt)
(gdb) continue            # resume until the next breakpoint
(gdb) quit</pre>
  <p>If a crash occurs, run the program under gdb: execution stops exactly at the crashing line and <span class="ic">backtrace</span> shows how you got there.</p>
  <h2>Catching memory errors with Valgrind</h2>
  <pre class="code-block">valgrind --leak-check=full ./prog</pre>
  <ul>
    <li>Reports every invalid read or write — an off-by-one through an array.</li>
    <li>Flags memory that was allocated but never freed (leaks).</li>
    <li>Points to the exact line where the misuse happened.</li>
  </ul>
  <h2>A checklist for crashes</h2>
  <ol>
    <li>Fix every compiler warning first.</li>
    <li>Look for <span class="ic">scanf</span> calls missing <span class="ic">&amp;</span>.</li>
    <li>Check for <span class="ic">==</span> written as <span class="ic">=</span>.</li>
    <li>Run Valgrind to find out-of-bounds and unfreed memory.</li>
  </ol>
  <div class="callout callout-tip">
    <strong>Print is fine too</strong>
    <p>Early in your career, sprinkle temporary <span class="ic">printf</span> statements to confirm your assumptions. Just remove them before you ship — that is exactly what the gdb capstone exercises teach.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03700000-0000-4000-8000-000000000427',
  '03700000-0000-4000-8000-000000000327',
  1,
  'Capstone: Console Task Manager',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Console Task Manager</title>
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
  <h1>Capstone: Console Task Manager</h1>
  <p>Everything you have learned — types, loops, functions, arrays, strings, structs, malloc, and file I/O — comes together in a command-line <strong>task manager</strong>. Add, list, mark done, and save tasks to disk.</p>
  <h2>What you will build</h2>
  <ul>
    <li>A menu loop that keeps running until the user chooses to quit.</li>
    <li>Tasks stored in a dynamically sized array of structs.</li>
    <li>Save and load between runs with fprintf and fscanf.</li>
  </ul>
  <h2>Data model</h2>
  <p>Every task is one struct. Build the full program in a single <span class="ic">tasks.c</span> file.</p>
  <pre class="code-block">#include &lt;stdio.h&gt;
#include &lt;stdlib.h&gt;
#include &lt;string.h&gt;

typedef struct {
    char  title[100];
    int   done;      // 1 = completed, 0 = pending
} Task;

#define MAX_TASKS 100

Task  tasks[MAX_TASKS];
int   task_count = 0;</pre>
  <h2>Core functions</h2>
  <pre class="code-block">void add_task(const char *title) {
    if (task_count &lt; MAX_TASKS) {
        strcpy(tasks[task_count].title, title);
        tasks[task_count].done = 0;
        task_count++;
    } else {
        printf("Task list is full.\n");
    }
}

void list_tasks(void) {
    for (int i = 0; i &lt; task_count; i++) {
        printf("%d. [%c] %s\n", i + 1,
               tasks[i].done ? 'x' : ' ', tasks[i].title);
    }
}

void complete_task(int index) {
    if (index &gt;= 0 &amp;&amp; index &lt; task_count) {
        tasks[index].done = 1;
    }
}</pre>
  <h2>Saving and loading</h2>
  <pre class="code-block">void save_tasks(const char *path) {
    FILE *file = fopen(path, "w");
    if (file == NULL) {
        perror(path);
        return;
    }
    for (int i = 0; i &lt; task_count; i++) {
        fprintf(file, "%d|%s\n", tasks[i].done, tasks[i].title);
    }
    fclose(file);
}

void load_tasks(const char *path) {
    FILE *file = fopen(path, "r");
    if (file == NULL) return;
    task_count = 0;
    while (task_count &lt; MAX_TASKS
           &amp;&amp; fscanf(file, "%d|%99[^\n]",
                     &amp;tasks[task_count].done,
                     tasks[task_count].title) == 2) {
        task_count++;
    }
    fclose(file);
}</pre>
  <h2>Putting it together: the menu loop</h2>
  <pre class="code-block">int main(void) {
    char cmd[8];
    char title[100];

    load_tasks("tasks.txt");

    for (;;) {
        printf("\n1) Add  2) List  3) Done  4) Quit\n&gt; ");
        if (scanf("%7s", cmd) != 1) break;

        if (strcmp(cmd, "1") == 0) {
            printf("Title: ");
            scanf(" %99[^\n]", title);
            add_task(title);
        } else if (strcmp(cmd, "2") == 0) {
            list_tasks();
        } else if (strcmp(cmd, "3") == 0) {
            int n;
            printf("Number: ");
            scanf("%d", &amp;n);
            complete_task(n - 1);
        } else if (strcmp(cmd, "4") == 0) {
            break;
        }
    }

    save_tasks("tasks.txt");
    return 0;
}</pre>
  <div class="callout callout-tip">
    <strong>Grow it from here</strong>
    <p>Try a <span class="ic">delete_task</span>, priorities, or due dates. Each feature is just another function built from the tools you already have.</p>
  </div>
  <div class="callout callout-info">
    <strong>Real persistence</strong>
    <p>The tasks survive a restart because they live in <span class="ic">tasks.txt</span>. That is a full loop: malloc-free discipline optional here, but the pattern matches what servers do with databases.</p>
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
  ('03700000-0000-4000-8000-000000000501', '03700000-0000-4000-8000-000000000303',
   'Who created C at Bell Labs in the early 1970s?',
   'Dennis Ritchie designed C to build the Unix operating system.', 1),
  ('03700000-0000-4000-8000-000000000502', '03700000-0000-4000-8000-000000000303',
   'What does the line #include &lt;stdio.h&gt; do?',
   'The preprocessor directive declares the standard input and output functions.', 2),
  ('03700000-0000-4000-8000-000000000503', '03700000-0000-4000-8000-000000000303',
   'Which function is the entry point of every C program?',
   'Execution always starts in main.', 3),
  ('03700000-0000-4000-8000-000000000504', '03700000-0000-4000-8000-000000000306',
   'Which format specifier prints a signed integer with printf?',
   '%d is the decimal format specifier for int.', 1),
  ('03700000-0000-4000-8000-000000000505', '03700000-0000-4000-8000-000000000306',
   'What must scanf receive to store an int it reads?',
   'scanf needs the address of the variable, written with the ampersand.', 2),
  ('03700000-0000-4000-8000-000000000506', '03700000-0000-4000-8000-000000000306',
   'Which type stores a single character?',
   'char holds one character, such as grade = ''A''.', 3),
  ('03700000-0000-4000-8000-000000000507', '03700000-0000-4000-8000-000000000309',
   'What is the result of 7 % 3?',
   'The modulo operator returns the remainder, which is 1.', 1),
  ('03700000-0000-4000-8000-000000000508', '03700000-0000-4000-8000-000000000309',
   'What does the expression 5 / 2 produce?',
   'Both operands are int, so the division truncates to 2.', 3),
  ('03700000-0000-4000-8000-000000000509', '03700000-0000-4000-8000-000000000309',
   'Which operator means "not equal to"?',
   'The != operator tests for inequality.', 2),
  ('03700000-0000-4000-8000-000000000510', '03700000-0000-4000-8000-000000000312',
   'Which statement selects among several exact cases by value?',
   'switch compares a value against constant cases.', 3),
  ('03700000-0000-4000-8000-000000000511', '03700000-0000-4000-8000-000000000312',
   'Which loop is guaranteed to run its body at least once?',
   'do-while checks its condition after the body executes.', 1),
  ('03700000-0000-4000-8000-000000000512', '03700000-0000-4000-8000-000000000312',
   'What does break do inside a loop?',
   'break exits the loop immediately.', 2),
  ('03700000-0000-4000-8000-000000000513', '03700000-0000-4000-8000-000000000315',
   'What is a function prototype?',
   'It declares the return type, name, and parameters before the function is used.', 2),
  ('03700000-0000-4000-8000-000000000514', '03700000-0000-4000-8000-000000000315',
   'How are ordinary arguments passed to C functions?',
   'C passes a copy of each value, so changes inside do not affect the caller.', 1),
  ('03700000-0000-4000-8000-000000000515', '03700000-0000-4000-8000-000000000315',
   'What must every recursive function have to terminate?',
   'A base case that stops further recursive calls.', 3),
  ('03700000-0000-4000-8000-000000000516', '03700000-0000-4000-8000-000000000318',
   'What is the index of the first element of an array?',
   'C arrays are zero-based, so the first element is at index 0.', 1),
  ('03700000-0000-4000-8000-000000000517', '03700000-0000-4000-8000-000000000318',
   'Which character terminates every C string?',
   'The null terminator, the character ''\0'', ends the string.', 3),
  ('03700000-0000-4000-8000-000000000518', '03700000-0000-4000-8000-000000000318',
   'Which function returns the length of a string?',
   'strlen counts the characters before the null terminator.', 2),
  ('03700000-0000-4000-8000-000000000519', '03700000-0000-4000-8000-000000000321',
   'Which operator produces the address of a variable?',
   'The address-of operator &amp; yields the variable location in memory.', 3),
  ('03700000-0000-4000-8000-000000000520', '03700000-0000-4000-8000-000000000321',
   'What does the * operator do to a pointer?',
   'Dereferencing follows the pointer to reach the value it points to.', 1),
  ('03700000-0000-4000-8000-000000000521', '03700000-0000-4000-8000-000000000321',
   'What should an unused pointer be set to?',
   'NULL (or 0) marks a pointer as pointing nowhere safe to test.', 2),
  ('03700000-0000-4000-8000-000000000522', '03700000-0000-4000-8000-000000000324',
   'Which function allocates uninitialized memory on the heap?',
   'malloc reserves a byte count and returns a pointer to it.', 2),
  ('03700000-0000-4000-8000-000000000523', '03700000-0000-4000-8000-000000000324',
   'What must happen to memory returned by malloc before the program ends?',
   'It should be released with free, or the program leaks memory.', 1),
  ('03700000-0000-4000-8000-000000000524', '03700000-0000-4000-8000-000000000324',
   'Which operator accesses a struct member through a pointer?',
   'The arrow operator -&gt; works on pointers to structs.', 3),
  ('03700000-0000-4000-8000-000000000525', '03700000-0000-4000-8000-000000000328',
   'What extension do C source files use?',
   'C source files use the .c extension.', 1),
  ('03700000-0000-4000-8000-000000000526', '03700000-0000-4000-8000-000000000328',
   'Which gcc flag enables helpful warnings at compile time?',
   '-Wall turns on a useful set of compiler warnings.', 2),
  ('03700000-0000-4000-8000-000000000527', '03700000-0000-4000-8000-000000000328',
   'What does fopen return when it cannot open a file?',
   'It returns NULL on failure — always check before using the stream.', 4),
  ('03700000-0000-4000-8000-000000000528', '03700000-0000-4000-8000-000000000328',
   'Why should you never use the gets function?',
   'gets cannot limit input length, so it overflows buffers.', 3),
  ('03700000-0000-4000-8000-000000000529', '03700000-0000-4000-8000-000000000328',
   'What is the purpose of free()?',
   'It returns heap memory to the system so a program does not leak.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): Dennis Ritchie
  ('03700000-0000-4000-8000-000000001001', '03700000-0000-4000-8000-000000000501', 'Dennis Ritchie', TRUE,  1),
  ('03700000-0000-4000-8000-000000001002', '03700000-0000-4000-8000-000000000501', 'Ada Lovelace', FALSE, 2),
  ('03700000-0000-4000-8000-000000001003', '03700000-0000-4000-8000-000000000501', 'Grace Hopper', FALSE, 3),
  ('03700000-0000-4000-8000-000000001004', '03700000-0000-4000-8000-000000000501', 'Linus Torvalds', FALSE, 4),
  -- Q1 (502): stdio.h
  ('03700000-0000-4000-8000-000000001005', '03700000-0000-4000-8000-000000000502', 'Starts the main function', FALSE, 1),
  ('03700000-0000-4000-8000-000000001006', '03700000-0000-4000-8000-000000000502', 'A preprocessor directive pulling in the input and output declarations', TRUE,  2),
  ('03700000-0000-4000-8000-000000001007', '03700000-0000-4000-8000-000000000502', 'Links a library at runtime', FALSE, 3),
  ('03700000-0000-4000-8000-000000001008', '03700000-0000-4000-8000-000000000502', 'Creates a new source file', FALSE, 4),
  -- Q1 (503): main
  ('03700000-0000-4000-8000-000000001009', '03700000-0000-4000-8000-000000000503', 'start()', FALSE, 1),
  ('03700000-0000-4000-8000-000000001010', '03700000-0000-4000-8000-000000000503', 'run()', FALSE, 2),
  ('03700000-0000-4000-8000-000000001011', '03700000-0000-4000-8000-000000000503', 'main', TRUE,  3),
  ('03700000-0000-4000-8000-000000001012', '03700000-0000-4000-8000-000000000503', 'program()', FALSE, 4),
  -- Q2 (504): %d
  ('03700000-0000-4000-8000-000000001013', '03700000-0000-4000-8000-000000000504', '%d', TRUE,  1),
  ('03700000-0000-4000-8000-000000001014', '03700000-0000-4000-8000-000000000504', '%s', FALSE, 2),
  ('03700000-0000-4000-8000-000000001015', '03700000-0000-4000-8000-000000000504', '%c', FALSE, 3),
  ('03700000-0000-4000-8000-000000001016', '03700000-0000-4000-8000-000000000504', '%f', FALSE, 4),
  -- Q2 (505): address
  ('03700000-0000-4000-8000-000000001017', '03700000-0000-4000-8000-000000000505', 'The value itself', FALSE, 1),
  ('03700000-0000-4000-8000-000000001018', '03700000-0000-4000-8000-000000000505', 'The address of the variable', TRUE,  2),
  ('03700000-0000-4000-8000-000000001019', '03700000-0000-4000-8000-000000000505', 'A format string', FALSE, 3),
  ('03700000-0000-4000-8000-000000001020', '03700000-0000-4000-8000-000000000505', 'Nothing extra', FALSE, 4),
  -- Q2 (506): char
  ('03700000-0000-4000-8000-000000001021', '03700000-0000-4000-8000-000000000506', 'int', FALSE, 1),
  ('03700000-0000-4000-8000-000000001022', '03700000-0000-4000-8000-000000000506', 'float', FALSE, 2),
  ('03700000-0000-4000-8000-000000001023', '03700000-0000-4000-8000-000000000506', 'char', TRUE,  3),
  ('03700000-0000-4000-8000-000000001024', '03700000-0000-4000-8000-000000000506', 'double', FALSE, 4),
  -- Q3 (507): 7 % 3
  ('03700000-0000-4000-8000-000000001025', '03700000-0000-4000-8000-000000000507', '1', TRUE,  1),
  ('03700000-0000-4000-8000-000000001026', '03700000-0000-4000-8000-000000000507', '2', FALSE, 2),
  ('03700000-0000-4000-8000-000000001027', '03700000-0000-4000-8000-000000000507', '0', FALSE, 3),
  ('03700000-0000-4000-8000-000000001028', '03700000-0000-4000-8000-000000000507', '3', FALSE, 4),
  -- Q3 (508): 5 / 2
  ('03700000-0000-4000-8000-000000001029', '03700000-0000-4000-8000-000000000508', '2.5', FALSE, 1),
  ('03700000-0000-4000-8000-000000001030', '03700000-0000-4000-8000-000000000508', '2.0', FALSE, 2),
  ('03700000-0000-4000-8000-000000001031', '03700000-0000-4000-8000-000000000508', '3', FALSE, 3),
  ('03700000-0000-4000-8000-000000001032', '03700000-0000-4000-8000-000000000508', '2', TRUE,  4),
  -- Q3 (509): !=
  ('03700000-0000-4000-8000-000000001033', '03700000-0000-4000-8000-000000000509', '===', FALSE, 1),
  ('03700000-0000-4000-8000-000000001034', '03700000-0000-4000-8000-000000000509', '!=', TRUE,  2),
  ('03700000-0000-4000-8000-000000001035', '03700000-0000-4000-8000-000000000509', '=!', FALSE, 3),
  ('03700000-0000-4000-8000-000000001036', '03700000-0000-4000-8000-000000000509', '~=', FALSE, 4),
  -- Q4 (510): switch
  ('03700000-0000-4000-8000-000000001037', '03700000-0000-4000-8000-000000000510', 'if', FALSE, 1),
  ('03700000-0000-4000-8000-000000001038', '03700000-0000-4000-8000-000000000510', 'while', FALSE, 2),
  ('03700000-0000-4000-8000-000000001039', '03700000-0000-4000-8000-000000000510', 'switch', TRUE,  3),
  ('03700000-0000-4000-8000-000000001040', '03700000-0000-4000-8000-000000000510', 'for', FALSE, 4),
  -- Q4 (511): do-while
  ('03700000-0000-4000-8000-000000001041', '03700000-0000-4000-8000-000000000511', 'do-while', TRUE,  1),
  ('03700000-0000-4000-8000-000000001042', '03700000-0000-4000-8000-000000000511', 'while', FALSE, 2),
  ('03700000-0000-4000-8000-000000001043', '03700000-0000-4000-8000-000000000511', 'for', FALSE, 3),
  ('03700000-0000-4000-8000-000000001044', '03700000-0000-4000-8000-000000000511', 'while-do', FALSE, 4),
  -- Q4 (512): break
  ('03700000-0000-4000-8000-000000001045', '03700000-0000-4000-8000-000000000512', 'Skips an iteration', FALSE, 1),
  ('03700000-0000-4000-8000-000000001046', '03700000-0000-4000-8000-000000000512', 'Restarts the loop', FALSE, 2),
  ('03700000-0000-4000-8000-000000001047', '03700000-0000-4000-8000-000000000512', 'Ends the program', FALSE, 3),
  ('03700000-0000-4000-8000-000000001048', '03700000-0000-4000-8000-000000000512', 'Exits the loop immediately', TRUE,  4),
  -- Q5 (513): prototype
  ('03700000-0000-4000-8000-000000001049', '03700000-0000-4000-8000-000000000513', 'The body of the function', FALSE, 1),
  ('03700000-0000-4000-8000-000000001050', '03700000-0000-4000-8000-000000000513', 'A declaration of name, return type, and parameters before use', TRUE,  2),
  ('03700000-0000-4000-8000-000000001051', '03700000-0000-4000-8000-000000000513', 'The first call of the function', FALSE, 3),
  ('03700000-0000-4000-8000-000000001052', '03700000-0000-4000-8000-000000000513', 'A function without parameters', FALSE, 4),
  -- Q5 (514): by value
  ('03700000-0000-4000-8000-000000001053', '03700000-0000-4000-8000-000000000514', 'By value (a copy)', TRUE,  1),
  ('03700000-0000-4000-8000-000000001054', '03700000-0000-4000-8000-000000000514', 'By reference', FALSE, 2),
  ('03700000-0000-4000-8000-000000001055', '03700000-0000-4000-8000-000000000514', 'By name', FALSE, 3),
  ('03700000-0000-4000-8000-000000001056', '03700000-0000-4000-8000-000000000514', 'By address automatically', FALSE, 4),
  -- Q5 (515): base case
  ('03700000-0000-4000-8000-000000001057', '03700000-0000-4000-8000-000000000515', 'A global variable', FALSE, 1),
  ('03700000-0000-4000-8000-000000001058', '03700000-0000-4000-8000-000000000515', 'A for loop', FALSE, 2),
  ('03700000-0000-4000-8000-000000001059', '03700000-0000-4000-8000-000000000515', 'A base case that stops the recursion', TRUE,  3),
  ('03700000-0000-4000-8000-000000001060', '03700000-0000-4000-8000-000000000515', 'An infinite loop', FALSE, 4),
  -- Q6 (516): index 0
  ('03700000-0000-4000-8000-000000001061', '03700000-0000-4000-8000-000000000516', '0', TRUE,  1),
  ('03700000-0000-4000-8000-000000001062', '03700000-0000-4000-8000-000000000516', '1', FALSE, 2),
  ('03700000-0000-4000-8000-000000001063', '03700000-0000-4000-8000-000000000516', '-1', FALSE, 3),
  ('03700000-0000-4000-8000-000000001064', '03700000-0000-4000-8000-000000000516', 'The array length', FALSE, 4),
  -- Q6 (517): null terminator
  ('03700000-0000-4000-8000-000000001065', '03700000-0000-4000-8000-000000000517', 'A double quote', FALSE, 1),
  ('03700000-0000-4000-8000-000000001066', '03700000-0000-4000-8000-000000000517', 'The letter z', FALSE, 2),
  ('03700000-0000-4000-8000-000000001067', '03700000-0000-4000-8000-000000000517', 'A semicolon', FALSE, 3),
  ('03700000-0000-4000-8000-000000001068', '03700000-0000-4000-8000-000000000517', '\0', TRUE,  4),
  -- Q6 (518): strlen
  ('03700000-0000-4000-8000-000000001069', '03700000-0000-4000-8000-000000000518', 'strcpy', FALSE, 1),
  ('03700000-0000-4000-8000-000000001070', '03700000-0000-4000-8000-000000000518', 'strlen', TRUE,  2),
  ('03700000-0000-4000-8000-000000001071', '03700000-0000-4000-8000-000000000518', 'strcmp', FALSE, 3),
  ('03700000-0000-4000-8000-000000001072', '03700000-0000-4000-8000-000000000518', 'strcat', FALSE, 4),
  -- Q7 (519): address-of
  ('03700000-0000-4000-8000-000000001073', '03700000-0000-4000-8000-000000000519', 'Asterisk *', FALSE, 1),
  ('03700000-0000-4000-8000-000000001074', '03700000-0000-4000-8000-000000000519', 'Arrow ->', FALSE, 2),
  ('03700000-0000-4000-8000-000000001075', '03700000-0000-4000-8000-000000000519', 'Ampersand &', TRUE,  3),
  ('03700000-0000-4000-8000-000000001076', '03700000-0000-4000-8000-000000000519', 'Percent %', FALSE, 4),
  -- Q7 (520): dereference
  ('03700000-0000-4000-8000-000000001077', '03700000-0000-4000-8000-000000000520', 'Follows the pointer to the value at that address', TRUE,  1),
  ('03700000-0000-4000-8000-000000001078', '03700000-0000-4000-8000-000000000520', 'Rounds the pointer', FALSE, 2),
  ('03700000-0000-4000-8000-000000001079', '03700000-0000-4000-8000-000000000520', 'Frees the pointer', FALSE, 3),
  ('03700000-0000-4000-8000-000000001080', '03700000-0000-4000-8000-000000000520', 'Copies the pointer', FALSE, 4),
  -- Q7 (521): NULL
  ('03700000-0000-4000-8000-000000001081', '03700000-0000-4000-8000-000000000521', 'The value 1', FALSE, 1),
  ('03700000-0000-4000-8000-000000001082', '03700000-0000-4000-8000-000000000521', 'NULL', TRUE,  2),
  ('03700000-0000-4000-8000-000000001083', '03700000-0000-4000-8000-000000000521', 'The target value', FALSE, 3),
  ('03700000-0000-4000-8000-000000001084', '03700000-0000-4000-8000-000000000521', 'Nothing at all; leave it alone', FALSE, 4),
  -- Q8 (522): malloc
  ('03700000-0000-4000-8000-000000001085', '03700000-0000-4000-8000-000000000522', 'free', FALSE, 1),
  ('03700000-0000-4000-8000-000000001086', '03700000-0000-4000-8000-000000000522', 'calloc', FALSE, 2),
  ('03700000-0000-4000-8000-000000001087', '03700000-0000-4000-8000-000000000522', 'realloc', FALSE, 3),
  ('03700000-0000-4000-8000-000000001088', '03700000-0000-4000-8000-000000000522', 'malloc', TRUE,  4),
  -- Q8 (523): free
  ('03700000-0000-4000-8000-000000001089', '03700000-0000-4000-8000-000000000523', 'free it', TRUE,  1),
  ('03700000-0000-4000-8000-000000001090', '03700000-0000-4000-8000-000000000523', 'Double the size', FALSE, 2),
  ('03700000-0000-4000-8000-000000001091', '03700000-0000-4000-8000-000000000523', 'Print it', FALSE, 3),
  ('03700000-0000-4000-8000-000000001092', '03700000-0000-4000-8000-000000000523', 'Store it in a global variable', FALSE, 4),
  -- Q8 (524): arrow
  ('03700000-0000-4000-8000-000000001093', '03700000-0000-4000-8000-000000000524', 'The dot .', FALSE, 1),
  ('03700000-0000-4000-8000-000000001094', '03700000-0000-4000-8000-000000000524', 'The ampersand &', FALSE, 2),
  ('03700000-0000-4000-8000-000000001095', '03700000-0000-4000-8000-000000000524', 'The arrow ->', TRUE,  3),
  ('03700000-0000-4000-8000-000000001096', '03700000-0000-4000-8000-000000000524', 'The hash #', FALSE, 4),
  -- Q9 (525): .c extension
  ('03700000-0000-4000-8000-000000001097', '03700000-0000-4000-8000-000000000525', '.c', TRUE,  1),
  ('03700000-0000-4000-8000-000000001098', '03700000-0000-4000-8000-000000000525', '.cpp', FALSE, 2),
  ('03700000-0000-4000-8000-000000001099', '03700000-0000-4000-8000-000000000525', '.exe', FALSE, 3),
  ('03700000-0000-4000-8000-000000001100', '03700000-0000-4000-8000-000000000525', '.txt', FALSE, 4),
  -- Q9 (526): -Wall
  ('03700000-0000-4000-8000-000000001101', '03700000-0000-4000-8000-000000000526', '-o', FALSE, 1),
  ('03700000-0000-4000-8000-000000001102', '03700000-0000-4000-8000-000000000526', '-Wall', TRUE,  2),
  ('03700000-0000-4000-8000-000000001103', '03700000-0000-4000-8000-000000000526', '-x', FALSE, 3),
  ('03700000-0000-4000-8000-000000001104', '03700000-0000-4000-8000-000000000526', '-s', FALSE, 4),
  -- Q9 (527): fopen NULL
  ('03700000-0000-4000-8000-000000001105', '03700000-0000-4000-8000-000000000527', 'A valid FILE pointer', FALSE, 1),
  ('03700000-0000-4000-8000-000000001106', '03700000-0000-4000-8000-000000000527', 'An empty string', FALSE, 2),
  ('03700000-0000-4000-8000-000000001107', '03700000-0000-4000-8000-000000000527', 'A zero-sized stream', FALSE, 3),
  ('03700000-0000-4000-8000-000000001108', '03700000-0000-4000-8000-000000000527', 'NULL', TRUE,  4),
  -- Q9 (528): gets
  ('03700000-0000-4000-8000-000000001109', '03700000-0000-4000-8000-000000000528', 'It is too slow', FALSE, 1),
  ('03700000-0000-4000-8000-000000001110', '03700000-0000-4000-8000-000000000528', 'It reads binary files only', FALSE, 2),
  ('03700000-0000-4000-8000-000000001111', '03700000-0000-4000-8000-000000000528', 'It cannot limit input length and overflows buffers', TRUE,  3),
  ('03700000-0000-4000-8000-000000001112', '03700000-0000-4000-8000-000000000528', 'It skips spaces', FALSE, 4),
  -- Q9 (529): free purpose
  ('03700000-0000-4000-8000-000000001113', '03700000-0000-4000-8000-000000000529', 'It zeroes the program', FALSE, 1),
  ('03700000-0000-4000-8000-000000001114', '03700000-0000-4000-8000-000000000529', 'It returns heap memory to the system', TRUE,  2),
  ('03700000-0000-4000-8000-000000001115', '03700000-0000-4000-8000-000000000529', 'It shrinks the stack', FALSE, 3),
  ('03700000-0000-4000-8000-000000001116', '03700000-0000-4000-8000-000000000529', 'It closes all open files', FALSE, 4)
ON CONFLICT (id) DO NOTHING;

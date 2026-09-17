-- ============================================================================
-- SEED 045: Complete course — "Functional Programming Principles"
-- ----------------------------------------------------------------------------
-- Instructor : Marcus Johnson    (10000000-0000-4000-8000-000000000002)
-- Category   : Programming Fundamentals (20000000-0000-4000-8000-000000000002)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 The Functional Mindset   → C1 Pure Functions · C2 Immutability & Transparency
--   M2 Functions as Values       → C3 First-Class & Higher-Order Functions · C4 Closures & Currying
--   M3 Transforming Data        → C5 map, filter & reduce · C6 Composition & Pipelines
--   M4 Recursion & Abstractions → C7 Recursion · C8 Functors & Monads
--   M5 FP in Practice           → C9 Refactoring Real Code · C10 Capstone: Functional Refactor
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
  '02D00000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000002',
  '20000000-0000-4000-8000-000000000002',
  'Functional Programming Principles',
  'functional-programming-principles',
  'Write programs that are easier to test, reason about, and reuse. Learn pure functions, immutability, higher-order functions, composition, recursion, and the functor/monad way of taming side effects — then apply FP to a real refactor capstone.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  43
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('02D00000-0000-4000-8000-000000000011', '02D00000-0000-4000-8000-000000000001', 'Explain the core ideas of functional programming: purity, immutability, and referential transparency.',  1),
  ('02D00000-0000-4000-8000-000000000012', '02D00000-0000-4000-8000-000000000001', 'Write and compose first-class and higher-order functions, including closures and currying.',               2),
  ('02D00000-0000-4000-8000-000000000013', '02D00000-0000-4000-8000-000000000001', 'Transform and aggregate collections with map, filter, and reduce.',                                      3),
  ('02D00000-0000-4000-8000-000000000014', '02D00000-0000-4000-8000-000000000001', 'Design recursive solutions for lists and tree-shaped data.',                                              4),
  ('02D00000-0000-4000-8000-000000000015', '02D00000-0000-4000-8000-000000000001', 'Refactor a real codebase around a pure core and a thin, testable shell.',                                 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('02D00000-0000-4000-8000-000000000101', '02D00000-0000-4000-8000-000000000001', 1, 'The Functional Mindset',     'Rethink how you structure programs around pure, predictable functions.',   'PUBLISHED'),
  ('02D00000-0000-4000-8000-000000000102', '02D00000-0000-4000-8000-000000000001', 2, 'Functions as Values',        'Treat functions as values: store them, pass them, and return them.',       'PUBLISHED'),
  ('02D00000-0000-4000-8000-000000000103', '02D00000-0000-4000-8000-000000000001', 3, 'Transforming Data',          'Replace hand-written loops with declarative transforms and composition.',   'PUBLISHED'),
  ('02D00000-0000-4000-8000-000000000104', '02D00000-0000-4000-8000-000000000001', 4, 'Recursion & Abstractions',   'Solve recursive problems and wrap effectful values with functors and monads.', 'PUBLISHED'),
  ('02D00000-0000-4000-8000-000000000105', '02D00000-0000-4000-8000-000000000001', 5, 'FP in Practice',             'Apply functional patterns to a real refactor with a testable pure core.',  'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('02D00000-0000-4000-8000-000000000201', '02D00000-0000-4000-8000-000000000101', 1, 'Pure Functions',                       'The building-block idea of functional programming.',               'PUBLISHED'),
  ('02D00000-0000-4000-8000-000000000202', '02D00000-0000-4000-8000-000000000101', 2, 'Immutability & Referential Transparency','Data that never changes, and expressions you can swap safely.',    'PUBLISHED'),
  ('02D00000-0000-4000-8000-000000000203', '02D00000-0000-4000-8000-000000000102', 1, 'First-Class & Higher-Order Functions',  'Functions as values, and functions that operate on functions.',    'PUBLISHED'),
  ('02D00000-0000-4000-8000-000000000204', '02D00000-0000-4000-8000-000000000102', 2, 'Closures & Currying',                   'Functions that remember state and functions that return functions.','PUBLISHED'),
  ('02D00000-0000-4000-8000-000000000205', '02D00000-0000-4000-8000-000000000103', 1, 'map, filter & reduce',                  'The three verbs of collection transformation.',                    'PUBLISHED'),
  ('02D00000-0000-4000-8000-000000000206', '02D00000-0000-4000-8000-000000000103', 2, 'Composition & Pipelines',               'Glue small functions into readable data flows.',                   'PUBLISHED'),
  ('02D00000-0000-4000-8000-000000000207', '02D00000-0000-4000-8000-000000000104', 1, 'Recursion',                             'Solve problems by solving smaller versions of themselves.',        'PUBLISHED'),
  ('02D00000-0000-4000-8000-000000000208', '02D00000-0000-4000-8000-000000000104', 2, 'Functors & Monads',                     'Map inside containers and model effectful values safely.',         'PUBLISHED'),
  ('02D00000-0000-4000-8000-000000000209', '02D00000-0000-4000-8000-000000000105', 1, 'FP in Practice',                        'Refactoring patterns for real-world functional style.',            'PUBLISHED'),
  ('02D00000-0000-4000-8000-000000000210', '02D00000-0000-4000-8000-000000000105', 2, 'Capstone: Functional Refactor',         'Build a small app around a pure, testable core.',                  'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 02D00000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('02D00000-0000-4000-8000-000000000301', '02D00000-0000-4000-8000-000000000201', 1, 'What is Functional Programming?',          'Meet the paradigm built on pure functions and see how it differs from imperative code.', 'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('02D00000-0000-4000-8000-000000000302', '02D00000-0000-4000-8000-000000000201', 2, 'Why Pure Functions Matter',                'Learn the two purity guarantees and the payoff in testing and reasoning.',              'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('02D00000-0000-4000-8000-000000000303', '02D00000-0000-4000-8000-000000000201', 3, 'The Functional Mindset Quiz',               'Check your grasp of purity, side effects, and the paradigm.',                          'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('02D00000-0000-4000-8000-000000000304', '02D00000-0000-4000-8000-000000000202', 1, 'Immutability & Value Semantics',           'Stop mutating data in place; derive new values instead.',                              'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('02D00000-0000-4000-8000-000000000305', '02D00000-0000-4000-8000-000000000202', 2, 'Referential Transparency',                 'Learn to substitute expressions with their values safely.',                            'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('02D00000-0000-4000-8000-000000000306', '02D00000-0000-4000-8000-000000000202', 3, 'Immutability & Transparency Quiz',         'Test your command of immutable data and transparent expressions.',                     'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('02D00000-0000-4000-8000-000000000307', '02D00000-0000-4000-8000-000000000203', 1, 'First-Class Functions',                    'Treat functions as data you can store, pass, and return.',                             'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('02D00000-0000-4000-8000-000000000308', '02D00000-0000-4000-8000-000000000203', 2, 'Higher-Order Functions',                   'Write functions that take and return other functions.',                                'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('02D00000-0000-4000-8000-000000000309', '02D00000-0000-4000-8000-000000000203', 3, 'Functions as Values Quiz',                 'Verify you can spot first-class and higher-order functions.',                          'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('02D00000-0000-4000-8000-000000000310', '02D00000-0000-4000-8000-000000000204', 1, 'Closures',                                  'Hold onto scope with functions that remember their birthplace.',                       'TEXT', 'PUBLISHED', 'FREE', 10, 12),
  ('02D00000-0000-4000-8000-000000000311', '02D00000-0000-4000-8000-000000000204', 2, 'Currying & Partial Application',           'Break functions into steps and bind arguments ahead of time.',                         'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('02D00000-0000-4000-8000-000000000312', '02D00000-0000-4000-8000-000000000204', 3, 'Closures & Currying Quiz',                 'Check how well you harness captured state and function chains.',                       'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('02D00000-0000-4000-8000-000000000313', '02D00000-0000-4000-8000-000000000205', 1, 'Transforming with map & filter',           'Replace loops with declarative transform and selection.',                              'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('02D00000-0000-4000-8000-000000000314', '02D00000-0000-4000-8000-000000000205', 2, 'Aggregating with reduce',                  'Fold collections down to sums, objects, and tables.',                                  'TEXT', 'PUBLISHED', 'FREE', 10, 12),
  ('02D00000-0000-4000-8000-000000000315', '02D00000-0000-4000-8000-000000000205', 3, 'Collection Transformations Quiz',          'Test your map, filter, and reduce instincts.',                                          'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('02D00000-0000-4000-8000-000000000316', '02D00000-0000-4000-8000-000000000206', 1, 'Function Composition',                     'Combine small functions into bigger behavior.',                                          'TEXT', 'PUBLISHED', 'FREE', 10, 12),
  ('02D00000-0000-4000-8000-000000000317', '02D00000-0000-4000-8000-000000000206', 2, 'Pipelines & Point-Free Style',             'Make data flow visibly through named stages.',                                          'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('02D00000-0000-4000-8000-000000000318', '02D00000-0000-4000-8000-000000000206', 3, 'Composition Quiz',                         'Verify your compose and pipe skills.',                                                  'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('02D00000-0000-4000-8000-000000000319', '02D00000-0000-4000-8000-000000000207', 1, 'Recursion Fundamentals',                   'Solve problems by calling yourself on smaller input.',                                  'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('02D00000-0000-4000-8000-000000000320', '02D00000-0000-4000-8000-000000000207', 2, 'Recursion in Practice: Trees & Tail Calls','Traverse nested data and keep recursion stack-safe.',                                  'TEXT', 'PUBLISHED', 'FREE', 10, 12),
  ('02D00000-0000-4000-8000-000000000321', '02D00000-0000-4000-8000-000000000207', 3, 'Recursion Quiz',                           'Check your base-case and tail-call instincts.',                                         'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('02D00000-0000-4000-8000-000000000322', '02D00000-0000-4000-8000-000000000208', 1, 'Functors & Mapping Containers',            'Map inside wrappers without unwrapping them.',                                          'TEXT', 'PUBLISHED', 'FREE', 10, 12),
  ('02D00000-0000-4000-8000-000000000323', '02D00000-0000-4000-8000-000000000208', 2, 'Monads & the Maybe Pattern',               'Chain optional values without nested null checks.',                                     'TEXT', 'PUBLISHED', 'FREE', 10, 12),
  ('02D00000-0000-4000-8000-000000000324', '02D00000-0000-4000-8000-000000000208', 3, 'Functors & Monads Quiz',                   'Test your grasp of mapping and flattening wrappers.',                                   'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('02D00000-0000-4000-8000-000000000325', '02D00000-0000-4000-8000-000000000209', 1, 'FP in Practice: Refactoring Real Code',    'Carve pure cores out of tangled real-world routines.',                                  'TEXT', 'PUBLISHED', 'FREE', 10, 12),
  ('02D00000-0000-4000-8000-000000000326', '02D00000-0000-4000-8000-000000000210', 1, 'Capstone: Setup & Data Model',             'Scaffold the project and model immutable cart data.',                                   'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('02D00000-0000-4000-8000-000000000327', '02D00000-0000-4000-8000-000000000210', 2, 'Capstone: Building the Pure Core',         'Compose receipts from small, testable pure functions.',                                 'TEXT', 'PUBLISHED', 'FREE', 10, 12),
  ('02D00000-0000-4000-8000-000000000328', '02D00000-0000-4000-8000-000000000210', 3, 'Final Assessment',                         'Prove you mastered functional thinking end to end.',                                    'QUIZ', 'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 02D00000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '02D00000-0000-4000-8000-000000000401',
  '02D00000-0000-4000-8000-000000000301',
  1,
  'What is Functional Programming?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What is Functional Programming?</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f5f3ff; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>What is Functional Programming?</h1>
  <p>Functional programming is a <strong>style of building software</strong> that treats computation as the evaluation of pure functions and avoids changing state. Instead of telling the computer <em>how</em> to do a task step by step, you describe <em>what</em> the result is, and let small composable functions do the work.</p>
  <p>The idea is older than most programming languages: Alonzo Church&rsquo;s <strong>lambda calculus</strong> (1930s) models every program as function application. Modern languages — JavaScript, Python, Java, and C# — all borrow functional ideas, and dedicated languages such as Haskell, Elm, and Clojure are built entirely on them.</p>
  <h2>Declarative over imperative</h2>
  <p>Consider computing the sum of all even numbers in a list. The imperative version spells out every mutation and step; the functional version declares the transformation:</p>
  <pre class="code-block">// Imperative — you manage every step
let total = 0;
for (let i = 0; i &lt; numbers.length; i++) {
  if (numbers[i] % 2 === 0) total += numbers[i];
}

// Functional — you declare the result
const total = numbers
  .filter(n =&gt; n % 2 === 0)
  .reduce((sum, n) =&gt; sum + n, 0);</pre>
  <h2>The three pillars</h2>
  <ul>
    <li><strong>Pure functions</strong> — same input, same output, no side effects.</li>
    <li><strong>Immutability</strong> — data is never mutated in place; changes produce new data.</li>
    <li><strong>Composition</strong> — behaviors are built by gluing together small functions.</li>
  </ul>
  <div class="callout">
    <strong>A new mindset</strong>
    <p>FP is not a new feature set — it is a shift in how you think about state. If you can write a function that returns a value and changes nothing else, you have taken the first step.</p>
  </div>
  <div class="callout callout-tip">
    <strong>In this course</strong>
    <p>You will learn each pillar one lesson at a time, then rebuild a real program around a pure core in the capstone.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02D00000-0000-4000-8000-000000000402',
  '02D00000-0000-4000-8000-000000000302',
  1,
  'Why Pure Functions Matter',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Why Pure Functions Matter</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f5f3ff; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Why Pure Functions Matter</h1>
  <p>A <strong>pure function</strong> carries two guarantees:</p>
  <ol>
    <li><strong>Deterministic</strong> — given the same arguments, it always returns the same result.</li>
    <li><strong>Side-effect free</strong> — it reads nothing except its arguments and changes nothing outside itself.</li>
  </ol>
  <pre class="code-block">// pure — only reads arguments, returns a value
function taxFor(price, rate) {
  return price * rate;
}

// impure — reads global state and mutates it
let orderTotal = 0;
function applyTax(price) {
  orderTotal += price * 0.08;   // modifies external state
  return orderTotal;
}</pre>
  <h2>Avoiding side effects</h2>
  <p>Side effects are anything a function does besides returning a value: writing to the console, mutating an array, saving to a database, reading the clock, or updating a variable in the outside world.</p>
  <table>
    <tr><th>Pure</th><th>Impure</th></tr>
    <tr><td>same input always gives same output</td><td>same input can give different outputs</td></tr>
    <tr><td>no surprises for callers</td><td>silently changes shared state</td></tr>
    <tr><td>trivial to test</td><td>requires setup and cleanup</td></tr>
  </table>
  <h2>Why purity pays off</h2>
  <ul>
    <li><strong>Testing</strong> — call it, assert the return value, done.</li>
    <li><strong>Reasoning</strong> — a bug can only be caused by the arguments.</li>
    <li><strong>Caching &amp; parallelism</strong> — deterministic calls can be memoized and run safely in parallel.</li>
  </ul>
  <div class="callout">
    <strong>You cannot avoid side effects entirely</strong>
    <p>Every program must eventually print, save, or send something. The trick is to <em>push side effects to the edges</em> and keep the core logic pure.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Naming helps</strong>
    <p>Prefacing impure functions helps reviewers: <span class="ic">writeOrder</span>, <span class="ic">logEvent</span>, and <span class="ic">fetchUser</span> are obviously not pure.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02D00000-0000-4000-8000-000000000404',
  '02D00000-0000-4000-8000-000000000304',
  1,
  'Immutability & Value Semantics',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Immutability & Value Semantics</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f5f3ff; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Immutability &amp; Value Semantics</h1>
  <p><strong>Immutability</strong> means data never changes after it is created. Instead of modifying a value in place, you derive a <strong>new value</strong> that shares everything it did not need to change.</p>
  <h2>In-place mutation vs new values</h2>
  <pre class="code-block">// Mutable — changes the original array
const a = [1, 2, 3];
a.push(4);                // a is now [1, 2, 3, 4]

// Immutable — leaves the original alone
const b = [1, 2, 3];
const c = [...b, 4];      // b is still [1, 2, 3]; c is [1, 2, 3, 4]</pre>
  <p>Objects work the same way. Prefer building new objects over assigning properties:</p>
  <pre class="code-block">const user = { name: 'Ana', paid: false };
const updated = { ...user, paid: true };   // a new object
// user.paid is still false</pre>
  <h2>const does not make values immutable</h2>
  <div class="callout">
    <strong>const ≠ immutable</strong>
    <p><span class="ic">const</span> only prevents reassigning the binding. <span class="ic">const arr = [];</span> still allows <span class="ic">arr.push(1)</span>. Immutability is a <em>discipline</em>, achieved with spread, <span class="ic">concat</span>, <span class="ic">map</span>, <span class="ic">Object.freeze</span>, or persistent data structures.</p>
  </div>
  <h2>Structural sharing</h2>
  <p>Immutable updates are not wasteful copies. The new list or tree <strong>shares</strong> the unchanged pieces, so the cost of an update is proportional to the path that changed, not the whole structure.</p>
  <table>
    <tr><th>Pattern</th><th>Mutable</th><th>Immutable</th></tr>
    <tr><td>append</td><td>push (in place)</td><td>concat / spread</td></tr>
    <tr><td>update item</td><td>arr[i] = x</td><td>map to a new array</td></tr>
    <tr><td>update object</td><td>obj.k = v</td><td>{ ...obj, k: v }</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Why it matters</strong>
    <p>Imagine two parts of the app both holding the same user object. If one mutates it, the other shows changed data invisibly. Immutable values make <em>change visible</em>: there is always a new value, and the old one stays intact.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02D00000-0000-4000-8000-000000000405',
  '02D00000-0000-4000-8000-000000000305',
  1,
  'Referential Transparency',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Referential Transparency</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f5f3ff; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Referential Transparency</h1>
  <p>An expression is <strong>referentially transparent</strong> when you can replace it with its value without changing the behavior of the program. Pure functions are referentially transparent; impure expressions are not.</p>
  <pre class="code-block">// Referentially transparent
function add(a, b) { return a + b; }
const x = add(2, 3) * 10;    // == 5 * 10 == 50
const y = 5 * 10;            // identical result

// Not referentially transparent
let clicks = 0;
function countClick() { clicks++; return clicks; }
const p = countClick();      // 1
const q = countClick();      // 2 — same call, different result</pre>
  <h2>Why you should care</h2>
  <p>When every expression can be mentally replaced by its value, the program becomes an equation you can rearrange:</p>
  <ul>
    <li><strong>Reorder freely</strong> — independent pure calls can run in any order, or in parallel.</li>
    <li><strong>Cache safely</strong> — the same call always returns the same value, so memoization is always correct.</li>
    <li><strong>Test with confidence</strong> — no hidden clock, no global state, no I/O to mock.</li>
  </ul>
  <pre class="code-block">// Memoizing a pure calculation is trivially safe
const sumCache = new Map();
function sumUpTo(n) {
  if (n &lt;= 1) return n;
  if (sumCache.has(n)) return sumCache.get(n);
  const v = n + sumUpTo(n - 1);
  sumCache.set(n, v);
  return v;
}</pre>
  <div class="callout">
    <strong>The acid test</strong>
    <p>Ask: &ldquo;can I substitute the call with its result?&rdquo; If yes, the expression is referentially transparent — and it almost certainly calls only pure functions.</p>
  </div>
  <div class="callout callout-tip">
    <strong>One impure call ruins the meal</strong>
    <p>A single read of <span class="ic">Date.now()</span> or <span class="ic">Math.random()</span> breaks transparency for every call that uses it. Keep randomness, time, and I/O at the edges, and inject them as arguments when you must.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02D00000-0000-4000-8000-000000000407',
  '02D00000-0000-4000-8000-000000000307',
  1,
  'First-Class Functions',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>First-Class Functions</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f5f3ff; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>First-Class Functions</h1>
  <p>Functions are <strong>first-class citizens</strong>: they can be stored in variables, placed in arrays, passed as arguments, returned from other functions, and assigned to object properties — just like numbers and strings.</p>
  <pre class="code-block">// Store a function in a variable
const square = (n) =&gt; n * n;

// Put functions in a data structure
const ops = {
  add: (a, b) =&gt; a + b,
  sub: (a, b) =&gt; a - b,
};

// Pass a function as an argument
const sizes = [4, 9, 16];
const sides = sizes.map(Math.sqrt);   // [2, 3, 4]</pre>
  <h2>Why this matters</h2>
  <p>Because functions are values, behavior can be <strong>passed around like data</strong>. You can write one algorithm that works with any comparison logic, any transform, any predicate:</p>
  <pre class="code-block">[3, 1, 2].sort((x, y) =&gt; x - y);        // ascending
[3, 1, 2].sort((x, y) =&gt; y - x);        // descending
words.filter((w) =&gt; w.length &gt; 4);      // long words only</pre>
  <h2>Function references vs calls</h2>
  <table>
    <tr><th>Write</th><th>Meaning</th></tr>
    <tr><td>sort(someFn)</td><td>pass the function itself</td></tr>
    <tr><td>sort(someFn())</td><td>call it first, pass its result</td></tr>
  </table>
  <div class="callout">
    <strong>No parentheses = no call</strong>
    <p>Referring to a function without <span class="ic">()</span> passes the function value itself. Adding parentheses evaluates it. Mixing these up is one of the most common FP bugs.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Behavior = data</strong>
    <p>Think of strategies (sort order, validation rules, renderers) as data you can choose at runtime. That is first-class thinking applied.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02D00000-0000-4000-8000-000000000408',
  '02D00000-0000-4000-8000-000000000308',
  1,
  'Higher-Order Functions',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Higher-Order Functions</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f5f3ff; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Higher-Order Functions</h1>
  <p>A <strong>higher-order function</strong> (HOF) is a function that takes another function as an argument, returns a function, or both. They are the power tools of functional programming.</p>
  <h2>Functions that take functions</h2>
  <pre class="code-block">function when(predicate, onTrue) {
  return (value) =&gt; (predicate(value) ? onTrue(value) : value);
}

const describe = when((n) =&gt; n &gt; 0, (n) =&gt; `${n} (positive)`);
console.log(describe(5));    // '5 (positive)'
console.log(describe(-3));   // -3  — unchanged</pre>
  <h2>Functions that return functions</h2>
  <pre class="code-block">function multiplyBy(factor) {
  return (n) =&gt; n * factor;      // returns a brand new function
}

const double = multiplyBy(2);
const triple = multiplyBy(3);
console.log(double(10), triple(10));   // 20 30</pre>
  <h2>Combinators you already know</h2>
  <table>
    <tr><th>HOF</th><th>What it does</th></tr>
    <tr><td>map(fn)</td><td>transform every item into a new array</td></tr>
    <tr><td>filter(fn)</td><td>keep items where fn returns true</td></tr>
    <tr><td>reduce(fn, init)</td><td>fold a list into a single value</td></tr>
    <tr><td>sort(fn)</td><td>order items with a comparator</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>They replace so many loops</strong>
    <p>Map, filter, and reduce capture the <em>intent</em> of a loop — transform, select, aggregate — instead of the mechanics. The loop is still running; you just stop writing it.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Build your own</strong>
    <p>Write small HOFs like <span class="ic">not</span>, <span class="ic">tap</span>, or <span class="ic">once</span> once in a library, then reuse them everywhere. They compose beautifully with each other.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02D00000-0000-4000-8000-000000000410',
  '02D00000-0000-4000-8000-000000000310',
  1,
  'Closures',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Closures</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f5f3ff; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Closures</h1>
  <p>A <strong>closure</strong> is a function that remembers the variables in the scope where it was created, even after that scope has finished running. It is the mechanism behind factories, counters, and encapsulation in almost every language.</p>
  <h2>A function that remembers</h2>
  <pre class="code-block">function makeCounter() {
  let count = 0;               // captured by the closure
  return () =&gt; {
    count += 1;
    return count;
  };
}

const counter = makeCounter();
console.log(counter());   // 1
console.log(counter());   // 2

// each call to makeCounter creates an independent counter
const other = makeCounter();
console.log(other());     // 1</pre>
  <h2>Configuration as a factory</h2>
  <pre class="code-block">function taxRate(percent) {
  return (amount) =&gt; amount * percent / 100;
}

const vat = taxRate(19);
const gst = taxRate(10);
console.log(vat(200));   // 38
console.log(gst(200));   // 20</pre>
  <h2>Closure-based privacy</h2>
  <p>Before &ldquo;private&rdquo; fields existed, closures were the idiomatic way to hide state:</p>
  <pre class="code-block">const wallet = (() =&gt; {
  let balance = 0;
  return {
    deposit: (n) =&gt; { balance += n; },
    balance: () =&gt; balance,
  };
})();

wallet.deposit(50);
console.log(wallet.balance());   // 50
// balance itself is not reachable from outside</pre>
  <div class="callout">
    <strong>Each call opens a fresh closure</strong>
    <p>Every invocation of a factory function captures its <em>own</em> copy of the local variables. Two counters from the same factory never share state.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Watch out for loop capture</strong>
    <p>Classic bug: creating closures inside a loop with <span class="ic">var</span> captures the same slot (so every closure sees the final value). <span class="ic">let</span> fixes it, because it creates a new binding per iteration.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02D00000-0000-4000-8000-000000000411',
  '02D00000-0000-4000-8000-000000000311',
  1,
  'Currying & Partial Application',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Currying & Partial Application</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f5f3ff; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Currying &amp; Partial Application</h1>
  <p><strong>Currying</strong> transforms a function that takes several arguments into a chain of functions that each take one argument. Each step captures a value, so the final call is a one-argument function.</p>
  <p><strong>Partial application</strong> fixes some arguments of a function and leaves the rest for later. The two are siblings — currying makes partial application trivial.</p>
  <h2>Curried functions in steps</h2>
  <pre class="code-block">// add(x, y, z)  →  curried: x =&gt; y =&gt; z =&gt; result
const add = (x) =&gt; (y) =&gt; (z) =&gt; x + y + z;

const add10 = add(10);       // capture x = 10
const add10And5 = add10(5);  // capture y = 5
console.log(add10And5(2));   // 17 — now supply z
console.log(add(10)(5)(2));  // 17 — same thing, in one go</pre>
  <h2>Partial application</h2>
  <pre class="code-block">function formatCurrency(code, amount) {
  return `${amount.toFixed(2)} ${code}`;
}

const inEUR = formatCurrency.bind(null, 'EUR');
console.log(inEUR(9.99));    // '9.99 EUR'

function partial(fn, ...fixed) {
  return (...rest) =&gt; fn(...fixed, ...rest);
}
const inUSD = partial(formatCurrency, 'USD');</pre>
  <h2>Why curry at all?</h2>
  <ul>
    <li><strong>Specialization</strong> — turn a general function into a purpose-built one, such as <span class="ic">inEUR</span> or <span class="ic">toCelsius</span>.</li>
    <li><strong>Composition</strong> — single-argument functions chain perfectly with <span class="ic">pipe</span>.</li>
    <li><strong>Reuse</strong> — configure once, apply many times.</li>
  </ul>
  <table>
    <tr><th>Technique</th><th>What it does</th></tr>
    <tr><td>Currying</td><td>turns an n-ary function into a chain of unary calls</td></tr>
    <tr><td>Partial application</td><td>binds some arguments now, leaves the rest free</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Currying ≠ partial application</strong>
    <p>Currying is a <em>shape</em> (nested unary functions). Partial application is a <em>move</em> (binding arguments). A curried function naturally supports partial application, but a partially applied function is not necessarily curried.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Don&rsquo;t overdo it</strong>
    <p>Currying shines in pipelines and config-heavy libraries. For most application code, keep functions multi-argument and curry only where it improves the data flow.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02D00000-0000-4000-8000-000000000413',
  '02D00000-0000-4000-8000-000000000313',
  1,
  'Transforming with map & filter',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Transforming with map & filter</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f5f3ff; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Transforming with map &amp; filter</h1>
  <p><span class="ic">map</span> and <span class="ic">filter</span> replace two very common loop patterns — and they always return <strong>new arrays</strong>, leaving the original untouched.</p>
  <h2>map — transform every item</h2>
  <pre class="code-block">const prices = [19.99, 4.5, 120];

const inCents = prices.map((p) =&gt; Math.round(p * 100));
// [1999, 450, 12000] — the original prices are unchanged

// map also passes the index as the second argument
const tagged = prices.map((p, i) =&gt; `item-${i}: ${p}`);</pre>
  <h2>filter — select items</h2>
  <pre class="code-block">const orders = [
  { id: 1, total: 40, status: 'paid' },
  { id: 2, total: 15, status: 'pending' },
  { id: 3, total: 99, status: 'paid' },
];

const unpaid = orders.filter((o) =&gt; o.status !== 'paid');
// [ { id: 2, total: 15, status: 'pending' } ]</pre>
  <h2>Chaining them</h2>
  <pre class="code-block">const report = orders
  .filter((o) =&gt; o.status === 'paid')
  .map((o) =&gt; `${o.id}: $${o.total.toFixed(2)}`);</pre>
  <table>
    <tr><th>Operation</th><th>Returns</th><th>Length</th><th>Signature</th></tr>
    <tr><td>map</td><td>new array</td><td>same</td><td>map(transform)</td></tr>
    <tr><td>filter</td><td>new array</td><td>0 to same</td><td>filter(keep?)</td></tr>
  </table>
  <div class="callout">
    <strong>Pure by construction</strong>
    <p>If the callback you pass is pure, then <span class="ic">map</span> and <span class="ic">filter</span> are pure too — the same array always yields the same new array, and the input is never mutated.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Read it aloud</strong>
    <p>&ldquo;Take every paid order and tag it with its id&rdquo; maps 1:1 to filter→map. That readability is why they beat manual loops.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02D00000-0000-4000-8000-000000000414',
  '02D00000-0000-4000-8000-000000000314',
  1,
  'Aggregating with reduce',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Aggregating with reduce</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f5f3ff; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Aggregating with reduce</h1>
  <p><span class="ic">reduce</span> folds a collection down to a single value — a sum, a counter, an object, even another array. It is the general form that map and filter are special cases of.</p>
  <h2>The shape of reduce</h2>
  <pre class="code-block">// reduce(callback, initialAccumulator)
// callback(accumulator, currentValue) =&gt; newAccumulator
const total = [2, 3, 4].reduce((sum, n) =&gt; sum + n, 0);
// 0 + 2 + 3 + 4  =  9</pre>
  <h2>Reducing to an object</h2>
  <pre class="code-block">const orders = [
  { item: 't-shirt', qty: 2 },
  { item: 'mug',     qty: 1 },
  { item: 't-shirt', qty: 1 },
];

const stock = orders.reduce((acc, o) =&gt; ({
  ...acc,
  [o.item]: (acc[o.item] || 0) + o.qty,
}), {});
// { 't-shirt': 3, mug: 1 }</pre>
  <h2>Grouping by status</h2>
  <pre class="code-block">const paid = [
  { id: 1, status: 'paid' },
  { id: 2, status: 'pending' },
  { id: 3, status: 'paid' },
].reduce((acc, o) =&gt; ({
  ...acc,
  [o.status]: [...(acc[o.status] || []), o.id],
}), {});
// { paid: [1, 3], pending: [2] }</pre>
  <div class="callout callout-info">
    <strong>Always pass an initial value</strong>
    <p>Without an initial value, reduce uses the first element as the seed — which changes the type of the accumulator and throws on empty arrays. An explicit seed keeps the fold total and safe.</p>
  </div>
  <table>
    <tr><th>Fold</th><th>Direction</th></tr>
    <tr><td>reduce(fn, seed)</td><td>left to right</td></tr>
    <tr><td>reduceRight(fn, seed)</td><td>right to left</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>reduce can become a trap</strong>
    <p>Overly clever one-liners hurt readability. If a loop, or a <span class="ic">map</span> plus <span class="ic">filter</span>, expresses the intent better, use that instead.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02D00000-0000-4000-8000-000000000416',
  '02D00000-0000-4000-8000-000000000316',
  1,
  'Function Composition',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Function Composition</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f5f3ff; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Function Composition</h1>
  <p><strong>Composition</strong> means combining two or more functions so the output of one becomes the input of the next. It is how functional programs grow without growing in complexity.</p>
  <h2>Manual composition first</h2>
  <pre class="code-block">const toUpper = (s) =&gt; s.toUpperCase();
const trim    = (s) =&gt; s.trim();
const exclaim = (s) =&gt; s + '!';

// nested calls — hard to read left to right
const loud = exclaim(toUpper(trim(name)));</pre>
  <h2>Compose and pipe</h2>
  <pre class="code-block">// compose runs right to left (innermost first)
const compose = (...fns) =&gt; (x) =&gt; fns.reduceRight((v, f) =&gt; f(v), x);

// pipe runs left to right (top to bottom) — easier to read
const pipe = (...fns) =&gt; (x) =&gt; fns.reduce((v, f) =&gt; f(v), x);

const shout = pipe(trim, toUpper, exclaim);
console.log(shout('  hello  '));   // 'HELLO!'</pre>
  <h2>Composition is associative</h2>
  <p>Grouping does not change the result: <span class="ic">combine(a, combine(b, c))</span> equals <span class="ic">combine(combine(a, b), c)</span>. That means you can build programs from part-chunks without breaking their meaning.</p>
  <pre class="code-block">const slugify = pipe(
  toLowerCase,
  (s) =&gt; s.replace(/\s+/g, '-'),   // spaces to dashes
  stripPunctuation,
);</pre>
  <div class="callout">
    <strong>One function, one job</strong>
    <p>Composition only stays readable when each piece is tiny and single-purpose. Naming the pipeline tells the reader the whole story at a glance.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Compromise with care</strong>
    <p>JavaScript is not a pure FP language — nobody will force you to pipe every value. Prefer pipe for straight-line transforms and plain calls everywhere else.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02D00000-0000-4000-8000-000000000417',
  '02D00000-0000-4000-8000-000000000317',
  1,
  'Pipelines & Point-Free Style',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pipelines & Point-Free Style</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f5f3ff; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Pipelines &amp; Point-Free Style</h1>
  <p>A <strong>pipeline</strong> is a sequence of transformations where each stage feeds the next. Combined with <strong>point-free style</strong> — writing functions without naming the intermediate data that flows through them — pipelines read like a recipe.</p>
  <h2>Data flows down the pipe</h2>
  <pre class="code-block">const processOrder = pipe(
  parse,
  validate,
  applyDiscounts,
  calculateTotals,
  toReceipt,
);</pre>
  <h2>Named stages instead of nested values</h2>
  <pre class="code-block">// Before — intermediate variables everywhere
function formatReport(raw) {
  const rows = filterPaid(raw.orders);
  const lines = rows.map(toLine);
  const joined = lines.join('\n');
  return `Total: ${total(lines)}\n\n${joined}`;
}

// After — the data itself is implicit, the stages are named
const formatReport = pipe(
  (o) =&gt; o.orders,
  filterPaid,
  (rows) =&gt; rows.map(toLine),
  wrapWithHeader,   // adds the header and joins the lines
);</pre>
  <h2>When point-free helps and hurts</h2>
  <table>
    <tr><th>Point-free shines</th><th>Point-free hurts</th></tr>
    <tr><td>straight-line transforms</td><td>many branches and conditionals</td></tr>
    <tr><td>shared, reusable pipelines</td><td>deeply nested one-offs</td></tr>
    <tr><td>composable verb collections</td><td>debugging with breakpoints</td></tr>
  </table>
  <div class="callout">
    <strong>Readability is the goal, not the aesthetic</strong>
    <p>Point-free is a <em>tool</em>. The moment a pipeline is harder to follow than the equivalent named-variable code, write the named code.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Debug pipes by naming stages</strong>
    <p>Give each stage a real name (<span class="ic">parse</span>, <span class="ic">validate</span>) — then a call stack tells you exactly which stage failed.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02D00000-0000-4000-8000-000000000419',
  '02D00000-0000-4000-8000-000000000319',
  1,
  'Recursion Fundamentals',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Recursion Fundamentals</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f5f3ff; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Recursion Fundamentals</h1>
  <p><strong>Recursion</strong> is a function that calls itself. Every recursive solution needs two parts:</p>
  <ol>
    <li><strong>Base case</strong> — the smallest problem, answered directly.</li>
    <li><strong>Recursive case</strong> — break the problem into a smaller version and combine the results.</li>
  </ol>
  <h2>Factorial</h2>
  <pre class="code-block">// n! = n * (n - 1) * ... * 1
function fact(n) {
  if (n &lt;= 1) return 1;          // base case
  return n * fact(n - 1);        // recursive case
}
console.log(fact(5));            // 120</pre>
  <h2>Walking the call stack</h2>
  <pre class="code-block">fact(4)
  = 4 * fact(3)
  = 4 * 3 * fact(2)
  = 4 * 3 * 2 * fact(1)
  = 4 * 3 * 2 * 1
  = 24</pre>
  <h2>Countdown</h2>
  <pre class="code-block">function countdown(n) {
  if (n === 0) { console.log('go!'); return; }
  console.log(n);
  countdown(n - 1);       // progress toward the base case
}
countdown(3);   // 3, 2, 1, go!</pre>
  <h2>Recursion vs loops</h2>
  <table>
    <tr><th>Recursion</th><th>Loops</th></tr>
    <tr><td>fits recursive data (trees, lists)</td><td>fits flat, indexed data</td></tr>
    <tr><td>no extra bookkeeping variables</td><td>explicit mutable counters</td></tr>
    <tr><td>uses the call stack</td><td>no stack growth</td></tr>
  </table>
  <div class="callout">
    <strong>Every step must shrink</strong>
    <p>If the recursive call does not move toward the base case, the function loops forever and blows the stack. Make the shrink step obvious.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Think in sub-problems</strong>
    <p>Ask: what is the smallest example? What is one step that reduces any other example toward it? Write those two branches and you have recursion.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02D00000-0000-4000-8000-000000000420',
  '02D00000-0000-4000-8000-000000000320',
  1,
  'Recursion in Practice: Trees & Tail Calls',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Recursion in Practice: Trees & Tail Calls</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f5f3ff; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Recursion in Practice: Trees &amp; Tail Calls</h1>
  <p>Recursion earns its keep on <strong>recursive data</strong> — structures that contain versions of themselves, like nested comments, file systems, and expression trees.</p>
  <h2>A file system tree</h2>
  <pre class="code-block">const tree = {
  name: 'src',
  children: [
    { name: 'app', children: [{ name: 'main.js', children: [] }] },
    { name: 'styles', children: [{ name: 'theme.css', children: [] }] },
  ],
};</pre>
  <h2>Depth-first walk</h2>
  <pre class="code-block">function walk(node, depth = 0) {
  console.log('  '.repeat(depth) + node.name);
  for (const child of node.children) {
    walk(child, depth + 1);
  }
}
walk(tree);   // prints the whole tree</pre>
  <h2>Summing nested numbers</h2>
  <pre class="code-block">function sumNodes(node, root = 10) {
  if (node.children.length === 0) return node.value ?? 0;
  return node.children.reduce(
    (acc, child) =&gt; acc + sumNodes(child),
    0,
  );
}</pre>
  <h2>Tail calls and stack safety</h2>
  <p>A <strong>tail call</strong> is a recursion where the recursive call is the very last thing the function does, so nothing remains on the stack. Trampolines or explicit loops give the same efficiency while keeping recursive structure:</p>
  <pre class="code-block">// tail-recursive helper — the call is in tail position
function sumTo(n, acc = 0) {
  if (n === 0) return acc;
  return sumTo(n - 1, acc + n);
}
console.log(sumTo(1000));   // 500500</pre>
  <div class="callout callout-info">
    <strong>Depth limits are real</strong>
    <p>JavaScript stacks are finite (on the order of ~10k frames). Deep recursion on huge data needs tail-call tricks, trampolines, or an explicit stack.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Prefer reduce for flat lists</strong>
    <p>For plain arrays, <span class="ic">reduce</span> is recursion with the stack handled for you. Reserve hand-written recursion for genuinely nested data.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02D00000-0000-4000-8000-000000000422',
  '02D00000-0000-4000-8000-000000000322',
  1,
  'Functors & Mapping Containers',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Functors & Mapping Containers</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f5f3ff; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Functors &amp; Mapping Containers</h1>
  <p>A <strong>functor</strong> is a container you can <strong>map</strong> over: you apply a function to the value inside without unwrapping it by hand, and the container keeps its shape.</p>
  <ul>
    <li>An <strong>array</strong> is a functor: <span class="ic">[1, 2, 3].map(f)</span> gives a new array.</li>
    <li>A <strong>Maybe</strong> is a functor: a value that may or may not exist.</li>
  </ul>
  <h2>Map works inside the container</h2>
  <pre class="code-block">const users = [ { name: 'Ana', age: 25 }, { name: 'Bo', age: 19 } ];

const names = users.map((u) =&gt; u.name);
// [ 'Ana', 'Bo' ] — the container shape (array) is preserved</pre>
  <h2>A tiny Box functor</h2>
  <pre class="code-block">function Box(value) {
  return {
    map: (fn) =&gt; Box(fn(value)),   // still a Box, new value
    value,
  };
}

const result = Box(5)
  .map((n) =&gt; n * 2)      // Box(10)
  .map((n) =&gt; n + 1)      // Box(11)
  .value;                   // 11</pre>
  <h2>The functor laws</h2>
  <table>
    <tr><th>Law</th><th>Meaning</th></tr>
    <tr><td>Identity</td><td>map(x =&gt; x) is the same as the plain container</td></tr>
    <tr><td>Composition</td><td>map(f) then map(g) equals map(x =&gt; g(f(x)))</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Why the laws matter</strong>
    <p>They are not decoration — they let you refactor <span class="ic">map</span> chains freely. If a container obeys them, you can merge, split, and reorder maps without changing behavior.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Spot functors everywhere</strong>
    <p>Promises (<span class="ic">then</span>), arrays (<span class="ic">map</span>), and optional chains (<span class="ic">?.()</span>) are all functor-like. Recognizing the shape lets you apply the same laws to each.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02D00000-0000-4000-8000-000000000423',
  '02D00000-0000-4000-8000-000000000323',
  1,
  'Monads & the Maybe Pattern',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Monads & the Maybe Pattern</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f5f3ff; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Monads &amp; the Maybe Pattern</h1>
  <p>A <strong>monad</strong> is a functor with an extra superpower: its map can <strong>flatten</strong> results that are already wrapped, keeping your pipeline flat instead of nesting containers.</p>
  <p>The most practical monad for daily code is <strong>Maybe</strong> — a value that is either <span class="ic">Just(value)</span> or <span class="ic">Nothing</span>. It encodes optionality without scattered null checks.</p>
  <h2>Nested null checks get ugly</h2>
  <pre class="code-block">if (user) {
  if (user.address) {
    if (user.address.city) {
      render(user.address.city);
    }
  }
}</pre>
  <h2>flatMap keeps the chain flat</h2>
  <pre class="code-block">const Maybe = {
  Just:    (v) =&gt; ({ map: (f) =&gt; Maybe.Just(f(v)),   flatMap: (f) =&gt; f(v),  value: v }),
  Nothing: ()  =&gt; ({ map: () =&gt; Maybe.Nothing(),     flatMap: () =&gt; Maybe.Nothing() }),
};

const address = Maybe.Just(user)
  .flatMap((u) =&gt; (u.address ? Maybe.Just(u.address) : Maybe.Nothing()))
  .flatMap((a) =&gt; (a.city   ? Maybe.Just(a.city)   : Maybe.Nothing()));
// address is Just('Oslo') or Nothing — never an exception</pre>
  <div class="callout callout-info">
    <strong>Chain = flatMap, transform = map</strong>
    <p>Use <span class="ic">map</span> to transform a value inside the wrapper; use <span class="ic">flatMap</span> (a.k.a. <span class="ic">chain</span> / <span class="ic">then</span>) when the next step already returns a wrapper.</p>
  </div>
  <h2>You already use monads</h2>
  <ul>
    <li><strong>Promises</strong> — <span class="ic">then</span> flattens nested promises.</li>
    <li><strong>Arrays</strong> — <span class="ic">flatMap</span> flattens nested arrays.</li>
    <li><strong>Optional chaining</strong> — <span class="ic">?.</span> short-circuits to undefined.</li>
  </ul>
  <div class="callout">
    <strong>Start small</strong>
    <p>You do not need a monad library to benefit. Modeling &ldquo;maybe&rdquo; with a tiny Just/Nothing helper (or disciplined <span class="ic">??</span>) removes a whole class of null crashes.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Don&rsquo;t boast the jargon</strong>
    <p>Monads sound exotic but are simply &ldquo;wrappers you can chain without unboxing.&rdquo; Teams value the <em>pattern</em>, not the vocabulary.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02D00000-0000-4000-8000-000000000425',
  '02D00000-0000-4000-8000-000000000325',
  1,
  'FP in Practice: Refactoring Real Code',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FP in Practice: Refactoring Real Code</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f5f3ff; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>FP in Practice: Refactoring Real Code</h1>
  <p>Bringing FP into a working codebase is a <strong>refactoring discipline</strong>: find the assignment-heavy, side-effect-dense routines and carve out pure functions you can reuse and test.</p>
  <h2>Recipe</h2>
  <ol>
    <li>Copy the messy routine (a submit handler, a pricing function) into a workspace.</li>
    <li>Extract the <em>decisions</em> — validation, math, formatting — into pure functions.</li>
    <li>Keep one thin, impure shell that does I/O and calls the pure core.</li>
  </ol>
  <h2>Before — a tangle of state</h2>
  <pre class="code-block">let cart = [];
function checkout(user) {
  cart.forEach((i) =&gt; i.total = i.price * i.qty);
  cart = cart.filter((i) =&gt; i.qty &gt; 0);
  if (user.coupon) { cart.forEach((i) =&gt; i.total *= 0.9); }
  localStorage.setItem('cart', JSON.stringify(cart));
  renderTotal(cart.reduce((s, i) =&gt; s + i.total, 0));
}</pre>
  <h2>After — pure core, thin shell</h2>
  <pre class="code-block">// pure pieces — same inputs, same outputs, no storage, no rendering
const lineTotals = (cart) =&gt; cart.map((i) =&gt; ({ ...i, total: i.price * i.qty }));
const removeEmpty = (items) =&gt; items.filter((i) =&gt; i.qty &gt; 0);
const applyCoupon = (rate) =&gt; (item) =&gt; ({ ...item, total: item.total * rate });
const pricesTotal = (items) =&gt; items.reduce((s, i) =&gt; s + i.total, 0);

// impure shell — the ONLY place side effects live
function checkout(user, cart, persist, render) {
  const items = pipe(lineTotals, removeEmpty)(cart);
  const withCoupon = user.coupon ? items.map(applyCoupon(0.9)) : items;
  persist(items);
  render(pricesTotal(withCoupon));
}</pre>
  <div class="callout">
    <strong>Smells that scream &ldquo;extract&rdquo;</strong>
    <p>Assignment to parameters, <span class="ic">i.total =</span> inside a loop, localStorage sprinkled through logic, and the same calculation duplicated across functions.</p>
  </div>
  <h2>FP smells and fixes</h2>
  <table>
    <tr><th>Smell</th><th>FP fix</th></tr>
    <tr><td>mutation hidden mid-function</td><td>build new values with spread / map</td></tr>
    <tr><td>a loop carrying three accumulators</td><td>reduce / composed stages</td></tr>
    <tr><td>logic mixed with I/O</td><td>split pure core from impure shell</td></tr>
    <tr><td>an untestable function</td><td>inject dependencies as arguments</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Refactor in tiny steps</strong>
    <p>Extract one pure function, keep the tests green, commit. Attempting a whole-module rewrite in one shot is the fastest way to burn goodwill.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02D00000-0000-4000-8000-000000000426',
  '02D00000-0000-4000-8000-000000000326',
  1,
  'Capstone: Setup & Data Model',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Setup & Data Model</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f5f3ff; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Capstone: Setup &amp; Data Model</h1>
  <p>Time to build the capstone: <strong>Shoply</strong>, a tiny checkout and receipt engine. The rule is strict — every calculation lives in a pure, testable core, and the UI is a thin shell.</p>
  <h2>Project structure</h2>
  <pre class="code-block">shoply/
  cart.js      // pure cart functions (the core)
  money.js     // pure formatting helpers
  ui.js        // render + DOM (impure, thin)
  main.js      // wiring and event listeners
  cart.test.js // tests for the pure core</pre>
  <h2>Immutable data model</h2>
  <pre class="code-block">// Items and carts are plain objects — all updates produce new objects
const addItem = (cart, item) =&gt; ({
  ...cart,
  items: [...cart.items, item],
});

const setQty = (cart, id, qty) =&gt; ({
  ...cart,
  items: cart.items.map((i) =&gt;
    i.id === id ? { ...i, qty } : i),
});</pre>
  <h2>Write the tests first</h2>
  <pre class="code-block">// cart.test.js — the pure core is trivial to test
test('addItem appends without mutating the cart', () =&gt; {
  const cart = { items: [] };
  const next = addItem(cart, { id: 'a', price: 5, qty: 1 });
  assert.deepEqual(cart.items, []);       // original intact
  assert.equal(next.items.length, 1);     // new cart has the item
});</pre>
  <div class="callout">
    <strong>Model as data</strong>
    <p>Decide the state shape before writing behavior: an item is <span class="ic">{ id, name, price, qty }</span>, a cart is <span class="ic">{ items: [...] }</span>. Immutable shapes make every function a pure transform.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Test the pure things first</strong>
    <p>Because the core is pure, you can assert exact outputs with zero mocks — no DOM, no timers, no network to simulate.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02D00000-0000-4000-8000-000000000427',
  '02D00000-0000-4000-8000-000000000327',
  1,
  'Capstone: Building the Pure Core',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Building the Pure Core</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f5f3ff; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Capstone: Building the Pure Core</h1>
  <p>Now assemble the full engine from small, pure pieces. Given any cart and user, you get a receipt — deterministically, every single time.</p>
  <h2>The pipeline</h2>
  <pre class="code-block">const lineTotal = ({ price, qty }) =&gt; price * qty;
const addTotals = (cart) =&gt; cart.map((i) =&gt; ({ ...i, lineTotal: lineTotal(i) }));
const subTotal  = (cart) =&gt; cart.reduce((s, i) =&gt; s + i.lineTotal, 0);

const applyVat  = (rate) =&gt; (sub) =&gt; sub * (1 + rate);
const discount  = (pct) =&gt; (sub) =&gt; sub * (1 - pct);
const round     = (n) =&gt; Math.round(n * 100) / 100;</pre>
  <h2>Compose the receipt</h2>
  <pre class="code-block">const buildReceipt = (cart, user) =&gt; {
  const items = addTotals(cart.items);
  const sub   = subTotal(items);
  const total = pipe(
    discount(user.member ? 0.1 : 0),
    applyVat(0.08),
    round,
  )(sub);
  return { items, subTotal: sub, total };
};</pre>
  <h2>The thin shell</h2>
  <pre class="code-block">import { buildReceipt } from './cart.js';
import { money } from './money.js';   // pure formatters

function renderCart(cart, user) {
  const r = buildReceipt(cart, user);
  document.getElementById('sub').textContent = money(r.subTotal);
  document.getElementById('total').textContent = money(r.total);
}</pre>
  <div class="callout">
    <strong>Notice what is missing</strong>
    <p>No <span class="ic">localStorage</span>, no DOM reads, no timers inside the core. Every rule — discount, VAT, rounding — is a pure function you can test in isolation.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Ship the tests</strong>
    <p>Add cases for: empty cart, member discount, non-member, and rounding to cents. If those pass, the pricing engine is done — before you touch a single button handler.</p>
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
  ('02D00000-0000-4000-8000-000000000501', '02D00000-0000-4000-8000-000000000303',
   'Which combination of properties defines a pure function?',
   'A pure function is deterministic and free of side effects.', 1),
  ('02D00000-0000-4000-8000-000000000502', '02D00000-0000-4000-8000-000000000303',
   'Which of these is a side effect?',
   'Writing to a database changes state outside the function.', 2),
  ('02D00000-0000-4000-8000-000000000503', '02D00000-0000-4000-8000-000000000303',
   'What did the lambda calculus model every computation as?',
   'Alonzo Church modeled computation as function application.', 3),
  ('02D00000-0000-4000-8000-000000000504', '02D00000-0000-4000-8000-000000000306',
   'Which expression returns a new array without changing the original?',
   'Spread (and concat) build fresh arrays and leave the input untouched.', 1),
  ('02D00000-0000-4000-8000-000000000505', '02D00000-0000-4000-8000-000000000306',
   'What does const guarantee for an array binding?',
   'const prevents reassignment of the binding, not mutation of the value.', 2),
  ('02D00000-0000-4000-8000-000000000506', '02D00000-0000-4000-8000-000000000306',
   'A referentially transparent expression can be...',
   'Transparent expressions swap for their values with no behavior change.', 3),
  ('02D00000-0000-4000-8000-000000000507', '02D00000-0000-4000-8000-000000000309',
   'What does it mean for functions to be first-class?',
   'Functions can be stored, passed, and returned like any other value.', 1),
  ('02D00000-0000-4000-8000-000000000508', '02D00000-0000-4000-8000-000000000309',
   'Which of these is a higher-order function?',
   'A higher-order function takes a function, returns a function, or both.', 2),
  ('02D00000-0000-4000-8000-000000000509', '02D00000-0000-4000-8000-000000000309',
   'What does map always return?',
   'map returns a new array with the same number of elements.', 3),
  ('02D00000-0000-4000-8000-000000000510', '02D00000-0000-4000-8000-000000000312',
   'What is a closure?',
   'A closure is a function that keeps access to the scope where it was created.', 1),
  ('02D00000-0000-4000-8000-000000000511', '02D00000-0000-4000-8000-000000000312',
   'Currying turns add(a, b, c) into...',
   'A curried function is a chain of unary functions, one argument per step.', 2),
  ('02D00000-0000-4000-8000-000000000512', '02D00000-0000-4000-8000-000000000312',
   'Partial application means...',
   'You fix some arguments now and supply the rest on a later call.', 3),
  ('02D00000-0000-4000-8000-000000000513', '02D00000-0000-4000-8000-000000000315',
   'filter keeps the items for which the callback...',
   'Truthy callback results keep an item; falsey results drop it.', 1),
  ('02D00000-0000-4000-8000-000000000514', '02D00000-0000-4000-8000-000000000315',
   'What is the result of [1, 2, 3].map(n =&gt; n * 2)?',
   'map doubles every element, yielding a new array.', 2),
  ('02D00000-0000-4000-8000-000000000515', '02D00000-0000-4000-8000-000000000315',
   'Which call sums a list starting from an explicit seed?',
   'reduce with an initial accumulator is total and safe on empty lists.', 3),
  ('02D00000-0000-4000-8000-000000000516', '02D00000-0000-4000-8000-000000000318',
   'pipe runs its functions...',
   'pipe composes left to right, top to bottom, matching reading order.', 1),
  ('02D00000-0000-4000-8000-000000000517', '02D00000-0000-4000-8000-000000000318',
   'Composition being associative means...',
   'Grouping calls in different ways does not change the computed result.', 2),
  ('02D00000-0000-4000-8000-000000000518', '02D00000-0000-4000-8000-000000000318',
   'Point-free style means...',
   'Point-free code defines functions without naming the data flowing through them.', 3),
  ('02D00000-0000-4000-8000-000000000519', '02D00000-0000-4000-8000-000000000321',
   'A recursive function requires...',
   'A base case terminates the recursion; a recursive case shrinks the problem.', 1),
  ('02D00000-0000-4000-8000-000000000520', '02D00000-0000-4000-8000-000000000321',
   'What is a tail call?',
   'A tail call is a recursive call in the last position, leaving nothing to do after it.', 2),
  ('02D00000-0000-4000-8000-000000000521', '02D00000-0000-4000-8000-000000000321',
   'Which data shape is recursion best suited for?',
   'Nested structures such as trees map naturally onto recursive functions.', 3),
  ('02D00000-0000-4000-8000-000000000522', '02D00000-0000-4000-8000-000000000324',
   'A functor is a container you can...',
   'You can map values inside a functor while conserving its shape.', 1),
  ('02D00000-0000-4000-8000-000000000523', '02D00000-0000-4000-8000-000000000324',
   'The identity law for functors says...',
   'Mapping the identity function returns the original container unchanged.', 2),
  ('02D00000-0000-4000-8000-000000000524', '02D00000-0000-4000-8000-000000000324',
   'flatMap differs from map because the callback...',
   'flatMap lets the callback return a wrapper and flattens one level.', 3),
  ('02D00000-0000-4000-8000-000000000525', '02D00000-0000-4000-8000-000000000328',
   'When refactoring toward FP, where do you start?',
   'Carve a pure, testable core out of the logic and keep I/O in the shell.', 1),
  ('02D00000-0000-4000-8000-000000000526', '02D00000-0000-4000-8000-000000000328',
   'Which of these is referentially transparent?',
   'A pure function called with fixed arguments can be swapped for its value.', 2),
  ('02D00000-0000-4000-8000-000000000527', '02D00000-0000-4000-8000-000000000328',
   'const go = pipe(parse, validate) runs parse first because pipe...',
   'pipe passes the initial value through the stages left to right.', 3),
  ('02D00000-0000-4000-8000-000000000528', '02D00000-0000-4000-8000-000000000328',
   'Why does immutability make change visible?',
   'Every update produces a fresh value while the old one stays intact.', 4),
  ('02D00000-0000-4000-8000-000000000529', '02D00000-0000-4000-8000-000000000328',
   'Where should DOM writes and storage calls live?',
   'Side effects belong in a thin impure shell at the edges of the program.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): pure function
  ('02D00000-0000-4000-8000-000000001001', '02D00000-0000-4000-8000-000000000501', 'Deterministic and side-effect free', TRUE,  1),
  ('02D00000-0000-4000-8000-000000001002', '02D00000-0000-4000-8000-000000000501', 'Deterministic but reads global state', FALSE, 2),
  ('02D00000-0000-4000-8000-000000001003', '02D00000-0000-4000-8000-000000000501', 'Side-effect free but uses Math.random()', FALSE, 3),
  ('02D00000-0000-4000-8000-000000001004', '02D00000-0000-4000-8000-000000000501', 'Always mutates its arguments', FALSE, 4),
  -- Q1 (501)q2: side effect
  ('02D00000-0000-4000-8000-000000001005', '02D00000-0000-4000-8000-000000000502', 'Writing a row to a database', TRUE,  1),
  ('02D00000-0000-4000-8000-000000001006', '02D00000-0000-4000-8000-000000000502', 'Adding two numbers', FALSE, 2),
  ('02D00000-0000-4000-8000-000000001007', '02D00000-0000-4000-8000-000000000502', 'Concatenating two strings', FALSE, 3),
  ('02D00000-0000-4000-8000-000000001008', '02D00000-0000-4000-8000-000000000502', 'Reading a local variable', FALSE, 4),
  -- Q1 (501)q3: lambda calculus
  ('02D00000-0000-4000-8000-000000001009', '02D00000-0000-4000-8000-000000000503', 'Function application and abstraction', TRUE,  1),
  ('02D00000-0000-4000-8000-000000001010', '02D00000-0000-4000-8000-000000000503', 'Mutating shared structures', FALSE, 2),
  ('02D00000-0000-4000-8000-000000001011', '02D00000-0000-4000-8000-000000000503', 'Gardening metaphors', FALSE, 3),
  ('02D00000-0000-4000-8000-000000001012', '02D00000-0000-4000-8000-000000000503', 'Assembly instruction stacks', FALSE, 4),
  -- Q2 (504): new array
  ('02D00000-0000-4000-8000-000000001013', '02D00000-0000-4000-8000-000000000504', '[...arr, 4]', TRUE,  1),
  ('02D00000-0000-4000-8000-000000001014', '02D00000-0000-4000-8000-000000000504', 'arr.push(4)', FALSE, 2),
  ('02D00000-0000-4000-8000-000000001015', '02D00000-0000-4000-8000-000000000504', 'arr[arr.length] = 4', FALSE, 3),
  ('02D00000-0000-4000-8000-000000001016', '02D00000-0000-4000-8000-000000000504', 'arr.sort()', FALSE, 4),
  -- Q2 (504)q2: const
  ('02D00000-0000-4000-8000-000000001017', '02D00000-0000-4000-8000-000000000505', 'The binding cannot be reassigned', TRUE,  1),
  ('02D00000-0000-4000-8000-000000001018', '02D00000-0000-4000-8000-000000000505', 'The array can never change', FALSE, 2),
  ('02D00000-0000-4000-8000-000000001019', '02D00000-0000-4000-8000-000000000505', 'The array is deep-frozen', FALSE, 3),
  ('02D00000-0000-4000-8000-000000001020', '02D00000-0000-4000-8000-000000000505', 'The array becomes immutable automatically', FALSE, 4),
  -- Q2 (504)q3: transparency
  ('02D00000-0000-4000-8000-000000001021', '02D00000-0000-4000-8000-000000000506', 'replaced by its value without changing behavior', TRUE,  1),
  ('02D00000-0000-4000-8000-000000001022', '02D00000-0000-4000-8000-000000000506', 'moved anywhere without recompiling', FALSE, 2),
  ('02D00000-0000-4000-8000-000000001023', '02D00000-0000-4000-8000-000000000506', 'executed only on weekends', FALSE, 3),
  ('02D00000-0000-4000-8000-000000001024', '02D00000-0000-4000-8000-000000000506', 'renamed to save keystrokes', FALSE, 4),
  -- Q3 (507): first-class
  ('02D00000-0000-4000-8000-000000001025', '02D00000-0000-4000-8000-000000000507', 'They can be stored, passed, and returned like values', TRUE,  1),
  ('02D00000-0000-4000-8000-000000001026', '02D00000-0000-4000-8000-000000000507', 'They must be declared with function', FALSE, 2),
  ('02D00000-0000-4000-8000-000000001027', '02D00000-0000-4000-8000-000000000507', 'They run only in the browser', FALSE, 3),
  ('02D00000-0000-4000-8000-000000001028', '02D00000-0000-4000-8000-000000000507', 'They cannot use closures', FALSE, 4),
  -- Q3 (507)q2: HOF
  ('02D00000-0000-4000-8000-000000001029', '02D00000-0000-4000-8000-000000000508', 'A function that takes or returns a function', TRUE,  1),
  ('02D00000-0000-4000-8000-000000001030', '02D00000-0000-4000-8000-000000000508', 'A function that loops', FALSE, 2),
  ('02D00000-0000-4000-8000-000000001031', '02D00000-0000-4000-8000-000000000508', 'A function with one parameter', FALSE, 3),
  ('02D00000-0000-4000-8000-000000001032', '02D00000-0000-4000-8000-000000000508', 'A function declared inside a class', FALSE, 4),
  -- Q3 (507)q3: map return
  ('02D00000-0000-4000-8000-000000001033', '02D00000-0000-4000-8000-000000000509', 'A new array of the same length', TRUE,  1),
  ('02D00000-0000-4000-8000-000000001034', '02D00000-0000-4000-8000-000000000509', 'The original array, mutated', FALSE, 2),
  ('02D00000-0000-4000-8000-000000001035', '02D00000-0000-4000-8000-000000000509', 'A single aggregated value', FALSE, 3),
  ('02D00000-0000-4000-8000-000000001036', '02D00000-0000-4000-8000-000000000509', 'A boolean', FALSE, 4),
  -- Q4 (510): closure
  ('02D00000-0000-4000-8000-000000001037', '02D00000-0000-4000-8000-000000000510', 'A function that remembers its creation scope', TRUE,  1),
  ('02D00000-0000-4000-8000-000000001038', '02D00000-0000-4000-8000-000000000510', 'A loop that never ends', FALSE, 2),
  ('02D00000-0000-4000-8000-000000001039', '02D00000-0000-4000-8000-000000000510', 'A style rule for curly braces', FALSE, 3),
  ('02D00000-0000-4000-8000-000000001040', '02D00000-0000-4000-8000-000000000510', 'A built-in array method', FALSE, 4),
  -- Q4 (510)q2: currying
  ('02D00000-0000-4000-8000-000000001041', '02D00000-0000-4000-8000-000000000511', 'a =&gt; b =&gt; c =&gt; a + b + c', TRUE,  1),
  ('02D00000-0000-4000-8000-000000001042', '02D00000-0000-4000-8000-000000000511', 'a single call returning an object', FALSE, 2),
  ('02D00000-0000-4000-8000-000000001043', '02D00000-0000-4000-8000-000000000511', 'a function that ignores its arguments', FALSE, 3),
  ('02D00000-0000-4000-8000-000000001044', '02D00000-0000-4000-8000-000000000511', 'a promise chain', FALSE, 4),
  -- Q4 (510)q3: partial application
  ('02D00000-0000-4000-8000-000000001045', '02D00000-0000-4000-8000-000000000512', 'binding some arguments now, the rest later', TRUE,  1),
  ('02D00000-0000-4000-8000-000000001046', '02D00000-0000-4000-8000-000000000512', 'calling with all arguments at once', FALSE, 2),
  ('02D00000-0000-4000-8000-000000001047', '02D00000-0000-4000-8000-000000000512', 'deleting arguments from a call', FALSE, 3),
  ('02D00000-0000-4000-8000-000000001048', '02D00000-0000-4000-8000-000000000512', 'splitting a function across two files', FALSE, 4),
  -- Q5 (513): filter
  ('02D00000-0000-4000-8000-000000001049', '02D00000-0000-4000-8000-000000000513', 'returns a truthy value', TRUE,  1),
  ('02D00000-0000-4000-8000-000000001050', '02D00000-0000-4000-8000-000000000513', 'throws an error', FALSE, 2),
  ('02D00000-0000-4000-8000-000000001051', '02D00000-0000-4000-8000-000000000513', 'returns the item itself', FALSE, 3),
  ('02D00000-0000-4000-8000-000000001052', '02D00000-0000-4000-8000-000000000513', 'iterates twice', FALSE, 4),
  -- Q5 (513)q2: map result
  ('02D00000-0000-4000-8000-000000001053', '02D00000-0000-4000-8000-000000000514', '[2, 4, 6]', TRUE,  1),
  ('02D00000-0000-4000-8000-000000001054', '02D00000-0000-4000-8000-000000000514', '[1, 2, 3, 2, 4, 6]', FALSE, 2),
  ('02D00000-0000-4000-8000-000000001055', '02D00000-0000-4000-8000-000000000514', '6', FALSE, 3),
  ('02D00000-0000-4000-8000-000000001056', '02D00000-0000-4000-8000-000000000514', 'undefined', FALSE, 4),
  -- Q5 (513)q3: reduce seed
  ('02D00000-0000-4000-8000-000000001057', '02D00000-0000-4000-8000-000000000515', 'reduce((acc, n) =&gt; acc + n, 0)', TRUE,  1),
  ('02D00000-0000-4000-8000-000000001058', '02D00000-0000-4000-8000-000000000515', 'reduce((a, b) =&gt; b)', FALSE, 2),
  ('02D00000-0000-4000-8000-000000001059', '02D00000-0000-4000-8000-000000000515', 'reduce(() =&gt; 0)', FALSE, 3),
  ('02D00000-0000-4000-8000-000000001060', '02D00000-0000-4000-8000-000000000515', 'reduce()', FALSE, 4),
  -- Q6 (516): pipe direction
  ('02D00000-0000-4000-8000-000000001061', '02D00000-0000-4000-8000-000000000516', 'left to right', TRUE,  1),
  ('02D00000-0000-4000-8000-000000001062', '02D00000-0000-4000-8000-000000000516', 'right to left', FALSE, 2),
  ('02D00000-0000-4000-8000-000000001063', '02D00000-0000-4000-8000-000000000516', 'in random order', FALSE, 3),
  ('02D00000-0000-4000-8000-000000001064', '02D00000-0000-4000-8000-000000000516', 'all at the same time', FALSE, 4),
  -- Q6 (516)q2: associativity
  ('02D00000-0000-4000-8000-000000001065', '02D00000-0000-4000-8000-000000000517', 'grouping calls does not change the result', TRUE,  1),
  ('02D00000-0000-4000-8000-000000001066', '02D00000-0000-4000-8000-000000000517', 'functions can only be composed in pairs', FALSE, 2),
  ('02D00000-0000-4000-8000-000000001067', '02D00000-0000-4000-8000-000000000517', 'the first argument is always ignored', FALSE, 3),
  ('02D00000-0000-4000-8000-000000001068', '02D00000-0000-4000-8000-000000000517', 'composition requires exactly three calls', FALSE, 4),
  -- Q6 (516)q3: point-free
  ('02D00000-0000-4000-8000-000000001069', '02D00000-0000-4000-8000-000000000518', 'defining functions without naming the data argument', TRUE,  1),
  ('02D00000-0000-4000-8000-000000001070', '02D00000-0000-4000-8000-000000000518', 'writing every function with zero parameters', FALSE, 2),
  ('02D00000-0000-4000-8000-000000001071', '02D00000-0000-4000-8000-000000000518', 'pointing at functions in the docs', FALSE, 3),
  ('02D00000-0000-4000-8000-000000001072', '02D00000-0000-4000-8000-000000000518', 'using only anonymous functions', FALSE, 4),
  -- Q7 (519): recursion parts
  ('02D00000-0000-4000-8000-000000001073', '02D00000-0000-4000-8000-000000000519', 'a base case and a recursive case', TRUE,  1),
  ('02D00000-0000-4000-8000-000000001074', '02D00000-0000-4000-8000-000000000519', 'a global counter', FALSE, 2),
  ('02D00000-0000-4000-8000-000000001075', '02D00000-0000-4000-8000-000000000519', 'a for loop and a while loop', FALSE, 3),
  ('02D00000-0000-4000-8000-000000001076', '02D00000-0000-4000-8000-000000000519', 'at least three parameters', FALSE, 4),
  -- Q7 (519)q2: tail call
  ('02D00000-0000-4000-8000-000000001077', '02D00000-0000-4000-8000-000000000520', 'a recursive call in the last position', TRUE,  1),
  ('02D00000-0000-4000-8000-000000001078', '02D00000-0000-4000-8000-000000000520', 'a call that is always the slowest', FALSE, 2),
  ('02D00000-0000-4000-8000-000000001079', '02D00000-0000-4000-8000-000000000520', 'a call placed inside a catch block', FALSE, 3),
  ('02D00000-0000-4000-8000-000000001080', '02D00000-0000-4000-8000-000000000520', 'a call that ignores its base case', FALSE, 4),
  -- Q7 (519)q3: recursive data
  ('02D00000-0000-4000-8000-000000001081', '02D00000-0000-4000-8000-000000000521', 'nested, self-similar structures such as trees', TRUE,  1),
  ('02D00000-0000-4000-8000-000000001082', '02D00000-0000-4000-8000-000000000521', 'a flat CSV file', FALSE, 2),
  ('02D00000-0000-4000-8000-000000001083', '02D00000-0000-4000-8000-000000000521', 'a single boolean flag', FALSE, 3),
  ('02D00000-0000-4000-8000-000000001084', '02D00000-0000-4000-8000-000000000521', 'a lookup table of constants', FALSE, 4),
  -- Q8 (522): functor
  ('02D00000-0000-4000-8000-000000001085', '02D00000-0000-4000-8000-000000000522', 'map over without changing its shape', TRUE,  1),
  ('02D00000-0000-4000-8000-000000001086', '02D00000-0000-4000-8000-000000000522', 'only read, never transform', FALSE, 2),
  ('02D00000-0000-4000-8000-000000001087', '02D00000-0000-4000-8000-000000000522', 'mutate directly with a setter', FALSE, 3),
  ('02D00000-0000-4000-8000-000000001088', '02D00000-0000-4000-8000-000000000522', 'serialize into a float', FALSE, 4),
  -- Q8 (522)q2: identity law
  ('02D00000-0000-4000-8000-000000001089', '02D00000-0000-4000-8000-000000000523', 'map of the identity function equals the input', TRUE,  1),
  ('02D00000-0000-4000-8000-000000001090', '02D00000-0000-4000-8000-000000000523', 'every functor is a monoid', FALSE, 2),
  ('02D00000-0000-4000-8000-000000001091', '02D00000-0000-4000-8000-000000000523', 'mapping is the same as filtering', FALSE, 3),
  ('02D00000-0000-4000-8000-000000001092', '02D00000-0000-4000-8000-000000000523', 'functors can only hold numbers', FALSE, 4),
  -- Q8 (522)q3: flatMap
  ('02D00000-0000-4000-8000-000000001093', '02D00000-0000-4000-8000-000000000524', 'may return a wrapper that gets flattened', TRUE,  1),
  ('02D00000-0000-4000-8000-000000001094', '02D00000-0000-4000-8000-000000000524', 'must return a primitive', FALSE, 2),
  ('02D00000-0000-4000-8000-000000001095', '02D00000-0000-4000-8000-000000000524', 'can never be pure', FALSE, 3),
  ('02D00000-0000-4000-8000-000000001096', '02D00000-0000-4000-8000-000000000524', 'runs twice per element', FALSE, 4),
  -- Q9 (525): refactor start
  ('02D00000-0000-4000-8000-000000001097', '02D00000-0000-4000-8000-000000000525', 'extract a pure core and isolate the I/O', TRUE,  1),
  ('02D00000-0000-4000-8000-000000001098', '02D00000-0000-4000-8000-000000000525', 'rewrite the whole app in one commit', FALSE, 2),
  ('02D00000-0000-4000-8000-000000001099', '02D00000-0000-4000-8000-000000000525', 'remove all functions', FALSE, 3),
  ('02D00000-0000-4000-8000-000000001100', '02D00000-0000-4000-8000-000000000525', 'move everything into localStorage', FALSE, 4),
  -- Q9 (525)q2: transparency example
  ('02D00000-0000-4000-8000-000000001101', '02D00000-0000-4000-8000-000000000526', 'a pure function called with fixed arguments', TRUE,  1),
  ('02D00000-0000-4000-8000-000000001102', '02D00000-0000-4000-8000-000000000526', 'a random number generator call', FALSE, 2),
  ('02D00000-0000-4000-8000-000000001103', '02D00000-0000-4000-8000-000000000526', 'a call that reads the system clock', FALSE, 3),
  ('02D00000-0000-4000-8000-000000001104', '02D00000-0000-4000-8000-000000000526', 'a call that writes to the console', FALSE, 4),
  -- Q9 (525)q3: pipe order
  ('02D00000-0000-4000-8000-000000001105', '02D00000-0000-4000-8000-000000000527', 'passes the value through stages left to right', TRUE,  1),
  ('02D00000-0000-4000-8000-000000001106', '02D00000-0000-4000-8000-000000000527', 'runs the last stage first', FALSE, 2),
  ('02D00000-0000-4000-8000-000000001107', '02D00000-0000-4000-8000-000000000527', 'sorts the stages alphabetically', FALSE, 3),
  ('02D00000-0000-4000-8000-000000001108', '02D00000-0000-4000-8000-000000000527', 'calls them in random order', FALSE, 4),
  -- Q9 (525)q4: immutable visibility
  ('02D00000-0000-4000-8000-000000001109', '02D00000-0000-4000-8000-000000000528', 'every update produces a new value, leaving the old one intact', TRUE,  1),
  ('02D00000-0000-4000-8000-000000001110', '02D00000-0000-4000-8000-000000000528', 'it logs every assignment to the console', FALSE, 2),
  ('02D00000-0000-4000-8000-000000001111', '02D00000-0000-4000-8000-000000000528', 'it slows down every operation on purpose', FALSE, 3),
  ('02D00000-0000-4000-8000-000000001112', '02D00000-0000-4000-8000-000000000528', 'it copies values twice for no reason', FALSE, 4),
  -- Q9 (525)q5: side effects location
  ('02D00000-0000-4000-8000-000000001113', '02D00000-0000-4000-8000-000000000529', 'in a thin impure shell at the edges', TRUE,  1),
  ('02D00000-0000-4000-8000-000000001114', '02D00000-0000-4000-8000-000000000529', 'inside every pure function for convenience', FALSE, 2),
  ('02D00000-0000-4000-8000-000000001115', '02D00000-0000-4000-8000-000000000529', 'never anywhere in the program', FALSE, 3),
  ('02D00000-0000-4000-8000-000000001116', '02D00000-0000-4000-8000-000000000529', 'duplicated inside each loop', FALSE, 4)
ON CONFLICT (id) DO NOTHING;
-- ============================================================================
-- SEED 025: Complete course — "Algorithms & Data Structures"
-- ----------------------------------------------------------------------------
-- Instructor : Marcus Johnson      (10000000-0000-4000-8000-000000000002)
-- Category   : Programming Fundamentals (20000000-0000-4000-8000-000000000002)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Foundations of Complexity → C1 Big-O Notation & Growth Rates · C2 Arrays & Strings
--   M2 Linear Data Structures    → C3 Linked Lists · C4 Stacks & Queues
--   M3 Hash Tables & Trees       → C5 Hash Tables · C6 Trees & Binary Search Trees
--   M4 Heaps & Graphs            → C7 Heaps & Priority Queues · C8 Graphs & Traversals
--   M5 Sorting, Searching & Capstone → C9 Sorting & Searching · C10 Recursion, DP & Capstone
--
-- Content: 19 TEXT lessons with lesson_contents (self-contained HTML + inline
-- CSS, dollar-quoted so apostrophes need no escaping) and 9 QUIZ lessons with
-- 29 questions / 116 options across quizzes plus `quizzes` and `quiz_options`.
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
  '01900000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000002',
  '20000000-0000-4000-8000-000000000002',
  'Algorithms & Data Structures',
  'algorithms-and-data-structures',
  'Master the foundations of efficient programming. Analyze complexity with Big-O notation, implement linked lists, stacks, queues, hash tables, trees, heaps, and graphs, then apply sorting, searching, recursion, and dynamic programming to a path-finder capstone.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  23
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('01900000-0000-4000-8000-000000000011', '01900000-0000-4000-8000-000000000001', 'Reason about algorithm efficiency with Big-O, Omega, and Theta notation.',              1),
  ('01900000-0000-4000-8000-000000000012', '01900000-0000-4000-8000-000000000001', 'Implement arrays, strings, linked lists, stacks, and queues with the right trade-offs.', 2),
  ('01900000-0000-4000-8000-000000000013', '01900000-0000-4000-8000-000000000001', 'Build hash tables, binary search trees, and heaps with correct insert and delete behavior.', 3),
  ('01900000-0000-4000-8000-000000000014', '01900000-0000-4000-8000-000000000001', 'Model problems as graphs and traverse them using BFS and DFS.',                             4),
  ('01900000-0000-4000-8000-000000000015', '01900000-0000-4000-8000-000000000001', 'Apply sorting, binary search, recursion, and dynamic programming to build a path-finder capstone.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('01900000-0000-4000-8000-000000000101', '01900000-0000-4000-8000-000000000001', 1, 'Foundations of Complexity',  'Measure how algorithms scale from Big-O to practical analysis.',    'PUBLISHED'),
  ('01900000-0000-4000-8000-000000000102', '01900000-0000-4000-8000-000000000001', 2, 'Linear Data Structures',     'Learn arrays, strings, linked lists, stacks, and queues.',           'PUBLISHED'),
  ('01900000-0000-4000-8000-000000000103', '01900000-0000-4000-8000-000000000001', 3, 'Hash Tables & Trees',        'Build hash tables, trees, and binary search trees.',                 'PUBLISHED'),
  ('01900000-0000-4000-8000-000000000104', '01900000-0000-4000-8000-000000000001', 4, 'Heaps & Graphs',             'Implement priority queues and traverse graph data.',                 'PUBLISHED'),
  ('01900000-0000-4000-8000-000000000105', '01900000-0000-4000-8000-000000000001', 5, 'Sorting, Searching & Capstone', 'Sort, search, and combine every tool in a path-finder capstone.',    'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('01900000-0000-4000-8000-000000000201', '01900000-0000-4000-8000-000000000101', 1, 'Big-O Notation & Growth Rates', 'The curve every algorithm rides.',        'PUBLISHED'),
  ('01900000-0000-4000-8000-000000000202', '01900000-0000-4000-8000-000000000101', 2, 'Arrays & Strings',              'Contiguous memory and character tricks.',   'PUBLISHED'),
  ('01900000-0000-4000-8000-000000000203', '01900000-0000-4000-8000-000000000102', 1, 'Linked Lists',                   'Nodes that point to one another.',          'PUBLISHED'),
  ('01900000-0000-4000-8000-000000000204', '01900000-0000-4000-8000-000000000102', 2, 'Stacks & Queues',                'Ordered access for pending work.',          'PUBLISHED'),
  ('01900000-0000-4000-8000-000000000205', '01900000-0000-4000-8000-000000000103', 1, 'Hash Tables',                    'Efficient lookup by key.',                  'PUBLISHED'),
  ('01900000-0000-4000-8000-000000000206', '01900000-0000-4000-8000-000000000103', 2, 'Trees & Binary Search Trees',    'Hierarchies and fast ordered search.',      'PUBLISHED'),
  ('01900000-0000-4000-8000-000000000207', '01900000-0000-4000-8000-000000000104', 1, 'Heaps & Priority Queues',       'Always serve the most important item.',     'PUBLISHED'),
  ('01900000-0000-4000-8000-000000000208', '01900000-0000-4000-8000-000000000104', 2, 'Graphs & Traversals',           'Model relationships and navigate them.',    'PUBLISHED'),
  ('01900000-0000-4000-8000-000000000209', '01900000-0000-4000-8000-000000000105', 1, 'Sorting & Searching',            'Order data and find things fast.',          'PUBLISHED'),
  ('01900000-0000-4000-8000-000000000210', '01900000-0000-4000-8000-000000000105', 2, 'Recursion, DP & Capstone',      'Reuse subproblems and build the path-finder.', 'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 01900000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('01900000-0000-4000-8000-000000000301', '01900000-0000-4000-8000-000000000201', 1, 'Big-O Notation & Growth Rates',         'Learn how Big-O describes the way runtime grows with input size.',    'TEXT',  'PUBLISHED', 'FREE', 10,  6),
  ('01900000-0000-4000-8000-000000000302', '01900000-0000-4000-8000-000000000201', 2, 'Time & Space Complexity in Practice',   'Simplify expressions and analyze real loops for time and memory.',    'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01900000-0000-4000-8000-000000000303', '01900000-0000-4000-8000-000000000201', 3, 'Complexity Analysis Quiz',               'Check your mastery of asymptotic notation.',                          'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01900000-0000-4000-8000-000000000304', '01900000-0000-4000-8000-000000000202', 1, 'Arrays: Core Operations',                'Work with contiguous storage, prefix sums, and sliding windows.',     'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01900000-0000-4000-8000-000000000305', '01900000-0000-4000-8000-000000000202', 2, 'Strings & Anagram Techniques',           'Handle immutable text, palindromes, and frequency counting.',         'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01900000-0000-4000-8000-000000000306', '01900000-0000-4000-8000-000000000202', 3, 'Arrays & Strings Quiz',                  'Verify your understanding of array and string algorithms.',           'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01900000-0000-4000-8000-000000000307', '01900000-0000-4000-8000-000000000203', 1, 'Linked Lists: Singly & Doubly',          'Build node chains with fast head insertion and flexible removal.',    'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01900000-0000-4000-8000-000000000308', '01900000-0000-4000-8000-000000000203', 2, 'Linked List Tricks & Cycle Detection',   'Reverse in place and hunt cycles with the turtle and the hare.',      'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('01900000-0000-4000-8000-000000000309', '01900000-0000-4000-8000-000000000203', 3, 'Linked Lists Quiz',                      'Test your command of pointer manipulation.',                          'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01900000-0000-4000-8000-000000000310', '01900000-0000-4000-8000-000000000204', 1, 'Stacks: Implementation & Use Cases',     'Serve the last-pushed item first and match brackets.',               'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01900000-0000-4000-8000-000000000311', '01900000-0000-4000-8000-000000000204', 2, 'Queues & FIFO Logic',                    'Process work in arrival order with queues and deques.',              'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01900000-0000-4000-8000-000000000312', '01900000-0000-4000-8000-000000000204', 3, 'Stacks & Queues Quiz',                   'Confirm the ordering rules and workloads of these lists.',            'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01900000-0000-4000-8000-000000000313', '01900000-0000-4000-8000-000000000205', 1, 'Hash Tables: Design & Collisions',       'Map keys to buckets and handle collisions gracefully.',               'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01900000-0000-4000-8000-000000000314', '01900000-0000-4000-8000-000000000205', 2, 'Hash Sets & Caching in Practice',        'Deduplicate with sets, cache with maps, and seed memoization.',       'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01900000-0000-4000-8000-000000000315', '01900000-0000-4000-8000-000000000205', 3, 'Hash Tables Quiz',                       'Check hashing, collisions, and average-case behavior.',               'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01900000-0000-4000-8000-000000000316', '01900000-0000-4000-8000-000000000206', 1, 'Trees & Traversal Orders',               'Learn tree vocabulary and walk every node in every order.',           'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01900000-0000-4000-8000-000000000317', '01900000-0000-4000-8000-000000000206', 2, 'Binary Search Trees & Balancing',        'Ordered insert, search, delete, and why balance matters.',             'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('01900000-0000-4000-8000-000000000318', '01900000-0000-4000-8000-000000000206', 3, 'Trees & BST Quiz',                       'Demonstrate tree structure and BST invariants.',                      'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01900000-0000-4000-8000-000000000319', '01900000-0000-4000-8000-000000000207', 1, 'Heaps & Priority Queues',                'Store a complete tree in an array and always peek the extreme key.',  'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01900000-0000-4000-8000-000000000320', '01900000-0000-4000-8000-000000000207', 2, 'Heap Applications: Top-K & Scheduling',  'Extract top-K items, heap sort, and schedule with priorities.',       'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('01900000-0000-4000-8000-000000000321', '01900000-0000-4000-8000-000000000207', 3, 'Heaps Quiz',                             'Confirm heap invariants and operation costs.',                        'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01900000-0000-4000-8000-000000000322', '01900000-0000-4000-8000-000000000208', 1, 'Graphs: Representations & Concepts',     'Model vertices and edges, and choose an adjacency strategy.',         'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01900000-0000-4000-8000-000000000323', '01900000-0000-4000-8000-000000000208', 2, 'BFS & DFS Traversals',                   'Explore graphs level by level and down every branch.',                'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('01900000-0000-4000-8000-000000000324', '01900000-0000-4000-8000-000000000208', 3, 'Graphs Quiz',                             'Check graph models and traversal strategies.',                        'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01900000-0000-4000-8000-000000000325', '01900000-0000-4000-8000-000000000209', 1, 'Sorting Algorithms Compared',             'Contrast quadratic and linearithmic sorts with stability in mind.',   'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('01900000-0000-4000-8000-000000000326', '01900000-0000-4000-8000-000000000210', 1, 'Binary Search & Search Techniques',       'Zoom to an answer in a sorted world and handle boundaries.',           'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('01900000-0000-4000-8000-000000000327', '01900000-0000-4000-8000-000000000210', 2, 'Recursion, Dynamic Programming & Capstone', 'Reuse overlapping subproblems and design a weighted path-finder.',    'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('01900000-0000-4000-8000-000000000328', '01900000-0000-4000-8000-000000000210', 3, 'Final Assessment',                        'Prove what you learned across every module of the course.',           'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 01900000-…-0401 .. 0427)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '01900000-0000-4000-8000-000000000401',
  '01900000-0000-4000-8000-000000000301',
  1,
  'Big-O Notation & Growth Rates',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Big-O Notation & Growth Rates</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #1e1b4b; color: #e0e7ff; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
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
  <h1>Big-O Notation &amp; Growth Rates</h1>
  <p>Big-O notation answers a blunt question: <strong>how does runtime grow when the input grows?</strong> It ignores the constant overhead of your machine and focuses on the shape of the curve. An algorithm whose time doubles when the input doubles is very different from one whose time quadruples, even if both look fine on tiny inputs.</p>
  <h2>What Big-O describes</h2>
  <p>We write <span class="ic">f(n) = O(g(n))</span> when the number of steps stays below <span class="ic">c * g(n)</span> for some constant <span class="ic">c</span> once <span class="ic">n</span> is large enough. The <span class="ic">g(n)</span> is the <em>dominant growth rate</em>.</p>
  <pre class="code-block">// One loop over n items — linear work
function sumList(values) {
  let total = 0;
  for (const v of values) {
    total += v;        // one step per item
  }
  return total;        // O(n)
}</pre>
  <h2>Common growth classes</h2>
  <table>
    <tr><th>Notation</th><th>Name</th><th>Feel</th><th>Example</th></tr>
    <tr><td>O(1)</td><td>Constant</td><td>Instantly</td><td>Read an array index</td></tr>
    <tr><td>O(log n)</td><td>Logarithmic</td><td>Almost flat</td><td>Binary search</td></tr>
    <tr><td>O(n)</td><td>Linear</td><td>Proportional</td><td>One pass over an array</td></tr>
    <tr><td>O(n log n)</td><td>Linearithmic</td><td>Gentle climb</td><td>Merge sort</td></tr>
    <tr><td>O(n^2)</td><td>Quadratic</td><td>Steep</td><td>Nested double loop</td></tr>
    <tr><td>O(2^n)</td><td>Exponential</td><td>Explosive</td><td>Naive subset generation</td></tr>
  </table>
  <h2>Why constants do not matter</h2>
  <p>At <span class="ic">n = 1,000,000</span>, a constant of 10 barely registers. The <em>shape</em> decides the story.</p>
  <pre class="code-block">O(n)     → 1,000,000 steps-ish
O(n^2)   → 1,000,000,000,000 steps-ish
O(n log n) → ~20,000,000 steps-ish</pre>
  <div class="callout">
    <strong>Big picture</strong>
    <p>Big-O is a <em>ranking system</em>, not a stopwatch. Two O(n) algorithms can differ 10x in practice — but both will always beat a quadratic once n grows. Choose the class first, then optimize constants inside that class.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Worst case wins by default</strong>
    <p>Unless stated otherwise, Big-O means the worst valid input. Doing this keeps interviews, reviews, and real SLAs honest.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01900000-0000-4000-8000-000000000402',
  '01900000-0000-4000-8000-000000000302',
  1,
  'Time & Space Complexity in Practice',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Time & Space Complexity in Practice</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #1e1b4b; color: #e0e7ff; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
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
  <h1>Time &amp; Space Complexity in Practice</h1>
  <p>Real code mixes loops, calls, and recursion. Turning that soup into a clean Big-O label takes three skills: <strong>counting steps</strong>, <strong>simplifying</strong>, and <strong>counting memory</strong>.</p>
  <h2>Counting steps</h2>
  <p>Each nested layer multiplies the work. A loop inside a loop is roughly the outer size times the inner size.</p>
  <pre class="code-block">// O(n^2) — every outer trip walks all inner items
function pairs(values) {
  const out = [];
  for (let i = 0; i &lt; values.length; i++) {
    for (let j = 0; j &lt; values.length; j++) {
      out.push([values[i], values[j]]);
    }
  }
  return out;
}</pre>
  <h2>The simplification rules</h2>
  <ul>
    <li><strong>Keep the dominant term:</strong> <span class="ic">n^2 + n</span> is <span class="ic">O(n^2)</span>.</li>
    <li><strong>Drop constant factors:</strong> <span class="ic">3n</span> and <span class="ic">100n</span> are both <span class="ic">O(n)</span>.</li>
    <li><strong>Consider the structure:</strong> dividing input in half usually means <span class="ic">log n</span>.</li>
  </ul>
  <pre class="code-block">// Halving the range each trip — O(log n)
function halving(value, target) {
  let hi = value.length;
  while (hi &gt; 1) {
    hi = Math.floor(hi / 2);
    if (hi === target) return hi;
  }
  return hi;
}</pre>
  <h2>Space complexity</h2>
  <p>Memory has its own Big-O. A loop that copies every input item into a new array is <span class="ic">O(n)</span> space even when it only takes <span class="ic">O(n)</span> time over all the items.</p>
  <pre class="code-block">function copied(values) {
  const result = [];        // grows with n — O(n) space
  for (const v of values) result.push(v);
  return result;
}</pre>
  <table>
    <tr><th>Code shape</th><th>Time</th><th>Space</th></tr>
    <tr><td>Single loop</td><td>O(n)</td><td>O(1)</td></tr>
    <tr><td>Nested loops</td><td>O(n^2)</td><td>O(1)</td></tr>
    <tr><td>Halving loop</td><td>O(log n)</td><td>O(1)</td></tr>
    <tr><td>Copying an array</td><td>O(n)</td><td>O(n)</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Time is not the only tax</strong>
    <p>Caches, disks, and cloud bills all pay for space too. An O(n) space algorithm can still blow up a web worker or a database index — count both axes.</p>
  </div>
  <div class="callout callout-info">
    <strong>Read the library, count the work</strong>
    <p>Functions like <span class="ic">sort()</span> and <span class="ic">slice()</span> carry their own cost. Before you call them inside a loop, check the docs and add their complexity to your own analysis.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01900000-0000-4000-8000-000000000404',
  '01900000-0000-4000-8000-000000000304',
  1,
  'Arrays: Core Operations',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Arrays: Core Operations</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #1e1b4b; color: #e0e7ff; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
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
  <h1>Arrays: Core Operations</h1>
  <p>An array places values side by side in memory. That layout gives you <strong>O(1) indexing</strong> — <span class="ic">arr[k]</span> jumps straight to slot <span class="ic">k</span>. The price is paid at the edges: shifting elements around costs linear work.</p>
  <h2>The cost table</h2>
  <table>
    <tr><th>Operation</th><th>Complexity</th><th>Why</th></tr>
    <tr><td>Read / write by index</td><td>O(1)</td><td>Base address plus offset</td></tr>
    <tr><td>Append at end (amortized)</td><td>O(1)</td><td>Reserved extra capacity, doubling</td></tr>
    <tr><td>Insert at start / middle</td><td>O(n)</td><td>Everything shifts right</td></tr>
    <tr><td>Delete from start / middle</td><td>O(n)</td><td>Everything shifts left</td></tr>
    <tr><td>Unordered search</td><td>O(n)</td><td>Must check each slot</td></tr>
  </table>
  <h2>A prefix sum builds quickly</h2>
  <pre class="code-block">const nums = [3, 1, 4, 1, 5];
const prefix = [0];
for (const x of nums) prefix.push(prefix[prefix.length - 1] + x);
// prefix = [0, 3, 4, 8, 9, 14]  →  range sum in O(1):
// sum(2..4) = prefix[5] - prefix[2] = 14 - 4 = 10</pre>
  <h2>Sliding window for contiguous ranges</h2>
  <pre class="code-block">// Longest contiguous subarray whose sum is at most 12
const cap = 12;
let left = 0, sum = 0, best = 0;
for (let right = 0; right &lt; nums.length; right++) {
  sum += nums[right];
  while (sum &gt; cap) {
    sum -= nums[left];
    left++;
  }
  best = Math.max(best, right - left + 1);
}</pre>
  <div class="callout callout-tip">
    <strong>Amortized append</strong>
    <p>Dynamic arrays double their capacity when full. The occasional big copy is paid for by all the cheap appends before it, so the average stays <span class="ic">O(1)</span>.</p>
  </div>
  <div class="callout callout-info">
    <strong>Locality is a feature</strong>
    <p>Contiguous items load together into the CPU cache. That is why array iteration routinely beats pointer-chasing structures even when the Big-O is the same.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01900000-0000-4000-8000-000000000405',
  '01900000-0000-4000-8000-000000000305',
  1,
  'Strings & Anagram Techniques',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Strings & Anagram Techniques</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #1e1b4b; color: #e0e7ff; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
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
  <h1>Strings &amp; Anagram Techniques</h1>
  <p>Strings are arrays of characters with two twists: in most languages they are <strong>immutable</strong> (every edit builds a new string) and their constant factor for indexing can be larger for multi-byte text. Plan algorithms around reads, not writes.</p>
  <h2>Palindrome check with the two-pointer pattern</h2>
  <pre class="code-block">function isPalindrome(s) {
  let lo = 0, hi = s.length - 1;
  while (lo &lt; hi) {
    if (s[lo] !== s[hi]) return false;
    lo++;
    hi--;
  }
  return true;
}
// isPalindrome('racecar') → true</pre>
  <h2>Anagrams by character frequency</h2>
  <p>Two strings are anagrams when every letter occurs the same number of times. A frequency map turns this into a linear-time check.</p>
  <pre class="code-block">function areAnagrams(a, b) {
  if (a.length !== b.length) return false;
  const counts = new Map();
  for (const ch of a) counts.set(ch, (counts.get(ch) || 0) + 1);
  for (const ch of b) {
    const left = counts.get(ch);
    if (!left) return false;
    counts.set(ch, left - 1);
  }
  return true;
}</pre>
  <h2>Grouping many anagrams</h2>
  <p>One sorted key per word collapses every anagram onto the same bucket, which is the classic way to group them.</p>
  <pre class="code-block">function groupAnagrams(words) {
  const buckets = new Map();
  for (const w of words) {
    const key = [...w].sort().join('');
    buckets.set(key, [...(buckets.get(key) || []), w]);
  }
  return [...buckets.values()];
}</pre>
  <table>
    <tr><th>Pattern</th><th>Idea</th><th>Time</th></tr>
    <tr><td>Two pointers</td><td>Walk from both ends inward</td><td>O(n)</td></tr>
    <tr><td>Frequency map</td><td>Count characters once</td><td>O(n)</td></tr>
    <tr><td>Sorted canonical key</td><td>One key per anagram class</td><td>O(n log n) per word</td></tr>
    <tr><td>Sliding window</td><td>Fixed-size text check</td><td>O(n)</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Watch the alphabet</strong>
    <p>If the string only holds lowercase letters, a fixed array of 26 counts beats a general map and keeps space at a constant. The choice never changes the time class — just the constant.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Prefer reads</strong>
    <p>Building a fresh string per character is O(n^2) total. When possible, work over an array of characters and join once at the end.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01900000-0000-4000-8000-000000000407',
  '01900000-0000-4000-8000-000000000307',
  1,
  'Linked Lists: Singly & Doubly',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Linked Lists: Singly & Doubly</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #1e1b4b; color: #e0e7ff; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
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
  <h1>Linked Lists: Singly &amp; Doubly</h1>
  <p>A linked list is a chain of <strong>nodes</strong>. Each node holds a value and a pointer to the next node. There is no index and no contiguous memory — you reach a node by following links from the <span class="ic">head</span>.</p>
  <h2>The node and a singly linked list</h2>
  <pre class="code-block">class Node {
  constructor(value) {
    this.value = value;
    this.next = null;
  }
}

class LinkedList {
  constructor() { this.head = null; this.tail = null; }

  prepend(value) {           // O(1)
    const node = new Node(value);
    node.next = this.head;
    this.head = node;
    if (!this.tail) this.tail = node;
  }

  traverse() {               // O(n)
    const out = [];
    let cur = this.head;
    while (cur) { out.push(cur.value); cur = cur.next; }
    return out;
  }
}</pre>
  <h2>Doubly linked lists walk both ways</h2>
  <p>A doubly linked node stores <span class="ic">prev</span> and <span class="ic">next</span>. Deletion of a node you already hold drops to <span class="ic">O(1)</span> because you can re-link from both sides.</p>
  <pre class="code-block">class DLLNode {
  constructor(value) { this.value = value; this.prev = null; this.next = null; }
}

function removeNode(node) {
  if (node.prev) node.prev.next = node.next;
  if (node.next) node.next.prev = node.prev;
}</pre>
  <h2>Linked list vs array</h2>
  <table>
    <tr><th>Operation</th><th>Array</th><th>Linked list</th></tr>
    <tr><td>Index access</td><td>O(1)</td><td>O(n)</td></tr>
    <tr><td>Insert at head</td><td>O(n)</td><td>O(1)</td></tr>
    <tr><td>Insert at known node</td><td>O(n)</td><td>O(1)</td></tr>
    <tr><td>Space per item</td><td>Minimal</td><td>+ 2 pointers</td></tr>
    <tr><td>Cache friendliness</td><td>Excellent</td><td>Poor</td></tr>
  </table>
  <div class="callout">
    <strong>When lists win</strong>
    <p>Lists shine when you splice often at the front or at a node you already possess, and when items live in different places in memory — for example a free list, a music playlist, or an LRU cache linked from both ends.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Know your tail</strong>
    <p>Keeping a <span class="ic">tail</span> pointer makes appends <span class="ic">O(1)</span> as well. A list without a tail is O(n) to append.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01900000-0000-4000-8000-000000000408',
  '01900000-0000-4000-8000-000000000308',
  1,
  'Linked List Tricks & Cycle Detection',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Linked List Tricks & Cycle Detection</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #1e1b4b; color: #e0e7ff; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
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
  <h1>Linked List Tricks &amp; Cycle Detection</h1>
  <p>Two-pointer patterns turn many list problems into a single linear pass. The two stars: <strong>reversal</strong> and <strong>cycle detection</strong>.</p>
  <h2>Reversing in place</h2>
  <pre class="code-block">function reverse(head) {
  let prev = null;
  let cur = head;
  while (cur) {
    const next = cur.next;   // save before rewiring
    cur.next = prev;         // flip the arrow
    prev = cur;
    cur = next;
  }
  return prev;               // the new head
}</pre>
  <h2>Floyd turtle and hare</h2>
  <p>Send two pointers down the same list — one hops one node, the other hops two. If a cycle exists they collide inside it; if the list ends, there was no cycle.</p>
  <pre class="code-block">function hasCycle(head) {
  let slow = head;
  let fast = head;
  while (fast && fast.next) {
    slow = slow.next;        // one step
    fast = fast.next.next;   // two steps
    if (slow === fast) return true;
  }
  return false;
}</pre>
  <h2>Finding the k-th node from the end</h2>
  <p>Let a <span class="ic">fast</span> pointer run <span class="ic">k</span> steps ahead, then advance both together. When fast hits the end, slow sits on the target.</p>
  <pre class="code-block">function kthFromEnd(head, k) {
  let slow = head;
  let fast = head;
  for (let i = 0; i &lt; k; i++) {
    if (!fast) return null;   // k is too big
    fast = fast.next;
  }
  while (fast) {
    slow = slow.next;
    fast = fast.next;
  }
  return slow;
}</pre>
  <div class="callout callout-tip">
    <strong>Cycle detection is O(1) space</strong>
    <p>Floyd uses only two references and a single pass — no visited hash needed. That beats a set of every node you have seen.</p>
  </div>
  <div class="callout callout-info">
    <strong>Sanity check before you rewire</strong>
    <p>Reversal bugs usually come from overwriting <span class="ic">next</span> too early. Save the forward link first, flip, then move on. Draw the three-dot diagram if it gets confusing.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01900000-0000-4000-8000-000000000410',
  '01900000-0000-4000-8000-000000000310',
  1,
  'Stacks: Implementation & Use Cases',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Stacks: Implementation & Use Cases</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #1e1b4b; color: #e0e7ff; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
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
  <h1>Stacks: Implementation &amp; Use Cases</h1>
  <p>A stack is a list restricted to two ends: items enter at the top and leave from the top. This contract is called <strong>LIFO</strong> — last in, first out.</p>
  <h2>Operations</h2>
  <table>
    <tr><th>Operation</th><th>Behavior</th><th>Time</th></tr>
    <tr><td>push</td><td>Place on top</td><td>O(1)</td></tr>
    <tr><td>pop</td><td>Remove the top</td><td>O(1)</td></tr>
    <tr><td>peek</td><td>Read the top</td><td>O(1)</td></tr>
  </table>
  <h2>Number stack with an array</h2>
  <pre class="code-block">const stack = [];
stack.push(5);       // push
stack.push(9);
const top = stack[stack.length - 1];  // peek → 9
const gone = stack.pop();             // pop → 9</pre>
  <h2>Matching brackets</h2>
  <p>Scan left to right. Push every opening bracket; on a closing bracket, the top must be its twin or the string is invalid.</p>
  <pre class="code-block">function isBalanced(s) {
  const pairs = { ')': '(', ']': '[', '}': '{' };
  const stack = [];
  for (const ch of s) {
    if (ch === '(' || ch === '[' || ch === '{') {
      stack.push(ch);
    } else if (ch === ')' || ch === ']' || ch === '}') {
      if (stack.pop() !== pairs[ch]) return false;
    }
  }
  return stack.length === 0;
}</pre>
  <h2>Where stacks show up</h2>
  <ul>
    <li>Undo history and the browser back button.</li>
    <li>The call stack behind every function call and recursion.</li>
    <li>Parsing expressions, HTML tags, and bracket checks.</li>
    <li>Depth-first search as an explicit alternative to recursion.</li>
  </ul>
  <div class="callout">
    <strong>Recursion is secretly a stack</strong>
    <p>Every recursive call pushes a frame. Deep recursion can overflow; when the depth is unbounded, replace it with an explicit stack and a loop.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Peek before you pop</strong>
    <p>Many bracket and expression bugs come from popping without checking what is on top. Validate, then mutate.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01900000-0000-4000-8000-000000000411',
  '01900000-0000-4000-8000-000000000311',
  1,
  'Queues & FIFO Logic',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Queues & FIFO Logic</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #1e1b4b; color: #e0e7ff; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
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
  <h1>Queues &amp; FIFO Logic</h1>
  <p>A queue moves work in arrival order: <strong>FIFO</strong>, first in, first out. Enqueue appends to the back; dequeue removes from the front.</p>
  <h2>Operations</h2>
  <table>
    <tr><th>Operation</th><th>Behavior</th><th>Time</th></tr>
    <tr><td>enqueue</td><td>Add to the back</td><td>O(1)</td></tr>
    <tr><td>dequeue</td><td>Remove the front</td><td>O(1)</td></tr>
    <tr><td>peek</td><td>Read the front</td><td>O(1)</td></tr>
  </table>
  <h2>A safe array-backed queue</h2>
  <p><span class="ic">shift()</span> on an array is O(n) because everything slides down. Use a head pointer instead, or a ring buffer, so both ends stay O(1).</p>
  <pre class="code-block">class Queue {
  constructor() { this.items = []; this.start = 0; }
  enqueue(v) { this.items.push(v); }
  dequeue() {
    const v = this.items[this.start];
    this.start++;
    if (this.start &gt; 1000 && this.start * 2 &gt; this.items.length) {
      this.items = this.items.slice(this.start);
      this.start = 0;
    }
    return v;
  }
  get size() { return this.items.length - this.start; }
}</pre>
  <h2>Deques work both ends</h2>
  <p>A double-ended queue (deque) supports O(1) push and pop at front and back. It powers sliding-window maxima: you can drop stale winners from the front and insert new candidates at the back.</p>
  <h2>Queues in the wild</h2>
  <ul>
    <li>Breadth-first search schedules neighbors in arrival order.</li>
    <li>Task queues, message queues, and printers keep fairness.</li>
    <li>Ring buffers cache the newest N samples.</li>
  </ul>
  <div class="callout callout-info">
    <strong>FIFO means fairness</strong>
    <p>Whoever arrived first gets served first. That property is exactly what BFS relies on to find shortest paths in unweighted graphs.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Never pretend shift is free</strong>
    <p>Building a queue with <span class="ic">array.shift()</span> in a tight loop quietly upgrades your algorithm to O(n^2). Track the front index or use a real deque.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01900000-0000-4000-8000-000000000413',
  '01900000-0000-4000-8000-000000000313',
  1,
  'Hash Tables: Design & Collisions',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hash Tables: Design & Collisions</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #1e1b4b; color: #e0e7ff; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
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
  <h1>Hash Tables: Design &amp; Collisions</h1>
  <p>A hash table stores key-value pairs. A <strong>hash function</strong> converts the key into a bucket index, so most lookups skip straight to the right slot.</p>
  <h2>How a lookup finds its key</h2>
  <pre class="code-block">function hashString(key, buckets) {
  let h = 0;
  for (const ch of key) {
    h = (h * 31 + ch.charCodeAt(0)) | 0;
  }
  return Math.abs(h) % buckets;
}</pre>
  <h2>Collisions need a plan</h2>
  <p>Two different keys can land in the same bucket — a <strong>collision</strong>. Two classic resolutions:</p>
  <ul>
    <li><strong>Separate chaining:</strong> each bucket holds a small list; lookup scans that bucket.</li>
    <li><strong>Open addressing:</strong> on a hit, probe the next free slot (linear or quadratic probing).</li>
  </ul>
  <pre class="code-block">class ChainedHashTable {
  constructor(size = 8) {
    this.size = size;
    this.buckets = Array.from({ length: size }, () => []);
  }

  set(key, value) {
    const bucket = this.buckets[hashString(key, this.size)];
    const pair = bucket.find(([k]) => k === key);
    if (pair) pair[1] = value;
    else bucket.push([key, value]);
  }

  get(key) {
    const bucket = this.buckets[hashString(key, this.size)];
    const pair = bucket.find(([k]) => k === key);
    return pair ? pair[1] : undefined;
  }
}</pre>
  <h2>Complexity with a good hash</h2>
  <table>
    <tr><th>Case</th><th>Insert</th><th>Lookup</th></tr>
    <tr><td>Average</td><td>O(1)</td><td>O(1)</td></tr>
    <tr><td>Worst (everything collides)</td><td>O(n)</td><td>O(n)</td></tr>
  </table>
  <h2>Load factor and resize</h2>
  <p>The <strong>load factor</strong> counts how full the table is. Past a threshold (commonly 0.75), double the bucket count and reinsert every key so buckets stay short and average lookup stays O(1).</p>
  <div class="callout">
    <strong>The hash function is a promise</strong>
    <p>Every feature of the table — constant-time lookups, even distribution, resistance to bad keys — hangs on the hash. A poor hash turns a hash table into a slow list.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Iteration order is not promised</strong>
    <p>Never write code that depends on hash iteration order. If you need ordering, sort the keys afterward or reach for a tree structure.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01900000-0000-4000-8000-000000000414',
  '01900000-0000-4000-8000-000000000314',
  1,
  'Hash Sets & Caching in Practice',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hash Sets & Caching in Practice</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #1e1b4b; color: #e0e7ff; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
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
  <h1>Hash Sets &amp; Caching in Practice</h1>
  <p>Sets and maps are hash tables wearing different hats. A <strong>set</strong> stores membership only; a <strong>map</strong> stores key-value pairs. Both give average O(1) contains.</p>
  <h2>Deduplicate with a set</h2>
  <pre class="code-block">function uniqueKeepers(items) {
  const seen = new Set();
  const result = [];
  for (const item of items) {
    if (!seen.has(item)) {
      seen.add(item);
      result.push(item);
    }
  }
  return result;
}</pre>
  <h2>Cache a computed result with a map</h2>
  <p>When the same expensive computation is requested repeatedly, memoize the answer. A map supplies the stored value on the second call.</p>
  <pre class="code-block">const cache = new Map();

function expensiveSquare(n) {
  if (cache.has(n)) return cache.get(n);
  const answer = n * n;            // pretend this costs a lot
  cache.set(n, answer);
  return answer;
}</pre>
  <h2>Set vs map at a glance</h2>
  <table>
    <tr><th>Structure</th><th>Stores</th><th>Classic job</th></tr>
    <tr><td>Set</td><td>Keys only</td><td>Deduplication, visited tracking</td></tr>
    <tr><td>Map</td><td>Key-value pairs</td><td>Counters, caches, lookups</td></tr>
    <tr><td>WeakMap</td><td>Object keys, GC-friendly</td><td>Private metadata on objects</td></tr>
  </table>
  <h2>This is the seed of memoization</h2>
  <p>Memoization — the signature trick of dynamic programming — is exactly this caching pattern applied to recursive subproblems. You will meet it again in the recursion lesson, and it pays off the same way.</p>
  <div class="callout callout-tip">
    <strong>Cache with a purpose</strong>
    <p>A cache stores answers so a repeated call is free. Only budget memory for values that actually repeat; otherwise you trade memory for nothing.</p>
  </div>
  <div class="callout callout-info">
    <strong>Prefer Map over object literals</strong>
    <p>Maps accept any key type, keep insertion order, and never collide with built-in names like <span class="ic">toString</span>. They are the safer hash table.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01900000-0000-4000-8000-000000000416',
  '01900000-0000-4000-8000-000000000316',
  1,
  'Trees & Traversal Orders',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trees & Traversal Orders</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #1e1b4b; color: #e0e7ff; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
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
  <h1>Trees &amp; Traversal Orders</h1>
  <p>A tree is a hierarchy of nodes: one <strong>root</strong> on top, and children hanging below. There are no cycles — exactly one simple path connects any two nodes.</p>
  <h2>Vocabulary</h2>
  <ul>
    <li><strong>Root</strong> — the top node with no parent.</li>
    <li><strong>Leaf</strong> — a node with no children.</li>
    <li><strong>Depth</strong> — edges from the root to a node; <strong>height</strong> — the longest path from a node to a leaf.</li>
    <li><strong>Binary tree</strong> — every node has at most two children (left and right).</li>
  </ul>
  <h2>A binary tree node</h2>
  <pre class="code-block">class TreeNode {
  constructor(value) {
    this.value = value;
    this.left = null;
    this.right = null;
  }
}</pre>
  <h2>Depth-first orders</h2>
  <p>The three depth-first orders differ only in <em>when</em> they visit the node itself relative to its subtrees.</p>
  <pre class="code-block">function preorder(node, out = []) {
  if (!node) return out;
  out.push(node.value);        // node first
  preorder(node.left, out);
  preorder(node.right, out);
  return out;
}

function inorder(node, out = []) {
  if (!node) return out;
  inorder(node.left, out);     // left, node, right
  out.push(node.value);
  inorder(node.right, out);
  return out;
}

function postorder(node, out = []) {
  if (!node) return out;
  postorder(node.left, out);
  postorder(node.right, out);
  out.push(node.value);        // node last
  return out;
}</pre>
  <h2>Level order with a queue</h2>
  <pre class="code-block">function levelOrder(root) {
  const out = [];
  const queue = root ? [root] : [];
  while (queue.length) {
    const node = queue.shift();
    out.push(node.value);
    if (node.left) queue.push(node.left);
    if (node.right) queue.push(node.right);
  }
  return out;
}</pre>
  <div class="callout callout-tip">
    <strong>Order means meaning</strong>
    <p>On a binary search tree, <span class="ic">inorder</span> yields sorted values. <span class="ic">postorder</span> is perfect for freeing children before parents, and <span class="ic">level order</span> is how you find the closest matches first.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01900000-0000-4000-8000-000000000417',
  '01900000-0000-4000-8000-000000000317',
  1,
  'Binary Search Trees & Balancing',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Binary Search Trees & Balancing</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #1e1b4b; color: #e0e7ff; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
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
  <h1>Binary Search Trees &amp; Balancing</h1>
  <p>A <strong>binary search tree</strong> (BST) keeps an ordering invariant: every key in the left subtree is smaller than the node, and every key in the right subtree is larger. That rule gives search the power of halving.</p>
  <h2>Search</h2>
  <pre class="code-block">function find(node, key) {
  if (!node) return null;
  if (key === node.value) return node;
  return key &lt; node.value ? find(node.left, key) : find(node.right, key);
}</pre>
  <h2>Insert</h2>
  <pre class="code-block">function insert(node, key) {
  if (!node) return new TreeNode(key);
  if (key &lt; node.value) node.left = insert(node.left, key);
  else if (key &gt; node.value) node.right = insert(node.right, key);
  return node; // equal keys are ignored
}</pre>
  <h2>Delete has three cases</h2>
  <ul>
    <li><strong>Leaf:</strong> just remove it.</li>
    <li><strong>One child:</strong> splice the child into the tree.</li>
    <li><strong>Two children:</strong> replace the node with its inorder successor (the smallest key in the right subtree), then delete that successor.</li>
  </ul>
  <h2>Balance decides the outcome</h2>
  <table>
    <tr><th>Shape</th><th>Height</th><th>Search cost</th></tr>
    <tr><td>Balanced (perfectly filled)</td><td>O(log n)</td><td>O(log n)</td></tr>
    <tr><td>Skewed (inserted in order)</td><td>O(n)</td><td>O(n) — a linked list</td></tr>
  </table>
  <p>Self-balancing variants — AVL trees and red-black trees — rotate during insertion and deletion to keep height near <span class="ic">log n</span>. That is how a sorted map in a standard library keeps lookup logarithmic forever.</p>
  <h2>When a BST beats a hash table</h2>
  <p>A hash table offers O(1) average lookups but no ordering. A BST offers ordered iteration, predecessor and successor queries, and guaranteed O(log n) worst case. If you need ranges or sorted-order walks, choose the tree.</p>
  <div class="callout">
    <strong>Inorder gives you sorted order</strong>
    <p>Walking a BST with <span class="ic">inorder</span> visits every key in ascending order at O(n) — a built-in sorted stream.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Watch the skew</strong>
    <p>Inserting already-sorted data silently turns a BST into a linked list. If input order is not random, use a balanced variant or shuffle the input.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01900000-0000-4000-8000-000000000419',
  '01900000-0000-4000-8000-000000000319',
  1,
  'Heaps & Priority Queues',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Heaps & Priority Queues</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #1e1b4b; color: #e0e7ff; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
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
  <h1>Heaps &amp; Priority Queues</h1>
  <p>A <strong>heap</strong> is a complete binary tree with one rule. In a <strong>min-heap</strong> every parent is smaller than or equal to its children, so the smallest key always sits at the root. A <strong>max-heap</strong> mirrors the rule for the largest key.</p>
  <h2>An array hides the tree</h2>
  <p>Because the tree is complete, you can store it in a plain array. Using 0-based indexes: parent of index <span class="ic">i</span> is <span class="ic">(i - 1) / 2</span> and its children are <span class="ic">2i + 1</span> and <span class="ic">2i + 2</span>.</p>
  <pre class="code-block">// min-heap over [2, 3, 5, 7, 9]
//      2        <- index 0
//    3   5      <- 1     2
//   7 9         <- 3     4</pre>
  <h2>Insert bubbles up</h2>
  <pre class="code-block">class MinHeap {
  constructor() { this.heap = []; }

  push(key) {
    this.heap.push(key);
    let i = this.heap.length - 1;
    while (i &gt; 0) {
      const parent = Math.floor((i - 1) / 2);
      if (this.heap[parent] &lt;= this.heap[i]) break;
      [this.heap[parent], this.heap[i]] = [this.heap[i], this.heap[parent]];
      i = parent;
    }
  }

  peek() { return this.heap[0]; }
}</pre>
  <h2>Extract-min bubbles down</h2>
  <pre class="code-block">pop() {
  if (!this.heap.length) return undefined;
  const min = this.heap[0];
  const last = this.heap.pop();
  if (this.heap.length) {
    this.heap[0] = last;
    let i = 0;
    while (true) {
      const l = 2 * i + 1, r = 2 * i + 2;
      let smallest = i;
      if (l &lt; this.heap.length && this.heap[l] &lt; this.heap[smallest]) smallest = l;
      if (r &lt; this.heap.length && this.heap[r] &lt; this.heap[smallest]) smallest = r;
      if (smallest === i) break;
      [this.heap[i], this.heap[smallest]] = [this.heap[smallest], this.heap[i]];
      i = smallest;
    }
  }
  return min;
}</pre>
  <h2>Cost summary</h2>
  <table>
    <tr><th>Operation</th><th>Time</th></tr>
    <tr><td>peek</td><td>O(1)</td></tr>
    <tr><td>insert</td><td>O(log n)</td></tr>
    <tr><td>extract min/max</td><td>O(log n)</td></tr>
    <tr><td>build from n items</td><td>O(n)</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>The heap is a priority queue</strong>
    <p>A priority queue serves the item with the highest (or lowest) priority first. A heap delivers that with O(log n) insert and extract — the engine behind schedulers, Dijkstra, and top-K.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01900000-0000-4000-8000-000000000420',
  '01900000-0000-4000-8000-000000000320',
  1,
  'Heap Applications: Top-K & Scheduling',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Heap Applications: Top-K & Scheduling</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #1e1b4b; color: #e0e7ff; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
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
  <h1>Heap Applications: Top-K &amp; Scheduling</h1>
  <p>Heaps convert three classic problems from O(n log n) into smarter scans: <strong>top-K selection</strong>, <strong>heap sort</strong>, and <strong>priority scheduling</strong>.</p>
  <h2>Top-K keeps a small heap</h2>
  <p>To find the <em>largest</em> k values, keep a min-heap of size k: whenever the heap overflows, drop its smallest member. Whatever survives is the top k.</p>
  <pre class="code-block">function topK(nums, k) {
  const heap = new MinHeap();
  for (const x of nums) {
    heap.push(x);
    if (heap.heap.length &gt; k) heap.pop(); // remove the current smallest
  }
  return heap.heap.slice().sort((a, b) => b - a);
}
// topK([7, 1, 9, 4, 12, 3], 2) → [12, 9]; O(n log k) time, O(k) space</pre>
  <h2>Heap sort</h2>
  <p>Build a heap from the whole array, then repeatedly extract the min. Each extraction costs O(log n), so the total is O(n log n) — and the sort needs no extra array.</p>
  <pre class="code-block">function heapSort(nums) {
  const heap = new MinHeap();
  for (const x of nums) heap.push(x);
  const out = [];
  while (heap.heap.length) out.push(heap.pop());
  return out;
}</pre>
  <h2>Priority scheduling</h2>
  <p>Jobs pushed with priorities always exit in priority order regardless of arrival — the heart of task schedulers, event loops, and Dijkstra.</p>
  <pre class="code-block">const jobs = new MinHeap();
jobs.push({ pri: 3, task: 'restart db' });
jobs.push({ pri: 9, task: 'send email' });   // high number → low priority
// the job with the smallest pri exits first</pre>
  <h2>Merging k sorted lists</h2>
  <p>Push the head of every sorted list into a min-heap. Pop the smallest, then push that list net element. This drains all k lists in O(n log k).</p>
  <div class="callout callout-tip">
    <strong>Small heap, giant savings</strong>
    <p>Top-K with a heap of size k avoids sorting the whole dataset. For k &lt;&lt; n that is often the difference between O(n log n) and O(n log k).</p>
  </div>
  <div class="callout callout-info">
    <strong>Heaps are not searchable</strong>
    <p>A heap knows only its extreme. Finding an arbitrary key is O(n). If you must both prioritize and search, combine a heap with a hash map.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01900000-0000-4000-8000-000000000422',
  '01900000-0000-4000-8000-000000000322',
  1,
  'Graphs: Representations & Concepts',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Graphs: Representations & Concepts</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #1e1b4b; color: #e0e7ff; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
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
  <h1>Graphs: Representations &amp; Concepts</h1>
  <p>A graph is a set of <strong>vertices</strong> (nodes) and <strong>edges</strong> (connections). Graphs model networks: roads, social ties, dependency graphs, and web page links.</p>
  <h2>Kinds of edges</h2>
  <table>
    <tr><th>Kind</th><th>Meaning</th><th>Example</th></tr>
    <tr><td>Undirected</td><td>Link flows both ways</td><td>Friends, roads</td></tr>
    <tr><td>Directed</td><td>Link has a direction</td><td>Follows, citations</td></tr>
    <tr><td>Weighted</td><td>Edge carries a cost</td><td>Travel time, bandwidth</td></tr>
  </table>
  <h2>Adjacency list</h2>
  <p>Each vertex maps to the list of vertices it connects to. Weighted graphs store pairs of neighbor and weight.</p>
  <pre class="code-block">// Directed, weighted graph:
// A → B (4), A → C (9), B → C (1)
const graph = new Map();
graph.set('A', [['B', 4], ['C', 9]]);
graph.set('B', [['C', 1]]);
graph.set('C', []);

console.log(graph.get('A'));       // [['B', 4], ['C', 9]]</pre>
  <h2>Adjacency matrix</h2>
  <p>A grid where <span class="ic">matrix[u][v]</span> holds the edge weight (or 0/1). Checking an edge is O(1), but the matrix always costs O(V^2) space.</p>
  <pre class="code-block">const matrix = [
  [0, 4, 9],
  [0, 0, 1],
  [0, 0, 0],
];
console.log(matrix[0][1]);         // 4 — edge from A to B</pre>
  <h2>Choosing a representation</h2>
  <table>
    <tr><th>Measure</th><th>Adjacency list</th><th>Adjacency matrix</th></tr>
    <tr><td>Space</td><td>O(V + E)</td><td>O(V^2)</td></tr>
    <tr><td>List all neighbors</td><td>Length of the row</td><td>Scan the whole row</td></tr>
    <tr><td>Edge exists check</td><td>O(degree)</td><td>O(1)</td></tr>
    <tr><td>Best for</td><td>Sparse graphs</td><td>Dense graphs</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Sparse wins most days</strong>
    <p>Real-world graphs are overwhelmingly sparse — few edges per vertex. The adjacency list wins space and traversal speed; keep the matrix for dense, fixed-size grids.</p>
  </div>
  <div class="callout callout-info">
    <strong>Degrees and cycles</strong>
    <p>The <em>degree</em> of a vertex is its number of edges. Detecting a cycle and counting connected components are the exact puzzles BFS and DFS solve next.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01900000-0000-4000-8000-000000000423',
  '01900000-0000-4000-8000-000000000323',
  1,
  'BFS & DFS Traversals',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BFS & DFS Traversals</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #1e1b4b; color: #e0e7ff; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
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
  <h1>BFS &amp; DFS Traversals</h1>
  <p>Two strategies organize every graph walk. <strong>BFS</strong> spreads like water, level by level. <strong>DFS</strong> dives like a spelunker, following one branch as deep as it goes before backing up.</p>
  <h2>BFS with a queue</h2>
  <pre class="code-block">function bfs(start, graph) {
  const visited = new Set([start]);
  const queue = [start];
  const order = [];
  while (queue.length) {
    const node = queue.shift();
    order.push(node);
    for (const [neighbor] of graph.get(node) || []) {
      if (!visited.has(neighbor)) {
        visited.add(neighbor);
        queue.push(neighbor);
      }
    }
  }
  return order;
}</pre>
  <h2>BFS finds shortest paths in unweighted graphs</h2>
  <p>Because vertices leave the queue in the order they were discovered, the first time BFS reaches a vertex used the fewest possible edges.</p>
  <h2>DFS with recursion (or a stack)</h2>
  <pre class="code-block">function dfs(node, graph, visited = new Set(), order = []) {
  if (visited.has(node)) return order;
  visited.add(node);
  order.push(node);
  for (const [neighbor] of graph.get(node) || []) {
    dfs(neighbor, graph, visited, order);
  }
  return order;
}</pre>
  <h2>BFS vs DFS</h2>
  <table>
    <tr><th>Property</th><th>BFS</th><th>DFS</th></tr>
    <tr><td>Supporting structure</td><td>Queue</td><td>Stack (recursion)</td></tr>
    <tr><td>Visit order</td><td>Level by level</td><td>Branch by branch</td></tr>
    <tr><td>Shortest path (unweighted)</td><td>Yes</td><td>No</td></tr>
    <tr><td>Space</td><td>O(width)</td><td>O(depth)</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Mark visited before enqueue</strong>
    <p>Adding a node to the visited set at pop time lets duplicate copies queue up and creates exponential waste. Mark it the moment you meet it.</p>
  </div>
  <div class="callout callout-info">
    <strong>Cycles need remembering</strong>
    <p>Without a visited set, either traversal loops forever on a cyclic graph. The visited set is what lifts a naive walk into a finished algorithm.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01900000-0000-4000-8000-000000000425',
  '01900000-0000-4000-8000-000000000325',
  1,
  'Sorting Algorithms Compared',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sorting Algorithms Compared</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #1e1b4b; color: #e0e7ff; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
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
  <h1>Sorting Algorithms Compared</h1>
  <p>Sorting changes time from O(n) to O(log n) or better for the searches that follow. Every comparison sort shares a theoretical floor: <strong>O(n log n)</strong> comparisons in the worst case.</p>
  <h2>The field at a glance</h2>
  <table>
    <tr><th>Algorithm</th><th>Average</th><th>Worst</th><th>Space</th><th>Stable</th></tr>
    <tr><td>Bubble sort</td><td>O(n^2)</td><td>O(n^2)</td><td>O(1)</td><td>Yes</td></tr>
    <tr><td>Selection sort</td><td>O(n^2)</td><td>O(n^2)</td><td>O(1)</td><td>No</td></tr>
    <tr><td>Insertion sort</td><td>O(n^2)</td><td>O(n^2)</td><td>O(1)</td><td>Yes</td></tr>
    <tr><td>Merge sort</td><td>O(n log n)</td><td>O(n log n)</td><td>O(n)</td><td>Yes</td></tr>
    <tr><td>Quick sort</td><td>O(n log n)</td><td>O(n^2)</td><td>O(log n)</td><td>No</td></tr>
    <tr><td>Heap sort</td><td>O(n log n)</td><td>O(n log n)</td><td>O(1)</td><td>No</td></tr>
  </table>
  <h2>Merge sort: divide, conquer, combine</h2>
  <pre class="code-block">function mergeSort(arr) {
  if (arr.length &lt;= 1) return arr;
  const mid = Math.floor(arr.length / 2);
  const left = mergeSort(arr.slice(0, mid));
  const right = mergeSort(arr.slice(mid));
  const out = [];
  let i = 0, j = 0;
  while (i &lt; left.length && j &lt; right.length) {
    if (left[i] &lt;= right[j]) out.push(left[i++]);
    else out.push(right[j++]);
  }
  return out.concat(left.slice(i), right.slice(j));
}</pre>
  <h2>Insertion sort shines on tiny runs</h2>
  <pre class="code-block">function insertionSort(arr) {
  for (let i = 1; i &lt; arr.length; i++) {
    const key = arr[i];
    let j = i - 1;
    while (j &gt;= 0 && arr[j] &gt; key) {
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j + 1] = key;
  }
  return arr;
}</pre>
  <div class="callout">
    <strong>Stable vs unstable</strong>
    <p>A stable sort keeps equal elements in their original relative order. That matters when you sort by one field while another value has already made a decision (like sorting by grade after sorting by name).</p>
  </div>
  <div class="callout callout-tip">
    <strong>Reach for the library first</strong>
    <p>Standard <span class="ic">sort()</span> implementations mix insertion sort for small inputs with merge or quick for larger ones — tuned, stable, and battle-tested. Write your own for study, then delegate in production.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01900000-0000-4000-8000-000000000426',
  '01900000-0000-4000-8000-000000000326',
  1,
  'Binary Search & Search Techniques',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Binary Search & Search Techniques</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #1e1b4b; color: #e0e7ff; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
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
  <h1>Binary Search &amp; Search Techniques</h1>
  <p>Linear search checks every element (<span class="ic">O(n)</span>). Binary search exploits order: compare the middle, discard half, repeat — landing in <strong>O(log n)</strong>.</p>
  <h2>Classic binary search</h2>
  <pre class="code-block">function binarySearch(arr, target) {
  let lo = 0;
  let hi = arr.length - 1;
  while (lo &lt;= hi) {
    const mid = Math.floor((lo + hi) / 2);
    if (arr[mid] === target) return mid;
    if (arr[mid] &lt; target) lo = mid + 1;
    else hi = mid - 1;
  }
  return -1;
}</pre>
  <h2>The first-occurrence boundary</h2>
  <p>To find the <em>first</em> match, keep searching left after a hit instead of returning.</p>
  <pre class="code-block">function firstOccurrence(arr, target) {
  let lo = 0, hi = arr.length - 1;
  let result = -1;
  while (lo &lt;= hi) {
    const mid = Math.floor((lo + hi) / 2);
    if (arr[mid] === target) { result = mid; hi = mid - 1; }
    else if (arr[mid] &lt; target) lo = mid + 1;
    else hi = mid - 1;
  }
  return result;
}
// firstOccurrence([1, 2, 2, 2, 3], 2) → 1</pre>
  <h2>Searching a rotated sorted array</h2>
  <p>Split a rotated array into two sorted halves. Detect which half holds the target from the endpoints, then keep halving with the normal rules.</p>
  <pre class="code-block">function searchRotated(nums, target) {
  let lo = 0, hi = nums.length - 1;
  while (lo &lt;= hi) {
    const mid = Math.floor((lo + hi) / 2);
    if (nums[mid] === target) return mid;
    if (nums[lo] &lt;= nums[mid]) {
      if (nums[lo] &lt;= target && target &lt; nums[mid]) hi = mid - 1;
      else lo = mid + 1;
    } else {
      if (nums[mid] &lt; target && target &lt;= nums[hi]) lo = mid + 1;
      else hi = mid - 1;
    }
  }
  return -1;
}</pre>
  <table>
    <tr><th>Search</th><th>Requirement</th><th>Time</th></tr>
    <tr><td>Linear</td><td>None</td><td>O(n)</td></tr>
    <tr><td>Binary</td><td>Sorted</td><td>O(log n)</td></tr>
    <tr><td>Exponential</td><td>Sorted, huge range</td><td>O(log n)</td></tr>
    <tr><td>Interpolation</td><td>Sorted, uniform values</td><td>O(log log n) typical</td></tr>
  </table>
  <div class="callout">
    <strong>The sorted precondition is everything</strong>
    <p>Binary search on an unsorted array silently finds wrong answers. Sort once up front, then reuse the sorted copy for every lookup.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Read the mid safely</strong>
    <p>Prefer <span class="ic">lo + Math.floor((hi - lo) / 2)</span> for gigantic arrays; the classic <span class="ic">(lo + hi) / 2</span> can overflow in languages with fixed-width integers.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01900000-0000-4000-8000-000000000427',
  '01900000-0000-4000-8000-000000000327',
  1,
  'Recursion, Dynamic Programming & Capstone',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Recursion, Dynamic Programming & Capstone</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #1e1b4b; color: #e0e7ff; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
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
  <h1>Recursion, Dynamic Programming &amp; Capstone</h1>
  <p>Recursion solves a problem by solving a smaller version of itself. A <strong>base case</strong> stops the chain; everything else funnels toward it.</p>
  <h2>Recursion anatomy</h2>
  <pre class="code-block">function factorial(n) {
  if (n &lt;= 1) return 1;                // base case
  return n * factorial(n - 1);        // recursive step
}</pre>
  <h2>The trap: repeated subproblems</h2>
  <p>Naive Fibonacci recomputes the same values endlessly — call count grows like <span class="ic">O(2^n)</span>.</p>
  <pre class="code-block">function fibNaive(n) {
  if (n &lt;= 1) return n;
  return fibNaive(n - 1) + fibNaive(n - 2);
}
// fibNaive(40) computes fibNaive(20) thousands of times</pre>
  <h2>Memoization reuses work</h2>
  <p>Store each result the first time and read it back later — the caching idea from the hash lesson.</p>
  <pre class="code-block">const memo = new Map();
function fibMemo(n) {
  if (n &lt;= 1) return n;
  if (memo.has(n)) return memo.get(n);
  const value = fibMemo(n - 1) + fibMemo(n - 2);
  memo.set(n, value);
  return value;
}
// O(n) time — every n is computed once</pre>
  <h2>Bottom-up builds from the base</h2>
  <pre class="code-block">function fibBottomUp(n) {
  if (n &lt;= 1) return n;
  let a = 0, b = 1;
  for (let i = 2; i &lt;= n; i++) [a, b] = [b, a + b];
  return b;
}</pre>
  <h2>Capstone: the path-finder</h2>
  <p>Everything you built earns its keep in one app: find the shortest weighted path between two cities on a grid of roads.</p>
  <ul>
    <li><strong>Graph:</strong> cities are vertices, roads are weighted edges — adjacency list with cost.</li>
    <li><strong>BFS:</strong> first, route the case where every road costs the same (fewest transfers).</li>
    <li><strong>Dijkstra:</strong> then upgrade to a min-heap priority queue for real weights.</li>
    <li><strong>Hash map:</strong> track best-distance-so-far and reconstruct the route backwards.</li>
    <li><strong>Measure:</strong> report visited counts to prove why the heap version wins on big maps.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Recognize overlapping subproblems</strong>
    <p>If the same sub-input recurs, memoize or build a table. That one insight turns exponential recursion into polynomial DP — the single most valuable trick in the field.</p>
  </div>
  <div class="callout callout-info">
    <strong>Capstone checklist</strong>
    <p>Model the graph, run BFS for the unweighted case, run Dijkstra with a heap for weights, then time both on the same map. Comparing the strategies is the whole lesson.</p>
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
  ('01900000-0000-4000-8000-000000000501', '01900000-0000-4000-8000-000000000303',
   'What does Big-O notation describe?',
   'Big-O describes how runtime or memory grows as the input size grows.', 1),
  ('01900000-0000-4000-8000-000000000502', '01900000-0000-4000-8000-000000000303',
   'Which growth rate is fastest as n increases?',
   'Factorial growth exceeds every polynomial and every exponential with a fixed base for large n.', 2),
  ('01900000-0000-4000-8000-000000000503', '01900000-0000-4000-8000-000000000303',
   'Which notation bounds the runtime from above?',
   'Big-O gives an asymptotic upper bound on growth.', 3),
  ('01900000-0000-4000-8000-000000000504', '01900000-0000-4000-8000-000000000306',
   'What is the amortized time to append to a dynamic array?',
   'Capacity doubling spreads the occasional copy over many cheap appends.', 1),
  ('01900000-0000-4000-8000-000000000505', '01900000-0000-4000-8000-000000000306',
   'A comparison sort cannot beat which worst-case bound?',
   'Compatibility of keys forces any comparison sort to at least O(n log n) comparisons.', 2),
  ('01900000-0000-4000-8000-000000000506', '01900000-0000-4000-8000-000000000306',
   'Which approach checks whether two strings are anagrams in O(n) time?',
   'Counting character frequencies with a map gives a linear-time check.', 3),
  ('01900000-0000-4000-8000-000000000507', '01900000-0000-4000-8000-000000000309',
   'In a singly linked list, how do you reach the third node from the head?',
   'There is no index; you follow next pointers one node at a time.', 1),
  ('01900000-0000-4000-8000-000000000508', '01900000-0000-4000-8000-000000000309',
   'What is the time complexity of reversing a singly linked list in place?',
   'One pass visits each node once, so the runtime is O(n).', 2),
  ('01900000-0000-4000-8000-000000000509', '01900000-0000-4000-8000-000000000309',
   'Which trick detects a cycle in a linked list?',
   'A slow pointer and a fast pointer that moves twice as fast will meet inside a cycle.', 3),
  ('01900000-0000-4000-8000-000000000510', '01900000-0000-4000-8000-000000000312',
   'Which ordering principle does a stack follow?',
   'LIFO means the last pushed element is popped first.', 1),
  ('01900000-0000-4000-8000-000000000511', '01900000-0000-4000-8000-000000000312',
   'Which pattern is a classic stack application?',
   'Matching opening and closing brackets uses a stack to verify balance.', 2),
  ('01900000-0000-4000-8000-000000000512', '01900000-0000-4000-8000-000000000312',
   'Which structure supports adding and removing at both ends in O(1)?',
   'A deque supports push and pop at both the front and the back in O(1).', 3),
  ('01900000-0000-4000-8000-000000000513', '01900000-0000-4000-8000-000000000315',
   'What is the average-case lookup time of a hash table with a good hash function?',
   'With few collisions, keys land in their buckets in constant time.', 1),
  ('01900000-0000-4000-8000-000000000514', '01900000-0000-4000-8000-000000000315',
   'What happens when two different keys hash to the same bucket?',
   'A collision occurs; chaining or open addressing resolves it.', 2),
  ('01900000-0000-4000-8000-000000000515', '01900000-0000-4000-8000-000000000315',
   'What does the load factor measure?',
   'The load factor is the ratio of stored entries to the number of buckets.', 3),
  ('01900000-0000-4000-8000-000000000516', '01900000-0000-4000-8000-000000000318',
   'A node with no children in a tree is called a....',
   'Such nodes are leaves.', 1),
  ('01900000-0000-4000-8000-000000000517', '01900000-0000-4000-8000-000000000318',
   'Inorder traversal visits nodes in which order?',
   'Inorder visits left subtree, then the node, then the right subtree, which on a BST yields sorted order.', 2),
  ('01900000-0000-4000-8000-000000000518', '01900000-0000-4000-8000-000000000318',
   'A balanced BST stores n keys. How long does a search take worst case?',
   'Balancing keeps the height near log n, so search is O(log n).', 3),
  ('01900000-0000-4000-8000-000000000519', '01900000-0000-4000-8000-000000000321',
   'In a min-heap, where is the smallest element always found?',
   'The min-heap property keeps the smallest key at the root.', 1),
  ('01900000-0000-4000-8000-000000000520', '01900000-0000-4000-8000-000000000321',
   'Extracting the minimum from a heap costs how long?',
   'Fix-up moves the new root down the height of the tree, O(log n).', 2),
  ('01900000-0000-4000-8000-000000000521', '01900000-0000-4000-8000-000000000321',
   'Which structure usually implements a priority queue?',
   'A binary heap offers both insertion and extract-min in O(log n).', 3),
  ('01900000-0000-4000-8000-000000000522', '01900000-0000-4000-8000-000000000324',
   'In an adjacency list, each vertex stores what?',
   'Each vertex keeps a list of the vertices it connects to.', 1),
  ('01900000-0000-4000-8000-000000000523', '01900000-0000-4000-8000-000000000324',
   'Which structure drives the BFS traversal order?',
   'BFS processes vertices in FIFO order using a queue.', 2),
  ('01900000-0000-4000-8000-000000000524', '01900000-0000-4000-8000-000000000324',
   'Which algorithm finds the shortest path in an unweighted graph?',
   'BFS visits vertices by number of edges, so the first hit is shortest.', 3),
  ('01900000-0000-4000-8000-000000000525', '01900000-0000-4000-8000-000000000328',
   'Which sort is stable and guarantees O(n log n) worst-case time?',
   'Merge sort is stable and its worst case matches its average.', 1),
  ('01900000-0000-4000-8000-000000000526', '01900000-0000-4000-8000-000000000328',
   'Binary search requires the array to be what?',
   'Binary search halves the range, which only works if the array is sorted.', 2),
  ('01900000-0000-4000-8000-000000000527', '01900000-0000-4000-8000-000000000328',
   'Which approach stores overlapping subproblem results to avoid recomputation?',
   'Memoization caches subproblem answers, a hallmark of dynamic programming.', 3),
  ('01900000-0000-4000-8000-000000000528', '01900000-0000-4000-8000-000000000328',
   'With a swapped flag, what is the best case of bubble sort on an already-sorted array?',
   'The first pass sees no swaps and stops, so the best case is O(n).', 4),
  ('01900000-0000-4000-8000-000000000529', '01900000-0000-4000-8000-000000000328',
   'A weighted path-finder capstone is best built with which structures?',
   'Dijkstra pushes frontier updates into a min-heap and reads distances from a hash map.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): Big-O describes growth
  ('01900000-0000-4000-8000-000000001001', '01900000-0000-4000-8000-000000000501', 'How runtime grows as the input size grows', TRUE,  1),
  ('01900000-0000-4000-8000-000000001002', '01900000-0000-4000-8000-000000000501', 'The exact runtime in milliseconds', FALSE, 2),
  ('01900000-0000-4000-8000-000000001003', '01900000-0000-4000-8000-000000000501', 'The number of lines in the program', FALSE, 3),
  ('01900000-0000-4000-8000-000000001004', '01900000-0000-4000-8000-000000000501', 'The memory address of each variable', FALSE, 4),
  -- Q1 (501)q2: fastest growth
  ('01900000-0000-4000-8000-000000001005', '01900000-0000-4000-8000-000000000502', 'O(n)', FALSE, 1),
  ('01900000-0000-4000-8000-000000001006', '01900000-0000-4000-8000-000000000502', 'O(n log n)', FALSE, 2),
  ('01900000-0000-4000-8000-000000001007', '01900000-0000-4000-8000-000000000502', 'O(n^2)', FALSE, 3),
  ('01900000-0000-4000-8000-000000001008', '01900000-0000-4000-8000-000000000502', 'O(n!)', TRUE,  4),
  -- Q1 (501)q3: upper bound notation
  ('01900000-0000-4000-8000-000000001009', '01900000-0000-4000-8000-000000000503', 'Big-O', TRUE,  1),
  ('01900000-0000-4000-8000-000000001010', '01900000-0000-4000-8000-000000000503', 'Big-Omega', FALSE, 2),
  ('01900000-0000-4000-8000-000000001011', '01900000-0000-4000-8000-000000000503', 'Big-Theta', FALSE, 3),
  ('01900000-0000-4000-8000-000000001012', '01900000-0000-4000-8000-000000000503', 'Little-o', FALSE, 4),
  -- Q2 (504): amortized append
  ('01900000-0000-4000-8000-000000001013', '01900000-0000-4000-8000-000000000504', 'O(1)', TRUE,  1),
  ('01900000-0000-4000-8000-000000001014', '01900000-0000-4000-8000-000000000504', 'O(log n)', FALSE, 2),
  ('01900000-0000-4000-8000-000000001015', '01900000-0000-4000-8000-000000000504', 'O(n)', FALSE, 3),
  ('01900000-0000-4000-8000-000000001016', '01900000-0000-4000-8000-000000000504', 'O(n^2)', FALSE, 4),
  -- Q2 (504)q2: comparison sort floor
  ('01900000-0000-4000-8000-000000001017', '01900000-0000-4000-8000-000000000505', 'O(n log n)', TRUE,  1),
  ('01900000-0000-4000-8000-000000001018', '01900000-0000-4000-8000-000000000505', 'O(n^2)', FALSE, 2),
  ('01900000-0000-4000-8000-000000001019', '01900000-0000-4000-8000-000000000505', 'O(log n)', FALSE, 3),
  ('01900000-0000-4000-8000-000000001020', '01900000-0000-4000-8000-000000000505', 'O(1)', FALSE, 4),
  -- Q2 (504)q3: anagram check
  ('01900000-0000-4000-8000-000000001021', '01900000-0000-4000-8000-000000000506', 'Sorting both strings', FALSE, 1),
  ('01900000-0000-4000-8000-000000001022', '01900000-0000-4000-8000-000000000506', 'Counting character frequencies with a map', TRUE,  2),
  ('01900000-0000-4000-8000-000000001023', '01900000-0000-4000-8000-000000000506', 'Nesting loops over both strings', FALSE, 3),
  ('01900000-0000-4000-8000-000000001024', '01900000-0000-4000-8000-000000000506', 'Comparing lengths only', FALSE, 4),
  -- Q3 (507): reach third node
  ('01900000-0000-4000-8000-000000001025', '01900000-0000-4000-8000-000000000507', 'Follow the next pointers from the head', TRUE,  1),
  ('01900000-0000-4000-8000-000000001026', '01900000-0000-4000-8000-000000000507', 'Index into the list directly', FALSE, 2),
  ('01900000-0000-4000-8000-000000001027', '01900000-0000-4000-8000-000000000507', 'Use the tail link backwards', FALSE, 3),
  ('01900000-0000-4000-8000-000000001028', '01900000-0000-4000-8000-000000000507', 'Ask the hash of the node', FALSE, 4),
  -- Q3 (507)q2: reverse cost
  ('01900000-0000-4000-8000-000000001029', '01900000-0000-4000-8000-000000000508', 'O(n)', TRUE,  1),
  ('01900000-0000-4000-8000-000000001030', '01900000-0000-4000-8000-000000000508', 'O(1)', FALSE, 2),
  ('01900000-0000-4000-8000-000000001031', '01900000-0000-4000-8000-000000000508', 'O(log n)', FALSE, 3),
  ('01900000-0000-4000-8000-000000001032', '01900000-0000-4000-8000-000000000508', 'O(n^2)', FALSE, 4),
  -- Q3 (507)q3: cycle detection
  ('01900000-0000-4000-8000-000000001033', '01900000-0000-4000-8000-000000000509', 'Binary search', FALSE, 1),
  ('01900000-0000-4000-8000-000000001034', '01900000-0000-4000-8000-000000000509', 'Floyd turtle and hare pointers', TRUE,  2),
  ('01900000-0000-4000-8000-000000001035', '01900000-0000-4000-8000-000000000509', 'Rebalancing', FALSE, 3),
  ('01900000-0000-4000-8000-000000001036', '01900000-0000-4000-8000-000000000509', 'Memoization', FALSE, 4),
  -- Q4 (510): LIFO
  ('01900000-0000-4000-8000-000000001037', '01900000-0000-4000-8000-000000000510', 'LIFO, last in first out', TRUE,  1),
  ('01900000-0000-4000-8000-000000001038', '01900000-0000-4000-8000-000000000510', 'FIFO, first in first out', FALSE, 2),
  ('01900000-0000-4000-8000-000000001039', '01900000-0000-4000-8000-000000000510', 'Random access', FALSE, 3),
  ('01900000-0000-4000-8000-000000001040', '01900000-0000-4000-8000-000000000510', 'Priority order only', FALSE, 4),
  -- Q4 (510)q2: stack application
  ('01900000-0000-4000-8000-000000001041', '01900000-0000-4000-8000-000000000511', 'Matching brackets in code', TRUE,  1),
  ('01900000-0000-4000-8000-000000001042', '01900000-0000-4000-8000-000000000511', 'Breadth-first traversal', FALSE, 2),
  ('01900000-0000-4000-8000-000000001043', '01900000-0000-4000-8000-000000000511', 'Cache eviction', FALSE, 3),
  ('01900000-0000-4000-8000-000000001044', '01900000-0000-4000-8000-000000000511', 'Sorting a heap', FALSE, 4),
  -- Q4 (510)q3: deque
  ('01900000-0000-4000-8000-000000001045', '01900000-0000-4000-8000-000000000512', 'Stack', FALSE, 1),
  ('01900000-0000-4000-8000-000000001046', '01900000-0000-4000-8000-000000000512', 'Deque', TRUE,  2),
  ('01900000-0000-4000-8000-000000001047', '01900000-0000-4000-8000-000000000512', 'Binary tree', FALSE, 3),
  ('01900000-0000-4000-8000-000000001048', '01900000-0000-4000-8000-000000000512', 'Hash table', FALSE, 4),
  -- Q5 (513): average lookup
  ('01900000-0000-4000-8000-000000001049', '01900000-0000-4000-8000-000000000513', 'O(1)', TRUE,  1),
  ('01900000-0000-4000-8000-000000001050', '01900000-0000-4000-8000-000000000513', 'O(n)', FALSE, 2),
  ('01900000-0000-4000-8000-000000001051', '01900000-0000-4000-8000-000000000513', 'O(log n)', FALSE, 3),
  ('01900000-0000-4000-8000-000000001052', '01900000-0000-4000-8000-000000000513', 'O(n^2)', FALSE, 4),
  -- Q5 (513)q2: collision
  ('01900000-0000-4000-8000-000000001053', '01900000-0000-4000-8000-000000000514', 'A collision', TRUE,  1),
  ('01900000-0000-4000-8000-000000001054', '01900000-0000-4000-8000-000000000514', 'A deadlock', FALSE, 2),
  ('01900000-0000-4000-8000-000000001055', '01900000-0000-4000-8000-000000000514', 'A page fault', FALSE, 3),
  ('01900000-0000-4000-8000-000000001056', '01900000-0000-4000-8000-000000000514', 'A stack overflow', FALSE, 4),
  -- Q5 (513)q3: load factor
  ('01900000-0000-4000-8000-000000001057', '01900000-0000-4000-8000-000000000515', 'Ratio of entries to buckets', TRUE,  1),
  ('01900000-0000-4000-8000-000000001058', '01900000-0000-4000-8000-000000000515', 'Depth of the hash function', FALSE, 2),
  ('01900000-0000-4000-8000-000000001059', '01900000-0000-4000-8000-000000000515', 'Number of threads', FALSE, 3),
  ('01900000-0000-4000-8000-000000001060', '01900000-0000-4000-8000-000000000515', 'Size of each bucket in bytes', FALSE, 4),
  -- Q6 (516): leaf
  ('01900000-0000-4000-8000-000000001061', '01900000-0000-4000-8000-000000000516', 'Leaf', TRUE,  1),
  ('01900000-0000-4000-8000-000000001062', '01900000-0000-4000-8000-000000000516', 'Root', FALSE, 2),
  ('01900000-0000-4000-8000-000000001063', '01900000-0000-4000-8000-000000000516', 'Branch', FALSE, 3),
  ('01900000-0000-4000-8000-000000001064', '01900000-0000-4000-8000-000000000516', 'Heap', FALSE, 4),
  -- Q6 (516)q2: inorder
  ('01900000-0000-4000-8000-000000001065', '01900000-0000-4000-8000-000000000517', 'Left, node, right', TRUE,  1),
  ('01900000-0000-4000-8000-000000001066', '01900000-0000-4000-8000-000000000517', 'Node, left, right', FALSE, 2),
  ('01900000-0000-4000-8000-000000001067', '01900000-0000-4000-8000-000000000517', 'Left, right, node', FALSE, 3),
  ('01900000-0000-4000-8000-000000001068', '01900000-0000-4000-8000-000000000517', 'Level by level', FALSE, 4),
  -- Q6 (516)q3: BST search
  ('01900000-0000-4000-8000-000000001069', '01900000-0000-4000-8000-000000000518', 'O(log n)', TRUE,  1),
  ('01900000-0000-4000-8000-000000001070', '01900000-0000-4000-8000-000000000518', 'O(n)', FALSE, 2),
  ('01900000-0000-4000-8000-000000001071', '01900000-0000-4000-8000-000000000518', 'O(1)', FALSE, 3),
  ('01900000-0000-4000-8000-000000001072', '01900000-0000-4000-8000-000000000518', 'O(n log n)', FALSE, 4),
  -- Q7 (519): min-heap root
  ('01900000-0000-4000-8000-000000001073', '01900000-0000-4000-8000-000000000519', 'At the root', TRUE,  1),
  ('01900000-0000-4000-8000-000000001074', '01900000-0000-4000-8000-000000000519', 'At the last leaf', FALSE, 2),
  ('01900000-0000-4000-8000-000000001075', '01900000-0000-4000-8000-000000000519', 'In any random index', FALSE, 3),
  ('01900000-0000-4000-8000-000000001076', '01900000-0000-4000-8000-000000000519', 'At the deepest level', FALSE, 4),
  -- Q7 (519)q2: extract-min cost
  ('01900000-0000-4000-8000-000000001077', '01900000-0000-4000-8000-000000000520', 'O(log n)', TRUE,  1),
  ('01900000-0000-4000-8000-000000001078', '01900000-0000-4000-8000-000000000520', 'O(1)', FALSE, 2),
  ('01900000-0000-4000-8000-000000001079', '01900000-0000-4000-8000-000000000520', 'O(n)', FALSE, 3),
  ('01900000-0000-4000-8000-000000001080', '01900000-0000-4000-8000-000000000520', 'O(n^2)', FALSE, 4),
  -- Q7 (519)q3: priority queue structure
  ('01900000-0000-4000-8000-000000001081', '01900000-0000-4000-8000-000000000521', 'Binary heap', TRUE,  1),
  ('01900000-0000-4000-8000-000000001082', '01900000-0000-4000-8000-000000000521', 'Singly linked list', FALSE, 2),
  ('01900000-0000-4000-8000-000000001083', '01900000-0000-4000-8000-000000000521', 'Stack', FALSE, 3),
  ('01900000-0000-4000-8000-000000001084', '01900000-0000-4000-8000-000000000521', 'Undirected graph', FALSE, 4),
  -- Q8 (522): adjacency list
  ('01900000-0000-4000-8000-000000001085', '01900000-0000-4000-8000-000000000522', 'A list of neighboring vertices', TRUE,  1),
  ('01900000-0000-4000-8000-000000001086', '01900000-0000-4000-8000-000000000522', 'A sorted copy of all vertices', FALSE, 2),
  ('01900000-0000-4000-8000-000000001087', '01900000-0000-4000-8000-000000000522', 'Its subtree only', FALSE, 3),
  ('01900000-0000-4000-8000-000000001088', '01900000-0000-4000-8000-000000000522', 'Its hash value', FALSE, 4),
  -- Q8 (522)q2: BFS structure
  ('01900000-0000-4000-8000-000000001089', '01900000-0000-4000-8000-000000000523', 'A queue', TRUE,  1),
  ('01900000-0000-4000-8000-000000001090', '01900000-0000-4000-8000-000000000523', 'A stack', FALSE, 2),
  ('01900000-0000-4000-8000-000000001091', '01900000-0000-4000-8000-000000000523', 'A heap', FALSE, 3),
  ('01900000-0000-4000-8000-000000001092', '01900000-0000-4000-8000-000000000523', 'A binary search tree', FALSE, 4),
  -- Q8 (522)q3: shortest path unweighted
  ('01900000-0000-4000-8000-000000001093', '01900000-0000-4000-8000-000000000524', 'Breadth-first search', TRUE,  1),
  ('01900000-0000-4000-8000-000000001094', '01900000-0000-4000-8000-000000000524', 'Depth-first search', FALSE, 2),
  ('01900000-0000-4000-8000-000000001095', '01900000-0000-4000-8000-000000000524', 'Quicksort', FALSE, 3),
  ('01900000-0000-4000-8000-000000001096', '01900000-0000-4000-8000-000000000524', 'Memoized recursion', FALSE, 4),
  -- Q9 (525): stable log-linear sort
  ('01900000-0000-4000-8000-000000001097', '01900000-0000-4000-8000-000000000525', 'Merge sort', TRUE,  1),
  ('01900000-0000-4000-8000-000000001098', '01900000-0000-4000-8000-000000000525', 'Bubble sort', FALSE, 2),
  ('01900000-0000-4000-8000-000000001099', '01900000-0000-4000-8000-000000000525', 'Selection sort', FALSE, 3),
  ('01900000-0000-4000-8000-000000001100', '01900000-0000-4000-8000-000000000525', 'Quicksort on a reversed array', FALSE, 4),
  -- Q9 (525)q2: binary search precondition
  ('01900000-0000-4000-8000-000000001101', '01900000-0000-4000-8000-000000000526', 'Sorted', TRUE,  1),
  ('01900000-0000-4000-8000-000000001102', '01900000-0000-4000-8000-000000000526', 'Unsorted', FALSE, 2),
  ('01900000-0000-4000-8000-000000001103', '01900000-0000-4000-8000-000000000526', 'Unique and unsorted', FALSE, 3),
  ('01900000-0000-4000-8000-000000001104', '01900000-0000-4000-8000-000000000526', 'Circularly linked', FALSE, 4),
  -- Q9 (525)q3: memoization
  ('01900000-0000-4000-8000-000000001105', '01900000-0000-4000-8000-000000000527', 'Dynamic programming with memoization', TRUE,  1),
  ('01900000-0000-4000-8000-000000001106', '01900000-0000-4000-8000-000000000527', 'Bubble sort', FALSE, 2),
  ('01900000-0000-4000-8000-000000001107', '01900000-0000-4000-8000-000000000527', 'Linear probing', FALSE, 3),
  ('01900000-0000-4000-8000-000000001108', '01900000-0000-4000-8000-000000000527', 'Preorder traversal', FALSE, 4),
  -- Q9 (525)q4: bubble best case
  ('01900000-0000-4000-8000-000000001109', '01900000-0000-4000-8000-000000000528', 'O(n)', TRUE,  1),
  ('01900000-0000-4000-8000-000000001110', '01900000-0000-4000-8000-000000000528', 'O(n log n)', FALSE, 2),
  ('01900000-0000-4000-8000-000000001111', '01900000-0000-4000-8000-000000000528', 'O(n^2)', FALSE, 3),
  ('01900000-0000-4000-8000-000000001112', '01900000-0000-4000-8000-000000000528', 'O(2^n)', FALSE, 4),
  -- Q9 (525)q5: capstone structures
  ('01900000-0000-4000-8000-000000001113', '01900000-0000-4000-8000-000000000529', 'Priority queue plus a hash map of best distances', TRUE,  1),
  ('01900000-0000-4000-8000-000000001114', '01900000-0000-4000-8000-000000000529', 'A stack plus a binary tree', FALSE, 2),
  ('01900000-0000-4000-8000-000000001115', '01900000-0000-4000-8000-000000000529', 'Two parallel linked lists', FALSE, 3),
  ('01900000-0000-4000-8000-000000001116', '01900000-0000-4000-8000-000000000529', 'A single sorted array of edges', FALSE, 4)
ON CONFLICT (id) DO NOTHING;
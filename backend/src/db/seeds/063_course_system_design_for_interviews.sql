-- ============================================================================
-- SEED 063: Complete course — "System Design for Interviews"
-- ----------------------------------------------------------------------------
-- Instructor : Elena Rodriguez    (10000000-0000-4000-8000-000000000005)
-- Category   : Software Design & Architecture (20000000-0000-4000-8000-000000000010)
-- Level      : ADVANCED · Access : SUBSCRIPTION · Status : PUBLISHED
-- Position   : 61
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 The Interview Blueprint    → C1 Requirements & Scope · C2 High-Level & Deep Dive
--   M2 Scaling Fundamentals       → C3 Estimation & Capacity · C4 Scaling & Load Balancing
--   M3 The Data Layer             → C5 Caching Layers · C6 Databases: SQL & NoSQL
--   M4 Distributed Building Blocks→ C7 CDNs & Edge · C8 Queues, Sharding & Consistency
--   M5 Capstone Practice          → C9 Classic Designs · C10 End-to-End Walkthrough
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
  '03F00000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000005',
  '20000000-0000-4000-8000-000000000010',
  'System Design for Interviews',
  'system-design-for-interviews',
  'Crack the system design interview with a repeatable framework. Master requirements gathering, back-of-envelope estimation, scaling, caching, databases, CDNs, queues, sharding, and consistency — then design a news feed and URL shortener and close with a full capstone walkthrough.',
  'PUBLISHED',
  'ADVANCED',
  'SUBSCRIPTION',
  61
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('03F00000-0000-4000-8000-000000000011', '03F00000-0000-4000-8000-000000000001', 'Run the four-phase interview framework: requirements, scale, high-level design, and deep dive.', 1),
  ('03F00000-0000-4000-8000-000000000012', '03F00000-0000-4000-8000-000000000001', 'Estimate traffic, storage, and bandwidth with back-of-envelope math in minutes.',                   2),
  ('03F00000-0000-4000-8000-000000000013', '03F00000-0000-4000-8000-000000000001', 'Choose scaling strategies, load balancers, and caching layers for a given workload.',              3),
  ('03F00000-0000-4000-8000-000000000014', '03F00000-0000-4000-8000-000000000001', 'Decide between SQL and NoSQL, add sharding, and reason about consistency and the CAP theorem.',     4),
  ('03F00000-0000-4000-8000-000000000015', '03F00000-0000-4000-8000-000000000001', 'Design a news feed and a URL shortener end to end, then present one full capstone walkthrough.',    5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('03F00000-0000-4000-8000-000000000101', '03F00000-0000-4000-8000-000000000001', 1, 'The Interview Blueprint',       'Learn the four-phase framework and how to scope any product prompt.',   'PUBLISHED'),
  ('03F00000-0000-4000-8000-000000000102', '03F00000-0000-4000-8000-000000000001', 2, 'Scaling Fundamentals',          'Estimate demand and scale services with load balancers.',               'PUBLISHED'),
  ('03F00000-0000-4000-8000-000000000103', '03F00000-0000-4000-8000-000000000001', 3, 'The Data Layer',                'Cache aggressively and choose the right database for the workload.',    'PUBLISHED'),
  ('03F00000-0000-4000-8000-000000000104', '03F00000-0000-4000-8000-000000000001', 4, 'Distributed Building Blocks',   'Use CDNs, queues, sharding, and consistency models to go global.',      'PUBLISHED'),
  ('03F00000-0000-4000-8000-000000000105', '03F00000-0000-4000-8000-000000000001', 5, 'Capstone Practice',             'Design a news feed and URL shortener, then one full end-to-end pass.',  'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('03F00000-0000-4000-8000-000000000201', '03F00000-0000-4000-8000-000000000101', 1, 'Requirements & Scope',          'Pin down what the system does before drawing a single box.',            'PUBLISHED'),
  ('03F00000-0000-4000-8000-000000000202', '03F00000-0000-4000-8000-000000000101', 2, 'High-Level & Deep Dive',        'Sketch components, then zoom into bottlenecks and tradeoffs.',          'PUBLISHED'),
  ('03F00000-0000-4000-8000-000000000203', '03F00000-0000-4000-8000-000000000102', 1, 'Estimation & Capacity',         'Turn interview math into defensible numbers.',                          'PUBLISHED'),
  ('03F00000-0000-4000-8000-000000000204', '03F00000-0000-4000-8000-000000000102', 2, 'Scaling & Load Balancing',      'Grow horizontally and spread traffic across a fleet.',                 'PUBLISHED'),
  ('03F00000-0000-4000-8000-000000000205', '03F00000-0000-4000-8000-000000000103', 1, 'Caching Layers',                'Put hot data closer to the user at every layer.',                      'PUBLISHED'),
  ('03F00000-0000-4000-8000-000000000206', '03F00000-0000-4000-8000-000000000103', 2, 'Databases: SQL & NoSQL',        'Match the store to the access pattern.',                               'PUBLISHED'),
  ('03F00000-0000-4000-8000-000000000207', '03F00000-0000-4000-8000-000000000104', 1, 'CDNs & Edge',                   'Serve from the edge and keep origins alive.',                          'PUBLISHED'),
  ('03F00000-0000-4000-8000-000000000208', '03F00000-0000-4000-8000-000000000104', 2, 'Queues, Sharding & Consistency','Decouple work, split data, and state your guarantees.',                'PUBLISHED'),
  ('03F00000-0000-4000-8000-000000000209', '03F00000-0000-4000-8000-000000000105', 1, 'Classic Designs',               'Two interview staples: a news feed and a URL shortener.',              'PUBLISHED'),
  ('03F00000-0000-4000-8000-000000000210', '03F00000-0000-4000-8000-000000000105', 2, 'End-to-End Walkthrough',        'One complete design from prompt to deep dive.',                        'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 03F00000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('03F00000-0000-4000-8000-000000000301', '03F00000-0000-4000-8000-000000000201', 1, 'Anatomy of a System Design Interview',        'See the four-phase format and what interviewers actually grade.',         'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('03F00000-0000-4000-8000-000000000302', '03F00000-0000-4000-8000-000000000201', 2, 'Gathering Requirements',                       'Turn a vague prompt into concrete functional and non-functional needs.',  'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('03F00000-0000-4000-8000-000000000303', '03F00000-0000-4000-8000-000000000201', 3, 'Interview Framework Quiz',                     'Check your grasp of the process and requirements phase.',                'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('03F00000-0000-4000-8000-000000000304', '03F00000-0000-4000-8000-000000000202', 1, 'High-Level Design & Components',               'Draw the boxes and arrows of a scalable architecture.',                   'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('03F00000-0000-4000-8000-000000000305', '03F00000-0000-4000-8000-000000000202', 2, 'Deep Dive: Bottlenecks & Tradeoffs',           'Pick one component and push on its constraints.',                         'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('03F00000-0000-4000-8000-000000000306', '03F00000-0000-4000-8000-000000000202', 3, 'High-Level & Deep Dive Quiz',                  'Test your high-level design and bottleneck analysis skills.',             'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('03F00000-0000-4000-8000-000000000307', '03F00000-0000-4000-8000-000000000203', 1, 'Back-of-Envelope Estimation',                  'Estimate QPS, storage, and bandwidth with quick math.',                   'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('03F00000-0000-4000-8000-000000000308', '03F00000-0000-4000-8000-000000000203', 2, 'Capacity Planning',                            'Turn estimates into servers, shards, and replica counts.',                'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('03F00000-0000-4000-8000-000000000309', '03F00000-0000-4000-8000-000000000203', 3, 'Estimation Quiz',                              'Verify your back-of-envelope and capacity math.',                         'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('03F00000-0000-4000-8000-000000000310', '03F00000-0000-4000-8000-000000000204', 1, 'Scaling Strategies',                           'Compare vertical scaling, replication, and horizontal growth.',            'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('03F00000-0000-4000-8000-000000000311', '03F00000-0000-4000-8000-000000000204', 2, 'Load Balancing & Stateless Services',          'Distribute traffic and offload connection state.',                        'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('03F00000-0000-4000-8000-000000000312', '03F00000-0000-4000-8000-000000000204', 3, 'Scaling & Load Balancing Quiz',                'Test your scaling and load distribution choices.',                        'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('03F00000-0000-4000-8000-000000000313', '03F00000-0000-4000-8000-000000000205', 1, 'Caching Layers',                                'From browser to CDN to in-memory cache: where to put hot data.',           'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('03F00000-0000-4000-8000-000000000314', '03F00000-0000-4000-8000-000000000205', 2, 'Cache Strategies & Invalidation',               'Cache-aside, write-through, and the art of keeping caches fresh.',         'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('03F00000-0000-4000-8000-000000000315', '03F00000-0000-4000-8000-000000000205', 3, 'Caching Quiz',                                  'Check your caching strategy instincts.',                                  'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('03F00000-0000-4000-8000-000000000316', '03F00000-0000-4000-8000-000000000206', 1, 'SQL Databases & Indexing',                      'When relational data wins and how indexes speed it up.',                  'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('03F00000-0000-4000-8000-000000000317', '03F00000-0000-4000-8000-000000000206', 2, 'NoSQL Databases & When to Use Them',            'Key-value, document, columnar, and graph stores compared.',               'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('03F00000-0000-4000-8000-000000000318', '03F00000-0000-4000-8000-000000000206', 3, 'Databases Quiz',                                'Test your SQL vs NoSQL decision-making.',                                 'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('03F00000-0000-4000-8000-000000000319', '03F00000-0000-4000-8000-000000000207', 1, 'CDNs, Edge & Static Content',                   'Push bytes to the edge and keep the origin fast.',                        'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('03F00000-0000-4000-8000-000000000320', '03F00000-0000-4000-8000-000000000207', 2, 'Message Queues & Async Processing',             'Decouple producers and consumers with queues and workers.',               'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('03F00000-0000-4000-8000-000000000321', '03F00000-0000-4000-8000-000000000207', 3, 'CDN, Queues & Async Quiz',                      'Check your understanding of edge delivery and async patterns.',           'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('03F00000-0000-4000-8000-000000000322', '03F00000-0000-4000-8000-000000000208', 1, 'Sharding & Partitioning',                       'Split data horizontally with hash, range, and directory sharding.',       'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('03F00000-0000-4000-8000-000000000323', '03F00000-0000-4000-8000-000000000208', 2, 'Consistency Models & the CAP Theorem',          'Strong vs eventual consistency, and what CAP really says.',               'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('03F00000-0000-4000-8000-000000000324', '03F00000-0000-4000-8000-000000000208', 3, 'Sharding & Consistency Quiz',                   'Test your sharding and CAP knowledge.',                                   'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('03F00000-0000-4000-8000-000000000325', '03F00000-0000-4000-8000-000000000209', 1, 'Design a News Feed',                            'Scrape followers, fan out writes, and rank an endless timeline.',         'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('03F00000-0000-4000-8000-000000000326', '03F00000-0000-4000-8000-000000000209', 2, 'Design a URL Shortener',                        'Turn long links into short codes with a tiny, scalable back end.',         'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('03F00000-0000-4000-8000-000000000327', '03F00000-0000-4000-8000-000000000210', 1, 'Capstone: End-to-End Walkthrough',              'One system, four phases: requirements to deep dive in sequence.',          'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('03F00000-0000-4000-8000-000000000328', '03F00000-0000-4000-8000-000000000210', 2, 'Final Assessment',                              'Prove you can design a system from prompt to deep dive.',                 'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 03F00000-…-0401 .. 0427)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '03F00000-0000-4000-8000-000000000401',
  '03F00000-0000-4000-8000-000000000301',
  1,
  'Anatomy of a System Design Interview',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Anatomy of a System Design Interview</title>
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
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #4c1d95; color: #ddd6fe; }
.dark .lesson-page .callout { background: #4c1d95; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c1d95; color: #ddd6fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Anatomy of a System Design Interview</h1>
  <p>A system design interview is a <strong>live architecture conversation</strong>. You are not quizzed on a memorized answer — you are evaluated on how you scope a vague problem, make decisions, and defend them.</p>
  <p>Almost every interview follows the same four-phase rhythm. Learn it once and you can plug any product into it.</p>
  <h2>The four-phase framework</h2>
  <table>
    <tr><th>Phase</th><th>Goal</th><th>Output</th></tr>
    <tr><td>1. Requirements</td><td>Agree on what the system does and why</td><td>Feature list + non-functional goals</td></tr>
    <tr><td>2. Scale</td><td>Quantify the ballpark</td><td>QPS, storage, bandwidth numbers</td></tr>
    <tr><td>3. High-level</td><td>Name the components</td><td>Box-and-arrow diagram</td></tr>
    <tr><td>4. Deep dive</td><td>Prove one hard part works</td><td>Detail on a bottleneck + tradeoffs</td></tr>
  </table>
  <p>The order matters: requirements before scale, scale before components, components before depth. Skipping a phase is the fastest way to build the wrong thing.</p>
  <h2>What interviewers actually grade</h2>
  <ul>
    <li><strong>Communication</strong> — do they understand you without reading your mind?</li>
    <li><strong>Prioritization</strong> — do you pick the 20% that matters over the 80% that distracts?</li>
    <li><strong>Tradeoff awareness</strong> — can you name what each choice costs?</li>
    <li><strong>Depth range</strong> — can you zoom into a specific component and back out smoothly?</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Interviewer as teammate</strong>
    <p>Treat the interviewer as a <em>colleague</em>, not an examiner. State your assumptions, check scope, and invite pushback. A candidate who navigates pushback calmly is exactly what teams hire.</p>
  </div>
  <h2>A note on time</h2>
  <p>A 45-minute session roughly maps to: <span class="ic">5m</span> requirements, <span class="ic">5m</span> scale, <span class="ic">15-20m</span> high-level, <span class="ic">10-15m</span> deep dive. Real interviews flex, but the proportions stay the same: the deep dive should always fit.</p>
  <div class="callout callout-info">
    <strong>Do not memorize</strong>
    <p>Memorized blueprints break the moment the interviewer changes one constraint. Instead, memorize the <em>question planning chart</em> — the four phases — and design fresh inside it.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03F00000-0000-4000-8000-000000000402',
  '03F00000-0000-4000-8000-000000000302',
  1,
  'Gathering Requirements',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Gathering Requirements</title>
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
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #4c1d95; color: #ddd6fe; }
.dark .lesson-page .callout { background: #4c1d95; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c1d95; color: #ddd6fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Gathering Requirements</h1>
  <p>Interview prompts are deliberately vague — <span class="ic">"Design Twitter"</span> could mean a whole platform or just a timeline API. Your first job is to <strong>shrink the problem</strong> into a scoped, answerable system.</p>
  <h2>Functional requirements</h2>
  <p>Start with what the system must <em>do</em>. List the core user actions and immediately cut the ones outside the prompt:</p>
  <ul>
    <li>Who uses it? One user, millions, or customers? B2B vs B2C massively changes the design.</li>
    <li>What are the <strong>primary actions</strong>? For a feed: post, follow, read. That is it — not search, not ads.</li>
    <li>What are we explicitly <em>not</em> building? Say it: <span class="ic">"I will treat authentication and moderation as out of scope."</span></li>
  </ul>
  <div class="callout callout-tip">
    <strong>Use the two-sentence scope</strong>
    <p>Re-state the product in two sentences and ask the interviewer to confirm. A thirty-second confirmation prevents a ten-minute detour.</p>
  </div>
  <h2>Non-functional requirements</h2>
  <p>These constraints decide most architecture choices:</p>
  <table>
    <tr><th>Requirement</th><th>Example target</th><th>Design impact</th></tr>
    <tr><td>Latency</td><td>P95 &lt; 200ms on read</td><td>Caching, CDN, edge</td></tr>
    <tr><td>Availability</td><td>99.9% uptime</td><td>Replicas, failover, no SPOFs</td></tr>
    <tr><td>Consistency</td><td>Read-your-writes</td><td>Replica and shard choices</td></tr>
    <tr><td>Scale</td><td>10M MAU, 1M DAU</td><td>Everything that follows</td></tr>
  </table>
  <h2>Requirement red flags</h2>
  <p>Certain answers expose a risky design immediately. Watch for:</p>
  <ul>
    <li><strong>"This must never fail."</strong> — everything fails; press on availability tiers instead.</li>
    <li><strong>"Support infinite scale."</strong> — pin a number, even a guess.</li>
    <li><strong>"Global, everywhere."</strong> — ask where the users actually are; most are concentrated.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Write it down</strong>
    <p>Jot the agreed requirements visibly (screen or whiteboard) so earlier decisions stay visible when you design the deep dive ten minutes later.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03F00000-0000-4000-8000-000000000404',
  '03F00000-0000-4000-8000-000000000304',
  1,
  'High-Level Design & Components',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>High-Level Design & Components</title>
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
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #4c1d95; color: #ddd6fe; }
.dark .lesson-page .callout { background: #4c1d95; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c1d95; color: #ddd6fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>High-Level Design &amp; Components</h1>
  <p>With requirements and scale agreed, you draw the system as <strong>boxes and arrows</strong>. The high-level design answers one question: <em>which ingredients belong in this kitchen?</em></p>
  <h2>The standard ingredient list</h2>
  <ul>
    <li><span class="ic">Clients</span> — mobile app, browser, or API caller.</li>
    <li><span class="ic">Edge</span> — CDN for static assets; later an API gateway.</li>
    <li><span class="ic">Load balancer</span> — splits traffic across app servers.</li>
    <li><span class="ic">Application servers</span> — stateless workers that own the logic.</li>
    <li><span class="ic">Cache</span> — for hot reads (Redis or Memcached).</li>
    <li><span class="ic">Database(s)</span> — primary store; often one for reads, one for writes.</li>
    <li><span class="ic">Queue</span> — for anything slow or bursty (emails, thumbnails, feeds).</li>
  </ul>
  <h2>A generic blueprint</h2>
  <pre class="code-block">[Client]
   |
[CDN / static] -------- applied assets
   |
[Load Balancer]
   |
[App server xN]  ----&gt; [Cache]  ----&gt; [Database primary]
         |
         +----------&gt; [Queue] ----&gt; [Workers] ----&gt; [Database(s)]</pre>
  <p>Almost every interview answer is some subset of this picture. Your skill is deciding which ingredients this prompt actually needs. A URL shortener has no queue and no CDN at first; a feeds product has both.</p>
  <h2>Drawing rules</h2>
  <ul>
    <li>Keep boxes <strong>course-grained</strong> first — one box per subsystem, not per class.</li>
    <li>Label arrows with the data that moves: <span class="ic">HTTP</span>, <span class="ic">SQL</span>, <span class="ic">events</span>.</li>
    <li>Draw the <strong>write path</strong> and <strong>read path</strong> separately in your head.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Start boring</strong>
    <p>Begin with the obvious components and add only what the prompt forces. Interviewers reward an answer that is <em>right-sized</em>, not one that lists every tool ever built.</p>
  </div>
  <h2>Check your coverage</h2>
  <p>At the end of the high-level pass, walk each functional requirement and confirm a box handles it. The gap between a requirement and a box is your deep dive candidate.</p>
  <div class="callout callout-info">
    <strong>Keep every arrow justifiable</strong>
    <p>If you cannot explain in one sentence why a component exists, remove it. A clean diagram always reads better than an impressive one.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03F00000-0000-4000-8000-000000000405',
  '03F00000-0000-4000-8000-000000000305',
  1,
  'Deep Dive: Bottlenecks & Tradeoffs',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Deep Dive: Bottlenecks & Tradeoffs</title>
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
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #4c1d95; color: #ddd6fe; }
.dark .lesson-page .callout { background: #4c1d95; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c1d95; color: #ddd6fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Deep Dive: Bottlenecks &amp; Tradeoffs</h1>
  <p>The deep dive is where interviews are won. You pick <strong>one component</strong> — the database, the fan-out, the ranking — and prove you can make it work under the scale you estimated.</p>
  <h2>How to choose the deep dive</h2>
  <p>Look for the component that will <em>break first</em>. In most prompts that is either the write path (feeds, messaging) or the read path (profiles, hot keys). Then agree with the interviewer: <span class="ic">"Let me zoom into the feed generation."</span></p>
  <h2>The bottleneck hunt checklist</h2>
  <ol>
    <li><strong>Trace one request</strong> end to end and count every stop.</li>
    <li><strong>Ask which stop does the most work</strong> per unit of time.</li>
    <li><strong>Ask which stop fails first</strong> as traffic doubles.</li>
    <li><strong>Ask what is shared</strong> — shared databases and hot caches die first.</li>
  </ol>
  <pre class="code-block">read /feed?user=42
  1. LB        - stateless, cheap
  2. app server - O(followee count) fan-out  &lt;-- suspect
  3. cache     - hot keys may be shared     &lt;-- suspect
  4. DB        - index seek is fast unless hot row</pre>
  <h2>Name the tradeoff, always</h2>
  <p>Every engineering choice trades something. Say it explicitly:</p>
  <table>
    <tr><th>Choice</th><th>Gain</th><th>Cost</th></tr>
    <tr><td>Cache it</td><td>Fast reads</td><td>Staleness, eviction</td></tr>
    <tr><td>Shard it</td><td>More write capacity</td><td>Cross-shard queries</td></tr>
    <tr><td>Queue it</td><td>Absorb bursts</td><td>Latency, ordering</td></tr>
    <tr><td>Replicate</td><td>Read capacity + HA</td><td>Replica lag</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Finish the loop</strong>
    <p>End the deep dive by zooming back out: state what the deep dive proved, what it did <em>not</em> prove, and what you would validate with real load tests.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03F00000-0000-4000-8000-000000000407',
  '03F00000-0000-4000-8000-000000000307',
  1,
  'Back-of-Envelope Estimation',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Back-of-Envelope Estimation</title>
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
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #4c1d95; color: #ddd6fe; }
.dark .lesson-page .callout { background: #4c1d95; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c1d95; color: #ddd6fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Back-of-Envelope Estimation</h1>
  <p>Interviewers do not want exact forecasts — they want <strong>order-of-magnitude</strong> reasoning. A number that is right to within a factor of ten is usually enough to drive every design decision that follows.</p>
  <h2>The tools</h2>
  <pre class="code-block">seconds in a day            ≈ 86,400   (round to 100k)
requests per second (QPS)   = daily requests / 100,000
peak QPS                    ≈ 2-3x the daily average
storage                    = objects/day x bytes each x retention days
bandwidth                  = bytes/sec x 8 bits (plus ~10% overhead)</pre>
  <h2>Worked example: daily active reads</h2>
  <pre class="code-block">10M users/day, 5 page views each
= 50M page views/day
= 50M / 100k seconds ≈ 500 QPS average
→ peak ≈ 1,000-1,500 QPS, design for 2,000 QPS headroom</pre>
  <p>That single line — <span class="ic">2,000 QPS target</span> — tells you a few application servers suffice and the database needs an index plus a cache in front.</p>
  <h2>Worked example: storage</h2>
  <pre class="code-block">100M new posts/day, 1 KB each
= 100 GB/day
5-year retention = 100 GB x 365 x 5 ≈ 180 TB
→ sharded object store, warm tier for recent, cold tier for old</pre>
  <h2>Quick sanity constants</h2>
  <table>
    <tr><th>Quantity</th><th>Rough value</th></tr>
    <tr><td>Good single DB core</td><td>hundreds to low thousands of QPS</td></tr>
    <tr><td>Redis single node</td><td>~100k simple ops/sec</td></tr>
    <tr><td>Typical app server</td><td>thousands of simple req/s</td></tr>
    <tr><td>Network</td><td>~100ms cross-region, ~1ms datacenter</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Round to one digit</strong>
    <p>Round aggressively and say so: <span class="ic">"About 100k seconds a day, so roughly 500 QPS."</span> Interviewers reward clean reasoning, not pointless precision.</p>
  </div>
  <div class="callout callout-info">
    <strong>Check the bottleneck</strong>
    <p>After computing, immediately translate each number into a design action. The whole point of the math is the decisions — a number with no decision is dead weight.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03F00000-0000-4000-8000-000000000408',
  '03F00000-0000-4000-8000-000000000308',
  1,
  'Capacity Planning',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capacity Planning</title>
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
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #4c1d95; color: #ddd6fe; }
.dark .lesson-page .callout { background: #4c1d95; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c1d95; color: #ddd6fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capacity Planning</h1>
  <p>Capacity planning turns back-of-envelope numbers into <strong>counts of real machines</strong>. Interviewers rarely demand exact bills — they want you to show the multiply-by-one-digit path from demand to hardware.</p>
  <h2>The one graph that ties it together</h2>
  <pre class="code-block">demand QPS ──&gt; app servers (req/s each)
          └─&gt; DB reads ──&gt; DB cores / replicas
          └─&gt; DB writes ──&gt; shards or write replicas
          └─&gt; storage/day ──&gt; disk per host x retention</pre>
  <h2>Server count example</h2>
  <pre class="code-block">target peak:    2,000 QPS
per server:     ~500 req/s comfortably
servers:        2,000 / 500 = 4, plus 2 for failover = 6 app servers</pre>
  <h2>Database capacity example</h2>
  <pre class="code-block">reads:      1,500 QPS    → primary + 2 read replicas, index heavily
writes:     300 QPS      → single primary OK; shard when &gt; ~5k writes
storage:    100 GB/day   → 5yr ≈ 180 TB → 6 hosts x 40 TB, or object store</pre>
  <h2>Always add the failure headroom</h2>
  <p>No capacity plan is complete without <span class="ic">N+1</span> or <span class="ic">N+2</span> headroom:</p>
  <ul>
    <li>Every tier must survive losing <strong>one node</strong> without dropping load.</li>
    <li>Plan for <strong>peak</strong>, not average — peaks are 2-3x averages.</li>
    <li>Budget <strong>30% CPU headroom</strong> so auth storms and retries do not max the fleet.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Sanity-check your own answer</strong>
    <p>After planning, ask: <em>"Does this feel like a system a real company runs?"</em> If the plan needs 400 servers for a 2,000-QPS prompt, your per-node assumption is wrong somewhere.</p>
  </div>
  <div class="callout callout-info">
    <strong>Say what you estimated</strong>
    <p>Voice the assumption: <span class="ic">"Assuming ~500 req/s per server with modern hardware."</span> If the interviewer has a different number, they will tell you — and now you are negotiating with real data.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03F00000-0000-4000-8000-000000000410',
  '03F00000-0000-4000-8000-000000000310',
  1,
  'Scaling Strategies',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Scaling Strategies</title>
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
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #4c1d95; color: #ddd6fe; }
.dark .lesson-page .callout { background: #4c1d95; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c1d95; color: #ddd6fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Scaling Strategies</h1>
  <p>Scaling is how a system absorbs growing demand. Three moves dominate interviews: <strong>vertical scaling</strong>, <strong>replication</strong>, and <strong>horizontal scaling</strong>. Reach for them in that order, then leave the ladder behind.</p>
  <h2>The three moves</h2>
  <table>
    <tr><th>Move</th><th>What changes</th><th>Limit</th></tr>
    <tr><td>Vertical</td><td>Bigger single machine</td><td>Hardware ceiling + cost cliff</td></tr>
    <tr><td>Replication</td><td>Copies for reads and failover</td><td>Writes still hit one primary</td></tr>
    <tr><td>Horizontal</td><td>Many stateless servers</td><td>Needs statelessness + LB</td></tr>
  </table>
  <h2>When vertical is fine</h2>
  <p>For a small audience or an internal tool, <span class="ic">buy a bigger box and stop</span>. Interviewers accept this — they score decisiveness. But state the ceiling out loud: <span class="ic">"This works until the box tops out."</span></p>
  <h2>Replication next</h2>
  <p>When reads dominate (the usual case), add <strong>read replicas</strong> off a single primary:</p>
  <pre class="code-block">[app] --writes--&gt; [primary]
  |                |
  +----reads----&gt; [replica 1]
  +----reads----&gt; [replica 2]</pre>
  <p>Cost: replica lag. A user may see slightly stale reads. If the product demands read-your-writes, route a user's own writes to the primary.</p>
  <h2>Horizontal scaling: the interview favorite</h2>
  <p>Statelessness is the unlock. If the application keeps no state locally, any server can serve any request:</p>
  <ul>
    <li>Upload session state to <strong>Redis</strong> or the database.</li>
    <li>Store nothing on disk that must survive a restart.</li>
    <li>Put a load balancer in front and scale the fleet by adding instances.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Name the ordering</strong>
    <p>Interviewers like hearing the escalation: <em>"Vertical now, replicas when reads grow, horizontal when we need redundancy."</em> Show you chose, not that you know every option.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03F00000-0000-4000-8000-000000000411',
  '03F00000-0000-4000-8000-000000000311',
  1,
  'Load Balancing & Stateless Services',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Load Balancing & Stateless Services</title>
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
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #4c1d95; color: #ddd6fe; }
.dark .lesson-page .callout { background: #4c1d95; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c1d95; color: #ddd6fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Load Balancing &amp; Stateless Services</h1>
  <p>A load balancer sits in front of the fleet and answers one question per request: <em>which healthy server gets this?</em> Running it well is the backbone of horizontal scaling.</p>
  <h2>Layer 4 vs Layer 7</h2>
  <table>
    <tr><th>Layer</th><th>What it routes on</th><th>Use for</th></tr>
    <tr><td>L4 (transport)</td><td>IP + port</td><td>Ultra-fast TCP/UDP routing</td></tr>
    <tr><td>L7 (application)</td><td>URL, headers, cookies</td><td>Path routing, auth, rate limits</td></tr>
  </table>
  <p>In interviews, draw an <strong>L7 load balancer / API gateway</strong> in front of app servers — it is the honest default for most prompts.</p>
  <h2>Distribution strategies</h2>
  <ul>
    <li><span class="ic">Round robin</span> — even rotation, ignores actual load.</li>
    <li><span class="ic">Weighted</span> — send more to bigger boxes.</li>
    <li><span class="ic">Least connections</span> — send to the least busy server.</li>
    <li><span class="ic">IP hash</span> — same client to same server (niche; usually better solved by statelessness).</li>
  </ul>
  <h2>Health checks and failover</h2>
  <p>The LB only routes to healthy servers. Add a <span class="ic">/healthz</span> endpoint and a detection loop:</p>
  <pre class="code-block">every 5s: GET http://server:/healthz
  if 200  → server stays in rotation
  if fail → remove from rotation, then re-add after recovery
  (always stop sending connections to a dead node before restarting it)</pre>
  <h2>Statelessness makes the LB trivial</h2>
  <p>If a server remembers nothing, the balancer can route anywhere and any server can be replaced instantly:</p>
  <ul>
    <li>Session and cart state → Redis (shared, external).</li>
    <li>Uploaded files → object storage, never the local disk.</li>
    <li>Configuration → config service, not local config files.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Sticky sessions are a smell</strong>
    <p>Reach for sticky sessions only when a legacy constraint forces state on the box. Statelessness buys you the freedom to kill and replace nodes freely — that is the whole game.</p>
  </div>
  <div class="callout callout-info">
    <strong>Clarify LB == SPOF</strong>
    <p>Run the load balancer in pairs (active/passive) or it becomes your single point of failure. Say this unprompted — it shows senior-level instinct.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03F00000-0000-4000-8000-000000000413',
  '03F00000-0000-4000-8000-000000000313',
  1,
  'Caching Layers',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Caching Layers</title>
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
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #4c1d95; color: #ddd6fe; }
.dark .lesson-page .callout { background: #4c1d95; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c1d95; color: #ddd6fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Caching Layers</h1>
  <p>Caching stores <strong>a copy of expensive results</strong> closer to the consumer. The cheapest optimization in system design is always: read the hot 5% from memory instead of the database.</p>
  <h2>The cache ladder</h2>
  <table>
    <tr><th>Layer</th><th>Example</th><th>Hit latency</th></tr>
    <tr><td>Browser</td><td>Local HTTP cache</td><td>~0</td></tr>
    <tr><td>CDN</td><td>Edge nodes</td><td>tens of ms</td></tr>
    <tr><td>In-memory</td><td>Redis / Memcached</td><td>sub-ms</td></tr>
    <tr><td>DB query cache</td><td>Recent result sets</td><td>ms</td></tr>
  </table>
  <h2>What deserves caching</h2>
  <ul>
    <li><strong>Read-heavy</strong> and rarely changing: profiles, prices, configs.</li>
    <li><strong>Expensive to compute</strong>: feeds, rankings, aggregates.</li>
    <li><strong>Hot keys</strong>: a celebrity profile read 100k times a second.</li>
  </ul>
  <h2>Cache-aside (lazy loading)</h2>
  <p>The most common pattern — the application manages the cache:</p>
  <pre class="code-block">function getUser(id):
  user = cache.get("user:" + id)
  if user is null:
      user = db.findById(id)       # miss
      cache.set("user:" + id, user, ttl=300)
  return user</pre>
  <h2>Write-through vs write-back</h2>
  <table>
    <tr><th>Pattern</th><th>Write to</th><th>Risk</th></tr>
    <tr><td>Write-through</td><td>Cache then DB, both sync</td><td>Slower writes, low staleness</td></tr>
    <tr><td>Write-back</td><td>Cache first, flush later</td><td>Data loss window if cache dies</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Cache is not a database</strong>
    <p>Never treat the cache as the system of record. If the cache node dies, the database must still serve — so design miss handling as a first-class path, not an afterthought.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Direction of effect</strong>
    <p>A 95% cache hit ratio means the database sees 5% of reads. That one sentence — with your own numbers — is the strongest cache argument you can make in an interview.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03F00000-0000-4000-8000-000000000414',
  '03F00000-0000-4000-8000-000000000314',
  1,
  'Cache Strategies & Invalidation',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cache Strategies & Invalidation</title>
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
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #4c1d95; color: #ddd6fe; }
.dark .lesson-page .callout { background: #4c1d95; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c1d95; color: #ddd6fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Cache Strategies &amp; Invalidation</h1>
  <p>Caching is easy until data changes. <strong>Invalidation</strong> — deciding when a cached copy is wrong — is the part that separates real designs from toy diagrams.</p>
  <h2>Eviction policies (memory pressure)</h2>
  <p>When the cache fills up, something must leave. Know the two that matter:</p>
  <ul>
    <li><span class="ic">LRU</span> (Least Recently Used) — evicts the coldest entry; the interview default.</li>
    <li><span class="ic">LFU</span> (Least Frequently Used) — evicts by access count; better for stable hot keys, worse for spikes.</li>
    <li><span class="ic">TTL alone</span> — expiry, not eviction; they combine.</li>
  </ul>
  <h2>Invalidation triggers</h2>
  <p>Three signals that a cached value is stale:</p>
  <ol>
    <li><strong>Time</strong> — TTL expires the entry naturally (most common).</li>
    <li><strong>Write event</strong> — the app deletes or rewrites the key after a database update.</li>
    <li><strong>Version</strong> — key includes a version: <span class="ic">profile:v2:42</span>.</li>
  </ol>
  <pre class="code-block">// invalidate on write (cache-aside)
UPDATE users SET name = ? WHERE id = 42;
cache.del("user:42");   # drop the stale copy</pre>
  <h2>The cache stampede (thundering herd)</h2>
  <p>A hot key expires and 10,000 simultaneous requests all miss, then all hammer the database at once. Defenses:</p>
  <ul>
    <li><span class="ic">Single-flight</span> — one request loads, the rest wait on it.</li>
    <li><span class="ic">Early refresh</span> — refresh while still serving the old value.</li>
    <li><span class="ic">Jittered TTL</span> — randomize expiry around a base so keys do not expire in lockstep.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Default to TTL</strong>
    <p>Most interview answers are improved by simply saying: <em>"A TTL of a few seconds bounds staleness even if my invalidation misses."</em> It is honest, simple, and covers the failure modes.</p>
  </div>
  <div class="callout callout-info">
    <strong>Cache the negative too</strong>
    <p>Rate-limit or 404 responses that hammer a hot miss path should also be cached briefly — otherwise the miss path becomes your new bottleneck.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03F00000-0000-4000-8000-000000000416',
  '03F00000-0000-4000-8000-000000000316',
  1,
  'SQL Databases & Indexing',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SQL Databases & Indexing</title>
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
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #4c1d95; color: #ddd6fe; }
.dark .lesson-page .callout { background: #4c1d95; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c1d95; color: #ddd6fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>SQL Databases &amp; Indexing</h1>
  <p>Relational databases win when data is <strong>structured, related, and transactional</strong>. Most interview prompts start with one — and most unfortunate designs abandon it too early.</p>
  <h2>What SQL gives you</h2>
  <ul>
    <li><strong>ACID</strong> — atomic, consistent, isolated, durable transactions.</li>
    <li><strong>Joins</strong> — answer relational questions without copying data.</li>
    <li><strong>Ad-hoc queries</strong> — the ops team can SELECT whatever they need.</li>
    <li><strong>Mature tooling</strong> — backups, replication, and migrations are solved.</li>
  </ul>
  <h2>Indexes: the interview lever</h2>
  <p>Every schema you draw should show its hot query keys. An index turns a table scan into a small lookup:</p>
  <pre class="code-block">CREATE INDEX idx_posts_author_created
ON posts (author_id, created_at DESC);   -- feed by author+time

-- hot reads
SELECT * FROM posts
WHERE author_id = 42
ORDER BY created_at DESC
LIMIT 20;</pre>
  <p>Count the cost: every index slows <span class="ic">INSERT</span>/<span class="ic">UPDATE</span> and costs disk. Index the <em>query</em>, not every column.</p>
  <h2>Read replicas for reads</h2>
  <p>When reads dominate (they always do), scale reads horizontally off replicas:</p>
  <pre class="code-block">[primary]  -- all writes, strong views
   |
   +--[replica 1] -- reads
   +--[replica 2] -- reads, analytics</pre>
  <h2>When SQL struggles</h2>
  <p>Say the limits openly: a single primary write bottleneck, joins become expensive after sharding, and schema changes need migrations. That is when you justify the relational trade — or transition to NoSQL.</p>
  <div class="callout callout-tip">
    <strong>Start with SQL</strong>
    <p>Default to a relational database and add complexity only when the workload forces it. The default-then-defend stance is senior; jumping to Cassandra for a contact form is not.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03F00000-0000-4000-8000-000000000417',
  '03F00000-0000-4000-8000-000000000317',
  1,
  'NoSQL Databases & When to Use Them',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NoSQL Databases & When to Use Them</title>
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
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #4c1d95; color: #ddd6fe; }
.dark .lesson-page .callout { background: #4c1d95; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c1d95; color: #ddd6fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>NoSQL Databases &amp; When to Use Them</h1>
  <p>NoSQL trades away the relational model to win on <strong>scale, flexible shapes, or query patterns</strong> that SQL handles awkwardly. The right answer is usually "NoSQL for the hot path, SQL for the system of record."</p>
  <h2>Know your four families</h2>
  <table>
    <tr><th>Family</th><th>Example</th><th>Great for</th></tr>
    <tr><td>Key-value</td><td>Redis, DynamoDB</td><td>Cache, session, counters</td></tr>
    <tr><td>Document</td><td>MongoDB</td><td>Flexible schemas, JSON-ish objects</td></tr>
    <tr><td>Wide-column</td><td>Cassandra, Bigtable</td><td>Time series, huge write scale</td></tr>
    <tr><td>Graph</td><td>Neo4j</td><td>Deep relationships, friend graphs</td></tr>
  </table>
  <h2>When NoSQL wins</h2>
  <ul>
    <li><strong>Tremendous write scale</strong> that a single SQL primary cannot absorb.</li>
    <li><strong>Inflexible schema</strong> changing faster than migrations can keep up (documents).</li>
    <li><strong>Query = get by key</strong> — key-value stores nail exactly that.</li>
    <li><strong>Traversal-heavy relationships</strong> that would take ten SQL joins.</li>
  </ul>
  <h2>The trade you make</h2>
  <p>NoSQL typically costs you:</p>
  <ul>
    <li><strong>Transactions</strong> across many records — constrained or gone.</li>
    <li><strong>Joins</strong> — you denormalize and manage two copies of the truth.</li>
    <li><strong>Strong consistency</strong> — defaults drift toward eventual.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Polyglot persistence is the norm</strong>
    <p>Mature systems do not choose one database. They keep accounts in SQL, sessions in Redis, + hot feed writes in Cassandra. Saying "I would use SQL here for the source of truth and Redis for this hot read path" is a senior answer.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pattern-match, do not evangelize</strong>
    <p>State the pattern that matters: <em>"This is read-mostly by id → key-value becomes obvious."</em> When the interviewer changes one constraint, your pattern changes — and they see you adapt.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03F00000-0000-4000-8000-000000000419',
  '03F00000-0000-4000-8000-000000000319',
  1,
  'CDNs, Edge & Static Content',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CDNs, Edge & Static Content</title>
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
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #4c1d95; color: #ddd6fe; }
.dark .lesson-page .callout { background: #4c1d95; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c1d95; color: #ddd6fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>CDNs &amp; Edge Computing</h1>
  <p>A CDN is a <strong>geographically distributed cache</strong>. It pulls your static content to pop nodes near users, cutting latency dramatically and keeping the origin (your servers) from drowning in downloads.</p>
  <h2>Why the CDN wins</h2>
  <ul>
    <li>Users fetch from a nearby edge node, not a distant origin.</li>
    <li>The origin sees a fraction of the traffic — fewer requests, fewer egress bytes.</li>
    <li>Absorbs traffic spikes before they ever reach your app servers.</li>
  </ul>
  <h2>Pull vs push CDN</h2>
  <table>
    <tr><th>Mode</th><th>How content arrives</th><th>Use when</th></tr>
    <tr><td>Pull-through</td><td>Edge fetches on first miss</td><td>Static assets, images, JS bundles</td></tr>
    <tr><td>Push</td><td>Your app uploads to the CDN</td><td>Generated files, pre-warmed content</td></tr>
  </table>
  <h2>Controlling freshness with headers</h2>
  <pre class="code-block">Cache-Control: public, max-age=31536000, immutable  # versioned assets
Cache-Control: public, max-age=60                   # thumbnails, short-lived</pre>
  <p>Versioning is the key trick: put the hash in the URL (<span class="ic">app.8f2a.js</span>), keep long cache times, and bust caches by shipping a new URL.</p>
  <h2>What belongs in the CDN</h2>
  <ul>
    <li>JavaScript, CSS, images, fonts — forever.</li>
    <li>Public API responses with a compatible TTL (rarely; usually better done at the app cache).</li>
    <li>User-generated media, thumbnailed at the edge.</li>
  </ul>
  <h2>Edge compute</h2>
  <p>Modern CDNs run <strong>code at the edge</strong>: geolocation routing, A/B buckets, bot filtering, and auth checks without round-tripping to origin. Mentioning edge functions shows you know current infrastructure.</p>
  <div class="callout callout-info">
    <strong>CDNs only serve safe-to-stale data</strong>
    <p>An immutable asset may smear caches forever; a user profile may not. Match the TTL and the <span class="ic">Cache-Control</span> to how wrong the byte can afford to be.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Say the unit economics</strong>
    <p>One CDN line like <em>"60% of payload bytes are static → 60% fewer bytes hits origin"</em> beats a paragraph of theory. Numbers stick; adjectives do not.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03F00000-0000-4000-8000-000000000420',
  '03F00000-0000-4000-8000-000000000320',
  1,
  'Message Queues & Async Processing',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Message Queues & Async Processing</title>
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
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #4c1d95; color: #ddd6fe; }
.dark .lesson-page .callout { background: #4c1d95; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c1d95; color: #ddd6fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Message Queues &amp; Async Processing</h1>
  <p>A message queue sits between a <strong>producer</strong> and a <strong>consumer</strong> so neither has to wait for the other. It converts fast-but-fragile synchronous chains into slow-but-bulletproof background work.</p>
  <h2>The decoupling that queues buy</h2>
  <pre class="code-block">[producer] --enqueue--&gt; [queue] --&gt; [consumer xN]
   e.g. "user signed up"          send email, build profile, seed feed
   (returns instantly, 200 OK)</pre>
  <p>Every rule of thumb for queues starts from that picture: <em>publish the event, return, and let workers finish the slow parts.</em></p>
  <h2>Where queues appear in interviews</h2>
  <ul>
    <li>Feeds — a post fans out to many follower boxes asynchronously.</li>
    <li>Media — thumbnails, transcoding, and moderation after upload.</li>
    <li>Notifications — email/SMS/push without blocking the API.</li>
    <li>Analytics — batching writes so the hot path stays fast.</li>
  </ul>
  <h2>Delivery guarantees</h2>
  <table>
    <tr><th>Guarantee</th><th>Meaning</th><th>Requires</th></tr>
    <tr><td>At-most-once</td><td>Could be dropped</td><td>Tolerable loss (logs)</td></tr>
    <tr><td>At-least-once</td><td>Never lost, maybe duped</td><td>Idempotent consumers</td></tr>
    <tr><td>Exactly-once</td><td>Best effort end-to-end</td><td>Handlers + stores with dedupe</td></tr>
  </table>
  <p>In interviews say: <span class="ic">"I will design consumer handlers to be idempotent so at-least-once delivery is safe."</span> That sentence covers the hardest queue question in one breath.</p>
  <h2>Failure hygiene</h2>
  <ul>
    <li><strong>Dead-letter queue</strong> — poison messages park here for later inspection instead of blocking the stream.</li>
    <li><strong>Retry with backoff</strong> — retry transient failures, but not endlessly.</li>
    <li><strong>Ordering</strong> — single-partition keys (per user) preserve per-key order.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>When to add the queue</strong>
    <p>Add a queue the moment a synchronous request touches a slow side-effect more than once per request. If your read path cannot tolerate extra latency, the queue is the answer — not a cache-only fix.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03F00000-0000-4000-8000-000000000422',
  '03F00000-0000-4000-8000-000000000322',
  1,
  'Sharding & Partitioning',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sharding & Partitioning</title>
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
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #4c1d95; color: #ddd6fe; }
.dark .lesson-page .callout { background: #4c1d95; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c1d95; color: #ddd6fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Sharding &amp; Partitioning</h1>
  <p>When one database can no longer absorb writes or storage, split the data horizontally across <strong>shards</strong>. Each shard holds a slice of the rows, and together they hold the whole dataset.</p>
  <h2>The two big sharding strategies</h2>
  <table>
    <tr><th>Strategy</th><th>How rows land</th><th>Strengths</th><th>Risks</th></tr>
    <tr><td>Range</td><td>by key range (A-D, E-H…)</td><td>range scans, hot locality</td><td>skewed ranges = hot shard</td></tr>
    <tr><td>Hash</td><td>hash(key) mod N</td><td>even distribution</td><td>range queries cross shards</td></tr>
  </table>
  <pre class="code-block">shard_id = hash(user_id) % 16      # 16 fixed shards
route:   shard(user_id) -> shard-07
resize:  add shards → rehash (use consistent hashing to move little data)</pre>
  <h2>Choosing the shard key</h2>
  <p>The shard key is the <strong>single most consequential decision</strong> in a sharded design:</p>
  <ul>
    <li>It must match your dominant query: <span class="ic">"Every query looks up by user_id."</span></li>
    <li>It must spread evenly — <span class="ic">user_id</span> spreads; <span class="ic">country</span> may not.</li>
    <li>Once chosen, changing it is a multi-month migration — choose like a production decision.</li>
  </ul>
  <h2>What sharding costs you</h2>
  <ul>
    <li><strong>Cross-shard queries</strong> — a JOIN across 16 shards is a query across 16 databases; denormalize to avoid it.</li>
    <li><strong>Secondary indexes</strong> — secondary lookups become fan-out queries unless you shard by the same key.</li>
    <li><strong>Transactions</strong> — a transaction spanning shards needs a distributed protocol (2PC, saga, or a shard-local design).</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Design to defer sharding</strong>
    <p>A good answer says: <em>"I will design my data access around a natural shard key (user_id or post_id) now, so sharding later is a re-deploy, not a rewrite."</em> Deferred sharding is cheaper than sharding too early.</p>
  </div>
  <div class="callout callout-info">
    <strong>Watch the hot shard</strong>
    <p>Hash sharding spreads evenly, but one celebrity (hot user or hot post) overloading one shard is still possible — name the mitigation: replicate the hot key or add a cache above it.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03F00000-0000-4000-8000-000000000423',
  '03F00000-0000-4000-8000-000000000323',
  1,
  'Consistency Models & the CAP Theorem',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Consistency Models & the CAP Theorem</title>
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
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #4c1d95; color: #ddd6fe; }
.dark .lesson-page .callout { background: #4c1d95; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c1d95; color: #ddd6fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Consistency Models &amp; the CAP Theorem</h1>
  <p>Consistency is what "correct" means when data lives in many places. Every replicated system chooses a point between <strong>always right</strong> and <strong>always available</strong> — and your interviewer wants to hear you choose deliberately.</p>
  <h2>The three models you need</h2>
  <table>
    <tr><th>Model</th><th>Promise</th><th>Price</th></tr>
    <tr><td>Strong</td><td>Any read sees the latest write</td><td>Higher latency, no availability during partition</td></tr>
    <tr><td>Eventual</td><td>Replicas converge over time</td><td>Reads may be stale briefly</td></tr>
    <tr><td>Read-your-writes</td><td>You always see your own writes</td><td>Slightly more routing care</td></tr>
  </table>
  <h2>What CAP actually claims</h2>
  <p>During a <strong>partition</strong> (nodes cannot talk), you cannot have both <span class="ic">C</span>onsistency and <span class="ic">A</span>vailability. You choose:</p>
  <ul>
    <li><span class="ic">CP</span> — refuse to serve stale data until the partition heals (bank balances, inventory).</li>
    <li><span class="ic">AP</span> — serve possibly-stale data from either side (feeds, chat history, likes).</li>
  </ul>
  <p>The classic CS-elucidated version: <strong>during a partition</strong>, pick C or A. When there is <em>no</em> partition, you can have both — so do not say "CAP says pick two, always."</p>
  <h2>PACELC (the sharper lens)</h2>
  <p>Extend CAP to normal operation:</p>
  <pre class="code-block">If Partition → choose A or C
Else         → choose Latency or Consistency
   e.g. a news feed: AP + latency-first
   e.g. a ledger:    CP + consistency-first</pre>
  <h2>Stating your choice in an interview</h2>
  <pre class="code-block">"This feed tolerates eventual consistency — likes and posts may lag a
moment — so I pick AP, and in steady state I trade a little consistency
for latency. The comment count is derived, not a source of truth."

"Account balances are CP: I will fail the read rather than serve a
balance a user can act on twice."</pre>
  <div class="callout callout-tip">
    <strong>Match the model to the feature</strong>
    <p>Rarely is the answer one model for the whole system. Balances strong, sessions eventual, your own posts read-your-writes. Mixing deliberately is the senior signal.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03F00000-0000-4000-8000-000000000425',
  '03F00000-0000-4000-8000-000000000325',
  1,
  'Design a News Feed',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Design a News Feed</title>
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
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #4c1d95; color: #ddd6fe; }
.dark .lesson-page .callout { background: #4c1d95; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c1d95; color: #ddd6fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Design a News Feed</h1>
  <p>The news feed is the classic social-engineering interview. It combines a social graph, a hot write/read split, and a deep dive every interviewer loves: <strong>how do posts reach everyone who should see them?</strong></p>
  <h2>1. Requirements (keep it tight)</h2>
  <ul>
    <li>Post text, follow users, read a personalized timeline — that is the MVP.</li>
    <li>Out of scope: photos, search, ads, moderation, retweets.</li>
    <li>Non-functional: P95 read &lt; 300ms, newsfeed latency &lt; 5s for your own post to appear.</li>
  </ul>
  <h2>2. Scale</h2>
  <pre class="code-block">100M users · 25M DAU · each reads feed ~10x/day
  reads  = 250M/day ≈ 2,500 QPS peak
  posts  = 1M/day, avg 100 followers → 1M x 100 = 100M feed-box writes/day
  → read path is hot and read-heavy; writes are small but fan out wide</pre>
  <h2>3. The fan-out decision (the deep dive)</h2>
  <table>
    <tr><th>Model</th><th>Write cost</th><th>Read cost</th><th>Reality</th></tr>
    <tr><td>Fan-out on write (push)</td><td>expensive, N followers</td><td>cheap (read one box)</td><td>posters with 1M+ followers stall</td></tr>
    <tr><td>Fan-out on read (pull)</td><td>cheap (store once)</td><td>merge N followee lists</td><td>heavy reads for power consumers</td></tr>
    <tr><td>Hybrid</td><td>push normal users</td><td>pull for celebrities</td><td>the industry answer</td></tr>
  </table>
  <p>State it as: <span class="ic">"Push to normal followers, pull for celebrities above a threshold, cache the merged result per user."</span></p>
  <h2>4. Components</h2>
  <pre class="code-block">[client]
  [API] → [FeedService] → (cache: Redis per-user feed)
           [PostService] → [DB posts] → [queue]
                                    → [FanoutWorker] → [feed boxes]
           [SocialGraphService] → [graph store]</pre>
  <h2>5. Zoom out</h2>
  <p>Wrap up: feed is read-your-writes for your own posts, eventual for others', hot users pull instead of push, and the per-user box is LRU-cached and paginated by a cursor.</p>
  <div class="callout callout-tip">
    <strong>The killer line</strong>
    <p>Say early: <em>"The bottleneck is that a single post fans out to every follower — so I must separate celebrity posting from normal posting."</em> It reveals scale instinct in one sentence.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03F00000-0000-4000-8000-000000000426',
  '03F00000-0000-4000-8000-000000000326',
  1,
  'Design a URL Shortener',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Design a URL Shortener</title>
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
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #4c1d95; color: #ddd6fe; }
.dark .lesson-page .callout { background: #4c1d95; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c1d95; color: #ddd6fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Design a URL Shortener</h1>
  <p>A URL shortener is the ideal "warm-up" interview problem: a small read-heavy system with a satisfying deep dive around <strong>the ID and the redirect</strong>.</p>
  <h2>1. Requirements</h2>
  <ul>
    <li>Input a long URL → output a short code; follow the short code → redirect to the long URL.</li>
    <li>Out of scope: accounts, custom slugs, analytics (mention them as optional).</li>
    <li>Non-functional: redirect &lt; 100ms, no collision, works forever-ish (long TTL).</li>
  </ul>
  <h2>2. Scale</h2>
  <pre class="code-block">10M new URLs/day ≈ 100/s writes
redirects ~10:1 → 1,000/s reads → ~3000 QPS peak reads
90-day expiry for warm data; analytics separate</pre>
  <h2>3. The code: Base62</h2>
  <p>Generate a numeric ID, then encode it in <span class="ic">Base62</span> (a-z, A-Z, 0-9) for short, URL-safe codes:</p>
  <pre class="code-block">id 1234567890 → base62 code ("1Z9Mx" style)
62^6 ≈ 56.8B short codes — plenty of runway from a tiny key size</pre>
  <h2>4. Write path</h2>
  <ol>
    <li>POST /links {url} arrives at the API.</li>
    <li>Generate a globally unique ID (snowflake or a dedicated ID server / range allocator).</li>
    <li>Insert <span class="ic">(id, code, url)</span> — the code is <em>derived</em> from the ID, so no collision probe is needed.</li>
    <li>Return <span class="ic">https://s.co/1Z9Mx</span>.</li>
  </ol>
  <h2>5. Read path</h2>
  <pre class="code-block">GET /1Z9Mx
  1. check Redis cache by code       # hot links
  2. miss → SELECT url FROM links WHERE code = ?  # indexed
  3. return 301/302 redirect, backfill cache with TTL
(2 percent of code become 95 percent of redirects → cache them first)</pre>
  <h2>6. Tradeoffs to name</h2>
  <ul>
    <li><span class="ic">301 vs 302</span> — 301 caches forever by browsers; 302 allows click analytics on every hit.</li>
    <li>Hash-of-URL (<span class="ic">MD5(url)[0:6]</span>) risks collisions and makes codes dependent on input; a sequential ID + encode is cleaner.</li>
    <li>ID generation — a global auto-increment is a write bottleneck; snowflake/range allocators scale.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Do not hash the URL</strong>
    <p>When interviewers see you derive the short code from the <em>ID</em>, not the URL, they relax: your system has no collision handling, no re-insert, and a clean monotonically growing key space.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03F00000-0000-4000-8000-000000000427',
  '03F00000-0000-4000-8000-000000000327',
  1,
  'Capstone: End-to-End Walkthrough',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: End-to-End Walkthrough</title>
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
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #4c1d95; color: #ddd6fe; }
.dark .lesson-page .callout { background: #4c1d95; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c1d95; color: #ddd6fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: End-to-End Walkthrough</h1>
  <p>Let us run one complete prompt through all four phases, showing the <em>thinking</em> you should voice aloud. Prompt: <span class="ic">"Design a ride-hailing service."</span></p>
  <h2>Phase 1 — Requirements (2 min)</h2>
  <pre class="code-block">"I will scope this to the core loop: user requests a ride, driver accepts,
both see live ETA. I will treat payments, surge pricing, and dispute
handling as out of scope. Non-functional: P95 request/driver-match
reporting &lt; 2s, matches must be unique (no double-accept)."</pre>
  <h2>Phase 2 — Scale (2 min)</h2>
  <pre class="code-block">10M users · 1M rides/day · ride requests ~500 QPS peak
50k concurrent drivers, location updates ~1/s each = 50k writes/s
→ the write stream is huge; this is a write-heavy system, unlike a feed</pre>
  <p>Note the pivot — ride-hailing has matched daily rides far larger than the write stream of most products. Say exactly that.</p>
  <h2>Phase 3 — High level (15 min)</h2>
  <pre class="code-block">[rider app]──[LB]──[RequestService]──[DispatchService]──[queue]──[driver app]
                    │                        │
                  [geo index]           [DB rides]  [cache drivers]
geo index: sliding spatial grid / geo-hash for "drivers near point X"</pre>
  <h2>Phase 4 — Deep dive (10 min)</h2>
  <p>Pick the <strong>match durability</strong> path:</p>
  <ol>
    <li>Rider request is a row in <span class="ic">ride_requests</span> (persisted before dispatch).</li>
    <li>Dispatch writes a <strong>pending match</strong> then sends offers through a queue.</li>
    <li>Acceptance writes to the ride row with a unique constraint (one match per ride).</li>
    <li>Lost offer duplicates are healed by a timeout + rescan — the queue is at-least-once, and the DB constraint enforces exactly-once acceptance.</li>
  </ol>
  <div class="callout callout-info">
    <strong>Name the consistency</strong>
    <p>Ride acceptance is CP (one match only); the map around you is AP/eventual. Mixed consistency in one system is normal — say it explicitly.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Your practice loop</strong>
    <p>Pick any prompt (chat, video, e-commerce, search). Run the four phases aloud in 45 minutes. Record yourself; notice where you spend 15 minutes on the wrong deep dive — that is tomorrow's practice target.</p>
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
  ('03F00000-0000-4000-8000-000000000501', '03F00000-0000-4000-8000-000000000303',
   'Which phase comes first in the four-phase system design framework?',
   'Requirements come first: you must scope what the system does before drawing components.', 1),
  ('03F00000-0000-4000-8000-000000000502', '03F00000-0000-4000-8000-000000000303',
   'Which item below is a NON-functional requirement?',
   'Latency differs from a feature — it constrains the design rather than describing an action.', 2),
  ('03F00000-0000-4000-8000-000000000503', '03F00000-0000-4000-8000-000000000303',
   'Why restate the scoped requirements to the interviewer?',
   'A two-sentence restatement confirms alignment and prevents a ten-minute detour.', 3),
  ('03F00000-0000-4000-8000-000000000504', '03F00000-0000-4000-8000-000000000306',
   'What is the goal of the high-level design phase?',
   'Name the components and their arrows; the diagram is course-grained on purpose.', 1),
  ('03F00000-0000-4000-8000-000000000505', '03F00000-0000-4000-8000-000000000306',
   'Which component is the most likely deep-dive candidate?',
   'The component that breaks first under scale is where you zoom in and prove the design.', 2),
  ('03F00000-0000-4000-8000-000000000506', '03F00000-0000-4000-8000-000000000306',
   'What should you always state when making an architectural choice?',
   'Naming the gain and the cost of a tradeoff is what interviewers grade most.', 3),
  ('03F00000-0000-4000-8000-000000000507', '03F00000-0000-4000-8000-000000000309',
   'Roughly how many seconds are in a day?',
   '86,400 seconds — round to 100k for back-of-envelope math.', 1),
  ('03F00000-0000-4000-8000-000000000508', '03F00000-0000-4000-8000-000000000309',
   '10 million requests per day is closest to how many QPS?',
   '10,000,000 / 100,000 ≈ 100 QPS average, with peaks higher.', 2),
  ('03F00000-0000-4000-8000-000000000509', '03F00000-0000-4000-8000-000000000309',
   'What is the value of a back-of-envelope estimate in a design interview?',
   'Keep numbers working in one or two digits — the interview is about magnitude, not exact forecasts.', 3),
  ('03F00000-0000-4000-8000-000000000510', '03F00000-0000-4000-8000-000000000312',
   'Which scaling move comes first for most read-heavy systems?',
   'Replication adds read replicas cheaply; horizontal scaling comes after statelessness.', 1),
  ('03F00000-0000-4000-8000-000000000511', '03F00000-0000-4000-8000-000000000312',
   'At which layer does an API gateway route on URL paths and headers?',
   'Layer 7 (application) routes on URLs, headers, and cookies; layer 4 only sees IP and port.', 2),
  ('03F00000-0000-4000-8000-000000000512', '03F00000-0000-4000-8000-000000000312',
   'What does making application servers stateless unlock?',
   'Any server can serve any request, so instance churn is safe and scaling is trivial.', 3),
  ('03F00000-0000-4000-8000-000000000513', '03F00000-0000-4000-8000-000000000315',
   'Which pattern describes cache-aside (lazy loading)?',
   'Read checks the cache first and falls back to the database on a miss, then backfills the cache.', 1),
  ('03F00000-0000-4000-8000-000000000514', '03F00000-0000-4000-8000-000000000315',
   'What is the simplest staleness guard for any cached value?',
   'A TTL actively bounds how stale a cached copy can grow.', 2),
  ('03F00000-0000-4000-8000-000000000515', '03F00000-0000-4000-8000-000000000315',
   'How do you prevent a cache stampede on a hot key?',
   'Single-flight loading, early refresh, or jittered TTL keeps one caller from reloading for everyone.', 3),
  ('03F00000-0000-4000-8000-000000000516', '03F00000-0000-4000-8000-000000000318',
   'When is a SQL database the right default?',
   'Structured, relational, transactional data is what ACID and joins are built for.', 1),
  ('03F00000-0000-4000-8000-000000000517', '03F00000-0000-4000-8000-000000000318',
   'Which NoSQL family fits read-mostly data accessed by single key?',
   'Key-value stores (Redis, DynamoDB) are built for get-by-key hot reads.', 2),
  ('03F00000-0000-4000-8000-000000000518', '03F00000-0000-4000-8000-000000000318',
   'What does an index on a SQL table mainly buy you?',
   'It makes point lookups and common filters fast instead of scanning the whole table.', 3),
  ('03F00000-0000-4000-8000-000000000519', '03F00000-0000-4000-8000-000000000321',
   'Why does a CDN reduce latency for static assets?',
   'Files are fetched from a nearby edge node instead of a distant origin server.', 1),
  ('03F00000-0000-4000-8000-000000000520', '03F00000-0000-4000-8000-000000000321',
   'What is the main benefit of pushing work onto a queue?',
   'The producer returns immediately and consumers absorb the workload asynchronously.', 2),
  ('03F00000-0000-4000-8000-000000000521', '03F00000-0000-4000-8000-000000000321',
   'For at-least-once delivery, handlers must be what?',
   'Idempotent — safe to run more than once because duplicates can arrive.', 3),
  ('03F00000-0000-4000-8000-000000000522', '03F00000-0000-4000-8000-000000000324',
   'Which sharding strategy spreads rows evenly across shards?',
   'Hashing the shard key distributes rows evenly, at the cost of range queries.', 1),
  ('03F00000-0000-4000-8000-000000000523', '03F00000-0000-4000-8000-000000000324',
   'What is the biggest risk of range-based sharding?',
   'Skewed ranges can concentrate traffic on a single hot shard.', 2),
  ('03F00000-0000-4000-8000-000000000524', '03F00000-0000-4000-8000-000000000324',
   'During a network partition, which two properties can you NOT have at once?',
   'CAP says during a partition you choose between consistency and availability.', 3),
  ('03F00000-0000-4000-8000-000000000525', '03F00000-0000-4000-8000-000000000328',
   'Which phase of the framework converts a vague prompt into a scoped feature list?',
   'Requirements: functional actions are listed and out-of-scope items are cut early.', 1),
  ('03F00000-0000-4000-8000-000000000526', '03F00000-0000-4000-8000-000000000328',
   'For a news feed, which deep-dive choice handles a poster with millions of followers?',
   'A hybrid fans out normally but pulls on read for celebrity posters so writes do not stall.', 2),
  ('03F00000-0000-4000-8000-000000000527', '03F00000-0000-4000-8000-000000000328',
   'A URL shortener should derive its short code from what?',
   'A sequential ID encoded in Base62 — no hash collisions and no URL-dependent codes.', 3),
  ('03F00000-0000-4000-8000-000000000528', '03F00000-0000-4000-8000-000000000328',
   'Which property must a correctly-built queue consumer have?',
   'Idempotency so retries and duplicate deliveries are harmless.', 4),
  ('03F00000-0000-4000-8000-000000000529', '03F00000-0000-4000-8000-000000000328',
   'What is the best way to close a design interview answer?',
   'Zoom back out: what the deep dive proved, what it did not, and what you would validate.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): framework phase
  ('03F00000-0000-4000-8000-000000001001', '03F00000-0000-4000-8000-000000000501', 'Requirements', TRUE,  1),
  ('03F00000-0000-4000-8000-000000001002', '03F00000-0000-4000-8000-000000000501', 'High-level design', FALSE, 2),
  ('03F00000-0000-4000-8000-000000001003', '03F00000-0000-4000-8000-000000000501', 'Deep dive', FALSE, 3),
  ('03F00000-0000-4000-8000-000000001004', '03F00000-0000-4000-8000-000000000501', 'Capacity planning', FALSE, 4),
  -- Q1 (501)q2: non-functional
  ('03F00000-0000-4000-8000-000000001005', '03F00000-0000-4000-8000-000000000502', 'Users can post text updates', FALSE, 1),
  ('03F00000-0000-4000-8000-000000001006', '03F00000-0000-4000-8000-000000000502', 'P95 read latency under 200ms', TRUE,  2),
  ('03F00000-0000-4000-8000-000000001007', '03F00000-0000-4000-8000-000000000502', 'Users can follow other users', FALSE, 3),
  ('03F00000-0000-4000-8000-000000001008', '03F00000-0000-4000-8000-000000000502', 'The app shows a login screen', FALSE, 4),
  -- Q1 (501)q3: restate scope
  ('03F00000-0000-4000-8000-000000001009', '03F00000-0000-4000-8000-000000000503', 'It wastes valuable interview time', FALSE, 1),
  ('03F00000-0000-4000-8000-000000001010', '03F00000-0000-4000-8000-000000000503', 'It confirms alignment before design starts', TRUE,  2),
  ('03F00000-0000-4000-8000-000000001011', '03F00000-0000-4000-8000-000000000503', 'It hides that you do not know the answer', FALSE, 3),
  ('03F00000-0000-4000-8000-000000001012', '03F00000-0000-4000-8000-000000000503', 'It is only required for mobile apps', FALSE, 4),
  -- Q2 (504): high-level goal
  ('03F00000-0000-4000-8000-000000001013', '03F00000-0000-4000-8000-000000000504', 'To write production database migrations', FALSE, 1),
  ('03F00000-0000-4000-8000-000000001014', '03F00000-0000-4000-8000-000000000504', 'To name components and how data flows between them', TRUE,  2),
  ('03F00000-0000-4000-8000-000000001015', '03F00000-0000-4000-8000-000000000504', 'To estimate exact infrastructure costs', FALSE, 3),
  ('03F00000-0000-4000-8000-000000001016', '03F00000-0000-4000-8000-000000000504', 'To finalize the REST API contract', FALSE, 4),
  -- Q2 (504)q2: deep dive candidate
  ('03F00000-0000-4000-8000-000000001017', '03F00000-0000-4000-8000-000000000505', 'The component that breaks first under scale', TRUE,  1),
  ('03F00000-0000-4000-8000-000000001018', '03F00000-0000-4000-8000-000000000505', 'The cheapest component you can name', FALSE, 2),
  ('03F00000-0000-4000-8000-000000001019', '03F00000-0000-4000-8000-000000000505', 'The one with the fewest tradeoffs', FALSE, 3),
  ('03F00000-0000-4000-8000-000000001020', '03F00000-0000-4000-8000-000000000505', 'The load balancer at the edge', FALSE, 4),
  -- Q2 (504)q3: state tradeoffs
  ('03F00000-0000-4000-8000-000000001021', '03F00000-0000-4000-8000-000000000506', 'The gain and the cost of the chosen option', TRUE,  1),
  ('03F00000-0000-4000-8000-000000001022', '03F00000-0000-4000-8000-000000000506', 'Only the benefits of the chosen option', FALSE, 2),
  ('03F00000-0000-4000-8000-000000001023', '03F00000-0000-4000-8000-000000000506', 'The name of the vendor you would use', FALSE, 3),
  ('03F00000-0000-4000-8000-000000001024', '03F00000-0000-4000-8000-000000000506', 'How fast you can draw the diagram', FALSE, 4),
  -- Q3 (507): seconds in a day
  ('03F00000-0000-4000-8000-000000001025', '03F00000-0000-4000-8000-000000000507', '86,400 seconds (round to 100k)', TRUE,  1),
  ('03F00000-0000-4000-8000-000000001026', '03F00000-0000-4000-8000-000000000507', '864,000 seconds', FALSE, 2),
  ('03F00000-0000-4000-8000-000000001027', '03F00000-0000-4000-8000-000000000507', '8,640 seconds', FALSE, 3),
  ('03F00000-0000-4000-8000-000000001028', '03F00000-0000-4000-8000-000000000507', '86.4 seconds', FALSE, 4),
  -- Q3 (507)q2: QPS math
  ('03F00000-0000-4000-8000-000000001029', '03F00000-0000-4000-8000-000000000508', 'About 100 QPS', TRUE,  1),
  ('03F00000-0000-4000-8000-000000001030', '03F00000-0000-4000-8000-000000000508', 'About 10 QPS', FALSE, 2),
  ('03F00000-0000-4000-8000-000000001031', '03F00000-0000-4000-8000-000000000508', 'About 1,000 QPS', FALSE, 3),
  ('03F00000-0000-4000-8000-000000001032', '03F00000-0000-4000-8000-000000000508', 'About 10,000 QPS', FALSE, 4),
  -- Q3 (507)q3: estimate value
  ('03F00000-0000-4000-8000-000000001033', '03F00000-0000-4000-8000-000000000509', 'Order-of-magnitude reasoning to drive design decisions', TRUE,  1),
  ('03F00000-0000-4000-8000-000000001034', '03F00000-0000-4000-8000-000000000509', 'Exact capacity forecasts equal to real traffic', FALSE, 2),
  ('03F00000-0000-4000-8000-000000001035', '03F00000-0000-4000-8000-000000000509', 'Proof that no failure is possible', FALSE, 3),
  ('03F00000-0000-4000-8000-000000001036', '03F00000-0000-4000-8000-000000000509', 'A guarantee of zero latency', FALSE, 4),
  -- Q4 (510): replicas first
  ('03F00000-0000-4000-8000-000000001037', '03F00000-0000-4000-8000-000000000510', 'Replication for read-heavy demand', TRUE,  1),
  ('03F00000-0000-4000-8000-000000001038', '03F00000-0000-4000-8000-000000000510', 'Sharding across 200 clusters', FALSE, 2),
  ('03F00000-0000-4000-8000-000000001039', '03F00000-0000-4000-8000-000000000510', 'Moving to a serverless platform', FALSE, 3),
  ('03F00000-0000-4000-8000-000000001040', '03F00000-0000-4000-8000-000000000510', 'Taking the whole site offline at night', FALSE, 4),
  -- Q4 (510)q2: gateway layer
  ('03F00000-0000-4000-8000-000000001041', '03F00000-0000-4000-8000-000000000511', 'Layer 7 (application)', TRUE,  1),
  ('03F00000-0000-4000-8000-000000001042', '03F00000-0000-4000-8000-000000000511', 'Layer 4 (transport)', FALSE, 2),
  ('03F00000-0000-4000-8000-000000001043', '03F00000-0000-4000-8000-000000000511', 'Layer 2 (data link)', FALSE, 3),
  ('03F00000-0000-4000-8000-000000001044', '03F00000-0000-4000-8000-000000000511', 'Layer 1 (physical)', FALSE, 4),
  -- Q4 (510)q3: stateless result
  ('03F00000-0000-4000-8000-000000001045', '03F00000-0000-4000-8000-000000000512', 'Any server can serve any request at any time', TRUE,  1),
  ('03F00000-0000-4000-8000-000000001046', '03F00000-0000-4000-8000-000000000512', 'Only one server can handle writes', FALSE, 2),
  ('03F00000-0000-4000-8000-000000001047', '03F00000-0000-4000-8000-000000000512', 'Sticky sessions are mandatory', FALSE, 3),
  ('03F00000-0000-4000-8000-000000001048', '03F00000-0000-4000-8000-000000000512', 'The database cannot be shared', FALSE, 4),
  -- Q5 (513): cache-aside
  ('03F00000-0000-4000-8000-000000001049', '03F00000-0000-4000-8000-000000000513', 'Cache first, fall back to DB on miss and backfill', TRUE,  1),
  ('03F00000-0000-4000-8000-000000001050', '03F00000-0000-4000-8000-000000000513', 'Write everything to cache only, never the DB', FALSE, 2),
  ('03F00000-0000-4000-8000-000000001051', '03F00000-0000-4000-8000-000000000513', 'Always read from the database first', FALSE, 3),
  ('03F00000-0000-4000-8000-000000001052', '03F00000-0000-4000-8000-000000000513', 'Cache every column of every table', FALSE, 4),
  -- Q5 (513)q2: staleness guard
  ('03F00000-0000-4000-8000-000000001053', '03F00000-0000-4000-8000-000000000514', 'A TTL that bounds staleness', TRUE,  1),
  ('03F00000-0000-4000-8000-000000001054', '03F00000-0000-4000-8000-000000000514', 'Disabling all reads', FALSE, 2),
  ('03F00000-0000-4000-8000-000000001055', '03F00000-0000-4000-8000-000000000514', 'Restarting the cache hourly', FALSE, 3),
  ('03F00000-0000-4000-8000-000000001056', '03F00000-0000-4000-8000-000000000514', 'Removing the cache entirely', FALSE, 4),
  -- Q5 (513)q3: stampede fix
  ('03F00000-0000-4000-8000-000000001057', '03F00000-0000-4000-8000-000000000515', 'Single-flight, early refresh, or jittered TTL', TRUE,  1),
  ('03F00000-0000-4000-8000-000000001058', '03F00000-0000-4000-8000-000000000515', 'Adding more read replicas below the cache', FALSE, 2),
  ('03F00000-0000-4000-8000-000000001059', '03F00000-0000-4000-8000-000000000515', 'Making the TTL twice as long', FALSE, 3),
  ('03F00000-0000-4000-8000-000000001060', '03F00000-0000-4000-8000-000000000515', 'Setting the cache to never expire', FALSE, 4),
  -- Q6 (516): SQL default
  ('03F00000-0000-4000-8000-000000001061', '03F00000-0000-4000-8000-000000000516', 'Relational, transactional data needing ACID and joins', TRUE,  1),
  ('03F00000-0000-4000-8000-000000001062', '03F00000-0000-4000-8000-000000000516', 'Massive append-only logs at huge write scale', FALSE, 2),
  ('03F00000-0000-4000-8000-000000001063', '03F00000-0000-4000-8000-000000000516', 'Deep graph traversal over friend connections', FALSE, 3),
  ('03F00000-0000-4000-8000-000000001064', '03F00000-0000-4000-8000-000000000516', 'Ephemeral session tokens with fast reads', FALSE, 4),
  -- Q6 (516)q2: key-value fit
  ('03F00000-0000-4000-8000-000000001065', '03F00000-0000-4000-8000-000000000517', 'Key-value stores like Redis or DynamoDB', TRUE,  1),
  ('03F00000-0000-4000-8000-000000001066', '03F00000-0000-4000-8000-000000000517', 'Graph databases like Neo4j', FALSE, 2),
  ('03F00000-0000-4000-8000-000000001067', '03F00000-0000-4000-8000-000000000517', 'Wide-column stores like Cassandra', FALSE, 3),
  ('03F00000-0000-4000-8000-000000001068', '03F00000-0000-4000-8000-000000000517', 'Columnar analytics warehouses', FALSE, 4),
  -- Q6 (516)q3: index
  ('03F00000-0000-4000-8000-000000001069', '03F00000-0000-4000-8000-000000000518', 'Fast point lookups and common filter queries', TRUE,  1),
  ('03F00000-0000-4000-8000-000000001070', '03F00000-0000-4000-8000-000000000518', 'Cheaper disk storage for old rows', FALSE, 2),
  ('03F00000-0000-4000-8000-000000001071', '03F00000-0000-4000-8000-000000000518', 'Faster INSERTs on every table', FALSE, 3),
  ('03F00000-0000-4000-8000-000000001072', '03F00000-0000-4000-8000-000000000518', 'Stronger encryption of the data', FALSE, 4),
  -- Q7 (519): CDN latency
  ('03F00000-0000-4000-8000-000000001073', '03F00000-0000-4000-8000-000000000519', 'Assets are served from a nearby edge node', TRUE,  1),
  ('03F00000-0000-4000-8000-000000001074', '03F00000-0000-4000-8000-000000000519', 'Assets are compressed to one byte', FALSE, 2),
  ('03F00000-0000-4000-8000-000000001075', '03F00000-0000-4000-8000-000000000519', 'DNS resolution is skipped entirely', FALSE, 3),
  ('03F00000-0000-4000-8000-000000001076', '03F00000-0000-4000-8000-000000000519', 'The origin server stops working', FALSE, 4),
  -- Q7 (519)q2: queue benefit
  ('03F00000-0000-4000-8000-000000001077', '03F00000-0000-4000-8000-000000000520', 'Producer returns fast and consumers process async', TRUE,  1),
  ('03F00000-0000-4000-8000-000000001078', '03F00000-0000-4000-8000-000000000520', 'Consumers block until a batch of 100k arrives', FALSE, 2),
  ('03F00000-0000-4000-8000-000000001079', '03F00000-0000-4000-8000-000000000520', 'It deletes the database entirely', FALSE, 3),
  ('03F00000-0000-4000-8000-000000001080', '03F00000-0000-4000-8000-000000000520', 'It forces synchronous retries forever', FALSE, 4),
  -- Q7 (519)q3: at-least-once
  ('03F00000-0000-4000-8000-000000001081', '03F00000-0000-4000-8000-000000000521', 'Idempotent handlers that tolerate duplicates', TRUE,  1),
  ('03F00000-0000-4000-8000-000000001082', '03F00000-0000-4000-8000-000000000521', 'Handlers that reject every second message', FALSE, 2),
  ('03F00000-0000-4000-8000-000000001083', '03F00000-0000-4000-8000-000000000521', 'Queues that silently drop retries', FALSE, 3),
  ('03F00000-0000-4000-8000-000000001084', '03F00000-0000-4000-8000-000000000521', 'A single worker with no parallelism', FALSE, 4),
  -- Q8 (522): even spread
  ('03F00000-0000-4000-8000-000000001085', '03F00000-0000-4000-8000-000000000522', 'Hashing the shard key', TRUE,  1),
  ('03F00000-0000-4000-8000-000000001086', '03F00000-0000-4000-8000-000000000522', 'Sharding by alphabetical prefix', FALSE, 2),
  ('03F00000-0000-4000-8000-000000001087', '03F00000-0000-4000-8000-000000000522', 'Sharding by account creation date', FALSE, 3),
  ('03F00000-0000-4000-8000-000000001088', '03F00000-0000-4000-8000-000000000522', 'Assigning stripes in creation order', FALSE, 4),
  -- Q8 (522)q2: range risk
  ('03F00000-0000-4000-8000-000000001089', '03F00000-0000-4000-8000-000000000523', 'One hot shard from skewed ranges', TRUE,  1),
  ('03F00000-0000-4000-8000-000000001090', '03F00000-0000-4000-8000-000000000523', 'Too many shards to provision', FALSE, 2),
  ('03F00000-0000-4000-8000-000000001091', '03F00000-0000-4000-8000-000000000523', 'Hash collisions across shards', FALSE, 3),
  ('03F00000-0000-4000-8000-000000001092', '03F00000-0000-4000-8000-000000000523', 'Losing all duplicate rows', FALSE, 4),
  -- Q8 (522)q3: CAP partition
  ('03F00000-0000-4000-8000-000000001093', '03F00000-0000-4000-8000-000000000524', 'Consistency and availability', TRUE,  1),
  ('03F00000-0000-4000-8000-000000001094', '03F00000-0000-4000-8000-000000000524', 'Durability and latency', FALSE, 2),
  ('03F00000-0000-4000-8000-000000001095', '03F00000-0000-4000-8000-000000000524', 'Scalability and security', FALSE, 3),
  ('03F00000-0000-4000-8000-000000001096', '03F00000-0000-4000-8000-000000000524', 'Cost and complexity', FALSE, 4),
  -- Q9 (525): first phase
  ('03F00000-0000-4000-8000-000000001097', '03F00000-0000-4000-8000-000000000525', 'Requirements and scope', TRUE,  1),
  ('03F00000-0000-4000-8000-000000001098', '03F00000-0000-4000-8000-000000000525', 'Deep dive into one bottleneck', FALSE, 2),
  ('03F00000-0000-4000-8000-000000001099', '03F00000-0000-4000-8000-000000000525', 'Choosing the exact database vendor', FALSE, 3),
  ('03F00000-0000-4000-8000-000000001100', '03F00000-0000-4000-8000-000000000525', 'Writing the production deployment plan', FALSE, 4),
  -- Q9 (525)q2: celebrity fanout
  ('03F00000-0000-4000-8000-000000001101', '03F00000-0000-4000-8000-000000000526', 'Pull (fan-out on read) for celebrity posts', TRUE,  1),
  ('03F00000-0000-4000-8000-000000001102', '03F00000-0000-4000-8000-000000000526', 'Push to every follower synchronously', FALSE, 2),
  ('03F00000-0000-4000-8000-000000001103', '03F00000-0000-4000-8000-000000000526', 'Blocking the celebrity from posting', FALSE, 3),
  ('03F00000-0000-4000-8000-000000001104', '03F00000-0000-4000-8000-000000000526', 'Sending posts as email attachments', FALSE, 4),
  -- Q9 (525)q3: shortener code
  ('03F00000-0000-4000-8000-000000001105', '03F00000-0000-4000-8000-000000000527', 'A sequential ID encoded in Base62', TRUE,  1),
  ('03F00000-0000-4000-8000-000000001106', '03F00000-0000-4000-8000-000000000527', 'A hash of the original URL', FALSE, 2),
  ('03F00000-0000-4000-8000-000000001107', '03F00000-0000-4000-8000-000000000527', 'The MD5 of the request timestamp', FALSE, 3),
  ('03F00000-0000-4000-8000-000000001108', '03F00000-0000-4000-8000-000000000527', 'A random UUID v4 stored verbatim', FALSE, 4),
  -- Q9 (525)q4: queue consumer
  ('03F00000-0000-4000-8000-000000001109', '03F00000-0000-4000-8000-000000000528', 'Idempotency in the consumer handler', TRUE,  1),
  ('03F00000-0000-4000-8000-000000001110', '03F00000-0000-4000-8000-000000000528', 'A single retry then permanent drop', FALSE, 2),
  ('03F00000-0000-4000-8000-000000001111', '03F00000-0000-4000-8000-000000000528', 'A queue that never retries at all', FALSE, 3),
  ('03F00000-0000-4000-8000-000000001112', '03F00000-0000-4000-8000-000000000528', 'Consumers that block each other forever', FALSE, 4),
  -- Q9 (525)q5: close out
  ('03F00000-0000-4000-8000-000000001113', '03F00000-0000-4000-8000-000000000529', 'Summarize what was proven and what still needs validation', TRUE,  1),
  ('03F00000-0000-4000-8000-000000001114', '03F00000-0000-4000-8000-000000000529', 'Start planning the next feature unprompted', FALSE, 2),
  ('03F00000-0000-4000-8000-000000001115', '03F00000-0000-4000-8000-000000000529', 'Rush to draw a second independent design', FALSE, 3),
  ('03F00000-0000-4000-8000-000000001116', '03F00000-0000-4000-8000-000000000529', 'Stop talking and wait silently', FALSE, 4)
ON CONFLICT (id) DO NOTHING;
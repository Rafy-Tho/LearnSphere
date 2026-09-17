-- ============================================================================
-- SEED 051: Complete course -- "Database Design & Normalization"
-- ----------------------------------------------------------------------------
-- Instructor : Anita Patel        (10000000-0000-4000-8000-000000000003)
-- Category   : Database & Administration (20000000-0000-4000-8000-000000000008)
-- Level      : INTERMEDIATE . Access : SUBSCRIPTION . Status : PUBLISHED
--
-- Structure (5 modules -> 10 chapters -> 28 lessons):
--   M1 Data Modeling Fundamentals -> C1 Foundations of Data Modeling . C2 ER Diagrams & Notation
--   M2 Keys & Relationships       -> C3 Keys & Referential Integrity . C4 Relationships & Cardinality
--   M3 The Normal Forms            -> C5 First & Second Normal Form . C6 Third Normal Form & BCNF
--   M4 Design Tradeoffs & Integrity -> C7 Denormalization & Performance . C8 Integrity Constraints
--   M5 Capstone: Schema Design     -> C9 Dimensional Modeling . C10 Designing the Capstone Schema
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
  '03300000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000003',
  '20000000-0000-4000-8000-000000000008',
  'Database Design & Normalization',
  'database-design-and-normalization',
  'Design databases that stay correct as they grow. Learn data modeling and ER diagrams, keys and relationships, the normal forms from 1NF through BCNF, denormalization tradeoffs, and integrity constraints — then design a complete capstone schema end to end.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  49
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('03300000-0000-4000-8000-000000000011', '03300000-0000-4000-8000-000000000001', 'Model real-world domains as entities, attributes, and relationships.', 1),
  ('03300000-0000-4000-8000-000000000012', '03300000-0000-4000-8000-000000000001', 'Design and read ER diagrams with correct cardinality and key placement.', 2),
  ('03300000-0000-4000-8000-000000000013', '03300000-0000-4000-8000-000000000001', 'Normalize schemas through 1NF, 2NF, 3NF, and BCNF.', 3),
  ('03300000-0000-4000-8000-000000000014', '03300000-0000-4000-8000-000000000001', 'Apply integrity constraints and justify denormalization tradeoffs.', 4),
  ('03300000-0000-4000-8000-000000000015', '03300000-0000-4000-8000-000000000001', 'Design and validate a normalized, production-ready capstone schema.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('03300000-0000-4000-8000-000000000101', '03300000-0000-4000-8000-000000000001', 1, 'Data Modeling Fundamentals',  'Learn entities, attributes, ER notation, and the three levels of design.', 'PUBLISHED'),
  ('03300000-0000-4000-8000-000000000102', '03300000-0000-4000-8000-000000000001', 2, 'Keys & Relationships',        'Link tables with reliable keys and model relationships correctly.',       'PUBLISHED'),
  ('03300000-0000-4000-8000-000000000103', '03300000-0000-4000-8000-000000000001', 3, 'The Normal Forms',            'Remove redundancy with 1NF, 2NF, 3NF, and BCNF.',                        'PUBLISHED'),
  ('03300000-0000-4000-8000-000000000104', '03300000-0000-4000-8000-000000000001', 4, 'Design Tradeoffs & Integrity', 'Balance performance and correctness with constraints.',                   'PUBLISHED'),
  ('03300000-0000-4000-8000-000000000105', '03300000-0000-4000-8000-000000000001', 5, 'Capstone: Schema Design',     'Design and validate a complete schema from requirements.',               'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('03300000-0000-4000-8000-000000000201', '03300000-0000-4000-8000-000000000101', 1, 'Foundations of Data Modeling',  'Entities, attributes, and the three levels of design.',  'PUBLISHED'),
  ('03300000-0000-4000-8000-000000000202', '03300000-0000-4000-8000-000000000101', 2, 'ER Diagrams & Notation',        'Crow foot notation and diagram reading.',                 'PUBLISHED'),
  ('03300000-0000-4000-8000-000000000203', '03300000-0000-4000-8000-000000000102', 1, 'Keys & Referential Integrity',  'Primary keys, surrogate keys, and foreign keys.',        'PUBLISHED'),
  ('03300000-0000-4000-8000-000000000204', '03300000-0000-4000-8000-000000000102', 2, 'Relationships & Cardinality',   'One-to-many, many-to-many, and one-to-one.',             'PUBLISHED'),
  ('03300000-0000-4000-8000-000000000205', '03300000-0000-4000-8000-000000000103', 1, 'First & Second Normal Form',    'Atomic values, repeating groups, and partial keys.',     'PUBLISHED'),
  ('03300000-0000-4000-8000-000000000206', '03300000-0000-4000-8000-000000000103', 2, 'Third Normal Form & BCNF',      'Transitive dependencies and stricter normal forms.',     'PUBLISHED'),
  ('03300000-0000-4000-8000-000000000207', '03300000-0000-4000-8000-000000000104', 1, 'Denormalization & Performance', 'When and why to relax the normal forms.',                'PUBLISHED'),
  ('03300000-0000-4000-8000-000000000208', '03300000-0000-4000-8000-000000000104', 2, 'Integrity Constraints',        'NOT NULL, UNIQUE, CHECK, and FOREIGN KEY.',              'PUBLISHED'),
  ('03300000-0000-4000-8000-000000000209', '03300000-0000-4000-8000-000000000105', 1, 'Dimensional Modeling',         'Facts, dimensions, and star schemas.',                   'PUBLISHED'),
  ('03300000-0000-4000-8000-000000000210', '03300000-0000-4000-8000-000000000105', 2, 'Designing the Capstone Schema', 'From requirements to a validated design.',               'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 03300000-...-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('03300000-0000-4000-8000-000000000301', '03300000-0000-4000-8000-000000000201', 1, 'What Is Data Modeling?',              'See why schema decisions happen before SQL and how modeling protects your design.', 'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('03300000-0000-4000-8000-000000000302', '03300000-0000-4000-8000-000000000201', 2, 'Entities, Attributes & Domains',      'Break a domain into entities, attributes, and reusable data domains.',             'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('03300000-0000-4000-8000-000000000303', '03300000-0000-4000-8000-000000000201', 3, 'Data Modeling Basics Quiz',           'Check your grasp of modeling fundamentals.',                                       'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('03300000-0000-4000-8000-000000000304', '03300000-0000-4000-8000-000000000202', 1, 'ER Diagrams & Notation',              'Read and draw entity-relationship diagrams with crow foot notation.',               'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('03300000-0000-4000-8000-000000000305', '03300000-0000-4000-8000-000000000202', 2, 'Conceptual, Logical & Physical Models','Move a design from conceptual ideas to logical tables and physical details.',       'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('03300000-0000-4000-8000-000000000306', '03300000-0000-4000-8000-000000000202', 3, 'ER Diagrams Quiz',                    'Test your ability to read and interpret ER diagrams.',                              'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('03300000-0000-4000-8000-000000000307', '03300000-0000-4000-8000-000000000203', 1, 'Primary Keys: Natural vs Surrogate',  'Choose identifiers that keep every row unique and stable.',                         'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('03300000-0000-4000-8000-000000000308', '03300000-0000-4000-8000-000000000203', 2, 'Foreign Keys & Referential Integrity','Link tables safely and understand what happens on delete.',                         'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('03300000-0000-4000-8000-000000000309', '03300000-0000-4000-8000-000000000203', 3, 'Keys & Referential Integrity Quiz',   'Check your knowledge of keys and referential integrity.',                           'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('03300000-0000-4000-8000-000000000310', '03300000-0000-4000-8000-000000000204', 1, 'Relationships & Cardinality',         'Model one-to-many, many-to-many, and one-to-one relationships.',                    'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('03300000-0000-4000-8000-000000000311', '03300000-0000-4000-8000-000000000204', 2, 'Many-to-Many & Junction Tables',      'Resolve many-to-many relationships with junction tables.',                          'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('03300000-0000-4000-8000-000000000312', '03300000-0000-4000-8000-000000000204', 3, 'Relationships Quiz',                  'Test your understanding of cardinality and relationship modeling.',                 'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('03300000-0000-4000-8000-000000000313', '03300000-0000-4000-8000-000000000205', 1, 'Normalization & the First Normal Form','See the problem redundancy creates and apply the First Normal Form.',              'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('03300000-0000-4000-8000-000000000314', '03300000-0000-4000-8000-000000000205', 2, 'Second Normal Form',                  'Eliminate partial dependencies to reach the Second Normal Form.',                   'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('03300000-0000-4000-8000-000000000315', '03300000-0000-4000-8000-000000000205', 3, 'First & Second Normal Form Quiz',     'Check your understanding of 1NF and 2NF.',                                         'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('03300000-0000-4000-8000-000000000316', '03300000-0000-4000-8000-000000000206', 1, 'Third Normal Form',                   'Remove transitive dependencies with the Third Normal Form.',                        'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('03300000-0000-4000-8000-000000000317', '03300000-0000-4000-8000-000000000206', 2, 'BCNF & Beyond',                       'Move beyond 3NF with Boyce-Codd Normal Form and a look at higher forms.',            'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('03300000-0000-4000-8000-000000000318', '03300000-0000-4000-8000-000000000206', 3, 'Normal Forms Quiz',                   'Test your mastery of the normal forms.',                                            'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('03300000-0000-4000-8000-000000000319', '03300000-0000-4000-8000-000000000207', 1, 'Denormalization: The Basics',         'Learn what denormalization is and why teams use it.',                               'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('03300000-0000-4000-8000-000000000320', '03300000-0000-4000-8000-000000000207', 2, 'Tradeoffs & When to Denormalize',     'Weigh the costs and decide when denormalizing is worth it.',                        'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('03300000-0000-4000-8000-000000000321', '03300000-0000-4000-8000-000000000207', 3, 'Denormalization Quiz',                'Check your reasoning about denormalization tradeoffs.',                             'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('03300000-0000-4000-8000-000000000322', '03300000-0000-4000-8000-000000000208', 1, 'Integrity Constraints',               'Use constraints to make the database enforce your model.',                          'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('03300000-0000-4000-8000-000000000323', '03300000-0000-4000-8000-000000000208', 2, 'Applying Constraints in Practice',    'Apply every constraint to a real schema with clean naming.',                        'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('03300000-0000-4000-8000-000000000324', '03300000-0000-4000-8000-000000000208', 3, 'Integrity Constraints Quiz',          'Test your knowledge of integrity constraints.',                                     'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('03300000-0000-4000-8000-000000000325', '03300000-0000-4000-8000-000000000209', 1, 'Dimensional Modeling: An Introduction','Design analytics-ready schemas with facts and dimensions.',                         'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('03300000-0000-4000-8000-000000000326', '03300000-0000-4000-8000-000000000210', 1, 'Designing the Capstone Schema',       'Design a normalized capstone schema from requirements.',                            'TEXT', 'PUBLISHED', 'FREE', 10, 12),
  ('03300000-0000-4000-8000-000000000327', '03300000-0000-4000-8000-000000000210', 2, 'Validating & Refining the Schema',    'Validate the capstone design against normal forms and constraints.',                'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('03300000-0000-4000-8000-000000000328', '03300000-0000-4000-8000-000000000210', 3, 'Final Assessment',                    'Prove what you learned across the whole course.',                                  'QUIZ', 'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 03300000-...-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '03300000-0000-4000-8000-000000000401',
  '03300000-0000-4000-8000-000000000301',
  1,
  'What Is Data Modeling?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What Is Data Modeling?</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4f46e5; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>What Is Data Modeling?</h1>
  <p>A good model is a blueprint, not a drawing of the finished product. It does not say exactly how fast queries must run; it says exactly what the system stores and why.</p>
  <p>Because the model is cheap to change and expensive to fix later, it pays to review it before any SQL is written. A design error caught on paper costs minutes; the same error in production can cost weeks.</p>
  <ul>
    <li>Name the real-world things you must keep track of</li>
    <li>Decide which properties matter and which are noise</li>
    <li>Sketch how those things connect before touching the database</li>
  </ul>
  <div class="callout callout-info">
    <strong>Mindset</strong>
    <p>Every modeling skill in this course answers one question: will this design keep the data true tomorrow?</p>
  </div>
  <p>Data modeling is the process of deciding <strong>what</strong> a system stores and <strong>how</strong> those pieces relate — before any SQL is written. It turns fuzzy business requirements into a precise blueprint that everyone can review.</p>
  <h2>Why model before writing SQL</h2>
  <ul>
    <li>It surfaces missing requirements while changes are still cheap.</li>
    <li>A diagram is far easier to argue about than a wall of <span class="ic">CREATE TABLE</span> code.</li>
    <li>The model becomes living documentation for the whole team.</li>
    <li>Good modeling prevents painful migrations after launch.</li>
  </ul>
  <h2>Three levels of design</h2>
  <table>
    <tr><th>Level</th><th>Focus</th><th>Question it answers</th></tr>
    <tr><td>Conceptual</td><td>Entities and business rules</td><td>What things exist in this domain?</td></tr>
    <tr><td>Logical</td><td>Tables, columns, keys, constraints</td><td>How is the data organized?</td></tr>
    <tr><td>Physical</td><td>Types, indexes, partitioning</td><td>How is it stored and accessed?</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Relational mindset</strong>
    <p>Relational databases store data in tables made of rows and columns. Every modeling decision in this course is aimed at producing clean, correct tables.</p>
  </div>
  <h2>Models become databases</h2>
  <pre class="code-block">Model  ->  ER diagram  ->  Normalized tables  ->  CREATE TABLE
            (concept)      (logic)               (physical)</pre>
  <div class="callout callout-tip">
    <strong>Good advice</strong>
    <p>Draw the model for one core process before you touch the database. A ten minute diagram routinely saves a week of rework.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03300000-0000-4000-8000-000000000402',
  '03300000-0000-4000-8000-000000000302',
  1,
  'Entities, Attributes & Domains',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Entities, Attributes & Domains</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4f46e5; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Entities, Attributes &amp; Domains</h1>
  <p>Entities answer the question "what do we keep records about?", attributes answer "what do we know about each record?", and domains answer "what values are allowed?". Getting the three layers straight is the first sign of a deliberate design.</p>
  <p>Teams that skip this vocabulary argue about naming all day. Teams that use it agree on the shape of the data in minutes, because each term has one job.</p>
  <ul>
    <li>Spot the entities hiding inside a requirements paragraph</li>
    <li>Separate real attributes from derived or decorative ones</li>
    <li>Set a realistic domain for every attribute you keep</li>
  </ul>
  <div class="callout callout-info">
    <strong>Tip</strong>
    <p>Noun = candidate entity. Adjective = candidate attribute. Verb = candidate relationship.</p>
  </div>
  <p>Every design starts with three vocabulary words: <strong>entities</strong> (the things we store), <strong>attributes</strong> (their properties), and <strong>domains</strong> (the legal values those properties may take).</p>
  <h2>Entities</h2>
  <p>An entity is a distinct thing or concept about which the system keeps data. In most cases it becomes a table:</p>
  <ul>
    <li><span class="ic">Customer</span> — the people who buy.</li>
    <li><span class="ic">Product</span> — the things they buy.</li>
    <li><span class="ic">Order</span> — the records of purchases.</li>
    <li><span class="ic">Enrollment</span> — the link between a student and a course.</li>
  </ul>
  <h2>Attributes</h2>
  <p>Attributes describe an entity. Each customer has a name, an email, and a registration date. A good attribute is <strong>simple, specific, and single-purpose</strong> — split <span class="ic">address</span> into <span class="ic">street</span>, <span class="ic">city</span>, and <span class="ic">postal_code</span>.</p>
  <h2>Domains</h2>
  <p>A domain is the set of allowed values for an attribute. Deciding domains early catches data-quality problems later:</p>
  <pre class="code-block">email        -> a valid email pattern
status       -> 'active' | 'inactive' | 'suspended'
price        -> a non-negative decimal with 2 fraction digits
birth_date   -> a calendar date in the past</pre>
  <div class="callout callout-info">
    <strong>Controlled vocabulary</strong>
    <p>Where possible, store codes or enums (<span class="ic">active</span>, <span class="ic">inactive</span>) instead of free text. Free text still has surprises.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Naming</strong>
    <p>Use the same singular noun for the same thing everywhere. If one screen calls it <span class="ic">customer</span> and another calls it <span class="ic">client</span>, you have already introduced a bug.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03300000-0000-4000-8000-000000000404',
  '03300000-0000-4000-8000-000000000304',
  1,
  'ER Diagrams & Notation',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ER Diagrams & Notation</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4f46e5; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>ER Diagrams &amp; Notation</h1>
  <p>An entity-relationship (ER) diagram shows entities as boxes, attributes inside them, and relationships as lines. It is the shared vocabulary of database designers.</p>
  <h2>Crow foot notation</h2>
  <p>The ends of a relationship line describe cardinality. Reading the symbol at each end tells you how many occurrences participate:</p>
  <table>
    <tr><th>Symbol</th><th>Meaning</th></tr>
    <tr><td>Single tick</td><td>Exactly one</td></tr>
    <tr><td>Circle</td><td>Zero (optional)</td></tr>
    <tr><td>Crow foot (fork)</td><td>Many</td></tr>
    <tr><td>Circle + crow foot</td><td>Zero or more</td></tr>
  </table>
  <h2>Reading a relationship</h2>
  <pre class="code-block">CUSTOMER  1 ---- N   ORDER

  "A customer places zero or more orders."
  "Each order belongs to exactly one customer."</pre>
  <div class="callout callout-info">
    <strong>Read it both ways</strong>
    <p>Every relationship has two sentences. If you cannot state both clearly, the diagram is hiding a misunderstanding.</p>
  </div>
  <h2>Attributes in the diagram</h2>
  <p>Draw the key attribute underlined (the primary key) and list the rest as plain attributes. Derived values such as <span class="ic">age</span> (computed from <span class="ic">birth_date</span>) are usually shown separately rather than stored.</p>
  <div class="callout callout-tip">
    <strong>Practice</strong>
    <p>Sketch the diagram for a library: books, members, and loans. Agree on the two sentences for each line before writing any SQL.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03300000-0000-4000-8000-000000000405',
  '03300000-0000-4000-8000-000000000305',
  1,
  'Conceptual, Logical & Physical Models',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Conceptual, Logical & Physical Models</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4f46e5; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Conceptual, Logical &amp; Physical Models</h1>
  <p>Designs mature through three stages. Skipping the first two is how teams end up with tables that mirror a UI instead of a domain.</p>
  <h2>The three layers</h2>
  <table>
    <tr><th>Model</th><th>Who reads it</th><th>Contains</th></tr>
    <tr><td>Conceptual</td><td>Stakeholders</td><td>Entities, relationships, business rules</td></tr>
    <tr><td>Logical</td><td>Developers, DBAs</td><td>Tables, columns, keys, constraints</td></tr>
    <tr><td>Physical</td><td>DBAs</td><td>Data types, indexes, partitioning, storage</td></tr>
  </table>
  <h2>Stepping from logical to physical</h2>
  <pre class="code-block">LOGICAL:
  Customer (customer_id PK, name, email)
  Order    (order_id PK, placed_at, customer_id FK)

PHYSICAL (PostgreSQL):
  customer_id SERIAL PRIMARY KEY
  placed_at  TIMESTAMPTZ NOT NULL DEFAULT now()
  CREATE INDEX idx_order_customer ON orders (customer_id);</pre>
  <div class="callout callout-info">
    <strong>Logical first</strong>
    <p>The logical model should be complete; the physical model is an engine-specific implementation of it. Different databases may realize the same logical design.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Do not skip</strong>
    <p>One paragraph in a requirements email becomes five tables later. Draft the conceptual model with the person who owns the business rules.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03300000-0000-4000-8000-000000000407',
  '03300000-0000-4000-8000-000000000307',
  1,
  'Primary Keys: Natural vs Surrogate',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Primary Keys: Natural vs Surrogate</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4f46e5; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Primary Keys: Natural vs Surrogate</h1>
  <p>The primary key is the identity contract of a table. It must be unique, never null, never change and never be recycled. Natural keys come from the real world; surrogate keys are invented numbers.</p>
  <p>Surrogates are boring on purpose. A meaningless id never drifts as real-world facts change, so it keeps foreign keys intact for the life of the database.</p>
  <ul>
    <li>Explain why natural keys fail even when they look stable</li>
    <li>Recognize the hidden cost of recycling a key</li>
    <li>Choose a surrogate strategy for new tables with confidence</li>
  </ul>
  <div class="callout callout-info">
    <strong>Heuristic</strong>
    <p>If a candidate key can change, merge or expire, it is not a key worth trusting.</p>
  </div>
  <p>A primary key uniquely identifies every row in a table. It must be stable, non-null, and never reused. The interesting question is: which value should it be?</p>
  <h2>Natural keys vs surrogate keys</h2>
  <table>
    <tr><th></th><th>Natural key</th><th>Surrogate key</th></tr>
    <tr><td>Source</td><td>Business data</td><td>System-generated</td></tr>
    <tr><td>Example</td><td>Email, ISBN, tax id</td><td>Auto-increment number, UUID</td></tr>
    <tr><td>Risk</td><td>Changes or gets reused</td><td>No meaning, needs a lookup</td></tr>
  </table>
  <h2>A surrogate key in practice</h2>
  <pre class="code-block">CREATE TABLE customers (
  customer_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  email       TEXT NOT NULL UNIQUE,
  name        TEXT NOT NULL
);</pre>
  <p>Here the contract is explicit: <span class="ic">customer_id</span> identifies the row, while <span class="ic">email</span> stays unique but remains a mutable business value.</p>
  <div class="callout callout-info">
    <strong>Email looks unique, then changes</strong>
    <p>People change email addresses and occasionally share them. A stable surrogate key keeps foreign keys intact across those changes.</p>
  </div>
  <h2>Composite keys</h2>
  <p>When no single column identifies a row, several columns may combine into one composite key — you will use such keys in junction tables.</p>
  <div class="callout callout-tip">
    <strong>Rule of thumb</strong>
    <p>Prefer a surrogate key for customer-facing, mutable domains. Reserve natural keys for genuinely immutable identifiers such as country codes.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03300000-0000-4000-8000-000000000408',
  '03300000-0000-4000-8000-000000000308',
  1,
  'Foreign Keys & Referential Integrity',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Foreign Keys & Referential Integrity</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4f46e5; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Foreign Keys &amp; Referential Integrity</h1>
  <p>A foreign key is a column (or set of columns) that references the primary key of another table. It is the mechanism that turns paper relationships into enforced database rules.</p>
  <h2>Declaring a foreign key</h2>
  <pre class="code-block">CREATE TABLE orders (
  order_id    BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  customer_id BIGINT NOT NULL REFERENCES customers (customer_id),
  placed_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);</pre>
  <p>With this constraint the database rejects any order whose <span class="ic">customer_id</span> does not exist — orphaned rows become impossible.</p>
  <h2>What happens when a parent is deleted?</h2>
  <table>
    <tr><th>Action</th><th>Behavior</th></tr>
    <tr><td>RESTRICT (default)</td><td>Deletion fails while rows reference it</td></tr>
    <tr><td>CASCADE</td><td>Child rows are deleted too</td></tr>
    <tr><td>SET NULL</td><td>Child references become NULL</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Choose deliberately</strong>
    <p><span class="ic">RESTRICT</span> protects history; <span class="ic">CASCADE</span> fits aggregate lifecycles (delete the parent, remove its children); <span class="ic">SET NULL</span> needs a nullable column.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Index the foreign key</strong>
    <p>PostgreSQL does not auto-index foreign key columns. Joins from child to parent will scan without one, so add an index on the referencing columns.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03300000-0000-4000-8000-000000000410',
  '03300000-0000-4000-8000-000000000310',
  1,
  'Relationships & Cardinality',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Relationships & Cardinality</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4f46e5; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Relationships &amp; Cardinality</h1>
  <p>A relationship says two entities are connected; cardinality says how many. Reading those two numbers correctly is what lets you place a foreign key on the right side.</p>
  <p>Most modeling mistakes are really cardinality mistakes. Readers and owners get aggregated as if they were one-to-many, and join tables are invented where a simple column would do.</p>
  <ul>
    <li>Read one-to-one, one-to-many and many-to-many diagrams fluently</li>
    <li>Decide where the foreign key should live in each case</li>
    <li>Test a relationship with a concrete pair of sample rows</li>
  </ul>
  <div class="callout callout-info">
    <strong>Check</strong>
    <p>Ask: can one A own many Bs, and can one B be owned by many As? Both answers decide the design.</p>
  </div>
  <p>Cardinality states how many rows on one side of a relationship may match rows on the other. It decides where foreign keys live.</p>
  <h2>The three cardinalities</h2>
  <table>
    <tr><th>Cardinality</th><th>Meaning</th><th>Foreign key placement</th></tr>
    <tr><td>One-to-one (1:1)</td><td>Each row matches at most one</td><td>Either side; often the optional side</td></tr>
    <tr><td>One-to-many (1:N)</td><td>One parent, many children</td><td>On the many (child) side</td></tr>
    <tr><td>Many-to-many (M:N)</td><td>Both sides relate to many</td><td>In a junction table</td></tr>
  </table>
  <h2>One-to-many in SQL</h2>
  <pre class="code-block">-- A category has many products; each product has one category.
CREATE TABLE products (
  product_id  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  category_id BIGINT NOT NULL REFERENCES categories (category_id),
  name        TEXT NOT NULL
);</pre>
  <div class="callout callout-info">
    <strong>Decide which side is which</strong>
    <p>Ask: can one category own many products? Then category is the one side and product is the many side. The many side carries the foreign key.</p>
  </div>
  <h2>Optionality</h2>
  <p>Optionality asks whether a relationship is mandatory. A nullable foreign key makes the child optional; a <span class="ic">NOT NULL</span> foreign key forces at least one parent.</p>
  <div class="callout callout-tip">
    <strong>State the two sentences</strong>
    <p>For every line on your diagram, write both sentences aloud. They are the fastest bug detector in data modeling.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03300000-0000-4000-8000-000000000411',
  '03300000-0000-4000-8000-000000000311',
  1,
  'Many-to-Many & Junction Tables',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Many-to-Many & Junction Tables</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4f46e5; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Many-to-Many &amp; Junction Tables</h1>
  <p>A many-to-many relationship cannot be stored with one foreign key. The standard solution is a <strong>junction table</strong> that holds both foreign keys — one row per pairing.</p>
  <h2>Students and courses</h2>
  <pre class="code-block">CREATE TABLE students (
  student_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name       TEXT NOT NULL
);

CREATE TABLE courses (
  course_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title     TEXT NOT NULL
);

CREATE TABLE enrollments (
  student_id BIGINT REFERENCES students (student_id),
  course_id  BIGINT REFERENCES courses (course_id),
  enrolled_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  PRIMARY KEY (student_id, course_id)
);</pre>
  <p>The composite primary key prevents a student from enrolling in the same course twice.</p>
  <div class="callout callout-info">
    <strong>Junction tables carry facts</strong>
    <p>The enrollment date, grade, or seat number belong on the junction row — they are properties of the pairing, not of either side.</p>
  </div>
  <h2>Surrogate key vs composite key</h2>
  <p>A composite key is precise and self-documenting. Teams that expect the junction to grow rich metadata often add a surrogate <span class="ic">enrollment_id</span> instead; both are defensible.</p>
  <div class="callout callout-tip">
    <strong>Split when details multiply</strong>
    <p>The moment a pairing needs payments or history of its own, promote the junction table into a first-class entity rather than piling columns onto it.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03300000-0000-4000-8000-000000000413',
  '03300000-0000-4000-8000-000000000313',
  1,
  'Normalization & the First Normal Form',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Normalization & the First Normal Form</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4f46e5; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Normalization &amp; the First Normal Form</h1>
  <p>Normalization is disciplined de-duplication. It splits facts apart so that each one is stored exactly once, which is what makes updates safe and reports trustworthy.</p>
  <p>First Normal Form is the entry ticket: every cell holds one atomic value, every row is unique, and columns are not used as mini-tables. It sounds simple and is violated constantly.</p>
  <ul>
    <li>Reproduce the three update anomalies from memory</li>
    <li>Spot multi-value cells in any fan-in design</li>
    <li>Repair a 1NF violation without losing information</li>
  </ul>
  <div class="callout callout-info">
    <strong>Why it matters</strong>
    <p>A table can be fast and convenient and still be wrong. Redundancy is the bug you cannot see until two rows disagree.</p>
  </div>
  <p>Normalization organizes tables so each fact is stored <strong>once</strong>. It exists because redundancy quietly creates inconsistent data.</p>
  <h2>The update problems redundancy causes</h2>
  <table>
    <tr><th>Operation</th><th>Problem</th></tr>
    <tr><td>INSERT</td><td>New data requires the duplicated facts to appear in every copy</td></tr>
    <tr><td>UPDATE</td><td>One fix must be repeated in many rows, yet usually is not</td></tr>
    <tr><td>DELETE</td><td>Removing a row can accidentally erase facts that were only carried as copies</td></tr>
  </table>
  <h2>First Normal Form (1NF)</h2>
  <p>A table is in 1NF when every cell holds one atomic value and there are no repeating groups:</p>
  <pre class="code-block">-- Breaks 1NF: a list inside a cell
customer_name | phone_numbers
--------------+-------------------
Ada           | 555-0101, 555-0102

-- Fixes 1NF: one row per value
customer_name | phone_number
--------------+-------------
Ada           | 555-0101
Ada           | 555-0102</pre>
  <div class="callout callout-tip">
    <strong>Comma-separated lists are a smell</strong>
    <p>Any column that stores several values in one cell will be painful to filter, update, and join. Split it into rows.</p>
  </div>
  <div class="callout callout-info">
    <strong>1NF is the base</strong>
    <p>Every later normal form assumes 1NF already holds. Nothing you do next matters if atomicity is broken.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03300000-0000-4000-8000-000000000414',
  '03300000-0000-4000-8000-000000000314',
  1,
  'Second Normal Form',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Second Normal Form</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4f46e5; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Second Normal Form</h1>
  <p>Second Normal Form (2NF) applies only to tables with a <strong>composite key</strong>. It removes <em>partial dependencies</em>: a non-key column that depends on just one part of the key.</p>
  <h2>Spotting a partial dependency</h2>
  <pre class="code-block">-- Composite key: (order_id, product_id)
-- product_name depends only on product_id -> partial dependency

order_id | product_id | product_name | quantity
---------+------------+--------------+---------
      42 |         901 | Widget       |       2
      42 |         903 | Gadget       |       1</pre>
  <p>Every order for the same product repeats its name. Rename the product and you must touch every order — an update anomaly.</p>
  <h2>The fix</h2>
  <pre class="code-block">-- order_items keeps only what depends on the full key
CREATE TABLE order_items (
  order_id   BIGINT REFERENCES orders (order_id),
  product_id BIGINT REFERENCES products (product_id),
  quantity   INTEGER NOT NULL,
  PRIMARY KEY (order_id, product_id)
);

-- product data lives in products, once
CREATE TABLE products (
  product_id   BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  product_name TEXT NOT NULL,
  price        NUMERIC(10,2) NOT NULL
);</pre>
  <div class="callout callout-info">
    <strong>Single-column-key tables</strong>
    <p>If the primary key is one column, a partial dependency cannot exist — 2NF is automatic. The class happens almost only in junction-style tables.</p>
  </div>
  <h2>Checklist</h2>
  <ul>
    <li>Is the table in 1NF?</li>
    <li>Does a column rely on a subset of the key?</li>
    <li>If yes, move those columns to their own table keyed by that subset.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Ask the question</strong>
    <p>For each non-key column, ask: <span class="ic">do I need the whole key to know this value?</span> If the answer is no, 2NF is violated.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03300000-0000-4000-8000-000000000416',
  '03300000-0000-4000-8000-000000000316',
  1,
  'Third Normal Form',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Third Normal Form</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4f46e5; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Third Normal Form</h1>
  <p>3NF adds exactly one rule to 2NF: a non-key column must not depend on another non-key column. Removing that chain is what stops departments, prices and other facts from drifting apart.</p>
  <p>Students usually reach 3NF and produce designs that feel right. The reward is quieter: fewer surprises during updates and joins that line up because keys line up.</p>
  <ul>
    <li>Trace a transitive dependency step by step</li>
    <li>Explain what 3NF adds beyond 2NF in one sentence</li>
    <li>Decompose the classic professor-office pairing correctly</li>
  </ul>
  <div class="callout callout-info">
    <strong>Rule of thumb</strong>
    <p>If changing one non-key value forces you to change another, the fact is on the wrong table.</p>
  </div>
  <p>A table is in Third Normal Form (3NF) when it is in 2NF and contains no <strong>transitive dependency</strong>: no non-key column determined by another non-key column.</p>
  <h2>Tracing a transitive dependency</h2>
  <pre class="code-block">employee_id | employee_name | department_id | department_name
------------+---------------+--------------+----------------
        101 | Ada           |            8  | Procurement
        102 | Nina          |            8  | Procurement</pre>
  <p><span class="ic">department_name</span> follows from <span class="ic">department_id</span>, which is itself only a fact about the employee. Rename the department and every row repeats the update.</p>
  <h2>The fix</h2>
  <pre class="code-block">CREATE TABLE departments (
  department_id   BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  department_name TEXT NOT NULL
);

CREATE TABLE employees (
  employee_id   BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  employee_name TEXT NOT NULL,
  department_id BIGINT REFERENCES departments (department_id)
);</pre>
  <p>Now department facts exist in exactly one place, and employees reference them by key.</p>
  <div class="callout callout-info">
    <strong>2NF vs 3NF</strong>
    <p>2NF removes columns that depend on <em>part</em> of a composite key. 3NF removes columns that depend on <em>another non-key</em> column. Both push data toward its natural owner.</p>
  </div>
  <div class="callout callout-tip">
    <strong>The chain test</strong>
    <p>If a column explains another column instead of the key, split it out. 3NF is the level most OLTP schemas target.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03300000-0000-4000-8000-000000000417',
  '03300000-0000-4000-8000-000000000317',
  1,
  'BCNF & Beyond',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BCNF & Beyond</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4f46e5; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>BCNF &amp; Beyond</h1>
  <p>Boyce-Codd Normal Form (BCNF) is a refined 3NF. It applies to the rare tables where overlapping candidate keys let 3NF stay satisfied while redundancy remains.</p>
  <h2>The rule</h2>
  <p>A table is in BCNF when it is in 3NF and <strong>every determinant is a candidate key</strong>. A determinant is any column on which another column depends.</p>
  <h2>An example 3NF misses</h2>
  <pre class="code-block">course | lecturer | lecturer_office
-------+----------+----------------
SQL    | Anita    | A-12
SQL    | David    | B-04
ERD    | Anita    | A-12</pre>
  <p>Here <span class="ic">lecturer_office</span> depends on <span class="ic">lecturer</span>, but the key is <span class="ic">(course, lecturer)</span>. The office is neither part of the key nor transitively dependent on a non-key — 3NF tolerates it, yet changing an office repeats the update across rows.</p>
  <div class="callout callout-info">
    <strong>The fix</strong>
    <p>Split the lecturer facts into their own table keyed by <span class="ic">lecturer</span>, the same move used for 2NF and 3NF violations.</p>
  </div>
  <h2>Beyond BCNF</h2>
  <table>
    <tr><th>Form</th><th>Addresses</th></tr>
    <tr><td>4NF</td><td>Multi-valued facts (several independent values per key)</td></tr>
    <tr><td>5NF</td><td>Join dependencies exposed by decomposing into three or more tables</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Where practice stops</strong>
    <p>Most transactional systems stop at 3NF or BCNF. 4NF and 5NF are correct and fascinating, but their schemas are rare outside specialized academic or analytic design.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03300000-0000-4000-8000-000000000419',
  '03300000-0000-4000-8000-000000000319',
  1,
  'Denormalization: The Basics',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Denormalization: The Basics</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4f46e5; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Denormalization: The Basics</h1>
  <p>Denormalization is a performance trade, not a modeling sin. You copy a value or precompute a summary, and you accept the cost of keeping it in sync on every write.</p>
  <p>The discipline is to start from a clean normalized model, measure a real problem, and denormalize one column at a time with the updater documented.</p>
  <ul>
    <li>Name three reasons teams copy or summarize data</li>
    <li>Separate controlled redundancy from accidental drift</li>
    <li>List the sync costs you sign up for</li>
  </ul>
  <div class="callout callout-info">
    <strong>Warning</strong>
    <p>Denormalize only when a query profile demands it, and always after normalization, never instead of it.</p>
  </div>
  <p>Denormalization deliberately reintroduces redundancy — usually a copied value or a precomputed summary — in exchange for faster reads. It is a <em>conscious choice after</em> normalization, never a substitute for it.</p>
  <h2>Why teams denormalize</h2>
  <ul>
    <li>Read-heavy workloads with frequent, expensive joins.</li>
    <li>Reporting dashboards that aggregate across many tables.</li>
    <li>High-traffic hot paths where a join must shrink to one lookup.</li>
  </ul>
  <h2>Normalized vs denormalized</h2>
  <pre class="code-block">-- Normalized: the name lives once in categories
SELECT p.name, c.name
FROM   products p
JOIN   categories c USING (category_id);

-- Denormalized: category_name duplicated onto product
SELECT p.name, p.category_name
FROM   products p;</pre>
  <div class="callout callout-info">
    <strong>The tradeoff is real</strong>
    <p>Every copied value must be kept in sync by application code or a trigger. A denormalized schema can serve the wrong value silently the day a sync path is missed.</p>
  </div>
  <h2>Common techniques</h2>
  <ul>
    <li>Storing a lookup name on the child row (category_name, country_name).</li>
    <li>Storing running totals or row counts alongside the summary.</li>
    <li>Materialized views that refresh on a schedule.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Measure first</strong>
    <p>Add an index or an optimized query before you reach for denormalization. Only introduce duplication when the profiling data demands it.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03300000-0000-4000-8000-000000000420',
  '03300000-0000-4000-8000-000000000320',
  1,
  'Tradeoffs & When to Denormalize',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tradeoffs & When to Denormalize</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4f46e5; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Tradeoffs &amp; When to Denormalize</h1>
  <p>Before duplicating a value, weigh what you gain against what you give up. Denormalization trades write correctness for read speed — and that should be a deliberate decision.</p>
  <h2>What it costs</h2>
  <ul>
    <li><strong>Update anomalies return</strong> — one logical fact has many physical copies.</li>
    <li><strong>Write paths grow</strong> — inserts and updates must maintain every copy.</li>
    <li><strong>Synchronous bugs</strong> — a missed copy silently serves stale data.</li>
  </ul>
  <h2>Deciding with a scenario table</h2>
  <table>
    <tr><th>Scenario</th><th>Choice</th></tr>
    <tr><td>Rarely-changing lookup joined on every read</td><td>Denormalize the name into the child</td></tr>
    <tr><td>Frequently updated value, few reads</td><td>Stay normalized; let the join be</td></tr>
    <tr><td>Nightly reporting rollups</td><td>Materialized view, not denormalized columns</td></tr>
    <tr><td>Transactional system with audit rules</td><td>Stay normalized, add indexes</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Rules of thumb</strong>
    <p>Denormalize for read-heavy, stable facts; normalize for write-heavy, correct systems. Keep the normalized source as the system of record and treat copies as derived data.</p>
  </div>
  <div class="callout callout-info">
    <strong>Automate the sync</strong>
    <p>If a copy must exist, maintain it with a trigger or the same transaction that updates the source. A <span class="ic">CHECK</span> or health query comparing copies is cheap insurance.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03300000-0000-4000-8000-000000000422',
  '03300000-0000-4000-8000-000000000322',
  1,
  'Integrity Constraints',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Integrity Constraints</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4f46e5; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Integrity Constraints</h1>
  <p>A well-designed model is only as strong as its enforcement. Integrity constraints make the <strong>database itself</strong> reject bad data instead of trusting every application to behave.</p>
  <h2>The five essential tools</h2>
  <table>
    <tr><th>Constraint</th><th>Protects against</th></tr>
    <tr><td>NOT NULL</td><td>Missing facts that the business requires</td></tr>
    <tr><td>UNIQUE</td><td>Duplicate values in columns that must differ</td></tr>
    <tr><td>PRIMARY KEY</td><td>Duplicate rows, and NULL keys</td></tr>
    <tr><td>CHECK</td><td>Values outside a declared rule or range</td></tr>
    <tr><td>FOREIGN KEY</td><td>Orphaned rows and broken references</td></tr>
  </table>
  <h2>Constraints in action</h2>
  <pre class="code-block">CREATE TABLE products (
  product_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  sku        TEXT NOT NULL UNIQUE,
  price      NUMERIC(10,2) NOT NULL CHECK (price >= 0),
  category_id BIGINT NOT NULL REFERENCES categories (category_id)
);</pre>
  <div class="callout callout-info">
    <strong>Fail fast at the boundary</strong>
    <p>Putting rules in the database means every insert path — web app, script, import, or human at the console — obeys the same contract.</p>
  </div>
  <h2>Constraint errors are your friends</h2>
  <p>A rejected insert is not an annoyance; it is the database proving that the data does not fit the model. Fix the data or fix the model, never silence the check.</p>
  <div class="callout callout-tip">
    <strong>Start strict</strong>
    <p>Add NOT NULL and CHECK liberally at creation. Relaxing a constraint later is much easier than discovering an entire clean-up migration because you were lenient.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03300000-0000-4000-8000-000000000423',
  '03300000-0000-4000-8000-000000000323',
  1,
  'Applying Constraints in Practice',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Applying Constraints in Practice</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4f46e5; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Applying Constraints in Practice</h1>
  <p>Constraints earn their keep in audits, imports and bug hunts. A well-named constraint tells the next developer exactly which rule was broken and why it matters.</p>
  <p>This lesson is meant to be reread next to a real schema. Take the orders example, run each constraint against the earlier left-join symptom, and watch the model hold.</p>
  <ul>
    <li>Name every constraint used in the orders example</li>
    <li>Choose between foreign key, check and unique for a sample rule</li>
    <li>Explain why the database rejects what the app accepted</li>
  </ul>
  <div class="callout callout-info">
    <strong>Reflex</strong>
    <p>If a rule can be stated about the data itself, the database should enforce it, not the application.</p>
  </div>
  <p>Constraints read naturally when they are named and grouped. Here is a realistic schema for an orders domain built with every rule from the previous lesson.</p>
  <h2>A constrained schema</h2>
  <pre class="code-block">CREATE TABLE categories (
  category_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name        TEXT NOT NULL
);

CREATE TABLE products (
  product_id  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  category_id BIGINT NOT NULL REFERENCES categories (category_id),
  name        TEXT NOT NULL,
  price       NUMERIC(10,2) NOT NULL CHECK (price >= 0)
);

CREATE TABLE order_items (
  order_id   BIGINT NOT NULL REFERENCES orders (order_id),
  product_id BIGINT NOT NULL REFERENCES products (product_id),
  quantity   INTEGER NOT NULL CHECK (quantity > 0),
  PRIMARY KEY (order_id, product_id)
);</pre>
  <div class="callout callout-info">
    <strong>Name your constraints</strong>
    <p>Auto-generated names like <span class="ic">products_price_check</span> are readable, but explicit names such as <span class="ic">ck_products_price_nonnegative</span> survive refactors and describe intent.</p>
  </div>
  <h2>Acceptable failure, graceful message</h2>
  <pre class="code-block">-- Reject a negative price at the database level:
--   products (name, price)  ->  ('Bolt', -1)
-- ERROR: new row for relation "products" violates
--        check constraint "ck_products_price_nonnegative"</pre>
  <p>Applications catch this error, translate it to a friendly message, and the bad row never exists.</p>
  <div class="callout callout-tip">
    <strong>Order of operations in a migration</strong>
    <p>Create the parent tables first, then children, so every foreign key has a target. Backfill data before adding NOT NULL, and add CHECK before uploading historical rows with questionable values.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03300000-0000-4000-8000-000000000425',
  '03300000-0000-4000-8000-000000000325',
  1,
  'Dimensional Modeling: An Introduction',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dimensional Modeling: An Introduction</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4f46e5; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Dimensional Modeling: An Introduction</h1>
  <p>OLTP schemas are normalized to survive writes. Analytic schemas model the same data so <strong>queries over aggregates are fast</strong>. Dimensional modeling is the standard approach, built from facts and dimensions.</p>
  <h2>Facts and dimensions</h2>
  <table>
    <tr><th>Table</th><th>Role</th><th>Example</th></tr>
    <tr><td>Fact</td><td>Measures and events, one row per occurrence</td><td>sales (amount, quantity)</td></tr>
    <tr><td>Dimension</td><td>Descriptive context to slice by</td><td>time, product, store, customer</td></tr>
  </table>
  <h2>The star schema</h2>
  <pre class="code-block">          dim_time        dim_product
              \                /
               \              /
                dim_store -- fact_sales
                      / \
                 dim_customer

SELECT d.day_name, SUM(f.amount)
FROM   fact_sales f
JOIN   dim_time d        USING (time_id)
JOIN   dim_product p     USING (product_id)
WHERE  p.category = 'Apparel'
GROUP BY d.day_name;</pre>
  <div class="callout callout-info">
    <strong>Why stars win</strong>
    <p>Every dimension joins the fact in one hop, so aggregate queries scan a wide, flat fact table and filter along small dimensions. No deep join chains.</p>
  </div>
  <h2>Normalize vs dimension, not vs denormal</h2>
  <p>Dimensions borrow denormalized columns on purpose (a product dimension may carry its category name). The fact table itself stays skinny and reloads in bulk.</p>
  <div class="callout callout-tip">
    <strong>Read for reasons, write for facts</strong>
    <p>Ask whether a table answers <span class="ic">how much?</span> (fact) or <span class="ic">what, when, where?</span> (dimension). Getting the question right usually gets the schema right.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03300000-0000-4000-8000-000000000426',
  '03300000-0000-4000-8000-000000000326',
  1,
  'Designing the Capstone Schema',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Designing the Capstone Schema</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4f46e5; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Designing the Capstone Schema</h1>
  <p>Bring the whole course together: requirements for an online learning platform become a normalized schema. Every step you used in earlier modules shows up here.</p>
  <h2>Working through the steps</h2>
  <ol>
    <li><strong>Requirements</strong> — students enroll in courses; courses group lessons; instructors teach courses.</li>
    <li><strong>Entities</strong> — students, courses, instructors, lessons.</li>
    <li><strong>Relationships</strong> — one instructor teaches many courses; a student joins many courses through enrollments.</li>
    <li><strong>Keys</strong> — surrogate keys everywhere, composite keys in the junction.</li>
  </ol>
  <h2>Core tables</h2>
  <pre class="code-block">CREATE TABLE instructors (
  instructor_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name          TEXT NOT NULL
);

CREATE TABLE courses (
  course_id     BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  instructor_id BIGINT NOT NULL REFERENCES instructors (instructor_id),
  title         TEXT NOT NULL,
  status        TEXT NOT NULL CHECK (status IN ('draft','published'))
);

CREATE TABLE students (
  student_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  email      TEXT NOT NULL UNIQUE
);

CREATE TABLE enrollments (
  student_id  BIGINT NOT NULL REFERENCES students (student_id),
  course_id   BIGINT NOT NULL REFERENCES courses (course_id),
  enrolled_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  PRIMARY KEY (student_id, course_id)
);</pre>
  <div class="callout callout-tip">
    <strong>Design once, draw it</strong>
    <p>Sketch the ER diagram before this SQL. If the two sentences come out easily, the DDL above writes itself.</p>
  </div>
  <div class="callout callout-info">
    <strong>Watch the many paths</strong>
    <p>Students get to courses via enrollments; courses reach instructors directly. Model the real business path, not every comfortable shortcut.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03300000-0000-4000-8000-000000000427',
  '03300000-0000-4000-8000-000000000327',
  1,
  'Validating & Refining the Schema',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Validating & Refining the Schema</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4f46e5; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Validating &amp; Refining the Schema</h1>
  <p>Review is where schemas become production-grade. Walk each relationship, re-run the normal-form checks, and then attack the design with the most awkward queries you can invent.</p>
  <p>Treat the capstone as a deliverable reviewers will inspect. The checklist in this lesson is the same one used to audit the sub-schemas in this course.</p>
  <ul>
    <li>Run all three normal-form checks against your final tables</li>
    <li>Test every junction table and composite key path</li>
    <li>Write the top five queries and find every table they touch</li>
  </ul>
  <div class="callout callout-info">
    <strong>Finished means</strong>
    <p>A schema is done when imaginary queries stop failing, every column is justified, and a stranger can read the model in one sitting.</p>
  </div>
  <p>A schema is not finished when the tables exist; it is finished when it survives a careful review. Run the capstone through the same checks a senior reviewer would.</p>
  <h2>The normal-form review</h2>
  <table>
    <tr><th>Check</th><th>How</th></tr>
    <tr><td>1NF</td><td>Every cell atomic, no repeated groups</td></tr>
    <tr><td>2NF</td><td>No column depends on only part of a composite key</td></tr>
    <tr><td>3NF</td><td>No column depends on another non-key column</td></tr>
    <tr><td>BCNF</td><td>Every determinant is a candidate key</td></tr>
  </table>
  <h2>Constraint and index review</h2>
  <pre class="code-block">CHECK (status IN ('draft','published'))
NOT NULL on every required fact
Indexes on foreign key columns: enrollments(student_id),
                               enrollments(course_id)
No cycles in the FK graph</pre>
  <div class="callout callout-info">
    <strong>Cycles are a design signal</strong>
    <p>Two tables referencing each other usually mean a junction, a hierarchy choice, or duplicated logic is hiding. Prefer a single direction for each relationship.</p>
  </div>
  <h2>Finish with one hard scenario</h2>
  <p>Hand a concrete scenario to the schema — <span class="ic">a student unenrolls; can an instructor see their course?</span> — and walk the data path. The scenario test catches most residual mistakes.</p>
  <div class="callout callout-tip">
    <strong>Ship it</strong>
    <p>You now hold the full toolkit: model, diagram, keys, relationships, normal forms, constraints, and the confidence to justify every table you keep.</p>
  </div>
</div>
</body>
</html>
$html$
)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 6. QUIZZES  (29 questions)
--    Q1-3 for lesson 303 . Q4-6 for 306 . Q7-9 for 309 . Q10-12 for 312
--    Q13-15 for 315 . Q16-18 for 318 . Q19-21 for 321 . Q22-24 for 324
--    Q25-29 for final assessment 328.
-- ----------------------------------------------------------------------------

INSERT INTO quizzes (id, lesson_id, question, explanation, position) VALUES
  ('03300000-0000-4000-8000-000000000501', '03300000-0000-4000-8000-000000000303',
   'What is the main reason to create a data model before building a database?',
   'Modeling clarifies requirements and documents the design before tables exist.', 1),
  ('03300000-0000-4000-8000-000000000502', '03300000-0000-4000-8000-000000000303',
   'Which modeling level describes tables, columns, keys, and constraints?',
   'The logical model reflects the database structure without engine-specific detail.', 2),
  ('03300000-0000-4000-8000-000000000503', '03300000-0000-4000-8000-000000000303',
   'Which statement about an entity is correct?',
   'An entity is a distinct thing or concept about which the system keeps data.', 3),
  ('03300000-0000-4000-8000-000000000504', '03300000-0000-4000-8000-000000000306',
   'What does an attribute represent in an ER diagram?',
   'Attributes are the properties or facts that describe an entity.', 1),
  ('03300000-0000-4000-8000-000000000505', '03300000-0000-4000-8000-000000000306',
   'In crow foot notation, what does the three-branch fork on a line mean?',
   'The crow foot symbol represents many occurrences.', 2),
  ('03300000-0000-4000-8000-000000000506', '03300000-0000-4000-8000-000000000306',
   'Which of these is a derived attribute?',
   'age can be computed from birth_date, so it is derived rather than stored.', 3),
  ('03300000-0000-4000-8000-000000000507', '03300000-0000-4000-8000-000000000309',
   'What is a surrogate key?',
   'A surrogate key is a system-generated identifier with no business meaning.', 1),
  ('03300000-0000-4000-8000-000000000508', '03300000-0000-4000-8000-000000000309',
   'What does a foreign key enforce?',
   'A foreign key guarantees that referenced rows exist, preventing orphans.', 2),
  ('03300000-0000-4000-8000-000000000509', '03300000-0000-4000-8000-000000000309',
   'What is a composite primary key?',
   'A composite key uses two or more columns together to identify a row.', 3),
  ('03300000-0000-4000-8000-000000000510', '03300000-0000-4000-8000-000000000312',
   'In a one-to-many relationship, where is the foreign key placed?',
   'The many side holds the foreign key that references the one side.', 1),
  ('03300000-0000-4000-8000-000000000511', '03300000-0000-4000-8000-000000000312',
   'How is a many-to-many relationship stored in a relational database?',
   'A junction table holds the keys of both sides.', 2),
  ('03300000-0000-4000-8000-000000000512', '03300000-0000-4000-8000-000000000312',
   'What does cardinality describe about a relationship?',
   'Cardinality states how many occurrences of one entity relate to the other.', 3),
  ('03300000-0000-4000-8000-000000000513', '03300000-0000-4000-8000-000000000315',
   'Which of these breaks First Normal Form?',
   '1NF forbids multiple values inside a single cell.', 1),
  ('03300000-0000-4000-8000-000000000514', '03300000-0000-4000-8000-000000000315',
   'Which dependency does Second Normal Form remove?',
   '2NF removes partial dependencies on only part of the key.', 2),
  ('03300000-0000-4000-8000-000000000515', '03300000-0000-4000-8000-000000000315',
   'What must a table satisfy before we can check 2NF?',
   '2NF builds on 1NF, so atomic values come first.', 3),
  ('03300000-0000-4000-8000-000000000516', '03300000-0000-4000-8000-000000000318',
   'Which dependency does Third Normal Form remove?',
   '3NF removes transitive dependencies between non-key columns.', 1),
  ('03300000-0000-4000-8000-000000000517', '03300000-0000-4000-8000-000000000318',
   'A table is in Boyce-Codd Normal Form when every determinant is what?',
   'In BCNF each determinant must be a candidate key.', 2),
  ('03300000-0000-4000-8000-000000000518', '03300000-0000-4000-8000-000000000318',
   'Which form is stricter than 3NF?',
   'BCNF removes the residual cases that 3NF still tolerates.', 3),
  ('03300000-0000-4000-8000-000000000519', '03300000-0000-4000-8000-000000000321',
   'When is denormalization most justified?',
   'Read-heavy workloads with expensive joins can trade duplication for speed.', 1),
  ('03300000-0000-4000-8000-000000000520', '03300000-0000-4000-8000-000000000321',
   'What is the main cost of denormalization?',
   'Redundant copies can drift out of sync and cause update anomalies.', 2),
  ('03300000-0000-4000-8000-000000000521', '03300000-0000-4000-8000-000000000321',
   'Which technique is an example of denormalization?',
   'Storing a precomputed summary value on a row duplicates derived data on purpose.', 3),
  ('03300000-0000-4000-8000-000000000522', '03300000-0000-4000-8000-000000000324',
   'Which constraint makes duplicate values impossible in a column?',
   'UNIQUE (and PRIMARY KEY) reject duplicate values.', 1),
  ('03300000-0000-4000-8000-000000000523', '03300000-0000-4000-8000-000000000324',
   'What does a CHECK constraint enforce?',
   'CHECK validates that values satisfy a given condition such as a range.', 2),
  ('03300000-0000-4000-8000-000000000524', '03300000-0000-4000-8000-000000000324',
   'Which constraint above all others prevents orphaned rows?',
   'A foreign key requires referenced rows to exist.', 3),
  ('03300000-0000-4000-8000-000000000525', '03300000-0000-4000-8000-000000000328',
   'Which step should come first when designing a database?',
   'Understanding requirements drives every later decision.', 1),
  ('03300000-0000-4000-8000-000000000526', '03300000-0000-4000-8000-000000000328',
   'What is normalization primarily meant to reduce?',
   'Normalization removes redundancy and the update anomalies it causes.', 2),
  ('03300000-0000-4000-8000-000000000527', '03300000-0000-4000-8000-000000000328',
   'In a star schema, which tables describe the context of measures?',
   'Dimension tables hold the descriptive context around facts.', 3),
  ('03300000-0000-4000-8000-000000000528', '03300000-0000-4000-8000-000000000328',
   'Which key carries no business meaning?',
   'Surrogate keys are system-generated and stable.', 4),
  ('03300000-0000-4000-8000-000000000529', '03300000-0000-4000-8000-000000000328',
   'Where should the foreign key live in a one-to-many relationship?',
   'The child table on the many side stores the foreign key to its parent.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 . Q2 1013-1024 . Q3 1025-1036 . Q4 1037-1048
--    Q5 1049-1060 . Q6 1061-1072 . Q7 1073-1084 . Q8 1085-1096 . Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): data model purpose
  ('03300000-0000-4000-8000-000000001001', '03300000-0000-4000-8000-000000000501', 'It clarifies requirements and documents the design', TRUE,  1),
  ('03300000-0000-4000-8000-000000001002', '03300000-0000-4000-8000-000000000501', 'It automatically makes queries run faster', FALSE, 2),
  ('03300000-0000-4000-8000-000000001003', '03300000-0000-4000-8000-000000000501', 'It removes the need for indexes', FALSE, 3),
  ('03300000-0000-4000-8000-000000001004', '03300000-0000-4000-8000-000000000501', 'It is required by every SQL standard', FALSE, 4),
  -- Q1 (502): logical model
  ('03300000-0000-4000-8000-000000001005', '03300000-0000-4000-8000-000000000502', 'Conceptual', FALSE, 1),
  ('03300000-0000-4000-8000-000000001006', '03300000-0000-4000-8000-000000000502', 'Logical', TRUE,  2),
  ('03300000-0000-4000-8000-000000001007', '03300000-0000-4000-8000-000000000502', 'Physical', FALSE, 3),
  ('03300000-0000-4000-8000-000000001008', '03300000-0000-4000-8000-000000000502', 'Hierarchical', FALSE, 4),
  -- Q1 (503): entity
  ('03300000-0000-4000-8000-000000001009', '03300000-0000-4000-8000-000000000503', 'A distinct thing or concept we need to store', TRUE,  1),
  ('03300000-0000-4000-8000-000000001010', '03300000-0000-4000-8000-000000000503', 'Always identical to a physical table', FALSE, 2),
  ('03300000-0000-4000-8000-000000001011', '03300000-0000-4000-8000-000000000503', 'Another name for a primary key', FALSE, 3),
  ('03300000-0000-4000-8000-000000001012', '03300000-0000-4000-8000-000000000503', 'A database permission rule', FALSE, 4),
  -- Q2 (504): attribute
  ('03300000-0000-4000-8000-000000001013', '03300000-0000-4000-8000-000000000504', 'A property or fact that describes an entity', TRUE,  1),
  ('03300000-0000-4000-8000-000000001014', '03300000-0000-4000-8000-000000000504', 'A row of a table', FALSE, 2),
  ('03300000-0000-4000-8000-000000001015', '03300000-0000-4000-8000-000000000504', 'A link between two tables', FALSE, 3),
  ('03300000-0000-4000-8000-000000001016', '03300000-0000-4000-8000-000000000504', 'A database connection', FALSE, 4),
  -- Q2 (505): crow foot
  ('03300000-0000-4000-8000-000000001017', '03300000-0000-4000-8000-000000000505', 'Exactly one', FALSE, 1),
  ('03300000-0000-4000-8000-000000001018', '03300000-0000-4000-8000-000000000505', 'Zero or one', FALSE, 2),
  ('03300000-0000-4000-8000-000000001019', '03300000-0000-4000-8000-000000000505', 'Many', TRUE,  3),
  ('03300000-0000-4000-8000-000000001020', '03300000-0000-4000-8000-000000000505', 'Optional', FALSE, 4),
  -- Q2 (506): derived attribute
  ('03300000-0000-4000-8000-000000001021', '03300000-0000-4000-8000-000000000506', 'birth_date', FALSE, 1),
  ('03300000-0000-4000-8000-000000001022', '03300000-0000-4000-8000-000000000506', 'age', TRUE,  2),
  ('03300000-0000-4000-8000-000000001023', '03300000-0000-4000-8000-000000000506', 'social_security_number', FALSE, 3),
  ('03300000-0000-4000-8000-000000001024', '03300000-0000-4000-8000-000000000506', 'customer_id', FALSE, 4),
  -- Q3 (507): surrogate key
  ('03300000-0000-4000-8000-000000001025', '03300000-0000-4000-8000-000000000507', 'A system-generated identifier with no business meaning', TRUE,  1),
  ('03300000-0000-4000-8000-000000001026', '03300000-0000-4000-8000-000000000507', 'A key chosen from existing business data', FALSE, 2),
  ('03300000-0000-4000-8000-000000001027', '03300000-0000-4000-8000-000000000507', 'A key made of two or more columns', FALSE, 3),
  ('03300000-0000-4000-8000-000000001028', '03300000-0000-4000-8000-000000000507', 'A key that permits duplicate values', FALSE, 4),
  -- Q3 (508): foreign key
  ('03300000-0000-4000-8000-000000001029', '03300000-0000-4000-8000-000000000508', 'That every column always has a value', FALSE, 1),
  ('03300000-0000-4000-8000-000000001030', '03300000-0000-4000-8000-000000000508', 'That a value matches a row in the referenced table', TRUE,  2),
  ('03300000-0000-4000-8000-000000001031', '03300000-0000-4000-8000-000000000508', 'That values never repeat in a column', FALSE, 3),
  ('03300000-0000-4000-8000-000000001032', '03300000-0000-4000-8000-000000000508', 'That two tables share identical column names', FALSE, 4),
  -- Q3 (509): composite key
  ('03300000-0000-4000-8000-000000001033', '03300000-0000-4000-8000-000000000509', 'A key built from two or more columns', TRUE,  1),
  ('03300000-0000-4000-8000-000000001034', '03300000-0000-4000-8000-000000000509', 'A key that points to two tables', FALSE, 2),
  ('03300000-0000-4000-8000-000000001035', '03300000-0000-4000-8000-000000000509', 'Two primary keys on one table', FALSE, 3),
  ('03300000-0000-4000-8000-000000001036', '03300000-0000-4000-8000-000000000509', 'A key that stores a list of values', FALSE, 4),
  -- Q4 (510): FK placement
  ('03300000-0000-4000-8000-000000001037', '03300000-0000-4000-8000-000000000510', 'On the many side of the relationship', TRUE,  1),
  ('03300000-0000-4000-8000-000000001038', '03300000-0000-4000-8000-000000000510', 'On the one side of the relationship', FALSE, 2),
  ('03300000-0000-4000-8000-000000001039', '03300000-0000-4000-8000-000000000510', 'On both sides', FALSE, 3),
  ('03300000-0000-4000-8000-000000001040', '03300000-0000-4000-8000-000000000510', 'In a separate junction table', FALSE, 4),
  -- Q4 (511): many-to-many
  ('03300000-0000-4000-8000-000000001041', '03300000-0000-4000-8000-000000000511', 'By repeating all rows in one table', FALSE, 1),
  ('03300000-0000-4000-8000-000000001042', '03300000-0000-4000-8000-000000000511', 'With a junction table holding both keys', TRUE,  2),
  ('03300000-0000-4000-8000-000000001043', '03300000-0000-4000-8000-000000000511', 'By adding both foreign keys to both tables', FALSE, 3),
  ('03300000-0000-4000-8000-000000001044', '03300000-0000-4000-8000-000000000511', 'It cannot be represented at all', FALSE, 4),
  -- Q4 (512): cardinality
  ('03300000-0000-4000-8000-000000001045', '03300000-0000-4000-8000-000000000512', 'The number of related occurrences on each side', TRUE,  1),
  ('03300000-0000-4000-8000-000000001046', '03300000-0000-4000-8000-000000000512', 'The data type of a column', FALSE, 2),
  ('03300000-0000-4000-8000-000000001047', '03300000-0000-4000-8000-000000000512', 'The order of columns in a table', FALSE, 3),
  ('03300000-0000-4000-8000-000000001048', '03300000-0000-4000-8000-000000000512', 'The speed of a join', FALSE, 4),
  -- Q5 (513): 1NF violation
  ('03300000-0000-4000-8000-000000001049', '03300000-0000-4000-8000-000000000513', 'A single cell holding a comma-separated list', TRUE,  1),
  ('03300000-0000-4000-8000-000000001050', '03300000-0000-4000-8000-000000000513', 'Every cell holding one atomic value', FALSE, 2),
  ('03300000-0000-4000-8000-000000001051', '03300000-0000-4000-8000-000000000513', 'A column without a default value', FALSE, 3),
  ('03300000-0000-4000-8000-000000001052', '03300000-0000-4000-8000-000000000513', 'An index on the primary key', FALSE, 4),
  -- Q5 (514): 2NF dependency
  ('03300000-0000-4000-8000-000000001053', '03300000-0000-4000-8000-000000000514', 'A transitive dependency', FALSE, 1),
  ('03300000-0000-4000-8000-000000001054', '03300000-0000-4000-8000-000000000514', 'A partial dependency on part of the key', TRUE,  2),
  ('03300000-0000-4000-8000-000000001055', '03300000-0000-4000-8000-000000000514', 'A dependency between two non-key columns', FALSE, 3),
  ('03300000-0000-4000-8000-000000001056', '03300000-0000-4000-8000-000000000514', 'A foreign key dependency', FALSE, 4),
  -- Q5 (515): 1NF prerequisite
  ('03300000-0000-4000-8000-000000001057', '03300000-0000-4000-8000-000000000515', 'First Normal Form', TRUE,  1),
  ('03300000-0000-4000-8000-000000001058', '03300000-0000-4000-8000-000000000515', 'Third Normal Form', FALSE, 2),
  ('03300000-0000-4000-8000-000000001059', '03300000-0000-4000-8000-000000000515', 'Boyce-Codd Normal Form', FALSE, 3),
  ('03300000-0000-4000-8000-000000001060', '03300000-0000-4000-8000-000000000515', 'No form at all', FALSE, 4),
  -- Q6 (516): 3NF dependency
  ('03300000-0000-4000-8000-000000001061', '03300000-0000-4000-8000-000000000516', 'A partial dependency', FALSE, 1),
  ('03300000-0000-4000-8000-000000001062', '03300000-0000-4000-8000-000000000516', 'A composite dependency', FALSE, 2),
  ('03300000-0000-4000-8000-000000001063', '03300000-0000-4000-8000-000000000516', 'A transitive dependency', TRUE,  3),
  ('03300000-0000-4000-8000-000000001064', '03300000-0000-4000-8000-000000000516', 'A candidate key dependency', FALSE, 4),
  -- Q6 (517): BCNF determinant
  ('03300000-0000-4000-8000-000000001065', '03300000-0000-4000-8000-000000000517', 'A foreign key', FALSE, 1),
  ('03300000-0000-4000-8000-000000001066', '03300000-0000-4000-8000-000000000517', 'A nullable column', FALSE, 2),
  ('03300000-0000-4000-8000-000000001067', '03300000-0000-4000-8000-000000000517', 'A candidate key', TRUE,  3),
  ('03300000-0000-4000-8000-000000001068', '03300000-0000-4000-8000-000000000517', 'A fixed literal value', FALSE, 4),
  -- Q6 (518): stricter than 3NF
  ('03300000-0000-4000-8000-000000001069', '03300000-0000-4000-8000-000000000518', '1NF', FALSE, 1),
  ('03300000-0000-4000-8000-000000001070', '03300000-0000-4000-8000-000000000518', '2NF', FALSE, 2),
  ('03300000-0000-4000-8000-000000001071', '03300000-0000-4000-8000-000000000518', 'BCNF', TRUE,  3),
  ('03300000-0000-4000-8000-000000001072', '03300000-0000-4000-8000-000000000518', '0NF', FALSE, 4),
  -- Q7 (519): denormalization justification
  ('03300000-0000-4000-8000-000000001073', '03300000-0000-4000-8000-000000000519', 'When frequent reads suffer from expensive joins', TRUE,  1),
  ('03300000-0000-4000-8000-000000001074', '03300000-0000-4000-8000-000000000519', 'When writes must be perfectly duplicate-free', FALSE, 2),
  ('03300000-0000-4000-8000-000000001075', '03300000-0000-4000-8000-000000000519', 'When the schema is brand new and unproven', FALSE, 3),
  ('03300000-0000-4000-8000-000000001076', '03300000-0000-4000-8000-000000000519', 'When the whole system has one table', FALSE, 4),
  -- Q7 (520): denormalization cost
  ('03300000-0000-4000-8000-000000001077', '03300000-0000-4000-8000-000000000520', 'Slower index lookups', FALSE, 1),
  ('03300000-0000-4000-8000-000000001078', '03300000-0000-4000-8000-000000000520', 'Redundant data that can become inconsistent', TRUE,  2),
  ('03300000-0000-4000-8000-000000001079', '03300000-0000-4000-8000-000000000520', 'Loss of every primary key', FALSE, 3),
  ('03300000-0000-4000-8000-000000001080', '03300000-0000-4000-8000-000000000520', 'Mandatory encryption', FALSE, 4),
  -- Q7 (521): denormalization technique
  ('03300000-0000-4000-8000-000000001081', '03300000-0000-4000-8000-000000000521', 'Adding a CHECK constraint', FALSE, 1),
  ('03300000-0000-4000-8000-000000001082', '03300000-0000-4000-8000-000000000521', 'Splitting a table by 3NF rules', FALSE, 2),
  ('03300000-0000-4000-8000-000000001083', '03300000-0000-4000-8000-000000000521', 'Storing a precomputed summary value on a row', TRUE,  3),
  ('03300000-0000-4000-8000-000000001084', '03300000-0000-4000-8000-000000000521', 'Making every column nullable', FALSE, 4),
  -- Q8 (522): unique
  ('03300000-0000-4000-8000-000000001085', '03300000-0000-4000-8000-000000000522', 'CHECK', FALSE, 1),
  ('03300000-0000-4000-8000-000000001086', '03300000-0000-4000-8000-000000000522', 'UNIQUE', TRUE,  2),
  ('03300000-0000-4000-8000-000000001087', '03300000-0000-4000-8000-000000000522', 'NOT NULL', FALSE, 3),
  ('03300000-0000-4000-8000-000000001088', '03300000-0000-4000-8000-000000000522', 'DEFAULT', FALSE, 4),
  -- Q8 (523): check
  ('03300000-0000-4000-8000-000000001089', '03300000-0000-4000-8000-000000000523', 'That a value appears in another table', FALSE, 1),
  ('03300000-0000-4000-8000-000000001090', '03300000-0000-4000-8000-000000000523', 'That a column is never updated', FALSE, 2),
  ('03300000-0000-4000-8000-000000001091', '03300000-0000-4000-8000-000000000523', 'That values satisfy a given condition', TRUE,  3),
  ('03300000-0000-4000-8000-000000001092', '03300000-0000-4000-8000-000000000523', 'That two columns are always equal', FALSE, 4),
  -- Q8 (524): foreign key
  ('03300000-0000-4000-8000-000000001093', '03300000-0000-4000-8000-000000000524', 'FOREIGN KEY', TRUE,  1),
  ('03300000-0000-4000-8000-000000001094', '03300000-0000-4000-8000-000000000524', 'NOT NULL', FALSE, 2),
  ('03300000-0000-4000-8000-000000001095', '03300000-0000-4000-8000-000000000524', 'CHECK', FALSE, 3),
  ('03300000-0000-4000-8000-000000001096', '03300000-0000-4000-8000-000000000524', 'DEFAULT', FALSE, 4),
  -- Q9 (525): first step
  ('03300000-0000-4000-8000-000000001097', '03300000-0000-4000-8000-000000000525', 'Gather and clarify the requirements', TRUE,  1),
  ('03300000-0000-4000-8000-000000001098', '03300000-0000-4000-8000-000000000525', 'Write the CREATE TABLE statements', FALSE, 2),
  ('03300000-0000-4000-8000-000000001099', '03300000-0000-4000-8000-000000000525', 'Add indexes everywhere', FALSE, 3),
  ('03300000-0000-4000-8000-000000001100', '03300000-0000-4000-8000-000000000525', 'Denormalize every table', FALSE, 4),
  -- Q9 (526): normalization goal
  ('03300000-0000-4000-8000-000000001101', '03300000-0000-4000-8000-000000000526', 'Query speed', FALSE, 1),
  ('03300000-0000-4000-8000-000000001102', '03300000-0000-4000-8000-000000000526', 'Redundancy and update anomalies', TRUE,  2),
  ('03300000-0000-4000-8000-000000001103', '03300000-0000-4000-8000-000000000526', 'The number of tables', FALSE, 3),
  ('03300000-0000-4000-8000-000000001104', '03300000-0000-4000-8000-000000000526', 'The size of the indexes', FALSE, 4),
  -- Q9 (527): star schema dimensions
  ('03300000-0000-4000-8000-000000001105', '03300000-0000-4000-8000-000000000527', 'Fact tables', FALSE, 1),
  ('03300000-0000-4000-8000-000000001106', '03300000-0000-4000-8000-000000000527', 'Dimension tables', TRUE,  2),
  ('03300000-0000-4000-8000-000000001107', '03300000-0000-4000-8000-000000000527', 'Junction tables', FALSE, 3),
  ('03300000-0000-4000-8000-000000001108', '03300000-0000-4000-8000-000000000527', 'Sequence tables', FALSE, 4),
  -- Q9 (528): no meaning key
  ('03300000-0000-4000-8000-000000001109', '03300000-0000-4000-8000-000000000528', 'Natural key', FALSE, 1),
  ('03300000-0000-4000-8000-000000001110', '03300000-0000-4000-8000-000000000528', 'Business key', FALSE, 2),
  ('03300000-0000-4000-8000-000000001111', '03300000-0000-4000-8000-000000000528', 'Surrogate key', TRUE,  3),
  ('03300000-0000-4000-8000-000000001112', '03300000-0000-4000-8000-000000000528', 'Foreign key', FALSE, 4),
  -- Q9 (529): FK in 1:N
  ('03300000-0000-4000-8000-000000001113', '03300000-0000-4000-8000-000000000529', 'In the child table on the many side', TRUE,  1),
  ('03300000-0000-4000-8000-000000001114', '03300000-0000-4000-8000-000000000529', 'In the parent table on the one side', FALSE, 2),
  ('03300000-0000-4000-8000-000000001115', '03300000-0000-4000-8000-000000000529', 'In a dedicated third table', FALSE, 3),
  ('03300000-0000-4000-8000-000000001116', '03300000-0000-4000-8000-000000000529', 'Nowhere; the relationship stays implicit', FALSE, 4)
ON CONFLICT (id) DO NOTHING;
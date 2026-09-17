-- ============================================================================
-- SEED 041: Complete course — "MongoDB & NoSQL Databases"
-- ----------------------------------------------------------------------------
-- Instructor : Anita Patel       (10000000-0000-4000-8000-000000000003)
-- Category   : Database & Administration (20000000-0000-4000-8000-000000000008)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED · Position 39
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 NoSQL & the Document Model  → C1 NoSQL Categories · C2 The Document Model
--   M2 MongoDB CRUD                → C3 Creating & Reading · C4 Updating & Deleting
--   M3 Queries, Aggregation & Indexes → C5 Query Operators & Projections · C6 Aggregation & Indexes
--   M4 Schema Design & Distributed Data → C7 Schema Design & Embedding · C8 Replica Sets & Sharding
--   M5 Operations & Choosing a Database → C9 Administration & Backups · C10 Choosing the Right Database
--
-- Content: 19 TEXT lessons with lesson_contents (self-contained HTML + inline
-- CSS, dollar-quoted so apostrophes need no escaping) and 9 QUIZ lessons with
-- 29 questions / 116 options across quizzes + `quizzes` and `quiz_options`.
-- Lessons 303, 306, 309, 312, 315, 318, 321, and 324 are short quizzes (3
-- questions each); lesson 328 is the final assessment (5 questions).
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
  '02900000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000003',
  '20000000-0000-4000-8000-000000000008',
  'MongoDB & NoSQL Databases',
  'mongodb-and-nosql-databases',
  'Explore the document database era. Survey the NoSQL landscape and the CAP theorem, master MongoDB CRUD and the aggregation pipeline, design schemas with embedding and referencing, and learn replication, sharding, backups, and how to choose the right database for your next project.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  39
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('02900000-0000-4000-8000-000000000011', '02900000-0000-4000-8000-000000000001', 'Explain the NoSQL landscape and compare document, key-value, wide-column, and graph stores.', 1),
  ('02900000-0000-4000-8000-000000000012', '02900000-0000-4000-8000-000000000001', 'Perform full MongoDB CRUD with query operators, projections, sorting, and pagination.',         2),
  ('02900000-0000-4000-8000-000000000013', '02900000-0000-4000-8000-000000000001', 'Build aggregation pipelines and use indexes to keep queries fast and predictable.',             3),
  ('02900000-0000-4000-8000-000000000014', '02900000-0000-4000-8000-000000000001', 'Design document schemas with embedding and referencing that match real access patterns.',       4),
  ('02900000-0000-4000-8000-000000000015', '02900000-0000-4000-8000-000000000001', 'Plan replica sets, sharding, and backups, and choose the right database for a project.',       5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('02900000-0000-4000-8000-000000000101', '02900000-0000-4000-8000-000000000001', 1, 'NoSQL & the Document Model',        'The landscape, categories, and the document data model.',              'PUBLISHED'),
  ('02900000-0000-4000-8000-000000000102', '02900000-0000-4000-8000-000000000001', 2, 'MongoDB CRUD',                      'Create, read, update, and delete documents with confidence.',          'PUBLISHED'),
  ('02900000-0000-4000-8000-000000000103', '02900000-0000-4000-8000-000000000001', 3, 'Queries, Aggregation & Indexes',    'Filter data precisely, aggregate it, and keep every query fast.',      'PUBLISHED'),
  ('02900000-0000-4000-8000-000000000104', '02900000-0000-4000-8000-000000000001', 4, 'Schema Design & Distributed Data',  'Model documents well, then replicate for availability and shard for scale.', 'PUBLISHED'),
  ('02900000-0000-4000-8000-000000000105', '02900000-0000-4000-8000-000000000001', 5, 'Operations & Choosing a Database',  'Administration, backups, and a framework for the right database.',     'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('02900000-0000-4000-8000-000000000201', '02900000-0000-4000-8000-000000000101', 1, 'NoSQL Categories',              'NoSQL categories and when each fits a workload.',          'PUBLISHED'),
  ('02900000-0000-4000-8000-000000000202', '02900000-0000-4000-8000-000000000101', 2, 'The Document Model',            'Documents, BSON, collections, and the document data model.', 'PUBLISHED'),
  ('02900000-0000-4000-8000-000000000203', '02900000-0000-4000-8000-000000000102', 1, 'Creating & Reading Documents',  'Insert documents and find them again.',                     'PUBLISHED'),
  ('02900000-0000-4000-8000-000000000204', '02900000-0000-4000-8000-000000000102', 2, 'Updating & Deleting Documents', 'Change and remove data safely and predictably.',            'PUBLISHED'),
  ('02900000-0000-4000-8000-000000000205', '02900000-0000-4000-8000-000000000103', 1, 'Query Operators & Projections', 'Comparison operators, projections, sorting, and pagination.', 'PUBLISHED'),
  ('02900000-0000-4000-8000-000000000206', '02900000-0000-4000-8000-000000000103', 2, 'Aggregation & Indexes',        'Aggregate data with the pipeline and accelerate queries with indexes.', 'PUBLISHED'),
  ('02900000-0000-4000-8000-000000000207', '02900000-0000-4000-8000-000000000104', 1, 'Schema Design & Embedding',    'Embed and reference data to match real access patterns.',     'PUBLISHED'),
  ('02900000-0000-4000-8000-000000000208', '02900000-0000-4000-8000-000000000104', 2, 'Replica Sets & Sharding',      'Replicate for availability and shard for horizontal scale.',   'PUBLISHED'),
  ('02900000-0000-4000-8000-000000000209', '02900000-0000-4000-8000-000000000105', 1, 'Administration & Backups',     'Users, roles, monitoring, and backup strategies.',            'PUBLISHED'),
  ('02900000-0000-4000-8000-000000000210', '02900000-0000-4000-8000-000000000105', 2, 'Choosing the Right Database',  'A decision framework plus the course capstone.',              'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 02900000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('02900000-0000-4000-8000-000000000301', '02900000-0000-4000-8000-000000000201', 1, 'What is NoSQL?',                    'Understand why NoSQL databases exist and the tradeoffs they make.',    'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02900000-0000-4000-8000-000000000302', '02900000-0000-4000-8000-000000000201', 2, 'NoSQL Database Categories',          'Compare document, key-value, wide-column, and graph stores.',          'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02900000-0000-4000-8000-000000000303', '02900000-0000-4000-8000-000000000201', 3, 'NoSQL Basics Quiz',                  'Check your understanding of NoSQL fundamentals.',                       'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02900000-0000-4000-8000-000000000304', '02900000-0000-4000-8000-000000000202', 1, 'The Document Model',                 'Explore documents, fields, and the _id identifier.',                   'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02900000-0000-4000-8000-000000000305', '02900000-0000-4000-8000-000000000202', 2, 'JSON, BSON & Collections',           'See how documents are stored and where they live.',                    'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02900000-0000-4000-8000-000000000306', '02900000-0000-4000-8000-000000000202', 3, 'Document Model Quiz',                'Verify your grasp of the document data model.',                        'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02900000-0000-4000-8000-000000000307', '02900000-0000-4000-8000-000000000203', 1, 'Inserting Documents',                'Add single and multiple documents with insertOne and insertMany.',      'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02900000-0000-4000-8000-000000000308', '02900000-0000-4000-8000-000000000203', 2, 'Reading with find()',                'Query documents and work with the cursor they return.',                'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02900000-0000-4000-8000-000000000309', '02900000-0000-4000-8000-000000000203', 3, 'Insert & Query Quiz',                'Test your create and read skills.',                                     'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02900000-0000-4000-8000-000000000310', '02900000-0000-4000-8000-000000000204', 1, 'Updating Documents',                 'Change fields with updateOne, updateMany, and update operators.',       'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02900000-0000-4000-8000-000000000311', '02900000-0000-4000-8000-000000000204', 2, 'Deleting Documents',                 'Remove documents and collections while managing references.',           'TEXT',  'PUBLISHED', 'FREE', 10, 8),
  ('02900000-0000-4000-8000-000000000312', '02900000-0000-4000-8000-000000000204', 3, 'Update & Delete Quiz',               'Check your update and delete knowledge.',                               'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02900000-0000-4000-8000-000000000313', '02900000-0000-4000-8000-000000000205', 1, 'Query Operators & Filters',          'Match documents with comparison and logical operators.',                'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02900000-0000-4000-8000-000000000314', '02900000-0000-4000-8000-000000000205', 2, 'Projections, Sorting & Pagination',  'Reshape results, order them, and page through large results.',          'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02900000-0000-4000-8000-000000000315', '02900000-0000-4000-8000-000000000205', 3, 'Query Operators Quiz',               'Test your precision with query filters.',                               'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02900000-0000-4000-8000-000000000316', '02900000-0000-4000-8000-000000000206', 1, 'The Aggregation Pipeline',           'Compose stages to group, count, and summarize data.',                  'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02900000-0000-4000-8000-000000000317', '02900000-0000-4000-8000-000000000206', 2, 'Indexes & Query Performance',        'Speed up reads with single, compound, unique, and TTL indexes.',        'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02900000-0000-4000-8000-000000000318', '02900000-0000-4000-8000-000000000206', 3, 'Aggregation & Indexes Quiz',         'Verify your pipeline and index knowledge.',                             'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02900000-0000-4000-8000-000000000319', '02900000-0000-4000-8000-000000000207', 1, 'Embedding vs Referencing',           'Decide when to nest data inside a document and when to link by id.',    'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02900000-0000-4000-8000-000000000320', '02900000-0000-4000-8000-000000000207', 2, 'Data Modeling Tradeoffs',            'Balance access patterns, cardinality, denormalization, and consistency.', 'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02900000-0000-4000-8000-000000000321', '02900000-0000-4000-8000-000000000207', 3, 'Schema Design Quiz',                 'Check your data modeling judgment.',                                    'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02900000-0000-4000-8000-000000000322', '02900000-0000-4000-8000-000000000208', 1, 'Replica Sets',                       'Provide high availability with automatic failover.',                    'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02900000-0000-4000-8000-000000000323', '02900000-0000-4000-8000-000000000208', 2, 'Sharding & Horizontal Scaling',      'Split data across servers with a well-chosen shard key.',              'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02900000-0000-4000-8000-000000000324', '02900000-0000-4000-8000-000000000208', 3, 'Replication & Sharding Quiz',        'Test your distributed database knowledge.',                             'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02900000-0000-4000-8000-000000000325', '02900000-0000-4000-8000-000000000209', 1, 'MongoDB Administration',             'Manage users, roles, authentication, and monitoring.',                 'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02900000-0000-4000-8000-000000000326', '02900000-0000-4000-8000-000000000209', 2, 'Backups & Recovery',                 'Plan logical and file-based backups plus a tested restore path.',       'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02900000-0000-4000-8000-000000000327', '02900000-0000-4000-8000-000000000210', 1, 'Choosing the Right Database',        'Apply a decision framework and design the capstone catalog.',           'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02900000-0000-4000-8000-000000000328', '02900000-0000-4000-8000-000000000210', 2, 'Final Assessment',                   'Prove what you learned across the whole course.',                       'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 02900000-…-0401 .. 0427)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '02900000-0000-4000-8000-000000000401',
  '02900000-0000-4000-8000-000000000301',
  1,
  'What is NoSQL?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What is NoSQL?</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #16a34a; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdf4; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #16a34a; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #4ade80; }
.dark .lesson-page .ic { background: #14532d; color: #86efac; }
.dark .lesson-page .callout { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #14532d; color: #86efac; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>What is NoSQL?</h1>
  <p>For four decades the relational database was the default choice for almost every application. Tables, rows, and SQL served e-commerce, banking, and ERPs well. Then the web went global, mobile apps multiplied, and data started arriving in shapes that did not look like rows in a spreadsheet: social feeds, sensor readings, shopping carts, and JSON payloads passed between APIs.</p>
  <p><strong>NoSQL</strong> is an umbrella term for databases that deliberately move away from the rigid table-and-join model. Instead of forcing data into a schema up front, they store records as flexible self-describing documents, key-value pairs, wide rows, or graphs.</p>
  <h2>Why the shift?</h2>
  <ul>
    <li><strong>Volume and velocity</strong> — millions of writes per second exceed a single relational server.</li>
    <li><strong>Flexible data</strong> — nested, JSON-shaped data maps directly onto documents, not onto joined tables.</li>
    <li><strong>Horizontal scale</strong> — NoSQL systems spread data across many cheap servers instead of one large machine.</li>
    <li><strong>Agile development</strong> — documents can change shape without expensive <span class="ic">ALTER TABLE</span> migrations.</li>
  </ul>
  <h2>The CAP theorem</h2>
  <p>Distributed databases must trade off three guarantees. Under a network partition you can serve <em>consistency</em> or <em>availability</em> well, but not both — you choose which to sacrifice.</p>
  <table>
    <tr><th>Guarantee</th><th>Meaning</th></tr>
    <tr><td>Consistency</td><td>Every read returns the latest written value.</td></tr>
    <tr><td>Availability</td><td>Every request gets a response, even with stale data.</td></tr>
    <tr><td>Partition tolerance</td><td>The system keeps working when nodes lose contact.</td></tr>
  </table>
  <p>MongoDB is <strong>CP-tolerant</strong> at the primary level (reads agree on one source of truth) while offering configurable read and write concerns — a worldview this course explores in later modules.</p>
  <h2>When relational still wins</h2>
  <ul>
    <li>Heavy multi-entity joins and ad-hoc reporting.</li>
    <li>Strong transactional guarantees across many documents.</li>
    <li>Stable schemas that rarely change.</li>
  </ul>
  <div class="callout">
    <strong>Umbrella term</strong>
    <p>The word NoSQL is fuzzy. It originally meant "not SQL" and later became "not only SQL" as databases learned to offer both worlds. What matters is the data model, not the slogan.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Get set up</strong>
    <p>Install MongoDB Community Edition and the <span class="ic">mongosh</span> shell. Every example in this course runs in <span class="ic">mongosh</span>, so you can follow along as you read.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02900000-0000-4000-8000-000000000402',
  '02900000-0000-4000-8000-000000000302',
  1,
  'NoSQL Database Categories',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NoSQL Database Categories</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #16a34a; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdf4; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #16a34a; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #4ade80; }
.dark .lesson-page .ic { background: #14532d; color: #86efac; }
.dark .lesson-page .callout { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #14532d; color: #86efac; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>NoSQL Database Categories</h1>
  <p>NoSQL databases split into four broad families, each optimized for a different shape of data and a different set of queries. Choosing the family is the first decision you make before you ever write a query.</p>
  <table>
    <tr><th>Category</th><th>Examples</th><th>Data shape</th><th>Best for</th></tr>
    <tr><td>Document</td><td>MongoDB, CouchDB</td><td>JSON-like documents</td><td>Rich entities, flexible schemas</td></tr>
    <tr><td>Key-value</td><td>Redis, DynamoDB</td><td>Key with a value</td><td>Caching, sessions, fast lookups</td></tr>
    <tr><td>Wide-column</td><td>Cassandra, HBase</td><td>Rows with many columns</td><td>High-volume time-series</td></tr>
    <tr><td>Graph</td><td>Neo4j, Amazon Neptune</td><td>Nodes and edges</td><td>Relationships, recommendation</td></tr>
  </table>
  <h2>Document stores</h2>
  <p>A document store keeps whole, self-describing records. Related data is usually nested inside one document, so a single read returns everything the screen needs — no joins required. Flexible field sets mean you can evolve a model release by release.</p>
  <h2>Key-value stores</h2>
  <p>Every item is an opaque value addressed by a key. Because the lookup path is razor thin, these stores deliver microsecond latency — the secret behind caches and session stores. You trade query flexibility for raw speed.</p>
  <h2>Wide-column stores</h2>
  <p>Rows can have millions of columns and each row may differ. Data is sorted by a partition key, which makes scanning time-ranges fast. Cassandra writes are designed to survive node failures gracefully.</p>
  <h2>Graph databases</h2>
  <p>In a graph store the relationship IS the data. Queries walk node-to-edge-to-node, which makes "friends of friends" or "shortest path" problems natural and fast — things relational queries express painfully.</p>
  <div class="callout callout-info">
    <strong>Polyglot persistence</strong>
    <p>Modern teams often run several stores side by side — MongoDB for the catalog, Redis for the hot cache, PostgreSQL for financial records. The right tool is the one that matches each workload, not one universal database.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Course focus</strong>
    <p>This course dives deep into the document family through MongoDB. The decision skills you build apply to every category — you will revisit that at the end in "Choosing the Right Database".</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02900000-0000-4000-8000-000000000404',
  '02900000-0000-4000-8000-000000000304',
  1,
  'The Document Model',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Document Model</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #16a34a; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdf4; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #16a34a; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #4ade80; }
.dark .lesson-page .ic { background: #14532d; color: #86efac; }
.dark .lesson-page .callout { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #14532d; color: #86efac; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>The Document Model</h1>
  <p>A <strong>document</strong> is the unit of storage in MongoDB. It is a JSON-like record of field-value pairs, and unlike a spreadsheet row it can nest objects and arrays to any depth:</p>
  <pre class="code-block">{
  _id: ObjectId('65a1b2c3d4e5f60718293a4b'),
  name: 'Mountain Trail Running Shoe',
  category: 'Footwear',
  price: 99.99,
  inStock: true,
  sizes: [39, 40, 41, 42],
  brand: { name: 'Summit', origin: 'DE' }
}</pre>
  <h2>Self-describing data</h2>
  <p>Each document carries its own "schema" with it. Nothing outside the document declares which fields exist, which types the fields hold, or which fields are optional. That has two big consequences:</p>
  <ul>
    <li>You can store two products with different fields in the same collection.</li>
    <li>Evolving your model is a code change, not a migration project.</li>
  </ul>
  <h2>The _id field</h2>
  <p>Every document requires a unique <span class="ic">_id</span>. If you do not supply one, MongoDB generates an <span class="ic">ObjectId</span> — a 12-byte value: a 4-byte timestamp, a 5-byte random value, and a 3-byte counter. You can use any value you like as <span class="ic">_id</span>, as long as it stays unique within the collection.</p>
  <table>
    <tr><th>Field</th><th>Example</th><th>Notes</th></tr>
    <tr><td>string</td><td>'Hello'</td><td>UTF-8 text</td></tr>
    <tr><td>number</td><td>99.99</td><td>Double by default</td></tr>
    <tr><td>boolean</td><td>true</td><td>true / false</td></tr>
    <tr><td>array</td><td>[1, 2, 3]</td><td>Ordered list</td></tr>
    <tr><td>document</td><td>{ name: 'Summit' }</td><td>Nested object</td></tr>
    <tr><td>null</td><td>null</td><td>No value</td></tr>
  </table>
  <div class="callout">
    <strong>No schema does not mean no design</strong>
    <p>Schema-flexible collections still benefit from careful modeling. Later modules teach you how to design documents deliberately — flexibility is a feature you control, not an accident.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Size matters</strong>
    <p>A single BSON document cannot exceed 16 MB. That limit forces good judgment about how much data a document should own — you will see why in the schema design module.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02900000-0000-4000-8000-000000000405',
  '02900000-0000-4000-8000-000000000305',
  1,
  'JSON, BSON & Collections',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JSON, BSON & Collections</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #16a34a; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdf4; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #16a34a; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #4ade80; }
.dark .lesson-page .ic { background: #14532d; color: #86efac; }
.dark .lesson-page .callout { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #14532d; color: #86efac; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>JSON, BSON &amp; Collections</h1>
  <p>Documents travel the world as <strong>JSON</strong> — the lightweight format every API speaks. Inside MongoDB they live as <strong>BSON</strong>, a binary serialization that adds types JSON does not have.</p>
  <h2>JSON recap</h2>
  <pre class="code-block">{
  "sku": "SHOE-100",
  "name": "Trail Runner",
  "price": 99.99,
  "onSale": false
}</pre>
  <ul>
    <li>Keys must be double-quoted strings.</li>
    <li>Trailing commas are not allowed.</li>
    <li>Only text, numbers, booleans, null, arrays, and objects.</li>
  </ul>
  <h2>What BSON adds</h2>
  <p>BSON keeps JSON documents but encodes extra types so the database can sort, compare, and index them correctly:</p>
  <table>
    <tr><th>BSON type</th><th>Purpose</th></tr>
    <tr><td>ObjectId</td><td>12-byte unique identifier</td></tr>
    <tr><td>Date</td><td>UTC milliseconds</td></tr>
    <tr><td>Int32 / Int64</td><td>Fixed-size integers</td></tr>
    <tr><td>Decimal128</td><td>Exact decimals for money</td></tr>
    <tr><td>Binary</td><td>Raw bytes, images, crypto keys</td></tr>
    <tr><td>MinKey / MaxKey</td><td>Lowest / highest sort values</td></tr>
  </table>
  <p>When you insert a document with a driver, it expects JavaScript objects for many types and converts them to BSON under the hood.</p>
  <h2>Databases and collections</h2>
  <p>A MongoDB deployment holds one or more <strong>databases</strong>. Each database holds one or more <strong>collections</strong>. A collection is a group of documents — the closest cousin of a relational table, minus the fixed schema. In <span class="ic">mongosh</span>:</p>
  <pre class="code-block">show dbs
use shop
db.products.insertOne({ sku: 'SHOE-100', name: 'Trail Runner' })
show collections</pre>
  <div class="callout callout-info">
    <strong>Lazy creation</strong>
    <p>Neither databases nor collections need to be created up front. The first write to <span class="ic">db.products</span> creates both automatically.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Naming</strong>
    <p>Keep collection names plural and descriptive — <span class="ic">products</span>, <span class="ic">orders</span> — and use dot notation for grouping like <span class="ic">shop.orders</span>.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02900000-0000-4000-8000-000000000407',
  '02900000-0000-4000-8000-000000000307',
  1,
  'Inserting Documents',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Inserting Documents</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #16a34a; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdf4; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #16a34a; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #4ade80; }
.dark .lesson-page .ic { background: #14532d; color: #86efac; }
.dark .lesson-page .callout { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #14532d; color: #86efac; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Inserting Documents</h1>
  <p>Creating data is the first CRUD letter. MongoDB has two insert methods, one for a single document and one for a batch.</p>
  <h2>insertOne</h2>
  <pre class="code-block">db.products.insertOne({
  sku: 'SHOE-100',
  name: 'Trail Runner',
  price: 99.99,
  category: 'Footwear',
  tags: ['running', 'trail']
})</pre>
  <p>The result reports the generated identifier alongside a write acknowledgement:</p>
  <pre class="code-block">{
  acknowledged: true,
  insertedId: ObjectId('65a1...')
}</pre>
  <h2>insertMany</h2>
  <p>When loading a batch, prefer <span class="ic">insertMany</span> to a loop of single inserts — one round trip instead of dozens:</p>
  <pre class="code-block">db.products.insertMany([
  { sku: 'SHOE-200', name: 'City Runner', price: 79.99 },
  { sku: 'SHOE-300', name: 'Summit Boot', price: 149.99 }
])</pre>
  <h2>Ordering and failure</h2>
  <ul>
    <li>By default the batch stops at the first error and earlier inserts remain.</li>
    <li>With <span class="ic">ordered: false</span> MongoDB attempts every insert and reports the failures.</li>
  </ul>
  <pre class="code-block">db.products.insertMany(docs, { ordered: false })</pre>
  <h2>Supplying your own _id</h2>
  <p>You may set <span class="ic">_id</span> yourself, which is handy when natural keys exist (an SKU, an email). Uniqueness is enforced by an automatic index on <span class="ic">_id</span>.</p>
  <div class="callout">
    <strong>Let Mongo generate by default</strong>
    <p>Keep the auto-generated <span class="ic">ObjectId</span> unless you really need a natural key. Natural keys hide assumptions — emails change, SKUs get renumbered.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Validate before you insert</strong>
    <p>MongoDB stores what you hand it. Garbage fields, misspelled names, and wrong types all persist happily — so build validators into your application layer.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02900000-0000-4000-8000-000000000408',
  '02900000-0000-4000-8000-000000000308',
  1,
  'Reading with find()',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reading with find()</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #16a34a; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdf4; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #16a34a; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #4ade80; }
.dark .lesson-page .ic { background: #14532d; color: #86efac; }
.dark .lesson-page .callout { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #14532d; color: #86efac; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Reading with find()</h1>
  <p><span class="ic">find()</span> is the workhorse read query. Pass a filter object and MongoDB returns a <strong>cursor</strong> — a lazy handle to the matching documents that you can iterate, count, sort, or limit.</p>
  <h2>Basic equality</h2>
  <pre class="code-block">db.products.find({ category: 'Footwear' })

db.products.find({ price: 99.99 })

db.products.find({})   // every document</pre>
  <h2>findOne</h2>
  <p>When a query should return a single document, use <span class="ic">findOne</span> — ideal for detail pages and key lookups:</p>
  <pre class="code-block">db.products.findOne({ sku: 'SHOE-100' })</pre>
  <h2>Working with the cursor</h2>
  <p>The cursor supports method chaining and is executed lazily:</p>
  <pre class="code-block">const cursor = db.products.find({ category: 'Footwear' });

cursor.count()        // count of matches — old, prefer countDocuments
cursor.toArray()      // pull everything into memory
cursor.forEach(d =&gt; printjson(d))

cursor.limit(5).sort({ price: 1 })   // chained</pre>
  <h2>Counting</h2>
  <pre class="code-block">db.products.countDocuments({ category: 'Footwear' })

db.products.estimatedDocumentCount()   // fast metadata estimate</pre>
  <div class="callout callout-info">
    <strong>count vs countDocuments</strong>
    <p><span class="ic">countDocuments</span> honors your filter and runs a real query. <span class="ic">estimatedDocumentCount</span> reads collection metadata and ignores filters — huge collections return instantly.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Think in sets</strong>
    <p>The filter object describes a set of documents, not one row. Say what you want, then refine with operators in the next lesson.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02900000-0000-4000-8000-000000000410',
  '02900000-0000-4000-8000-000000000310',
  1,
  'Updating Documents',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Updating Documents</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #16a34a; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdf4; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #16a34a; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #4ade80; }
.dark .lesson-page .ic { background: #14532d; color: #86efac; }
.dark .lesson-page .callout { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #14532d; color: #86efac; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Updating Documents</h1>
  <p>Updates in MongoDB are surgical. Use <span class="ic">updateOne</span> or <span class="ic">updateMany</span> with a <strong>filter</strong> and an <strong>update document</strong> built from operators. Avoid whole-document replacement unless you truly mean it.</p>
  <h2>updateOne with $set</h2>
  <pre class="code-block">db.products.updateOne(
  { sku: 'SHOE-100' },
  { $set: { price: 89.99, updatedAt: new Date() } }
)</pre>
  <h2>updateMany</h2>
  <pre class="code-block">db.products.updateMany(
  { category: 'Footwear', inStock: true },
  { $set: { clearance: true } }
)</pre>
  <h2>Common update operators</h2>
  <table>
    <tr><th>Operator</th><th>Effect</th></tr>
    <tr><td>$set</td><td>Set or overwrite a field</td></tr>
    <tr><td>$unset</td><td>Remove a field</td></tr>
    <tr><td>$inc</td><td>Increment a number</td></tr>
    <tr><td>$rename</td><td>Rename a field</td></tr>
    <tr><td>$push</td><td>Append to an array</td></tr>
    <tr><td>$addToSet</td><td>Append only if absent</td></tr>
    <tr><td>$pop</td><td>Remove first or last array item</td></tr>
    <tr><td>$min / $max</td><td>Set only if lower / higher</td></tr>
  </table>
  <pre class="code-block">db.stock.updateOne(
  { sku: 'SHOE-100' },
  { $inc: { quantity: -2 } }
)

db.products.updateOne(
  { sku: 'SHOE-100' },
  { $addToSet: { tags: 'waterproof' } }
)</pre>
  <h2>Upsert</h2>
  <p>Set <span class="ic">upsert: true</span> to insert the document when nothing matches:</p>
  <pre class="code-block">db.products.updateOne(
  { sku: 'NEW-1' },
  { $set: { name: 'New Item', price: 12.5 } },
  { upsert: true }
)</pre>
  <h2>replaceOne</h2>
  <p><span class="ic">replaceOne</span> swaps the entire document body (keeping <span class="ic">_id</span>). It is handy for clean imports but risky for concurrent writes.</p>
  <div class="callout">
    <strong>Filter first, then repair</strong>
    <p>An empty filter in <span class="ic">updateMany</span> updates every document in the collection. Always double-check your filter — a typo scales your mistake to millions of records.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Prefer operators</strong>
    <p>Operators keep your intent explicit and let MongoDB update only the touched fields, which plays nicely with change streams and indexes.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02900000-0000-4000-8000-000000000411',
  '02900000-0000-4000-8000-000000000311',
  1,
  'Deleting Documents',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Deleting Documents</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #16a34a; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdf4; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #16a34a; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #4ade80; }
.dark .lesson-page .ic { background: #14532d; color: #86efac; }
.dark .lesson-page .callout { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #14532d; color: #86efac; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Deleting Documents</h1>
  <p>Deletion is permanent — there is no undo and no automatic cascade. The safest mindset: query what you intend to remove, then delete.</p>
  <h2>deleteOne</h2>
  <pre class="code-block">db.products.deleteOne({ sku: 'SHOE-300' })</pre>
  <p>The result reports how many documents were removed:</p>
  <pre class="code-block">{
  acknowledged: true,
  deletedCount: 1
}</pre>
  <h2>deleteMany</h2>
  <pre class="code-block">db.products.deleteMany({ category: 'Discontinued' })

db.products.deleteMany({})   // clear everything, keep the collection</pre>
  <h2>Dropping a collection</h2>
  <p>To remove a collection together with its documents and indexes:</p>
  <pre class="code-block">db.products.drop()</pre>
  <h2>No cascades — manage references yourself</h2>
  <p>MongoDB has no foreign keys. If an <span class="ic">order</span> references a product and you delete the product, the order silently keeps a dangling id. Plan for this at design time:</p>
  <ul>
    <li>Embed immutable snapshots (the product name and price at purchase time) inside the order.</li>
    <li>Set the reference field to <span class="ic">null</span> or a tombstone before physical deletion.</li>
    <li>Reindex and clean orphans with a scheduled aggregation job.</li>
  </ul>
  <h2>Soft deletion</h2>
  <p>Many teams never delete business data — they flip an <span class="ic">active: false</span> flag and filter queries. That preserves history, audit trails, and referential integrity at the cost of storage.</p>
  <div class="callout">
    <strong>Caution</strong>
    <p>Test your delete filter on a copy first. A wrongly scoped <span class="ic">deleteMany({})</span> empties a production collection and backs up the phone tree.</p>
  </div>
  <div class="callout callout-tip">
    <strong>TTL for the win</strong>
    <p>For automatic cleanup of session or log data, a TTL index removes expired documents on a schedule — no cron job, no manual deletes. Covered in the indexes lesson.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02900000-0000-4000-8000-000000000413',
  '02900000-0000-4000-8000-000000000313',
  1,
  'Query Operators & Filters',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Query Operators & Filters</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #16a34a; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdf4; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #16a34a; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #4ade80; }
.dark .lesson-page .ic { background: #14532d; color: #86efac; }
.dark .lesson-page .callout { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #14532d; color: #86efac; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Query Operators &amp; Filters</h1>
  <p>Equality matches get you only so far. MongoDB query operators give you ranges, membership, logic, and existence checks — the vocabulary every serious filter is built from.</p>
  <h2>Comparison operators</h2>
  <table>
    <tr><th>Operator</th><th>Meaning</th></tr>
    <tr><td>$eq</td><td>Equals (same as plain equality)</td></tr>
    <tr><td>$ne</td><td>Not equal</td></tr>
    <tr><td>$gt / $gte</td><td>Greater than / or equal</td></tr>
    <tr><td>$lt / $lte</td><td>Less than / or equal</td></tr>
    <tr><td>$in / $nin</td><td>In / not in a list of values</td></tr>
  </table>
  <pre class="code-block">db.products.find({ price: { $gt: 50, $lte: 150 } })

db.products.find({ category: { $in: ['Footwear', 'Apparel'] } })

db.products.find({ inventory: { $ne: 0 } })</pre>
  <h2>Logical operators</h2>
  <p>Fields listed together in one filter combine with an implicit AND. Use <span class="ic">$or</span>, <span class="ic">$and</span>, and <span class="ic">$not</span> for richer combinations:</p>
  <pre class="code-block">db.products.find({
  category: 'Footwear',
  inStock: true
})

db.products.find({
  $or: [ { price: { $lt: 10 } }, { clearance: true } ]
})</pre>
  <h2>Existence and type</h2>
  <pre class="code-block">db.products.find({ discount: { $exists: true } })

db.products.find({ price: { $type: 'decimal' } })</pre>
  <h2>Pattern matching</h2>
  <pre class="code-block">db.products.find({ sku: { $regex: '^SHOE' } })</pre>
  <div class="callout callout-info">
    <strong>Arrays match any element</strong>
    <p>A query on an array field matches a document if any element satisfies it. Equality on <span class="ic">tags: 'running'</span> finds every document whose tags array contains that value.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Explain before you scale</strong>
    <p>Expensive operators like unanchored <span class="ic">$regex</span> force full scans. Check <span class="ic">explain()</span> on hot queries and add indexes — the next chapter shows how.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02900000-0000-4000-8000-000000000414',
  '02900000-0000-4000-8000-000000000314',
  1,
  'Projections, Sorting & Pagination',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Projections, Sorting & Pagination</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #16a34a; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdf4; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #16a34a; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #4ade80; }
.dark .lesson-page .ic { background: #14532d; color: #86efac; }
.dark .lesson-page .callout { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #14532d; color: #86efac; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Projections, Sorting &amp; Pagination</h1>
  <p>Fast reads depend on sending less over the wire and fetching fewer documents than a whole collection holds. Three cursor methods shape that: projection, sort, and skip / limit.</p>
  <h2>Projections</h2>
  <p>Include only the fields a screen needs by passing a second argument of 1 (include) or 0 (exclude). The <span class="ic">_id</span> is included by default and must be excluded explicitly:</p>
  <pre class="code-block">db.products.find(
  { category: 'Footwear' },
  { name: 1, price: 1, _id: 0 }
)</pre>
  <h2>Sorting</h2>
  <p>Sort with 1 for ascending and -1 for descending, chaining several fields:</p>
  <pre class="code-block">db.products.find({ inStock: true })
  .sort({ price: 1, name: -1 })</pre>
  <h2>Paginating with skip and limit</h2>
  <pre class="code-block">// page 3, 20 items per page
db.products.find({})
  .sort({ createdAt: -1 })
  .skip(40)
  .limit(20)</pre>
  <h2>Range-based pagination</h2>
  <p>Deep <span class="ic">skip</span> offsets force MongoDB to walk and discard results — page 1000 is painfully slow. For infinite scroll and stable feeds, paginate by a sort key instead:</p>
  <pre class="code-block">db.products.find({
  createdAt: { $lt: lastSeenAt }
})
  .sort({ createdAt: -1 })
  .limit(20)</pre>
  <div class="callout callout-info">
    <strong>Example: list view</strong>
    <p>Grids rarely need every field. Pair an index-friendly sort with a projection and a limit, and a catalog request that once dragged megabytes now returns a few kilobytes.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Covered queries</strong>
    <p>When a projection touches only indexed fields, MongoDB serves the answer straight from the index without reading documents — the fastest read MongoDB can do. Indexes come next.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02900000-0000-4000-8000-000000000416',
  '02900000-0000-4000-8000-000000000316',
  1,
  'The Aggregation Pipeline',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Aggregation Pipeline</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #16a34a; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdf4; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #16a34a; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #4ade80; }
.dark .lesson-page .ic { background: #14532d; color: #86efac; }
.dark .lesson-page .callout { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #14532d; color: #86efac; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>The Aggregation Pipeline</h1>
  <p>Report-style questions — totals, averages, counts by category — demand more than <span class="ic">find()</span>. The <strong>aggregation pipeline</strong> threads documents through an ordered list of stages, each transforming its input into the next one.</p>
  <h2>A first pipeline</h2>
  <pre class="code-block">db.orders.aggregate([
  { $match: { status: 'delivered' } },
  { $group: {
      _id: '$category',
      total: { $sum: '$amount' },
      avg:   { $avg: '$amount' }
  } },
  { $sort: { total: -1 } },
  { $project: { _id: 0, category: '$_id', total: 1, avg: 1 } }
])</pre>
  <p>Stages run in array order: filter delivered orders, group by category while summing amounts, sort by the total, then reshape the output fields.</p>
  <h2>Common stages</h2>
  <table>
    <tr><th>Stage</th><th>Does what</th></tr>
    <tr><td>$match</td><td>Filters documents early</td></tr>
    <tr><td>$project</td><td>Include / compute / reshape fields</td></tr>
    <tr><td>$group</td><td>Groups by key, runs accumulators</td></tr>
    <tr><td>$sort</td><td>Orders the stream</td></tr>
    <tr><td>$limit / $skip</td><td>Slice the stream</td></tr>
    <tr><td>$unwind</td><td>Flattens an array to one document per element</td></tr>
    <tr><td>$count</td><td>Returns the number of documents</td></tr>
  </table>
  <h2>Accumulator expressions</h2>
  <pre class="code-block">db.orders.aggregate([
  { $group: {
      _id: { year: { $year: '$placedAt' } },
      count: { $sum: 1 },
      revenue: { $sum: '$amount' },
      top:    { $max: '$amount' },
      skus:   { $push: '$sku' }
  } }
])</pre>
  <p>Accumulators include <span class="ic">$sum</span>, <span class="ic">$avg</span>, <span class="ic">$min</span>, <span class="ic">$max</span>, <span class="ic">$first</span>, <span class="ic">$last</span>, <span class="ic">$push</span>, and <span class="ic">$addToSet</span>.</p>
  <h2>Unwinding arrays</h2>
  <pre class="code-block">db.orders.aggregate([
  { $unwind: '$lineItems' },
  { $group: { _id: '$lineItems.sku', sold: { $sum: '$lineItems.qty' } } },
  { $sort: { sold: -1 } },
  { $limit: 10 }
])</pre>
  <div class="callout">
    <strong>Order matters</strong>
    <p>Aggregation is a pipe: the sequence of stages changes the result and the cost. Filter as early as possible so later stages chew less data.</p>
  </div>
  <div class="callout callout-tip">
    <strong>$match uses indexes</strong>
    <p>A <span class="ic">$match</span> at the front of a pipeline can leverage indexes, just like <span class="ic">find()</span>. Put your narrowest filter first and sort-friendly stages early.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02900000-0000-4000-8000-000000000417',
  '02900000-0000-4000-8000-000000000317',
  1,
  'Indexes & Query Performance',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Indexes & Query Performance</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #16a34a; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdf4; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #16a34a; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #4ade80; }
.dark .lesson-page .ic { background: #14532d; color: #86efac; }
.dark .lesson-page .callout { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #14532d; color: #86efac; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Indexes &amp; Query Performance</h1>
  <p>Without an index a query examines every document in order — the dreaded <strong>collection scan</strong>. An index is a lean, sorted structure MongoDB searches in log time, then follows pointers back to documents.</p>
  <h2>Single-field indexes</h2>
  <pre class="code-block">db.products.createIndex({ category: 1 })

db.products.createIndex({ price: -1 })</pre>
  <h2>Compound indexes</h2>
  <p>When queries filter on several fields, build one compound index. Order the fields by selectivity (equality first, then sort keys):</p>
  <pre class="code-block">db.products.createIndex({ category: 1, price: 1 })</pre>
  <p>That single index serves filters on <span class="ic">category</span> alone and on <span class="ic">category + price</span> — the leftmost prefix rule applies.</p>
  <h2>Unique indexes</h2>
  <pre class="code-block">db.products.createIndex({ sku: 1 }, { unique: true })</pre>
  <h2>TTL indexes</h2>
  <p>An index on a date field with <span class="ic">expireAfterSeconds</span> makes MongoDB delete expired documents automatically — perfect for sessions and logs:</p>
  <pre class="code-block">db.sessions.createIndex(
  { lastActiveAt: 1 },
  { expireAfterSeconds: 86400 }
)</pre>
  <h2>Reading the plan</h2>
  <pre class="code-block">db.products.find({ category: 'Footwear', price: { $gt: 40 } })
  .explain('executionStats')</pre>
  <p>Look for <span class="ic">IXSCAN</span> (index used) versus <span class="ic">COLLSCAN</span> (every document read), plus <span class="ic">nReturned</span> and <span class="ic">totalKeysExamined</span>. When the two counts diverge widely, a compound index probably closes the gap.</p>
  <div class="callout">
    <strong>Indexes cost writes</strong>
    <p>Every index doubles the bookkeeping on inserts, updates, and deletes. Index only the query shapes that matter and delete indexes no query uses.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Covered queries</strong>
    <p>If the projection touches only indexed fields, MongoDB answers from the index alone — zero document reads. The fastest query in MongoDB is one that never opens a document.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02900000-0000-4000-8000-000000000419',
  '02900000-0000-4000-8000-000000000319',
  1,
  'Embedding vs Referencing',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Embedding vs Referencing</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #16a34a; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdf4; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #16a34a; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #4ade80; }
.dark .lesson-page .ic { background: #14532d; color: #86efac; }
.dark .lesson-page .callout { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #14532d; color: #86efac; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Embedding vs Referencing</h1>
  <p>Schema design in MongoDB is the art of deciding where related data lives: nested <strong>inside</strong> the document (<em>embedding</em>) or connected <strong>by id</strong> across collections (<em>referencing</em>).</p>
  <h2>Embedding</h2>
  <p>Related data is copied right into the parent. An order keeps its line items, a user keeps its addresses:</p>
  <pre class="code-block">db.orders.insertOne({
  _id: 'ORD-1001',
  customerId: 'CUST-7',
  placedAt: new Date(),
  lineItems: [
    { sku: 'SHOE-100', qty: 1, price: 89.99 },
    { sku: 'SOCKS-4',  qty: 2, price: 9.99 }
  ],
  total: 109.97
})</pre>
  <p>One read returns the whole order — no joins, no second round trip. Updates to the order are atomic: the embedded data changes together.</p>
  <h2>Referencing</h2>
  <p>The document stores an id pointing at another document, and you fetch it when needed:</p>
  <pre class="code-block">db.orders.insertOne({
  _id: 'ORD-1002',
  customerId: 'CUST-7',      // reference into customers
  placedAt: new Date()
})</pre>
  <pre class="code-block">const order  = db.orders.findOne({ _id: 'ORD-1002' });
const customer = db.customers.findOne({ _id: order.customerId });</pre>
  <h2>Choosing by relationship</h2>
  <table>
    <tr><th>Relationship</th><th>Good default</th></tr>
    <tr><td>One-to-one</td><td>Embed</td></tr>
    <tr><td>One-to-few</td><td>Embed (addresses, tags)</td></tr>
    <tr><td>One-to-many</td><td>Reference or embed a bounded list</td></tr>
    <tr><td>One-to-millions</td><td>Reference (posts, events)</td></tr>
  </table>
  <div class="callout">
    <strong>Watch the 16 MB ceiling</strong>
    <p>Arrays grow without bound in documents. The moment a child collection legitimately exceeds a few megabytes, embedding breaks — reference instead.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Model for the access path</strong>
    <p>Ask how the data is actually read. If the screen always shows line items with the order, embedding makes one query do everything. Only split when children are queried independently.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02900000-0000-4000-8000-000000000420',
  '02900000-0000-4000-8000-000000000320',
  1,
  'Data Modeling Tradeoffs',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Data Modeling Tradeoffs</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #16a34a; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdf4; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #16a34a; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #4ade80; }
.dark .lesson-page .ic { background: #14532d; color: #86efac; }
.dark .lesson-page .callout { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #14532d; color: #86efac; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Data Modeling Tradeoffs</h1>
  <p>Document modeling is a balancing act. Every choice trades read speed for write complexity, or consistency for flexibility. A good model is the one tuned to the <em>actual</em> workload.</p>
  <h2>1. Access patterns drive everything</h2>
  <p>Write down the queries your screens will run before designing any document: what is fetched together, how often, and with which filters. The model serves those shapes.</p>
  <h2>2. Cardinality</h2>
  <table>
    <tr><th>Cardinality</th><th>Strategy</th></tr>
    <tr><td>One-to-few</td><td>Embed the child documents</td></tr>
    <tr><td>One-to-many</td><td>Embed a bounded set, or reference</td></tr>
    <tr><td>One-to-millions</td><td>Reference and index the parent id</td></tr>
  </table>
  <h2>3. Denormalization</h2>
  <p>Flattening data into documents for reads is fine — an order snapshot of a product name survives the product being renamed later. The cost is <em>update drift</em>: change the product and you must propagate it. Decide explicit denormalization policy per field:</p>
  <ul>
    <li>Snapshot (price at purchase) — copy once, never sync.</li>
    <li>Referential (shipping address) — update in place or treat as historical.</li>
  </ul>
  <h2>4. Consistency</h2>
  <p>Cross-document atomicity needs multi-document transactions. Without them, a partially failed two-document update leaves inconsistent state. Model so that critical invariants live in <em>one</em> document whenever possible.</p>
  <h2>5. Enforcing shape</h2>
  <p>Schema flexibility is a tool, not a policy. Add a validator so surprises fail early:</p>
  <pre class="code-block">db.products.createCollection({
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      required: ['sku', 'name', 'price'],
      properties: {
        sku:   { bsonType: 'string' },
        price: { bsonType: 'decimal' }
      }
    }
  }
})</pre>
  <div class="callout callout-info">
    <strong>Write-heavy items: count first</strong>
    <p>Embedding item lists lets a wall-clock counter stay correct with one atomic <span class="ic">$inc</span> — versus a separate count query that drifts. Fold the small aggregations you can compute on write.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Model for today, not for the apocalypse</strong>
    <p>Design for the read patterns you have measured, not hypothetical ones. You can migrate documents later; poorly performing production queries are the harder problem.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02900000-0000-4000-8000-000000000422',
  '02900000-0000-4000-8000-000000000322',
  1,
  'Replica Sets',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Replica Sets</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #16a34a; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdf4; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #16a34a; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #4ade80; }
.dark .lesson-page .ic { background: #14532d; color: #86efac; }
.dark .lesson-page .callout { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #14532d; color: #86efac; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Replica Sets</h1>
  <p>A single MongoDB instance is a single point of failure. A <strong>replica set</strong> is a group of nodes holding the same data, providing high availability and automatic failover.</p>
  <h2>Roles</h2>
  <ul>
    <li><strong>Primary</strong> — accepts all writes and applies them to its oplog.</li>
    <li><strong>Secondaries</strong> — apply the oplog continuously and share read load.</li>
    <li><strong>Arbiter</strong> — votes in elections but stores no data.</li>
  </ul>
  <p>If the primary dies, the remaining members hold an election and promote the freshest secondary. Connection strings stay stable — the driver re-routes automatically.</p>
  <h2>The oplog</h2>
  <p>Every write is recorded in the primary <span class="ic">oplog</span>, a capped collection secondaries replay. Replication lag is the time it takes a secondary to catch up; a burned-out cluster leaves lagging members.</p>
  <h2>Write concern</h2>
  <pre class="code-block">db.orders.insertOne(order, { writeConcern: { w: 'majority' } })</pre>
  <table>
    <tr><th>Concern</th><th>Guarantee</th></tr>
    <tr><td>w: 1 (default)</td><td>Primary acknowledges alone</td></tr>
    <tr><td>w: majority</td><td>Most of the set acknowledges</td></tr>
    <tr><td>j: true</td><td>Durability to disk journal</td></tr>
  </table>
  <h2>Read preference</h2>
  <table>
    <tr><th>Preference</th><th>Behavior</th></tr>
    <tr><td>primary</td><td>Reads only from the primary (default)</td></tr>
    <tr><td>primaryPreferred</td><td>Primary, fall back to secondaries</td></tr>
    <tr><td>secondary</td><td>Reads only from secondaries</td></tr>
    <tr><td>secondaryPreferred</td><td>Secondaries first, fallback to primary</td></tr>
    <tr><td>nearest</td><td>Lowest latency member</td></tr>
  </table>
  <h2>Standing it up</h2>
  <pre class="code-block">mongod --replSet rs0 --port 27017
mongosh --port 27017 --eval 'rs.initiate()'</pre>
  <div class="callout">
    <strong>Replication is not a backup</strong>
    <p>A dropped collection replicates everywhere instantly. Replica sets give availability — durable backups live in the next lesson.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Odd numbers win votes</strong>
    <p>Run 3 or 5 data-bearing members so elections have a clear majority. Never back up only the primary; a consistent dump reads the oplog across the set.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02900000-0000-4000-8000-000000000423',
  '02900000-0000-4000-8000-000000000323',
  1,
  'Sharding & Horizontal Scaling',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sharding & Horizontal Scaling</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #16a34a; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdf4; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #16a34a; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #4ade80; }
.dark .lesson-page .ic { background: #14532d; color: #86efac; }
.dark .lesson-page .callout { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #14532d; color: #86efac; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Sharding &amp; Horizontal Scaling</h1>
  <p>When a single machine runs out of disk or CPU, you have two levers: a bigger machine (<em>vertical</em> scale, finite and expensive) or <em>more</em> machines (<em>horizontal</em> scale). <strong>Sharding</strong> is MongoDB horizontal scaling.</p>
  <h2>How a sharded cluster works</h2>
  <ul>
    <li><strong>Shards</strong> — replica sets that each own a slice of the data.</li>
    <li><strong>mongos</strong> — the router every client talks to; routes each query to the right shards.</li>
    <li><strong>Config servers</strong> — hold the cluster metadata and chunk ranges.</li>
  </ul>
  <h2>Chunks and the shard key</h2>
  <p>Documents are distributed by a <span class="ic">shard key</span> — a field (or compound set of fields) present on every document. The cluster splits the key range into <strong>chunks</strong> and balances them across shards:</p>
  <pre class="code-block">sh.enableSharding('shop')
sh.shardCollection(
  'shop.orders',
  { customerId: 1, orderId: 1 }
)</pre>
  <h2>A good shard key</h2>
  <table>
    <tr><th>Quality</th><th>Why it matters</th></tr>
    <tr><td>High cardinality</td><td>Many distinct values mean many chunks</td></tr>
    <tr><td>Even distribution</td><td>No single hot shard owns most of the traffic</td></tr>
    <tr><td>No monotonic growth</td><td>Date-only keys flood one shard</td></tr>
  </table>
  <p>A user-scoped key like <span class="ic">customerId + orderId</span> keeps one customer records together and spreads load across many users.</p>
  <h2>Targeted vs scatter-gather</h2>
  <p>Queries that include the shard key route to one shard (fast). Queries without it hit every shard and merge results (scatter-gather). Design your queries around the shard key where you can.</p>
  <div class="callout">
    <strong>Shard late, shard cautiously</strong>
    <p>Sharding adds operational complexity. Reach it when vertical limits loom — not on day one. The shard key is permanent once chosen, so pick it deliberately.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Replica sets are shard members</strong>
    <p>Every shard is itself a replica set. Availability (replication) and scale (sharding) compose: protect each piece and the whole cluster stays healthy.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02900000-0000-4000-8000-000000000425',
  '02900000-0000-4000-8000-000000000325',
  1,
  'MongoDB Administration',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MongoDB Administration</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #16a34a; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdf4; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #16a34a; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #4ade80; }
.dark .lesson-page .ic { background: #14532d; color: #86efac; }
.dark .lesson-page .callout { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #14532d; color: #86efac; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>MongoDB Administration</h1>
  <p>Operating a MongoDB deployment means controlling who can do what — and knowing what the database is doing before problems become outages. Two pillars: <strong>access control</strong> and <strong>visibility</strong>.</p>
  <h2>Users and roles</h2>
  <p>Users are scoped to a database and hold roles. Create an app user with the least privilege it needs:</p>
  <pre class="code-block">use admin
db.createUser({
  user: 'reporting',
  pwd: 'change-me-now',
  roles: [ { role: 'read', db: 'shop' } ]
})</pre>
  <table>
    <tr><th>Role</th><th>Scope</th><th>Power</th></tr>
    <tr><td>read / readWrite</td><td>Database</td><td>Query / modify data</td></tr>
    <tr><td>dbOwner</td><td>Database</td><td>Admin within one database</td></tr>
    <tr><td>clusterAdmin</td><td>Cluster</td><td>Cluster configuration</td></tr>
  </table>
  <h2>Authentication</h2>
  <p>MongoDB ships with SCRAM (password), and supports x.509 certificates and LDAP/SAML for larger organizations. Enable authorization in the config file:</p>
  <pre class="code-block">security:
  authorization: enabled</pre>
  <h2>Spotting problems</h2>
  <pre class="code-block">mongostat                 // live ops, connections, queue
mongotop                  // time spent per collection
db.currentOp({ 'active': true })  // running operations
db.killOp(opId)           // stop a runaway query
db.runCommand({ serverStatus: 1 })
db.serverStatus().opcounters</pre>
  <p>Watch the queues: a climbing <span class="ic">queued</span> count while reads lag means the primary is saturated — a signal to add indexes before adding iron.</p>
  <h2>Config and logging</h2>
  <pre class="code-block">mongod --config /etc/mongod.conf --logpath /var/log/mongodb/mongod.log</pre>
  <div class="callout">
    <strong>Least privilege</strong>
    <p>Give application connections the narrowest role they need. A leaked readWrite credential on an admin account turns one bug into a full audit.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Monitor before you scale</strong>
    <p>Slow queries with matching COLLSCAN plans are usually a missing index, not a hardware problem. Collect explain plans and fix the schema layer first.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02900000-0000-4000-8000-000000000426',
  '02900000-0000-4000-8000-000000000326',
  1,
  'Backups & Recovery',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Backups & Recovery</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #16a34a; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdf4; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #16a34a; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #4ade80; }
.dark .lesson-page .ic { background: #14532d; color: #86efac; }
.dark .lesson-page .callout { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #14532d; color: #86efac; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Backups &amp; Recovery</h1>
  <p>A backup you have never restored is a hope, not a plan. Recovery is the whole point: your restore procedure must be tested, documented, and fast enough for the business.</p>
  <h2>Logical backup with mongodump</h2>
  <pre class="code-block">mongodump --uri='mongodb://user:pass@host:27017/shop' \
  --out=/backups/shop-$(date +%F)

mongorestore --uri='mongodb://restore-host/shop' \
  /backups/shop-2026-09-17</pre>
  <p><span class="ic">mongodump</span> writes BSON files the whole application can read; <span class="ic">mongorestore</span> replays them. Compact and portable, but slower than raw copies for huge data sets.</p>
  <h2>Consistency and point-in-time</h2>
  <p>Backing up from a replica set needs the oplog so the snapshot is a consistent point in time:</p>
  <pre class="code-block">mongodump --oplog --oplogReplay --out=/backups/shop</pre>
  <p>Keep recent oplog ranges so a restore can replay forward to a specific moment — the difference between "lose a week" and "lose five minutes".</p>
  <h2>Filesystem snapshots</h2>
  <p>For large deployments, snapshot the data directory at the filesystem level (LVM, EBS, or managed snapshot). Restores come back fast but must be consistent — quiesce writes first or use the snapshot as a new replica member.</p>
  <h2>Recovery architecture</h2>
  <ul>
    <li>Restore a dump into a fresh node and re-add it to the replica set as a new member.</li>
    <li>Let replication catch the node up — the set heals without a full outage.</li>
    <li>Verify counts and checksums against the original data.</li>
  </ul>
  <h2>The backup plan</h2>
  <table>
    <tr><th>Frequency</th><th>What</th></tr>
    <tr><td>Continuous</td><td>Oplog tail for point-in-time recovery</td></tr>
    <tr><td>Daily</td><td>Logical dump or snapshot, held off-site</td></tr>
    <tr><td>Weekly</td><td>Test restore into a scratch environment</td></tr>
  </table>
  <div class="callout">
    <strong>Replication is not a backup</strong>
    <p>Mistakes replicate. A dropped database is gone from every member of the set. Backups are your only defense against the human error that no hardware failure predicts.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Test the restore</strong>
    <p>Put the restore date on the calendar. Backups bought at the exact moment you first need them are the most expensive ones.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02900000-0000-4000-8000-000000000427',
  '02900000-0000-4000-8000-000000000327',
  1,
  'Choosing the Right Database',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Choosing the Right Database</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #16a34a; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #15803d; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdf4; color: #15803d; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdf4; border-left: 4px solid #22c55e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #16a34a; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdf4; color: #15803d; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #4ade80; }
.dark .lesson-page h2 { color: #4ade80; }
.dark .lesson-page .ic { background: #14532d; color: #86efac; }
.dark .lesson-page .callout { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #14532d; color: #86efac; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Choosing the Right Database</h1>
  <p>You have seen the whole NoSQL toolbox. The final skill is judgment: picking the database that matches the workload instead of the one with the loudest blog post.</p>
  <h2>Decision framework</h2>
  <ol>
    <li><strong>Shape</strong> — Is the data nested and self-describing (document), key-addressed (key-value), columnar, or graph-like?</li>
    <li><strong>Access patterns</strong> — Which queries run constantly, and are they join-heavy or single-entity?</li>
    <li><strong>Consistency</strong> — Can reads tolerate short-lived staleness for lower latency?</li>
    <li><strong>Scale</strong> — Will this exceed one node? How evenly can it be sharded?</li>
    <li><strong>Team</strong> — What do the people operating it actually know?</li>
  </ol>
  <h2>Rough guidance</h2>
  <table>
    <tr><th>Workload</th><th>Reasonable default</th></tr>
    <tr><td>Financial ledger, heavy cross-entity reporting</td><td>Relational (PostgreSQL)</td></tr>
    <tr><td>Nested product / catalog data, agile schemas</td><td>Document (MongoDB)</td></tr>
    <tr><td>Hot cache, sessions, rate limits</td><td>Key-value (Redis)</td></tr>
    <tr><td>Massive time-series ingest</td><td>Wide-column (Cassandra)</td></tr>
    <tr><td>Friends, links, route finding</td><td>Graph (Neo4j)</td></tr>
  </table>
  <h2>Capstone: a product catalog</h2>
  <p>Build an e-commerce catalog backed by MongoDB. Model one product document, index the query fields, and summarize by category:</p>
  <pre class="code-block">db.products.createIndex({ category: 1, price: 1 })

db.products.aggregate([
  { $match: { inStock: true } },
  { $group: { _id: '$category', count: { $sum: 1 } } },
  { $sort: { count: -1 } }
])</pre>
  <p>Your deliverable: a short design note that answers the five framework questions, the collection sketch, the indexes, and the report pipeline. Justify each choice — that defense is the capstone.</p>
  <div class="callout">
    <strong>Polyglot is normal</strong>
    <p>Nothing says one database per product. The catalog lives well in MongoDB while orders need a transactional relational store and sessions sit in Redis. Choose per workload.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Start with access patterns</strong>
    <p>Every architecture question in this course circles back to one starting point: how do your users actually read and write? Answer that first and the database often chooses itself.</p>
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
  ('02900000-0000-4000-8000-000000000501', '02900000-0000-4000-8000-000000000303',
   'Which is a defining characteristic of NoSQL databases?',
   'NoSQL systems favor flexible, schema-less models and horizontal scaling over rigid schemas.', 1),
  ('02900000-0000-4000-8000-000000000502', '02900000-0000-4000-8000-000000000303',
   'Which three guarantees does the CAP theorem trade off?',
   'CAP stands for consistency, availability, and partition tolerance.', 2),
  ('02900000-0000-4000-8000-000000000503', '02900000-0000-4000-8000-000000000303',
   'Which NoSQL category stores JSON-like documents with nested arrays?',
   'Document stores like MongoDB represent data as rich, self-describing documents.', 3),
  ('02900000-0000-4000-8000-000000000504', '02900000-0000-4000-8000-000000000306',
   'What identifies each document uniquely inside a MongoDB collection?',
   'Every document carries a unique _id, generated as an ObjectId unless you supply one.', 1),
  ('02900000-0000-4000-8000-000000000505', '02900000-0000-4000-8000-000000000306',
   'Which format does MongoDB use to store documents on disk?',
   'BSON is the binary serialization MongoDB stores and indexes.', 2),
  ('02900000-0000-4000-8000-000000000506', '02900000-0000-4000-8000-000000000306',
   'Which statement about MongoDB collections is true?',
   'Collections accept documents with different field sets — that is schema flexibility.', 3),
  ('02900000-0000-4000-8000-000000000507', '02900000-0000-4000-8000-000000000309',
   'Which method inserts exactly one document into a collection?',
   'insertOne adds a single document; insertMany adds a batch.', 1),
  ('02900000-0000-4000-8000-000000000508', '02900000-0000-4000-8000-000000000309',
   'What does db.products.find({}) return?',
   'find() returns a cursor you can iterate, count, sort, or limit.', 2),
  ('02900000-0000-4000-8000-000000000509', '02900000-0000-4000-8000-000000000309',
   'What happens when insertMany hits a document that violates a unique index?',
   'Without ordered:false the batch stops at the first failing document.', 3),
  ('02900000-0000-4000-8000-000000000510', '02900000-0000-4000-8000-000000000312',
   'Which update operator increments a numeric field by a supplied value?',
   '$inc adds the value to the existing field, keeping updates atomic.', 1),
  ('02900000-0000-4000-8000-000000000511', '02900000-0000-4000-8000-000000000312',
   'What does the upsert option do in an update?',
   'upsert:true inserts a fresh document when the filter matches nothing.', 2),
  ('02900000-0000-4000-8000-000000000512', '02900000-0000-4000-8000-000000000312',
   'Which command removes every document but keeps the collection?',
   'deleteMany({}) with an empty filter clears all documents while retaining the collection.', 3),
  ('02900000-0000-4000-8000-000000000513', '02900000-0000-4000-8000-000000000315',
   'Which operator matches a field that equals any value in a supplied list?',
   '$in selects documents whose field matches any entry of the given array.', 1),
  ('02900000-0000-4000-8000-000000000514', '02900000-0000-4000-8000-000000000315',
   'How do you match documents where price is over 100 AND inStock is true?',
   'Multiple fields in one filter object combine with an implicit AND.', 2),
  ('02900000-0000-4000-8000-000000000515', '02900000-0000-4000-8000-000000000315',
   'Which operator checks that a field has a given BSON type?',
   '$type matches documents where the field is of the specified type.', 3),
  ('02900000-0000-4000-8000-000000000516', '02900000-0000-4000-8000-000000000318',
   'Which aggregation stage groups documents and computes accumulators?',
   '$group partitions the stream by a key and runs expressions like $sum.', 1),
  ('02900000-0000-4000-8000-000000000517', '02900000-0000-4000-8000-000000000318',
   'Why might a query use COLLSCAN instead of an IXSCAN?',
   'Without a matching usable index MongoDB must scan every document.', 2),
  ('02900000-0000-4000-8000-000000000518', '02900000-0000-4000-8000-000000000318',
   'Which index type removes documents automatically after expiry?',
   'A TTL index deletes expired documents on a background schedule.', 3),
  ('02900000-0000-4000-8000-000000000519', '02900000-0000-4000-8000-000000000321',
   'What is the main benefit of embedding related data inside a document?',
   'One read retrieves all related data in a single, atomic operation.', 1),
  ('02900000-0000-4000-8000-000000000520', '02900000-0000-4000-8000-000000000321',
   'When should you prefer referencing over embedding?',
   'Unbounded child collections must move to their own collections to avoid the 16 MB limit.', 2),
  ('02900000-0000-4000-8000-000000000521', '02900000-0000-4000-8000-000000000321',
   'Embedded children that must be queried independently create...',
   'Querying many nested arrays independently needs complex stages; reference instead.', 3),
  ('02900000-0000-4000-8000-000000000522', '02900000-0000-4000-8000-000000000324',
   'What does the primary node do in a replica set?',
   'The primary accepts writes and applies them to the oplog for secondaries to replay.', 1),
  ('02900000-0000-4000-8000-000000000523', '02900000-0000-4000-8000-000000000324',
   'Why add a secondary node to a replica set?',
   'Secondaries provide data redundancy and enable automatic failover elections.', 2),
  ('02900000-0000-4000-8000-000000000524', '02900000-0000-4000-8000-000000000324',
   'Which quality makes a shard key effective?',
   'Good shard keys give high cardinality, even distribution, and no monotonic growth.', 3),
  ('02900000-0000-4000-8000-000000000525', '02900000-0000-4000-8000-000000000328',
   'Which property makes document databases flexible during development?',
   'Schema-free collections let documents evolve without a migration on every release.', 1),
  ('02900000-0000-4000-8000-000000000526', '02900000-0000-4000-8000-000000000328',
   'Which aggregation stage reshapes a document by including or computing fields?',
   '$project controls exactly which fields flow into the next stage.', 2),
  ('02900000-0000-4000-8000-000000000527', '02900000-0000-4000-8000-000000000328',
   'What is the 16 MB limit in MongoDB?',
   'A single BSON document cannot exceed 16 MB, shaping how you model large data.', 3),
  ('02900000-0000-4000-8000-000000000528', '02900000-0000-4000-8000-000000000328',
   'Which read preference reads only from secondary members?',
   'secondary routes reads exclusively to secondaries of the replica set.', 4),
  ('02900000-0000-4000-8000-000000000529', '02900000-0000-4000-8000-000000000328',
   'Which technique is the recommended first line of backup for small deployments?',
   'Regular mongodump backups, restored and verified, protect against data loss.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): schema-less NoSQL
  ('02900000-0000-4000-8000-000000001001', '02900000-0000-4000-8000-000000000501', 'Flexible, schema-less data models', TRUE,  1),
  ('02900000-0000-4000-8000-000000001002', '02900000-0000-4000-8000-000000000501', 'Fixed relational schemas', FALSE, 2),
  ('02900000-0000-4000-8000-000000001003', '02900000-0000-4000-8000-000000000501', 'Joins as the primary path', FALSE, 3),
  ('02900000-0000-4000-8000-000000001004', '02900000-0000-4000-8000-000000000501', 'Single-node storage only', FALSE, 4),
  -- Q1 (501): CAP
  ('02900000-0000-4000-8000-000000001005', '02900000-0000-4000-8000-000000000502', 'Consistency, Availability, Partition tolerance', TRUE,  1),
  ('02900000-0000-4000-8000-000000001006', '02900000-0000-4000-8000-000000000502', 'Cost, Accessibility, Performance', FALSE, 2),
  ('02900000-0000-4000-8000-000000001007', '02900000-0000-4000-8000-000000000502', 'Capacity, Atomicity, Permissions', FALSE, 3),
  ('02900000-0000-4000-8000-000000001008', '02900000-0000-4000-8000-000000000502', 'Cache, Authorization, Protocol', FALSE, 4),
  -- Q1 (501): document stores
  ('02900000-0000-4000-8000-000000001009', '02900000-0000-4000-8000-000000000503', 'Document stores', TRUE,  1),
  ('02900000-0000-4000-8000-000000001010', '02900000-0000-4000-8000-000000000503', 'Key-value stores', FALSE, 2),
  ('02900000-0000-4000-8000-000000001011', '02900000-0000-4000-8000-000000000503', 'Wide-column stores', FALSE, 3),
  ('02900000-0000-4000-8000-000000001012', '02900000-0000-4000-8000-000000000503', 'Graph databases', FALSE, 4),
  -- Q2 (504): _id
  ('02900000-0000-4000-8000-000000001013', '02900000-0000-4000-8000-000000000504', 'The _id field', TRUE,  1),
  ('02900000-0000-4000-8000-000000001014', '02900000-0000-4000-8000-000000000504', 'The first indexed field', FALSE, 2),
  ('02900000-0000-4000-8000-000000001015', '02900000-0000-4000-8000-000000000504', 'The collection name', FALSE, 3),
  ('02900000-0000-4000-8000-000000001016', '02900000-0000-4000-8000-000000000504', 'The created_at timestamp', FALSE, 4),
  -- Q2 (504): BSON
  ('02900000-0000-4000-8000-000000001017', '02900000-0000-4000-8000-000000000505', 'BSON', TRUE,  1),
  ('02900000-0000-4000-8000-000000001018', '02900000-0000-4000-8000-000000000505', 'YAML', FALSE, 2),
  ('02900000-0000-4000-8000-000000001019', '02900000-0000-4000-8000-000000000505', 'XML', FALSE, 3),
  ('02900000-0000-4000-8000-000000001020', '02900000-0000-4000-8000-000000000505', 'CSV', FALSE, 4),
  -- Q2 (504): collection flexibility
  ('02900000-0000-4000-8000-000000001021', '02900000-0000-4000-8000-000000000506', 'Documents may have different fields', TRUE,  1),
  ('02900000-0000-4000-8000-000000001022', '02900000-0000-4000-8000-000000000506', 'All documents share one schema', FALSE, 2),
  ('02900000-0000-4000-8000-000000001023', '02900000-0000-4000-8000-000000000506', 'A schema is required up front', FALSE, 3),
  ('02900000-0000-4000-8000-000000001024', '02900000-0000-4000-8000-000000000506', 'Collections cannot be dropped', FALSE, 4),
  -- Q3 (507): insertOne
  ('02900000-0000-4000-8000-000000001025', '02900000-0000-4000-8000-000000000507', 'insertOne', TRUE,  1),
  ('02900000-0000-4000-8000-000000001026', '02900000-0000-4000-8000-000000000507', 'insertMany', FALSE, 2),
  ('02900000-0000-4000-8000-000000001027', '02900000-0000-4000-8000-000000000507', 'find', FALSE, 3),
  ('02900000-0000-4000-8000-000000001028', '02900000-0000-4000-8000-000000000507', 'updateOne', FALSE, 4),
  -- Q3 (507): find cursor
  ('02900000-0000-4000-8000-000000001029', '02900000-0000-4000-8000-000000000508', 'A cursor over matching documents', TRUE,  1),
  ('02900000-0000-4000-8000-000000001030', '02900000-0000-4000-8000-000000000508', 'A single JSON document', FALSE, 2),
  ('02900000-0000-4000-8000-000000001031', '02900000-0000-4000-8000-000000000508', 'The count of documents', FALSE, 3),
  ('02900000-0000-4000-8000-000000001032', '02900000-0000-4000-8000-000000000508', 'An index definition', FALSE, 4),
  -- Q3 (507): insertMany failure
  ('02900000-0000-4000-8000-000000001033', '02900000-0000-4000-8000-000000000509', 'The batch stops at the failing document', TRUE,  1),
  ('02900000-0000-4000-8000-000000001034', '02900000-0000-4000-8000-000000000509', 'The whole batch is ignored', FALSE, 2),
  ('02900000-0000-4000-8000-000000001035', '02900000-0000-4000-8000-000000000509', 'The invalid field is dropped', FALSE, 3),
  ('02900000-0000-4000-8000-000000001036', '02900000-0000-4000-8000-000000000509', 'A new _id is generated', FALSE, 4),
  -- Q4 (510): $inc
  ('02900000-0000-4000-8000-000000001037', '02900000-0000-4000-8000-000000000510', '$inc', TRUE,  1),
  ('02900000-0000-4000-8000-000000001038', '02900000-0000-4000-8000-000000000510', '$set', FALSE, 2),
  ('02900000-0000-4000-8000-000000001039', '02900000-0000-4000-8000-000000000510', '$rename', FALSE, 3),
  ('02900000-0000-4000-8000-000000001040', '02900000-0000-4000-8000-000000000510', '$slice', FALSE, 4),
  -- Q4 (510): upsert
  ('02900000-0000-4000-8000-000000001041', '02900000-0000-4000-8000-000000000511', 'Inserts when no match is found', TRUE,  1),
  ('02900000-0000-4000-8000-000000001042', '02900000-0000-4000-8000-000000000511', 'Replaces every matching document', FALSE, 2),
  ('02900000-0000-4000-8000-000000001043', '02900000-0000-4000-8000-000000000511', 'Deletes non-matches', FALSE, 3),
  ('02900000-0000-4000-8000-000000001044', '02900000-0000-4000-8000-000000000511', 'Sorts the collection', FALSE, 4),
  -- Q4 (510): deleteMany({})
  ('02900000-0000-4000-8000-000000001045', '02900000-0000-4000-8000-000000000512', 'deleteMany({})', TRUE,  1),
  ('02900000-0000-4000-8000-000000001046', '02900000-0000-4000-8000-000000000512', 'dropDatabase', FALSE, 2),
  ('02900000-0000-4000-8000-000000001047', '02900000-0000-4000-8000-000000000512', 'db.products.drop()', FALSE, 3),
  ('02900000-0000-4000-8000-000000001048', '02900000-0000-4000-8000-000000000512', 'deleteOne', FALSE, 4),
  -- Q5 (513): $in
  ('02900000-0000-4000-8000-000000001049', '02900000-0000-4000-8000-000000000513', '$in', TRUE,  1),
  ('02900000-0000-4000-8000-000000001050', '02900000-0000-4000-8000-000000000513', '$gt', FALSE, 2),
  ('02900000-0000-4000-8000-000000001051', '02900000-0000-4000-8000-000000000513', '$regex', FALSE, 3),
  ('02900000-0000-4000-8000-000000001052', '02900000-0000-4000-8000-000000000513', '$size', FALSE, 4),
  -- Q5 (513): implicit AND
  ('02900000-0000-4000-8000-000000001053', '02900000-0000-4000-8000-000000000514', 'Both conditions in one filter object', TRUE,  1),
  ('02900000-0000-4000-8000-000000001054', '02900000-0000-4000-8000-000000000514', 'Two separate find calls', FALSE, 2),
  ('02900000-0000-4000-8000-000000001055', '02900000-0000-4000-8000-000000000514', 'An $or between the fields', FALSE, 3),
  ('02900000-0000-4000-8000-000000001056', '02900000-0000-4000-8000-000000000514', 'Sort first, then filter', FALSE, 4),
  -- Q5 (513): $type
  ('02900000-0000-4000-8000-000000001057', '02900000-0000-4000-8000-000000000515', '$type', TRUE,  1),
  ('02900000-0000-4000-8000-000000001058', '02900000-0000-4000-8000-000000000515', '$not', FALSE, 2),
  ('02900000-0000-4000-8000-000000001059', '02900000-0000-4000-8000-000000000515', '$now', FALSE, 3),
  ('02900000-0000-4000-8000-000000001060', '02900000-0000-4000-8000-000000000515', '$push', FALSE, 4),
  -- Q6 (516): $group
  ('02900000-0000-4000-8000-000000001061', '02900000-0000-4000-8000-000000000516', '$group', TRUE,  1),
  ('02900000-0000-4000-8000-000000001062', '02900000-0000-4000-8000-000000000516', '$project', FALSE, 2),
  ('02900000-0000-4000-8000-000000001063', '02900000-0000-4000-8000-000000000516', '$unwind', FALSE, 3),
  ('02900000-0000-4000-8000-000000001064', '02900000-0000-4000-8000-000000000516', '$count', FALSE, 4),
  -- Q6 (516): COLLSCAN
  ('02900000-0000-4000-8000-000000001065', '02900000-0000-4000-8000-000000000517', 'No matching usable index exists', TRUE,  1),
  ('02900000-0000-4000-8000-000000001066', '02900000-0000-4000-8000-000000000517', 'The document is too large', FALSE, 2),
  ('02900000-0000-4000-8000-000000001067', '02900000-0000-4000-8000-000000000517', 'Too many fields are returned', FALSE, 3),
  ('02900000-0000-4000-8000-000000001068', '02900000-0000-4000-8000-000000000517', 'The server is low on memory', FALSE, 4),
  -- Q6 (516): TTL
  ('02900000-0000-4000-8000-000000001069', '02900000-0000-4000-8000-000000000518', 'TTL index', TRUE,  1),
  ('02900000-0000-4000-8000-000000001070', '02900000-0000-4000-8000-000000000518', 'Unique index', FALSE, 2),
  ('02900000-0000-4000-8000-000000001071', '02900000-0000-4000-8000-000000000518', 'Text index', FALSE, 3),
  ('02900000-0000-4000-8000-000000001072', '02900000-0000-4000-8000-000000000518', 'Hashed index', FALSE, 4),
  -- Q7 (519): embedding benefit
  ('02900000-0000-4000-8000-000000001073', '02900000-0000-4000-8000-000000000519', 'One read returns related data atomically', TRUE,  1),
  ('02900000-0000-4000-8000-000000001074', '02900000-0000-4000-8000-000000000519', 'Data is stored on separate servers', FALSE, 2),
  ('02900000-0000-4000-8000-000000001075', '02900000-0000-4000-8000-000000000519', 'No indexes are needed', FALSE, 3),
  ('02900000-0000-4000-8000-000000001076', '02900000-0000-4000-8000-000000000519', 'ObjectIds become unnecessary', FALSE, 4),
  -- Q7 (519): referencing
  ('02900000-0000-4000-8000-000000001077', '02900000-0000-4000-8000-000000000520', 'When the related data grows without bound', TRUE,  1),
  ('02900000-0000-4000-8000-000000001078', '02900000-0000-4000-8000-000000000520', 'When it is always read with the parent', FALSE, 2),
  ('02900000-0000-4000-8000-000000001079', '02900000-0000-4000-8000-000000000520', 'When documents must stay tiny', FALSE, 3),
  ('02900000-0000-4000-8000-000000001080', '02900000-0000-4000-8000-000000000520', 'When fewer collections are better', FALSE, 4),
  -- Q7 (519): independent queries
  ('02900000-0000-4000-8000-000000001081', '02900000-0000-4000-8000-000000000521', 'Complex stage-based queries', TRUE,  1),
  ('02900000-0000-4000-8000-000000001082', '02900000-0000-4000-8000-000000000521', 'Impossible index usage', FALSE, 2),
  ('02900000-0000-4000-8000-000000001083', '02900000-0000-4000-8000-000000000521', 'Databases that forbid nesting', FALSE, 3),
  ('02900000-0000-4000-8000-000000001084', '02900000-0000-4000-8000-000000000521', 'Reads that can never update', FALSE, 4),
  -- Q8 (522): primary
  ('02900000-0000-4000-8000-000000001085', '02900000-0000-4000-8000-000000000522', 'Accepts writes and applies them to the oplog', TRUE,  1),
  ('02900000-0000-4000-8000-000000001086', '02900000-0000-4000-8000-000000000522', 'Serves every read instead of secondaries', FALSE, 2),
  ('02900000-0000-4000-8000-000000001087', '02900000-0000-4000-8000-000000000522', 'Stores the shard key mapping', FALSE, 3),
  ('02900000-0000-4000-8000-000000001088', '02900000-0000-4000-8000-000000000522', 'Runs mongos for the cluster', FALSE, 4),
  -- Q8 (522): secondary purpose
  ('02900000-0000-4000-8000-000000001089', '02900000-0000-4000-8000-000000000523', 'Automatic failover and data redundancy', TRUE,  1),
  ('02900000-0000-4000-8000-000000001090', '02900000-0000-4000-8000-000000000523', 'Doubled write throughput', FALSE, 2),
  ('02900000-0000-4000-8000-000000001091', '02900000-0000-4000-8000-000000000523', 'Backups become unnecessary', FALSE, 3),
  ('02900000-0000-4000-8000-000000001092', '02900000-0000-4000-8000-000000000523', 'The mongos router is bypassed', FALSE, 4),
  -- Q8 (522): shard key
  ('02900000-0000-4000-8000-000000001093', '02900000-0000-4000-8000-000000000524', 'High cardinality and even distribution', TRUE,  1),
  ('02900000-0000-4000-8000-000000001094', '02900000-0000-4000-8000-000000000524', 'Always the _id of the document', FALSE, 2),
  ('02900000-0000-4000-8000-000000001095', '02900000-0000-4000-8000-000000000524', 'The largest string field', FALSE, 3),
  ('02900000-0000-4000-8000-000000001096', '02900000-0000-4000-8000-000000000524', 'A timestamp only', FALSE, 4),
  -- Q9 (525): schema flexibility
  ('02900000-0000-4000-8000-000000001097', '02900000-0000-4000-8000-000000000525', 'Collections accept varied fields per document', TRUE,  1),
  ('02900000-0000-4000-8000-000000001098', '02900000-0000-4000-8000-000000000525', 'Foreign keys enforce joins', FALSE, 2),
  ('02900000-0000-4000-8000-000000001099', '02900000-0000-4000-8000-000000000525', 'One fixed table per collection', FALSE, 3),
  ('02900000-0000-4000-8000-000000001100', '02900000-0000-4000-8000-000000000525', 'Strictly normalized storage', FALSE, 4),
  -- Q9 (525): $project
  ('02900000-0000-4000-8000-000000001101', '02900000-0000-4000-8000-000000000526', '$project', TRUE,  1),
  ('02900000-0000-4000-8000-000000001102', '02900000-0000-4000-8000-000000000526', '$match', FALSE, 2),
  ('02900000-0000-4000-8000-000000001103', '02900000-0000-4000-8000-000000000526', '$limit', FALSE, 3),
  ('02900000-0000-4000-8000-000000001104', '02900000-0000-4000-8000-000000000526', '$count', FALSE, 4),
  -- Q9 (525): 16 MB limit
  ('02900000-0000-4000-8000-000000001105', '02900000-0000-4000-8000-000000000527', 'The maximum size of one document', TRUE,  1),
  ('02900000-0000-4000-8000-000000001106', '02900000-0000-4000-8000-000000000527', 'The maximum collection size', FALSE, 2),
  ('02900000-0000-4000-8000-000000001107', '02900000-0000-4000-8000-000000000527', 'The maximum index count', FALSE, 3),
  ('02900000-0000-4000-8000-000000001108', '02900000-0000-4000-8000-000000000527', 'The maximum database count', FALSE, 4),
  -- Q9 (525): read preference
  ('02900000-0000-4000-8000-000000001109', '02900000-0000-4000-8000-000000000528', 'secondary', TRUE,  1),
  ('02900000-0000-4000-8000-000000001110', '02900000-0000-4000-8000-000000000528', 'primary', FALSE, 2),
  ('02900000-0000-4000-8000-000000001111', '02900000-0000-4000-8000-000000000528', 'nearest', FALSE, 3),
  ('02900000-0000-4000-8000-000000001112', '02900000-0000-4000-8000-000000000528', 'primaryPreferred', FALSE, 4),
  -- Q9 (525): backups
  ('02900000-0000-4000-8000-000000001113', '02900000-0000-4000-8000-000000000529', 'Regular mongodump backups', TRUE,  1),
  ('02900000-0000-4000-8000-000000001114', '02900000-0000-4000-8000-000000000529', 'Deleting old indexes daily', FALSE, 2),
  ('02900000-0000-4000-8000-000000001115', '02900000-0000-4000-8000-000000000529', 'Disabling the oplog', FALSE, 3),
  ('02900000-0000-4000-8000-000000001116', '02900000-0000-4000-8000-000000000529', 'Using only sharding', FALSE, 4)
ON CONFLICT (id) DO NOTHING;
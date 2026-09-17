-- ============================================================================
-- SEED 061: Complete course - "Redis & Caching Strategies"
-- ----------------------------------------------------------------------------
-- Instructor : Anita Patel        (10000000-0000-4000-8000-000000000003)
-- Category   : Database & Administration (20000000-0000-4000-8000-000000000008)
-- Level      : INTERMEDIATE - Access : SUBSCRIPTION - Status : PUBLISHED
-- Position   : 59
--
-- Structure (5 modules -> 10 chapters -> 28 lessons):
--   M1 Caching Foundations            -> C1 Why Cache & How Caching Works - C2 Redis Fundamentals
--   M2 Keys, Expiry & Eviction       -> C3 Keys, TTL & Expiration - C4 Memory & Eviction Policies
--   M3 Caching Patterns              -> C5 Read Caching Patterns - C6 Write Patterns & Invalidation
--   M4 Persistence, Pub/Sub & Scaling -> C7 Persistence - C8 Pub/Sub & Scaling
--   M5 Production & Capstone         -> C9 Monitoring & Administration - C10 Capstone Caching System
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
  '03D00000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000003',
  '20000000-0000-4000-8000-000000000008',
  'Redis & Caching Strategies',
  'redis-and-caching-strategies',
  'Speed up your applications with Redis. Learn why caching works, master Redis data structures, TTL and eviction policies, then apply cache-aside, read/write-through, and invalidation patterns. Finish by configuring persistence, pub/sub, Sentinel clustering, and a complete production caching system.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  59
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('03D00000-0000-4000-8000-000000000011', '03D00000-0000-4000-8000-000000000001', 'Explain the economics of caching and compute cache hit ratios.',               1),
  ('03D00000-0000-4000-8000-000000000012', '03D00000-0000-4000-8000-000000000001', 'Use Redis strings, hashes, lists, sets, sorted sets, bitmaps, and streams in real workloads.', 2),
  ('03D00000-0000-4000-8000-000000000013', '03D00000-0000-4000-8000-000000000001', 'Manage keys, TTLs, and eviction policies to keep caches healthy under memory pressure.', 3),
  ('03D00000-0000-4000-8000-000000000014', '03D00000-0000-4000-8000-000000000001', 'Apply cache-aside, read/write-through, and invalidation patterns safely.',    4),
  ('03D00000-0000-4000-8000-000000000015', '03D00000-0000-4000-8000-000000000001', 'Configure persistence, pub/sub, high availability, and monitoring for production Redis.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('03D00000-0000-4000-8000-000000000101', '03D00000-0000-4000-8000-000000000001', 1, 'Caching Foundations',           'Understand what caches do, why they matter, and the Redis basics.',        'PUBLISHED'),
  ('03D00000-0000-4000-8000-000000000102', '03D00000-0000-4000-8000-000000000001', 2, 'Keys, Expiry & Eviction',      'Manage keys, timeouts, and memory pressure safely.',                      'PUBLISHED'),
  ('03D00000-0000-4000-8000-000000000103', '03D00000-0000-4000-8000-000000000001', 3, 'Caching Patterns',              'Apply proven read and write caching patterns to real systems.',           'PUBLISHED'),
  ('03D00000-0000-4000-8000-000000000104', '03D00000-0000-4000-8000-000000000001', 4, 'Persistence, Pub/Sub & Scaling','Keep data safe and Redis highly available under load.',                   'PUBLISHED'),
  ('03D00000-0000-4000-8000-000000000105', '03D00000-0000-4000-8000-000000000001', 5, 'Production & Capstone',        'Run Redis in production and ship a complete caching layer.',              'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('03D00000-0000-4000-8000-000000000201', '03D00000-0000-4000-8000-000000000101', 1, 'Why Cache & How Caching Works', 'See the payoff of caching and how it behaves under load.',               'PUBLISHED'),
  ('03D00000-0000-4000-8000-000000000202', '03D00000-0000-4000-8000-000000000101', 2, 'Redis Fundamentals',            'Master the core data structures and everyday commands.',                 'PUBLISHED'),
  ('03D00000-0000-4000-8000-000000000203', '03D00000-0000-4000-8000-000000000102', 1, 'Keys, TTL & Expiration',        'Name, scope, and expire keys with precision.',                          'PUBLISHED'),
  ('03D00000-0000-4000-8000-000000000204', '03D00000-0000-4000-8000-000000000102', 2, 'Memory & Eviction Policies',    'Control memory and pick the right eviction rule.',                      'PUBLISHED'),
  ('03D00000-0000-4000-8000-000000000205', '03D00000-0000-4000-8000-000000000103', 1, 'Read Caching Patterns',         'Read data faster with proven cache patterns.',                          'PUBLISHED'),
  ('03D00000-0000-4000-8000-000000000206', '03D00000-0000-4000-8000-000000000103', 2, 'Write Patterns & Invalidation', 'Keep the cache and the database in sync.',                              'PUBLISHED'),
  ('03D00000-0000-4000-8000-000000000207', '03D00000-0000-4000-8000-000000000104', 1, 'Persistence',                   'Guard against data loss with RDB and AOF.',                             'PUBLISHED'),
  ('03D00000-0000-4000-8000-000000000208', '03D00000-0000-4000-8000-000000000104', 2, 'Pub/Sub & Scaling',             'Broadcast messages and scale Redis safely.',                            'PUBLISHED'),
  ('03D00000-0000-4000-8000-000000000209', '03D00000-0000-4000-8000-000000000105', 1, 'Monitoring & Administration',   'Watch, tune, and protect a production Redis.',                          'PUBLISHED'),
  ('03D00000-0000-4000-8000-000000000210', '03D00000-0000-4000-8000-000000000105', 2, 'Capstone Caching System',       'Design, build, and tune a real caching layer.',                         'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 03D00000-...-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('03D00000-0000-4000-8000-000000000301', '03D00000-0000-4000-8000-000000000201', 1, 'Why Cache?',                        'Understand the economics of caching and where it pays off.',             'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  5),
  ('03D00000-0000-4000-8000-000000000302', '03D00000-0000-4000-8000-000000000201', 2, 'How Caching Works Under the Hood',   'Look at locality, hit ratio, and staleness from the inside.',            'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('03D00000-0000-4000-8000-000000000303', '03D00000-0000-4000-8000-000000000201', 3, 'Caching Foundations Quiz',           'Check your understanding of what caches do.',                            'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('03D00000-0000-4000-8000-000000000304', '03D00000-0000-4000-8000-000000000202', 1, 'Redis Data Structures',              'Choose the right structure for every workload.',                          'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('03D00000-0000-4000-8000-000000000305', '03D00000-0000-4000-8000-000000000202', 2, 'Redis Commands in Action',           'Get comfortable with the command line, pipelines, and transactions.',    'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('03D00000-0000-4000-8000-000000000306', '03D00000-0000-4000-8000-000000000202', 3, 'Redis Fundamentals Quiz',            'Test your Redis structures and commands.',                                'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('03D00000-0000-4000-8000-000000000307', '03D00000-0000-4000-8000-000000000203', 1, 'Keys, Namespaces & TTL',             'Name keys like a pro and expire data on time.',                          'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('03D00000-0000-4000-8000-000000000308', '03D00000-0000-4000-8000-000000000203', 2, 'Expiration & Key Lifetime',          'Understand lazy and active expiration and their side effects.',          'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('03D00000-0000-4000-8000-000000000309', '03D00000-0000-4000-8000-000000000203', 3, 'Keys & TTL Quiz',                    'Verify your key naming and expiration skills.',                          'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('03D00000-0000-4000-8000-000000000310', '03D00000-0000-4000-8000-000000000204', 1, 'Eviction Policies',                  'Pick what Redis deletes when memory runs out.',                          'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('03D00000-0000-4000-8000-000000000311', '03D00000-0000-4000-8000-000000000204', 2, 'Memory Sizing & Fragmentation',      'Bound, measure, and reclaim memory safely.',                             'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('03D00000-0000-4000-8000-000000000312', '03D00000-0000-4000-8000-000000000204', 3, 'Memory & Eviction Quiz',             'Check your eviction policy knowledge.',                                  'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('03D00000-0000-4000-8000-000000000313', '03D00000-0000-4000-8000-000000000205', 1, 'Cache-Aside Pattern',                'Read and write through an application-managed cache.',                   'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('03D00000-0000-4000-8000-000000000314', '03D00000-0000-4000-8000-000000000205', 2, 'Read-Through & Refresh-Ahead',       'Let the cache load and refresh data itself.',                            'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('03D00000-0000-4000-8000-000000000315', '03D00000-0000-4000-8000-000000000205', 3, 'Read Patterns Quiz',                 'Test your read-side caching patterns.',                                  'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('03D00000-0000-4000-8000-000000000316', '03D00000-0000-4000-8000-000000000206', 1, 'Write-Through & Write-Behind',       'Write to cache and database without losing data.',                       'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('03D00000-0000-4000-8000-000000000317', '03D00000-0000-4000-8000-000000000206', 2, 'Cache Invalidation & Stampede',      'Keep cached data fresh and survive expiry storms.',                      'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('03D00000-0000-4000-8000-000000000318', '03D00000-0000-4000-8000-000000000206', 3, 'Write Patterns & Invalidation Quiz', 'Check your write and invalidation strategies.',                          'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('03D00000-0000-4000-8000-000000000319', '03D00000-0000-4000-8000-000000000207', 1, 'Redis Persistence: RDB & AOF',       'Snapshot with RDB or log with AOF, and know the trade-offs.',            'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('03D00000-0000-4000-8000-000000000320', '03D00000-0000-4000-8000-000000000207', 2, 'Choosing a Persistence Strategy',    'Match durability to your data and decide what loss is tolerable.',       'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('03D00000-0000-4000-8000-000000000321', '03D00000-0000-4000-8000-000000000207', 3, 'Persistence Quiz',                   'Verify your RDB and AOF knowledge.',                                     'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('03D00000-0000-4000-8000-000000000322', '03D00000-0000-4000-8000-000000000208', 1, 'Pub/Sub Messaging',                  'Broadcast events to many subscribers at once.',                          'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('03D00000-0000-4000-8000-000000000323', '03D00000-0000-4000-8000-000000000208', 2, 'Replicas, Sentinel & Redis Cluster', 'Add high availability and horizontal scaling to Redis.',                 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('03D00000-0000-4000-8000-000000000324', '03D00000-0000-4000-8000-000000000208', 3, 'Pub/Sub & HA Quiz',                  'Check your messaging, replication, and scaling knowledge.',               'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('03D00000-0000-4000-8000-000000000325', '03D00000-0000-4000-8000-000000000209', 1, 'Monitoring & Administration',        'Watch latency and memory, and run Redis safely.',                         'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('03D00000-0000-4000-8000-000000000326', '03D00000-0000-4000-8000-000000000210', 1, 'Capstone: Designing the Cache',      'Sketch a caching layer for a real read-heavy workload.',                 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('03D00000-0000-4000-8000-000000000327', '03D00000-0000-4000-8000-000000000210', 2, 'Capstone: Building & Tuning',       'Implement, test, and tune the cache with real metrics.',                 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('03D00000-0000-4000-8000-000000000328', '03D00000-0000-4000-8000-000000000210', 3, 'Final Assessment',                   'Prove what you learned across the whole course.',                        'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 30, 10)
ON CONFLICT (id) DO NOTHING;-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 03D00000-...-0401 .. 0427)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '03D00000-0000-4000-8000-000000000401',
  '03D00000-0000-4000-8000-000000000301',
  1,
  'Why Cache?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Why Cache?</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #ef4444; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #ef4444; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Why Cache?</h1>
  <p>A <strong>cache</strong> is a copy of frequently used data stored somewhere faster to reach than the original source. Reads that once travelled to a database, a disk, or a remote service can instead be answered in microseconds from memory. Redis is the most popular cache engine because it keeps data in RAM and serves simple lookups in under a millisecond.</p>
  <h2>Latency by storage tier</h2>
  <p>The point of caching is to move reads from slow tiers to fast ones:</p>
  <table>
    <tr><th>Tier</th><th>Typical latency</th><th>Notes</th></tr>
    <tr><td>Main memory (RAM)</td><td>~ 100 ns</td><td>Where Redis lives</td></tr>
    <tr><td>Solid-state disk</td><td>~ 0.1 - 1 ms</td><td>Database pages, files</td></tr>
    <tr><td>Database query</td><td>1 - 100 ms</td><td>Depends on IO and query plan</td></tr>
    <tr><td>Remote API call</td><td>10 - 500 ms</td><td>Network round trips dominate</td></tr>
  </table>
  <p>A cache hit is typically <strong>10 to 1000 times faster</strong> than a database query, and it costs far fewer resources per request.</p>
  <h2>Where caches live</h2>
  <ul>
    <li>Browser caches (HTTP, service workers) avoid re-downloading assets.</li>
    <li>CDNs replicate static content close to end users.</li>
    <li>In-process caches inside your app avoid work on a single node.</li>
    <li>Distributed caches like Redis are shared across all app instances.</li>
  </ul>
  <p>This course focuses on the last kind: a shared, network-attached cache every copy of your application talks to.</p>
  <h2>The payoff of a good hit ratio</h2>
  <p>The <strong>hit ratio</strong> is the fraction of reads answered from the cache:</p>
  <pre class="code-block">    keyspace_hits / (keyspace_hits + keyspace_misses)</pre>
  <pre class="code-block">127.0.0.1:6379> INFO stats
# Stats
keyspace_hits:8421
keyspace_misses:910</pre>
  <p>Here the ratio is about <span class="ic">8421 / (8421 + 910) = 90.2%</span>. When nine of ten reads skip the database, you free database capacity and cut tail latency on the common path.</p>
  <div class="callout callout-tip">
    <strong>Baseline first</strong>
    <p>Measure p95 and p99 latency before adding a cache. The point is to improve those numbers, and you cannot prove improvement without a before picture.</p>
  </div>
  <h2>The honest trade-offs</h2>
  <ul>
    <li>Staleness - a cached value can be older than the source of truth.</li>
    <li>Memory cost - RAM is finite; you must size the cache and evict.</li>
    <li>Cold starts - an empty cache must be warmed or filled on demand.</li>
    <li>Consistency work - invalidation logic becomes part of your system.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Cache is not storage</strong>
    <p>A cache is a performance strategy, not a durability strategy. Design it assuming every byte can disappear without notice.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03D00000-0000-4000-8000-000000000402',
  '03D00000-0000-4000-8000-000000000302',
  1,
  'How Caching Works Under the Hood',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>How Caching Works Under the Hood</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #ef4444; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #ef4444; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>How Caching Works Under the Hood</h1>
  <p>Caching works because of <strong>locality</strong>: most systems touch a small set of data over and over. If you remember the answers for that hot set, you avoid repeating expensive work.</p>
  <h2>Two kinds of locality</h2>
  <ul>
    <li>Temporal locality - a value requested now is likely to be requested again soon (a product page, a user profile).</li>
    <li>Spatial locality - data near the value you just read tends to matter next (rows of the same table, items of the same category).</li>
  </ul>
  <p>Redis exploits both: it stores whole values, and combined keys (for instance one key for an entire leaderboard) let a client fetch a whole neighborhood in one round trip.</p>
  <h2>What Redis looks like internally</h2>
  <p>At its core Redis is a large <strong>hash table in RAM</strong>. The key is a binary-safe string; the value is one of several data structures stored as an in-memory object. A read never touches disk, which is why latency stays in the microsecond range:</p>
  <table>
    <tr><th>Step</th><th>Work the server performs</th></tr>
    <tr><td>Hash lookup</td><td>Resolve the key through the keyspace dictionary</td></tr>
    <tr><td>Decode value</td><td>Turn the compact in-memory object into a reply</td></tr>
    <tr><td>Return reply</td><td>Serialize back over the TCP connection</td></tr>
  </table>
  <h2>Hit ratio in practice</h2>
  <table>
    <tr><th>Ratio</th><th>What it tells you</th></tr>
    <tr><td>&gt; 95%</td><td>The cache is pulling its weight</td></tr>
    <tr><td>70 - 95%</td><td>Healthy; look for the misses that hurt most</td></tr>
    <tr><td>&lt; 70%</td><td>Keys may expire too fast or the wrong data is cached</td></tr>
  </table>
  <p>Track <span class="ic">keyspace_hits</span> and <span class="ic">keyspace_misses</span> in <span class="ic">INFO stats</span> and per-command counters in <span class="ic">INFO commandstats</span>.</p>
  <div class="callout">
    <strong>Cold start</strong>
    <p>A freshly started Redis begins with an empty dataset. Expect low hit ratios until keys are warmed by traffic. Pre-warming popular keys can shrink that window dramatically.</p>
  </div>
  <h2>Staleness is the price</h2>
  <p>A cached value is a <em>copy</em>, so the source of truth can change underneath it. Caches cope with expiry (TTL) and invalidation (deleting a key when the source changes) - both covered in depth later in this course.</p>
  <div class="callout callout-info">
    <strong>Shared by many processes</strong>
    <p>Multiple application instances share one cache but disagree about wall-clock time, retries, and ordering. Design your key names and TTLs with that reality in mind.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03D00000-0000-4000-8000-000000000404',
  '03D00000-0000-4000-8000-000000000304',
  1,
  'Redis Data Structures',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Redis Data Structures</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #ef4444; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #ef4444; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Redis Data Structures</h1>
  <p>Strings are not the only game in town. Redis ships a family of data structures, each designed around a class of problem. Choosing the right one is the difference between a few elegant commands and a pile of half-baked application code.</p>
  <h2>String</h2>
  <p>The workhorse: a key holding a binary-safe value such as a number, token, JSON blob, or rendered HTML fragment.</p>
  <pre class="code-block">> SET product:4213 '{"name":"USB-C Hub","price":29.90}' EX 300
OK
> GET product:4213
"{\"name\":\"USB-C Hub\",\"price\":29.90}"
> INCR counter:pageviews:4213</pre>
  <div class="callout callout-tip">
    <strong>Atomic counters</strong>
    <p><span class="ic">INCR</span>, <span class="ic">DECR</span>, and <span class="ic">INCRBY</span> are atomic, so strings make perfect hit counters and rate limits with no locking.</p>
  </div>
  <h2>Hash</h2>
  <p>Maps fields to values inside one key - ideal for objects, sessions, and partial updates:</p>
  <pre class="code-block">> HSET user:88:profile name "Lena" tier "gold" login_count 42
(integer) 3
> HGET user:88:profile tier
"gold"
> HINCRBY user:88:profile login_count 1</pre>
  <p>Prefer <span class="ic">HMGET</span> for large hashes so you do not ship whole objects around.</p>
  <h2>List and Set</h2>
  <pre class="code-block">> RPUSH feed:user:88 post:9001 post:9002
(integer) 2
> LRANGE feed:user:88 0 9
1) "post:9001"
2) "post:9002"
> SADD article:55:tags "redis" "cache" "backend"
> SISMEMBER article:55:tags "cache"
(integer) 1</pre>
  <p>A list preserves order (queues, recent items); a set holds unique members (tags, likes, deduplication).</p>
  <h2>Sorted Set</h2>
  <p>Unique members each carrying a score, always ordered - the tool for leaderboards, ranking feeds, and scheduling:</p>
  <pre class="code-block">> ZADD leaderboard:weekly 1000 "alice" 980 "bob" 1020 "carol"
> ZRANGE leaderboard:weekly 0 -1 WITHSCORES
1) "bob"
2) "980"
...
> ZINCRBY leaderboard:weekly 40 "bob"</pre>
  <h2>Bitmap and Stream</h2>
  <p>A bitmap packs bits into a string for compact daily-active tracking with <span class="ic">SETBIT</span> and <span class="ic">BITCOUNT</span>. A stream is an append-only log with consumer groups - the modern foundation for durable job queues and event processing, covered in the Pub/Sub module.</p>
  <table>
    <tr><th>Structure</th><th>Use for</th><th>Key commands</th></tr>
    <tr><td>String</td><td>Blobs, counters, tokens</td><td>SET GET INCR SETEX</td></tr>
    <tr><td>Hash</td><td>Objects, sessions</td><td>HSET HGET HDEL HGETALL</td></tr>
    <tr><td>List</td><td>Queues, recent items</td><td>LPUSH RPUSH LPOP LRANGE</td></tr>
    <tr><td>Set</td><td>Unique membership</td><td>SADD SREM SISMEMBER</td></tr>
    <tr><td>Sorted set</td><td>Leaderboards, scheduling</td><td>ZADD ZRANGE ZINCRBY</td></tr>
    <tr><td>Bitmap</td><td>Compact flags</td><td>SETBIT BITCOUNT</td></tr>
    <tr><td>Stream</td><td>Append-only events, queues</td><td>XADD XREAD XGROUP</td></tr>
  </table>
  <div class="callout">
    <strong>Match the shape to the query</strong>
    <p>Store data in the structure your read pattern needs. Always reading one field? Use a hash. Ranking by score? Use a sorted set instead of sorting in the app.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03D00000-0000-4000-8000-000000000405',
  '03D00000-0000-4000-8000-000000000305',
  1,
  'Redis Commands in Action',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Redis Commands in Action</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #ef4444; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #ef4444; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Redis Commands in Action</h1>
  <p><span class="ic">redis-cli</span> is the fastest way to drive a Redis server interactively:</p>
  <pre class="code-block">$ redis-cli -h cache.internal -p 6379
cache.internal:6379> PING
PONG</pre>
  <h2>Finding and counting keys</h2>
  <p>Two ways to look at the keyspace - and only one is safe in production:</p>
  <pre class="code-block">> KEYS user:*        # DANGER: walks the whole keyspace, can block the server
> SCAN 0 MATCH user:* COUNT 100   # SAFE: cursor-based, returns in batches
1) "0"
2) 1) "user:88:profile"
> DBSIZE
(integer) 12</pre>
  <div class="callout">
    <strong>KEYS blocks the server</strong>
    <p><span class="ic">KEYS</span> scans every key in one shot. On a big cache it can stall Redis for seconds. Prefer <span class="ic">SCAN</span> in anything that touches production.</p>
  </div>
  <h2>Pipelines and transactions</h2>
  <p>A <strong>pipeline</strong> batches many commands into one round trip - latency savings without atomicity:</p>
  <pre class="code-block">> PING
> SET a 1
> MGET a b
PONG</pre>
  <p>A <strong>transaction</strong> (<span class="ic">MULTI</span> ... <span class="ic">EXEC</span>) runs queued commands consecutively, with no other client interleaved:</p>
  <pre class="code-block">> MULTI
OK
> DECR stock:skewers
QUEUED
> EXEC
1) (integer) 7</pre>
  <p>Combine <span class="ic">WATCH</span> with <span class="ic">MULTI</span> to abort when a key you inspected changed out from under you - the classic optimistic-lock pattern.</p>
  <h2>Housekeeping commands</h2>
  <table>
    <tr><th>Command</th><th>Purpose</th></tr>
    <tr><td>EXISTS / DEL / UNLINK</td><td>Test and delete keys (UNLINK is non-blocking)</td></tr>
    <tr><td>EXPIRE / PEXPIRE</td><td>Set expiration; TTL / PTTL to read it</td></tr>
    <tr><td>TYPE</td><td>Report the value structure of a key</td></tr>
    <tr><td>MEMORY USAGE key</td><td>Estimate the bytes a key occupies</td></tr>
    <tr><td>INFO</td><td>Server, memory, stats, replication, and keyspace sections</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Hands on, always</strong>
    <p>Run every command in this course against a disposable local Redis. Typing them by hand builds the muscle memory you need for the capstone.</p>
  </div>
  <div class="callout callout-info">
    <strong>Bytes, not words</strong>
    <p>Keys and values are binary-safe. Newlines, spaces, and arbitrary bytes are legal content - your naming convention is what keeps the keyspace tidy.</p>
  </div>
</div>
</body>
</html>
$html$
),(
  '03D00000-0000-4000-8000-000000000407',
  '03D00000-0000-4000-8000-000000000307',
  1,
  'Keys, Namespaces & TTL',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Keys, Namespaces & TTL</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #ef4444; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #ef4444; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Keys, Namespaces &amp; TTL</h1>
  <p>A Redis key is just a binary-safe string - there are no folders or tables. <strong>You</strong> create the structure with a naming convention, and <strong>expiry</strong> stops the cache from growing forever.</p>
  <h2>Naming: colon-separated, stable first</h2>
  <p>Put the most stable part first so related keys sort together, and finish with the volatile part (an id or timestamp):</p>
  <pre class="code-block">project:deploy:build        # type:entity:identifier
cart:user:88:items
rate:user:88:minute:2026-09-17T12:00
page:v2:4213</pre>
  <ul>
    <li>One delimiter (a colon) and one casing everywhere.</li>
    <li>Short but readable segments - every key byte occupies memory.</li>
    <li>Version the payload when the format changes: <span class="ic">page:v2:4213</span>.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Skip environment in keys</strong>
    <p>Do not bake the environment name into keys. Environments already run on separate servers; injecting the name just bloats keys and complicates migrations.</p>
  </div>
  <h2>TTL: the cache safety valve</h2>
  <pre class="code-block">> SET page:4213 'HTML'              # no TTL - lives until evicted or deleted
> SETEX page:4213 300 'HTML'        # SET plus expiry in one shot
> EXPIRE page:4213 300              # add TTL to an existing key
> TTL page:4213
(integer) 298
> PERSIST page:4213                 # remove the TTL entirely
> TTL page:4213
(integer) -1</pre>
  <h2>Choosing a TTL</h2>
  <table>
    <tr><th>Data</th><th>Sensible TTL</th><th>Why</th></tr>
    <tr><td>Rates and throttles</td><td>Seconds to minutes</td><td>Fresh by definition</td></tr>
    <tr><td>Rendered page fragments</td><td>Seconds</td><td>Reflect rapid content changes</td></tr>
    <tr><td>Reference data</td><td>Minutes to hours</td><td>Changes rarely but still drifts</td></tr>
    <tr><td>Long-lived sessions</td><td>Hours to days</td><td>Slide on activity (sliding window)</td></tr>
  </table>
  <div class="callout">
    <strong>No TTL is a decision too</strong>
    <p>A key without TTL never expires - its only exit is eviction or DEL. Give every cached value a TTL unless you can prove it should live forever.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Sliding expiry</strong>
    <p>Refresh the TTL on each read after a hit to build a sliding session window - auto-logout for idle users, exactly like a real session store.</p>
  </div>
</div>
</body>
</html>
$html$
),(
  '03D00000-0000-4000-8000-000000000408',
  '03D00000-0000-4000-8000-000000000308',
  1,
  'Expiration & Key Lifetime',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Expiration & Key Lifetime</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #ef4444; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #ef4444; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Expiration &amp; Key Lifetime</h1>
  <p>Redis removes expired keys with two complementary mechanisms. Understanding them explains a lot of surprising behavior and avoids nasty production bugs.</p>
  <h2>Lazy expiration</h2>
  <p>When a command touches a key, Redis checks the TTL first. If the key is past due it is deleted on the spot, and the command behaves as if the key never existed:</p>
  <pre class="code-block">> SET cache:quote 'buy low' EX 5
OK
> TTL cache:quote
(integer) 3
> TTL cache:quote          # after the TTL elapsed
(integer) -2              # -2 means: key does not exist
> GET cache:quote
(nil)</pre>
  <h2>Active expiration</h2>
  <p>Redis also sweeps expired keys in the background while handling other work. In small cycles it samples a handful of keys with TTLs, removes any that are past due, and repeats; the loop is bounded so it never starves normal commands. Expired keys that are never touched may therefore linger briefly before the active pass collects them.</p>
  <div class="callout callout-info">
    <strong>Expiry is eventually consistent</strong>
    <p>A key marked to expire may still be counted by <span class="ic">DBSIZE</span> or matched by <span class="ic">SCAN</span> for a moment. Do not build logic that requires exact deletion timing.</p>
  </div>
  <h2>Replication nuance</h2>
  <p>The primary is the authority on expiration. A replica does not expire keys on its own clock; it waits for the primary to send it a DEL. Until then a replica may serve a key the primary has already deleted. Reads from replicas are therefore allowed to be slightly stale by design.</p>
  <h2>TTL under memory pressure</h2>
  <p>Expired keys are reclaimed as soon as they are noticed, even when <span class="ic">maxmemory</span> has been reached - expiration is not eviction, and both run independently. If ten thousand keys share one TTL and all expire at once, expect a wave of lazy deletions and cache misses that you should plan for with jitter.</p>
  <h2>Common lifetime mistakes</h2>
  <ul>
    <li>No TTL on data that goes stale - memory grows forever until eviction kicks in.</li>
    <li>Huge TTLs on fast-changing content - users keep seeing old values.</li>
    <li>Identical TTLs across a large key family - a synchronized expiry storm.</li>
    <li>Trusting a replica to expire on time - it cannot, by design.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Add jitter</strong>
    <p>Spread TTLs with a small random offset (<span class="ic">TTL + random(0..30)</span>) so a hot key family expires gradually instead of all at once. This single tweak prevents many stampede incidents.</p>
  </div>
</div>
</body>
</html>
$html$
),(
  '03D00000-0000-4000-8000-000000000410',
  '03D00000-0000-4000-8000-000000000310',
  1,
  'Eviction Policies',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Eviction Policies</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #ef4444; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #ef4444; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Eviction Policies</h1>
  <p>Memory is finite. When a cache fills up, Redis must decide what to give up. The <span class="ic">maxmemory</span> directive sets the ceiling and the <span class="ic">maxmemory-policy</span> decides who gets evicted first.</p>
  <h2>First, set a ceiling</h2>
  <pre class="code-block">maxmemory 256mb
maxmemory-policy allkeys-lru</pre>
  <p>Without <span class="ic">maxmemory</span>, Redis happily grows until the operating system refuses to give it more - at which point the server may crash or be killed. Always bound it.</p>
  <h2>volatile vs allkeys</h2>
  <ul>
    <li><strong>volatile-*</strong> policies evict only keys that have a TTL set. Keys without a TTL are protected - but the ones that are evicted are exactly the ones you already decided were temporary.</li>
    <li><strong>allkeys-*</strong> policies may evict anything, including keys you intended to keep forever. Useful for a pure cache where every key is disposable.</li>
  </ul>
  <h2>The eviction policies</h2>
  <table>
    <tr><th>Policy</th><th>Behavior when at maxmemory</th></tr>
    <tr><td>noeviction</td><td>Reject every write with an OOM error; reads keep working</td></tr>
    <tr><td>allkeys-lru</td><td>Evict the least-recently-used keys (any key)</td></tr>
    <tr><td>volatile-lru</td><td>Evict the LRU keys among those that have a TTL</td></tr>
    <tr><td>allkeys-lfu</td><td>Evict the least-frequently-used keys</td></tr>
    <tr><td>volatile-lfu</td><td>Evict the LFU keys among those with a TTL</td></tr>
    <tr><td>allkeys-random</td><td>Evict a random key</td></tr>
    <tr><td>volatile-random</td><td>Evict a random key among those with a TTL</td></tr>
    <tr><td>volatile-ttl</td><td>Evict the key expiring soonest (TTL-based)</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>LRU is approximate</strong>
    <p>True LRU would need to track every access. Redis samples a small pool of keys and evicts the least recently used among the sample - a close, cheap approximation. Same for the LFU counters.</p>
  </div>
  <h2>Choosing a policy</h2>
  <ul>
    <li>Pure cache, every key disposable: <strong>allkeys-lru</strong> or <strong>allkeys-lfu</strong>.</li>
    <li>Session store that must not vanish: <strong>volatile-lru</strong> plus a TTL on every session.</li>
    <li>You want writes to fail loudly instead of silently dropping: <strong>noeviction</strong>.</li>
    <li>Uniform access patterns (tokens, ids): <strong>volatile-ttl</strong> or random.</li>
  </ul>
  <pre class="code-block">> CONFIG GET maxmemory-policy
1) "maxmemory-policy"
2) "allkeys-lru"</pre>
  <div class="callout callout-tip">
    <strong>Watch evicted_keys</strong>
    <p><span class="ic">INFO stats</span> reports <span class="ic">evicted_keys</span>. A climbing eviction rate usually means your cache is too small or TTLs are too long - raise capacity or cache smarter, not harder.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03D00000-0000-4000-8000-000000000411',
  '03D00000-0000-4000-8000-000000000311',
  1,
  'Memory Sizing & Fragmentation',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Memory Sizing & Fragmentation</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #ef4444; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #ef4444; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Memory Sizing &amp; Fragmentation</h1>
  <p>Size the cache from data, not from hope. Measure actual usage with <span class="ic">INFO memory</span> and keep fragmentation in check so your memory dollars actually buy cache space.</p>
  <h2>What INFO memory tells you</h2>
  <pre class="code-block">> INFO memory
# Memory
used_memory:402647912
used_memory_human:383.98M
used_memory_rss:631373824
used_memory_rss_human:602.11M
mem_allocator:jemalloc-5.2.1
mem_fragmentation_ratio:1.57</pre>
  <table>
    <tr><th>Metric</th><th>Meaning</th></tr>
    <tr><td>used_memory</td><td>Bytes Redis asked the allocator for (your keyspace)</td></tr>
    <tr><td>used_memory_rss</td><td>Bytes the OS actually gave the process</td></tr>
    <tr><td>mem_fragmentation_ratio</td><td>rss / used_memory - allocator slack and debris</td></tr>
  </table>
  <h2>Fragmentation ratio</h2>
  <ul>
    <li><strong>~1.0 - 1.5</strong>: healthy; small overhead is normal.</li>
    <li><strong>&gt; 1.5</strong>: pages split up by churn (create/delete) or huge jemalloc arenas - consider the active defragmenter.</li>
    <li><strong>&lt; 1.0</strong>: means RSS is below your logical usage - worrying only if swaps peak (overcommit aside).</li>
  </ul>
  <p>Enable online defragmentation in recent versions:</p>
  <pre class="code-block">activedefrag yes
active-defrag-ignore-bytes 100mb
active-defrag-threshold-lower 10</pre>
  <h2>Sizing from data</h2>
  <p>Estimate before you buy: average value size times key count, plus a per-key overhead of about one hundred bytes per key plus the structure base:</p>
  <pre class="code-block">keys = 2,000,000
value = 1 KB on average
data = 2 GB
overhead (keys + dict) ~ 200 MB
RSS slack at 1.2      ~ +400 MB
=> size the node at     ~ 3 GB, maxmemory at 2.5 GB</pre>
  <div class="callout callout-tip">
    <strong>Verify, do not guess</strong>
    <p>Use <span class="ic">MEMORY USAGE key</span> on a sample of real keys, then multiply by expected key count. Adjust the assumptions when traffic tells you otherwise.</p>
  </div>
  <h2>Reclaiming memory</h2>
  <ul>
    <li>Shorten TTLs so stale data leaves sooner.</li>
    <li>Delete whole namespaces with <span class="ic">UNLINK</span> (non-blocking) instead of <span class="ic">DEL</span> on huge values.</li>
    <li>Compact structures: use hashes instead of wholesale JSON for hot objects.</li>
    <li>Restart the node when fragmentation is stubborn and a maintenance window allows it.</li>
  </ul>
  <div class="callout">
    <strong>Eviction is not reclamation</strong>
    <p>Evicting a key returns memory to the allocator, but RSS may stay high until the allocator returns pages to the OS. Watch <span class="ic">used_memory</span>, not just the eviction counter, to judge pressure.</p>
  </div>
</div>
</body>
</html>
$html$
),(
  '03D00000-0000-4000-8000-000000000413',
  '03D00000-0000-4000-8000-000000000313',
  1,
  'Cache-Aside Pattern',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cache-Aside Pattern</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #ef4444; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #ef4444; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Cache-Aside Pattern</h1>
  <p>Cache-aside (lazy loading) is the most common caching pattern: the <strong>application</strong> owns the cache. Reads check the cache first; on a miss the app fetches from the database and writes the answer back; writes update the database and invalidate the cache key.</p>
  <h2>The read path</h2>
  <pre class="code-block">async function getProductHtml(id) {
  const key = 'page:' + id;
  const cached = await redis.get(key);
  if (cached !== null) return cached;      // HIT - done

  const row = await db.query('SELECT body FROM products WHERE id = $1', [id]);
  if (row == null) return notFound();      // MISS - fetch source of truth
  await redis.set(key, row.body, { EX: 300, NX: true });
  return row.body;
}</pre>
  <p>Every miss costs one database query and pays for itself on the next few hits. Set a TTL so the entry eventually refreshes itself, and a small jitter so hot keys do not expire together.</p>
  <h2>The write path: invalidate, do not set</h2>
  <p>When data changes, delete the cache key rather than writing the new value into it. If you write the cache, a slower in-flight reader can still be caching the stale value it fetched a moment ago - and you have to guess a matching TTL anyway:</p>
  <pre class="code-block">async function updateProduct(id, body, conn) {
  await conn.query('UPDATE products SET body = $1 WHERE id = $2', [body, id]);
  await redis.del('page:' + id);           // invalidate - next read rebuilds
}</pre>
  <div class="callout">
    <strong>Why DELETE beats SET</strong>
    <p>Deleting forces the next reader to fetch fresh data. Writing into the cache means the cache and database can disagree for the whole TTL, and you doubled the write work.</p>
  </div>
  <h2>Handling cache failure</h2>
  <ul>
    <li>If the cache is down, treat every read as a miss and go to the database - degrade, do not crash.</li>
    <li>Treat cache timeouts like misses, but do not retry blindly (the cache may be overwhelmed).</li>
    <li>Keep cache writes non-fatal; the DB is the source of truth.</li>
  </ul>
  <h2>Strengths and weaknesses</h2>
  <table>
    <tr><th>S</th><th>W</th></tr>
    <tr><td>Only hot keys are stored</td><td>Misses pay the full database cost</td></tr>
    <tr><td>Simple to implement and reason about</td><td>Every miss is a query; cache is empty at boot</td></tr>
    <tr><td>Data always rebuildable</td><td>Stale data until expiration or invalidation</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Start here</strong>
    <p>Cache-aside is the right default for most services. Reach for the fancier patterns only when its costs - repeated misses, bursty rebuilds - actually show up in your metrics.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03D00000-0000-4000-8000-000000000414',
  '03D00000-0000-4000-8000-000000000314',
  1,
  'Read-Through & Refresh-Ahead',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Read-Through & Refresh-Ahead</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #ef4444; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #ef4444; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Read-Through &amp; Refresh-Ahead</h1>
  <p>In cache-aside the app loads data. The <strong>read-through</strong> and <strong>refresh-ahead</strong> patterns push that responsibility into the cache layer, so callers never see a manual reload dance.</p>
  <h2>Read-through</h2>
  <p>A read-through cache treats a miss as a load instruction: the cache component calls the data source itself, stores the result, and returns it. From the caller it looks like the cache never misses:</p>
  <pre class="code-block">// caller asks the cache layer; the layer handles the miss
const html = await cache.getOrLoad('page:4213', async () =&gt; {
  const row = await db.query('SELECT body FROM products WHERE id = $1', [4213]);
  return row.body;
}, { ttlSeconds: 300 });</pre>
  <ul>
    <li>Readers stay simple - no branching on hit or miss.</li>
    <li>The cache owns TTL policy, locking, and reload behavior in one place.</li>
    <li>Delegation (single-flight) can be baked in so one miss does the fetch for many.</li>
  </ul>
  <h2>Refresh-ahead</h2>
  <p>Refresh-ahead proactively rebuilds a key <em>before</em> it expires. A background task checks keys that are expiring soon (or expired) and reloads them, so a user request never triggers the reload and never sees the miss latency:</p>
  <pre class="code-block"># sketch: worker refreshes hot keys a little before TTL expiry
for key of GET_HOT_KEYS():
    ttl = redis.ttl(key)
    if 0 &lt; ttl &lt; REFRESH_WINDOW and refreshed.lock(key):
        fresh = load_from_source(key)
        redis.set(key, fresh, EX=TTL_FRESH)</pre>
  <h2>When each shines</h2>
  <table>
    <tr><th>Pattern</th><th>Costs</th><th>Best when</th></tr>
    <tr><td>Cache-aside</td><td>Miss = one source fetch</td><td>Any service; simplest to reason about</td></tr>
    <tr><td>Read-through</td><td>Source integration to maintain</td><td>Uniform read bursts; thin read APIs</td></tr>
    <tr><td>Refresh-ahead</td><td>Worker + locking + smarter expiry</td><td>Predictable hot keys; low-latency SLAs</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Refresh-ahead still needs TTL and jitter</strong>
    <p>Refreshing early narrows the staleness window but does not remove staleness. Keep TTLs sane and the refresh window smaller than the TTL so a refresh failure leaves a servable value.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Reuse lock patterns</strong>
    <p>Locks (SET NX) prevent stampedes in read-through and refresh-ahead alike. Whoever wins the lock performs the load; everyone else waits on the result.</p>
  </div>
</div>
</body>
</html>
$html$
),(
  '03D00000-0000-4000-8000-000000000416',
  '03D00000-0000-4000-8000-000000000316',
  1,
  'Write-Through & Write-Behind',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Write-Through & Write-Behind</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #ef4444; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #ef4444; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Write-Through &amp; Write-Behind</h1>
  <p>Cache-aside handles reads; writes need their own strategy. Write-through keeps the cache and database moving together; write-behind accepts a deferred database write in exchange for speed.</p>
  <h2>Write-through</h2>
  <p>Every write updates the cache and the database in the same operation. Readers always find the freshest known value, and the cache never holds something the database has not accepted:</p>
  <pre class="code-block">async function saveProfile(userId, profile) {
  const key = 'user:' + userId + ':profile';
  await redis.hset(key, profile);            // cache first (or in parallel)
  await db.updateProfile(userId, profile);   // then source of truth
}</pre>
  <ul>
    <li>Readers see immediate, never-stale data - ideal for read-mostly hot keys.</li>
    <li>Write path pays double latency: every write touches both stores.</li>
    <li>A failed database write must roll back the cache write, or you cache data that does not exist in the DB.</li>
  </ul>
  <h2>Write-behind (write-back)</h2>
  <p>The application writes to the cache immediately and enqueues the durable write; a worker drains the queue to the database asynchronously:</p>
  <pre class="code-block">// produce: write fast, enqueue for durability
await redis.set('score:48', 9120000);
await redis.rpush('queue:wr:score', '48:9120000');

// consumer: drain in batches
while (job = await redis.blpop('queue:wr:score', 0)) {
    db.applyScore(job);   // batched UPDATEs later
}</pre>
  <div class="callout">
    <strong>Risk in the queue</strong>
    <p>If the process or Redis dies before the worker flushes, those writes are lost. Write-behind is for data you can afford to lose or re-derive - counters, page views - not for financial ledgers.</p>
  </div>
  <h2>Which to pick</h2>
  <table>
    <tr><th>Feature</th><th>Write-through</th><th>Write-behind</th></tr>
    <tr><td>Read freshness</td><td>Always current</td><td>Current at cache</td></tr>
    <tr><td>Write latency</td><td>Slowest link (DB)</td><td>Fast (memory only)</td></tr>
    <tr><td>Data loss window on crash</td><td>Managed by DB txn</td><td>Up to last drain</td></tr>
    <tr><td>Batching database work</td><td>No</td><td>Yes - high throughput</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Batch with streams</strong>
    <p>For production write-behind, use a Redis Stream with a consumer group instead of a plain list: entries persist a while, are reassigned on failure, and the group handles many workers cleanly.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03D00000-0000-4000-8000-000000000417',
  '03D00000-0000-4000-8000-000000000317',
  1,
  'Cache Invalidation & Stampede',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cache Invalidation & Stampede</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #ef4444; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #ef4444; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Cache Invalidation &amp; Stampede Protection</h1>
  <p>The two hardest problems in caching: making stale data leave on time, and keeping a cold or expired key from being rebuilt by ten thousand requests at once.</p>
  <h2>Invalidation toolbox</h2>
  <table>
    <tr><th>Tool</th><th>How it works</th><th>When</th></tr>
    <tr><td>TTL expiry</td><td>The key deletes itself</td><td>Everywhere - the safety net</td></tr>
    <tr><td>Delete-on-write</td><td>The writer removes the key</td><td>Cache-aside writes</td></tr>
    <tr><td>Versioned keys</td><td>Readers use page:v2; old versions ignored or deleted</td><td>Payload formats change</td></tr>
    <tr><td>Generational</td><td>A slug for the whole dataset (stats:42) reused by many keys</td><td>Bulk regenerations</td></tr>
  </table>
  <p>The classic rule for cache-aside: <strong>on update, delete the key</strong>. It is simpler, safer, and cheaper than trying to write an in-sync value.</p>
  <h2>The cache stampede</h2>
  <p>When a hot key expires, every concurrent reader discovers the miss at once. All of them hammer the database, which slows down, which makes the problem worse:</p>
  <pre class="code-block">t0  key expires
t1  reqA miss -> SELECT ...   (starts rebuilding)
t2  reqB miss -> SELECT ...   (duplicate work)
t3  reqC miss -> SELECT ...   (database melts)</pre>
  <h2>Defenses</h2>
  <ul>
    <li><strong>Single-flight lock:</strong> <span class="ic">SET lock:page:4213 1 NX EX 5</span> - only the lock winner rebuilds; others briefly wait, then read the fresh value.</li>
    <li><strong>TTL jitter:</strong> offset each key TTL by a few seconds so a family expires gradually.</li>
    <li><strong>Early refresh:</strong> a worker rebuilds before expiry (refresh-ahead), or readers trigger it when the remaining TTL drops below a threshold.</li>
    <li><strong>Probabilistic early expiration:</strong> expire <em>probabilistically</em> based on remaining TTL to spread the rebuild load over time.</li>
  </ul>
  <pre class="code-block">// one-liner lock in Lua (atomic acquire + read)
local got = redis.call('SET', KEYS[1], '1', 'NX', 'EX', ARGV[1])
return got</pre>
  <div class="callout callout-tip">
    <strong>Measure the storm</strong>
    <p>Watch <span class="ic">keyspace_misses</span> and database query rate after a deploy: a synchronized crash is the fingerprint of a stampede everyone missed.</p>
  </div>
  <div class="callout callout-info">
    <strong>Locks expire, work does not</strong>
    <p>If the lock holder dies mid-rebuild, the lock TTL frees the key quickly. If the rebuild is slow, other readers must block or read-stale-while-rebuilding - pick a lock TTL longer than the rebuild worst case.</p>
  </div>
</div>
</body>
</html>
$html$
),(
  '03D00000-0000-4000-8000-000000000419',
  '03D00000-0000-4000-8000-000000000319',
  1,
  'Redis Persistence: RDB & AOF',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Redis Persistence: RDB & AOF</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #ef4444; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #ef4444; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Redis Persistence: RDB &amp; AOF</h1>
  <p>In-memory data vanishes on restart unless you persist it. Redis has two durable mechanisms - <strong>RDB</strong> snapshots and the <strong>AOF</strong> append-only log - and you choose how much durability to buy.</p>
  <h2>RDB: point-in-time snapshots</h2>
  <p>RDB writes a compressed dump of the whole keyspace to a binary file on a schedule or on demand:</p>
  <pre class="code-block">save 900 1      # snapshot if >= 1 change in 900s
save 300 10     # snapshot if >= 10 changes in 300s
save 60 10000   # snapshot if >= 10000 changes in 60s
dbfilename dump.rdb</pre>
  <p>A snapshot is taken by forking: the parent keeps serving while the child writes the dump - safe, compact, and fast to load. The trade-off: whatever changed between snapshots is <em>lost</em> if the server dies.</p>
  <div class="callout">
    <strong>Fork costs headroom</strong>
    <p>Copy-on-write means the fork can briefly need extra memory and IO. On large datasets schedule snapshots off-peak and keep host headroom.</p>
  </div>
  <h2>AOF: append-only log</h2>
  <pre class="code-block">appendonly yes
appendfilename "appendonly.aof"
appendfsync everysec     # always | everysec | no</pre>
  <p>AOF records each write command as it executes. On restart Redis replays the log to rebuild state. The <span class="ic">appendfsync</span> knob decides how often the OS is forced to flush the buffer to disk:</p>
  <table>
    <tr><th>appendfsync</th><th>Durability</th><th>Cost</th></tr>
    <tr><td>always</td><td>Every write survives (fsync per op)</td><td>Slowest writes - use for critical data</td></tr>
    <tr><td>everysec</td><td>Up to ~1s of writes lost on crash</td><td>Best balance for most systems</td></tr>
    <tr><td>no</td><td>OS decides; widest loss window</td><td>Fastest, weakest durability</td></tr>
  </table>
  <h2>AOF rewrite</h2>
  <p>The log grows forever unless compressed. Redis rewrites it into the minimal set of commands representing current state:</p>
  <pre class="code-block">auto-aof-rewrite-percentage 100
auto-aof-rewrite-min-size 64mb</pre>
  <div class="callout callout-tip">
    <strong>Best of both</strong>
    <p>With <span class="ic">aof-use-rdb-preamble yes</span> an AOF rewrite stores a compact RDB prefix followed by a small AOF tail - fast load, minimal growth, single file.</p>
  </div>
  <h2>RDB vs AOF at a glance</h2>
  <table>
    <tr><th>Criteria</th><th>RDB</th><th>AOF</th></tr>
    <tr><td>Load speed</td><td>Fast</td><td>Slower (replay)</td></tr>
    <tr><td>Size on disk</td><td>Compact</td><td>Larger until rewrite</td></tr>
    <tr><td>Data-loss window</td><td>Since last snapshot</td><td>Controlled by fsync</td></tr>
    <tr><td>Startup</td><td>Read snapshot</td><td>Replay log</td></tr>
  </table>
</div>
</body>
</html>
$html$
),(
  '03D00000-0000-4000-8000-000000000420',
  '03D00000-0000-4000-8000-000000000320',
  1,
  'Choosing a Persistence Strategy',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Choosing a Persistence Strategy</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #ef4444; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #ef4444; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Choosing a Persistence Strategy</h1>
  <p>Persistence is a budget: durability costs throughput, memory, and startup time. Decide what the data is actually worth, then tune the knobs to match.</p>
  <h2>Match durability to the workload</h2>
  <table>
    <tr><th>Workload</th><th>Config</th><th>Rationale</th></tr>
    <tr><td>Pure cache, rebuildable</td><td>Persistence off</td><td>Nothing worth restoring</td></tr>
    <tr><td>Derived reads, can rebuild</td><td>RDB, rare snapshots</td><td>Fast warm-up, small loss window OK</td></tr>
    <tr><td>Session / queue store</td><td>AOF everysec + RDB</td><td>Fast restart, small replay</td></tr>
    <tr><td>Financial/order data</td><td>AOF always</td><td>Lose nothing on crash</td></tr>
  </table>
  <h2>Backups beyond the server</h2>
  <p>Persistence on the box is not a backup - a destroyed disk takes the data with it:</p>
  <pre class="code-block"># off-box backup from a replica (periodic)
redis-cli --rdb /srv/backups/redis_$(date +%F).rdb
# or snapshot with SAVE on a replica, then copy dump.rdb out</pre>
  <ul>
    <li>Back up from a <strong>replica</strong>, never the primary, to avoid extra read load.</li>
    <li>Keep the backup off the same host, ideally offsite, and verify restores.</li>
  </ul>
  <h2>Restore path</h2>
  <ol>
    <li>Stop Redis cleanly.</li>
    <li>Point <span class="ic">dir</span> and <span class="ic">dbfilename</span>/<span class="ic">appendfilename</span> at the backup.</li>
    <li>Start; Redis loads the RDB for state and the AOF for the tail.</li>
    <li>Smoke-test hot keys and the hit ratio before declaring success.</li>
  </ol>
  <div class="callout">
    <strong>Do not mix partial backups</strong>
    <p>RDB and AOF must come from the same point in time or you can resurrect conflicting state. Restore both from one snapshot moment.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Test the drill</strong>
    <p>Actually restore a backup in staging quarterly. An untested backup is a rumor, and a rumor does not survive a real incident.</p>
  </div>
</div>
</body>
</html>
$html$
),(
  '03D00000-0000-4000-8000-000000000422',
  '03D00000-0000-4000-8000-000000000322',
  1,
  'Pub/Sub Messaging',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pub/Sub Messaging</title>
<style>
.lesson-page { font-family:'Segoe UI',system-ui,sans-serif; line-height:1.7; color:#1f2937; max-width:780px; margin:0 auto; padding:8px 16px 32px; }
.lesson-page h1 { color:#111827; font-size:28px; border-bottom:3px solid #dc2626; padding-bottom:10px; margin-bottom:20px; }
.lesson-page h2 { color:#b91c1c; font-size:21px; margin:28px 0 8px; }
.lesson-page p { margin:12px 0; }
.lesson-page ul, .lesson-page ol { margin:12px 0; padding-left:24px; }
.lesson-page li { margin:6px 0; }
.lesson-page .ic { background:#fef2f2; color:#b91c1c; padding:2px 6px; border-radius:4px; font-family:'Consolas','Courier New',monospace; font-size:0.92em; }
.lesson-page pre.code-block { background:#0f172a; color:#e2e8f0; padding:16px; border-radius:8px; overflow-x:auto; font-family:'Consolas','Courier New',monospace; font-size:14px; }
.lesson-page .callout { background:#fef2f2; border-left:4px solid #dc2626; padding:12px 16px; border-radius:6px; margin:16px 0; }
.lesson-page .callout-info { background:#e0f2fe; border-left-color:#0ea5e9; }
.lesson-page .callout-tip { background:#dcfce7; border-left-color:#22c55e; }
.lesson-page .callout strong { text-transform:uppercase; font-size:0.8em; letter-spacing:0.5px; }
.lesson-page table { border-collapse:collapse; width:100%; margin:16px 0; }
.lesson-page table th, .lesson-page table td { border:1px solid #d1d5db; padding:8px 12px; text-align:left; }
.lesson-page table th { background:#fef2f2; color:#b91c1c; }
.dark .lesson-page { color:#e5e7eb; }
.dark .lesson-page h1 { color:#f9fafb; border-bottom-color:#ef4444; }
.dark .lesson-page h2 { color:#fca5a5; }
.dark .lesson-page .ic { background:#450a0a; color:#fca5a5; }
.dark .lesson-page .callout { background:#450a0a; border-left-color:#ef4444; }
.dark .lesson-page .callout-info { background:#0c4a6e; border-left-color:#38bdf8; }
.dark .lesson-page .callout-tip { background:#14532d; border-left-color:#4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color:#4b5563; }
.dark .lesson-page table th { background:#450a0a; color:#fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Pub/Sub Messaging</h1>
  <p>Redis pub/sub is lightweight fan-out: a publisher pushes a message to a channel and every connected subscriber gets it. No storage, no queues, no retries - fire-and-forget distribution.</p>
  <h2>Publish and subscribe</h2>
  <pre class="code-block">> SUBSCRIBE cache:invalidated
Reading messages... (press Ctrl-C to quit)
> PUBLISH cache:invalidated "page:4213"
(integer) 1   # one live subscriber received it</pre>
  <ul>
    <li>Invalidation in a multi-node cache-aside farm - one writer tells all nodes to drop a key.</li>
    <li>Broadcasts: deploys, config reloads, maintenance windows.</li>
    <li>Low-volume live dashboards and notifications.</li>
  </ul>
  <h2>What it is not</h2>
  <div class="callout">
    <strong>At-most-once is a hard rule</strong>
    <p>A message published while a subscriber is down is gone forever. No replay, no storage, no ack. Need any of those? Use a Stream with a consumer group.</p>
  </div>
  <table>
    <tr><th>Criteria</th><th>Pub/Sub</th><th>Streams</th></tr>
    <tr><td>Guarantee</td><td>At-most-once</td><td>At-least-once</td></tr>
    <tr><td>Stores messages</td><td>No</td><td>Yes (retention + trimming)</td></tr>
    <tr><td>Late subscribers</td><td>Miss everything</td><td>Read from any id</td></tr>
    <tr><td>Caching workloads</td><td>Best fit</td><td>Better fit</td></tr>
  </table>
  <h2>Patterns that compose well</h2>
  <ul>
    <li><strong>Pub/sub + local caches:</strong> each node keeps a small L1 cache and subscribes; it drops its local copy when the channel publishes the affected key.</li>
    <li><strong>Channel-per-dataset:</strong> <span class="ic">ch:invalidate:products</span> keeps broadcast domains small.</li>
  </ul>
  <pre class="code-block">const sub = redis.duplicate();
sub.subscribe('cache:invalidated');
sub.on('message', (_ch, key) =&gt; localCache.delete(key));</pre>
  <div class="callout callout-tip">
    <strong>Tiny payloads</strong>
    <p>Publish just the key or an id and let subscribers refetch on demand. Payload-heavy broadcasts double as embedding risks.</p>
  </div>
</div>
</body>
</html>
$html$
),(
  '03D00000-0000-4000-8000-000000000423',
  '03D00000-0000-4000-8000-000000000323',
  1,
  'Replicas, Sentinel & Redis Cluster',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Replicas, Sentinel & Redis Cluster</title>
<style>
.lesson-page { font-family:'Segoe UI',system-ui,sans-serif; line-height:1.7; color:#1f2937; max-width:780px; margin:0 auto; padding:8px 16px 32px; }
.lesson-page h1 { color:#111827; font-size:28px; border-bottom:3px solid #dc2626; padding-bottom:10px; margin-bottom:20px; }
.lesson-page h2 { color:#b91c1c; font-size:21px; margin:28px 0 8px; }
.lesson-page p { margin:12px 0; }
.lesson-page ul, .lesson-page ol { margin:12px 0; padding-left:24px; }
.lesson-page li { margin:6px 0; }
.lesson-page .ic { background:#fef2f2; color:#b91c1c; padding:2px 6px; border-radius:4px; font-family:'Consolas','Courier New',monospace; font-size:0.92em; }
.lesson-page pre.code-block { background:#0f172a; color:#e2e8f0; padding:16px; border-radius:8px; overflow-x:auto; font-family:'Consolas','Courier New',monospace; font-size:14px; }
.lesson-page .callout { background:#fef2f2; border-left:4px solid #dc2626; padding:12px 16px; border-radius:6px; margin:16px 0; }
.lesson-page .callout-info { background:#e0f2fe; border-left-color:#0ea5e9; }
.lesson-page .callout-tip { background:#dcfce7; border-left-color:#22c55e; }
.lesson-page .callout strong { text-transform:uppercase; font-size:0.8em; letter-spacing:0.5px; }
.lesson-page table { border-collapse:collapse; width:100%; margin:16px 0; }
.lesson-page table th, .lesson-page table td { border:1px solid #d1d5db; padding:8px 12px; text-align:left; }
.lesson-page table th { background:#fef2f2; color:#b91c1c; }
.dark .lesson-page { color:#e5e7eb; }
.dark .lesson-page h1 { color:#f9fafb; border-bottom-color:#ef4444; }
.dark .lesson-page h2 { color:#fca5a5; }
.dark .lesson-page .ic { background:#450a0a; color:#fca5a5; }
.dark .lesson-page .callout { background:#450a0a; border-left-color:#ef4444; }
.dark .lesson-page .callout-info { background:#0c4a6e; border-left-color:#38bdf8; }
.dark .lesson-page .callout-tip { background:#14532d; border-left-color:#4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color:#4b5563; }
.dark .lesson-page table th { background:#450a0a; color:#fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Replicas, Sentinel &amp; Redis Cluster</h1>
  <p>One Redis serves one host. Replicas give you reads and failover targets, Sentinel automates leadership, and Cluster shards the dataset across many nodes.</p>
  <h2>Replication</h2>
  <pre class="code-block"># replica config
replicaof 10.0.0.11 6379
replica-read-only yes</pre>
  <ul>
    <li>Replicas stream the primary data via the replication input buffer and then every write.</li>
    <li>Read-only replicas scale read traffic (cache hits, dashboards, backups).</li>
    <li>Replication is async by default, so a replica may be slightly behind the primary.</li>
  </ul>
  <h2>Sentinel: automatic failover</h2>
  <div class="callout">
    <strong>Sentinel is not just a watchdog</strong>
    <p>Sentinel nodes monitor primaries and replicas. When a primary is subjectively down and a quorum of Sentinels agrees, Sentinel promotes a healthy replica and re-points clients. Set a quorum and select a majority of your Sentinel nodes (odd count) so split-brain cannot fork two primaries.</p>
  </div>
  <pre class="code-block">sentinel monitor myredis 10.0.0.11 6379 2
sentinel down-after-milliseconds myredis 5000
sentinel failover-timeout myredis 60000</pre>
  <h2>Redis Cluster: sharding</h2>
  <ul>
    <li>Keys are assigned to <strong>16384 hash slots</strong> via CRC16 of the key name; your drivers turn that into the owning node via CLUSTER SLOTS.</li>
    <li>Every slot has a primary; replicas give each shard a failover.</li>
    <li>Multi-key operations must live in one slot: use tags like {user:42} plus a suffix so co-keyed keys land together.</li>
  </ul>
  <h2>Choosing a topology</h2>
  <table>
    <tr><th>Situation</th><th>Topology</th></tr>
    <tr><td>Single node, want safety</td><td>Primary + replica</td></tr>
    <tr><td>Auto-failover at moderate scale</td><td>Sentinel-managed replicas</td></tr>
    <tr><td>Dataset outgrows one node</td><td>Cluster with replicas per shard</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Cache often fits in one node</strong>
    <p>Before sharding, check whether deduplication, eviction, or smarter value encoding shrinks the working set. Cluster adds client and ops overhead you may not need.</p>
  </div>
</div>
</body>
</html>
$html$
),(
  '03D00000-0000-4000-8000-000000000425',
  '03D00000-0000-4000-8000-000000000325',
  1,
  'Monitoring & Administration',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Monitoring & Administration</title>
<style>
.lesson-page { font-family:'Segoe UI',system-ui,sans-serif; line-height:1.7; color:#1f2937; max-width:780px; margin:0 auto; padding:8px 16px 32px; }
.lesson-page h1 { color:#111827; font-size:28px; border-bottom:3px solid #dc2626; padding-bottom:10px; margin-bottom:20px; }
.lesson-page h2 { color:#b91c1c; font-size:21px; margin:28px 0 8px; }
.lesson-page p { margin:12px 0; }
.lesson-page ul, .lesson-page ol { margin:12px 0; padding-left:24px; }
.lesson-page li { margin:6px 0; }
.lesson-page .ic { background:#fef2f2; color:#b91c1c; padding:2px 6px; border-radius:4px; font-family:'Consolas','Courier New',monospace; font-size:0.92em; }
.lesson-page pre.code-block { background:#0f172a; color:#e2e8f0; padding:16px; border-radius:8px; overflow-x:auto; font-family:'Consolas','Courier New',monospace; font-size:14px; }
.lesson-page .callout { background:#fef2f2; border-left:4px solid #dc2626; padding:12px 16px; border-radius:6px; margin:16px 0; }
.lesson-page .callout-info { background:#e0f2fe; border-left-color:#0ea5e9; }
.lesson-page .callout-tip { background:#dcfce7; border-left-color:#22c55e; }
.lesson-page .callout strong { text-transform:uppercase; font-size:0.8em; letter-spacing:0.5px; }
.lesson-page table { border-collapse:collapse; width:100%; margin:16px 0; }
.lesson-page table th, .lesson-page table td { border:1px solid #d1d5db; padding:8px 12px; text-align:left; }
.lesson-page table th { background:#fef2f2; color:#b91c1c; }
.dark .lesson-page { color:#e5e7eb; }
.dark .lesson-page h1 { color:#f9fafb; border-bottom-color:#ef4444; }
.dark .lesson-page h2 { color:#fca5a5; }
.dark .lesson-page .ic { background:#450a0a; color:#fca5a5; }
.dark .lesson-page .callout { background:#450a0a; border-left-color:#ef4444; }
.dark .lesson-page .callout-info { background:#0c4a6e; border-left-color:#38bdf8; }
.dark .lesson-page .callout-tip { background:#14532d; border-left-color:#4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color:#4b5563; }
.dark .lesson-page table th { background:#450a0a; color:#fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Monitoring &amp; Administration</h1>
  <p>A cache you cannot observe is a cache you cannot trust. Learn the metrics that matter, the dashboard they feed, and the daily administration chores that keep Redis boring-safe.</p>
  <h2>Latency &amp; command visibility</h2>
  <pre class="code-block">redis-cli --stat        # live throughput, evictions, misses
redis-cli --latency     # round-trip latency in ms
redis-cli -p 6379 SLOWLOG GET 20</pre>
  <ul>
    <li><span class="ic">latency doctor</span> points at incidents for you to investigate.</li>
    <li><span class="ic">SLOWLOG</span> lists commands over <span class="ic">slowlog-log-slower-than</span> microseconds - heavy KEYS, large STRLEN, sync-heavy writes show up here.</li>
  </ul>
  <div class="callout">
    <strong>NEVER run KEYS in production</strong>
    <p><span class="ic">KEYS *</span> blocks Redis until it finishes scanning every key. Use <span class="ic">SCAN</span> with a cursor, or move the index into the cache itself (e.g. SETs/SORTED SETs per tag).</p>
  </div>
  <h2>Dashboards you should have</h2>
  <table>
    <tr><th>Metric</th><th>Alert when</th><th>Why</th></tr>
    <tr><td>Hit ratio</td><td>Drops sharply</td><td>Cache dying, TTL too short, stampede</td></tr>
    <tr><td>used_memory</td><td>&gt; 80% maxmemory</td><td>Evictions about to start</td></tr>
    <tr><td>evicted_keys rate</td><td>Sustained spikes</td><td>Undersized cache or long TTLs</td></tr>
    <tr><td>mem_fragmentation_ratio</td><td>&gt; 1.5</td><td>Churn; enable activedefrag</td></tr>
    <tr><td>rejected_connections</td><td>&gt; 0</td><td>maxclients exhausted</td></tr>
    <tr><td>slave/master lag</td><td>Growing</td><td>Replica falling behind</td></tr>
  </table>
  <h2>Administration chores</h2>
  <ul>
    <li><strong>Security:</strong> <span class="ic">protected-mode yes</span>, <span class="ic">rename-command FLUSHALL</span> where warranted, <span class="ic">requirepass</span> or ACL users per service with least privilege.</li>
    <li><strong>Backups:</strong> periodic <span class="ic">redis-cli --rdb</span> from a replica to off-site storage; verify a restore.</li>
    <li><strong>Config drift:</strong> keep config in code (ansible/terraform), not in hand-written conf that diverges.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>One dashboard, one login</strong>
    <p>Route Redis metrics into your usual observability stack (Prometheus/grafana, Datadog, ...). If a metric lives only in a throwaway terminal, nobody acts on it.</p>
  </div>
</div>
</body>
</html>
$html$
),(
  '03D00000-0000-4000-8000-000000000426',
  '03D00000-0000-4000-8000-000000000326',
  1,
  'Capstone: Designing the Cache',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Designing the Cache</title>
<style>
.lesson-page { font-family:'Segoe UI',system-ui,sans-serif; line-height:1.7; color:#1f2937; max-width:780px; margin:0 auto; padding:8px 16px 32px; }
.lesson-page h1 { color:#111827; font-size:28px; border-bottom:3px solid #dc2626; padding-bottom:10px; margin-bottom:20px; }
.lesson-page h2 { color:#b91c1c; font-size:21px; margin:28px 0 8px; }
.lesson-page p { margin:12px 0; }
.lesson-page ul, .lesson-page ol { margin:12px 0; padding-left:24px; }
.lesson-page li { margin:6px 0; }
.lesson-page .ic { background:#fef2f2; color:#b91c1c; padding:2px 6px; border-radius:4px; font-family:'Consolas','Courier New',monospace; font-size:0.92em; }
.lesson-page pre.code-block { background:#0f172a; color:#e2e8f0; padding:16px; border-radius:8px; overflow-x:auto; font-family:'Consolas','Courier New',monospace; font-size:14px; }
.lesson-page .callout { background:#fef2f2; border-left:4px solid #dc2626; padding:12px 16px; border-radius:6px; margin:16px 0; }
.lesson-page .callout-info { background:#e0f2fe; border-left-color:#0ea5e9; }
.lesson-page .callout-tip { background:#dcfce7; border-left-color:#22c55e; }
.lesson-page .callout strong { text-transform:uppercase; font-size:0.8em; letter-spacing:0.5px; }
.lesson-page table { border-collapse:collapse; width:100%; margin:16px 0; }
.lesson-page table th, .lesson-page table td { border:1px solid #d1d5db; padding:8px 12px; text-align:left; }
.lesson-page table th { background:#fef2f2; color:#b91c1c; }
.dark .lesson-page { color:#e5e7eb; }
.dark .lesson-page h1 { color:#f9fafb; border-bottom-color:#ef4444; }
.dark .lesson-page h2 { color:#fca5a5; }
.dark .lesson-page .ic { background:#450a0a; color:#fca5a5; }
.dark .lesson-page .callout { background:#450a0a; border-left-color:#ef4444; }
.dark .lesson-page .callout-info { background:#0c4a6e; border-left-color:#38bdf8; }
.dark .lesson-page .callout-tip { background:#14532d; border-left-color:#4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color:#4b5563; }
.dark .lesson-page table th { background:#450a0a; color:#fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Designing the Cache</h1>
  <p>Design a caching tier for a product catalog serving page views. Write down your decisions before you type a single Redis command - the design is half the deliverable.</p>
  <h2>Step 1 - Profile the workload</h2>
  <ul>
    <li><strong>Read/write mix:</strong> 95% reads, occasional admin updates.</li>
    <li><strong>Hot set:</strong> ~2000 popular product pages drive 80% of traffic.</li>
    <li><strong>Payload:</strong> rendered HTML, ~8 KB average.</li>
    <li><strong>Consistency:</strong> minutes of staleness are acceptable, seconds are not.</li>
  </ul>
  <h2>Step 2 - Decisions to record</h2>
  <table>
    <tr><th>Decision</th><th>Reasonable choice</th><th>Rationale</th></tr>
    <tr><td>Pattern</td><td>Cache-aside</td><td>Simple, rebuildable, trivial to reason about</td></tr>
    <tr><td>Key scheme</td><td>page:{id}:v{ver}</td><td>Versioned keys survive format changes</td></tr>
    <tr><td>Structure</td><td>String per page</td><td>Whole-page reads; no field access needed</td></tr>
    <tr><td>TTL</td><td>300s +- 15s jitter</td><td>Refresh frequently, expire gradually</td></tr>
    <tr><td>Eviction</td><td>allkeys-lru</td><td>Disposable rebuildable data</td></tr>
    <tr><td>Invalidation</td><td>DEL on product update</td><td>Editor saves are rare</td></tr>
    <tr><td>Stampede guard</td><td>SET NX lock, 5s</td><td>One node rebuilds the hot key</td></tr>
    <tr><td>Topology</td><td>Primary + read replica</td><td>Fits in one node; replica for backup/reads</td></tr>
  </table>
  <h2>Step 3 - Capacity math</h2>
  <pre class="code-block">2000 pages * 8 KB = ~16 MB working set
TTL turnover adds ~5% => ~17 MB
+ overhead        eval MEMORY USAGE on samples
=> a 512 MB node gives massive headroom</pre>
  <h2>Step 4 - Validate the design</h2>
  <ul>
    <li>Play an offline burst: can the DB alone still survive a total cache cold start?</li>
    <li>Write the failure modes down: cache down, primary down, slow DB, full disk.</li>
    <li>Define the metrics (hit ratio, latency, eviction) and the alert thresholds now.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Design doc first, code second</strong>
    <p>A one-screen design table beats a week of rework. Pin it to the on-call page - during an incident you do not want to reconstruct the reasoning under pressure.</p>
  </div>
</div>
</body>
</html>
$html$
),(
  '03D00000-0000-4000-8000-000000000427',
  '03D00000-0000-4000-8000-000000000327',
  1,
  'Capstone: Building & Tuning',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Building & Tuning</title>
<style>
.lesson-page { font-family:'Segoe UI',system-ui,sans-serif; line-height:1.7; color:#1f2937; max-width:780px; margin:0 auto; padding:8px 16px 32px; }
.lesson-page h1 { color:#111827; font-size:28px; border-bottom:3px solid #dc2626; padding-bottom:10px; margin-bottom:20px; }
.lesson-page h2 { color:#b91c1c; font-size:21px; margin:28px 0 8px; }
.lesson-page p { margin:12px 0; }
.lesson-page ul, .lesson-page ol { margin:12px 0; padding-left:24px; }
.lesson-page li { margin:6px 0; }
.lesson-page .ic { background:#fef2f2; color:#b91c1c; padding:2px 6px; border-radius:4px; font-family:'Consolas','Courier New',monospace; font-size:0.92em; }
.lesson-page pre.code-block { background:#0f172a; color:#e2e8f0; padding:16px; border-radius:8px; overflow-x:auto; font-family:'Consolas','Courier New',monospace; font-size:14px; }
.lesson-page .callout { background:#fef2f2; border-left:4px solid #dc2626; padding:12px 16px; border-radius:6px; margin:16px 0; }
.lesson-page .callout-info { background:#e0f2fe; border-left-color:#0ea5e9; }
.lesson-page .callout-tip { background:#dcfce7; border-left-color:#22c55e; }
.lesson-page .callout strong { text-transform:uppercase; font-size:0.8em; letter-spacing:0.5px; }
.lesson-page table { border-collapse:collapse; width:100%; margin:16px 0; }
.lesson-page table th, .lesson-page table td { border:1px solid #d1d5db; padding:8px 12px; text-align:left; }
.lesson-page table th { background:#fef2f2; color:#b91c1c; }
.dark .lesson-page { color:#e5e7eb; }
.dark .lesson-page h1 { color:#f9fafb; border-bottom-color:#ef4444; }
.dark .lesson-page h2 { color:#fca5a5; }
.dark .lesson-page .ic { background:#450a0a; color:#fca5a5; }
.dark .lesson-page .callout { background:#450a0a; border-left-color:#ef4444; }
.dark .lesson-page .callout-info { background:#0c4a6e; border-left-color:#38bdf8; }
.dark .lesson-page .callout-tip { background:#14532d; border-left-color:#4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color:#4b5563; }
.dark .lesson-page table th { background:#450a0a; color:#fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Building &amp; Tuning</h1>
  <p>Turn the design into working code, load-test it, then tune with real numbers. The capstone is a full loop: implement, measure, adjust, verify.</p>
  <h2>Build checklist</h2>
  <pre class="code-block">GET/GETEX page:{id}:v{ver}              # read path
SET EX 300 NX                           # miss rebuild (single-flight)
DEL page:{id}:v{ver}                    # invalidation on product save
SLOWLOG GET 10                          # guard against accidental scans</pre>
  <ul>
    <li>Treat every Redis call as fallible: cache down means DB serve, not 500s.</li>
    <li>Log hits and misses with counts so the hit ratio is measurable from day one.</li>
  </ul>
  <h2>Load test</h2>
  <pre class="code-block">redis-benchmark -t SET,GET -n 100000 -c 50
# application-level: simulate 10k readers on 2k hot pages
# assert p99 page latency: cached &lt; 5ms, DB-miss p99 &lt; 150ms</pre>
  <p>Measure before you tune. Changing eviction policy or TTL without numbers is guesswork wearing a lab coat.</p>
  <h2>Tuning knobs, in order</h2>
  <ol>
    <li><strong>maxmemory &amp; policy</strong> - stop evictions if they are eating hot keys.</li>
    <li><strong>TTL &amp; jitter</strong> - lengthen TTLs that increase hit ratio but not staleness complaints.</li>
    <li><strong>Structure</strong> - hash vs string: measure MEMORY USAGE on your payload.</li>
    <li><strong>Topology</strong> - add a read replica only when a real load test says so.</li>
  </ol>
  <h2>Verify the loop</h2>
  <ul>
    <li>Watch hit ratio climb to the target (e.g. 90%+).</li>
    <li>Kill the cache in staging: app must degrade, not crash.</li>
    <li>Trigger an invalidation and confirm the old value disappears fast.</li>
  </ul>
  <div class="callout">
    <strong>Ship the runbook</strong>
    <p>Hand the config, the metrics, and the failure-mode list to the team that will operate it. A tuned cache without an owner is tomorrow incident.</p>
  </div>
</div>
</body>
</html>
$html$
)
ON CONFLICT (id) DO NOTHING;-- ----------------------------------------------------------------------------
-- 6. QUIZZES  (29 questions: 8 short quizzes x3 + final assessment x5)
--    Columns: id, lesson_id, question, explanation, position
-- ----------------------------------------------------------------------------

INSERT INTO quizzes (id, lesson_id, question, explanation, position) VALUES
  ('03D00000-0000-4000-8000-000000000501', '03D00000-0000-4000-8000-000000000303',
   'What is the primary payoff of caching?',
   'Repeated requests are served from memory without touching the source of truth.', 1),
  ('03D00000-0000-4000-8000-000000000502', '03D00000-0000-4000-8000-000000000303',
   'How do you compute the cache hit ratio?',
   'Hits divided by total requests tells you what fraction of reads the cache satisfied.', 2),
  ('03D00000-0000-4000-8000-000000000503', '03D00000-0000-4000-8000-000000000303',
   'What is the core risk of a cache that never expires keys?',
   'Fresh values never replace old ones, so users keep seeing stale data.', 3),
  ('03D00000-0000-4000-8000-000000000504', '03D00000-0000-4000-8000-000000000306',
   'Which Redis data structure maps field names to values within a single key?',
   'A hash stores field/value pairs under one key.', 1),
  ('03D00000-0000-4000-8000-000000000505', '03D00000-0000-4000-8000-000000000306',
   'Which command appends a value to the right side of a list?',
   'RPUSH pushes a value onto the tail of the list.', 2),
  ('03D00000-0000-4000-8000-000000000506', '03D00000-0000-4000-8000-000000000306',
   'The command SET token abc123 EX 300 creates a key that stays how long?',
   'EX 300 sets a lifetime of 300 seconds for the key.', 3),
  ('03D00000-0000-4000-8000-000000000507', '03D00000-0000-4000-8000-000000000309',
   'What does TTL return for a key that has no expiration set?',
   'TTL returns -1 when the key has no expiry and -2 when it does not exist.', 1),
  ('03D00000-0000-4000-8000-000000000508', '03D00000-0000-4000-8000-000000000309',
   'Which command is safe for scanning many keys in production?',
   'SCAN walks the keyspace in small batches instead of blocking the server.', 2),
  ('03D00000-0000-4000-8000-000000000509', '03D00000-0000-4000-8000-000000000309',
   'Which command applies a timeout to a key that already exists?',
   'EXPIRE sets or updates the TTL of an existing key.', 3),
  ('03D00000-0000-4000-8000-000000000510', '03D00000-0000-4000-8000-000000000312',
   'With the allkeys-lru policy, which keys does Redis evict first?',
   'LRU evicts the keys that have not been accessed recently.', 1),
  ('03D00000-0000-4000-8000-000000000511', '03D00000-0000-4000-8000-000000000312',
   'Which eviction policy rejects writes when maxmemory is exhausted?',
   'noeviction returns an OOM error instead of evicting anything.', 2),
  ('03D00000-0000-4000-8000-000000000512', '03D00000-0000-4000-8000-000000000312',
   'What does volatile-lru evict?',
   'It evicts only keys that carry a TTL, leaving permanent keys alone.', 3),('03D00000-0000-4000-8000-000000000513', '03D00000-0000-4000-8000-000000000315',
   'In the cache-aside pattern, who is responsible for loading a missing key?',
   'The application detects the miss, loads the data, and populates the cache.', 1),
  ('03D00000-0000-4000-8000-000000000514', '03D00000-0000-4000-8000-000000000315',
   'How does expiration help keep a cache-aside value fresh?',
   'A TTL forces a natural refresh so stale values are eventually rebuilt.', 2),
  ('03D00000-0000-4000-8000-000000000515', '03D00000-0000-4000-8000-000000000315',
   'What is a cache stampede?',
   'When a hot key expires, many requests race to the data source at the same time.', 3),
  ('03D00000-0000-4000-8000-000000000516', '03D00000-0000-4000-8000-000000000318',
   'What happens in write-through before the write is considered complete?',
   'The cache and the database are both updated before the write is confirmed.', 1),
  ('03D00000-0000-4000-8000-000000000517', '03D00000-0000-4000-8000-000000000318',
   'What is the main benefit of write-behind?',
   'The database write is deferred, so the operation returns faster.', 2),
  ('03D00000-0000-4000-8000-000000000518', '03D00000-0000-4000-8000-000000000318',
   'How can you stop concurrent rebuilds of an expired hot key?',
   'Use a lock acquired with SET NX so only one caller rebuilds the value.', 3),
  ('03D00000-0000-4000-8000-000000000519', '03D00000-0000-4000-8000-000000000321',
   'What does an RDB snapshot contain?',
   'A point-in-time dump of the keyspace written to a compact binary file.', 1),
  ('03D00000-0000-4000-8000-000000000520', '03D00000-0000-4000-8000-000000000321',
   'Which appendfsync level best balances durability and throughput?',
   'everysec may lose at most a second of writes and stays fast.', 2),
  ('03D00000-0000-4000-8000-000000000521', '03D00000-0000-4000-8000-000000000321',
   'What is often the right persistence choice for a pure cache?',
   'Disable persistence entirely so the cache runs as fast as possible.', 3),
  ('03D00000-0000-4000-8000-000000000522', '03D00000-0000-4000-8000-000000000324',
   'What is Redis pub/sub best suited for?',
   'Fanning a message out to many live subscribers at once.', 1),
  ('03D00000-0000-4000-8000-000000000523', '03D00000-0000-4000-8000-000000000324',
   'What does Redis Sentinel do when a primary fails?',
   'It promotes a healthy replica automatically when a quorum of Sentinels agrees.', 2),
  ('03D00000-0000-4000-8000-000000000524', '03D00000-0000-4000-8000-000000000324',
   'How does Redis Cluster distribute keys across nodes?',
   'It maps keys to 16384 hash slots computed from the key name.', 3),('03D00000-0000-4000-8000-000000000525', '03D00000-0000-4000-8000-000000000328',
   'Which command is safe for bulk-scanning keys in production?',
   'SCAN iterates the keyspace in batches without blocking the server.', 1),
  ('03D00000-0000-4000-8000-000000000526', '03D00000-0000-4000-8000-000000000328',
   'What is the classic hazard of cache-aside consistency?',
   'Without invalidation, the cache can serve stale data indefinitely.', 2),
  ('03D00000-0000-4000-8000-000000000527', '03D00000-0000-4000-8000-000000000328',
   'Which mechanism is an append-only log of write operations?',
   'AOF records every write so state can be replayed after a restart.', 3),
  ('03D00000-0000-4000-8000-000000000528', '03D00000-0000-4000-8000-000000000328',
   'How does allkeys-lru differ from volatile-lru?',
   'volatile-lru evicts only keys with a TTL; allkeys-lru may evict any key.', 4),
  ('03D00000-0000-4000-8000-000000000529', '03D00000-0000-4000-8000-000000000328',
   'Which change scales Redis read throughput?',
   'Read replicas serve reads and keep the primary free.', 5)
ON CONFLICT (id) DO NOTHING;-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options, 4 per question, exactly one correct each)
--    Columns: id, quiz_id, text, is_correct, position
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- 501: primary payoff
  ('03D00000-0000-4000-8000-000000001001', '03D00000-0000-4000-8000-000000000501',
   'It serves repeated requests from faster storage with less load on the source.', TRUE,  1),
  ('03D00000-0000-4000-8000-000000001002', '03D00000-0000-4000-8000-000000000501',
   'It permanently stores data that would otherwise be deleted.', FALSE, 2),
  ('03D00000-0000-4000-8000-000000001003', '03D00000-0000-4000-8000-000000000501',
   'It duplicates every database write to a second system.', FALSE, 3),
  ('03D00000-0000-4000-8000-000000001004', '03D00000-0000-4000-8000-000000000501',
   'It guarantees the database never needs to be queried.', FALSE, 4),
  -- 502: hit ratio
  ('03D00000-0000-4000-8000-000000001005', '03D00000-0000-4000-8000-000000000502',
   'Misses divided by total requests.', FALSE, 1),
  ('03D00000-0000-4000-8000-000000001006', '03D00000-0000-4000-8000-000000000502',
   'Expired keys divided by active keys.', FALSE, 2),
  ('03D00000-0000-4000-8000-000000001007', '03D00000-0000-4000-8000-000000000502',
   'Hits divided by total requests.', TRUE,  3),
  ('03D00000-0000-4000-8000-000000001008', '03D00000-0000-4000-8000-000000000502',
   'Database queries saved per minute.', FALSE, 4),
  -- 503: never-expiring risk
  ('03D00000-0000-4000-8000-000000001009', '03D00000-0000-4000-8000-000000000503',
   'It consumes more CPU on every read.', FALSE, 1),
  ('03D00000-0000-4000-8000-000000001010', '03D00000-0000-4000-8000-000000000503',
   'Entries go stale and users see old data.', TRUE,  2),
  ('03D00000-0000-4000-8000-000000001011', '03D00000-0000-4000-8000-000000000503',
   'It stops accepting new keys entirely.', FALSE, 3),
  ('03D00000-0000-4000-8000-000000001012', '03D00000-0000-4000-8000-000000000503',
   'Eviction becomes impossible to configure.', FALSE, 4),
  -- 504: hash structure
  ('03D00000-0000-4000-8000-000000001013', '03D00000-0000-4000-8000-000000000504',
   'A list.', FALSE, 1),
  ('03D00000-0000-4000-8000-000000001014', '03D00000-0000-4000-8000-000000000504',
   'A hash.', TRUE,  2),
  ('03D00000-0000-4000-8000-000000001015', '03D00000-0000-4000-8000-000000000504',
   'A set.', FALSE, 3),
  ('03D00000-0000-4000-8000-000000001016', '03D00000-0000-4000-8000-000000000504',
   'A stream.', FALSE, 4),
  -- 505: RPUSH
  ('03D00000-0000-4000-8000-000000001017', '03D00000-0000-4000-8000-000000000505',
   'RPUSH', TRUE,  1),
  ('03D00000-0000-4000-8000-000000001018', '03D00000-0000-4000-8000-000000000505',
   'LPUSH', FALSE, 2),
  ('03D00000-0000-4000-8000-000000001019', '03D00000-0000-4000-8000-000000000505',
   'SADD', FALSE, 3),
  ('03D00000-0000-4000-8000-000000001020', '03D00000-0000-4000-8000-000000000505',
   'APPEND', FALSE, 4),
  -- 506: EX 300
  ('03D00000-0000-4000-8000-000000001021', '03D00000-0000-4000-8000-000000000506',
   'It never expires.', FALSE, 1),
  ('03D00000-0000-4000-8000-000000001022', '03D00000-0000-4000-8000-000000000506',
   '300 milliseconds.', FALSE, 2),
  ('03D00000-0000-4000-8000-000000001023', '03D00000-0000-4000-8000-000000000506',
   '300 seconds.', TRUE,  3),
  ('03D00000-0000-4000-8000-000000001024', '03D00000-0000-4000-8000-000000000506',
   'Until the server restarts.', FALSE, 4),
  -- 507: TTL -1
  ('03D00000-0000-4000-8000-000000001025', '03D00000-0000-4000-8000-000000000507',
   '-1', TRUE,  1),
  ('03D00000-0000-4000-8000-000000001026', '03D00000-0000-4000-8000-000000000507',
   '0', FALSE, 2),
  ('03D00000-0000-4000-8000-000000001027', '03D00000-0000-4000-8000-000000000507',
   'Infinity', FALSE, 3),
  ('03D00000-0000-4000-8000-000000001028', '03D00000-0000-4000-8000-000000000507',
   'It throws an error.', FALSE, 4),
  -- 508: SCAN
  ('03D00000-0000-4000-8000-000000001029', '03D00000-0000-4000-8000-000000000508',
   'KEYS *', FALSE, 1),
  ('03D00000-0000-4000-8000-000000001030', '03D00000-0000-4000-8000-000000000508',
   'DUMP *', FALSE, 2),
  ('03D00000-0000-4000-8000-000000001031', '03D00000-0000-4000-8000-000000000508',
   'SCAN', TRUE,  3),
  ('03D00000-0000-4000-8000-000000001032', '03D00000-0000-4000-8000-000000000508',
   'FLUSHALL', FALSE, 4),
  -- 509: EXPIRE
  ('03D00000-0000-4000-8000-000000001033', '03D00000-0000-4000-8000-000000000509',
   'TIMEOUT', FALSE, 1),
  ('03D00000-0000-4000-8000-000000001034', '03D00000-0000-4000-8000-000000000509',
   'REFRESH', FALSE, 2),
  ('03D00000-0000-4000-8000-000000001035', '03D00000-0000-4000-8000-000000000509',
   'PERSIST', FALSE, 3),
  ('03D00000-0000-4000-8000-000000001036', '03D00000-0000-4000-8000-000000000509',
   'EXPIRE', TRUE,  4),-- 510: allkeys-lru
  ('03D00000-0000-4000-8000-000000001037', '03D00000-0000-4000-8000-000000000510',
   'The least recently used keys.', TRUE,  1),
  ('03D00000-0000-4000-8000-000000001038', '03D00000-0000-4000-8000-000000000510',
   'The most recently used keys.', FALSE, 2),
  ('03D00000-0000-4000-8000-000000001039', '03D00000-0000-4000-8000-000000000510',
   'The keys with the shortest names.', FALSE, 3),
  ('03D00000-0000-4000-8000-000000001040', '03D00000-0000-4000-8000-000000000510',
   'The smallest values.', FALSE, 4),
  -- 511: noeviction
  ('03D00000-0000-4000-8000-000000001041', '03D00000-0000-4000-8000-000000000511',
   'allkeys-lru', FALSE, 1),
  ('03D00000-0000-4000-8000-000000001042', '03D00000-0000-4000-8000-000000000511',
   'noeviction', TRUE,  2),
  ('03D00000-0000-4000-8000-000000001043', '03D00000-0000-4000-8000-000000000511',
   'volatile-random', FALSE, 3),
  ('03D00000-0000-4000-8000-000000001044', '03D00000-0000-4000-8000-000000000511',
   'allkeys-lfu', FALSE, 4),
  -- 512: volatile-lru
  ('03D00000-0000-4000-8000-000000001045', '03D00000-0000-4000-8000-000000000512',
   'Any key regardless of TTL.', FALSE, 1),
  ('03D00000-0000-4000-8000-000000001046', '03D00000-0000-4000-8000-000000000512',
   'Only the smallest keys.', FALSE, 2),
  ('03D00000-0000-4000-8000-000000001047', '03D00000-0000-4000-8000-000000000512',
   'Only keys that have a TTL set.', TRUE,  3),
  ('03D00000-0000-4000-8000-000000001048', '03D00000-0000-4000-8000-000000000512',
   'Every key when memory is low.', FALSE, 4),
  -- 513: cache-aside owner
  ('03D00000-0000-4000-8000-000000001049', '03D00000-0000-4000-8000-000000000513',
   'The database server.', FALSE, 1),
  ('03D00000-0000-4000-8000-000000001050', '03D00000-0000-4000-8000-000000000513',
   'A background worker.', FALSE, 2),
  ('03D00000-0000-4000-8000-000000001051', '03D00000-0000-4000-8000-000000000513',
   'The Redis scheduler.', FALSE, 3),
  ('03D00000-0000-4000-8000-000000001052', '03D00000-0000-4000-8000-000000000513',
   'The application.', TRUE,  4),
  -- 514: TTL freshness
  ('03D00000-0000-4000-8000-000000001053', '03D00000-0000-4000-8000-000000000514',
   'It deletes all the keys of a namespace.', FALSE, 1),
  ('03D00000-0000-4000-8000-000000001054', '03D00000-0000-4000-8000-000000000514',
   'A natural TTL forces a refresh from the source.', TRUE,  2),
  ('03D00000-0000-4000-8000-000000001055', '03D00000-0000-4000-8000-000000000514',
   'It moves the key to a replica.', FALSE, 3),
  ('03D00000-0000-4000-8000-000000001056', '03D00000-0000-4000-8000-000000000514',
   'It compresses the value to save space.', FALSE, 4),
  -- 515: stampede
  ('03D00000-0000-4000-8000-000000001057', '03D00000-0000-4000-8000-000000000515',
   'Many requests hit the data source at once after expiry.', TRUE,  1),
  ('03D00000-0000-4000-8000-000000001058', '03D00000-0000-4000-8000-000000000515',
   'A cache fills up faster than it can evict.', FALSE, 2),
  ('03D00000-0000-4000-8000-000000001059', '03D00000-0000-4000-8000-000000000515',
   'Replicas fall behind beyond their input buffer.', FALSE, 3),
  ('03D00000-0000-4000-8000-000000001060', '03D00000-0000-4000-8000-000000000515',
   'A publisher sends messages to dead subscribers.', FALSE, 4),
  -- 516: write-through
  ('03D00000-0000-4000-8000-000000001061', '03D00000-0000-4000-8000-000000000516',
   'The cache is updated only after the database commit.', FALSE, 1),
  ('03D00000-0000-4000-8000-000000001062', '03D00000-0000-4000-8000-000000000516',
   'The write waits for a replica acknowledgement.', FALSE, 2),
  ('03D00000-0000-4000-8000-000000001063', '03D00000-0000-4000-8000-000000000516',
   'The cache is updated synchronously alongside the database.', TRUE,  3),
  ('03D00000-0000-4000-8000-000000001064', '03D00000-0000-4000-8000-000000000516',
   'The value is evicted and never cached.', FALSE, 4),
  -- 517: write-behind benefit
  ('03D00000-0000-4000-8000-000000001065', '03D00000-0000-4000-8000-000000000517',
   'The database receives writes immediately.', FALSE, 1),
  ('03D00000-0000-4000-8000-000000001066', '03D00000-0000-4000-8000-000000000517',
   'Lower latency because the database write is deferred.', TRUE,  2),
  ('03D00000-0000-4000-8000-000000001067', '03D00000-0000-4000-8000-000000000517',
   'No cache memory is used.', FALSE, 3),
  ('03D00000-0000-4000-8000-000000001068', '03D00000-0000-4000-8000-000000000517',
   'Stale reads are impossible.', FALSE, 4),
  -- 518: stampede lock
  ('03D00000-0000-4000-8000-000000001069', '03D00000-0000-4000-8000-000000000518',
   'A distributed lock like SET NX.', TRUE,  1),
  ('03D00000-0000-4000-8000-000000001070', '03D00000-0000-4000-8000-000000000518',
   'Run KEYS on every request.', FALSE, 2),
  ('03D00000-0000-4000-8000-000000001071', '03D00000-0000-4000-8000-000000000518',
   'Disable TTLs entirely.', FALSE, 3),
  ('03D00000-0000-4000-8000-000000001072', '03D00000-0000-4000-8000-000000000518',
   'Replicate the primary twice.', FALSE, 4),-- 519: RDB snapshot
  ('03D00000-0000-4000-8000-000000001073', '03D00000-0000-4000-8000-000000000519',
   'Only the keys that changed in the last minute.', FALSE, 1),
  ('03D00000-0000-4000-8000-000000001074', '03D00000-0000-4000-8000-000000000519',
   'The full command log since startup.', FALSE, 2),
  ('03D00000-0000-4000-8000-000000001075', '03D00000-0000-4000-8000-000000000519',
   'The schema of the keyspace.', FALSE, 3),
  ('03D00000-0000-4000-8000-000000001076', '03D00000-0000-4000-8000-000000000519',
   'A point-in-time dump of the dataset to disk.', TRUE,  4),
  -- 520: everysec
  ('03D00000-0000-4000-8000-000000001077', '03D00000-0000-4000-8000-000000000520',
   'always', FALSE, 1),
  ('03D00000-0000-4000-8000-000000001078', '03D00000-0000-4000-8000-000000000520',
   'everysec', TRUE,  2),
  ('03D00000-0000-4000-8000-000000001079', '03D00000-0000-4000-8000-000000000520',
   'none', FALSE, 3),
  ('03D00000-0000-4000-8000-000000001080', '03D00000-0000-4000-8000-000000000520',
   'lazy', FALSE, 4),
  -- 521: pure cache
  ('03D00000-0000-4000-8000-000000001081', '03D00000-0000-4000-8000-000000000521',
   'AOF with everysec.', FALSE, 1),
  ('03D00000-0000-4000-8000-000000001082', '03D00000-0000-4000-8000-000000000521',
   'RDB every minute.', FALSE, 2),
  ('03D00000-0000-4000-8000-000000001083', '03D00000-0000-4000-8000-000000000521',
   'Disable persistence entirely for speed.', TRUE,  3),
  ('03D00000-0000-4000-8000-000000001084', '03D00000-0000-4000-8000-000000000521',
   'Both RDB and AOF together.', FALSE, 4),-- 522: pub/sub fit
  ('03D00000-0000-4000-8000-000000001085', '03D00000-0000-4000-8000-000000000522',
   'Fanning a message out to many subscribers.', TRUE,  1),
  ('03D00000-0000-4000-8000-000000001086', '03D00000-0000-4000-8000-000000000522',
   'Guaranteed message delivery with retries.', FALSE, 2),
  ('03D00000-0000-4000-8000-000000001087', '03D00000-0000-4000-8000-000000000522',
   'Persistent job queues.', FALSE, 3),
  ('03D00000-0000-4000-8000-000000001088', '03D00000-0000-4000-8000-000000000522',
   'Storing durable chat history.', FALSE, 4),
  -- 523: sentinel
  ('03D00000-0000-4000-8000-000000001089', '03D00000-0000-4000-8000-000000000523',
   'It restarts the failed process.', FALSE, 1),
  ('03D00000-0000-4000-8000-000000001090', '03D00000-0000-4000-8000-000000000523',
   'It warns clients to stop reading.', FALSE, 2),
  ('03D00000-0000-4000-8000-000000001091', '03D00000-0000-4000-8000-000000000523',
   'It promotes a healthy replica automatically.', TRUE,  3),
  ('03D00000-0000-4000-8000-000000001092', '03D00000-0000-4000-8000-000000000523',
   'It flushes all keys to disk.', FALSE, 4),
  -- 524: cluster slots
  ('03D00000-0000-4000-8000-000000001093', '03D00000-0000-4000-8000-000000000524',
   'Round-robin by connection.', FALSE, 1),
  ('03D00000-0000-4000-8000-000000001094', '03D00000-0000-4000-8000-000000000524',
   'Across 16384 hash slots.', TRUE,  2),
  ('03D00000-0000-4000-8000-000000001095', '03D00000-0000-4000-8000-000000000524',
   'By alphabetical key order.', FALSE, 3),
  ('03D00000-0000-4000-8000-000000001096', '03D00000-0000-4000-8000-000000000524',
   'By value size.', FALSE, 4),
  -- 525: safe scan
  ('03D00000-0000-4000-8000-000000001097', '03D00000-0000-4000-8000-000000000525',
   'SCAN', TRUE,  1),
  ('03D00000-0000-4000-8000-000000001098', '03D00000-0000-4000-8000-000000000525',
   'KEYS *', FALSE, 2),
  ('03D00000-0000-4000-8000-000000001099', '03D00000-0000-4000-8000-000000000525',
   'MGET *', FALSE, 3),
  ('03D00000-0000-4000-8000-000000001100', '03D00000-0000-4000-8000-000000000525',
   'FLUSHDB', FALSE, 4),
  -- 526: consistency hazard
  ('03D00000-0000-4000-8000-000000001101', '03D00000-0000-4000-8000-000000000526',
   'The cache never contains the newest data.', FALSE, 1),
  ('03D00000-0000-4000-8000-000000001102', '03D00000-0000-4000-8000-000000000526',
   'Serving stale data if the cache is not invalidated after an update.', TRUE,  2),
  ('03D00000-0000-4000-8000-000000001103', '03D00000-0000-4000-8000-000000000526',
   'Losing writes on restart.', FALSE, 3),
  ('03D00000-0000-4000-8000-000000001104', '03D00000-0000-4000-8000-000000000526',
   'Replicas diverging from the primary.', FALSE, 4),
  -- 527: AOF
  ('03D00000-0000-4000-8000-000000001105', '03D00000-0000-4000-8000-000000000527',
   'RDB', FALSE, 1),
  ('03D00000-0000-4000-8000-000000001106', '03D00000-0000-4000-8000-000000000527',
   'The replication buffer.', FALSE, 2),
  ('03D00000-0000-4000-8000-000000001107', '03D00000-0000-4000-8000-000000000527',
   'AOF', TRUE,  3),
  ('03D00000-0000-4000-8000-000000001108', '03D00000-0000-4000-8000-000000000527',
   'The slowlog.', FALSE, 4),
  -- 528: lru comparison
  ('03D00000-0000-4000-8000-000000001109', '03D00000-0000-4000-8000-000000000528',
   'allkeys-lru uses LFU counters.', FALSE, 1),
  ('03D00000-0000-4000-8000-000000001110', '03D00000-0000-4000-8000-000000000528',
   'volatile-lru evicts the oldest key.', FALSE, 2),
  ('03D00000-0000-4000-8000-000000001111', '03D00000-0000-4000-8000-000000000528',
   'allkeys-lru evicts only expiring keys.', FALSE, 3),
  ('03D00000-0000-4000-8000-000000001112', '03D00000-0000-4000-8000-000000000528',
   'volatile-lru only evicts keys that have a TTL set.', TRUE,  4),
  -- 529: read scaling
  ('03D00000-0000-4000-8000-000000001113', '03D00000-0000-4000-8000-000000000529',
   'Enable AOF rewrite.', FALSE, 1),
  ('03D00000-0000-4000-8000-000000001114', '03D00000-0000-4000-8000-000000000529',
   'Add read replicas.', TRUE,  2),
  ('03D00000-0000-4000-8000-000000001115', '03D00000-0000-4000-8000-000000000529',
   'Raise maxmemory.', FALSE, 3),
  ('03D00000-0000-4000-8000-000000001116', '03D00000-0000-4000-8000-000000000529',
   'Set appendfsync always.', FALSE, 4)
ON CONFLICT (id) DO NOTHING;
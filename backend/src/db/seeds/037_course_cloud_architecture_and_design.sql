-- ============================================================================
-- SEED 037: Complete course — "Cloud Architecture & Design"
-- ----------------------------------------------------------------------------
-- Instructor : David Kim          (10000000-0000-4000-8000-000000000004)
-- Category   : Cloud Computing    (20000000-0000-4000-8000-000000000004)
-- Level      : ADVANCED · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Cloud Architecture Foundations → C1 Architecture Pillars & Design Principles · C2 Well-Architected Frameworks
--   M2 Scalability & High Availability → C3 Scalability & Elasticity · C4 High Availability & Failover
--   M3 Decoupling & Event-Driven       → C5 Decoupling & Message Passing · C6 Serverless & Microservices Patterns
--   M4 Edge, Security & Delivery      → C7 Edge & Content Delivery · C8 Security Architecture
--   M5 Cost, Optimization & Capstone  → C9 Cost Management & Optimization · C10 Capstone: Designing a Resilient Platform
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
  '02500000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000004',
  '20000000-0000-4000-8000-000000000004',
  'Cloud Architecture & Design',
  'cloud-architecture-and-design',
  'Design cloud systems that last. Master the architecture pillars, well-architected frameworks, scalability and elasticity, high availability and failover, decoupling and queues, serverless patterns, edge delivery, security architecture, and cost optimization — then architect a resilient multi-tier platform end to end.',
  'PUBLISHED',
  'ADVANCED',
  'SUBSCRIPTION',
  35
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('02500000-0000-4000-8000-000000000011', '02500000-0000-4000-8000-000000000001', 'Apply the cloud architecture pillars and a well-architected framework to real workloads.',       1),
  ('02500000-0000-4000-8000-000000000012', '02500000-0000-4000-8000-000000000001', 'Design scalable, elastic systems that scale out gracefully under load and back down when idle.', 2),
  ('02500000-0000-4000-8000-000000000013', '02500000-0000-4000-8000-000000000001', 'Architect high-availability and multi-region failover with clear recovery objectives.',              3),
  ('02500000-0000-4000-8000-000000000014', '02500000-0000-4000-8000-000000000001', 'Build decoupled, event-driven, and serverless patterns using queues, topics, and workflows.',     4),
  ('02500000-0000-4000-8000-000000000015', '02500000-0000-4000-8000-000000000001', 'Secure, deliver, and optimize — harden identity and network boundaries, use the edge, and control cost.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('02500000-0000-4000-8000-000000000101', '02500000-0000-4000-8000-000000000001', 1, 'Cloud Architecture Foundations',   'Learn the architecture pillars and the well-architected frameworks that guide every decision.',               'PUBLISHED'),
  ('02500000-0000-4000-8000-000000000102', '02500000-0000-4000-8000-000000000001', 2, 'Scalability & High Availability',  'Scale predictably and survive failures with elasticity, failover, and multi-region patterns.',               'PUBLISHED'),
  ('02500000-0000-4000-8000-000000000103', '02500000-0000-4000-8000-000000000001', 3, 'Decoupling & Event-Driven Patterns','Decouple components with queues and design serverless, microservices-based systems.',                     'PUBLISHED'),
  ('02500000-0000-4000-8000-000000000104', '02500000-0000-4000-8000-000000000001', 4, 'Edge, Security & Delivery',       'Deliver globally through CDNs and the edge, and secure identity, network, and data layers.',                 'PUBLISHED'),
  ('02500000-0000-4000-8000-000000000105', '02500000-0000-4000-8000-000000000001', 5, 'Cost, Optimization & Capstone',   'Control cloud spend and architect a complete resilient platform from requirements to review.',              'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('02500000-0000-4000-8000-000000000201', '02500000-0000-4000-8000-000000000101', 1, 'Architecture Pillars & Design Principles', 'The core building blocks of any cloud design.',     'PUBLISHED'),
  ('02500000-0000-4000-8000-000000000202', '02500000-0000-4000-8000-000000000101', 2, 'Well-Architected Frameworks',              'Evaluate a workload against the six pillars.',       'PUBLISHED'),
  ('02500000-0000-4000-8000-000000000203', '02500000-0000-4000-8000-000000000102', 1, 'Scalability & Elasticity',                 'Growth paths and matching capacity to demand.',      'PUBLISHED'),
  ('02500000-0000-4000-8000-000000000204', '02500000-0000-4000-8000-000000000102', 2, 'High Availability & Failover',             'Nines, health checks, and multi-region survival.',   'PUBLISHED'),
  ('02500000-0000-4000-8000-000000000205', '02500000-0000-4000-8000-000000000103', 1, 'Decoupling & Message Passing',             'Queues, topics, and event buses that absorb spikes.', 'PUBLISHED'),
  ('02500000-0000-4000-8000-000000000206', '02500000-0000-4000-8000-000000000103', 2, 'Serverless & Microservices Patterns',      'Functions, workflows, and service boundaries.',      'PUBLISHED'),
  ('02500000-0000-4000-8000-000000000207', '02500000-0000-4000-8000-000000000104', 1, 'Edge & Content Delivery',                  'CDNs, caching, and compute at the edge.',             'PUBLISHED'),
  ('02500000-0000-4000-8000-000000000208', '02500000-0000-4000-8000-000000000104', 2, 'Security Architecture',                    'Identity, network isolation, and data protection.',   'PUBLISHED'),
  ('02500000-0000-4000-8000-000000000209', '02500000-0000-4000-8000-000000000105', 1, 'Cost Management & Optimization',           'FinOps, right-sizing, and spend levers.',             'PUBLISHED'),
  ('02500000-0000-4000-8000-000000000210', '02500000-0000-4000-8000-000000000105', 2, 'Capstone: Designing a Resilient Platform', 'Design, secure, and review a full platform.',         'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 02500000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('02500000-0000-4000-8000-000000000301', '02500000-0000-4000-8000-000000000201', 1, 'The Pillars of Cloud Architecture',     'Understand the six pillars that guide every architectural decision.',                 'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02500000-0000-4000-8000-000000000302', '02500000-0000-4000-8000-000000000201', 2, 'Designing for Failure & Redundancy',    'Build systems that assume components will fail and still keep working.',              'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02500000-0000-4000-8000-000000000303', '02500000-0000-4000-8000-000000000201', 3, 'Cloud Foundations Quiz',                'Check your understanding of pillars and redundancy.',                                 'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02500000-0000-4000-8000-000000000304', '02500000-0000-4000-8000-000000000202', 1, 'The Well-Architected Framework',        'Learn the pillar-by-pillar review model shared by all major clouds.',                 'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02500000-0000-4000-8000-000000000305', '02500000-0000-4000-8000-000000000202', 2, 'Applying the Pillars to Workloads',     'Turn framework questions into an actionable improvement plan.',                       'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('02500000-0000-4000-8000-000000000306', '02500000-0000-4000-8000-000000000202', 3, 'Well-Architected Review Quiz',          'Verify you can map practices to the correct pillar.',                                 'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02500000-0000-4000-8000-000000000307', '02500000-0000-4000-8000-000000000203', 1, 'Scaling Up vs Scaling Out',             'Compare vertical growth with horizontal, load-balanced scale.',                        'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02500000-0000-4000-8000-000000000308', '02500000-0000-4000-8000-000000000203', 2, 'Elasticity & Capacity Planning',        'Match capacity to demand with reactive and predictive autoscaling.',                  'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('02500000-0000-4000-8000-000000000309', '02500000-0000-4000-8000-000000000203', 3, 'Scalability & Elasticity Quiz',         'Test your scaling knowledge.',                                                        'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02500000-0000-4000-8000-000000000310', '02500000-0000-4000-8000-000000000204', 1, 'High Availability Fundamentals',        'Measure availability in nines and understand SLAs and dependency chains.',            'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02500000-0000-4000-8000-000000000311', '02500000-0000-4000-8000-000000000204', 2, 'Failover & Multi-Region Patterns',      'Choose active-active or active-passive and define RTO and RPO.',                      'TEXT',  'PUBLISHED', 'FREE', 10, 11),
  ('02500000-0000-4000-8000-000000000312', '02500000-0000-4000-8000-000000000204', 3, 'High Availability Quiz',                'Check your understanding of nines and failover.',                                     'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02500000-0000-4000-8000-000000000313', '02500000-0000-4000-8000-000000000205', 1, 'Decoupled Architectures',               'Replace tight call chains with async messaging and events.',                           'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('02500000-0000-4000-8000-000000000314', '02500000-0000-4000-8000-000000000205', 2, 'Queues, Topics & Event Buses',          'Work with queues, fan-out topics, streams, and dead-letter handling.',                'TEXT',  'PUBLISHED', 'FREE', 10, 11),
  ('02500000-0000-4000-8000-000000000315', '02500000-0000-4000-8000-000000000205', 3, 'Decoupling & Messaging Quiz',           'Verify your messaging fundamentals.',                                                 'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02500000-0000-4000-8000-000000000316', '02500000-0000-4000-8000-000000000206', 1, 'Serverless Architecture Patterns',      'Design event-driven functions that scale without servers.',                           'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02500000-0000-4000-8000-000000000317', '02500000-0000-4000-8000-000000000206', 2, 'Orchestration, Sagas & Microservices',  'Coordinate workflows and split systems along clear boundaries.',                      'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02500000-0000-4000-8000-000000000318', '02500000-0000-4000-8000-000000000206', 3, 'Serverless & Microservices Quiz',       'Test your serverless and orchestration skills.',                                      'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02500000-0000-4000-8000-000000000319', '02500000-0000-4000-8000-000000000207', 1, 'CDN & Edge Computing',                  'Deliver content from the edge and run logic near your users.',                        'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('02500000-0000-4000-8000-000000000320', '02500000-0000-4000-8000-000000000207', 2, 'Caching & Global Delivery',             'Layer caches, set cache headers, and refresh content safely.',                        'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02500000-0000-4000-8000-000000000321', '02500000-0000-4000-8000-000000000207', 3, 'Edge & CDN Quiz',                       'Check your delivery and caching knowledge.',                                          'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02500000-0000-4000-8000-000000000322', '02500000-0000-4000-8000-000000000208', 1, 'Identity, Network & Data Security',     'Layer identity, network isolation, and encryption into the design.',                  'TEXT',  'PUBLISHED', 'FREE', 10, 11),
  ('02500000-0000-4000-8000-000000000323', '02500000-0000-4000-8000-000000000208', 2, 'Securing the Cloud Architecture',       'Threat-model, protect secrets, and build detection and response.',                    'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02500000-0000-4000-8000-000000000324', '02500000-0000-4000-8000-000000000208', 3, 'Security Architecture Quiz',            'Verify your security fundamentals.',                                                  'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02500000-0000-4000-8000-000000000325', '02500000-0000-4000-8000-000000000209', 1, 'Cloud Cost Management & FinOps',        'Track, right-size, and optimize spend with engineering and finance together.',        'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02500000-0000-4000-8000-000000000326', '02500000-0000-4000-8000-000000000210', 1, 'Capstone: Designing the Platform',      'Translate requirements into a concrete multi-tier architecture.',                     'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02500000-0000-4000-8000-000000000327', '02500000-0000-4000-8000-000000000210', 2, 'Capstone: Cost, Security & Operations', 'Harden the capstone design and review it pillar by pillar.',                          'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02500000-0000-4000-8000-000000000328', '02500000-0000-4000-8000-000000000210', 3, 'Final Assessment',                     'Prove you can architect, harden, and optimize a cloud platform.',                    'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 02500000-…-0401 .. 0427)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '02500000-0000-4000-8000-000000000401',
  '02500000-0000-4000-8000-000000000301',
  1,
  'The Pillars of Cloud Architecture',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Pillars of Cloud Architecture</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5e9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0369a1; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0f2fe; color: #0369a1; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffedd5; border-left: 4px solid #f97316; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0f9ff; color: #0369a1; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #38bdf8; }
.dark .lesson-page h2 { color: #7dd3fc; }
.dark .lesson-page .ic { background: #0c4a6e; color: #7dd3fc; }
.dark .lesson-page .callout { background: #431407; border-left-color: #fb923c; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #334155; }
.dark .lesson-page table th { background: #082f49; color: #7dd3fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>The Pillars of Cloud Architecture</h1>
  <p>Cloud architecture is the set of decisions you make about <strong>compute, storage, networking, and data</strong> — and how those pieces behave together under load, failure, and change. Unlike a drawing, an architecture is <em>evaluated by its behavior</em>: how fast it recovers, how cheaply it runs, how safely it holds your data.</p>
  <p>Every major cloud provider publishes a well-architected framework built on the same six pillars:</p>
  <table>
    <tr><th>Pillar</th><th>Core question</th><th>Example concern</th></tr>
    <tr><td>Operational Excellence</td><td>Can you run and improve it?</td><td>Automated deployments, monitoring</td></tr>
    <tr><td>Security</td><td>Is it safe from harm?</td><td>Least privilege, encryption</td></tr>
    <tr><td>Reliability</td><td>Does it recover fast?</td><td>Failover, DR, self-healing</td></tr>
    <tr><td>Performance Efficiency</td><td>Does it use resources well?</td><td>Right-sizing, serverless</td></tr>
    <tr><td>Cost Optimization</td><td>Are you paying only for value?</td><td>Autoscaling, spot instances</td></tr>
    <tr><td>Sustainability</td><td>What is the environmental impact?</td><td>Idle elimination, efficiency</td></tr>
  </table>
  <h2>Design principles that cut across pillars</h2>
  <ul>
    <li><strong>Design for failure</strong> — assume any component can die and keep the service alive.</li>
    <li><strong>Build with loose coupling</strong> — independent components that exchange messages, not direct calls.</li>
    <li><strong>Automate everything</strong> — infrastructure as code, pipelines, and self-healing probes.</li>
    <li><strong>Make data-driven decisions</strong> — measure latency, errors, and cost before you change anything.</li>
    <li><strong>Think about total cost</strong> — the cheapest instance is rarely the cheapest workload.</li>
  </ul>
  <p>A high-level blueprint might look like this — an edge layer, a compute tier, and a data layer, each replaceable:</p>
  <pre class="code-block">User ──► CDN/Edge ──► Load Balancer ──► App Instances ──► Database
                     (cached)          (auto-scaled)      (replicated)
                              └────► Queue ──► Workers (async work)</pre>
  <div class="callout callout-tip">
    <strong>Start with requirements</strong>
    <p>Tiers, zones, and patterns all serve goals: a target latency, a downtime budget, an incident response time. Write those down first — the whole course will keep tying decisions back to them.</p>
  </div>
  <div class="callout callout-info">
    <strong>Vocab</strong>
    <p>You will see <span class="ic">AZ</span> (availability zone, an isolated datacenter) and <span class="ic">Region</span> (a cluster of AZs) constantly. Redundancy across AZs is table stakes; redundancy across regions is a strategy, not a default.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02500000-0000-4000-8000-000000000402',
  '02500000-0000-4000-8000-000000000302',
  1,
  'Designing for Failure & Redundancy',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Designing for Failure & Redundancy</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5e9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0369a1; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0f2fe; color: #0369a1; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffedd5; border-left: 4px solid #f97316; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0f9ff; color: #0369a1; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #38bdf8; }
.dark .lesson-page h2 { color: #7dd3fc; }
.dark .lesson-page .ic { background: #0c4a6e; color: #7dd3fc; }
.dark .lesson-page .callout { background: #431407; border-left-color: #fb923c; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #334155; }
.dark .lesson-page table th { background: #082f49; color: #7dd3fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Designing for Failure &amp; Redundancy</h1>
  <p>The first rule of cloud architecture: <strong>everything fails eventually</strong> — disks, instances, load balancers, even whole data centers. Your design &ldquo;works&rdquo; only when it assumes failure and still delivers the service. That is what reliability means in practice.</p>
  <h2>Redundancy: how much, where?</h2>
  <p>Redundancy means running more than one instance of a critical component so no single one is irreplaceable. Scope it in layers:</p>
  <table>
    <tr><th>Scope</th><th>What it protects</th><th>Recovery speed</th></tr>
    <tr><td>Component</td><td>A failed disk or process</td><td>Seconds (auto-restart)</td></tr>
    <tr><td>Instance</td><td>A crashed virtual machine</td><td>Seconds to minutes</td></tr>
    <tr><td>Availability Zone</td><td>A datacenter outage</td><td>Minutes (multi-AZ)</td></tr>
    <tr><td>Region</td><td>A regional event</td><td>Minutes to hours</td></tr>
  </table>
  <h2>Three behaviors that make redundancy work</h2>
  <ul>
    <li><strong>No single point of failure (SPOF).</strong> Every critical link has a backup path. If a component has no replica, it is your SPOF.</li>
    <li><strong>Fail fast.</strong> Detect a dead component within seconds so your load balancer can route traffic away before users feel it.</li>
    <li><strong>Idempotency.</strong> Retrying an operation must be safe. Whether it ran once or five times, the result is the same.</li>
  </ul>
  <h2>Retry with backoff</h2>
  <p>When a call fails transiently, retry — but never in a tight hot loop:</p>
  <pre class="code-block">async function callWithRetry(fn, attempts = 4) {
  let delay = 100;                 // start small
  for (let i = 0; i &lt; attempts; i++) {
    try { return await fn(); }
    catch (err) {
      if (i === attempts - 1) throw err;
      const jitter = Math.random() * 50;
      await sleep(delay + jitter);  // exponential + jitter
      delay *= 2;
    }
  }
}</pre>
  <div class="callout">
    <strong>Retry storms are real</strong>
    <p>Millions of clients retrying at the same instant after an outage will melt the service that just recovered. Add backoff, jitter, and capped retries.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Degrade gracefully</strong>
    <p>When a dependency dies, serve a reduced but correct experience — stale cache, read-only mode — instead of a hard error. Users forgive slowness; they forgive empty pages far less.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02500000-0000-4000-8000-000000000404',
  '02500000-0000-4000-8000-000000000304',
  1,
  'The Well-Architected Framework',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Well-Architected Framework</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5e9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0369a1; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0f2fe; color: #0369a1; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffedd5; border-left: 4px solid #f97316; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0f9ff; color: #0369a1; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #38bdf8; }
.dark .lesson-page h2 { color: #7dd3fc; }
.dark .lesson-page .ic { background: #0c4a6e; color: #7dd3fc; }
.dark .lesson-page .callout { background: #431407; border-left-color: #fb923c; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #334155; }
.dark .lesson-page table th { background: #082f49; color: #7dd3fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>The Well-Architected Framework</h1>
  <p>The well-architected framework (<span class="ic">WAF</span>) is a review model — a structured set of questions that judge a workload against best practices. AWS, Azure, and Google each publish one; the pillars are the same, only the names differ.</p>
  <p>A review is <em>not</em> about ticking boxes. It is a conversation that produces a prioritized list of weaknesses with concrete fixes. You score a practice as <strong>not applied</strong>, <strong>partially applied</strong>, or <strong>fully applied</strong>, then plan the gaps.</p>
  <h2>What each pillar rewards</h2>
  <table>
    <tr><th>Pillar</th><th>Fully applied looks like…</th><th>Review question</th></tr>
    <tr><td>Operational Excellence</td><td>Infra as code, blameless postmortems</td><td>How do you understand and improve your workload?</td></tr>
    <tr><td>Security</td><td>IAM least privilege, encryption, SPD on the perimeter</td><td>How do you protect identity, data, and systems?</td></tr>
    <tr><td>Reliability</td><td>Multi-AZ, automated failover, tested DR</td><td>How do you recover from failure and meet demand?</td></tr>
    <tr><td>Performance Efficiency</td><td>Right-sized resources, serverless where sensible</td><td>How do you use resources efficiently and evolve?</td></tr>
    <tr><td>Cost Optimization</td><td>Autoscaling, committed use, no waste</td><td>How do you spend only on what adds value?</td></tr>
    <tr><td>Sustainability</td><td>Idle capacity eliminated, efficient regions</td><td>How do you minimize environmental impact?</td></tr>
  </table>
  <h2>Mindset shifts</h2>
  <ul>
    <li><strong>In the cloud, best practices are accessible.</strong> Auto-healing, encryption, and global DNS are products, not heroic engineering.</li>
    <li><strong>The cloud is not a datacenter you rent.</strong> Moving a VM unchanged gives you almost nothing — you must adopt managed services.</li>
    <li><strong>Trade-offs are explicit.</strong> The framework forces you to say what reliability costs and whether you will pay for it.</li>
  </ul>
  <pre class="code-block">review = {
  workload: "orders-api",
  pillar_scores: { reliability: "partial", security: "full", cost: "partial" },
  top_finding: "single-AZ database — no automated failover",
  action: "enable multi-AZ; retest RTO in next game day"
}</pre>
  <div class="callout callout-tip">
    <strong>Review frequently</strong>
    <p>Architectures rot. Dependencies change, traffic doubles, features accumulate. Re-run the review after every major change, not just at kickoff.</p>
  </div>
  <div class="callout callout-info">
    <strong>There is no perfect score</strong>
    <p>&ldquo;Fully applied&rdquo; everywhere is usually over-engineered. The framework exists to expose trade-offs so you choose them, rather than stumble into them.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02500000-0000-4000-8000-000000000405',
  '02500000-0000-4000-8000-000000000305',
  1,
  'Applying the Pillars to Workloads',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Applying the Pillars to Workloads</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5e9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0369a1; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0f2fe; color: #0369a1; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffedd5; border-left: 4px solid #f97316; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0f9ff; color: #0369a1; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #38bdf8; }
.dark .lesson-page h2 { color: #7dd3fc; }
.dark .lesson-page .ic { background: #0c4a6e; color: #7dd3fc; }
.dark .lesson-page .callout { background: #431407; border-left-color: #fb923c; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #334155; }
.dark .lesson-page table th { background: #082f49; color: #7dd3fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Applying the Pillars to Workloads</h1>
  <p>Knowing the pillars is not the discipline — <strong>running a structured review</strong> is. This is the loop you repeat for every workload:</p>
  <ol>
    <li><strong>Define the workload</strong> — the service, its users, its criticality (what happens if it drops?).</li>
    <li><strong>Set indicators</strong> — uptime target, p95 latency, cost per request, recovery time.</li>
    <li><strong>Interview each pillar</strong> — answer the &ldquo;How do you…&rdquo; questions with evidence, not intentions.</li>
    <li><strong>Score and rank findings</strong> — small effort × big risk first.</li>
    <li><strong>Write an action plan</strong> — each finding becomes a task with an owner and a done-date.</li>
  </ol>
  <h2>Common findings by pillar</h2>
  <table>
    <tr><th>Pillar</th><th>Finding you will see</th><th>First fix</th></tr>
    <tr><td>Operational Excellence</td><td>Manual deploys on a shared server</td><td>Pipeline + immutable image</td></tr>
    <tr><td>Security</td><td>One long-lived admin key for everything</td><td>Scoped roles, short-lived credentials</td></tr>
    <tr><td>Reliability</td><td>Database in a single AZ, no backup test</td><td>Multi-AZ replica + restore drills</td></tr>
    <tr><td>Performance Efficiency</td><td>48-core instances running at 5% CPU</td><td>Right-size, then scale out</td></tr>
    <tr><td>Cost Optimization</td><td>Dev and prod environments equal in size</td><td>Autoscale dev down, use spot</td></tr>
  </table>
  <h2>Trade-offs are the point</h2>
  <p>The framework never answers a question for you. Three 9s of uptime cost more than two 9s; putting a cache in front of truth adds staleness risk. Leadership should sign off on those choices explicitly.</p>
  <pre class="code-block">reliability_target: 99.9%   # ~8.7h downtime allowance per year
cost_budget:        $1,800/mo
design_commit:      multi-AZ app, single-AZ DB, no DR region
accepted_risk:      AZ-level DB loss = up to 1 h restore</pre>
  <div class="callout callout-info">
    <strong>Score the whole system</strong>
    <p>Review the <em>workload</em>, not the prettiest diagram slide. Include the queue, the cron job, the cron that emails you — unmaintained parts count.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Write findings as hypotheses</strong>
    <p>&ldquo;Autoscaling will cut the bill 30%&rdquo; is testable. After the change, look at the dashboards. If the hypothesis dies, revert. Reviews that end in verified outcomes beat ones that end in slide decks.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02500000-0000-4000-8000-000000000407',
  '02500000-0000-4000-8000-000000000307',
  1,
  'Scaling Up vs Scaling Out',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Scaling Up vs Scaling Out</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5e9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0369a1; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0f2fe; color: #0369a1; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffedd5; border-left: 4px solid #f97316; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0f9ff; color: #0369a1; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #38bdf8; }
.dark .lesson-page h2 { color: #7dd3fc; }
.dark .lesson-page .ic { background: #0c4a6e; color: #7dd3fc; }
.dark .lesson-page .callout { background: #431407; border-left-color: #fb923c; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #334155; }
.dark .lesson-page table th { background: #082f49; color: #7dd3fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Scaling Up vs Scaling Out</h1>
  <p>When demand grows, you have two basic moves. <strong>Scaling up</strong> (vertical) buys a bigger machine. <strong>Scaling out</strong> (horizontal) adds more machines behind a load balancer. They are not interchangeable.</p>
  <table>
    <tr><th>Aspect</th><th>Scale up (vertical)</th><th>Scale out (horizontal)</th></tr>
    <tr><td>Mechanism</td><td>Bigger CPU, RAM, disk</td><td>More instances of the same size</td></tr>
    <tr><td>Ceiling</td><td>Hardware limits of the largest VM</td><td>None practical — keep adding</td></tr>
    <tr><td>Disruption</td><td>Restart required; brief outage</td><td>Zero — new nodes join traffic</td></tr>
    <tr><td>Requirement</td><td>Nothing special</td><td>Stateless app, load balancer</td></tr>
    <tr><td>Resilience</td><td>Single fat SPOF</td><td>Loss of one node is invisible</td></tr>
  </table>
  <h2>Why statelessness is the unlock</h2>
  <p>A load balancer can send a request to <em>any</em> instance — but only if the instance keeps nothing about the user locally. Sessions in memory break that trick. Move session state to a shared store (Redis, the database) or store it in a signed cookie. The moment instances are disposable, scaling becomes mechanical.</p>
  <pre class="code-block"># Auto-scaling group — declare the shape, not the count
resource "aws_autoscaling_group" "web" {
  min_size         = 2
  max_size         = 20
  desired_capacity = 2

  launch_template  = aws_launch_template.web.id
  vpc_zone_identifier = [
    aws_subnet.app_a.id,
    aws_subnet.app_b.id
  ]

  target_group_arns = [aws_lb_target_group.web.arn]
}</pre>
  <h2>When scale up still wins</h2>
  <ul>
    <li><strong>Databases</strong> — many relational engines are hard to shard; a beefier primary often beats premature partitioning.</li>
    <li><strong>In-memory state</strong> — caches like Redis hold everything in RAM on one node.</li>
    <li><strong>Workloads that split poorly</strong> — batch jobs that must see the whole dataset at once.</li>
  </ul>
  <h2>Partition when both stall</h2>
  <p>Eventually one server cannot hold the data or the connections. <strong>Partitioning</strong> (sharding) splits responsibility by a key — user id, region, tenant — so each node serves a slice and no node is a bottleneck.</p>
  <div class="callout callout-tip">
    <strong>Scale out first, partition last</strong>
    <p>Horizontal scaling uses the discipline you already have (statelessness, LB, health checks). Partitioning changes the data model and every query. Do not shard until scale-out is genuinely exhausted.</p>
  </div>
  <div class="callout callout-info">
    <strong>Load tests lie, so test honestly</strong>
    <p>The perf ceiling of your app is a graph, not a number. Push until latency spikes, find the bottleneck (CPU? DB? lock contention?), then choose the scaling move that attacks that bottleneck.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02500000-0000-4000-8000-000000000408',
  '02500000-0000-4000-8000-000000000308',
  1,
  'Elasticity & Capacity Planning',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Elasticity & Capacity Planning</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5e9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0369a1; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0f2fe; color: #0369a1; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffedd5; border-left: 4px solid #f97316; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0f9ff; color: #0369a1; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #38bdf8; }
.dark .lesson-page h2 { color: #7dd3fc; }
.dark .lesson-page .ic { background: #0c4a6e; color: #7dd3fc; }
.dark .lesson-page .callout { background: #431407; border-left-color: #fb923c; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #334155; }
.dark .lesson-page table th { background: #082f49; color: #7dd3fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Elasticity &amp; Capacity Planning</h1>
  <p><strong>Scalability</strong> is the ability to grow; <strong>elasticity</strong> is the ability to grow <em>and shrink</em> to match demand in real time. Elasticity is what turns scalability into a cost lever instead of a fixed bill.</p>
  <h2>Two ways to trigger scaling</h2>
  <table>
    <tr><th>Mode</th><th>How it decides</th><th>Best for</th></tr>
    <tr><td>Reactive (dynamic)</td><td>Metrics now: CPU, queue depth, requests</td><td>Unpredictable spikes</td></tr>
    <tr><td>Predictive (schedule)</td><td>Known calendar: business hours, launches</td><td>Predictable rhythms</td></tr>
    <tr><td>Scheduled</td><td>Fixed times you set explicitly</td><td>Daily/weekly cycles</td></tr>
  </table>
  <p>A healthy policy scales out on live signals <em>and</em> pre-warms for known events. Capacity that only reacts is always one autoscaling cycle behind the spike.</p>
  <h2>The number-one enemy: over-provisioning</h2>
  <p>Running for the peak is renting a stadium for the year. The largest cloud bill in most companies is simply instances sitting at 5% utilization. Elasticity fixes this — <em>if</em> the app can tolerate instances coming and going.</p>
  <pre class="code-block"># Target tracking — the cloud keeps CPU near 60%
resource "aws_autoscaling_policy" "cpu" {
  name                   = "web-cpu-60"
  autoscaling_group_name = aws_autoscaling_group.web.name
  policy_type            = "TargetTrackingScaling"
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 60.0
  }
}</pre>
  <h2>Capacity planning hasnt died — it moved</h2>
  <ul>
    <li><strong>Forecast demand</strong> — growth, launches, seasonality. Schedules need this.</li>
    <li><strong>Design for the surprise</strong> — a warm pool of pre-initialized instances shortens the worst-case scale-out.</li>
    <li><strong>Know your cooldowns</strong> — instance warm-up (image size, startup time) sets the floor on how fast you can grow.</li>
    <li><strong>Scale-in is the discipline</strong> — shrinking during idle is what actually pays the bill down.</li>
  </ul>
  <div class="callout">
    <strong>Autoscale is not magic</strong>
    <p>If a single instance takes 6 minutes to serve traffic, a 10x spike kills you before the cluster catches up. Pre-warm for spikes you can foresee; accept and communicate those you cannot.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Queue depth beats CPU</strong>
    <p>CPU can read 70% while work piles up because the bottleneck is a downstream DB. Scale workers on <em>backlog</em> — the length of the queue they drain — and you scale exactly with demand.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02500000-0000-4000-8000-000000000410',
  '02500000-0000-4000-8000-000000000310',
  1,
  'High Availability Fundamentals',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>High Availability Fundamentals</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5e9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0369a1; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0f2fe; color: #0369a1; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffedd5; border-left: 4px solid #f97316; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0f9ff; color: #0369a1; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #38bdf8; }
.dark .lesson-page h2 { color: #7dd3fc; }
.dark .lesson-page .ic { background: #0c4a6e; color: #7dd3fc; }
.dark .lesson-page .callout { background: #431407; border-left-color: #fb923c; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #334155; }
.dark .lesson-page table th { background: #082f49; color: #7dd3fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>High Availability Fundamentals</h1>
  <p>Availability is the fraction of time a system is usable. It is scored in <strong>nines</strong>, and the nines get brutally expensive as you climb:</p>
  <table>
    <tr><th>SLA</th><th>Downtime per year</th><th>Downtime per month</th></tr>
    <tr><td>99%</td><td>3.65 days</td><td>7.3 hours</td></tr>
    <tr><td>99.9%</td><td>8.77 hours</td><td>43.8 minutes</td></tr>
    <tr><td>99.95%</td><td>4.38 hours</td><td>21.9 minutes</td></tr>
    <tr><td>99.99%</td><td>52.6 minutes</td><td>4.4 minutes</td></tr>
    <tr><td>99.999%</td><td>5.26 minutes</td><td>26 seconds</td></tr>
  </table>
  <p>Notice the jump from 99.9% to 99.99% demands ten times less downtime. That is why realistic targets matter: chasing an extra nine can triple your architecture cost for a gain your users never perceive.</p>
  <h2>Your availability is a product of the chain</h2>
  <p>If a request must cross LB, app, cache, and database, each at 99.9%, the math multiplies: <span class="ic">0.999 × 0.999 × 0.999 × 0.999 ≈ 0.996</span> — 99.6%, worse than any single link. One weakly-redundant dependency silently caps your true availability. Find that dependency and fix it first.</p>
  <h2>What SLAs actually cover</h2>
  <ul>
    <li>An <span class="ic">SLA</span> is a contract (credits for missed targets) — you build for the number your customers need.</li>
    <li><span class="ic">RTO</span> — recovery time objective: how long can we be down?</li>
    <li><span class="ic">RPO</span> — recovery point objective: how many minutes of data may we lose?</li>
    <li>Maintenance windows count as downtime to users unless you plan truly zero-impact releases.</li>
  </ul>
  <h2>Health checks: the eyes of the system</h2>
  <pre class="code-block"># DC23: deep health check — does it actually serve?
GET /healthz  → 200 + {"status":"ok"}

# Separate concerns:
#  /healthz  👉 process alive?   (called every 5s)
#  /readyz   👉 dependencies reachable? (called during deploy)</pre>
  <div class="callout callout-info">
    <strong>Health cut-off vs timeout</strong>
    <p>A load balancer removes an instance after N failed checks. Choose the window smaller than a user&rsquo;s patience but larger than a normal GC pause — otherwise healthy nodes get euthanized.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Test the switch, not the theory</strong>
    <p>Discoverability wins golden weeks for a reason: run failure drills (kill an instance, drain an AZ) and watch traffic shift. An untested failover is a promise you will honor during your worst outage.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02500000-0000-4000-8000-000000000411',
  '02500000-0000-4000-8000-000000000311',
  1,
  'Failover & Multi-Region Patterns',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Failover & Multi-Region Patterns</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5e9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0369a1; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0f2fe; color: #0369a1; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffedd5; border-left: 4px solid #f97316; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0f9ff; color: #0369a1; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #38bdf8; }
.dark .lesson-page h2 { color: #7dd3fc; }
.dark .lesson-page .ic { background: #0c4a6e; color: #7dd3fc; }
.dark .lesson-page .callout { background: #431407; border-left-color: #fb923c; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #334155; }
.dark .lesson-page table th { background: #082f49; color: #7dd3fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Failover &amp; Multi-Region Patterns</h1>
  <p>Failover is the art of moving a service from a broken site to a healthy one without anyone noticing. Two fundamental shapes exist, and they are about <strong>who holds traffic while healthy</strong>:</p>
  <h2>Active-active vs active-passive</h2>
  <table>
    <tr><th>Pattern</th><th>Traffic</th><th>Cost</th><th>Failover</th></tr>
    <tr><td>Active-active</td><td>Split across both sites now</td><td>Double or near-double</td><td>Instant, automatic</td></tr>
    <tr><td>Active-passive</td><td>All on the primary; standby waits</td><td>Standby can be tiny</td><td>Minutes, mostly automatic</td></tr>
  </table>
  <p>Active-passive is the pragmatic default for enterprises with one region of data gravity; active-active suits globally-close, read-skewed workloads like content or catalog serving.</p>
  <h2>Failover triggers</h2>
  <ul>
    <li><strong>Health checks</strong> — LB marks instances dead and drains traffic.</li>
    <li><strong>Database replication state</strong> — if primary stops replicating, promote the replica.</li>
    <li><strong>DNS failover</strong> — the routing policy flips the record to the backup site when a probe fails.</li>
    <li><strong>Runbook / manual step</strong> — for decisions a machine should not make (mass fraud, legal hold).</li>
  </ul>
  <h2>Four disaster-recovery postures</h2>
  <table>
    <tr><th>Posture</th><th>What exists off-site</th><th>RTO / RPO</th></tr>
    <tr><td>Backup &amp; restore</td><td>Backups only</td><td>Hours / 24h</td></tr>
    <tr><td>Pilot light</td><td>Smallest footprint + data</td><td>Tens of minutes / minutes</td></tr>
    <tr><td>Warm standby</td><td>Full scaled-down copy</td><td>Minutes / minutes</td></tr>
    <tr><td>Multi-site active-active</td><td>Full running copy</td><td>Seconds / zero</td></tr>
  </table>
  <p>Each step up the ladder multiplies cost — so your DR posture should be a priced decision made against RTO/RPO, not a hope.</p>
  <pre class="code-block"># Route 53 failover: primary answers unless its probe fails
resource "aws_route53_record" "app_failover" {
  name    = "app.example.com"
  type    = "A"
  set_identifier = "primary"
  failover_routing_policy {
    type = "PRIMARY"
  }
  health_check_id = aws_route53_health_check.app.id
  alias {
    zone_id = aws_lb.primary.zone_id
  }
}</pre>
  <div class="callout">
    <strong>Failover has a partner: failback</strong>
    <p>Returning to the original region is half the job. Data written while in the backup must replicate back — plan the runbook before you ever cut over.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Canaries in the DR region</strong>
    <p>Synthetic probes that <em>exercise</em> the standby (login, read, write a test row) prove it would work under fire. A standby nobody tests is a tribute to the future outage.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02500000-0000-4000-8000-000000000413',
  '02500000-0000-4000-8000-000000000313',
  1,
  'Decoupled Architectures',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Decoupled Architectures</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5e9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0369a1; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0f2fe; color: #0369a1; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffedd5; border-left: 4px solid #f97316; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0f9ff; color: #0369a1; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #38bdf8; }
.dark .lesson-page h2 { color: #7dd3fc; }
.dark .lesson-page .ic { background: #0c4a6e; color: #7dd3fc; }
.dark .lesson-page .callout { background: #431407; border-left-color: #fb923c; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #334155; }
.dark .lesson-page table th { background: #082f49; color: #7dd3fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Decoupled Architectures</h1>
  <p>A <strong>coupled</strong> system calls components directly and synchronously: the web tier waits for the email tier, which waits for the analytics tier. One slow link drags the user&rsquo;s request with it — and an outage in any link is an outage in all.</p>
  <p><strong>Decoupling</strong> inserts an intermediary — a queue, topic, or event bus — between producer and consumer. The producer publishes; it does not care who reads it, when, or even whether anyone is reading right now.</p>
  <h2>What that buys you</h2>
  <ul>
    <li><strong>Spike absorption</strong> — producers push fast; slow consumers drain at their own pace. The queue stores the difference.</li>
    <li><strong>Independent failure</strong> — if consumers die, producers keep running. Messages wait instead of requests failing.</li>
    <li><strong>Independent scaling</strong> — scale consumers by backlog, producers by throughput, uncoupled.</li>
    <li><strong>New consumers for free</strong> — publish once; a new team can subscribe without the sender changing anything.</li>
  </ul>
  <h2>When to decouple</h2>
  <table>
    <tr><th>Symptom</th><th>Decoupled shape</th></tr>
    <tr><td>User request must not wait for slow side effects</td><td>Fire-and-forget message</td></tr>
    <tr><td>Load bursts dwarf steady traffic</td><td>Queue in front of the worker fleet</td></tr>
    <tr><td>Five systems each need the same fact</td><td>Topic / event bus fan-out</td></tr>
    <tr><td>You must replay past events or rebuild state</td><td>Stream (event log) you can re-read</td></tr>
  </table>
  <h2>The new contract</h2>
  <p>Decoupling does not remove contracts — it changes them. The <strong>message schema</strong> is now the API. It must be versioned, validated on the way in, and never silently reshaped, because the consumer may be a system you have never met.</p>
  <pre class="code-block">{
  "event": "order.placed",
  "version": 1,
  "id": "ord_9f2c",           # idempotency key
  "data": { "user": "u_41", "total": 1250 },
  "occurredAt": "2026-09-17T10:12:00Z"
}</pre>
  <div class="callout callout-tip">
    <strong>Decouple along the request path first</strong>
    <p>Every side effect a user does not need before they get their answer (emails, webhooks, recommendations) is a candidate for a queue. Keep the critical path synchronous and honest.</p>
  </div>
  <div class="callout">
    <strong>At-least-once is the default</strong>
    <p>Most queues deliver messages at least once — duplicates happen. Consumers must be idempotent: process the same order id twice and the second time is a no-op.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02500000-0000-4000-8000-000000000414',
  '02500000-0000-4000-8000-000000000314',
  1,
  'Queues, Topics & Event Buses',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Queues, Topics & Event Buses</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5e9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0369a1; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0f2fe; color: #0369a1; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffedd5; border-left: 4px solid #f97316; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0f9ff; color: #0369a1; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #38bdf8; }
.dark .lesson-page h2 { color: #7dd3fc; }
.dark .lesson-page .ic { background: #0c4a6e; color: #7dd3fc; }
.dark .lesson-page .callout { background: #431407; border-left-color: #fb923c; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #334155; }
.dark .lesson-page table th { background: #082f49; color: #7dd3fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Queues, Topics &amp; Event Buses</h1>
  <p>Decoupling talks about a concept; this lesson is the kit: <strong>queues</strong> (one consumer competes for each message), <strong>topics/buses</strong> (every subscriber gets a copy), and <strong>streams</strong> (an ordered, replayable log).</p>
  <table>
    <tr><th>Primitive</th><th>Delivery model</th><th>Classic use</th></tr>
    <tr><td>Queue (SQS, RabbitMQ)</td><td>One of N consumers gets each message</td><td>Job backlog, work distribution</td></tr>
    <tr><td>Topic (SNS, Kafka topic)</td><td>Every subscriber receives a copy</td><td>Fan-out: notify email + analytics + audit</td></tr>
    <tr><td>Event bus (EventBridge)</td><td>Routes events to rules/filters by content</td><td>SaaS-to-SaaS, rule-based routing</td></tr>
    <tr><td>Stream (Kafka, Kinesis)</td><td>Replayable ordered log</td><td>Event sourcing, rebuild state</td></tr>
  </table>
  <h2>The queue lifecycle</h2>
  <ol>
    <li>Producer sends a message — it lands in the queue and is <strong>stored</strong> (this is the superpower: durability while consumers lag).</li>
    <li>A consumer <strong>receives</strong> it — the message becomes invisible for a visibility/lock timeout.</li>
    <li>Consumer finishes and <strong>deletes</strong> the message. If it crashes first, the timeout expires and the message reappears.</li>
    <li>After N failed attempts, the message goes to the <strong>dead-letter queue</strong> for humans to triage.</li>
  </ol>
  <pre class="code-block"># send + receive (boto3, SQS) — receive IS only the start
import boto3, json

sqs = boto3.client("sqs")
url = "https://sqs.us-east-1.amazonaws.com/1234/orders"

sqs.send_message(QueueUrl=url,
                 MessageBody=json.dumps({"order_id": "ord_9f2c"}))

# worker:
while True:
    resp = sqs.receive_message(QueueUrl=url, MaxNumberOfMessages=5,
                               VisibilityTimeout=60, WaitTimeSeconds=20)
    for msg in resp.get("Messages", []):
        try:
            process(json.loads(msg["Body"]))      # idempotent!
            sqs.delete_message(QueueUrl=url,
                               ReceiptHandle=msg["ReceiptHandle"])
        except Exception:
            pass   # leave visible → retry → eventually DLQ</pre>
  <h2>Design questions that decide the primitive</h2>
  <ul>
    <li><strong>Does the answer depend on order?</strong> A standard queue reorders; use a FIFO queue or stream if order matters.</li>
    <li><strong>Is the same fact needed by many systems?</strong> Topic fan-out, not a queue.</li>
    <li><strong>Must you reprocess history to rebuild a service?</strong> A stream that keeps messages for days, replayed from an offset.</li>
  </ul>
  <div class="callout">
    <strong>Backpressure is your friend</strong>
    <p>A growing queue is a signal, not a bug — it says consumers are too slow for producers. Scale consumers on queue depth, then alert when depth crosses a level that implies minutes of delay.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Validate at the producer, evolve the schema</strong>
    <p>Messages that cannot be parsed poison every consumer downstream. Reject malformed payloads at ingestion and route only the legit ones onward.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02500000-0000-4000-8000-000000000416',
  '02500000-0000-4000-8000-000000000316',
  1,
  'Serverless Architecture Patterns',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Serverless Architecture Patterns</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5e9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0369a1; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0f2fe; color: #0369a1; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffedd5; border-left: 4px solid #f97316; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0f9ff; color: #0369a1; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #38bdf8; }
.dark .lesson-page h2 { color: #7dd3fc; }
.dark .lesson-page .ic { background: #0c4a6e; color: #7dd3fc; }
.dark .lesson-page .callout { background: #431407; border-left-color: #fb923c; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #334155; }
.dark .lesson-page table th { background: #082f49; color: #7dd3fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Serverless Architecture Patterns</h1>
  <p>Serverless means the cloud runs your code without you managing a server. Functions scale from zero to thousands of concurrent invocations and back, and you pay per request + compute time — the same elasticity story told at the finest grain.</p>
  <h2>The mental model: functions are event-adapted</h2>
  <p>The unit is a <strong>function</strong> that fires in response to an <strong>event</strong>: an HTTP call through an API gateway, a file landing in object storage, a message appearing on a queue, a schedule ticking. Function-to-function fan-out is a pattern smell — that is what buses and queues are for.</p>
  <pre class="code-block"># Lambda handler — receive, transform, hand off
import json

def handler(event, context):
    # event = parsed payload from the trigger (API, queue, storage)
    body = json.loads(event.get("body", "{}"))
    order_id = body.get("order_id")
    if not order_id:
        return {"statusCode": 400, "body": json.dumps({"error": "missing order_id"})}
    # ...validate, persist, publish...
    return {"statusCode": 200,
            "body": json.dumps({"accepted": order_id})}</pre>
  <h2>Design constraints that shape your system</h2>
  <ul>
    <li><strong>Stateless functions</strong> — no in-memory session. State lives in storage, not in the runtime.</li>
    <li><strong>Cold starts</strong> — a function that has not run recently takes extra time to boot. Keep handlers small; keep initialization outside the handler.</li>
    <li><strong>Time and size limits</strong> — long-running batch fits containers or workflows, not a single function call.</li>
    <li><strong>Idempotent by construction</strong> — the same event may arrive twice (at-least-once delivery).</li>
  </ul>
  <h2>Where serverless shines</h2>
  <table>
    <tr><th>Workload</th><th>Why</th></tr>
    <tr><td>Sporadic side effects</td><td>Email, webhook, image resize — idle 99% of the time</td></tr>
    <tr><td>API glue</td><td>Validate + fan out + store; no server to patch</td></tr>
    <tr><td>Spiky/bursty traffic</td><td>Per-invocation scale matches demand exactly</td></tr>
    <tr><td>Scheduled jobs</td><td>Nightly transforms, report generators</td></tr>
  </table>
  <h2>Why not always</h2>
  <p>Steady 24/7 heavy traffic, sub-100ms always-on latency, or long-running processes will cost you more per unit than a well-utilized container fleet. &ldquo;Serverless-first for the bursty edges, right-sized servers for the steady core&rdquo; is a defensible default.</p>
  <div class="callout callout-info">
    <strong>Warm vs hot paths</strong>
    <p>Put always-hot logic in a long-running service; put rarely-run logic in functions. Trying to force either job into the wrong shape taxes cost or cold-start latency.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Orchestrate with state machines</strong>
    <p>Multi-step workflows (upload → validate → transform → notify) belong in a workflow service: each step is a function, and the state machine owns retries, waits, and the overall success criteria.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02500000-0000-4000-8000-000000000417',
  '02500000-0000-4000-8000-000000000317',
  1,
  'Orchestration, Sagas & Microservices',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Orchestration, Sagas & Microservices</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5e9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0369a1; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0f2fe; color: #0369a1; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffedd5; border-left: 4px solid #f97316; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0f9ff; color: #0369a1; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #38bdf8; }
.dark .lesson-page h2 { color: #7dd3fc; }
.dark .lesson-page .ic { background: #0c4a6e; color: #7dd3fc; }
.dark .lesson-page .callout { background: #431407; border-left-color: #fb923c; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #334155; }
.dark .lesson-page table th { background: #082f49; color: #7dd3fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Orchestration, Sagas &amp; Microservices</h1>
  <p>Once a job spans several services, someone must coordinate it. Two styles dominate:</p>
  <ul>
    <li><strong>Orchestration</strong> — a central coordinator instructs each step (&ldquo;charge the card, then reserve stock, then ship&rdquo;). Easy to trace; creates a dependency on the central brain.</li>
    <li><strong>Choreography</strong> — each service reacts to events and emits the next one. No boss; harder to follow, far more resilient.</li>
  </ul>
  <p>A workflow state machine is the sweet spot: an explicit coordinator that also survives component failures by storing its own state.</p>
  <h2>Distributed transactions: the saga</h2>
  <p>A real transaction spans services, each owning its database. The <strong>saga</strong> pattern models the whole thing as small local transactions plus <strong>compensations</strong>: if step 4 fails, run inverse steps 3, 2, 1 (refund, return stock, release hold).</p>
  <pre class="code-block">place-order (local tx)
  ├─ reserve-stock   ────────────── something fails →
  ├─ charge-payment                     ├─ refund  (compensate 3)
  │  ────────────── if ok ──►           ├─ return-stock (compensate 2)
  └─ confirm-order                      └─ release-hold (compensate 1)
saga state: PENDING → PARTIAL → COMPENSATING → ROLLED_BACK</pre>
  <h2>Microservices: bounded by data, not by org chart</h2>
  <p>A service earns its keep with an <strong>independent database</strong> and an <strong>independent release</strong>. If two &ldquo;services&rdquo; share a schema, they are one service wearing a costume. Good boundaries follow natural seams: orders vs inventory vs users, each owning the data that changes with it.</p>
  <table>
    <tr><th>Signal</th><th>Verdict</th></tr>
    <tr><td>Two services share the same table</td><td>Merge them</td></tr>
    <tr><td>Deploys must be coordinated in lockstep</td><td>Merge them</td></tr>
    <tr><td>Teams deploy independently, own their data</td><td>Keep split</td></tr>
    <tr><td>You cannot describe the service in one sentence</td><td>Split further</td></tr>
  </table>
  <h2>Monolith is not a dirty word</h2>
  <p>Start with a modular monolith; split out services only when a boundary shows real independent-vs-independent value. Most teams that shoot straight to microservices spend their first year building distributed-systems glue for zero user benefit.</p>
  <div class="callout callout-info">
    <strong>Data leads the way</strong>
    <p>Ask &ldquo;which data does this out-live?&rdquo; before &ldquo;which services?&rdquo; A boundary you draw in the database is the one that lasts.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Version your contracts</strong>
    <p>Every service boundary is a contract. Additive changes are cheap; breaking changes ripple across owners. Keep messages versioned and consumers tolerant of unknown fields.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02500000-0000-4000-8000-000000000419',
  '02500000-0000-4000-8000-000000000319',
  1,
  'CDN & Edge Computing',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CDN & Edge Computing</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5e9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0369a1; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0f2fe; color: #0369a1; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffedd5; border-left: 4px solid #f97316; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0f9ff; color: #0369a1; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #38bdf8; }
.dark .lesson-page h2 { color: #7dd3fc; }
.dark .lesson-page .ic { background: #0c4a6e; color: #7dd3fc; }
.dark .lesson-page .callout { background: #431407; border-left-color: #fb923c; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #334155; }
.dark .lesson-page table th { background: #082f49; color: #7dd3fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>CDN &amp; Edge Computing</h1>
  <p>A CDN (content delivery network) is a fleet of <strong>edge locations</strong> planted around the world. Content is cached at the edge nearest the user, so a request from Tokyo is answered in Tokyo instead of round-tripping to your origin in Frankfurt. Latency collapses; origin load collapses too.</p>
  <h2>How a request is served</h2>
  <ol>
    <li>DNS resolves your hostname to the CDN (which picks the nearest edge by geo/latency).</li>
    <li>The edge checks its <strong>cache</strong> — a hit (<span class="ic">HIT</span>) returns instantly.</li>
    <li>A miss (<span class="ic">MISS</span>) fetches from your origin, stores a copy per TTL, and replies.</li>
    <li>An <strong>edge function</strong> can mutate the request/response at either step — rewrite URLs, add headers, A/B test, authenticate.</li>
  </ol>
  <table>
    <tr><th>Layer</th><th>Closer to…</th><th>Job</th></tr>
    <tr><td>User browser</td><td>—</td><td>Local cache, offline</td></tr>
    <tr><td>Edge location</td><td>User</td><td>Cache, TLS, edge functions</td></tr>
    <tr><td>Origin</td><td>Your region</td><td>Canonical data, personalization</td></tr>
  </table>
  <h2>Static vs dynamic — cache them differently</h2>
  <p>Static assets (images, JS, CSS, fonts) can be cached aggressively for days — they are versioned and renamed on change. Dynamic pages (catalog, product) cache for seconds to minutes by manipulating the <span class="ic">Cache-Control</span> response header. Personal data is usually <em>never</em> cached at shared edges.</p>
  <pre class="code-block"># Cache-Control decides how long edges may reuse a response
Cache-Control: public, max-age=31536000, immutable   # hashed asset
Cache-Control: public, max-age=60, s-maxage=300      # catalog row
Cache-Control: private, max-age=0                    # account page</pre>
  <h2>Edge functions: compute where the user is</h2>
  <p>Not everything must touch your origin. <strong>Edge functions</strong> run tiny handlers at the edge for: origin selection by region, URL rewrites, request authentication, header insertion, fan-out to test variants, and <em>short-circuiting</em> (serve from cache or fail open without origin).</p>
  <div class="callout callout-info">
    <strong>Failure handling matters</strong>
    <p>When your origin dies, edges with cached content can keep serving — often right up to the TTL, and with <span class="ic">stale-while-revalidate</span>, beyond it. That is effectively a free DR layer.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Purge content, not the whole cache</strong>
    <p>Invalidation should target a path, not flush everything. Versioned filenames + long TTL beat constant purging — the URL changes, so nothing stale ever shows.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02500000-0000-4000-8000-000000000420',
  '02500000-0000-4000-8000-000000000320',
  1,
  'Caching & Global Delivery',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Caching & Global Delivery</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5e9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0369a1; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0f2fe; color: #0369a1; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffedd5; border-left: 4px solid #f97316; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0f9ff; color: #0369a1; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #38bdf8; }
.dark .lesson-page h2 { color: #7dd3fc; }
.dark .lesson-page .ic { background: #0c4a6e; color: #7dd3fc; }
.dark .lesson-page .callout { background: #431407; border-left-color: #fb923c; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #334155; }
.dark .lesson-page table th { background: #082f49; color: #7dd3fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Caching &amp; Global Delivery</h1>
  <p>Every cache trade is the same trade: <strong>freshness vs speed</strong>. A fully fresh answer always asks the source; a fully fast answer always reuses the last copy. Great architectures make that trade explicit at <em>each layer</em> instead of defaulting.</p>
  <h2>The cache ladder</h2>
  <table>
    <tr><th>Layer</th><th>Held by</th><th>Reuse window</th></tr>
    <tr><td>HTTP / browser cache</td><td>The user&rsquo;s browser</td><td>Seconds to months</td></tr>
    <tr><td>CDN edge</td><td>Nearest PoP</td><td>TTL guided by headers</td></tr>
    <tr><td>Application cache</td><td>Your service (Redis, Memcached)</td><td>Milliseconds (in-process) to minutes</td></tr>
    <tr><td>Database query cache</td><td>Your data layer</td><td>Milliseconds, automatically</td></tr>
  </table>
  <p>Check the top layers first: the fastest request is the one your <em>origin never sees</em>.</p>
  <h2>Designing cache keys</h2>
  <ul>
    <li>Key everything by what determines the answer: <span class="ic">GET /products/42</span> keyed on the URL alone must be safe only if the reply is truly the same for every user.</li>
    <li><span class="ic">Vary: Accept-Encoding</span> — a compressed copy is a different item than an uncompressed one.</li>
    <li>Personalization in the URL/key (user id in query) kills reuse and can leak data at shared caches — keep it out.</li>
  </ul>
  <h2>Keeping it fresh without breaking it</h2>
  <p>Stale-while-revalidate is a blunt, effective pattern: serve the last good copy immediately for the <span class="ic">stale</span> window while a background fetch refreshes it for the next request. Users see sub-second pages; the origin reloads at a calm pace.</p>
  <pre class="code-block">Cache-Control: public, max-age=60, stale-while-revalidate=3600
# 60s: fresh for everyone served from cache
# 3600s: if expired, still serve stale while the origin refreshes</pre>
  <h2>Invalidation: three ways, one rule</h2>
  <ol>
    <li><strong>TTL expiration</strong> — the lazy default; nothing to do.</li>
    <li><strong>Explicit purge</strong> — push a clear for a path/pattern when content changes (e.g., after a publish).</li>
    <li><strong>Versioned names</strong> — new filename, old entry dies by TTL. This is why hashed bundles are the standard for static assets.</li>
  </ol>
  <p>The rule: <strong>never purge by guessing</strong>. Purge known paths, or version the URL, and let TTL clean the rest.</p>
  <div class="callout">
    <strong>The cache-per-request trap</strong>
    <p>Caching inside a single request (repeated DB calls for the same row) is fine; caching across requests with a TTL is a contract about how stale the user may see your world. Write that contract down in the code review the first time, then again each time someone lowers the TTL &ldquo;to be safe.&rdquo;</p>
  </div>
  <div class="callout callout-tip">
    <strong>Cache the top of the funnel, keep truth centralized</strong>
    <p>An aggressively cached catalog plus an uncached checkout means reads are cheap, and the one thing that must be exact (money) is always fresh. Score before optimizing.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02500000-0000-4000-8000-000000000422',
  '02500000-0000-4000-8000-000000000322',
  1,
  'Identity, Network & Data Security',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Identity, Network & Data Security</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5e9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0369a1; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0f2fe; color: #0369a1; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffedd5; border-left: 4px solid #f97316; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0f9ff; color: #0369a1; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #38bdf8; }
.dark .lesson-page h2 { color: #7dd3fc; }
.dark .lesson-page .ic { background: #0c4a6e; color: #7dd3fc; }
.dark .lesson-page .callout { background: #431407; border-left-color: #fb923c; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #334155; }
.dark .lesson-page table th { background: #082f49; color: #7dd3fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Identity, Network &amp; Data Security</h1>
  <p>Security in the cloud is layered — identity, then network, then data. Attackers who get past one layer should still find another wall. This lesson gives you the spectrum of controls to place.</p>
  <h2>1. Identity is the new perimeter</h2>
  <ul>
    <li><strong>IAM</strong> — every action is an API call with a caller. Central identity (users, roles, service accounts) authorizes with policies.</li>
    <li><strong>Least privilege</strong> — grant the minimum permission for the job. A read-only stats job does not need database write access.</li>
    <li><strong>Short-lived credentials</strong> — temporary tokens and role assumption instead of long-lived keys someone will leak in a repo.</li>
  </ul>
  <pre class="code-block"># Minimal policy — only what the job needs
{
  "Version": "2012-10-17",
  "Statement": [{
    "Effect": "Allow",
    "Action": ["sqs:ReceiveMessage", "sqs:DeleteMessage"],
    "Resource": "arn:aws:sqs:us-east-1:1234:orders-dlq"
  }]
}</pre>
  <h2>2. Network segmentation</h2>
  <table>
    <tr><th>Control</th><th>Blocks</th><th>Location</th></tr>
    <tr><td>VPC + subnets</td><td>Public exposure of private tiers</td><td>Account</td></tr>
    <tr><td>Security groups</td><td>Unwanted traffic to an instance</td><td>Instance</td></tr>
    <tr><td>Network ACLs</td><td>Traffic at the subnet boundary</td><td>Subnet</td></tr>
    <tr><td>Private endpoints</td><td>Traffic to services exiting your VPC</td><td>Service</td></tr>
  </table>
  <p>The web tier talks to the app tier on a private subnet; the database port is open to nothing but the app tier. If an app instance is compromised, the database is still out of reach.</p>
  <h2>3. Data protection</h2>
  <ul>
    <li><strong>At rest</strong> — encrypt volumes, buckets, and databases with a KMS-owned key. Encryption without proper key rotation is a checkbox.</li>
    <li><strong>In transit</strong> — TLS everywhere, including between services. Trust no wire.</li>
    <li><strong>Keys</strong> — managed secrets vault, rotated; never in code, env, or images.</li>
  </ul>
  <h2>Reading the layers</h2>
  <p>Attackers must now get through DNS/edge, the LB, the security group, the app&rsquo;s own authz, and the data-layer ACL — each wall independent of the one before. Defense in depth is why &ldquo;the app is secure&rdquo; is a sentence your architecture, not your team, proves.</p>
  <div class="callout callout-info">
    <strong>Encryption default-on is free</strong>
    <p>Modern clouds encrypt storage by default. The architectural decision is <em>key management</em>: who can decrypt, how keys rotate, and what logs reveal access. Spend your design energy there.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Test the perimeter</strong>
    <p>From outside, probe your exposed surface like an attacker would: what ports answer publicly? Which endpoints lack auth? Every open surface should be justified in a comment.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02500000-0000-4000-8000-000000000423',
  '02500000-0000-4000-8000-000000000323',
  1,
  'Securing the Cloud Architecture',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Securing the Cloud Architecture</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5e9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0369a1; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0f2fe; color: #0369a1; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffedd5; border-left: 4px solid #f97316; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0f9ff; color: #0369a1; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #38bdf8; }
.dark .lesson-page h2 { color: #7dd3fc; }
.dark .lesson-page .ic { background: #0c4a6e; color: #7dd3fc; }
.dark .lesson-page .callout { background: #431407; border-left-color: #fb923c; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #334155; }
.dark .lesson-page table th { background: #082f49; color: #7dd3fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Securing the Cloud Architecture</h1>
  <p>Controls only matter if someone verifies they exist, work, and stay true. This lesson is the <em>process</em> half of security: threat modeling, secrets, detection, and response.</p>
  <h2>Threat-model before you build</h2>
  <p>A simple STRIDE pass on each component asks six questions: <strong>S</strong>poofing, <strong>T</strong>ampering, <strong>R</strong>epudiation, <strong>I</strong>nformation disclosure, <strong>D</strong>enial of service, <strong>E</strong>levation of privilege. For every &ldquo;yes&rdquo;, design a control now — retrofitting security after launch is ten times the cost.</p>
  <h2>Secrets: the leak that never stops hurting</h2>
  <ol>
    <li>Put secrets in a <strong>secrets manager</strong>, referenced by name — never in code, images, or pipelines.</li>
    <li>Rotate automatically; automate invalidation on suspicion.</li>
    <li>Scan repos continuously; assume any leaked key is public and rotate it immediately.</li>
  </ol>
  <h2>Detect: logs only count when they alert</h2>
  <p>Centralize logs and metrics, then wire <strong>alerts</strong>: failed-auth spikes, unusual data egress, new admin roles, config drift on security groups. A log you never read is a liability, not a control.</p>
  <pre class="code-block"># Example alert source: audit an identity action
event = cloudtrail.lookup(EventName: "CreateUser")
if event.count(24h) > 3:      alert("identity:admin", severity="high")
if iam.user.never_used(t):     alert("identity:unused-key", t)</pre>
  <h2>Respond: the runbook is the product</h2>
  <table>
    <tr><th>Phase</th><th>Action you have planned</th></tr>
    <tr><td>Contain</td><td>Disable the key / detach the role / isolate the subnet</td></tr>
    <tr><td>Eradicate</td><td>Remove the compromised compute, re-deploy from known-good image</td></tr>
    <tr><td>Recover</td><td>Restore from backup, verify integrity, fail forward</td></tr>
    <tr><td>Learn</td><td>Blameless write-up → control change → drill to prove it</td></tr>
  </table>
  <h2>Compliance as a byproduct</h2>
  <p>Regulations (SOC 2, PCI, GDPR) are audit mechanisms of the same practices: least privilege, encryption, logging, documented access. Architect the practice; the certificate follows. Never architect &ldquo;to pass an audit&rdquo; — audits watch behavior, not diagrams.</p>
  <div class="callout callout-tip">
    <strong>Game days beat slide decks</strong>
    <p>Run a tabletop incident: someone trips a &ldquo;leaked key&rdquo; scenario, and the team must actually contain it. The first drill always reveals the gap between the wiki and reality — that gap is your roadmap.</p>
  </div>
  <div class="callout">
    <strong>Shared responsibility is not shared blame</strong>
    <p>The provider guards the physical plant; <em>you</em> guard identity, data, and access. Write the dividing line into your architecture so nobody assumes the other side did it.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02500000-0000-4000-8000-000000000425',
  '02500000-0000-4000-8000-000000000325',
  1,
  'Cloud Cost Management & FinOps',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cloud Cost Management & FinOps</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5e9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0369a1; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0f2fe; color: #0369a1; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffedd5; border-left: 4px solid #f97316; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0f9ff; color: #0369a1; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #38bdf8; }
.dark .lesson-page h2 { color: #7dd3fc; }
.dark .lesson-page .ic { background: #0c4a6e; color: #7dd3fc; }
.dark .lesson-page .callout { background: #431407; border-left-color: #fb923c; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #334155; }
.dark .lesson-page table th { background: #082f49; color: #7dd3fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Cloud Cost Management &amp; FinOps</h1>
  <p>FinOps is the practice of making cloud spending <em>everyone&rsquo;s</em> job — engineering, finance, and product agree on what a dollar buys. The goal is not the cheapest bill; it is the <strong>most value per dollar</strong>, decided with visibility instead of surprise.</p>
  <h2>Understand the bill first</h2>
  <ul>
    <li><strong>Tag everything</strong> — every resource (environment, team, feature, cost-center) so the bill maps to the org chart, not to mystery line items.</li>
    <li><strong>Unit economics</strong> — divide cost by a business unit: cost per order, per streamed hour, per processed file. This is the number that can actually be managed.</li>
    <li><strong>Trend, then act</strong> — a rising line for a verifiable product win is fine; a plateau nobody can explain is a leak.</li>
  </ul>
  <h2>The big levers, cheapest first</h2>
  <table>
    <tr><th>Lever</th><th>What it does</th><th>Effort</th></tr>
    <tr><td>Right-sizing</td><td>Match instance size to actual utilization</td><td>Low</td></tr>
    <tr><td>Autoscaling</td><td>Shrink idle capacity automatically</td><td>Low–medium</td></tr>
    <tr><td>Sleep dev/staging</td><td>Stop unused environments nights &amp; weekends</td><td>Low</td></tr>
    <tr><td>Storage lifecycle</td><td>Auto-tier cold data to cheaper storage</td><td>Medium</td></tr>
    <tr><td>Committed use</td><td>Prepay steady capacity (reserved/savings plans)</td><td>Medium</td></tr>
    <tr><td>Spot capacity</td><td>Discounted interruptible capacity for tolerant jobs</td><td>Medium</td></tr>
  </table>
  <pre class="code-block"># Budget + hard stop: spend is a contract, not a surprise
budget = { scope: "production", amount: 1800.0, period: "monthly" }
if projected_spend > budget.amount * 0.85:
    notify("finops", "85% of budget consumed")
if projected_spend > budget.amount:
    liam_of: auto-stop autoscalers, alert on-call   # by design</pre>
  <h2>Where the waste actually hides</h2>
  <ol>
    <li>Unattached volumes and idle load balancers billed by the hour, doing nothing.</li>
    <li>Orphaned snapshots stacking past their purpose.</li>
    <li>Dev environments cloned &ldquo;just in case&rdquo; — the world&rsquo;s most expensive insurance.</li>
    <li>Egress: moving data between regions and out to the internet is a surprisingly big line.</li>
  </ol>
  <div class="callout callout-tip">
    <strong>Make spend a metric, not a myth</strong>
    <p>Put cost per unit on the team&rsquo;s dashboard next to latency and errors. What gets measured with a deployment pipeline attached gets improved — a cost widget without an owner is decoration.</p>
  </div>
  <div class="callout">
    <strong>The 10% rule of thumb</strong>
    <p>A well-tagged, autoscaled, right-sized estate typically sheds 10–30% on the first pass with zero feature loss. The <em>second</em> pass (architecture, serverless, data gravity) is where sustained leverage lives.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02500000-0000-4000-8000-000000000426',
  '02500000-0000-4000-8000-000000000326',
  1,
  'Capstone: Designing the Platform',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Designing the Platform</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5e9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0369a1; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0f2fe; color: #0369a1; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffedd5; border-left: 4px solid #f97316; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0f9ff; color: #0369a1; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #38bdf8; }
.dark .lesson-page h2 { color: #7dd3fc; }
.dark .lesson-page .ic { background: #0c4a6e; color: #7dd3fc; }
.dark .lesson-page .callout { background: #431407; border-left-color: #fb923c; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #334155; }
.dark .lesson-page table th { background: #082f49; color: #7dd3fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Designing the Platform</h1>
  <p>Time to connect everything. The brief: <strong>&ldquo;StreamsNow&rdquo;</strong>, a global video-lecture platform. Users browse a course catalog, watch streams, queue downloads, and get personalized recommendations. Growth is expected to be spiky — live launches cause 10x bursts.</p>
  <h2>Given requirements → chosen shapes</h2>
  <table>
    <tr><th>Requirement</th><th>Architecture choice</th></tr>
    <tr><td>Global low-latency catalog</td><td>CDN edge caching + read replicas per region</td></tr>
    <tr><td>Spiky burst during launches</td><td>Autoscaling app tier + queue-backed workers</td></tr>
    <tr><td>Media must not crash the web tier</td><td>Object storage on the edge; web tier never streams bytes</td></tr>
    <tr><td>Async jobs (transcode, email, recommend)</td><td>Queues + serverless workers</td></tr>
    <tr><td>Zero RPO for orders</td><td>Multi-AZ transactional database, automated failover</td></tr>
  </table>
  <pre class="code-block">Browser ──► CDN/Edge ──► WAF ──► API Gateway ──► App ASG (2…40)
                 │                         │            │
                 │                 ┌───────┼────────────┤
              Media bucket         │   Catalog cache  DB multi-AZ
                 ▲                 │         (Redis)     │
          Upload ─┘ transcode ─► QUEUE ─► workers ─► analytics lake</pre>
  <h2>The data flow, step by step</h2>
  <ol>
    <li>Catalog reads hit the CDN; misses fall through to the app tier, then a Redis cache, then the read replica. No user ever touches the primary DB for browsing.</li>
    <li>Purchases write to the multi-AZ transactional store (the only place with zero-RPO write truth).</li>
    <li>&ldquo;Start transcode&rdquo; is a message, not a call: uploads enqueue work; workers scale on queue depth.</li>
    <li>Recommendations run as a nightly serverless batch over the analytics snapshot.</li>
  </ol>
  <h2>Honest trade-offs in this design</h2>
  <ul>
    <li>Catalog staleness up to 60 s is accepted (freshness vs the CDN win).</li>
    <li>Recommendations are eventually consistent — they lag purchases by a day, by design.</li>
    <li>Zero-RPO depends on the database being the single write authority; reads fan out everywhere.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Write the &ldquo;why&rdquo; next to each box</strong>
    <p>Every component in the diagram should carry its reason: &ldquo;autoscaling on queue depth&rdquo;, &ldquo;multi-AZ for zero RPO&rdquo;. A diagram without rationales is a guess the next engineer must re-derive.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Refuse the one-flavor trap</strong>
    <p>This design is serverless <em>and</em> containerized <em>and</em> managed SQL. Each tier picked its best fit — that is the signature of a serious architect, not indecision.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02500000-0000-4000-8000-000000000427',
  '02500000-0000-4000-8000-000000000327',
  1,
  'Capstone: Cost, Security & Operations',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Cost, Security & Operations</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5e9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0369a1; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0f2fe; color: #0369a1; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffedd5; border-left: 4px solid #f97316; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0f9ff; color: #0369a1; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #38bdf8; }
.dark .lesson-page h2 { color: #7dd3fc; }
.dark .lesson-page .ic { background: #0c4a6e; color: #7dd3fc; }
.dark .lesson-page .callout { background: #431407; border-left-color: #fb923c; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #334155; }
.dark .lesson-page table th { background: #082f49; color: #7dd3fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Cost, Security &amp; Operations</h1>
  <p>The StreamsNow design is &ldquo;done&rdquo; on paper. Now run the review pass — the one that turns a diagram into a hardened, affordable, operable system. Each concern maps to a pillar; each fix is a concrete change.</p>
  <h2>Security pass</h2>
  <ul>
    <li><strong>Identity</strong> — API keys replaced by short-lived IAM roles; the queue/database/orchestrator all use scoped identities.</li>
    <li><strong>Network</strong> — WAF in front of the gateway; web tier public, workers and database on private subnets; DB reachable from the app tier only.</li>
    <li><strong>Data</strong> — media bucket encrypted at rest, served through signed URLs with expiry; every wire is TLS.</li>
    <li><strong>Detection</strong> — auth-failure and egress alerts wired; secrets scanned in CI.</li>
  </ul>
  <h2>Cost pass</h2>
  <table>
    <tr><th>Levers chosen</th><th>Effect</th></tr>
    <tr><td>CDN absorbs 95% of read traffic</td><td>App tier stays tiny</td></tr>
    <tr><td>Autoscaling 2…40</td><td>10x burst without a permanent fleet</td></tr>
    <tr><td>Spot for transcode workers</td><td>Interruptible batch = deepest discount</td></tr>
    <tr><td>Reserved capacity for the primary DB pair</td><td>Steady write path priced down</td></tr>
  </table>
  <h2>Operations pass</h2>
  <ol>
    <li><strong>Deployability</strong> — infra as code; a failed deploy rolls back itself.</li>
    <li><strong>Observability</strong> — the four golden signals per tier: latency, traffic, errors, saturation.</li>
    <li><strong>DR runbook</strong> — pilot light in a second region: config + data ready, compute boots on demand.</li>
    <li><strong>Game day</strong> — quarterly drill: kill a database AZ, kill a region replica, watch failover.</li>
  </ol>
  <h2>The final well-architected table</h2>
  <table>
    <tr><th>Pillar</th><th>Concrete proof in StreamsNow</th></tr>
    <tr><td>Operational Excellence</td><td>IaC, canary deploys, golden-signal dashboards</td></tr>
    <tr><td>Security</td><td>WAF, IAM roles, signed URLs, encrypted at rest/in transit</td></tr>
    <tr><td>Reliability</td><td>Multi-AZ DB, autoscaling, DLQ for poison messages, DR region</td></tr>
    <tr><td>Performance Efficiency</td><td>Edge cache, read replicas, serverless workers</td></tr>
    <tr><td>Cost Optimization</td><td>Spot workers, autoscaling, pre-provisioned edges</td></tr>
    <tr><td>Sustainability</td><td>Right-sized base fleet, idle dev environments asleep</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Hand the review to a skeptic</strong>
    <p>Present this design to someone who was not in the room. Their first question (&ldquo;what happens when the queue fills and the workers lag?&rdquo;) is usually the true gap. Architect for the question, not the applause.</p>
  </div>
  <div class="callout callout-info">
    <strong>You now have the whole toolkit</strong>
    <p>Pillars ✓ scalability ✓ HA/failover ✓ DR ✓ decoupling ✓ serverless ✓ edge ✓ security ✓ cost ✓. Every future architecture you draw is these patterns arranged for a new set of requirements — that is the entire discipline.</p>
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
  ('02500000-0000-4000-8000-000000000501', '02500000-0000-4000-8000-000000000303',
   'Which pillar focuses on continuously improving operational processes and responding to incidents?',
   'Operational Excellence covers running, monitoring, and improving the workload.', 1),
  ('02500000-0000-4000-8000-000000000502', '02500000-0000-4000-8000-000000000303',
   'Which design principle most directly reduces the blast radius of a single failing component?',
   'Designing for failure assumes any component can die and routes around it.', 2),
  ('02500000-0000-4000-8000-000000000503', '02500000-0000-4000-8000-000000000303',
   'An architecture that keeps working when one availability zone fails demonstrates which property?',
   'Redundancy at the AZ scope keeps the service online while the zone recovers.', 3),
  ('02500000-0000-4000-8000-000000000504', '02500000-0000-4000-8000-000000000306',
   'Data encryption, identity, and network isolation belong to which pillar?',
   'Security covers identity, data, and system protection at every layer.', 1),
  ('02500000-0000-4000-8000-000000000505', '02500000-0000-4000-8000-000000000306',
   'Automated failover and tested disaster recovery are evidence of which pillar?',
   'Reliability is about recovering quickly and meeting demand.', 2),
  ('02500000-0000-4000-8000-000000000506', '02500000-0000-4000-8000-000000000306',
   'Right-sizing instances and eliminating idle capacity belong primarily to which pillar?',
   'Cost Optimization keeps spend aligned with business value.', 3),
  ('02500000-0000-4000-8000-000000000507', '02500000-0000-4000-8000-000000000309',
   'Which scaling approach adds more instances to handle load?',
   'Horizontal scaling (scale out) adds instances behind a load balancer.', 1),
  ('02500000-0000-4000-8000-000000000508', '02500000-0000-4000-8000-000000000309',
   'Why does horizontal scaling require stateless application instances?',
   'Any request may land on any instance, so no instance can hold user state locally.', 2),
  ('02500000-0000-4000-8000-000000000509', '02500000-0000-4000-8000-000000000309',
   'A scaling policy that reacts to current CPU or queue depth is which type?',
   'Reactive (dynamic) autoscaling decides from live metrics.', 3),
  ('02500000-0000-4000-8000-000000000510', '02500000-0000-4000-8000-000000000312',
   'An availability of 99.99% allows roughly how much annual downtime?',
   '0.01% of a year is about 52.6 minutes.', 1),
  ('02500000-0000-4000-8000-000000000511', '02500000-0000-4000-8000-000000000312',
   'In an active-passive failover pattern, the passive site normally…?',
   'It serves no traffic when healthy; it is the standby that absorbs traffic after cutover.', 2),
  ('02500000-0000-4000-8000-000000000512', '02500000-0000-4000-8000-000000000312',
   'What is the main purpose of health checks in a failover design?',
   'They detect unhealthy components so traffic can be rerouted before users feel it.', 3),
  ('02500000-0000-4000-8000-000000000513', '02500000-0000-4000-8000-000000000315',
   'What does a message queue store while its consumers are slow?',
   'The queue is durable storage that absorbs the difference between producers and consumers.', 1),
  ('02500000-0000-4000-8000-000000000514', '02500000-0000-4000-8000-000000000315',
   'Which delivery semantic do most standard queues provide?',
   'At-least-once means messages may be delivered more than once — consumers must be idempotent.', 2),
  ('02500000-0000-4000-8000-000000000515', '02500000-0000-4000-8000-000000000315',
   'Where do messages usually go after all their retry attempts fail?',
   'A dead-letter queue holds failed messages for triage by operators.', 3),
  ('02500000-0000-4000-8000-000000000516', '02500000-0000-4000-8000-000000000318',
   'What is a cold start in serverless computing?',
   'It is the initialization latency when a new function instance boots to handle an event.', 1),
  ('02500000-0000-4000-8000-000000000517', '02500000-0000-4000-8000-000000000318',
   'Which pattern models a distributed transaction using per-service steps plus compensating actions?',
   'The saga pattern performs local transactions and compensates the steps already done.', 2),
  ('02500000-0000-4000-8000-000000000518', '02500000-0000-4000-8000-000000000318',
   'Which is a valid boundary for splitting one service from another?',
   'Independent database ownership and independent releases are the litmus test.', 3),
  ('02500000-0000-4000-8000-000000000519', '02500000-0000-4000-8000-000000000321',
   'What is the primary benefit of serving traffic from a CDN edge?',
   'Content is answered close to the user, cutting latency and origin load.', 1),
  ('02500000-0000-4000-8000-000000000520', '02500000-0000-4000-8000-000000000321',
   'Which Cache-Control feature serves the last copy while refreshing in the background?',
   'stale-while-revalidate delivers stale content during an async refresh.', 2),
  ('02500000-0000-4000-8000-000000000521', '02500000-0000-4000-8000-000000000321',
   'Where do edge functions execute?',
   'They run at edge locations close to the user, not at the origin region.', 3),
  ('02500000-0000-4000-8000-000000000522', '02500000-0000-4000-8000-000000000324',
   'Which security model grants every identity only the permissions it needs?',
   'Least privilege minimizes the surface available to a compromised identity.', 1),
  ('02500000-0000-4000-8000-000000000523', '02500000-0000-4000-8000-000000000324',
   'What keeps the database tier unreachable from the public internet?',
   'Private subnets plus security groups restrict traffic to the app tier only.', 2),
  ('02500000-0000-4000-8000-000000000524', '02500000-0000-4000-8000-000000000324',
   'Why protect data in transit with TLS even inside the network?',
   'Any wire can be intercepted — encryption must be assumed everywhere.', 3),
  ('02500000-0000-4000-8000-000000000525', '02500000-0000-4000-8000-000000000328',
   'Which practice best describes designing with no single point of failure?',
   'Redundancy plus automatic failover keeps the service alive when one component dies.', 1),
  ('02500000-0000-4000-8000-000000000526', '02500000-0000-4000-8000-000000000328',
   'A workload that grows during a spike and shrinks when demand falls is…?',
   'Elastic — capacity tracks demand in both directions.', 2),
  ('02500000-0000-4000-8000-000000000527', '02500000-0000-4000-8000-000000000328',
   'Which statement best describes an event-driven architecture?',
   'Components communicate asynchronously by emitting and consuming events.', 3),
  ('02500000-0000-4000-8000-000000000528', '02500000-0000-4000-8000-000000000328',
   'How do you keep cloud costs predictable at scale?',
   'Right-sizing, autoscaling, and committed-use pricing remove waste and cap the bill.', 4),
  ('02500000-0000-4000-8000-000000000529', '02500000-0000-4000-8000-000000000328',
   'What must a consumer guarantee when the bus delivers at-least-once?',
   'Idempotency — the same event handled twice must produce the same result.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): Operational Excellence
  ('02500000-0000-4000-8000-000000001001', '02500000-0000-4000-8000-000000000501', 'Operational Excellence', TRUE,  1),
  ('02500000-0000-4000-8000-000000001002', '02500000-0000-4000-8000-000000000501', 'Security', FALSE, 2),
  ('02500000-0000-4000-8000-000000001003', '02500000-0000-4000-8000-000000000501', 'Sustainability', FALSE, 3),
  ('02500000-0000-4000-8000-000000001004', '02500000-0000-4000-8000-000000000501', 'Performance Efficiency', FALSE, 4),
  -- Q1 (501)q2: design for failure
  ('02500000-0000-4000-8000-000000001005', '02500000-0000-4000-8000-000000000502', 'Design for failure', TRUE,  1),
  ('02500000-0000-4000-8000-000000001006', '02500000-0000-4000-8000-000000000502', 'Scale up instead of scale out', FALSE, 2),
  ('02500000-0000-4000-8000-000000001007', '02500000-0000-4000-8000-000000000502', 'Disable health checks', FALSE, 3),
  ('02500000-0000-4000-8000-000000001008', '02500000-0000-4000-8000-000000000502', 'Use a single large instance', FALSE, 4),
  -- Q1 (501)q3: AZ redundancy
  ('02500000-0000-4000-8000-000000001009', '02500000-0000-4000-8000-000000000503', 'Redundancy', TRUE,  1),
  ('02500000-0000-4000-8000-000000001010', '02500000-0000-4000-8000-000000000503', 'Vertical scaling', FALSE, 2),
  ('02500000-0000-4000-8000-000000001011', '02500000-0000-4000-8000-000000000503', 'Cold storage', FALSE, 3),
  ('02500000-0000-4000-8000-000000001012', '02500000-0000-4000-8000-000000000503', 'Data caching', FALSE, 4),
  -- Q2 (504): security pillar
  ('02500000-0000-4000-8000-000000001013', '02500000-0000-4000-8000-000000000504', 'Security', TRUE,  1),
  ('02500000-0000-4000-8000-000000001014', '02500000-0000-4000-8000-000000000504', 'Reliability', FALSE, 2),
  ('02500000-0000-4000-8000-000000001015', '02500000-0000-4000-8000-000000000504', 'Cost Optimization', FALSE, 3),
  ('02500000-0000-4000-8000-000000001016', '02500000-0000-4000-8000-000000000504', 'Performance Efficiency', FALSE, 4),
  -- Q2 (504)q2: reliability
  ('02500000-0000-4000-8000-000000001017', '02500000-0000-4000-8000-000000000505', 'Reliability', TRUE,  1),
  ('02500000-0000-4000-8000-000000001018', '02500000-0000-4000-8000-000000000505', 'Sustainability', FALSE, 2),
  ('02500000-0000-4000-8000-000000001019', '02500000-0000-4000-8000-000000000505', 'Cost Optimization', FALSE, 3),
  ('02500000-0000-4000-8000-000000001020', '02500000-0000-4000-8000-000000000505', 'Security', FALSE, 4),
  -- Q2 (504)q3: cost optimization
  ('02500000-0000-4000-8000-000000001021', '02500000-0000-4000-8000-000000000506', 'Cost Optimization', TRUE,  1),
  ('02500000-0000-4000-8000-000000001022', '02500000-0000-4000-8000-000000000506', 'Reliability', FALSE, 2),
  ('02500000-0000-4000-8000-000000001023', '02500000-0000-4000-8000-000000000506', 'Operational Excellence', FALSE, 3),
  ('02500000-0000-4000-8000-000000001024', '02500000-0000-4000-8000-000000000506', 'Performance Efficiency', FALSE, 4),
  -- Q3 (507): scale out
  ('02500000-0000-4000-8000-000000001025', '02500000-0000-4000-8000-000000000507', 'Horizontal scaling (scale out)', TRUE,  1),
  ('02500000-0000-4000-8000-000000001026', '02500000-0000-4000-8000-000000000507', 'Vertical scaling (scale up)', FALSE, 2),
  ('02500000-0000-4000-8000-000000001027', '02500000-0000-4000-8000-000000000507', 'Downsizing the database', FALSE, 3),
  ('02500000-0000-4000-8000-000000001028', '02500000-0000-4000-8000-000000000507', 'Disabling the load balancer', FALSE, 4),
  -- Q3 (507)q2: statelessness
  ('02500000-0000-4000-8000-000000001029', '02500000-0000-4000-8000-000000000508', 'Any instance may serve any request', TRUE,  1),
  ('02500000-0000-4000-8000-000000001030', '02500000-0000-4000-8000-000000000508', 'Instances never restart', FALSE, 2),
  ('02500000-0000-4000-8000-000000001031', '02500000-0000-4000-8000-000000000508', 'Only one instance receives traffic', FALSE, 3),
  ('02500000-0000-4000-8000-000000001032', '02500000-0000-4000-8000-000000000508', 'Requests cannot be load-balanced', FALSE, 4),
  -- Q3 (507)q3: reactive policy
  ('02500000-0000-4000-8000-000000001033', '02500000-0000-4000-8000-000000000509', 'Reactive (dynamic) autoscaling', TRUE,  1),
  ('02500000-0000-4000-8000-000000001034', '02500000-0000-4000-8000-000000000509', 'Predictive scheduling', FALSE, 2),
  ('02500000-0000-4000-8000-000000001035', '02500000-0000-4000-8000-000000000509', 'Manual resizing', FALSE, 3),
  ('02500000-0000-4000-8000-000000001036', '02500000-0000-4000-8000-000000000509', 'Capacity planning by hand', FALSE, 4),
  -- Q4 (510): 99.99%
  ('02500000-0000-4000-8000-000000001037', '02500000-0000-4000-8000-000000000510', 'About 52 minutes', TRUE,  1),
  ('02500000-0000-4000-8000-000000001038', '02500000-0000-4000-8000-000000000510', 'About 8.7 hours', FALSE, 2),
  ('02500000-0000-4000-8000-000000001039', '02500000-0000-4000-8000-000000000510', 'About 3.6 days', FALSE, 3),
  ('02500000-0000-4000-8000-000000001040', '02500000-0000-4000-8000-000000000510', 'About 5.2 minutes', FALSE, 4),
  -- Q4 (510)q2: active-passive
  ('02500000-0000-4000-8000-000000001041', '02500000-0000-4000-8000-000000000511', 'Serves no traffic until cutover', TRUE,  1),
  ('02500000-0000-4000-8000-000000001042', '02500000-0000-4000-8000-000000000511', 'Serves half the traffic always', FALSE, 2),
  ('02500000-0000-4000-8000-000000001043', '02500000-0000-4000-8000-000000000511', 'Hosts the load balancer', FALSE, 3),
  ('02500000-0000-4000-8000-000000001044', '02500000-0000-4000-8000-000000000511', 'Answers all DNS queries', FALSE, 4),
  -- Q4 (510)q3: health checks
  ('02500000-0000-4000-8000-000000001045', '02500000-0000-4000-8000-000000000512', 'Detect unhealthy components for rerouting', TRUE,  1),
  ('02500000-0000-4000-8000-000000001046', '02500000-0000-4000-8000-000000000512', 'Encrypt traffic between tiers', FALSE, 2),
  ('02500000-0000-4000-8000-000000001047', '02500000-0000-4000-8000-000000000512', 'Reduce the database replica lag', FALSE, 3),
  ('02500000-0000-4000-8000-000000001048', '02500000-0000-4000-8000-000000000512', 'Cache static assets', FALSE, 4),
  -- Q5 (513): queue storage
  ('02500000-0000-4000-8000-000000001049', '02500000-0000-4000-8000-000000000513', 'It durably stores the backlog', TRUE,  1),
  ('02500000-0000-4000-8000-000000001050', '02500000-0000-4000-8000-000000000513', 'It drops the extra messages', FALSE, 2),
  ('02500000-0000-4000-8000-000000001051', '02500000-0000-4000-8000-000000000513', 'It restarts the consumers', FALSE, 3),
  ('02500000-0000-4000-8000-000000001052', '02500000-0000-4000-8000-000000000513', 'It blocks the producers', FALSE, 4),
  -- Q5 (513)q2: at-least-once
  ('02500000-0000-4000-8000-000000001053', '02500000-0000-4000-8000-000000000514', 'At-least-once', TRUE,  1),
  ('02500000-0000-4000-8000-000000001054', '02500000-0000-4000-8000-000000000514', 'Exactly-once by default', FALSE, 2),
  ('02500000-0000-4000-8000-000000001055', '02500000-0000-4000-8000-000000000514', 'At-most-once', FALSE, 3),
  ('02500000-0000-4000-8000-000000001056', '02500000-0000-4000-8000-000000000514', 'Zero delivery', FALSE, 4),
  -- Q5 (513)q3: DLQ
  ('02500000-0000-4000-8000-000000001057', '02500000-0000-4000-8000-000000000515', 'A dead-letter queue', TRUE,  1),
  ('02500000-0000-4000-8000-000000001058', '02500000-0000-4000-8000-000000000515', 'The primary database', FALSE, 2),
  ('02500000-0000-4000-8000-000000001059', '02500000-0000-4000-8000-000000000515', 'The load balancer', FALSE, 3),
  ('02500000-0000-4000-8000-000000001060', '02500000-0000-4000-8000-000000000515', 'The CDN cache', FALSE, 4),
  -- Q6 (516): cold start
  ('02500000-0000-4000-8000-000000001061', '02500000-0000-4000-8000-000000000516', 'Initialization latency of a new instance', TRUE,  1),
  ('02500000-0000-4000-8000-000000001062', '02500000-0000-4000-8000-000000000516', 'A database cache miss', FALSE, 2),
  ('02500000-0000-4000-8000-000000001063', '02500000-0000-4000-8000-000000000516', 'A failed TLS handshake', FALSE, 3),
  ('02500000-0000-4000-8000-000000001064', '02500000-0000-4000-8000-000000000516', 'Infinite retry loops', FALSE, 4),
  -- Q6 (516)q2: saga
  ('02500000-0000-4000-8000-000000001065', '02500000-0000-4000-8000-000000000517', 'The saga pattern', TRUE,  1),
  ('02500000-0000-4000-8000-000000001066', '02500000-0000-4000-8000-000000000517', 'The cache-aside pattern', FALSE, 2),
  ('02500000-0000-4000-8000-000000001067', '02500000-0000-4000-8000-000000000517', 'The circuit breaker only', FALSE, 3),
  ('02500000-0000-4000-8000-000000001068', '02500000-0000-4000-8000-000000000517', 'Blue-green deployment', FALSE, 4),
  -- Q6 (516)q3: service boundary
  ('02500000-0000-4000-8000-000000001069', '02500000-0000-4000-8000-000000000518', 'Independent data and releases', TRUE,  1),
  ('02500000-0000-4000-8000-000000001070', '02500000-0000-4000-8000-000000000518', 'Shared database tables', FALSE, 2),
  ('02500000-0000-4000-8000-000000001071', '02500000-0000-4000-8000-000000000518', 'Lockstep coordinated deploys', FALSE, 3),
  ('02500000-0000-4000-8000-000000001072', '02500000-0000-4000-8000-000000000518', 'One team owning every service', FALSE, 4),
  -- Q7 (519): CDN benefit
  ('02500000-0000-4000-8000-000000001073', '02500000-0000-4000-8000-000000000519', 'Lower latency by serving near the user', TRUE,  1),
  ('02500000-0000-4000-8000-000000001074', '02500000-0000-4000-8000-000000000519', 'Encrypting origin databases', FALSE, 2),
  ('02500000-0000-4000-8000-000000001075', '02500000-0000-4000-8000-000000000519', 'Replacing the database', FALSE, 3),
  ('02500000-0000-4000-8000-000000001076', '02500000-0000-4000-8000-000000000519', 'Running ETL jobs', FALSE, 4),
  -- Q7 (519)q2: stale-while-revalidate
  ('02500000-0000-4000-8000-000000001077', '02500000-0000-4000-8000-000000000520', 'stale-while-revalidate', TRUE,  1),
  ('02500000-0000-4000-8000-000000001078', '02500000-0000-4000-8000-000000000520', 'no-store', FALSE, 2),
  ('02500000-0000-4000-8000-000000001079', '02500000-0000-4000-8000-000000000520', 'must-revalidate', FALSE, 3),
  ('02500000-0000-4000-8000-000000001080', '02500000-0000-4000-8000-000000000520', 'private directives', FALSE, 4),
  -- Q7 (519)q3: edge function location
  ('02500000-0000-4000-8000-000000001081', '02500000-0000-4000-8000-000000000521', 'At edge locations near users', TRUE,  1),
  ('02500000-0000-4000-8000-000000001082', '02500000-0000-4000-8000-000000000521', 'Inside the origin database', FALSE, 2),
  ('02500000-0000-4000-8000-000000001083', '02500000-0000-4000-8000-000000000521', 'On the user''s device', FALSE, 3),
  ('02500000-0000-4000-8000-000000001084', '02500000-0000-4000-8000-000000000521', 'In the DNS root server', FALSE, 4),
  -- Q8 (522): least privilege
  ('02500000-0000-4000-8000-000000001085', '02500000-0000-4000-8000-000000000522', 'Principle of least privilege', TRUE,  1),
  ('02500000-0000-4000-8000-000000001086', '02500000-0000-4000-8000-000000000522', 'Default-allow everything', FALSE, 2),
  ('02500000-0000-4000-8000-000000001087', '02500000-0000-4000-8000-000000000522', 'One shared admin key', FALSE, 3),
  ('02500000-0000-4000-8000-000000001088', '02500000-0000-4000-8000-000000000522', 'Open security groups', FALSE, 4),
  -- Q8 (522)q2: database isolation
  ('02500000-0000-4000-8000-000000001089', '02500000-0000-4000-8000-000000000523', 'Private subnets and security groups', TRUE,  1),
  ('02500000-0000-4000-8000-000000001090', '02500000-0000-4000-8000-000000000523', 'A public IP on every instance', FALSE, 2),
  ('02500000-0000-4000-8000-000000001091', '02500000-0000-4000-8000-000000000523', 'Disabling the firewall', FALSE, 3),
  ('02500000-0000-4000-8000-000000001092', '02500000-0000-4000-8000-000000000523', 'Caching the database in the CDN', FALSE, 4),
  -- Q8 (522)q3: TLS everywhere
  ('02500000-0000-4000-8000-000000001093', '02500000-0000-4000-8000-000000000524', 'Any wire can be intercepted', TRUE,  1),
  ('02500000-0000-4000-8000-000000001094', '02500000-0000-4000-8000-000000000524', 'TLS slows nothing down, so skip it', FALSE, 2),
  ('02500000-0000-4000-8000-000000001095', '02500000-0000-4000-8000-000000000524', 'Only outside traffic needs encryption', FALSE, 3),
  ('02500000-0000-4000-8000-000000001096', '02500000-0000-4000-8000-000000000524', 'Encryption at rest replaces TLS', FALSE, 4),
  -- Q9 (525): no SPOF
  ('02500000-0000-4000-8000-000000001097', '02500000-0000-4000-8000-000000000525', 'Redundancy with automatic failover', TRUE,  1),
  ('02500000-0000-4000-8000-000000001098', '02500000-0000-4000-8000-000000000525', 'One very large instance', FALSE, 2),
  ('02500000-0000-4000-8000-000000001099', '02500000-0000-4000-8000-000000000525', 'Manual restore from backup only', FALSE, 3),
  ('02500000-0000-4000-8000-000000001100', '02500000-0000-4000-8000-000000000525', 'Disabling health checks', FALSE, 4),
  -- Q9 (525)q2: elastic
  ('02500000-0000-4000-8000-000000001101', '02500000-0000-4000-8000-000000000526', 'Elastic', TRUE,  1),
  ('02500000-0000-4000-8000-000000001102', '02500000-0000-4000-8000-000000000526', 'Static', FALSE, 2),
  ('02500000-0000-4000-8000-000000001103', '02500000-0000-4000-8000-000000000526', 'Brittle', FALSE, 3),
  ('02500000-0000-4000-8000-000000001104', '02500000-0000-4000-8000-000000000526', 'Over-provisioned', FALSE, 4),
  -- Q9 (525)q3: event-driven
  ('02500000-0000-4000-8000-000000001105', '02500000-0000-4000-8000-000000000527', 'Components exchange events asynchronously', TRUE,  1),
  ('02500000-0000-4000-8000-000000001106', '02500000-0000-4000-8000-000000000527', 'Components share one database', FALSE, 2),
  ('02500000-0000-4000-8000-000000001107', '02500000-0000-4000-8000-000000000527', 'Components call each other synchronously', FALSE, 3),
  ('02500000-0000-4000-8000-000000001108', '02500000-0000-4000-8000-000000000527', 'Components never communicate', FALSE, 4),
  -- Q9 (525)q4: cost
  ('02500000-0000-4000-8000-000000001109', '02500000-0000-4000-8000-000000000528', 'Right-size, autoscale, and commit', TRUE,  1),
  ('02500000-0000-4000-8000-000000001110', '02500000-0000-4000-8000-000000000528', 'Pay for peak capacity always', FALSE, 2),
  ('02500000-0000-4000-8000-000000001111', '02500000-0000-4000-8000-000000000528', 'Stop monitoring spend', FALSE, 3),
  ('02500000-0000-4000-8000-000000001112', '02500000-0000-4000-8000-000000000528', 'Rent unused reserved capacity', FALSE, 4),
  -- Q9 (525)q5: idempotency
  ('02500000-0000-4000-8000-000000001113', '02500000-0000-4000-8000-000000000529', 'Guarantee idempotent processing', TRUE,  1),
  ('02500000-0000-4000-8000-000000001114', '02500000-0000-4000-8000-000000000529', 'Guarantee zero delivery', FALSE, 2),
  ('02500000-0000-4000-8000-000000001115', '02500000-0000-4000-8000-000000000529', 'Process each message twice deliberately', FALSE, 3),
  ('02500000-0000-4000-8000-000000001116', '02500000-0000-4000-8000-000000000529', 'Reject all duplicated events', FALSE, 4)
ON CONFLICT (id) DO NOTHING;
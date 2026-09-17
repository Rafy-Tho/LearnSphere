-- ============================================================================
-- SEED 043: Complete course — "Domain-Driven Design"
-- ----------------------------------------------------------------------------
-- Instructor : Elena Rodriguez    (10000000-0000-4000-8000-000000000005)
-- Category   : Software Design & Architecture (20000000-0000-4000-8000-000000000010)
-- Level      : ADVANCED · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 The Foundations of DDD   → C1 Why DDD & the Domain Model · C2 Ubiquitous Language & Subdomains
--   M2 Strategic Design         → C3 Bounded Contexts · C4 Context Mapping
--   M3 Tactical Building Blocks → C5 Entities & Value Objects · C6 Aggregates & Domain Events
--   M4 Application Architecture → C7 Repositories & Factories · C8 Services & Layering
--   M5 DDD at Scale & Capstone  → C9 DDD with Microservices · C10 Event Storming & the Capstone
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
  '02B00000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000005',
  '20000000-0000-4000-8000-000000000010',
  'Domain-Driven Design',
  'domain-driven-design',
  'Learn to build software that reflects a deep understanding of its business domain. Master ubiquitous language, bounded contexts, context maps, aggregates, and domain events — then apply the strategic and tactical tools of DDD to microservices and your own modeling exercises.',
  'PUBLISHED',
  'ADVANCED',
  'SUBSCRIPTION',
  41
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('02B00000-0000-4000-8000-000000000011', '02B00000-0000-4000-8000-000000000001', 'Explain how DDD tackles inherent business complexity and where it truly pays off.', 1),
  ('02B00000-0000-4000-8000-000000000012', '02B00000-0000-4000-8000-000000000001', 'Cultivate a shared ubiquitous language with domain experts, embedded in code and conversation.', 2),
  ('02B00000-0000-4000-8000-000000000013', '02B00000-0000-4000-8000-000000000001', 'Apply strategic design — bounded contexts and context maps — to real systems with integrity.',  3),
  ('02B00000-0000-4000-8000-000000000014', '02B00000-0000-4000-8000-000000000001', 'Model entities, value objects, aggregates, and domain events that express the domain and protect its invariants.', 4),
  ('02B00000-0000-4000-8000-000000000015', '02B00000-0000-4000-8000-000000000001', 'Structure applications with repositories, factories, and clear services, then use event storming to design microservice boundaries.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('02B00000-0000-4000-8000-000000000101', '02B00000-0000-4000-8000-000000000001', 1, 'The Foundations of DDD',   'Understand the complexity problem DDD exists to solve and the domain model pattern that expresses the business.', 'PUBLISHED'),
  ('02B00000-0000-4000-8000-000000000102', '02B00000-0000-4000-8000-000000000001', 2, 'Strategic Design',         'Decompose the problem space into bounded contexts and map how their models connect.',                          'PUBLISHED'),
  ('02B00000-0000-4000-8000-000000000103', '02B00000-0000-4000-8000-000000000001', 3, 'Tactical Building Blocks', 'Model the domain with entities, value objects, aggregates, and domain events.',                             'PUBLISHED'),
  ('02B00000-0000-4000-8000-000000000104', '02B00000-0000-4000-8000-000000000001', 4, 'Application Architecture', 'Wire the model into an application with repositories, factories, and layered services.',                    'PUBLISHED'),
  ('02B00000-0000-4000-8000-000000000105', '02B00000-0000-4000-8000-000000000001', 5, 'DDD at Scale & Capstone',  'Apply DDD to microservices, run an event storming workshop, and model a bounded context end-to-end.',        'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('02B00000-0000-4000-8000-000000000201', '02B00000-0000-4000-8000-000000000101', 1, 'Why DDD & the Domain Model',      'The complexity problem DDD exists to solve and how a rich domain model is built.', 'PUBLISHED'),
  ('02B00000-0000-4000-8000-000000000202', '02B00000-0000-4000-8000-000000000101', 2, 'Ubiquitous Language & Subdomains', 'A shared vocabulary and a map of the problem space.',                             'PUBLISHED'),
  ('02B00000-0000-4000-8000-000000000203', '02B00000-0000-4000-8000-000000000102', 1, 'Bounded Contexts',                 'Explicit boundaries around every model and keeping them honest.',                  'PUBLISHED'),
  ('02B00000-0000-4000-8000-000000000204', '02B00000-0000-4000-8000-000000000102', 2, 'Context Mapping',                  'The relationships between contexts and how they negotiate.',                       'PUBLISHED'),
  ('02B00000-0000-4000-8000-000000000205', '02B00000-0000-4000-8000-000000000103', 1, 'Entities & Value Objects',         'Identity and value in the domain model.',                                          'PUBLISHED'),
  ('02B00000-0000-4000-8000-000000000206', '02B00000-0000-4000-8000-000000000103', 2, 'Aggregates & Domain Events',       'Consistency boundaries and facts the business cares about.',                       'PUBLISHED'),
  ('02B00000-0000-4000-8000-000000000207', '02B00000-0000-4000-8000-000000000104', 1, 'Repositories & Factories',         'How aggregates get in and out of storage and how they are constructed.',           'PUBLISHED'),
  ('02B00000-0000-4000-8000-000000000208', '02B00000-0000-4000-8000-000000000104', 2, 'Services & Layering',              'Application flow versus domain logic, kept apart.',                                'PUBLISHED'),
  ('02B00000-0000-4000-8000-000000000209', '02B00000-0000-4000-8000-000000000105', 1, 'DDD with Microservices',           'Service boundaries drawn from the business.',                                      'PUBLISHED'),
  ('02B00000-0000-4000-8000-000000000210', '02B00000-0000-4000-8000-000000000105', 2, 'Event Storming & the Capstone',    'A collaborative workshop technique and a full modeling walkthrough.',              'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 02B00000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('02B00000-0000-4000-8000-000000000301', '02B00000-0000-4000-8000-000000000201', 1, 'Why Domain-Driven Design?',          'The complexity problem and where DDD pays off.',                               'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02B00000-0000-4000-8000-000000000302', '02B00000-0000-4000-8000-000000000201', 2, 'The Domain Model Pattern',            'Behavior and data living together in the model.',                               'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02B00000-0000-4000-8000-000000000303', '02B00000-0000-4000-8000-000000000201', 3, 'DDD Foundations Quiz',                'Check your grasp of DDD fundamentals.',                                        'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02B00000-0000-4000-8000-000000000304', '02B00000-0000-4000-8000-000000000202', 1, 'Building a Ubiquitous Language',      'One vocabulary for experts and code alike.',                                   'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02B00000-0000-4000-8000-000000000305', '02B00000-0000-4000-8000-000000000202', 2, 'Subdomains & the Core Domain',        'The problem space, the core, supporting, and generic subdomains.',              'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('02B00000-0000-4000-8000-000000000306', '02B00000-0000-4000-8000-000000000202', 3, 'Ubiquitous Language Quiz',            'Verify the language and subdomain concepts.',                                  'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02B00000-0000-4000-8000-000000000307', '02B00000-0000-4000-8000-000000000203', 1, 'Bounded Contexts',                    'Explicit boundaries around each model.',                                       'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02B00000-0000-4000-8000-000000000308', '02B00000-0000-4000-8000-000000000203', 2, 'Defining & Guarding Boundaries',      'Find the seams and keep them honest.',                                         'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02B00000-0000-4000-8000-000000000309', '02B00000-0000-4000-8000-000000000203', 3, 'Bounded Contexts Quiz',               'Verify boundaries and ownership.',                                             'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02B00000-0000-4000-8000-000000000310', '02B00000-0000-4000-8000-000000000204', 1, 'Context Map Patterns',                'Nine well-known relationships between contexts.',                               'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02B00000-0000-4000-8000-000000000311', '02B00000-0000-4000-8000-000000000204', 2, 'Mapping an Existing System',          'Discover latent contexts in brownfield systems.',                               'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02B00000-0000-4000-8000-000000000312', '02B00000-0000-4000-8000-000000000204', 3, 'Context Mapping Quiz',                'Check the relationship patterns.',                                              'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02B00000-0000-4000-8000-000000000313', '02B00000-0000-4000-8000-000000000205', 1, 'Entities',                            'Continuous identity through change.',                                          'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('02B00000-0000-4000-8000-000000000314', '02B00000-0000-4000-8000-000000000205', 2, 'Value Objects',                       'Immutability and value equality.',                                             'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('02B00000-0000-4000-8000-000000000315', '02B00000-0000-4000-8000-000000000205', 3, 'Entities & Value Objects Quiz',       'Test identity versus value.',                                                  'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02B00000-0000-4000-8000-000000000316', '02B00000-0000-4000-8000-000000000206', 1, 'Aggregates',                          'Invariants guarded by a single root.',                                         'TEXT',  'PUBLISHED', 'FREE', 10, 11),
  ('02B00000-0000-4000-8000-000000000317', '02B00000-0000-4000-8000-000000000206', 2, 'Domain Events',                       'Facts, in the past tense, that the business cares about.',                      'TEXT',  'PUBLISHED', 'FREE', 10, 11),
  ('02B00000-0000-4000-8000-000000000318', '02B00000-0000-4000-8000-000000000206', 3, 'Aggregates & Domain Events Quiz',     'Check consistency boundaries and events.',                                      'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02B00000-0000-4000-8000-000000000319', '02B00000-0000-4000-8000-000000000207', 1, 'Repositories',                        'A gateway for aggregate persistence.',                                          'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('02B00000-0000-4000-8000-000000000320', '02B00000-0000-4000-8000-000000000207', 2, 'Factories',                           'Encapsulating complex construction.',                                           'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02B00000-0000-4000-8000-000000000321', '02B00000-0000-4000-8000-000000000207', 3, 'Repositories & Factories Quiz',       'Check gateway and construction patterns.',                                      'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02B00000-0000-4000-8000-000000000322', '02B00000-0000-4000-8000-000000000208', 1, 'Domain vs Application Services',      'Who does what, and why the distinction matters.',                               'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02B00000-0000-4000-8000-000000000323', '02B00000-0000-4000-8000-000000000208', 2, 'Architecting the DDD Application',    'Layers, ports, and adapters that protect the core.',                            'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02B00000-0000-4000-8000-000000000324', '02B00000-0000-4000-8000-000000000208', 3, 'Application Architecture Quiz',       'Verify layering and responsibilities.',                                         'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02B00000-0000-4000-8000-000000000325', '02B00000-0000-4000-8000-000000000209', 1, 'DDD with Microservices',              'Contexts as service boundaries.',                                               'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02B00000-0000-4000-8000-000000000326', '02B00000-0000-4000-8000-000000000210', 1, 'Event Storming',                      'A collaborative workshop that models the business as a timeline.',               'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02B00000-0000-4000-8000-000000000327', '02B00000-0000-4000-8000-000000000210', 2, 'Capstone: Modeling a Bounded Context','A full kitchen-context design walkthrough.',                                    'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02B00000-0000-4000-8000-000000000328', '02B00000-0000-4000-8000-000000000210', 3, 'Final Assessment',                    'Prove the full DDD toolkit.',                                                   'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 02B00000-…-0401 .. 0427)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '02B00000-0000-4000-8000-000000000401',
  '02B00000-0000-4000-8000-000000000301',
  1,
  'Why Domain-Driven Design?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Why Domain-Driven Design?</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
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
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Why Domain-Driven Design?</h1>
  <p>Most software projects do not fail because the code is hard to write. They fail because the code solves the wrong problem. <strong>Domain-Driven Design</strong> (DDD) attacks complexity where it actually lives: in the <strong>domain</strong> — the business activity the software exists to support.</p>
  <h2>Essential versus accidental complexity</h2>
  <p>Eric Evans separates two kinds of complexity. <strong>Essential complexity</strong> comes from the problem itself: pricing rules, medical regulations, shipping logistics. <strong>Accidental complexity</strong> comes from the tools we choose — frameworks, infrastructure, plumbing.</p>
  <pre class="code-block">// A symptom of anemic modeling: the domain lives in the database
function applyDiscount(orderTotal, couponCode) {
  // rules scattered over call sites, string codes everywhere
  if (couponCode === 'SAVE10') return orderTotal * 0.9;
  return orderTotal;
}</pre>
  <p>DDD argues that most teams over-invest in the accidental variety while letting essential complexity go entirely unmodeled.</p>
  <h2>When DDD is worth the cost</h2>
  <ul>
    <li>Complex business logic that no framework can express.</li>
    <li>Long-lived products where the model must accumulate business value.</li>
    <li>Multiple teams or services that share concepts and let them drift apart.</li>
  </ul>
  <p>For a simple CRUD screen over a lookup table, DDD is overkill. The tools pay off when the <strong>rules</strong> matter more than the <strong>records</strong>.</p>
  <h2>Two halves: strategic and tactical</h2>
  <table>
    <tr><th>Half</th><th>Question it answers</th><th>Tools</th></tr>
    <tr><td>Strategic</td><td>What models do we need, and how do they relate?</td><td>Subdomains, bounded contexts, context maps</td></tr>
    <tr><td>Tactical</td><td>How do we express one model in code?</td><td>Entities, value objects, aggregates, events</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Not a silver bullet</strong>
    <p>DDD does not remove complexity; it makes the essential complexity <em>visible and manageable</em>. Skip it for simple domains, and apply it where the business rules are the product.</p>
  </div>
  <div class="callout callout-info">
    <strong>Prerequisites</strong>
    <p>This is a design course, not a language course. You should already code professionally — read up comfortably on UML-style class sketches and layered architectures before continuing.</p>
  </div>
  <h2>Model-first, not database-first</h2>
  <p>Teams trained on CRUD start from the schema and work upward. DDD flips the direction: the starting point is business behavior, and the schema is merely an implementation detail about persisting that behavior. A surprising consequence: the database design stops being an early commitment and becomes a late, replaceable decision.</p>
  <pre class="code-block">// Start from the rule, then derive the storage
businessRule: 'a case must be escalated within 24 hours'
model:        Case.escalate(reason, recordedAt)
schema:       cases(id, escalated_at, escalation_reason)   // an afterthought</pre>
</div>
</body>
</html>
$html$
),
(
  '02B00000-0000-4000-8000-000000000402',
  '02B00000-0000-4000-8000-000000000302',
  1,
  'The Domain Model Pattern',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Domain Model Pattern</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
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
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>The Domain Model Pattern</h1>
  <p>The <strong>domain model</strong> is a representation of a business activity where <strong>behavior and data live together</strong>. Instead of a passive data structure operated on by external services, the model objects know their own rules and enforce them.</p>
  <h2>Anemic versus rich models</h2>
  <p>An anemic model carries no behavior — it is a bag of getters and setters:</p>
  <pre class="code-block">class Order {
  total;          // public fields, no rules whatsoever
  customer;
  paid = false;
}</pre>
  <p>A rich model carries its invariants with it:</p>
  <pre class="code-block">class Order {
  #items = [];          // private to the model
  #state;

  addItem(product, qty) {
    if (this.#state !== 'DRAFT') throw new StateError('Too late');
    this.#items.push(new OrderLine(product, qty));
    this.#state = this.#state.afterAdd(this);
  }
}</pre>
  <h2>Model-driven design</h2>
  <p>The model is not a diagram on a wall — it is the <strong>living vocabulary</strong> of the code base. Classes map to business concepts; methods map to business operations. When the business says &ldquo;ship the order,&rdquo; there should be a <span class="ic">ship()</span> method, not an UPDATE statement fired from a script.</p>
  <div class="callout">
    <strong>Keep the model intact</strong>
    <p>Resist placing business rules into controllers and stored procedures. Once the rules leak out of the model, the model rots into an anemic data bag — and no single place coherently describes your business.</p>
  </div>
  <h2>The modeling loop</h2>
  <ol>
    <li>Talk to domain experts until a concept is clear.</li>
    <li>Express it in code, using the same words the experts use.</li>
    <li>Refactor relentlessly as understanding deepens.</li>
  </ol>
  <div class="callout callout-info">
    <strong>Modeling never finishes</strong>
    <p>Each meeting, each new rule, each code review is another pass over the model. A team that stops modeling is a team that accepts drift.</p>
  </div>
  <h2>Beware the anemic model</h2>
  <p>Fowler warned of the classic anti-pattern: entities stripped of behavior, with all logic living in service classes. It looks like DDD but delivers none of its benefits. Watch for these symptoms:</p>
  <ul>
    <li>Entities are bags of public getters and setters.</li>
    <li>Service classes grow forever while entities stay empty.</li>
    <li>Business rules appear only in test descriptions, never in code.</li>
  </ul>
  <p>If your model is anemic, you skipped the hard part. The cure is patient: pull one rule back into the objects, one use case at a time.</p>
</div>
</body>
</html>
$html$
),
(
  '02B00000-0000-4000-8000-000000000404',
  '02B00000-0000-4000-8000-000000000304',
  1,
  'Building a Ubiquitous Language',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Building a Ubiquitous Language</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
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
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Building a Ubiquitous Language</h1>
  <p>A <strong>ubiquitous language</strong> is a single vocabulary shared by domain experts, developers, testers, and product owners. It removes the translation layer where the business says one thing and the code says another.</p>
  <h2>The cost of drifting vocabularies</h2>
  <p>When marketing calls it a &ldquo;plan,&rdquo; support calls it a &ldquo;subscription,&rdquo; and the database names a column <span class="ic">sub_type</span>, every conversation needs translation — and every translation is an occasion for a bug.</p>
  <h2>Where the language must appear</h2>
  <ul>
    <li>In spoken conversation: meetings, whiteboards, and design reviews.</li>
    <li>In code: class names, method names, and module names.</li>
    <li>In documents and tickets: the same term always means the same thing.</li>
  </ul>
  <h2>Rules of thumb</h2>
  <table>
    <tr><th>Rule</th><th>Example</th></tr>
    <tr><td>Refuse vague synonyms</td><td>Pick one term per concept and delete the rest</td></tr>
    <tr><td>Never invent jargon</td><td>Use the expert word, even when it feels awkward</td></tr>
    <tr><td>Correct drift early</td><td>Stop a meeting to fix a name that has wandered</td></tr>
  </table>
  <p>If the experts say &ldquo;the case is escalated,&rdquo; then the model should expose <span class="ic">escalate()</span> — not <span class="ic">setPriority(3)</span>.</p>
  <div class="callout">
    <strong>Experts are authors</strong>
    <p>Domain experts do not merely answer questions; they co-author the language. If a developer coins a term the business never uses, discard it.</p>
  </div>
  <div class="callout callout-tip">
    <strong>A glossary is a living artifact</strong>
    <p>Keep a short glossary of loaded terms: one entry per concept, one line of definition. Revisit it every sprint; delete what the code has absorbed.</p>
  </div>
  <h2>From glossary to grammar</h2>
  <p>Nouns become classes, verbs become methods, and rules become invariants. The language stops being a list and starts being a grammar your code obeys:</p>
  <pre class="code-block">noun      case              -&gt; class Case
verb      escalate          -&gt; Case.escalate()
rule      must escalate
          within 24 hours   -&gt; invariant enforced in escalate()</pre>
  <p>When that mapping is direct, a domain expert can read the code and nod along.</p>
</div>
</body>
</html>
$html$
),
(
  '02B00000-0000-4000-8000-000000000405',
  '02B00000-0000-4000-8000-000000000305',
  1,
  'Subdomains & the Core Domain',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Subdomains & the Core Domain</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
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
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Subdomains &amp; the Core Domain</h1>
  <p>Before dividing a system into models, decompose the <strong>problem space</strong> into <strong>subdomains</strong>: identifiable areas of business activity, each with its own body of knowledge.</p>
  <h2>Three kinds of subdomain</h2>
  <table>
    <tr><th>Type</th><th>Role</th><th>Example</th></tr>
    <tr><td>Core</td><td>Where the business differentiates itself</td><td>Pricing engine for an insurer</td></tr>
    <tr><td>Supporting</td><td>Needed, but not strategic</td><td>Internal reporting tool</td></tr>
    <tr><td>Generic</td><td>Found in every industry, often off-the-shelf</td><td>Authentication, invoicing</td></tr>
  </table>
  <h2>Invest where it counts</h2>
  <p>The core subdomain deserves your best efforts: the deepest model, the most careful aggregates, the most senior developers. Generic subdomains should be bought or reused rather than hand-built into strategic weapons.</p>
  <div class="callout">
    <strong>The trap</strong>
    <p>Teams routinely pour 80% of their energy into the 20% of the system that is generic, because generic problems feel familiar and comfortable. DDD says: aim the fancy modeling at the core.</p>
  </div>
  <h2>Subdomains are mental maps, not code</h2>
  <p>A subdomain is a conceptual partition of the business — not yet a model and not yet a service. The strategic design step that follows turns subdomains into <strong>bounded contexts</strong>, one model per subdomain.</p>
  <div class="callout callout-info">
    <strong>One model per subdomain</strong>
    <p>Cleanly separated subdomains hint at naturally separated models. Overlapping subdomains usually mean your understanding of the business is still murky.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Find the core by asking</strong>
    <p>Ask executives a simple question: &ldquo;Which system, if it disappeared, would cost us the most money or reputation?&rdquo; That answer is your core subdomain.</p>
  </div>
  <h2>A quick decomposition exercise</h2>
  <ol>
    <li>List the business activities your product actually supports.</li>
    <li>Ask which one earns the money or prevents the largest losses.</li>
    <li>Mark every remaining activity as supporting or generic, honestly.</li>
    <li>You now know exactly where the modeling budget goes.</li>
  </ol>
  <p>Ten minutes with a whiteboard punches well above its weight: it sets the agenda for the entire strategic design effort that follows.</p>
</div>
</body>
</html>
$html$
),
(
  '02B00000-0000-4000-8000-000000000407',
  '02B00000-0000-4000-8000-000000000307',
  1,
  'Bounded Contexts',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bounded Contexts</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
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
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Bounded Contexts</h1>
  <p>A <strong>bounded context</strong> is an explicit boundary inside which a particular model applies. Different contexts use <strong>the same words with different meanings</strong> — and that is perfectly valid, as long as the boundary stays visible.</p>
  <h2>The &ldquo;order&rdquo; problem</h2>
  <table>
    <tr><th>Context</th><th>Meaning of &ldquo;order&rdquo;</th></tr>
    <tr><td>Sales</td><td>A negotiation with items, discounts, and prices</td></tr>
    <tr><td>Fulfillment</td><td>A payload, a pick list, a courier drop</td></tr>
    <tr><td>Invoicing</td><td>A document with totals and tax lines</td></tr>
  </table>
  <h2>Why boundaries matter</h2>
  <ul>
    <li><strong>Language focus</strong> — each team owns one consistent vocabulary.</li>
    <li><strong>Independent evolution</strong> — contexts change at their own pace.</li>
    <li><strong>Authentic models</strong> — no single model can faithfully satisfy three &ldquo;orders.&rdquo;</li>
    <li><strong>Team alignment</strong> — one team owns one context.</li>
  </ul>
  <h2>Signs you are missing a boundary</h2>
  <ul>
    <li>One class mutated by features from three different departments.</li>
    <li>Terms that mean different things on different screens.</li>
    <li>Shared tables that everyone &ldquo;just reads.&rdquo;</li>
  </ul>
  <div class="callout">
    <strong>Bounded, not blurred</strong>
    <p>A bounded context is a seam. What lives inside stays consistent and pure; translations happen at the seam, never in the middle of the model.</p>
  </div>
  <h2>Contexts and teams are the same map</h2>
  <p>Conway law observes that a product mirrors the communication structure of the team that builds it. DDD leans into the consequence deliberately:</p>
  <ul>
    <li>One team owns one context, end to end.</li>
    <li>Contracts between teams are the contracts between contexts.</li>
    <li>An interface no team owns is an interface nobody maintains.</li>
  </ul>
  <p>If your context boundary never matches the team boundary, someone pays an enormous coordination tax every single day.</p>
  <div class="callout callout-tip">
    <strong>Start small</strong>
    <p>A context can begin as a single package or module in one repository. What matters is the boundary, not the repository count.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02B00000-0000-4000-8000-000000000408',
  '02B00000-0000-4000-8000-000000000308',
  1,
  'Defining & Guarding Boundaries',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Defining & Guarding Boundaries</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
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
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Defining &amp; Guarding Boundaries</h1>
  <p>Bounded contexts are not found by drawing boxes on a diagram. They are <strong>discovered from language, responsibilities, and team ownership</strong> — and then actively guarded.</p>
  <h2>Finding the boundary</h2>
  <ol>
    <li>Group the terms that always appear together in expert conversation.</li>
    <li>Note the places where a term shifts meaning or a rule changes.</li>
    <li>Identify who owns which business responsibilities.</li>
    <li>Test the seam: can one team change its model without consulting the other?</li>
  </ol>
  <h2>Translating at the edge</h2>
  <pre class="code-block">// Fulfillment exposes its own OrderLine.
// Sales never sees it — a translator maps between contexts.
class FulfillmentLine {
  constructor(name, location, qty) {
    if (!location.located) throw new NotLocated();
    this.pick = new PickInstruction(name, location, qty);
  }
}</pre>
  <h2>Guarding the boundary from drift</h2>
  <ul>
    <li>Keep the public interface small and explicit.</li>
    <li>Refuse shared tables and shared mutable entities.</li>
    <li>Translate at the edge — never leak the foreign model inward.</li>
  </ul>
  <div class="callout">
    <strong>Context over tooling</strong>
    <p>Two teams sharing one database are almost certainly one context being held hostage by infrastructure. Fix the boundary, not the schema.</p>
  </div>
  <div class="callout callout-info">
    <strong>Modules are not contexts</strong>
    <p>Modules organize code inside a context. A context is a sociotechnical boundary — teams, language, and model together.</p>
  </div>
  <h2>Publish a boundary contract</h2>
  <p>An explicit contract tells the world what the context promises and what it will never do:</p>
  <pre class="code-block">// context: fulfillment      owner: ops team
// in: orderId (from sales, via ACL)
// out: OrderReady events (published language)
// never: sales prices, customer credit, basket state</pre>
  <p>A written contract beats tribal knowledge the moment a third consumer inevitably arrives.</p>
</div>
</body>
</html>
$html$
),
(
  '02B00000-0000-4000-8000-000000000410',
  '02B00000-0000-4000-8000-000000000310',
  1,
  'Context Map Patterns',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Context Map Patterns</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
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
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Context Map Patterns</h1>
  <p>A <strong>context map</strong> is the graph of relationships between bounded contexts. It documents how each model intersects and who holds power over whom. Nine well-known patterns describe the common arrangements.</p>
  <h2>Cooperation patterns (mutual power)</h2>
  <ul>
    <li><strong>Partnership</strong> — teams coordinate development and plan jointly; failures are shared.</li>
    <li><strong>Shared kernel</strong> — a deliberately small common model under strict change control.</li>
  </ul>
  <h2>Upstream / downstream patterns (one-sided power)</h2>
  <table>
    <tr><th>Pattern</th><th>Upstream</th><th>Downstream</th></tr>
    <tr><td>Customer-supplier</td><td>Plans while considering downstream</td><td>Negotiates as a customer; affected by upstream plans</td></tr>
    <tr><td>Conformist</td><td>Ignores downstream</td><td>Surrenders, adopts the upstream model</td></tr>
    <tr><td>Anti-corruption layer</td><td>Ignores downstream</td><td>Translates at the edge, keeps its own pure model</td></tr>
  </table>
  <h2>Model sharing patterns</h2>
  <ul>
    <li><strong>Open host service</strong> — upstream publishes a stable protocol (API) for many consumers.</li>
    <li><strong>Published language</strong> — a well-documented interchange format (contracts, schemas) both sides agree on.</li>
  </ul>
  <h2>Other patterns</h2>
  <ul>
    <li><strong>Separate ways</strong> — contexts have no integration; duplication is accepted deliberately.</li>
    <li><strong>Big ball of mud</strong> — the absence of a meaningful relationship; everyone shares everything and nothing works well.</li>
  </ul>
  <div class="callout">
    <strong>Draw the map, then decide</strong>
    <p>Every relationship on the map is a decision about power and translation. Draw the current state before you design the target state.</p>
  </div>
  <div class="callout callout-tip">
    <strong>ACL is your friend</strong>
    <p>When integrating with a legacy system you cannot change, an anti-corruption layer protects your budding model from its sludge. You will build one in the capstone.</p>
  </div>
  <h2>Drawing the map</h2>
  <ul>
    <li>Draw each context as a plain rectangle labeled with the owning team.</li>
    <li>Draw arrows for the dependency direction — always downstream.</li>
    <li>Label every arrow with its pattern and its published contract.</li>
    <li>Color the big ball of mud red; it deserves the attention.</li>
  </ul>
  <p>The map is a living diagram. Update it whenever a relationship changes, or it quietly turns into fiction.</p>
</div>
</body>
</html>
$html$
),
(
  '02B00000-0000-4000-8000-000000000411',
  '02B00000-0000-4000-8000-000000000311',
  1,
  'Mapping an Existing System',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mapping an Existing System</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
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
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Mapping an Existing System</h1>
  <p>Rarely do you start greenfield. Usually a brownfield system already exists, complete with two decades of &ldquo;temporary&rdquo; shortcuts. The context map is your navigation aid for the <strong>as-is</strong> landscape.</p>
  <h2>Discovering latent contexts</h2>
  <ol>
    <li>Interview experts and follow the language: which teams use which words?</li>
    <li>Read the schema: which tables change together? Which are read across teams?</li>
    <li>Trace deployments: what can ship independently today?</li>
    <li>Look for translation points: every mapper, DTO, and adapter is a seam.</li>
  </ol>
  <h2>Reading the signs</h2>
  <table>
    <tr><th>Symptom</th><th>Likely diagnosis</th></tr>
    <tr><td>One table, three definitions</td><td>Missing context boundary</td></tr>
    <tr><td>Nightly sync jobs copying data</td><td>Latent separate ways / published language</td></tr>
    <tr><td>Every service reads the same database</td><td>Big ball of mud, or a shared kernel gone wrong</td></tr>
  </table>
  <h2>From as-is to to-be</h2>
  <p>Draw the current map honestly — it may be embarrassing, but it is true. Then overlay the target map and choose migration tactics: extract a context, wrap an anti-corruption layer, or collapse an accidental split.</p>
  <div class="callout">
    <strong>Map before you build</strong>
    <p>You cannot split services into bounded contexts until you know which contexts actually exist. The map is the prerequisite for every microservices decision in module five.</p>
  </div>
  <div class="callout callout-tip">
    <strong>One map per audience</strong>
    <p>A coarse map for executives, a detailed one (with interfaces) for architects. Different projects need different levels of detail.</p>
  </div>
  <h2>Prioritizing extraction</h2>
  <ol>
    <li>Start with the core domain — its value dwarfs everything else.</li>
    <li>Extract a context only when a team is ready to own it.</li>
    <li>Protect each new context with an anti-corruption layer from day one.</li>
    <li>Fold accidental splits back together before they harden.</li>
  </ol>
  <p>Extraction is a series of small, reversible moves — not a rewrite weekend.</p>
</div>
</body>
</html>
$html$
),
(
  '02B00000-0000-4000-8000-000000000413',
  '02B00000-0000-4000-8000-000000000313',
  1,
  'Entities',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Entities</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
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
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Entities</h1>
  <p>An <strong>entity</strong> is an object with a <strong>continuous identity</strong>: it remains the same thing even as its attributes change. A customer stays <span class="ic">CUST-2041</span> across renames, moves, and address updates.</p>
  <h2>Identity defines the entity</h2>
  <p>Two objects are the same entity when their identities match — not when their fields match:</p>
  <pre class="code-block">const a = new Customer('CUST-2041', 'Ana Gomes');
const b = new Customer('CUST-2041', 'Ana G.');

a.equals(b);   // true — same identity, different attributes</pre>
  <h2>Choosing identity</h2>
  <ul>
    <li>Surrogate id from persistence, such as a UUID or sequence.</li>
    <li>Natural key, such as a driver license number or an ISBN.</li>
    <li>A combination of stable attributes, when no single one suffices.</li>
  </ul>
  <h2>Behavioral entity</h2>
  <p>An entity is not a getter and setter bag. It mutates through <strong>behavioral methods</strong> that enforce its rules:</p>
  <pre class="code-block">class Customer {
  suspend(reason) {
    if (this.#hasOutstandingBalance()) throw new CannotSuspend();
    this.#status = new Suspended(reason);
  }
}</pre>
  <div class="callout">
    <strong>Do not invent entities</strong>
    <p>If a concept has no identity and no lifecycle worth tracking, it is probably a value object. Entities are expensive; model only what must be tracked across time.</p>
  </div>
  <div class="callout callout-tip">
    <strong>ID generation is infrastructure</strong>
    <p>Let infrastructure provide identities (for example, UUIDs at persist time). Do not let your entity logic depend on a particular database sequence.</p>
  </div>
  <h2>Identity through time</h2>
  <table>
    <tr><th>Scenario</th><th>Same identity?</th></tr>
    <tr><td>Customer renamed from Ana to Ana G.</td><td>Yes — identity persisted</td></tr>
    <tr><td>Two customers with identical fields</td><td>No — different identities</td></tr>
    <tr><td>A copy restored from a backup</td><td>Yes — and that is a hazard to guard</td></tr>
  </table>
  <p>Entities earn their keep precisely because they survive change. If nothing about a concept survives mutation, it was never an entity.</p>
</div>
</body>
</html>
$html$
),
(
  '02B00000-0000-4000-8000-000000000414',
  '02B00000-0000-4000-8000-000000000314',
  1,
  'Value Objects',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Value Objects</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
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
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Value Objects</h1>
  <p>A <strong>value object</strong> describes a characteristic with no identity of its own. A money amount, an address, a date range, a product size — they are <strong>defined by their attributes</strong> and are <strong>immutable</strong>.</p>
  <h2>Equality by value</h2>
  <pre class="code-block">const m1 = new Money(19, 'EUR');
const m2 = new Money(19, 'EUR');
m1.equals(m2);   // true — judged purely by its attributes</pre>
  <h2>Immutable by construction</h2>
  <p>Changing a value object produces a <em>new</em> value, never a mutation:</p>
  <pre class="code-block">const half = m1.divide(2);   // returns a new Money(9.5, 'EUR')
// m1 is left completely untouched</pre>
  <h2>Why value objects win</h2>
  <ul>
    <li><strong>Correctness</strong> — types catch errors: <span class="ic">Money</span> can never be mixed with a bare number.</li>
    <li><strong>Safety</strong> — immutable values cannot be corrupted mid-operation.</li>
    <li><strong>Self-documentation</strong> — a <span class="ic">DateRange</span> argument says more than two dates.</li>
  </ul>
  <h2>Where to use them</h2>
  <p>Recommended modeling style: keep entities small and push <strong>most</strong> of the model into rich value objects. Money, quantity, measurements, conversions, and ranges are classic candidates.</p>
  <div class="callout">
    <strong>Lean on the language</strong>
    <p>The more terms that become value objects, the closer the code reads like the expert conversation.</p>
  </div>
  <div class="callout callout-info">
    <strong>Primitive obsession</strong>
    <p>Passing strings and numbers where the domain has a concept is <em>primitive obsession</em>. Wrap the concept; the type system becomes your guardrail.</p>
  </div>
  <h2>Composed values</h2>
  <p>Value objects compose freely — an object can carry other value objects:</p>
  <pre class="code-block">class Address {
  constructor(street, city, postal, country) {
    this.street  = new Street(street);
    this.city    = new City(city);
    this.postal  = new PostalCode(postal);
    this.country = new Country(country);
  }
}</pre>
  <p>Every part validates itself, so an invalid address cannot live long enough to travel anywhere.</p>
</div>
</body>
</html>
$html$
),
(
  '02B00000-0000-4000-8000-000000000416',
  '02B00000-0000-4000-8000-000000000316',
  1,
  'Aggregates',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Aggregates</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
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
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Aggregates</h1>
  <p>An <strong>aggregate</strong> is a cluster of domain objects bound by one <strong>invariant</strong> (a business rule that must always hold) and guarded by a single <strong>root</strong>.</p>
  <h2>The shape</h2>
  <ul>
    <li><strong>Aggregate root</strong> — the only entry point; it owns the cluster.</li>
    <li><strong>Invariants</strong> — rules enforced whenever the state changes.</li>
    <li><strong>Boundary</strong> — outside code references the cluster only through the root.</li>
  </ul>
  <h2>Why the boundary exists</h2>
  <p>If anyone can mutate <span class="ic">order.line.qty</span> directly, no single place can guarantee that &ldquo;total equals the sum of lines.&rdquo; Routing every change through the root makes the invariant enforceable:</p>
  <pre class="code-block">order.addItem(productId, 100);   // the line cap is enforced inside
// outside code can never touch the lines directly</pre>
  <h2>How big should an aggregate be?</h2>
  <p>Smaller is better. A practical guideline: <strong>one aggregate per transaction</strong>, and only the aggregates you actually touch are loaded. The classic failure is a giant aggregate wired together for UI convenience — it turns every change into a contention fight and cripples scale.</p>
  <div class="callout">
    <strong>Reference, do not own</strong>
    <p>Entities outside an aggregate reference the root <em>by identity</em>, not by object pointer. Fetch the real object only when you actually transact with it.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Rule of thumb</strong>
    <p>If you cannot state the invariant an aggregate protects in a single sentence, split it into smaller aggregates.</p>
  </div>
  <h2>State transitions belong to the root</h2>
  <pre class="code-block">class KitchenOrder {
  receive(orderId, lines) {
    this.#state = State.RECEIVED;
  }
  markReady() {
    if (this.#state !== State.RECEIVED) throw new IllegalState();
    this.#state = State.READY;
    this.events.push(new OrderReady(this.id));
  }
}</pre>
  <p>The root owns its lifecycle. Illegal transitions fail fast, at the exact place where state changes.</p>
</div>
</body>
</html>
$html$
),
(
  '02B00000-0000-4000-8000-000000000417',
  '02B00000-0000-4000-8000-000000000317',
  1,
  'Domain Events',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Domain Events</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
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
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Domain Events</h1>
  <p>A <strong>domain event</strong> is a fact, expressed in the past tense, that happened inside the model and matters to the business: <span class="ic">OrderShipped</span>, <span class="ic">AccountSuspended</span>, <span class="ic">SeatReserved</span>.</p>
  <h2>Publishing an event</h2>
  <pre class="code-block">class Order {
  ship(courier) {
    this.#markShipped(courier);
    this.events.push(new OrderShipped(this.id, courier));
  }
}</pre>
  <p>Domain events cross the aggregate boundary safely: the aggregate <em>records</em> facts, and something else decides who cares.</p>
  <h2>Why events matter</h2>
  <ul>
    <li><strong>Decoupling</strong> — the shipping module never calls the invoicing module directly.</li>
    <li><strong>Side effects at last</strong> — aggregates stay small and cohesive.</li>
    <li><strong>Audit truth</strong> — a stream of recorded facts is a history of what actually happened.</li>
  </ul>
  <h2>Event sourcing</h2>
  <p>When events are stored as the source of truth and the current state is <em>recomputed</em> by replaying them, that is <strong>event sourcing</strong>. It pairs naturally with DDD but is an independent decision — begin with events for integration, not for storage.</p>
  <div class="callout">
    <strong>Name them as facts</strong>
    <p>Names are noun phrases in the past tense. <span class="ic">OrderShipped</span>, not <span class="ic">ShipOrder</span> (a command) and not <span class="ic">OrderWasShippedByUsOnFriday</span> (noise).</p>
  </div>
  <div class="callout callout-info">
    <strong>Infrastructure stays quiet</strong>
    <p>Broker publishing is infrastructure. The domain only knows it recorded an event; the transport is someone elses job.</p>
  </div>
  <h2>Commands versus events</h2>
  <table>
    <tr><th></th><th>Command</th><th>Event</th></tr>
    <tr><td>Tense</td><td>Imperative: prepare order</td><td>Past fact: OrderReady</td></tr>
    <tr><td>Direction</td><td>Into the model</td><td>Out of the model</td></tr>
    <tr><td>Can it fail?</td><td>Yes — it may be rejected</td><td>No — it already happened</td></tr>
  </table>
  <p>Mixing the two is a classic leak: a fact should never be treated as a request that can be declined.</p>
</div>
</body>
</html>
$html$
),
(
  '02B00000-0000-4000-8000-000000000419',
  '02B00000-0000-4000-8000-000000000319',
  1,
  'Repositories',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Repositories</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
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
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Repositories</h1>
  <p>A <strong>repository</strong> gives each aggregate a clean way in and out of storage: it looks and feels like a collection, but behind that veil it finds or persists objects however it likes.</p>
  <h2>The interface belongs to the domain</h2>
  <pre class="code-block">interface OrderRepository {
  findById(id: OrderId): Order | null;
  add(order: Order): void;
}</pre>
  <p>The interface is written in domain terms and lives in the domain layer. The PostgreSQL implementation lives in infrastructure — the model never touches SQL.</p>
  <h2>What a repository should do</h2>
  <ul>
    <li>Load an <strong>entire aggregate</strong> in one operation.</li>
    <li>Return domain objects, never raw database rows.</li>
    <li>Persist the aggregate as a whole, atomically.</li>
  </ul>
  <h2>Design guidance</h2>
  <ul>
    <li>One repository <strong>per aggregate root</strong>.</li>
    <li>No repositories for every entity — only roots are fetched.</li>
    <li>Queries that return projections or reports live elsewhere.</li>
  </ul>
  <div class="callout">
    <strong>Not a data access layer</strong>
    <p>A repository is an <em>aggregate gateway</em>, not a CRUD service. If you are exposing the persistence model through it, you have an anemic entity problem, not a repository problem.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Testing via the interface</strong>
    <p>The domain interface makes in-memory fakes trivial — nothing about persistence leaks into your unit tests.</p>
  </div>
  <h2>Finders beyond the roots</h2>
  <p>Reports, search screens, and dashboards want projections, not loaded aggregates. Give them dedicated query read models rather than stretching the repository into a query engine — the aggregates stay pure and the queries stay fast.</p>
  <p>A simple rule keeps this honest: if the caller intends to <em>mutate</em>, load through the repository; if it intends to <em>display</em>, use a projection.</p>
</div>
</body>
</html>
$html$
),
(
  '02B00000-0000-4000-8000-000000000420',
  '02B00000-0000-4000-8000-000000000320',
  1,
  'Factories',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Factories</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
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
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Factories</h1>
  <p>A <strong>factory</strong> encapsulates creation. Whenever assembling an object or an aggregate is more interesting than a plain constructor call, a factory centralizes that knowledge so call sites stay simple and the rules live in one place.</p>
  <h2>Factory method on the aggregate</h2>
  <pre class="code-block">class Order {
  static placeholderFor(customer) {
    const order = new Order(OrderId.generate());
    order.assignCustomer(customer);
    return order;
  }
}</pre>
  <h2>Factory class for hard assembly</h2>
  <pre class="code-block">class OrderFactory {
  fromCart(cart) {
    const order = new Order(OrderId.generate(), cart.customerId);
    for (const item of cart) order.addItem(item.product, item.qty);
    return order;
  }
}</pre>
  <h2>Rules of thumb</h2>
  <ul>
    <li>Move construction that involves <em>multiple objects</em> or <em>invariants</em> into a factory.</li>
    <li>A factory can create entities and value objects; a factory is not a repository.</li>
    <li>Keep factories in the domain; they encode business assembly rules.</li>
  </ul>
  <div class="callout">
    <strong>Constructors stay honest</strong>
    <p>If a constructor quietly accepts an impossible combination, some caller will eventually build one. Factories make impossible states impossible to construct.</p>
  </div>
  <div class="callout callout-info">
    <strong>Specifications pair well</strong>
    <p>A <span class="ic">specification</span> (is this candidate eligible?) pairs with factories: the factory reads the specification, and the same rule stays reusable inside queries.</p>
  </div>
  <h2>Factory or constructor?</h2>
  <ul>
    <li>Constructors for simple values; a factory for aggregates.</li>
    <li>Factories when the assembly encodes invariants or defaults.</li>
    <li>Avoid a factory that merely forwards every argument unchanged.</li>
  </ul>
  <p>The moment construction becomes &ldquo;interesting,&rdquo; the factory earns its keep.</p>
</div>
</body>
</html>
$html$
),
(
  '02B00000-0000-4000-8000-000000000422',
  '02B00000-0000-4000-8000-000000000322',
  1,
  'Domain vs Application Services',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Domain vs Application Services</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
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
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Domain vs Application Services</h1>
  <p>Both carry the name &ldquo;service,&rdquo; but they hold <strong>different responsibilities</strong> — and confusing the two is the fastest route back to an anemic model.</p>
  <h2>Application service (use-case coordinator)</h2>
  <pre class="code-block">class PlaceOrderService {
  constructor(orderRepo, identity) { }

  placeOrder(draft) {
    const customer = this.findCustomer(draft.customerId);
    const order = this.orderFactory.fromDraft(draft, customer);
    this.orderRepo.add(order);          // one transaction
    return order.id;
  }
}</pre>
  <h2>Domain service (a rule that fits nowhere)</h2>
  <pre class="code-block">class DiscountCalculator {
  compute(order, member) {
    if (member.isLoyalCustomer()) return applyLoyalty(order);
    return applyStandard(order);
  }
}</pre>
  <h2>How to tell them apart</h2>
  <table>
    <tr><th>Application service</th><th>Domain service</th></tr>
    <tr><td>Orchestrates a use case</td><td>Implements a domain rule</td></tr>
    <tr><td>Mentions repositories, transactions</td><td>Mentions only domain concepts</td></tr>
    <tr><td>Stateless, thin, delegating</td><td>Full of business logic</td></tr>
  </table>
  <div class="callout">
    <strong>Guard the difference</strong>
    <p>When application services start growing discount rules and approval logic, the domain is leaking. Push that logic down into entities, value objects, or domain services.</p>
  </div>
  <div class="callout callout-tip">
    <strong>When do you need a domain service?</strong>
    <p>When a rule involves several aggregates or is not the natural job of any single object. Otherwise prefer behavior on the objects themselves.</p>
  </div>
  <h2>Who owns the transaction?</h2>
  <pre class="code-block">// Application service: opens and commits the unit of work
runUseCase(command) {
  tx.begin();
  try {
    const order = repo.load(command.orderId);
    order.markReady();
    tx.commit();
  } catch (e) {
    tx.rollback();
    throw e;
  }
}</pre>
  <p>Transactions are application concerns. The domain decides <em>what</em> is true; the application decides <em>when</em> it becomes durably true.</p>
</div>
</body>
</html>
$html$
),
(
  '02B00000-0000-4000-8000-000000000423',
  '02B00000-0000-4000-8000-000000000323',
  1,
  'Architecting the DDD Application',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Architecting the DDD Application</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
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
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Architecting the DDD Application</h1>
  <p>DDD is not a shape for the whole system; it is a way to protect the <strong>core</strong> while letting a variety of infrastructure attach from outside. Its classic expression is a layered arrangement with dependencies pointing <em>inward</em>.</p>
  <h2>Layers and the dependency rule</h2>
  <ul>
    <li><strong>Application</strong> — use-case coordination, transactions, security.</li>
    <li><strong>Domain</strong> — the model: entities, values, aggregates, events, services.</li>
    <li><strong>Infrastructure</strong> — databases, brokers, HTTP clients, UI contracts.</li>
  </ul>
  <p>The rule: <strong>everything depends on the domain; the domain depends on nothing.</strong></p>
  <h2>Ports and adapters</h2>
  <pre class="code-block">// A port: what the domain needs
interface OrderNotifier { notify(orderId: OrderId): void; }

// An adapter: infrastructure fulfills the port
class SmtpOrderNotifier implements OrderNotifier { }</pre>
  <h2>A use case, end to end</h2>
  <ol>
    <li>The application service receives a command (DTO).</li>
    <li>The repository loads the aggregate root.</li>
    <li>The root executes a behavior; the application commits the transaction.</li>
    <li>Collected domain events are published through a port.</li>
  </ol>
  <div class="callout">
    <strong>Keep infrastructure at the door</strong>
    <p>Controllers, ORM mappings, and drivers never drag the domain outward. If a framework dictates your entity shape, the model has already lost.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Modules echo the model</strong>
    <p>Name your top-level modules after bounded contexts and aggregates, not after technical layers.</p>
  </div>
  <h2>Verifying the architecture</h2>
  <ul>
    <li>Encourage one-way imports and enforce them with a dependency rule.</li>
    <li>A domain-only test suite must run with zero infrastructure.</li>
    <li>Swap a real adapter for a fake and prove nothing in the domain changes.</li>
  </ul>
  <p>If those three checks hold, the architecture is an ordinary code review away from holding itself.</p>
</div>
</body>
</html>
$html$
),
(
  '02B00000-0000-4000-8000-000000000425',
  '02B00000-0000-4000-8000-000000000325',
  1,
  'DDD with Microservices',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>DDD with Microservices</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
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
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>DDD with Microservices</h1>
  <p>&ldquo;Microservices&rdquo; is a deployment style. Its healthiest boundaries, however, come from the business — a well-drawn <strong>bounded context</strong> is a natural service boundary.</p>
  <h2>Context maps as service topologies</h2>
  <p>Each service owns its model and its data. Services talk through the relationships your context map already documented: an open host service on one side, an anti-corruption layer on the other, and a published language (a contract) in between.</p>
  <h2>Rules that follow</h2>
  <ul>
    <li>One bounded context, one service, one team. Do not let one context silently span several services.</li>
    <li>No shared databases. The aggregate boundary and the storage boundary coincide.</li>
    <li>Sagas cross services; <strong>domain events</strong> are the natural interaction primitive.</li>
  </ul>
  <h2>The decomposition traps</h2>
  <ul>
    <li>Splitting by <em>layer</em> (one service for entities, one for logic) tears aggregates apart.</li>
    <li>Splitting by <em>table</em> produces chatty services that cannot honor invariants.</li>
    <li>Shared libraries of <em>domain objects</em> across services recreate a shared kernel by accident.</li>
  </ul>
  <div class="callout">
    <strong>Start from the core</strong>
    <p>Extract the core domain into its own context first — careful modeling earns the most when it becomes its own service.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Distributed transactions are lies</strong>
    <p>If two services must commit together, they are probably one aggregate. Redesign: let one owner hold the rule and inform the other with an event.</p>
  </div>
  <h2>Event-driven collaboration</h2>
  <p>A saga is a sequence of local transactions chained by events — exactly the domain-event workflow with a name:</p>
  <pre class="code-block">payments:   PaymentCaptured
      -&gt; kitchen:  OrderReceived     (starts preparation)
      -&gt; courier:  OrderReady        (assigns a driver)
      -&gt; billing:  DeliveryCompleted (closes the job)</pre>
  <p>Each step commits alone; if one fails, compensation undoes the earlier steps. No two-phase commit required.</p>
</div>
</body>
</html>
$html$
),
(
  '02B00000-0000-4000-8000-000000000426',
  '02B00000-0000-4000-8000-000000000326',
  1,
  'Event Storming',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Event Storming</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
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
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Event Storming</h1>
  <p><strong>Event storming</strong> is a fast, sticky-note workshop that reconstructs how a business actually works. A room full of domain experts and developers produces a timeline of domain events in a single day — the quickest route to a shared <strong>ubiquitous language</strong> and a draft context map.</p>
  <h2>The notation</h2>
  <div class="callout">
    <strong>The legend</strong>
    <p>Orange = domain event (past-tense fact). Blue = command (a request that triggers an event). Yellow = actor or system. Purple = a policy that reacts to events. Green = a read model. Violet = the aggregate that receives a command.</p>
  </div>
  <h2>How a storm runs</h2>
  <ol>
    <li><strong>Paint the chaos</strong> — experts shout out past events around &ldquo;the terrible day in the life of&hellip;&rdquo;</li>
    <li><strong>Chronologize</strong> — stickies go onto the timeline; debates surface translation breakdowns.</li>
    <li><strong>Add commands and actors</strong> — what causes each event, and who does it?</li>
    <li><strong>Find aggregates</strong> — group the commands that target the same cluster of state.</li>
    <li><strong>Draw boundaries</strong> — strongly connected clusters become bounded contexts.</li>
  </ol>
  <h2>Three flavors of storm</h2>
  <ul>
    <li><strong>Big picture</strong> — half a day, executives and experts; a coarse map and risk spots.</li>
    <li><strong>Process level</strong> — a single workflow with detailed events and commands.</li>
    <li><strong>Design level</strong> — commands, aggregates, and policies for one context, in depth.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>A handful of whiteboards</strong>
    <p>Divide a long wall into lanes by time or phase. If the timeline overflows, you have found an accidental boundary — a great signal for the context map.</p>
  </div>
  <div class="callout callout-info">
    <strong>Experts own the outcome</strong>
    <p>Your job is to listen and structure. If the experts cannot recognize the result, the storm failed — no matter how elegant the model looks.</p>
  </div>
  <h2>Facilitation tips</h2>
  <ul>
    <li>Keep the wall vertical and the chairs scarce; standing keeps energy up.</li>
    <li>Let every expert place stickies — no proxies, no summaries.</li>
    <li>Capture disagreements as open questions, then move on and return.</li>
    <li>Photograph the wall; the photos become the first draft of the model.</li>
  </ul>
  <p>A well-facilitated storm leaves the room speaking one language. That alone is worth the afternoon.</p>
</div>
</body>
</html>
$html$
),
(
  '02B00000-0000-4000-8000-000000000427',
  '02B00000-0000-4000-8000-000000000327',
  1,
  'Capstone: Modeling a Bounded Context',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Modeling a Bounded Context</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
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
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Modeling a Bounded Context</h1>
  <p>You have collected the full DDD toolbox. Now run the entire loop on one realistic scenario: the <strong>order-taking workflow</strong> of a food delivery platform, seen from the <em>kitchen</em> side. The kitchen is its own bounded context with a very different model from the customer-facing app.</p>
  <h2>Step 1 — Storm the kitchen timeline</h2>
  <p>Events fall out within minutes: <span class="ic">OrderReceived</span>, <span class="ic">ItemRejected</span>, <span class="ic">LinePrepared</span>, <span class="ic">OrderReady</span>, <span class="ic">CourierAssigned</span>, <span class="ic">OrderPickedUp</span>.</p>
  <h2>Step 2 — Commands and actors</h2>
  <p>Kitchen staff issue <span class="ic">Prepare Order</span> and <span class="ic">Reject Item</span>. A policy fires <span class="ic">OrderReady</span> when the last line is prepared. The courier system listens to <span class="ic">OrderReady</span> to assign a picker.</p>
  <h2>Step 3 — The aggregate root</h2>
  <pre class="code-block">class KitchenOrder {          // the aggregate root
  #lines = [];

  receive(orderId, lines) { }  // lists dish facts, no prices
  markReady() { }              // fires OrderReady exactly once
}</pre>
  <h2>Step 4 — Repositories and values</h2>
  <ul>
    <li><span class="ic">KitchenOrderRepository</span> loads a root by id for the whole kitchen shift.</li>
    <li>Dish, line quantity, and preparation state are immutable value objects.</li>
    <li>Price and discount belong to someone elses model — the kitchen ignores them.</li>
  </ul>
  <h2>Step 5 — Integrations across the map</h2>
  <p>The customer app is upstream; you are downstream. Protect the kitchen model on the inbound side, and publish <span class="ic">OrderReady</span> to the courier context through a published language on the outbound side.</p>
  <div class="callout">
    <strong>Judge by the language</strong>
    <p>Read the model out loud. &ldquo;The kitchen receives an order, prepares lines, and reports ready&rdquo; — if that sentence is obvious from the code, you have succeeded.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Extend it</strong>
    <p>Run the same steps for the payment context or the courier context. Each one produces a different model and a different context map — that is DDD working.</p>
  </div>
  <h2>A note on the anti-corruption layer</h2>
  <p>Inbound translation from the customer app happens in a dedicated seam, never inside the kitchen model:</p>
  <pre class="code-block">class CustomerOrderTranslator {
  toKitchen(customerOrder) {
    // pick only what the kitchen model understands
    return new KitchenOrder(customerOrder.id, toDishLines(customerOrder.items));
  }
}</pre>
  <p>The kitchen model cannot be polluted by foreign concepts — the anti-corruption layer is the only door.</p>
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
  ('02B00000-0000-4000-8000-000000000501', '02B00000-0000-4000-8000-000000000303',
   'In DDD, the primary source of software complexity is…',
   'Essential complexity lives in the business domain itself.', 1),
  ('02B00000-0000-4000-8000-000000000502', '02B00000-0000-4000-8000-000000000303',
   'A rich domain model is best described as…',
   'Behavior and data live together inside the model.', 2),
  ('02B00000-0000-4000-8000-000000000503', '02B00000-0000-4000-8000-000000000303',
   'When does DDD pay off the most?',
   'Complex business rules that define the product deserve a deep model.', 3),
  ('02B00000-0000-4000-8000-000000000504', '02B00000-0000-4000-8000-000000000306',
   'A ubiquitous language is…',
   'A shared vocabulary used by experts and developers everywhere.', 1),
  ('02B00000-0000-4000-8000-000000000505', '02B00000-0000-4000-8000-000000000306',
   'Which method name would a strong ubiquitous language produce?',
   'The method name matches the exact word the experts use.', 2),
  ('02B00000-0000-4000-8000-000000000506', '02B00000-0000-4000-8000-000000000306',
   'The core subdomain is where the business…',
   'Differentiates itself and drives the competition.', 3),
  ('02B00000-0000-4000-8000-000000000507', '02B00000-0000-4000-8000-000000000309',
   'A bounded context is…',
   'An explicit boundary within which one model applies.', 1),
  ('02B00000-0000-4000-8000-000000000508', '02B00000-0000-4000-8000-000000000309',
   'The same term appearing in two different contexts usually means…',
   'Each context holds its own valid meaning for the term.', 2),
  ('02B00000-0000-4000-8000-000000000509', '02B00000-0000-4000-8000-000000000309',
   'Context boundaries are best discovered from…',
   'Language, responsibilities, and team ownership.', 3),
  ('02B00000-0000-4000-8000-000000000510', '02B00000-0000-4000-8000-000000000312',
   'An anti-corruption layer exists to…',
   'Translate at the edge and protect the downstream model.', 1),
  ('02B00000-0000-4000-8000-000000000511', '02B00000-0000-4000-8000-000000000312',
   'In a customer-supplier relationship, the supplier…',
   'Plans its interface around the downstream needs.', 2),
  ('02B00000-0000-4000-8000-000000000512', '02B00000-0000-4000-8000-000000000312',
   'Which context map pattern deliberately shares a small common model?',
   'A shared kernel couples reuse with strict change control.', 3),
  ('02B00000-0000-4000-8000-000000000513', '02B00000-0000-4000-8000-000000000315',
   'An entity is defined by…',
   'Its continuous identity across time.', 1),
  ('02B00000-0000-4000-8000-000000000514', '02B00000-0000-4000-8000-000000000315',
   'Two value objects with equal attributes are…',
   'The same value, since equality ignores identity.', 2),
  ('02B00000-0000-4000-8000-000000000515', '02B00000-0000-4000-8000-000000000315',
   'Primitive obsession is…',
   'Using strings and numbers where a value object belongs.', 3),
  ('02B00000-0000-4000-8000-000000000516', '02B00000-0000-4000-8000-000000000318',
   'An aggregate protects an invariant by…',
   'Routing every change through the aggregate root.', 1),
  ('02B00000-0000-4000-8000-000000000517', '02B00000-0000-4000-8000-000000000318',
   'References between aggregates should…',
   'Point to roots by identity, not by object pointer.', 2),
  ('02B00000-0000-4000-8000-000000000518', '02B00000-0000-4000-8000-000000000318',
   'Which is a well-formed domain event name?',
   'Domain events are past-tense facts phrased in the domain language.', 3),
  ('02B00000-0000-4000-8000-000000000519', '02B00000-0000-4000-8000-000000000321',
   'A repository presents an aggregate as…',
   'A collection-like gateway backed by persistence.', 1),
  ('02B00000-0000-4000-8000-000000000520', '02B00000-0000-4000-8000-000000000321',
   'Repository interfaces belong in the domain layer because…',
   'The model must not depend on a persistence framework.', 2),
  ('02B00000-0000-4000-8000-000000000521', '02B00000-0000-4000-8000-000000000321',
   'Factories exist to handle…',
   'The rules of constructing objects and aggregates.', 3),
  ('02B00000-0000-4000-8000-000000000522', '02B00000-0000-4000-8000-000000000324',
   'Which job belongs to an application service?',
   'Coordinating a use case and its transaction.', 1),
  ('02B00000-0000-4000-8000-000000000523', '02B00000-0000-4000-8000-000000000324',
   'A domain service is needed when…',
   'A rule does not fit naturally in an entity or value object.', 2),
  ('02B00000-0000-4000-8000-000000000524', '02B00000-0000-4000-8000-000000000324',
   'The DDD dependency rule says…',
   'The domain depends on nothing at all.', 3),
  ('02B00000-0000-4000-8000-000000000525', '02B00000-0000-4000-8000-000000000328',
   'The two halves of DDD are…',
   'Strategic design and tactical modeling.', 1),
  ('02B00000-0000-4000-8000-000000000526', '02B00000-0000-4000-8000-000000000328',
   'Events recorded by an aggregate are published…',
   'Through a port, by application or infrastructure layers.', 2),
  ('02B00000-0000-4000-8000-000000000527', '02B00000-0000-4000-8000-000000000328',
   'A microservice boundary should follow…',
   'The bounded context of the model it owns.', 3),
  ('02B00000-0000-4000-8000-000000000528', '02B00000-0000-4000-8000-000000000328',
   'Event storming begins by…',
   'Laying out domain events on a timeline.', 4),
  ('02B00000-0000-4000-8000-000000000529', '02B00000-0000-4000-8000-000000000328',
   'Design-level event storming turns commands into…',
   'Aggregates that guard the invariants.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; exactly one is_correct = TRUE per question.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): essential complexity
  ('02B00000-0000-4000-8000-000000001001', '02B00000-0000-4000-8000-000000000501', 'Essential complexity in the business domain', TRUE,  1),
  ('02B00000-0000-4000-8000-000000001002', '02B00000-0000-4000-8000-000000000501', 'The programming language and the framework in use', FALSE, 2),
  ('02B00000-0000-4000-8000-000000001003', '02B00000-0000-4000-8000-000000000501', 'The number of screens in the user interface', FALSE, 3),
  ('02B00000-0000-4000-8000-000000001004', '02B00000-0000-4000-8000-000000000501', 'The size of the cloud infrastructure budget', FALSE, 4),
  -- Q1 (501)q2: rich model
  ('02B00000-0000-4000-8000-000000001005', '02B00000-0000-4000-8000-000000000502', 'A diagram on the wiki that nobody reads', FALSE, 1),
  ('02B00000-0000-4000-8000-000000001006', '02B00000-0000-4000-8000-000000000502', 'A set of REST endpoints for the data model', FALSE, 2),
  ('02B00000-0000-4000-8000-000000001007', '02B00000-0000-4000-8000-000000000502', 'Code where business behavior and data live together', TRUE,  3),
  ('02B00000-0000-4000-8000-000000001008', '02B00000-0000-4000-8000-000000000502', 'A translation table between jargon dictionaries', FALSE, 4),
  -- Q1 (501)q3: when DDD pays off
  ('02B00000-0000-4000-8000-000000001009', '02B00000-0000-4000-8000-000000000503', 'When the domain is simple CRUD over lookup tables', FALSE, 1),
  ('02B00000-0000-4000-8000-000000001010', '02B00000-0000-4000-8000-000000000503', 'When complex business rules are effectively the product', TRUE,  2),
  ('02B00000-0000-4000-8000-000000001011', '02B00000-0000-4000-8000-000000000503', 'When the team is exactly one senior developer', FALSE, 3),
  ('02B00000-0000-4000-8000-000000001012', '02B00000-0000-4000-8000-000000000503', 'When the project uses precisely one database', FALSE, 4),
  -- Q2 (504): ubiquitous language
  ('02B00000-0000-4000-8000-000000001013', '02B00000-0000-4000-8000-000000000504', 'One shared vocabulary used by experts and developers', TRUE,  1),
  ('02B00000-0000-4000-8000-000000001014', '02B00000-0000-4000-8000-000000000504', 'The glossary that stays in the wiki only', FALSE, 2),
  ('02B00000-0000-4000-8000-000000001015', '02B00000-0000-4000-8000-000000000504', 'The API documentation for external consumers', FALSE, 3),
  ('02B00000-0000-4000-8000-000000001016', '02B00000-0000-4000-8000-000000000504', 'A data dictionary generated from the schema', FALSE, 4),
  -- Q2 (504)q2: method name
  ('02B00000-0000-4000-8000-000000001017', '02B00000-0000-4000-8000-000000000505', 'case.escalate()', TRUE,  1),
  ('02B00000-0000-4000-8000-000000001018', '02B00000-0000-4000-8000-000000000505', 'updateRowById(7, 3)', FALSE, 2),
  ('02B00000-0000-4000-8000-000000001019', '02B00000-0000-4000-8000-000000000505', 'setPriorityFlag(true)', FALSE, 3),
  ('02B00000-0000-4000-8000-000000001020', '02B00000-0000-4000-8000-000000000505', 'saveChangesAsync(handle)', FALSE, 4),
  -- Q2 (504)q3: core subdomain
  ('02B00000-0000-4000-8000-000000001021', '02B00000-0000-4000-8000-000000000506', 'Differentiates itself and drives the competition', TRUE,  1),
  ('02B00000-0000-4000-8000-000000001022', '02B00000-0000-4000-8000-000000000506', 'Occupies the largest schema in the database', FALSE, 2),
  ('02B00000-0000-4000-8000-000000001023', '02B00000-0000-4000-8000-000000000506', 'Uses the most third-party libraries', FALSE, 3),
  ('02B00000-0000-4000-8000-000000001024', '02B00000-0000-4000-8000-000000000506', 'Runs all of the nightly batch jobs', FALSE, 4),
  -- Q3 (507): bounded context
  ('02B00000-0000-4000-8000-000000001025', '02B00000-0000-4000-8000-000000000507', 'An explicit boundary within which one model applies', TRUE,  1),
  ('02B00000-0000-4000-8000-000000001026', '02B00000-0000-4000-8000-000000000507', 'A package or namespace in the codebase', FALSE, 2),
  ('02B00000-0000-4000-8000-000000001027', '02B00000-0000-4000-8000-000000000507', 'A database schema full of foreign keys', FALSE, 3),
  ('02B00000-0000-4000-8000-000000001028', '02B00000-0000-4000-8000-000000000507', 'The list of user stories in a sprint', FALSE, 4),
  -- Q3 (507)q2: same term, two contexts
  ('02B00000-0000-4000-8000-000000001029', '02B00000-0000-4000-8000-000000000508', 'A bug that must be fixed by unifying the term', FALSE, 1),
  ('02B00000-0000-4000-8000-000000001030', '02B00000-0000-4000-8000-000000000508', 'Each context owns its own valid meaning for the term', TRUE,  2),
  ('02B00000-0000-4000-8000-000000001031', '02B00000-0000-4000-8000-000000000508', 'Proof that the term is wrong and should be dropped', FALSE, 3),
  ('02B00000-0000-4000-8000-000000001032', '02B00000-0000-4000-8000-000000000508', 'A reason to expand the shared table count', FALSE, 4),
  -- Q3 (507)q3: discovering boundaries
  ('02B00000-0000-4000-8000-000000001033', '02B00000-0000-4000-8000-000000000509', 'Language, responsibilities, and team ownership', TRUE,  1),
  ('02B00000-0000-4000-8000-000000001034', '02B00000-0000-4000-8000-000000000509', 'The total number of source lines', FALSE, 2),
  ('02B00000-0000-4000-8000-000000001035', '02B00000-0000-4000-8000-000000000509', 'The count of already-deployed services', FALSE, 3),
  ('02B00000-0000-4000-8000-000000001036', '02B00000-0000-4000-8000-000000000509', 'The database engine that happens to be installed', FALSE, 4),
  -- Q4 (510): anti-corruption layer
  ('02B00000-0000-4000-8000-000000001037', '02B00000-0000-4000-8000-000000000510', 'Translate at the edge and protect the downstream model', TRUE,  1),
  ('02B00000-0000-4000-8000-000000001038', '02B00000-0000-4000-8000-000000000510', 'Merge two contexts into one shared schema', FALSE, 2),
  ('02B00000-0000-4000-8000-000000001039', '02B00000-0000-4000-8000-000000000510', 'Replicate upstream data verbatim every night', FALSE, 3),
  ('02B00000-0000-4000-8000-000000001040', '02B00000-0000-4000-8000-000000000510', 'Force the upstream team to rename its fields', FALSE, 4),
  -- Q4 (510)q2: customer-supplier
  ('02B00000-0000-4000-8000-000000001041', '02B00000-0000-4000-8000-000000000511', 'May ignore the customer requirements entirely', FALSE, 1),
  ('02B00000-0000-4000-8000-000000001042', '02B00000-0000-4000-8000-000000000511', 'Can change its contract whenever it chooses', FALSE, 2),
  ('02B00000-0000-4000-8000-000000001043', '02B00000-0000-4000-8000-000000000511', 'Plans its interface around the downstream needs', TRUE,  3),
  ('02B00000-0000-4000-8000-000000001044', '02B00000-0000-4000-8000-000000000511', 'Always shares a database with the customer', FALSE, 4),
  -- Q4 (510)q3: shared kernel
  ('02B00000-0000-4000-8000-000000001045', '02B00000-0000-4000-8000-000000000512', 'Partnership', FALSE, 1),
  ('02B00000-0000-4000-8000-000000001046', '02B00000-0000-4000-8000-000000000512', 'Conformist', FALSE, 2),
  ('02B00000-0000-4000-8000-000000001047', '02B00000-0000-4000-8000-000000000512', 'Open host service', FALSE, 3),
  ('02B00000-0000-4000-8000-000000001048', '02B00000-0000-4000-8000-000000000512', 'Shared kernel', TRUE,  4),
  -- Q5 (513): entity identity
  ('02B00000-0000-4000-8000-000000001049', '02B00000-0000-4000-8000-000000000513', 'Its continuous identity across time', TRUE,  1),
  ('02B00000-0000-4000-8000-000000001050', '02B00000-0000-4000-8000-000000000513', 'The exact values of all of its attributes', FALSE, 2),
  ('02B00000-0000-4000-8000-000000001051', '02B00000-0000-4000-8000-000000000513', 'The table used for its storage', FALSE, 3),
  ('02B00000-0000-4000-8000-000000001052', '02B00000-0000-4000-8000-000000000513', 'Its position in the user interface', FALSE, 4),
  -- Q5 (513)q2: value equality
  ('02B00000-0000-4000-8000-000000001053', '02B00000-0000-4000-8000-000000000514', 'Equal when every attribute matches', TRUE,  1),
  ('02B00000-0000-4000-8000-000000001054', '02B00000-0000-4000-8000-000000000514', 'Equal only when the references match', FALSE, 2),
  ('02B00000-0000-4000-8000-000000001055', '02B00000-0000-4000-8000-000000000514', 'Never considered equal to anything else', FALSE, 3),
  ('02B00000-0000-4000-8000-000000001056', '02B00000-0000-4000-8000-000000000514', 'Equal when their ids match', FALSE, 4),
  -- Q5 (513)q3: primitive obsession
  ('02B00000-0000-4000-8000-000000001057', '02B00000-0000-4000-8000-000000000515', 'Representing domain concepts with raw strings and numbers', TRUE,  1),
  ('02B00000-0000-4000-8000-000000001058', '02B00000-0000-4000-8000-000000000515', 'Wrapping every concept in a typed value object', FALSE, 2),
  ('02B00000-0000-4000-8000-000000001059', '02B00000-0000-4000-8000-000000000515', 'Defining too many entities in one model', FALSE, 3),
  ('02B00000-0000-4000-8000-000000001060', '02B00000-0000-4000-8000-000000000515', 'Putting business rules into stored procedures', FALSE, 4),
  -- Q6 (516): aggregate invariant
  ('02B00000-0000-4000-8000-000000001061', '02B00000-0000-4000-8000-000000000516', 'Routing every change through the aggregate root', TRUE,  1),
  ('02B00000-0000-4000-8000-000000001062', '02B00000-0000-4000-8000-000000000516', 'Publishing every field as public', FALSE, 2),
  ('02B00000-0000-4000-8000-000000001063', '02B00000-0000-4000-8000-000000000516', 'Storing all entities in one table', FALSE, 3),
  ('02B00000-0000-4000-8000-000000001064', '02B00000-0000-4000-8000-000000000516', 'Letting children mutate independently', FALSE, 4),
  -- Q6 (516)q2: cross-aggregate reference
  ('02B00000-0000-4000-8000-000000001065', '02B00000-0000-4000-8000-000000000517', 'Keep object pointers so navigation is cheap', FALSE, 1),
  ('02B00000-0000-4000-8000-000000001066', '02B00000-0000-4000-8000-000000000517', 'Point to roots by identity, not by pointer', TRUE,  2),
  ('02B00000-0000-4000-8000-000000001067', '02B00000-0000-4000-8000-000000000517', 'Clone the entire cluster into every aggregate', FALSE, 3),
  ('02B00000-0000-4000-8000-000000001068', '02B00000-0000-4000-8000-000000000517', 'Share identical instances across aggregates', FALSE, 4),
  -- Q6 (516)q3: event naming
  ('02B00000-0000-4000-8000-000000001069', '02B00000-0000-4000-8000-000000000518', 'ShipTheOrderImmediately', FALSE, 1),
  ('02B00000-0000-4000-8000-000000001070', '02B00000-0000-4000-8000-000000000518', 'updateOrderStatus', FALSE, 2),
  ('02B00000-0000-4000-8000-000000001071', '02B00000-0000-4000-8000-000000000518', 'checkForReadyOrders', FALSE, 3),
  ('02B00000-0000-4000-8000-000000001072', '02B00000-0000-4000-8000-000000000518', 'OrderShipped', TRUE,  4),
  -- Q7 (519): repository role
  ('02B00000-0000-4000-8000-000000001073', '02B00000-0000-4000-8000-000000000519', 'A collection-like gateway backed by persistence', TRUE,  1),
  ('02B00000-0000-4000-8000-000000001074', '02B00000-0000-4000-8000-000000000519', 'A reporting engine that runs large queries', FALSE, 2),
  ('02B00000-0000-4000-8000-000000001075', '02B00000-0000-4000-8000-000000000519', 'A cache sitting in front of the database', FALSE, 3),
  ('02B00000-0000-4000-8000-000000001076', '02B00000-0000-4000-8000-000000000519', 'A DAO that returns raw database rows', FALSE, 4),
  -- Q7 (519)q2: repository interface location
  ('02B00000-0000-4000-8000-000000001077', '02B00000-0000-4000-8000-000000000520', 'The domain layer, so the model stays persistence-independent', TRUE,  1),
  ('02B00000-0000-4000-8000-000000001078', '02B00000-0000-4000-8000-000000000520', 'The infrastructure layer, next to the SQL driver', FALSE, 2),
  ('02B00000-0000-4000-8000-000000001079', '02B00000-0000-4000-8000-000000000520', 'The API layer, where the endpoints are opened', FALSE, 3),
  ('02B00000-0000-4000-8000-000000001080', '02B00000-0000-4000-8000-000000000520', 'The UI layer, so screens can call it directly', FALSE, 4),
  -- Q7 (519)q3: factory responsibility
  ('02B00000-0000-4000-8000-000000001081', '02B00000-0000-4000-8000-000000000521', 'Reading aggregates out of storage', FALSE, 1),
  ('02B00000-0000-4000-8000-000000001082', '02B00000-0000-4000-8000-000000000521', 'Broadcasting messages to the broker', FALSE, 2),
  ('02B00000-0000-4000-8000-000000001083', '02B00000-0000-4000-8000-000000000521', 'Encapsulating the rules of object construction', TRUE,  3),
  ('02B00000-0000-4000-8000-000000001084', '02B00000-0000-4000-8000-000000000521', 'Opening and committing the transaction', FALSE, 4),
  -- Q8 (522): application service job
  ('02B00000-0000-4000-8000-000000001085', '02B00000-0000-4000-8000-000000000522', 'Coordinating a use case and its transaction', TRUE,  1),
  ('02B00000-0000-4000-8000-000000001086', '02B00000-0000-4000-8000-000000000522', 'Calculating the loyalty discount', FALSE, 2),
  ('02B00000-0000-4000-8000-000000001087', '02B00000-0000-4000-8000-000000000522', 'Mutating entity fields through public setters', FALSE, 3),
  ('02B00000-0000-4000-8000-000000001088', '02B00000-0000-4000-8000-000000000522', 'Serializing aggregates to JSON', FALSE, 4),
  -- Q8 (522)q2: when a domain service is needed
  ('02B00000-0000-4000-8000-000000001089', '02B00000-0000-4000-8000-000000000523', 'When a rule fits no single entity or value object', TRUE,  1),
  ('02B00000-0000-4000-8000-000000001090', '02B00000-0000-4000-8000-000000000523', 'Whenever the team needs an extra file', FALSE, 2),
  ('02B00000-0000-4000-8000-000000001091', '02B00000-0000-4000-8000-000000000523', 'When a REST controller feels too lightweight', FALSE, 3),
  ('02B00000-0000-4000-8000-000000001092', '02B00000-0000-4000-8000-000000000523', 'When the entity layer has nothing left to do', FALSE, 4),
  -- Q8 (522)q3: dependency rule
  ('02B00000-0000-4000-8000-000000001093', '02B00000-0000-4000-8000-000000000524', 'The domain depends on nothing at all', TRUE,  1),
  ('02B00000-0000-4000-8000-000000001094', '02B00000-0000-4000-8000-000000000524', 'The application layer owns the framework adapters', FALSE, 2),
  ('02B00000-0000-4000-8000-000000001095', '02B00000-0000-4000-8000-000000000524', 'Every layer depends directly on the database', FALSE, 3),
  ('02B00000-0000-4000-8000-000000001096', '02B00000-0000-4000-8000-000000000524', 'Infrastructure defines the domain model shape', FALSE, 4),
  -- Q9 (525): the two halves
  ('02B00000-0000-4000-8000-000000001097', '02B00000-0000-4000-8000-000000000525', 'Strategic design and tactical modeling', TRUE,  1),
  ('02B00000-0000-4000-8000-000000001098', '02B00000-0000-4000-8000-000000000525', 'Entities and database tables', FALSE, 2),
  ('02B00000-0000-4000-8000-000000001099', '02B00000-0000-4000-8000-000000000525', 'Monoliths and event sourcing', FALSE, 3),
  ('02B00000-0000-4000-8000-000000001100', '02B00000-0000-4000-8000-000000000525', 'Frontends and backends', FALSE, 4),
  -- Q9 (525)q2: publishing events
  ('02B00000-0000-4000-8000-000000001101', '02B00000-0000-4000-8000-000000000526', 'Inside the same transaction as the command', FALSE, 1),
  ('02B00000-0000-4000-8000-000000001102', '02B00000-0000-4000-8000-000000000526', 'Through a port, handled by application or infrastructure', TRUE,  2),
  ('02B00000-0000-4000-8000-000000001103', '02B00000-0000-4000-8000-000000000526', 'With a direct HTTP call from the aggregate', FALSE, 3),
  ('02B00000-0000-4000-8000-000000001104', '02B00000-0000-4000-8000-000000000526', 'Never, because events stay in memory only', FALSE, 4),
  -- Q9 (525)q3: microservice boundary
  ('02B00000-0000-4000-8000-000000001105', '02B00000-0000-4000-8000-000000000527', 'The bounded context that owns the model', TRUE,  1),
  ('02B00000-0000-4000-8000-000000001106', '02B00000-0000-4000-8000-000000000527', 'The number of tables the service touches', FALSE, 2),
  ('02B00000-0000-4000-8000-000000001107', '02B00000-0000-4000-8000-000000000527', 'The layout of the frontend components', FALSE, 3),
  ('02B00000-0000-4000-8000-000000001108', '02B00000-0000-4000-8000-000000000527', 'The stages of the delivery pipeline', FALSE, 4),
  -- Q9 (525)q4: event storming start
  ('02B00000-0000-4000-8000-000000001109', '02B00000-0000-4000-8000-000000000528', 'Writing the final class diagram for review', FALSE, 1),
  ('02B00000-0000-4000-8000-000000001110', '02B00000-0000-4000-8000-000000000528', 'Selecting the message broker vendor', FALSE, 2),
  ('02B00000-0000-4000-8000-000000001111', '02B00000-0000-4000-8000-000000000528', 'Naming every database table up front', FALSE, 3),
  ('02B00000-0000-4000-8000-000000001112', '02B00000-0000-4000-8000-000000000528', 'Laying out domain events on a timeline', TRUE,  4),
  -- Q9 (525)q5: design-level storm output
  ('02B00000-0000-4000-8000-000000001113', '02B00000-0000-4000-8000-000000000529', 'Endpoints on a whiteboard', FALSE, 1),
  ('02B00000-0000-4000-8000-000000001114', '02B00000-0000-4000-8000-000000000529', 'Aggregates that guard the invariants', TRUE,  2),
  ('02B00000-0000-4000-8000-000000001115', '02B00000-0000-4000-8000-000000000529', 'Repository directories and namespaces', FALSE, 3),
  ('02B00000-0000-4000-8000-000000001116', '02B00000-0000-4000-8000-000000000529', 'A list of repositories to create in git', FALSE, 4)
ON CONFLICT (id) DO NOTHING;
-- ============================================================================
-- SEED 013: Complete course — "Design Patterns for Modern Software"
-- ----------------------------------------------------------------------------
-- Instructor : Elena Rodriguez    (10000000-0000-4000-8000-000000000005)
-- Category   : Software Design & Architecture (20000000-0000-4000-8000-000000000010)
-- Level      : ADVANCED · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Principles & Foundations        → C1 SOLID Principles · C2 Composition & Abstraction
--   M2 Creational Patterns             → C3 Factory & Builder · C4 Singleton & Prototype
--   M3 Structural Patterns             → C5 Adapter & Facade · C6 Decorator & Composite
--   M4 Behavioral Patterns             → C7 Observer & Strategy · C8 Template Method & State
--   M5 Capstone: Refactoring Legacy Code → C9 Project Setup & Design Review · C10 Applying Patterns & Testing
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
  'D0000000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000005',
  '20000000-0000-4000-8000-000000000010',
  'Design Patterns for Modern Software',
  'design-patterns-for-modern-software',
  'Write clean, maintainable code by mastering the SOLID principles and the classic GoF design patterns — creational, structural, and behavioral — applied to real-world code, and finish by refactoring a legacy codebase in a hands-on capstone.',
  'PUBLISHED',
  'ADVANCED',
  'SUBSCRIPTION',
  11
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('D0000000-0000-4000-8000-000000000011', 'D0000000-0000-4000-8000-000000000001', 'Master the five SOLID principles and apply them to daily design decisions.', 1),
  ('D0000000-0000-4000-8000-000000000012', 'D0000000-0000-4000-8000-000000000001', 'Classify the GoF patterns into creational, structural, and behavioral families.', 2),
  ('D0000000-0000-4000-8000-000000000013', 'D0000000-0000-4000-8000-000000000001', 'Implement classic patterns including factory, observer, decorator, and state.', 3),
  ('D0000000-0000-4000-8000-000000000014', 'D0000000-0000-4000-8000-000000000001', 'Evaluate a legacy codebase and map its pain points to the right pattern.', 4),
  ('D0000000-0000-4000-8000-000000000015', 'D0000000-0000-4000-8000-000000000001', 'Refactor legacy code using patterns and back the result with passing tests.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('D0000000-0000-4000-8000-000000000101', 'D0000000-0000-4000-8000-000000000001', 1, 'Principles & Foundations',       'SOLID fundamentals, composition, and abstraction as the bedrock of every pattern.', 'PUBLISHED'),
  ('D0000000-0000-4000-8000-000000000102', 'D0000000-0000-4000-8000-000000000001', 2, 'Creational Patterns',            'Factory, Builder, Singleton, and Prototype — how objects get created cleanly.', 'PUBLISHED'),
  ('D0000000-0000-4000-8000-000000000103', 'D0000000-0000-4000-8000-000000000001', 3, 'Structural Patterns',            'Adapter, Facade, Decorator, and Composite — how objects are composed.', 'PUBLISHED'),
  ('D0000000-0000-4000-8000-000000000104', 'D0000000-0000-4000-8000-000000000001', 4, 'Behavioral Patterns',            'Observer, Strategy, Template Method, and State — how objects cooperate.', 'PUBLISHED'),
  ('D0000000-0000-4000-8000-000000000105', 'D0000000-0000-4000-8000-000000000001', 5, 'Capstone: Refactoring Legacy Code', 'Apply every pattern to refactor a messy legacy codebase safely.', 'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('D0000000-0000-4000-8000-000000000201', 'D0000000-0000-4000-8000-000000000101', 1, 'SOLID Principles',             'The five principles every maintainable codebase leans on.', 'PUBLISHED'),
  ('D0000000-0000-4000-8000-000000000202', 'D0000000-0000-4000-8000-000000000101', 2, 'Composition & Abstraction',     'Compose behaviors and design against interfaces, not classes.', 'PUBLISHED'),
  ('D0000000-0000-4000-8000-000000000203', 'D0000000-0000-4000-8000-000000000102', 1, 'Factory & Builder',             'Create objects without tying clients to concrete classes.', 'PUBLISHED'),
  ('D0000000-0000-4000-8000-000000000204', 'D0000000-0000-4000-8000-000000000102', 2, 'Singleton & Prototype',         'Control object identity and clone existing instances.', 'PUBLISHED'),
  ('D0000000-0000-4000-8000-000000000205', 'D0000000-0000-4000-8000-000000000103', 1, 'Adapter & Facade',              'Fit incompatible interfaces together and hide subsystem complexity.', 'PUBLISHED'),
  ('D0000000-0000-4000-8000-000000000206', 'D0000000-0000-4000-8000-000000000103', 2, 'Decorator & Composite',         'Add responsibilities dynamically and model part-whole trees.', 'PUBLISHED'),
  ('D0000000-0000-4000-8000-000000000207', 'D0000000-0000-4000-8000-000000000104', 1, 'Observer & Strategy',           'Notify dependents automatically and swap algorithms at runtime.', 'PUBLISHED'),
  ('D0000000-0000-4000-8000-000000000208', 'D0000000-0000-4000-8000-000000000104', 2, 'Template Method & State',       'Reuse algorithm skeletons and let state drive behavior.', 'PUBLISHED'),
  ('D0000000-0000-4000-8000-000000000209', 'D0000000-0000-4000-8000-000000000105', 1, 'Project Setup & Design Review', 'Set up the capstone and audit the legacy codebase.', 'PUBLISHED'),
  ('D0000000-0000-4000-8000-000000000210', 'D0000000-0000-4000-8000-000000000105', 2, 'Applying Patterns & Testing',   'Refactor the legacy code and lock behavior in with tests.', 'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: D0000000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('D0000000-0000-4000-8000-000000000301', 'D0000000-0000-4000-8000-000000000201', 1, 'The SOLID Principles Overview',          'Meet the five pillars of maintainable design and see how they shape every pattern.', 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('D0000000-0000-4000-8000-000000000302', 'D0000000-0000-4000-8000-000000000201', 2, 'Single Responsibility & Open/Closed',    'Dig deep into SRP and OCP with concrete refactors.', 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('D0000000-0000-4000-8000-000000000303', 'D0000000-0000-4000-8000-000000000201', 3, 'SOLID Principles Quiz',                  'Check your grasp of the five SOLID principles.', 'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('D0000000-0000-4000-8000-000000000304', 'D0000000-0000-4000-8000-000000000202', 1, 'Composition over Inheritance',            'Prefer object composition to class inheritance for flexible behavior.', 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('D0000000-0000-4000-8000-000000000305', 'D0000000-0000-4000-8000-000000000202', 2, 'Programming to Interfaces',               'Design dependencies against abstractions so clients stay decoupled.', 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('D0000000-0000-4000-8000-000000000306', 'D0000000-0000-4000-8000-000000000202', 3, 'Composition & Abstraction Quiz',          'Verify your composition and interface instincts.', 'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('D0000000-0000-4000-8000-000000000307', 'D0000000-0000-4000-8000-000000000203', 1, 'Factory Method & Simple Factory',         'Create objects without binding callers to concrete types.', 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('D0000000-0000-4000-8000-000000000308', 'D0000000-0000-4000-8000-000000000203', 2, 'Abstract Factory & Builder',              'Build families of related objects and step-by-step constructions.', 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('D0000000-0000-4000-8000-000000000309', 'D0000000-0000-4000-8000-000000000203', 3, 'Factory & Builder Quiz',                  'Test your creational pattern knowledge.', 'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('D0000000-0000-4000-8000-000000000310', 'D0000000-0000-4000-8000-000000000204', 1, 'Singleton Done Right',                    'One instance, global access — and the debate around it.', 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('D0000000-0000-4000-8000-000000000311', 'D0000000-0000-4000-8000-000000000204', 2, 'Prototype & Object Cloning',              'Clone existing objects instead of reconstructing them from scratch.', 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('D0000000-0000-4000-8000-000000000312', 'D0000000-0000-4000-8000-000000000204', 3, 'Singleton & Prototype Quiz',              'Check your understanding of singleton and prototype.', 'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('D0000000-0000-4000-8000-000000000313', 'D0000000-0000-4000-8000-000000000205', 1, 'Adapter: Making Interfaces Fit',          'Bridge incompatible interfaces so classes can collaborate.', 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('D0000000-0000-4000-8000-000000000314', 'D0000000-0000-4000-8000-000000000205', 2, 'Facade: Simplifying a Subsystem',         'Expose one clean entry point over a tangled subsystem.', 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('D0000000-0000-4000-8000-000000000315', 'D0000000-0000-4000-8000-000000000205', 3, 'Adapter & Facade Quiz',                   'Test your structural pattern knowledge.', 'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('D0000000-0000-4000-8000-000000000316', 'D0000000-0000-4000-8000-000000000206', 1, 'Decorator: Adding Behavior Dynamically',  'Layer responsibilities onto objects without subclass explosion.', 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('D0000000-0000-4000-8000-000000000317', 'D0000000-0000-4000-8000-000000000206', 2, 'Composite: Building Tree Structures',     'Model part-whole hierarchies where leaves and nodes share a type.', 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('D0000000-0000-4000-8000-000000000318', 'D0000000-0000-4000-8000-000000000206', 3, 'Decorator & Composite Quiz',              'Check your decorator and composite understanding.', 'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('D0000000-0000-4000-8000-000000000319', 'D0000000-0000-4000-8000-000000000207', 1, 'Observer: Publish-Subscribe',             'Notify dependents automatically when the subject changes.', 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('D0000000-0000-4000-8000-000000000320', 'D0000000-0000-4000-8000-000000000207', 2, 'Strategy: Swapping Algorithms',           'Encapsulate interchangeable algorithms behind a common interface.', 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('D0000000-0000-4000-8000-000000000321', 'D0000000-0000-4000-8000-000000000207', 3, 'Observer & Strategy Quiz',                'Verify your observer and strategy skills.', 'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('D0000000-0000-4000-8000-000000000322', 'D0000000-0000-4000-8000-000000000208', 1, 'Template Method: Reusing the Skeleton',   'Fix the algorithm structure and let subclasses fill in the steps.', 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('D0000000-0000-4000-8000-000000000323', 'D0000000-0000-4000-8000-000000000208', 2, 'State: Behavior That Changes',            'Let an object alter its behavior when its internal state changes.', 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('D0000000-0000-4000-8000-000000000324', 'D0000000-0000-4000-8000-000000000208', 3, 'Template Method & State Quiz',            'Check your template method and state knowledge.', 'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('D0000000-0000-4000-8000-000000000325', 'D0000000-0000-4000-8000-000000000209', 1, 'Capstone Project Setup & Design Review',  'Inspect the legacy codebase, spot the smells, and plan the refactor.', 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('D0000000-0000-4000-8000-000000000326', 'D0000000-0000-4000-8000-000000000210', 1, 'Applying Patterns to Refactor Legacy Code', 'Map each smell to a pattern and step through the refactor.', 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('D0000000-0000-4000-8000-000000000327', 'D0000000-0000-4000-8000-000000000210', 2, 'Testing Refactored Code',                 'Use characterization tests to prove the refactor preserved behavior.', 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('D0000000-0000-4000-8000-000000000328', 'D0000000-0000-4000-8000-000000000210', 3, 'Final Assessment',                        'Prove what you learned across the whole course.', 'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: D0000000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  'D0000000-0000-4000-8000-000000000401',
  'D0000000-0000-4000-8000-000000000301',
  1,
  'The SOLID Principles Overview',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The SOLID Principles Overview</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>The SOLID Principles Overview</h1>
  <p>The Gang of Four (GoF) patterns solve common design problems, but they work best when you already understand <strong>why</strong> a design is good. That foundation is <strong>SOLID</strong>, an acronym coined by Robert C. Martin for five object-oriented principles.</p>
  <table>
    <thead>
      <tr><th>Principle</th><th>Idea in one line</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">S</span>ingle Responsibility</td><td>A class has one reason to change.</td></tr>
      <tr><td><span class="ic">O</span>pen/Closed</td><td>Open for extension, closed for modification.</td></tr>
      <tr><td><span class="ic">L</span>iskov Substitution</td><td>Subtypes stay substitutable for their base types.</td></tr>
      <tr><td><span class="ic">I</span>nterface Segregation</td><td>Clients depend on small, focused interfaces.</td></tr>
      <tr><td><span class="ic">D</span>ependency Inversion</td><td>Depend on abstractions, not concretions.</td></tr>
    </tbody>
  </table>
  <h2>Why SOLID matters for patterns</h2>
  <p>Every GoF pattern is a <em>shape</em> that helps you respect one or more SOLID principles. For example, the Strategy pattern exists to keep a class <strong>open for extension</strong>; the Observer pattern exists to keep a subject <strong>decoupled from dependents</strong>. Learn SOLID first and the patterns stop feeling like a memorized list — they become natural consequences.</p>
  <h2>A first taste</h2>
  <p>Consider a class that both formats data and writes it to a database:</p>
  <pre class="code-block">class ReportService {
  formatReport(): string {
    return headers.join(' | ');
  }
  saveReport(): void {
    db.save(this.formatted);
  }
}</pre>
  <p>This class violates <strong>Single Responsibility</strong>: formatting and persistence are two reasons to change. Split them:</p>
  <pre class="code-block">class ReportFormatter {
  format(rows: Row[]): string { return rows.join(' | '); }
}

class ReportRepository {
  save(formatted: string): void { db.save(formatted); }
}</pre>
  <p>Now formatting can evolve independently of storage. That separation of concerns is the seed of many patterns you will meet in this course.</p>
  <div class="callout callout-info">
    <strong>Remember</strong>
    <p>SOLID is a lens, not a checklist. A codebase rarely satisfies every principle perfectly; instead you weigh the principles against real costs and choose the design that keeps change cheap.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Re-read this overview after finishing modules 2-4. Every pattern will suddenly make sense as a concrete application of a principle.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'D0000000-0000-4000-8000-000000000402',
  'D0000000-0000-4000-8000-000000000302',
  1,
  'Single Responsibility & Open/Closed',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Single Responsibility &amp; Open/Closed</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Single Responsibility &amp; Open/Closed</h1>
  <p>Two SOLID principles do the heaviest lifting in refactoring: the <strong>Single Responsibility Principle (SRP)</strong> and the <strong>Open/Closed Principle (OCP)</strong>. Master these two and most codebases start to self-organize.</p>
  <h2>Single Responsibility: one reason to change</h2>
  <p>SRP says a class should have exactly one job — more precisely, exactly <em>one reason for it to change</em>. A class that calculates taxes, formats invoices, and emails clients has three reasons to change, so every new requirement threatens all three areas at once.</p>
  <pre class="code-block">class InvoiceProcessor {
  computeTotal(): number { return this.base * this.taxRate; }
  render(): string { return '&lt;table&gt;' + this.total + '&lt;/table&gt;'; }
  sendEmail(): void { this.mailer.send(this.render(), this.customer); }
}</pre>
  <p>Refactored, each concern leaves its own module and each becomes independently testable:</p>
  <pre class="code-block">class TaxCalculator { compute(order: Order): number { ... } }
class InvoiceRenderer { render(total: number): string { ... } }
class InvoiceMailer { send(html: string, to: string): void { ... } }</pre>
  <h2>Open/Closed: extend without editing</h2>
  <p>OCP wants you to add new behavior by <em>adding new code</em>, not by editing existing, working code. The classic trick is to depend on an interface and let each new requirement arrive as a new implementation.</p>
  <pre class="code-block">interface ShippingCalculator {
  cost(weight: number): number;
}

class StandardShipping implements ShippingCalculator {
  cost(weight: number) { return 5 + weight * 2; }
}

class ExpressShipping implements ShippingCalculator {
  cost(weight: number) { return 20 + weight * 4; }
}

function totalWithShipping(order, calc: ShippingCalculator) {
  return order.subtotal + calc.cost(order.weight);
}</pre>
  <p>Add <span class="ic">OvernightShipping</span> tomorrow and <span class="ic">totalWithShipping</span> never changes. That is the OCP payoff.</p>
  <table>
    <thead>
      <tr><th>Principle</th><th>Question to ask</th><th>Refactor trigger</th></tr>
    </thead>
    <tbody>
      <tr><td>SRP</td><td>How many reasons for this class to change?</td><td>More than one threat to the same class</td></tr>
      <tr><td>OCP</td><td>Can new behavior arrive without edits?</td><td>Conditional branches on the same type</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Note</strong>
    <p>OCP is not about speculative abstraction. Add interfaces when real new variants arrive; guessing wrong on future needs creates waste.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Type-switching conditionals (`if type = A ... else if type = B`) are the loudest OCP alarm. Replacing them is often the door that opens toward Strategy or State patterns.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'D0000000-0000-4000-8000-000000000403',
  'D0000000-0000-4000-8000-000000000304',
  1,
  'Composition over Inheritance',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Composition over Inheritance</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Composition over Inheritance</h1>
  <p>Inheritance is the fastest way to share code, but it is also the clingiest: a subclass is permanently welded to its parent. Composition — holding other objects as <em>parts</em> — builds the same behavior while keeping every piece replaceable.</p>
  <h2>The trap of deep hierarchies</h2>
  <pre class="code-block">class Bird { fly() { ... } }

class Penguin extends Bird {
  fly() { throw new Error('Penguins cannot fly'); }   // smell!
}</pre>
  <p>Penguin is a bird but does not fly. Forcing inheritance to model "kind of" facts like this leads to awkward overrides — the <strong>fragile base class</strong> problem where a change anywhere up the tree ripples down.</p>
  <h2>Compose a behavior instead</h2>
  <p>Extract the volatile behavior into its own interface, then hand it to the object that uses it:</p>
  <pre class="code-block">interface FlyBehavior { fly(): string }

class FliesWithWings implements FlyBehavior { fly() { return 'Soaring'; } }
class CannotFly     implements FlyBehavior { fly() { return 'Waddling'; } }

class Bird {
  constructor(private flyer: FlyBehavior) {}
  performFly(): string { return this.flyer.fly(); }
}

const duck = new Bird(new FliesWithWings());
const penguin = new Bird(new CannotFly());</pre>
  <p>Now flight is a swappable <em>part</em> instead of a fixed family trait. This exact idea appears again as the <strong>Strategy pattern</strong> — thanks to composition, you already know the shape.</p>
  <table>
    <thead>
      <tr><th>Approach</th><th>Strength</th><th>Weakness</th></tr>
    </thead>
    <tbody>
      <tr><td>Inheritance</td><td>Trivial code reuse</td><td>Fragile base class, no runtime swap</td></tr>
      <tr><td>Composition</td><td>Replaceable parts, easier testing</td><td>More types to manage up front</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Memory aid</strong>
    <p>Ask: is it a strict <em>is-a</em> contract the parent guarantees? If a subclass must override or stub inherited behavior to make sense, composition is the better fit.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Favor composition by default and reach for inheritance only when the hierarchy is small, stable, and genuinely additive.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'D0000000-0000-4000-8000-000000000404',
  'D0000000-0000-4000-8000-000000000305',
  1,
  'Programming to Interfaces',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Programming to Interfaces</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Programming to Interfaces</h1>
  <p>The classic GoF advice is to program to an <em>interface</em>, not an <em>implementation</em>. When a client depends on an abstraction, the concrete object underneath can change — or be swapped entirely — without disturbing the caller.</p>
  <h2>Tight coupling hides change points</h2>
  <pre class="code-block">class OrderService {
  constructor(private stripe: StripeClient) {}

  charge(amount: number) {
    return this.stripe.pay(amount, this.stripe.token());
  }
}</pre>
  <p>This service is glued to <span class="ic">StripeClient</span>. Switching to PayPal rewrites the class and its tests.</p>
  <h2>Decouple through an interface</h2>
  <pre class="code-block">interface PaymentGateway {
  charge(amount: number): boolean;
  refund(transactionId: string): boolean;
}

class StripeGateway implements PaymentGateway {
  charge(amount: number) { return this.client.pay(amount, this.client.token()); }
  refund(id: string) { return this.client.refund(id); }
}

class PaypalGateway implements PaymentGateway {
  charge(amount: number) { ... }
  refund(id: string) { ... }
}

class OrderService {
  constructor(private gateway: PaymentGateway) {}
  charge(amount: number) { return this.gateway.charge(amount); }
}</pre>
  <p>Now <span class="ic">OrderService</span> is reusable with any gateway — and trivially testable with a fake when the real gateway is unavailable.</p>
  <h2>Dependency Inversion in action</h2>
  <p>This is Dependency Inversion: high-level policy (ordering) depends on the abstraction, and low-level detail (Stripe) depends on the <em>same</em> abstraction. Control of the concrete choice lives outside both.</p>
  <ul>
    <li>Clients depend on interfaces for their collaborators.</li>
    <li>Concrete implementations are wired in at the composition root.</li>
    <li>Tests inject fakes that implement the same interface.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Caution</strong>
    <p>Do not carpet-bomb the codebase with interfaces. Add an interface when you have (or genuinely expect) more than one implementation or you need a seam for tests.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'D0000000-0000-4000-8000-000000000405',
  'D0000000-0000-4000-8000-000000000307',
  1,
  'Factory Method & Simple Factory',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Factory Method &amp; Simple Factory</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Factory Method &amp; Simple Factory</h1>
  <p>The word <em>new</em> is a coupling agent: every <span class="ic">new SomeClass()</span> hard-codes which concrete class the caller gets. Factory patterns move that decision somewhere else so callers can stay generic.</p>
  <h2>Simple Factory</h2>
  <p>A simple factory is exactly what it sounds like: one function that returns the right object based on a parameter.</p>
  <pre class="code-block">interface Notification { send(): void }

class EmailNotification implements Notification { send() { ... } }
class SmsNotification   implements Notification { send() { ... } }

class NotificationFactory {
  static create(kind: string): Notification {
    switch (kind) {
      case 'email': return new EmailNotification();
      case 'sms':   return new SmsNotification();
      default:      throw new Error('Unknown kind: ' + kind);
    }
  }
}</pre>
  <h2>Factory Method</h2>
  <p>The GoF <strong>Factory Method</strong> pattern pushes the choice into a subclass: a base class defines <em>what</em> to build, and derived classes decide <em>which concrete</em> object gets built.</p>
  <pre class="code-block">abstract class Dialog {
  render(): void {
    const button = this.createButton();
    button.onClick(() =&gt; this.close());
    button.render();
  }
  // The factory method — subclasses decide the concrete button
  abstract createButton(): Button;
}

class WebDialog extends Dialog {
  createButton(): Button { return new HtmlButton(); }
}

class MobileDialog extends Dialog {
  createButton(): Button { return new TouchButton(); }
}</pre>
  <p>Both dialogs share the render choreography but produce platform-appropriate buttons. Extend the app to a console dialog and <span class="ic">Dialog</span> itself never changes — a direct OCP win.</p>
  <table>
    <thead>
      <tr><th>Variant</th><th>Who decides</th><th>When to use</th></tr>
    </thead>
    <tbody>
      <tr><td>Simple Factory</td><td>A standalone function</td><td>One place to keep creation logic</td></tr>
      <tr><td>Factory Method</td><td>Each subclass</td><td>Frameworks letting clients extend products</td></tr>
    </tbody>
  </table>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Factories shine when construction needs configuration, logging, or validation before the object is handed over. As soon as `new` appears in several places for the same type, centralize it.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'D0000000-0000-4000-8000-000000000406',
  'D0000000-0000-4000-8000-000000000308',
  1,
  'Abstract Factory & Builder',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Abstract Factory &amp; Builder</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Abstract Factory &amp; Builder</h1>
  <p>Two more creational patterns round out the family: <strong>Abstract Factory</strong> creates whole families of related objects, and <strong>Builder</strong> assembles one complex object in deliberate steps.</p>
  <h2>Abstract Factory: coherent families</h2>
  <p>When a UI must render with a consistent style — all light components or all dark components — an Abstract Factory guarantees every product it hands out belongs to the same family.</p>
  <pre class="code-block">interface UIFactory {
  createButton(): Button;
  createDialog(): Dialog;
}

class LightFactory implements UIFactory {
  createButton(): Button { return new LightButton(); }
  createDialog(): Dialog { return new LightDialog(); }
}

class DarkFactory implements UIFactory {
  createButton(): Button { return new DarkButton(); }
  createDialog(): Dialog { return new DarkDialog(); }
}

function buildApp(factory: UIFactory) {
  const btn = factory.createButton();   // always matches the dialog
  const dlg = factory.createDialog();
}</pre>
  <p>The client never mixes <span class="ic">DarkButton</span> with <span class="ic">LightDialog</span>, because a single factory produces a coherent set.</p>
  <h2>Builder: step-by-step construction</h2>
  <p>A Builder builds one complex object progressively, especially when it has many optional parts. Fluent setters keep the call readable:</p>
  <pre class="code-block">class Report {
  constructor(private title: string, private rows: string[],
              private footer?: string, private color?: string) {}
}

class ReportBuilder {
  private title = '';
  private rows: string[] = [];
  private footer?: string;
  private color?: string;

  withTitle(title: string)        { this.title = title; return this; }
  addRow(row: string)             { this.rows.push(row); return this; }
  withFooter(text: string)        { this.footer = text; return this; }
  withColor(color: string)        { this.color = color; return this; }

  build(): Report { return new Report(this.title, this.rows, this.footer, this.color); }
}

const report = new ReportBuilder()
  .withTitle('Q3 Sales')
  .addRow('North: 120k')
  .addRow('South: 90k')
  .withFooter('Generated nightly')
  .build();</pre>
  <h2>Choosing between them</h2>
  <table>
    <thead>
      <tr><th>Pattern</th><th>Problem it solves</th><th>Mental model</th></tr>
    </thead>
    <tbody>
      <tr><td>Abstract Factory</td><td>Families that must stay consistent</td><td>One vending machine per theme</td></tr>
      <tr><td>Builder</td><td>Complex objects with optional parts</td><td>A recipe executed step by step</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Distinction</strong>
    <p>Factory Method and Abstract Factory answer "which class?"; Builder answers "how is it assembled?". When you construct families, pick Abstract Factory; when assembly has many steps, pick Builder.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'D0000000-0000-4000-8000-000000000407',
  'D0000000-0000-4000-8000-000000000310',
  1,
  'Singleton Done Right',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Singleton Done Right</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Singleton Done Right</h1>
  <p>The <strong>Singleton</strong> pattern guarantees a class has exactly one instance and exposes a global access point to it — for example, a logger or a connection pool used across the whole app.</p>
  <h2>The classic shape</h2>
  <pre class="code-block">class Logger {
  private static instance: Logger;
  private constructor() {}          // block external instantiation

  static getInstance(): Logger {
    if (!Logger.instance) {
      Logger.instance = new Logger();
    }
    return Logger.instance;
  }

  info(message: string) { console.log('[INFO] ' + message); }
}

// Everywhere in the app the same object is returned
const log = Logger.getInstance();
log.info('Application started');</pre>
  <h2>Why Singletons get criticized</h2>
  <p>The global access point is the pattern's central risk: any code can grab the singleton, so dependencies become invisible, hidden in static calls. That makes tests awkward — you cannot simply hand an object a fresh logger.</p>
  <ul>
    <li><strong>Hidden dependencies</strong> — nothing in the signature shows Logger is needed.</li>
    <li><strong>Shared state</strong> — one instance means one mutable state across the whole process.</li>
    <li><strong>Testing friction</strong> — swapping the instance for a fake requires either reset methods or global mocking.</li>
  </ul>
  <h2>When it is still reasonable</h2>
  <p>A singleton is tolerable when it wraps something genuinely singular and nearly stateless — configuration, logging, a metrics registry. When state plus behavior grow, prefer <em>dependency injection</em>: create the object once at the composition root and pass it around explicitly.</p>
  <div class="callout callout-info">
    <strong>Rule of thumb</strong>
    <p>If you can inject the "single" instance as a constructor parameter instead of a static getInstance, prefer injection. You keep the one-instance policy without the global-state trap.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Teams often ban Singletons after a few painful NPEs in tests. Keep it minimal, keep it stateless, and document the global contract clearly.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'D0000000-0000-4000-8000-000000000408',
  'D0000000-0000-4000-8000-000000000311',
  1,
  'Prototype & Object Cloning',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Prototype &amp; Object Cloning</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Prototype &amp; Object Cloning</h1>
  <p>The <strong>Prototype</strong> pattern creates new objects by <em>cloning an existing instance</em> — the prototype — instead of reconstructing one from scratch. It shines when construction is costly or fully configuring a new object is tedious.</p>
  <h2>Cloning instead of rebuilding</h2>
  <pre class="code-block">class Enemy {
  constructor(
    public sprite: string,
    public health: number,
    public speed: number,
    public effects: string[] = []
  ) {}

  clone(): Enemy {
    // copy constructor-style cloning
    return new Enemy(this.sprite, this.health, this.speed, [...this.effects]);
  }
}

// Build one reference enemy with all the setup…
const bossTemplate = new Enemy('boss.png', 500, 3, ['fireAura', 'shield']);

// …then mint near-instant copies for each spawn point
const bossA = bossTemplate.clone();
const bossB = bossTemplate.clone();</pre>
  <p>The expensive setup ran once; every spawn is a cheap clone. New enemies in a game, default configurations, or document templates all fit this shape.</p>
  <h2>A shallow-clone trap</h2>
  <p>Notice the clone above copied <span class="ic">effects</span> with a new array — a <em>deep</em> copy of that reference field. A naive <span class="ic">this.effects</span> passthrough would share the array between clones, so mutating bossA would silently change bossB.</p>
  <table>
    <thead>
      <tr><th>Copy type</th><th>Copies</th><th>Risk</th></tr>
    </thead>
    <tbody>
      <tr><td>Shallow</td><td>The object's own fields only</td><td>Nested objects still shared</td></tr>
      <tr><td>Deep</td><td>Nested objects and collections too</td><td>More code, potential cycles</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Memory aid</strong>
    <p>Prototype answers "new objects that start already configured". If construction is trivial, plain constructors are simpler — do not clone for its own sake.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Pair Prototype with a registry: keep prototypes in a map keyed by name so clients clone named configs without touching classes.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'D0000000-0000-4000-8000-000000000409',
  'D0000000-0000-4000-8000-000000000313',
  1,
  'Adapter: Making Interfaces Fit',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Adapter: Making Interfaces Fit</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Adapter: Making Interfaces Fit</h1>
  <p>The <strong>Adapter</strong> pattern converts the interface of a class into another interface that clients expect. It is the universal "electric plug adapter": the legacy or third-party class stays untouched, and a thin translator sits in between.</p>
  <h2>The mismatch</h2>
  <p>Your code expects a <span class="ic">PaymentGateway</span>, but the legacy provider exposes a totally different API:</p>
  <pre class="code-block">interface PaymentGateway {
  pay(amount: number): boolean;
  refund(txnId: string): boolean;
}

// Legacy, unchangeable third-party class
class LegacyPayService {
  submitPayment(cents: number, reference: string): string { ... }
  reversePayment(legacyId: string): string { ... }
}</pre>
  <h2>The adapter bridges the gap</h2>
  <pre class="code-block">class LegacyPayAdapter implements PaymentGateway {
  constructor(private legacy: LegacyPayService) {}

  pay(amount: number): boolean {
    const cents = Math.round(amount * 100);
    const ref = 'TXN-' + Date.now();
    return this.legacy.submitPayment(cents, ref) !== null;
  }

  refund(txnId: string): boolean {
    return this.legacy.reversePayment(txnId) !== null;
  }
}

// Client code keeps using the interface it knows
const gateway: PaymentGateway = new LegacyPayAdapter(new LegacyPayService());
gateway.pay(49.99);</pre>
  <p>The rest of the application never learns LegacyPayService's quirks. Swapping to a modern provider later only means writing another adapter.</p>
  <h2>When to reach for Adapter</h2>
  <ul>
    <li>Integrating a legacy subsystem or third-party SDK you cannot edit.</li>
    <li>Standardizing many vendor APIs behind one internal interface.</li>
    <li>Bridging a JSON service to a domain model expected by the core.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Adapter vs. Facade</strong>
    <p>Adapter <em>changes</em> an interface to match what a client expects. Facade <em>simplifies</em> a complex subsystem behind one easy entry point. Different intent, same wrapping instinct.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Keep adapters embarrassingly thin: translate calls and types, but do not let business rules creep into the wrapper or it becomes a second system to maintain.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'D0000000-0000-4000-8000-000000000410',
  'D0000000-0000-4000-8000-000000000314',
  1,
  'Facade: Simplifying a Subsystem',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Facade: Simplifying a Subsystem</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Facade: Simplifying a Subsystem</h1>
  <p>A <strong>Facade</strong> wraps a complex subsystem — many classes, hidden ordering, error games — behind one clean, easy-to-call interface. Clients enjoy the view; chaos stays behind the curtain.</p>
  <h2>Life without a facade</h2>
  <p>Every client that books a trip must coordinate four services in exact order:</p>
  <pre class="code-block">// Repeated by every caller — fragile and verbose
const flight = new FlightService();
const hotel = new HotelService();
const car = new CarRentalService();
const bill = new BillingService();

const booking = flight.reserve(origin, dest, date);
hotel.lock(city, dates);
car.guard(city, dates);
bill.hold(booking.price);
if (userCancels) { flight.cancel(booking.id); hotel.unlock(...); car.unlock(...); }</pre>
  <h2>With a facade</h2>
  <pre class="code-block">class BookingFacade {
  constructor(private flight: FlightService, private hotel: HotelService,
              private car: CarRentalService, private bill: BillingService) {}

  bookTrip(plan: TripPlan): Confirmation {
    const flight = this.flight.reserve(plan.origin, plan.dest, plan.date);
    this.hotel.lock(plan.city, plan.dates);
    this.car.guard(plan.city, plan.dates);
    this.bill.hold(flight.price);
    return { id: flight.id, itinerary: plan };
  }

  cancelTrip(confirmation: Confirmation): void {
    this.flight.cancel(confirmation.id);
    this.hotel.unlock(confirmation.itinerary.city);
    this.car.unlock(confirmation.itinerary.city);
  }
}</pre>
  <p>Callers now express intent — <span class="ic">bookTrip</span>, <span class="ic">cancelTrip</span> — instead of orchestrating a dozen classes. The subsystem can also evolve internally without ripples.</p>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>A facade that only forwards one-line calls is decoration. It pays off when it encodes meaningful workflows: ordering, sequencing, rollback, and the error handling around several collaborators.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'D0000000-0000-4000-8000-000000000411',
  'D0000000-0000-4000-8000-000000000316',
  1,
  'Decorator: Adding Behavior Dynamically',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Decorator: Adding Behavior Dynamically</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Decorator: Adding Behavior Dynamically</h1>
  <p>The <strong>Decorator</strong> pattern attaches extra responsibilities to an object without changing its class. Instead of spawning a subclass for every combination — <span class="ic">BoldUnderlinedText</span>, <span class="ic">ItalicStrikethroughText</span> — you wrap objects in layers.</p>
  <h2>The exploding-subclass problem</h2>
  <p>Text formatting shows the pain. Three options × nesting means a combinatorial mess of classes:</p>
  <pre class="code-block">class Text { render(): string { return 'content'; } }
// Would need: Bold, Italic, Both, Underline, BoldUnderline… on and on</pre>
  <h2>One interface, wrapped layers</h2>
  <pre class="code-block">interface Text {
  render(): string;
}

class PlainText implements Text {
  constructor(private body: string) {}
  render(): string { return this.body; }
}

class BoldDecorator implements Text {
  constructor(private wrapped: Text) {}
  render(): string { return '&lt;b&gt;' + this.wrapped.render() + '&lt;/b&gt;'; }
}

class UpperDecorator implements Text {
  constructor(private wrapped: Text) {}
  render(): string { return this.wrapped.render().toUpperCase(); }
}

// Compose at runtime, any combination:
const t: Text = new BoldDecorator(new UpperDecorator(new PlainText('hello')));
t.render(); // &lt;b&gt;HELLO&lt;/b&gt;</pre>
  <p>Decorators share the component interface, so layers nest arbitrarily and the client never knows how many wrappers exist. Same trick powers buffered/compressed streams and middleware chains (Express, Redux).</p>
  <div class="callout callout-info">
    <strong>Note</strong>
    <p>The order of wrapping matters: <span class="ic">Bold(Upper(x))</span> differs from <span class="ic">Upper(Bold(x))</span>. Design the contract so the composition order is obvious to the caller.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Reach for Decorator when behavior additions are small, combinable, and orthogonal. If decorations touch many shared fields, a strategy or a config object is often simpler.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'D0000000-0000-4000-8000-000000000412',
  'D0000000-0000-4000-8000-000000000317',
  1,
  'Composite: Building Tree Structures',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Composite: Building Tree Structures</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Composite: Building Tree Structures</h1>
  <p>The <strong>Composite</strong> pattern composes objects into tree structures where leaves and nodes share a common type. Clients treat a single item and a whole subtree the same way — recursion does the rest.</p>
  <h2>The shape</h2>
  <p>A file system is the canonical model: <span class="ic">File</span> is a leaf, <span class="ic">Folder</span> is a composite that contains more files and folders.</p>
  <pre class="code-block">interface FileSystemItem {
  name(): string;
  size(): number;
}

class File implements FileSystemItem {
  constructor(private fileName: string, private bytes: number) {}
  name(): number -&gt; this.fileName { return this.fileName; }
  size(): number { return this.bytes; }
}

class Folder implements FileSystemItem {
  private children: FileSystemItem[] = [];

  constructor(private folderName: string) {}

  add(item: FileSystemItem): void { this.children.push(item); }

  name(): string { return this.folderName; }

  size(): number {
    return this.children.reduce((sum, child) =&gt; sum + child.size(), 0);
  }
}

const root = new Folder('docs');
root.add(new File('readme.md', 2048));
const images = new Folder('images');
images.add(new File('logo.png', 8192));
root.add(images);
root.size(); // 2048 + 8192 = 10240</pre>
  <h2>Why clients love it</h2>
  <ul>
    <li><strong>Uniform treatment</strong> — client code calls <span class="ic">size()</span> on a file or a folder; the branch inside is implicit.</li>
    <li><strong>Recursion is free</strong> — composites delegate to children, so depth is unbounded.</li>
    <li><strong>Open for extension</strong> — add a new item type and existing trees still work.</li>
  </ul>
  <table>
    <thead>
      <tr><th>Pattern</th><th>Structure</th><th>Shared type</th></tr>
    </thead>
    <tbody>
      <tr><td>Composite</td><td>Tree of leaves + nodes</td><td>Yes — leaves and nodes both</td></tr>
      <tr><td>Decorator</td><td>Chain of wrappers</td><td>Yes — each wrapper is the component</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Gotcha</strong>
    <p>Operations that only make sense on nodes — like <span class="ic">add()</span> — can leak into the shared interface. Keep the base interface safe for both leaves and nodes, or use safe casts with clear contracts.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Menus, org charts, directory trees, and ASTs are all composite-shaped. When you see "item vs. group of items", think Composite.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'D0000000-0000-4000-8000-000000000413',
  'D0000000-0000-4000-8000-000000000319',
  1,
  'Observer: Publish-Subscribe',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Observer: Publish-Subscribe</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Observer: Publish-Subscribe</h1>
  <p>The <strong>Observer</strong> pattern defines a one-to-many dependency: when the <em>subject</em> changes state, every registered <em>observer</em> is notified automatically. No observer needs to poll, and the subject never needs to know observers concretely.</p>
  <h2>The core trio</h2>
  <pre class="code-block">interface Observer {
  update(event: string, data: unknown): void;
}

class NewsAgency {                      // the subject
  private observers: Observer[] = [];

  subscribe(o: Observer): void { this.observers.push(o); }
  unsubscribe(o: Observer): void {
    this.observers = this.observers.filter(x =&gt; x !== o);
  }

  publish(headline: string): void {
    for (const observer of this.observers) {
      observer.update('headline', headline);
    }
  }
}

class EmailReporter implements Observer {
  update(event: string, data: unknown): void {
    if (event === 'headline') console.log('Emailing: ' + data);
  }
}

class DashboardFeed implements Observer {
  update(event: string, data: unknown): void {
    if (event === 'headline') this.render(data);
  }
}

const agency = new NewsAgency();
agency.subscribe(new EmailReporter());
agency.subscribe(new DashboardFeed());
agency.publish('Market swings to 4200');</pre>
  <h2>Why decoupling is the prize</h2>
  <ul>
    <li><strong>Loose coupling</strong> — the subject knows only the <span class="ic">Observer</span> abstraction.</li>
    <li><strong>Dynamic subscriptions</strong> — observers join and leave at runtime.</li>
    <li><strong>Broadcast semantics</strong> — one event fan out to many handlers (event buses, DOM, Redux).</li>
  </ul>
  <div class="callout callout-info">
    <strong>Watch the trade-off</strong>
    <p>Observers fire in registration order and synchronously by default. Notification storms, ordering surprises, and orphaned subscriptions (memory leaks) are the classic costs — always expose <span class="ic">unsubscribe</span>.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Pair Observer with Strategy: the observer pattern decides <em>when</em> listeners act, while the strategy pattern decides <em>how</em>. Frameworks and apps use the two together constantly.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'D0000000-0000-4000-8000-000000000414',
  'D0000000-0000-4000-8000-000000000320',
  1,
  'Strategy: Swapping Algorithms',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Strategy: Swapping Algorithms</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Strategy: Swapping Algorithms</h1>
  <p>The <strong>Strategy</strong> pattern defines a family of interchangeable algorithms, each behind a common interface, and lets the client choose which one runs — usually by injecting it. It is composition over inheritance applied to behavior.</p>
  <h2>The pattern in three pieces</h2>
  <pre class="code-block">interface PricingStrategy {
  compute(base: number): number;
}

class RegularPricing implements PricingStrategy {
  compute(base: number) { return base; }
}

class TenPercentOff implements PricingStrategy {
  compute(base: number) { return base * 0.9; }
}

class MemberPricing implements PricingStrategy {
  compute(base: number) { return base * 0.8; }
}

class Checkout {
  constructor(private pricing: PricingStrategy) {}

  setPricing(strategy: PricingStrategy): void { this.pricing = strategy; }

  total(base: number): number { return this.pricing.compute(base); }
}

const checkout = new Checkout(new MemberPricing());
checkout.total(100);            // 80
checkout.setPricing(new TenPercentOff());
checkout.total(100);            // 90  — swapped at runtime</pre>
  <h2>Strategy versus if-else chains</h2>
  <p>The naive alternative is a growing if-else that selects the algorithm by a type string:</p>
  <pre class="code-block">// Fragile: adding one pricing tier edits this switch again
function price(type: string, base: number): number {
  if (type === 'regular') return base;
  if (type === '10off')   return base * 0.9;
  if (type === 'member')  return base * 0.8;
  throw new Error('Unknown type');
}</pre>
  <p>Strategies replace the chain with a one-line injection, and each algorithm owns one class that is easy to test in isolation.</p>
  <table>
    <thead>
      <tr><th>Pattern</th><th>Swappable</th><th>Who chooses</th></tr>
    </thead>
    <tbody>
      <tr><td>Strategy</td><td>Algorithms</td><td>The client (injection)</td></tr>
      <tr><td>State (later)</td><td>Behaviors</td><td>Internal state transitions</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Note</strong>
    <p>Strategy aligns with Open/Closed: adding a discount no longer edits <span class="ic">Checkout</span>. It only requires a new strategy class.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Combine Strategy with Factory: a factory picks the right strategy from configuration, and the strategy pattern decides how it behaves.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'D0000000-0000-4000-8000-000000000415',
  'D0000000-0000-4000-8000-000000000322',
  1,
  'Template Method: Reusing the Skeleton',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Template Method: Reusing the Skeleton</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Template Method: Reusing the Skeleton</h1>
  <p>The <strong>Template Method</strong> pattern defines the skeleton of an algorithm in a method (the template) and defers some steps to subclasses. The sequence is fixed; the variable steps are customized.</p>
  <h2>The skeleton in code</h2>
  <pre class="code-block">abstract class ReportBuilder {
  // The template — the sequence never changes
  build(): string {
    const header = this.createHeader();
    const body = this.createBody();
    const footer = this.createFooter();
    return header + body + footer;
  }

  protected abstract createHeader(): string;
  protected abstract createBody(): string;
  protected createFooter(): string { return '-- end --'; }   // hook
}

class HtmlReport extends ReportBuilder {
  protected createHeader(): string { return '&lt;h1&gt;Report&lt;/h1&gt;'; }
  protected createBody(): string { return '&lt;p&gt;data&lt;/p&gt;'; }
}

class JsonReport extends ReportBuilder {
  protected createHeader(): string { return '{'; }
  protected createBody(): string { return '"data": [1,2,3]'; }
  protected createFooter(): string { return '}'; }
}</pre>
  <ul>
    <li><strong>Abstract steps</strong> — subclasses must supply them.</li>
    <li><strong>Hooks</strong> — optional steps with a default (here <span class="ic">createFooter</span>), overridable when needed.</li>
    <li><strong>Fixed choreography</strong> — build order is constant across all variants.</li>
  </ul>
  <h2>Hooks vs. abstract methods in one table</h2>
  <table>
    <thead>
      <tr><th>Kind</th><th>Required?</th><th>Use for</th></tr>
    </thead>
    <tbody>
      <tr><td>Abstract step</td><td>Yes</td><td>Steps that define the variant itself</td></tr>
      <tr><td>Hook</td><td>No</td><td>Optional tweaks with sensible defaults</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Danger zone</strong>
    <p>Cause the base class to call too many hooks in the wrong order and subclasses become hard to reason about. Keep the template short and the steps meaningfully independent.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>When variants differ in a <em>sequence</em>, Template Method fits. When they differ in a single swappable algorithm, Strategy usually fits better.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'D0000000-0000-4000-8000-000000000416',
  'D0000000-0000-4000-8000-000000000323',
  1,
  'State: Behavior That Changes',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>State: Behavior That Changes</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>State: Behavior That Changes</h1>
  <p>The <strong>State</strong> pattern lets an object change its behavior when its internal state changes — as if the object swapped classes. Each state is its own object, and the context simply delegates.</p>
  <h2>An order with a lifecycle</h2>
  <p>A package can be <span class="ic">New</span>, <span class="ic">Paid</span>, <span class="ic">Shipped</span>, or <span class="ic">Delivered</span>. Each transition must respect rules — you cannot ship an unpaid order.</p>
  <pre class="code-block">interface OrderState {
  pay(context: Order): void;
  ship(context: Order): void;
}

class NewOrder implements OrderState {
  pay(context: Order): void { context.changeState(new PaidOrder()); }
  ship(context: Order): void { throw new Error('Cannot ship unpaid'); }
}

class PaidOrder implements OrderState {
  pay(context: Order): void { throw new Error('Already paid'); }
  ship(context: Order): void { context.changeState(new ShippedOrder()); }
}

class ShippedOrder implements OrderState {
  pay(context: Order): void { throw new Error('Already paid'); }
  ship(context: Order): void { throw new Error('Already shipped'); }
}

class Order {
  private state: OrderState = new NewOrder();

  changeState(state: OrderState): void { this.state = state; }
  pay(): void { this.state.pay(this); }
  ship(): void { this.state.ship(this); }
}

const order = new Order();
order.pay();      // ok -> Paid
order.ship();     // ok -> Shipped
order.ship();     // throws 'Already shipped'</pre>
  <h2>State vs. if-else flags</h2>
  <p>The flag version collects booleans like <span class="ic">isPaid</span>, <span class="ic">isShipped</span>, and a tower of conditionals. The State pattern relocates those rules into dedicated classes where each transition is explicit and locally verifiable.</p>
  <table>
    <thead>
      <tr><th>Pattern</th><th>Driven by</th><th>Classic use</th></tr>
    </thead>
    <tbody>
      <tr><td>State</td><td>Internal transitions</td><td>Order lifecycles, media players</td></tr>
      <tr><td>Strategy</td><td>Client injection</td><td>Swap pricing, sorting, algorithms</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Cost</strong>
    <p>State multiplies classes — one per state — so do not apply it to two-state flags. The pattern pays off for 3+ states with distinct behavior and rule-heavy transitions.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Draw the transition table first: rows = states, columns = events. If the grid is sparse with guard rules, State is almost certainly your pattern.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'D0000000-0000-4000-8000-000000000417',
  'D0000000-0000-4000-8000-000000000325',
  1,
  'Capstone Project Setup & Design Review',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone Project Setup &amp; Design Review</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Capstone Project Setup &amp; Design Review</h1>
  <p>The course project is a legacy <span class="ic">BillingService</span> — a working but painfully rigid checkout module. Your goal across the next two lessons is to refactor it with the patterns you learned and prove behavior is preserved.</p>
  <h2>Setup</h2>
  <pre class="code-block">project/billing/
  src/billing/
    BillingService.js     # the legacy monster
    payment/
    notifications/
  test/billing.test.js
  package.json</pre>
  <p>Open the repository, install dependencies, and run the existing tests so you have a green baseline before touching anything.</p>
  <h2>The design review checklist</h2>
  <p>Before writing code, walk the codebase and rate each smell:</p>
  <table>
    <thead>
      <tr><th>Smell</th><th>What it looks like</th><th>Pattern to use</th></tr>
    </thead>
    <tbody>
      <tr><td>God class</td><td>One service does billing, mail, discounts</td><td>Split + Facade</td></tr>
      <tr><td>if-else pricing</td><td>Switch on plan type</td><td>Strategy</td></tr>
      <tr><td>Spaghetti states</td><td>Booleans + guards control flow</td><td>State</td></tr>
      <tr><td>Vendor locks</td><td>Direct imports of a gateway SDK</td><td>Adapter / Interface</td></tr>
      <tr><td>Copy-paste config</td><td>Similar object setups repeated</td><td>Factory / Builder</td></tr>
    </tbody>
  </table>
  <h2>How to review safely</h2>
  <ul>
    <li>Read the tests first — they capture intended behavior.</li>
    <li>Trace one full checkout end to end.</li>
    <li>List every responsibility you find in the monster class.</li>
    <li>Map each responsibility to the checklist above; do not refactor blind.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Rule of the capstone</strong>
    <p>Make the smallest change that improves the design, then run the tests. Small green steps beat heroic rewrites every time.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Commit the review notes as a design doc before you write any refactor. Future-you (and reviewers) will thank you.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'D0000000-0000-4000-8000-000000000418',
  'D0000000-0000-4000-8000-000000000326',
  1,
  'Applying Patterns to Refactor Legacy Code',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Applying Patterns to Refactor Legacy Code</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Applying Patterns to Refactor Legacy Code</h1>
  <p>Your review maps smells to patterns. Now implement each refactor in tiny, tested steps, from the inside out.</p>
  <h2>Step 1 — Strategy replaces the pricing switch</h2>
  <pre class="code-block">// Before
function priceFor(type, base) {
  if (type === 'regular') return base;
  if (type === 'member')  return base * 0.8;
  if (type === 'sale')    return base * 0.7;
  throw new Error('Bad type');
}

// After
class Checkout {
  constructor(private pricing: PricingStrategy) {}
  total(base: number): number { return this.pricing.compute(base); }
}
// regular, member, sale each become a small strategy class</pre>
  <h2>Step 2 — State governs order transitions</h2>
  <pre class="code-block">// Replace isPaid + isShipped booleans with a state object
class Order {
  private state: OrderState = new NewOrder();
  pay(): void { this.state.pay(this); }
  ship(): void { this.state.ship(this); }
}</pre>
  <h2>Step 3 — Adapter isolates the vendor SDK</h2>
  <pre class="code-block">// Before: BillingService calls stripe SDK all over
// After: one interface + adapter
interface PaymentGateway {
  pay(amount: number): boolean;
  refund(txnId: string): boolean;
}
class StripeAdapter implements PaymentGateway { ... }
class Checkout {
  constructor(private gateway: PaymentGateway) {}
}</pre>
  <h2>Step 4 — Facade hides the wiring</h2>
  <p>Once pricing, state, gateway, and mailer exist as clean parts, a <span class="ic">BillingFacade</span> exposes <span class="ic">charge(cart, plan)</span> while the subsystem keeps its internals tidy.</p>
  <table>
    <thead>
      <tr><th>Refactor step</th><th>Pattern</th><th>Test after?</th></tr>
    </thead>
    <tbody>
      <tr><td>Pricing logic extraction</td><td>Strategy</td><td>Yes</td></tr>
      <tr><td>Order lifecycle</td><td>State</td><td>Yes</td></tr>
      <tr><td>Vendor integration</td><td>Adapter</td><td>Yes</td></tr>
      <tr><td>Public surface</td><td>Facade</td><td>Yes</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Sequence it</strong>
    <p>Never apply all patterns in one commit. Extract one responsibility, confirm the suite, then move to the next. The tests are your referee.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Write the missing characterization tests (next lesson) before you change the code inside each area you plan to refactor.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'D0000000-0000-4000-8000-000000000419',
  'D0000000-0000-4000-8000-000000000327',
  1,
  'Testing Refactored Code',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Testing Refactored Code</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Testing Refactored Code</h1>
  <p>A refactor without tests is a rewrite in disguise. <strong>Characterization tests</strong> pin down the legacy behavior first, so the refactor can be proven behavior-preserving by a suite that stays green.</p>
  <h2>Characterization tests pin behavior</h2>
  <pre class="code-block">// Record current behavior BEFORE refactoring
test('legacy priceFor member plan', () =&gt; {
  expect(priceFor('member', 100)).toBe(80);
});

test('legacy priceFor sale plan', () =&gt; {
  expect(priceFor('sale', 100)).toBe(70);
});</pre>
  <p>These tests may look naive — they do. They document what the system <em>actually</em> does today, quirks and all, before you change anything.</p>
  <h2>Test the seams the patterns give you</h2>
  <ul>
    <li><strong>Strategy</strong> — assert each strategy's output directly.</li>
    <li><strong>State</strong> — assert each transition matrix: pay, ship, and illegal moves.</li>
    <li><strong>Adapter</strong> — test the adapter against a fake vendor.</li>
    <li><strong>Facade</strong> — fake every collaborator and assert the orchestration order.</li>
  </ul>
  <pre class="code-block">class FakeGateway implements PaymentGateway {
  paid: number[] = [];
  pay(amount: number): boolean { this.paid.push(amount); return true; }
  refund(id: string): boolean { return true; }
}

test('checkout charges through the gateway', () =&gt; {
  const fake = new FakeGateway();
  const checkout = new Checkout(new MemberPricing(), fake);
  checkout.charge(100);
  expect(fake.paid).toEqual([80]);
});</pre>
  <table>
    <thead>
      <tr><th>Pattern added</th><th>Seam to test</th><th>Test focus</th></tr>
    </thead>
    <tbody>
      <tr><td>Strategy</td><td>Strategy classes</td><td>Pure algorithm output</td></tr>
      <tr><td>State</td><td>State matrix</td><td>Allowed + forbidden transitions</td></tr>
      <tr><td>Adapter</td><td>Fake vendor</td><td>Translation fidelity</td></tr>
      <tr><td>Facade</td><td>Collaborator fakes</td><td>Orchestration and order</td></tr>
    </tbody>
  </table>
  <div class="callout callout-tip">
    <strong>Finish the capstone</strong>
    <p>When the suite stays green across every small step, the refactor is proved: same behavior, better design. Commit, celebrate — and run the final assessment.</p>
  </div>
</div>
</body>
</html>
$html$
)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 6. QUIZZES (9 quiz lessons, 29 questions)
--    Q1 → L3 (501) · Q2 → L6 (504) · Q3 → L9 (507) · Q4 → L12 (510)
--    Q5 → L15 (513) · Q6 → L18 (516) · Q7 → L21 (519) · Q8 → L24 (522)
--    Q9 → L28 (525)
-- ----------------------------------------------------------------------------

INSERT INTO quizzes (id, lesson_id, question, explanation, position) VALUES
  ('D0000000-0000-4000-8000-000000000501', 'D0000000-0000-4000-8000-000000000303',
   'Which principle states that a class should have only one reason to change?',
   'The Single Responsibility Principle says each class owns one responsibility.', 1),
  ('D0000000-0000-4000-8000-000000000502', 'D0000000-0000-4000-8000-000000000303',
   'Which principle suggests software should be open for extension but closed for modification?',
   'The Open/Closed Principle targets extension without changing existing code.', 2),
  ('D0000000-0000-4000-8000-000000000503', 'D0000000-0000-4000-8000-000000000303',
   'Which principle implies that a subclass should be substitutable for its base class?',
   'The Liskov Substitution Principle keeps derived types safe to swap in.', 3),
  ('D0000000-0000-4000-8000-000000000504', 'D0000000-0000-4000-8000-000000000306',
   'What does it mean to program to an interface rather than an implementation?',
   'Coding to interfaces decouples callers from concrete types.', 1),
  ('D0000000-0000-4000-8000-000000000505', 'D0000000-0000-4000-8000-000000000306',
   'Which approach generally produces more flexible and testable designs?',
   'Composition assembles behaviors from small parts instead of deep class trees.', 2),
  ('D0000000-0000-4000-8000-000000000506', 'D0000000-0000-4000-8000-000000000306',
   'What is the main risk of deep inheritance hierarchies?',
   'The fragile base class problem — a change in a deep base class can break many subclasses.', 3),
  ('D0000000-0000-4000-8000-000000000507', 'D0000000-0000-4000-8000-000000000309',
   'Which pattern defines an interface for creating an object but lets subclasses decide which class to instantiate?',
   'Factory Method defers instantiation to subclasses.', 1),
  ('D0000000-0000-4000-8000-000000000508', 'D0000000-0000-4000-8000-000000000309',
   'Which pattern builds a complex object step by step?',
   'Builder separates construction from representation.', 2),
  ('D0000000-0000-4000-8000-000000000509', 'D0000000-0000-4000-8000-000000000309',
   'Which pattern provides an interface for creating families of related objects?',
   'Abstract Factory creates families of related products.', 3),
  ('D0000000-0000-4000-8000-000000000510', 'D0000000-0000-4000-8000-000000000312',
   'Which pattern guarantees a class has exactly one instance with a global access point?',
   'Singleton restricts instantiation to a single object.', 1),
  ('D0000000-0000-4000-8000-000000000511', 'D0000000-0000-4000-8000-000000000312',
   'What is a common criticism of the Singleton pattern?',
   'Global state makes programs harder to reason about and test.', 2),
  ('D0000000-0000-4000-8000-000000000512', 'D0000000-0000-4000-8000-000000000312',
   'Which pattern creates new objects by cloning a prototype instance?',
   'Prototype clones existing instances instead of calling constructors.', 3),
  ('D0000000-0000-4000-8000-000000000513', 'D0000000-0000-4000-8000-000000000315',
   'Which pattern converts the interface of a class into one clients expect?',
   'Adapter lets otherwise incompatible classes collaborate.', 1),
  ('D0000000-0000-4000-8000-000000000514', 'D0000000-0000-4000-8000-000000000315',
   'Which pattern offers a simplified unified interface to a complex subsystem?',
   'Facade hides subsystem complexity behind one entry point.', 2),
  ('D0000000-0000-4000-8000-000000000515', 'D0000000-0000-4000-8000-000000000315',
   'In which situation is a Facade preferable to exposing the whole subsystem directly?',
   'A Facade surfaces common operations and hides the rest.', 3),
  ('D0000000-0000-4000-8000-000000000516', 'D0000000-0000-4000-8000-000000000318',
   'Which pattern attaches additional responsibilities to an object dynamically?',
   'Decorator wraps objects to add behavior at runtime.', 1),
  ('D0000000-0000-4000-8000-000000000517', 'D0000000-0000-4000-8000-000000000318',
   'Which pattern lets clients treat individual objects and compositions uniformly?',
   'Composite builds tree structures with a common component type.', 2),
  ('D0000000-0000-4000-8000-000000000518', 'D0000000-0000-4000-8000-000000000318',
   'What is the key structural difference between Decorator and Adapter?',
   'Decorator preserves the wrapped interface while Adapter changes it.', 3),
  ('D0000000-0000-4000-8000-000000000519', 'D0000000-0000-4000-8000-000000000321',
   'Which pattern defines a one-to-many dependency and notifies dependents automatically?',
   'Observer broadcasts state changes to subscribed observers.', 1),
  ('D0000000-0000-4000-8000-000000000520', 'D0000000-0000-4000-8000-000000000321',
   'Which pattern encapsulates interchangeable algorithms behind a common interface?',
   'Strategy lets callers swap algorithms at runtime.', 2),
  ('D0000000-0000-4000-8000-000000000521', 'D0000000-0000-4000-8000-000000000321',
   'In the Observer pattern, what is the subject?',
   'The subject owns the state and manages notifications.', 3),
  ('D0000000-0000-4000-8000-000000000522', 'D0000000-0000-4000-8000-000000000324',
   'Which pattern defines the skeleton of an algorithm and lets subclasses fill in the steps?',
   'Template Method fixes the sequence but defers steps to subclasses.', 1),
  ('D0000000-0000-4000-8000-000000000523', 'D0000000-0000-4000-8000-000000000324',
   'Which pattern lets an object change behavior when its internal state changes?',
   'State converts conditional logic into state objects.', 2),
  ('D0000000-0000-4000-8000-000000000524', 'D0000000-0000-4000-8000-000000000324',
   'How does Strategy differ from State?',
   'Strategy is a client choice while State transitions are internal.', 3),
  ('D0000000-0000-4000-8000-000000000525', 'D0000000-0000-4000-8000-000000000328',
   'Which SOLID principle is violated when a class renders itself and also persists itself?',
   'Two responsibilities in one class violate Single Responsibility.', 1),
  ('D0000000-0000-4000-8000-000000000526', 'D0000000-0000-4000-8000-000000000328',
   'Which approach layers logging, compression, and encryption without subclass explosion?',
   'Decorator chains wrap objects with reusable behaviors.', 2),
  ('D0000000-0000-4000-8000-000000000527', 'D0000000-0000-4000-8000-000000000328',
   'A checkout must support credit card, PayPal, and crypto through one code path. Which pattern fits best?',
   'Strategy encapsulates each payment algorithm.', 3),
  ('D0000000-0000-4000-8000-000000000528', 'D0000000-0000-4000-8000-000000000328',
   'A huge if-else chain selects behavior by type. Which change removes it most naturally?',
   'Replace the conditional chain with injected Strategy objects.', 4),
  ('D0000000-0000-4000-8000-000000000529', 'D0000000-0000-4000-8000-000000000328',
   'What should you do before refactoring legacy code?',
   'Lock down current behavior with characterization tests.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the first listed (position of the correct
--    answer) varies. Correct answers are flagged with is_correct = TRUE.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096
--    Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): SRP
  ('D0000000-0000-4000-8000-000000001001', 'D0000000-0000-4000-8000-000000000501', 'Single Responsibility', TRUE,  1),
  ('D0000000-0000-4000-8000-000000001002', 'D0000000-0000-4000-8000-000000000501', 'Open/Closed', FALSE, 2),
  ('D0000000-0000-4000-8000-000000001003', 'D0000000-0000-4000-8000-000000000501', 'Liskov Substitution', FALSE, 3),
  ('D0000000-0000-4000-8000-000000001004', 'D0000000-0000-4000-8000-000000000501', 'Dependency Inversion', FALSE, 4),
  -- Q1 (502): OCP
  ('D0000000-0000-4000-8000-000000001005', 'D0000000-0000-4000-8000-000000000502', 'Open/Closed', TRUE,  1),
  ('D0000000-0000-4000-8000-000000001006', 'D0000000-0000-4000-8000-000000000502', 'Single Responsibility', FALSE, 2),
  ('D0000000-0000-4000-8000-000000001007', 'D0000000-0000-4000-8000-000000000502', 'Interface Segregation', FALSE, 3),
  ('D0000000-0000-4000-8000-000000001008', 'D0000000-0000-4000-8000-000000000502', 'Composition over Inheritance', FALSE, 4),
  -- Q1 (503): LSP
  ('D0000000-0000-4000-8000-000000001009', 'D0000000-0000-4000-8000-000000000503', 'Liskov Substitution', TRUE,  1),
  ('D0000000-0000-4000-8000-000000001010', 'D0000000-0000-4000-8000-000000000503', 'Dependency Inversion', FALSE, 2),
  ('D0000000-0000-4000-8000-000000001011', 'D0000000-0000-4000-8000-000000000503', 'Interface Segregation', FALSE, 3),
  ('D0000000-0000-4000-8000-000000001012', 'D0000000-0000-4000-8000-000000000503', 'Single Responsibility', FALSE, 4),
  -- Q2 (504): program to interface
  ('D0000000-0000-4000-8000-000000001013', 'D0000000-0000-4000-8000-000000000504', 'Depend on abstractions, not concrete classes', TRUE,  1),
  ('D0000000-0000-4000-8000-000000001014', 'D0000000-0000-4000-8000-000000000504', 'Always call the concrete class directly', FALSE, 2),
  ('D0000000-0000-4000-8000-000000001015', 'D0000000-0000-4000-8000-000000000504', 'Use global state for every dependency', FALSE, 3),
  ('D0000000-0000-4000-8000-000000001016', 'D0000000-0000-4000-8000-000000000504', 'Copy code between modules', FALSE, 4),
  -- Q2 (505): composition over inheritance
  ('D0000000-0000-4000-8000-000000001017', 'D0000000-0000-4000-8000-000000000505', 'Composition over inheritance', TRUE,  1),
  ('D0000000-0000-4000-8000-000000001018', 'D0000000-0000-4000-8000-000000000505', 'Deep inheritance hierarchies', FALSE, 2),
  ('D0000000-0000-4000-8000-000000001019', 'D0000000-0000-4000-8000-000000000505', 'Duplicating behavior in each class', FALSE, 3),
  ('D0000000-0000-4000-8000-000000001020', 'D0000000-0000-4000-8000-000000000505', 'Global mutable singletons', FALSE, 4),
  -- Q2 (506): fragile base class
  ('D0000000-0000-4000-8000-000000001021', 'D0000000-0000-4000-8000-000000000506', 'The fragile base class problem', TRUE,  1),
  ('D0000000-0000-4000-8000-000000001022', 'D0000000-0000-4000-8000-000000000506', 'The duck typing problem', FALSE, 2),
  ('D0000000-0000-4000-8000-000000001023', 'D0000000-0000-4000-8000-000000000506', 'The singleton bottleneck', FALSE, 3),
  ('D0000000-0000-4000-8000-000000001024', 'D0000000-0000-4000-8000-000000000506', 'The event loop problem', FALSE, 4),
  -- Q3 (507): factory method
  ('D0000000-0000-4000-8000-000000001025', 'D0000000-0000-4000-8000-000000000507', 'Factory Method', TRUE,  1),
  ('D0000000-0000-4000-8000-000000001026', 'D0000000-0000-4000-8000-000000000507', 'Builder', FALSE, 2),
  ('D0000000-0000-4000-8000-000000001027', 'D0000000-0000-4000-8000-000000000507', 'Singleton', FALSE, 3),
  ('D0000000-0000-4000-8000-000000001028', 'D0000000-0000-4000-8000-000000000507', 'Observer', FALSE, 4),
  -- Q3 (508): builder
  ('D0000000-0000-4000-8000-000000001029', 'D0000000-0000-4000-8000-000000000508', 'Builder', TRUE,  1),
  ('D0000000-0000-4000-8000-000000001030', 'D0000000-0000-4000-8000-000000000508', 'Proxy', FALSE, 2),
  ('D0000000-0000-4000-8000-000000001031', 'D0000000-0000-4000-8000-000000000508', 'Decorator', FALSE, 3),
  ('D0000000-0000-4000-8000-000000001032', 'D0000000-0000-4000-8000-000000000508', 'Facade', FALSE, 4),
  -- Q3 (509): abstract factory
  ('D0000000-0000-4000-8000-000000001033', 'D0000000-0000-4000-8000-000000000509', 'Abstract Factory', TRUE,  1),
  ('D0000000-0000-4000-8000-000000001034', 'D0000000-0000-4000-8000-000000000509', 'Factory Method', FALSE, 2),
  ('D0000000-0000-4000-8000-000000001035', 'D0000000-0000-4000-8000-000000000509', 'Prototype', FALSE, 3),
  ('D0000000-0000-4000-8000-000000001036', 'D0000000-0000-4000-8000-000000000509', 'Adapter', FALSE, 4),
  -- Q4 (510): singleton
  ('D0000000-0000-4000-8000-000000001037', 'D0000000-0000-4000-8000-000000000510', 'Singleton', TRUE,  1),
  ('D0000000-0000-4000-8000-000000001038', 'D0000000-0000-4000-8000-000000000510', 'Prototype', FALSE, 2),
  ('D0000000-0000-4000-8000-000000001039', 'D0000000-0000-4000-8000-000000000510', 'Composite', FALSE, 3),
  ('D0000000-0000-4000-8000-000000001040', 'D0000000-0000-4000-8000-000000000510', 'Facade', FALSE, 4),
  -- Q4 (511): singleton criticism
  ('D0000000-0000-4000-8000-000000001041', 'D0000000-0000-4000-8000-000000000511', 'It introduces hidden global state', TRUE,  1),
  ('D0000000-0000-4000-8000-000000001042', 'D0000000-0000-4000-8000-000000000511', 'It is always slower at runtime', FALSE, 2),
  ('D0000000-0000-4000-8000-000000001043', 'D0000000-0000-4000-8000-000000000511', 'It forbids inheritance entirely', FALSE, 3),
  ('D0000000-0000-4000-8000-000000001044', 'D0000000-0000-4000-8000-000000000511', 'It requires a database', FALSE, 4),
  -- Q4 (512): prototype
  ('D0000000-0000-4000-8000-000000001045', 'D0000000-0000-4000-8000-000000000512', 'Prototype', TRUE,  1),
  ('D0000000-0000-4000-8000-000000001046', 'D0000000-0000-4000-8000-000000000512', 'Builder', FALSE, 2),
  ('D0000000-0000-4000-8000-000000001047', 'D0000000-0000-4000-8000-000000000512', 'Adapter', FALSE, 3),
  ('D0000000-0000-4000-8000-000000001048', 'D0000000-0000-4000-8000-000000000512', 'Strategy', FALSE, 4),
  -- Q5 (513): adapter
  ('D0000000-0000-4000-8000-000000001049', 'D0000000-0000-4000-8000-000000000513', 'Adapter', TRUE,  1),
  ('D0000000-0000-4000-8000-000000001050', 'D0000000-0000-4000-8000-000000000513', 'Facade', FALSE, 2),
  ('D0000000-0000-4000-8000-000000001051', 'D0000000-0000-4000-8000-000000000513', 'Decorator', FALSE, 3),
  ('D0000000-0000-4000-8000-000000001052', 'D0000000-0000-4000-8000-000000000513', 'Observer', FALSE, 4),
  -- Q5 (514): facade
  ('D0000000-0000-4000-8000-000000001053', 'D0000000-0000-4000-8000-000000000514', 'Facade', TRUE,  1),
  ('D0000000-0000-4000-8000-000000001054', 'D0000000-0000-4000-8000-000000000514', 'Adapter', FALSE, 2),
  ('D0000000-0000-4000-8000-000000001055', 'D0000000-0000-4000-8000-000000000514', 'Observer', FALSE, 3),
  ('D0000000-0000-4000-8000-000000001056', 'D0000000-0000-4000-8000-000000000514', 'Template Method', FALSE, 4),
  -- Q5 (515): facade situation
  ('D0000000-0000-4000-8000-000000001057', 'D0000000-0000-4000-8000-000000000515', 'When clients only need a few common workflows', TRUE,  1),
  ('D0000000-0000-4000-8000-000000001058', 'D0000000-0000-4000-8000-000000000515', 'When subclass count grows too large', FALSE, 2),
  ('D0000000-0000-4000-8000-000000001059', 'D0000000-0000-4000-8000-000000000515', 'When one instance is required', FALSE, 3),
  ('D0000000-0000-4000-8000-000000001060', 'D0000000-0000-4000-8000-000000000515', 'When objects must clone themselves', FALSE, 4),
  -- Q6 (516): decorator
  ('D0000000-0000-4000-8000-000000001061', 'D0000000-0000-4000-8000-000000000516', 'Decorator', TRUE,  1),
  ('D0000000-0000-4000-8000-000000001062', 'D0000000-0000-4000-8000-000000000516', 'Adapter', FALSE, 2),
  ('D0000000-0000-4000-8000-000000001063', 'D0000000-0000-4000-8000-000000000516', 'Factory Method', FALSE, 3),
  ('D0000000-0000-4000-8000-000000001064', 'D0000000-0000-4000-8000-000000000516', 'State', FALSE, 4),
  -- Q6 (517): composite
  ('D0000000-0000-4000-8000-000000001065', 'D0000000-0000-4000-8000-000000000517', 'Composite', TRUE,  1),
  ('D0000000-0000-4000-8000-000000001066', 'D0000000-0000-4000-8000-000000000517', 'Decorator', FALSE, 2),
  ('D0000000-0000-4000-8000-000000001067', 'D0000000-0000-4000-8000-000000000517', 'Observer', FALSE, 3),
  ('D0000000-0000-4000-8000-000000001068', 'D0000000-0000-4000-8000-000000000517', 'Singleton', FALSE, 4),
  -- Q6 (518): decorator vs adapter
  ('D0000000-0000-4000-8000-000000001069', 'D0000000-0000-4000-8000-000000000518', 'Decorator preserves the interface; Adapter changes it', TRUE,  1),
  ('D0000000-0000-4000-8000-000000001070', 'D0000000-0000-4000-8000-000000000518', 'Adapter preserves the interface; Decorator changes it', FALSE, 2),
  ('D0000000-0000-4000-8000-000000001071', 'D0000000-0000-4000-8000-000000000518', 'They are identical', FALSE, 3),
  ('D0000000-0000-4000-8000-000000001072', 'D0000000-0000-4000-8000-000000000518', 'Both change the interface', FALSE, 4),
  -- Q7 (519): observer
  ('D0000000-0000-4000-8000-000000001073', 'D0000000-0000-4000-8000-000000000519', 'Observer', TRUE,  1),
  ('D0000000-0000-4000-8000-000000001074', 'D0000000-0000-4000-8000-000000000519', 'Strategy', FALSE, 2),
  ('D0000000-0000-4000-8000-000000001075', 'D0000000-0000-4000-8000-000000000519', 'State', FALSE, 3),
  ('D0000000-0000-4000-8000-000000001076', 'D0000000-0000-4000-8000-000000000519', 'Template Method', FALSE, 4),
  -- Q7 (520): strategy
  ('D0000000-0000-4000-8000-000000001077', 'D0000000-0000-4000-8000-000000000520', 'Strategy', TRUE,  1),
  ('D0000000-0000-4000-8000-000000001078', 'D0000000-0000-4000-8000-000000000520', 'Observer', FALSE, 2),
  ('D0000000-0000-4000-8000-000000001079', 'D0000000-0000-4000-8000-000000000520', 'Builder', FALSE, 3),
  ('D0000000-0000-4000-8000-000000001080', 'D0000000-0000-4000-8000-000000000520', 'Proxy', FALSE, 4),
  -- Q7 (521): subject
  ('D0000000-0000-4000-8000-000000001081', 'D0000000-0000-4000-8000-000000000521', 'The object whose state changes and notifies observers', TRUE,  1),
  ('D0000000-0000-4000-8000-000000001082', 'D0000000-0000-4000-8000-000000000521', 'The list of subscribers', FALSE, 2),
  ('D0000000-0000-4000-8000-000000001083', 'D0000000-0000-4000-8000-000000000521', 'The notification payload', FALSE, 3),
  ('D0000000-0000-4000-8000-000000001084', 'D0000000-0000-4000-8000-000000000521', 'The event bus', FALSE, 4),
  -- Q8 (522): template method
  ('D0000000-0000-4000-8000-000000001085', 'D0000000-0000-4000-8000-000000000522', 'Template Method', TRUE,  1),
  ('D0000000-0000-4000-8000-000000001086', 'D0000000-0000-4000-8000-000000000522', 'State', FALSE, 2),
  ('D0000000-0000-4000-8000-000000001087', 'D0000000-0000-4000-8000-000000000522', 'Strategy', FALSE, 3),
  ('D0000000-0000-4000-8000-000000001088', 'D0000000-0000-4000-8000-000000000522', 'Observer', FALSE, 4),
  -- Q8 (523): state
  ('D0000000-0000-4000-8000-000000001089', 'D0000000-0000-4000-8000-000000000523', 'State', TRUE,  1),
  ('D0000000-0000-4000-8000-000000001090', 'D0000000-0000-4000-8000-000000000523', 'Template Method', FALSE, 2),
  ('D0000000-0000-4000-8000-000000001091', 'D0000000-0000-4000-8000-000000000523', 'Observer', FALSE, 3),
  ('D0000000-0000-4000-8000-000000001092', 'D0000000-0000-4000-8000-000000000523', 'Builder', FALSE, 4),
  -- Q8 (524): strategy vs state
  ('D0000000-0000-4000-8000-000000001093', 'D0000000-0000-4000-8000-000000000524', 'Strategy is a client choice; State transitions are internal', TRUE,  1),
  ('D0000000-0000-4000-8000-000000001094', 'D0000000-0000-4000-8000-000000000524', 'They are identical', FALSE, 2),
  ('D0000000-0000-4000-8000-000000001095', 'D0000000-0000-4000-8000-000000000524', 'State is always faster', FALSE, 3),
  ('D0000000-0000-4000-8000-000000001096', 'D0000000-0000-4000-8000-000000000524', 'Strategy cannot use interfaces', FALSE, 4),
  -- Q9 (525): SRP violation
  ('D0000000-0000-4000-8000-000000001097', 'D0000000-0000-4000-8000-000000000525', 'Single Responsibility', TRUE,  1),
  ('D0000000-0000-4000-8000-000000001098', 'D0000000-0000-4000-8000-000000000525', 'Open/Closed', FALSE, 2),
  ('D0000000-0000-4000-8000-000000001099', 'D0000000-0000-4000-8000-000000000525', 'Liskov Substitution', FALSE, 3),
  ('D0000000-0000-4000-8000-000000001100', 'D0000000-0000-4000-8000-000000000525', 'Interface Segregation', FALSE, 4),
  -- Q9 (526): decorator chains
  ('D0000000-0000-4000-8000-000000001101', 'D0000000-0000-4000-8000-000000000526', 'Decorator chains', TRUE,  1),
  ('D0000000-0000-4000-8000-000000001102', 'D0000000-0000-4000-8000-000000000526', 'Inheritance explosion', FALSE, 2),
  ('D0000000-0000-4000-8000-000000001103', 'D0000000-0000-4000-8000-000000000526', 'Singleton', FALSE, 3),
  ('D0000000-0000-4000-8000-000000001104', 'D0000000-0000-4000-8000-000000000526', 'Global state', FALSE, 4),
  -- Q9 (527): strategy for payments
  ('D0000000-0000-4000-8000-000000001105', 'D0000000-0000-4000-8000-000000000527', 'Strategy', TRUE,  1),
  ('D0000000-0000-4000-8000-000000001106', 'D0000000-0000-4000-8000-000000000527', 'Singleton', FALSE, 2),
  ('D0000000-0000-4000-8000-000000001107', 'D0000000-0000-4000-8000-000000000527', 'Adapter', FALSE, 3),
  ('D0000000-0000-4000-8000-000000001108', 'D0000000-0000-4000-8000-000000000527', 'Composite', FALSE, 4),
  -- Q9 (528): replace if-else with strategy
  ('D0000000-0000-4000-8000-000000001109', 'D0000000-0000-4000-8000-000000000528', 'Replace the conditional chain with injected Strategy objects', TRUE,  1),
  ('D0000000-0000-4000-8000-000000001110', 'D0000000-0000-4000-8000-000000000528', 'Add more branches to the chain', FALSE, 2),
  ('D0000000-0000-4000-8000-000000001111', 'D0000000-0000-4000-8000-000000000528', 'Use a deeper inheritance hierarchy', FALSE, 3),
  ('D0000000-0000-4000-8000-000000001112', 'D0000000-0000-4000-8000-000000000528', 'Skip the refactor entirely', FALSE, 4),
  -- Q9 (529): characterization tests
  ('D0000000-0000-4000-8000-000000001113', 'D0000000-0000-4000-8000-000000000529', 'Lock down current behavior with tests', TRUE,  1),
  ('D0000000-0000-4000-8000-000000001114', 'D0000000-0000-4000-8000-000000000529', 'Delete the legacy code', FALSE, 2),
  ('D0000000-0000-4000-8000-000000001115', 'D0000000-0000-4000-8000-000000000529', 'Rewrite everything from memory', FALSE, 3),
  ('D0000000-0000-4000-8000-000000001116', 'D0000000-0000-4000-8000-000000000529', 'Skip the analysis', FALSE, 4)
ON CONFLICT (id) DO NOTHING;
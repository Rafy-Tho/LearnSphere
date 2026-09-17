-- ============================================================================
-- SEED 033: Complete course — "SOLID Principles in Practice"
-- ----------------------------------------------------------------------------
-- Instructor : Elena Rodriguez (10000000-0000-4000-8000-000000000005)
-- Category   : Software Design & Architecture (20000000-0000-4000-8000-000000000010)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Foundations of Design       → C1 Design Foundations · C2 Single Responsibility
--   M2 Open/Closed & Liskov        → C3 Open/Closed Principle · C4 Liskov Substitution
--   M3 Interfaces & Dependencies   → C5 Interface Segregation · C6 Dependency Inversion
--   M4 SOLID in the Field          → C7 Testing & Refactoring · C8 Balance & Pragmatism
--   M5 Capstone: Legacy Refactor   → C9 Capstone Analysis · C10 Capstone Refactor
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
  '02100000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000005',
  '20000000-0000-4000-8000-000000000010',
  'SOLID Principles in Practice',
  'solid-principles-in-practice',
  'Understand what makes software cheap to change. Learn the five SOLID principles through concrete refactors — from single responsibility and dependency inversion to polymorphism, tests, and a full legacy-code refactor.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  31
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('02100000-0000-4000-8000-000000000011', '02100000-0000-4000-8000-000000000001', 'Explain coupling, cohesion, and the purpose of the five SOLID principles.',   1),
  ('02100000-0000-4000-8000-000000000012', '02100000-0000-4000-8000-000000000001', 'Apply SRP, OCP, and LSP to real classes: responsibility, extension, and safe substitution.', 2),
  ('02100000-0000-4000-8000-000000000013', '02100000-0000-4000-8000-000000000001', 'Design role-based interfaces and depend on abstractions through dependency injection.',         3),
  ('02100000-0000-4000-8000-000000000014', '02100000-0000-4000-8000-000000000001', 'Refactor legacy code toward SOLID behind a passing test suite.',                            4),
  ('02100000-0000-4000-8000-000000000015', '02100000-0000-4000-8000-000000000001', 'Balance principles with pragmatism and recognise when abstractions cost more than they save.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('02100000-0000-4000-8000-000000000101', '02100000-0000-4000-8000-000000000001', 1, 'Foundations of Design',   'Coupling, cohesion, and the reason the principles exist.',                                              'PUBLISHED'),
  ('02100000-0000-4000-8000-000000000102', '02100000-0000-4000-8000-000000000001', 2, 'Open/Closed & Liskov',    'Extend behavior without editing it and keep subtypes safely substitutable.',                               'PUBLISHED'),
  ('02100000-0000-4000-8000-000000000103', '02100000-0000-4000-8000-000000000001', 3, 'Interfaces & Dependencies', 'Small role interfaces and dependencies pointed at abstractions.',                                        'PUBLISHED'),
  ('02100000-0000-4000-8000-000000000104', '02100000-0000-4000-8000-000000000001', 4, 'SOLID in the Field',      'Tests, refactoring, and knowing when to relax the rules.',                                                'PUBLISHED'),
  ('02100000-0000-4000-8000-000000000105', '02100000-0000-4000-8000-000000000001', 5, 'Capstone: Legacy Refactor', 'Rebuild a legacy ordering module around SOLID, step by step.',                                           'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('02100000-0000-4000-8000-000000000201', '02100000-0000-4000-8000-000000000101', 1, 'Design Foundations',            'Why design quality predicts the cost of change.',            'PUBLISHED'),
  ('02100000-0000-4000-8000-000000000202', '02100000-0000-4000-8000-000000000101', 2, 'Single Responsibility',         'One reason to change, per class.',                            'PUBLISHED'),
  ('02100000-0000-4000-8000-000000000203', '02100000-0000-4000-8000-000000000102', 1, 'Open/Closed Principle',         'Extend behavior without rewriting what works.',               'PUBLISHED'),
  ('02100000-0000-4000-8000-000000000204', '02100000-0000-4000-8000-000000000102', 2, 'Liskov Substitution',           'Subtypes that stay safely substitutable.',                    'PUBLISHED'),
  ('02100000-0000-4000-8000-000000000205', '02100000-0000-4000-8000-000000000103', 1, 'Interface Segregation',         'Clients depend on the roles they actually use.',              'PUBLISHED'),
  ('02100000-0000-4000-8000-000000000206', '02100000-0000-4000-8000-000000000103', 2, 'Dependency Inversion',          'High-level policy over low-level detail.',                    'PUBLISHED'),
  ('02100000-0000-4000-8000-000000000207', '02100000-0000-4000-8000-000000000104', 1, 'Testing & Refactoring',         'Lock in behavior first, then restructure.',                   'PUBLISHED'),
  ('02100000-0000-4000-8000-000000000208', '02100000-0000-4000-8000-000000000104', 2, 'Balance & Pragmatism',          'Apply principles in proportion to real risk and reward.',     'PUBLISHED'),
  ('02100000-0000-4000-8000-000000000209', '02100000-0000-4000-8000-000000000105', 1, 'Capstone Analysis',             'Audit the legacy ordering module and map its smells.',        'PUBLISHED'),
  ('02100000-0000-4000-8000-000000000210', '02100000-0000-4000-8000-000000000105', 2, 'Capstone Refactor',             'Extract, inject, verify, and extend without breaking anything.','PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 02100000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('02100000-0000-4000-8000-000000000301', '02100000-0000-4000-8000-000000000201', 1, 'What Are SOLID Principles?',        'Meet the five principles that guide maintainable object-oriented design.',                    'TEXT',  'PUBLISHED', 'FREE', 10,  6),
  ('02100000-0000-4000-8000-000000000302', '02100000-0000-4000-8000-000000000201', 2, 'Coupling & Cohesion',                'Understand what makes modules easy to change and easy to understand.',                        'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02100000-0000-4000-8000-000000000303', '02100000-0000-4000-8000-000000000201', 3, 'Design Foundations Quiz',             'Check your grasp of the foundational forces behind the principles.',                          'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02100000-0000-4000-8000-000000000304', '02100000-0000-4000-8000-000000000202', 1, 'Single Responsibility Principle (SRP)', 'A class should have exactly one reason to change.',                                           'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02100000-0000-4000-8000-000000000305', '02100000-0000-4000-8000-000000000202', 2, 'SRP in Practice: Refactoring a God Class', 'Break a swollen class into focused collaborators with clear roles.',                          'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('02100000-0000-4000-8000-000000000306', '02100000-0000-4000-8000-000000000202', 3, 'Single Responsibility Quiz',         'Verify you can spot and fix SRP violations.',                                                  'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02100000-0000-4000-8000-000000000307', '02100000-0000-4000-8000-000000000203', 1, 'Open/Closed Principle (OCP)',        'Extend behavior without rewriting what already works.',                                       'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02100000-0000-4000-8000-000000000308', '02100000-0000-4000-8000-000000000203', 2, 'OCP in Practice: Strategy & Polymorphism', 'Use strategy objects and polymorphism to keep modules open for extension.',                   'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('02100000-0000-4000-8000-000000000309', '02100000-0000-4000-8000-000000000203', 3, 'Open/Closed Quiz',                   'Check your ability to extend without modifying.',                                             'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02100000-0000-4000-8000-000000000310', '02100000-0000-4000-8000-000000000204', 1, 'Liskov Substitution Principle (LSP)','Subtypes must stay safely substitutable for their base types.',                               'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02100000-0000-4000-8000-000000000311', '02100000-0000-4000-8000-000000000204', 2, 'LSP in Practice: Inheritance Traps','Recognize inheritance designs that quietly break the base contract.',                         'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('02100000-0000-4000-8000-000000000312', '02100000-0000-4000-8000-000000000204', 3, 'Liskov Substitution Quiz',          'Test your ability to keep subtypes honest.',                                                  'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02100000-0000-4000-8000-000000000313', '02100000-0000-4000-8000-000000000205', 1, 'Interface Segregation Principle (ISP)', 'Clients should not depend on interfaces they do not use.',                                    'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02100000-0000-4000-8000-000000000314', '02100000-0000-4000-8000-000000000205', 2, 'ISP in Practice: Small Roles',      'Design small, role-specific interfaces that match real consumers.',                           'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02100000-0000-4000-8000-000000000315', '02100000-0000-4000-8000-000000000205', 3, 'Interface Segregation Quiz',        'Verify you can split fat contracts by role.',                                                'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02100000-0000-4000-8000-000000000316', '02100000-0000-4000-8000-000000000206', 1, 'Dependency Inversion Principle (DIP)', 'High-level policy must not depend on low-level detail.',                                      'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02100000-0000-4000-8000-000000000317', '02100000-0000-4000-8000-000000000206', 2, 'Dependency Injection in Practice',  'Supply dependencies from outside and wire them at the composition root.',                     'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('02100000-0000-4000-8000-000000000318', '02100000-0000-4000-8000-000000000206', 3, 'DIP & Dependency Injection Quiz',   'Check your understanding of direction versus delivery.',                                      'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02100000-0000-4000-8000-000000000319', '02100000-0000-4000-8000-000000000207', 1, 'Writing Tests for SOLID Code',      'Use tests to lock in behavior while you improve the structure.',                              'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('02100000-0000-4000-8000-000000000320', '02100000-0000-4000-8000-000000000207', 2, 'Refactoring Toward SOLID',          'Restructure code in small, verified steps without changing behavior.',                         'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('02100000-0000-4000-8000-000000000321', '02100000-0000-4000-8000-000000000207', 3, 'Testing & Refactoring Quiz',        'Verify you can test first and refactor safely.',                                              'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02100000-0000-4000-8000-000000000322', '02100000-0000-4000-8000-000000000208', 1, 'When SOLID Goes Wrong',             'Recognize when abstractions cost more than they save.',                                       'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02100000-0000-4000-8000-000000000323', '02100000-0000-4000-8000-000000000208', 2, 'Balancing Principles with Pragmatism', 'Apply principles in proportion to real risk and reward.',                                      'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02100000-0000-4000-8000-000000000324', '02100000-0000-4000-8000-000000000208', 3, 'Design Judgment Quiz',              'Check your sense of when to apply, and when to skip, the rules.',                              'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02100000-0000-4000-8000-000000000325', '02100000-0000-4000-8000-000000000209', 1, 'Capstone: Auditing the Legacy Codebase', 'Survey the legacy ordering module and map its smells to SOLID.',                              'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02100000-0000-4000-8000-000000000326', '02100000-0000-4000-8000-000000000210', 1, 'Capstone: Planning the Refactor',   'Define the target architecture and an incremental migration plan.',                            'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('02100000-0000-4000-8000-000000000327', '02100000-0000-4000-8000-000000000210', 2, 'Capstone: Refactoring & Verification', 'Execute the refactor behind tests and verify the result with a new feature.',                  'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02100000-0000-4000-8000-000000000328', '02100000-0000-4000-8000-000000000210', 3, 'Final Assessment',                  'Prove you can apply every principle to a realistic design problem.',                           'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 02100000-…-0401 .. 0427)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '02100000-0000-4000-8000-000000000401',
  '02100000-0000-4000-8000-000000000301',
  1,
  'What Are SOLID Principles?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What Are SOLID Principles?</title>
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
  <h1>What Are SOLID Principles?</h1>
  <p><strong>SOLID</strong> is a mnemonic for five design principles that make object-oriented code easier to change, test, and reason about. They were assembled by Robert C. Martin (&ldquo;Uncle Bob&rdquo;) from decades of accumulated practice, and they answer one expensive question: <em>why does this change cost so much?</em></p>
  <p>Every system is changed over its lifetime — new features, bug fixes, new integrations. If a change ripples through unrelated classes, the cost curve balloons. The SOLID principles are guardrails against that drift.</p>
  <h2>The five principles</h2>
  <table>
    <tr><th>Letter</th><th>Principle</th><th>Core idea</th></tr>
    <tr><td>S</td><td>Single Responsibility</td><td>One reason to change.</td></tr>
    <tr><td>O</td><td>Open/Closed</td><td>Open for extension, closed for modification.</td></tr>
    <tr><td>L</td><td>Liskov Substitution</td><td>Subtypes stay safely substitutable.</td></tr>
    <tr><td>I</td><td>Interface Segregation</td><td>No unused dependencies.</td></tr>
    <tr><td>D</td><td>Dependency Inversion</td><td>Depend on abstractions, not details.</td></tr>
  </table>
  <h2>Not a checklist</h2>
  <p>The principles are <strong>heuristics</strong>, not laws. They sharpen your judgment about where risk concentrates — they are not a badge that automatically makes code good. Applied blindly, they produce castles of pointless indirection, which this course will also teach you to recognise.</p>
  <div class="callout callout-info">
    <strong>Prerequisites</strong>
    <p>You should be comfortable with classes, inheritance, interfaces, and constructor parameters in any object-oriented language (Java, C#, TypeScript, PHP, Python). The examples here use a Java-like syntax.</p>
  </div>
  <h2>What you will build</h2>
  <p>Throughout the course you will dissect a legacy <span class="ic">OrderProcessor</span> — a class that does far too much — and rebuild it behind tests using every principle. By the end you will have a practical, repeatable refactoring method, not just theory.</p>
  <div class="callout callout-tip">
    <strong>Read with your own code in mind</strong>
    <h2>How the course is organised</h2>
  <p>Modules 1-3 introduce the five principles with small, self-contained examples. Module 4 shows how tests enable safe refactoring and how to judge when to relax the rules. Module 5 walks through a legacy refactor, end to end, using everything you have learned.</p>
  <div class="callout">
    <strong>One mental model</strong>
    <p>Return to this page whenever a principle feels abstract: each one exists to reduce the cost of a specific kind of change — and a principle with no cost to reduce is a principle you can skip.</p>
  </div>
    <p>As you learn each principle, open a project you own and ask: which class would fail this test first?</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02100000-0000-4000-8000-000000000402',
  '02100000-0000-4000-8000-000000000302',
  1,
  'Coupling & Cohesion',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Coupling & Cohesion</title>
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
  <h1>Coupling &amp; Cohesion</h1>
  <p>Before the principles, two forces dominate every design decision you will make. <strong>Cohesion</strong> measures how closely the things inside one module belong together. <strong>Coupling</strong> measures how much one module depends on another.</p>
  <h2>Cohesion</h2>
  <p>High cohesion means a class holds fields and methods that serve <em>one clear purpose</em>. Low cohesion means a grab bag — the classic sign is methods that use completely different subsets of the fields.</p>
  <table>
    <tr><th>Cohesion level</th><th>What it looks like</th></tr>
    <tr><td>Functional (best)</td><td>Every member serves one task.</td></tr>
    <tr><td>Sequential</td><td>Methods feed each other but mix concerns.</td></tr>
    <tr><td>Procedural</td><td>Steps of a workflow, not one concept.</td></tr>
    <tr><td>Coincidental (worst)</td><td>Methods are lumped together by accident.</td></tr>
  </table>
  <h2>Coupling</h2>
  <p>Tight coupling appears when one class reaches into another class internal details, when every change to A forces a change to B, or when testing A requires a real database and an email server.</p>
  <pre class="code-block">class OrderService {
  private Database db = new Database();      // hard reference
  private Mailer mailer = new Mailer();      // another hard reference
  public void ship(Order o) {
    db.save(o);                              // reaches into db details
    mailer.sendDaily(o);                     // couples to a schedule too
  }
}</pre>
  <div class="callout">
    <strong>Low coupling, high cohesion</strong>
    <p>These two goals pull in the same direction: a class should be a tightly knit, focused unit that communicates with the outside world through a small, stable surface.</p>
  </div>
  <h2>Compile-time vs runtime coupling</h2>
  <p>Coupling shows up in two places. Compile-time coupling is the import graph: changing a class signature forces every referrer to recompile and possibly change. Runtime coupling is behavioral: one class trusts another private assumptions, so a quiet internal change breaks the caller at runtime — where bugs are slowest to find.</p>
  <p>The practical lesson: expose a narrow, stable surface and keep every other interaction inside the module boundary. That is the communication pattern nearly every SOLID rule protects or builds upon.</p>
  <p>Cohesion and coupling are the raw materials every SOLID principle works on. SRP raises cohesion; DIP and ISP lower coupling.</p>
</div>
</body>
</html>
$html$
),
(
  '02100000-0000-4000-8000-000000000404',
  '02100000-0000-4000-8000-000000000304',
  1,
  'Single Responsibility Principle (SRP)',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Single Responsibility Principle (SRP)</title>
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
  <h1>Single Responsibility Principle (SRP)</h1>
  <p>SRP says: <strong>a class should have one, and only one, reason to change.</strong> That reason is usually an actor — a person or department that asks for changes: you, the billing team, the marketing team, the regulators. When two different actors can ask for changes to the same class, the class has two responsibilities.</p>
  <h2>Finding the reason to change</h2>
  <pre class="code-block">class MonthlyReport {
  String build() { ... }              // formats the report
  void saveToCsv() { ... }            // persistence details
  void emailToManager() { ... }       // delivery rules
}</pre>
  <p>The formatting changes when accounting asks. The CSV export changes when IT adopts a new tool. Emailing changes when the manager switches channels. Three reasons, one class — an SRP violation.</p>
  <h2>The split</h2>
  <pre class="code-block">class ReportBuilder   { String build() { ... } }
class ReportCsvWriter { void write(Report r) { ... } }
class ReportDelivery  { void emailTo(Report r, Contact who) { ... } }</pre>
  <div class="callout callout-tip">
    <strong>Find the seams</strong>
    <p>Each extracted class becomes a testable, replaceable seam. Changing the CSV dialect no longer risks breaking the email layout.</p>
  </div>
  <div class="callout callout-info">
    <strong>Not one method</strong>
    <p>SRP does not mean one method per class or no private helpers. A focused class may legitimately contain several steps — they all serve the one responsibility.</p>
  </div>
  <div class="callout callout-tip">
    <strong>A fast check</strong>
    <p>Say the class name as a sentence out loud: <em>this object builds monthly reports and stores them and emails them</em>. If the sentence contains <span class="ic">and</span> followed by a different activity, you have found a second responsibility.</p>
  </div>
  <h2>Common objections</h2>
  <p>Critics say SRP always adds files. It does — and that is the point: each new collaborator is independently testable and independently replaceable. The extra files buy a smaller blast radius for every future change.</p>
  <p>In the next lesson you will apply SRP to a real-world &ldquo;god class&rdquo; and watch a monster shrink into an orchestra of focused collaborators.</p>
</div>
</body>
</html>
$html$
),
(
  '02100000-0000-4000-8000-000000000405',
  '02100000-0000-4000-8000-000000000305',
  1,
  'SRP in Practice: Refactoring a God Class',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SRP in Practice: Refactoring a God Class</title>
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
  <h1>SRP in Practice: Refactoring a God Class</h1>
  <p>A <strong>god class</strong> accumulates responsibility over years: it validates, computes, persists, notifies, and formats — all in one spot. It usually grows because it was convenient, and it usually collapses because the convenience became a wall of edit-anything bugs.</p>
  <h2>Symptoms</h2>
  <ul>
    <li>A file with hundreds of lines and dozens of fields.</li>
    <li>Nearly every story touches <em>this one</em> class.</li>
    <li>Its methods quietly use different subsets of the object state.</li>
    <li>Tests need real databases and email servers to exercise simple logic.</li>
  </ul>
  <pre class="code-block">class OrderProcessor {
  void checkStock(Order o) { ... }       // validation
  double computeTotal(Order o) { ... }   // pricing
  boolean save(Order o) { ... }          // persistence
  void sendConfirmation(Order o) { ... } // delivery
  String renderHtml(Order o) { ... }     // presentation
}</pre>
  <h2>Extract by verb</h2>
  <p>Read the method names as clues to the roles hiding inside. Each verb group becomes a collaborator:</p>
  <pre class="code-block">class OrderValidator   { void validate(Order o) { ... } }
class PriceCalculator  { double priceOf(Order o) { ... } }
class OrderRepository  { void save(Order o) { ... } }
class OrderNotifier    { void confirm(Order o) { ... } }
class OrderPresenter   { String toHtml(Order o) { ... } }</pre>
  <p>The new <span class="ic">OrderProcessor</span> does not disappear — it becomes an <strong>orchestrator</strong> that calls the collaborators in order. Orchestration is a legitimate responsibility of its own.</p>
  <div class="callout callout-tip">
    <strong>Naming is the map</strong>
    <h2>Extract in order</h2>
  <p>Extract the least risky collaborator first. Pure calculation has no infrastructure, so it is trivially testable. Validation comes next, then persistence, then notification. An explicit order makes each commit a reviewable story.</p>
  <div class="callout callout-info">
    <strong>Keep the shape visible</strong>
    <p>After each extraction, run the tests and glance at the two class names side by side. If both still start with the same vague word (Helper, Manager, Utils), keep digging for the real role.</p>
  </div>
    <p>If you can write a two-word name that captures a capability (<span class="ic">PriceCalculator</span>, <span class="ic">OrderValidator</span>), you have found a real responsibility.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02100000-0000-4000-8000-000000000407',
  '02100000-0000-4000-8000-000000000307',
  1,
  'Open/Closed Principle (OCP)',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Open/Closed Principle (OCP)</title>
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
  <h1>Open/Closed Principle (OCP)</h1>
  <p>A module is <strong>open for extension but closed for modification</strong>: you should be able to add new behavior with new code, without editing code that already works and is already tested.</p>
  <h2>The naive dispatch</h2>
  <pre class="code-block">void render(Shape s) {
  if (s instanceof Circle) { drawCircle((Circle) s); }
  else if (s instanceof Square) { drawSquare((Square) s); }
  // add a Triangle? edit this method again.
}</pre>
  <p>Every new shape forces you to edit <span class="ic">render</span>, re-test it, and re-deploy code that previously had no reason to change. The shape family grows, so the renderer reopens again and again.</p>
  <h2>Polymorphism flips the design</h2>
  <pre class="code-block">interface Shape { void render(Drawer d); }

class Circle implements Shape {
  public void render(Drawer d) { d.drawCircle(radius); }
}
class Square implements Shape {
  public void render(Drawer d) { d.drawSquare(side); }
}
// A new shape needs no change to render() at all.</pre>
  <h2>Why it matters</h2>
  <p>Already-tested code is an asset. Every edit to it is a new risk and a new test burden. OCP concentrates change where change is meant to happen — in brand-new classes.</p>
  <table>
    <tr><th>Open/Closed signal</th><th>Smell</th></tr>
    <tr><td>New feature = new class</td><td>New feature = edited if/else ladder</td></tr>
    <tr><td>Interfaces stay stable</td><td>Interfaces churn every sprint</td></tr>
    <tr><td>Versions add modules</td><td>Versions rewrite the core</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Closed means stable, not frozen</strong>
    <h2>Where OCP bites back</h2>
  <p>The most common braking point is an if/else or switch ladder written once and extended forever. Every new case is a modification to shared, tested code. As soon as a dispatch list is longer than three clauses and still growing, it is the smell to watch.</p>
    <p>Bugs still get fixed by editing. OCP protects against adding <em>behavior</em> in code that already satisfies its contract.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02100000-0000-4000-8000-000000000408',
  '02100000-0000-4000-8000-000000000308',
  1,
  'OCP in Practice: Strategy & Polymorphism',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>OCP in Practice: Strategy & Polymorphism</title>
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
  <h1>OCP in Practice: Strategy &amp; Polymorphism</h1>
  <p>The most common way to open a module for extension is the <strong>Strategy pattern</strong>: extract a family of algorithms behind an interface, and let the client hold the strategy instead of the if/else ladder.</p>
  <pre class="code-block">interface DiscountStrategy {
  double apply(Order o);
}

class NoDiscount implements DiscountStrategy {
  public double apply(Order o) { return o.total(); }
}
class LoyaltyDiscount implements DiscountStrategy {
  public double apply(Order o) { return o.total() * 0.9; }
}

class Checkout {
  Checkout(DiscountStrategy strategy) { ... }
  double totalFor(Order o) { return strategy.apply(o); }
}</pre>
  <p>Adding a seasonal sale means adding <span class="ic">SeasonalDiscount</span> — the <span class="ic">Checkout</span> stays untouched.</p>
  <h2>Where do strategies come from?</h2>
  <pre class="code-block">DiscountStrategy pick(Customer c) {
  return c.isLoyal() ? new LoyaltyDiscount() : new NoDiscount();
}</pre>
  <p>A small factory reads configuration or customer state and returns the right strategy. The choice moved out of the algorithm into one easy-to-test decision point.</p>
  <h2>Beyond strategy</h2>
  <ul>
    <li><strong>Decorator</strong> — wrap behavior with extra behavior.</li>
    <li><strong>Observer</strong> — let new listeners subscribe without editing the publisher.</li>
    <li><strong>Template Method</strong> — fixed algorithm, overridable steps.</li>
    <li><strong>Plugin registries</strong> — new implementations register themselves.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Do not strategise on day one</strong>
    <h2>Testing strategies</h2>
  <p>Because every strategy implements the same interface, one test harness can exercise them all: pass the same order through each discount and assert the expected subtotal. Adding a strategy adds a data point, never a rewrite.</p>
  <div class="callout callout-info">
    <strong>Keep the interface honest</strong>
    <p>If a new strategy needs special knowledge the interface does not carry (extra options passed through, reliance on instanceof), the seam is wrong — reshape the contract before adding the class.</p>
  </div>
    <p>Reach for a strategy when you actually see a second algorithm, or when the choice point is genuinely volatile. Premature strategies are just indirection.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02100000-0000-4000-8000-000000000410',
  '02100000-0000-4000-8000-000000000310',
  1,
  'Liskov Substitution Principle (LSP)',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Liskov Substitution Principle (LSP)</title>
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
  <h1>Liskov Substitution Principle (LSP)</h1>
  <p>Barbara Liskov formalised a simple idea with a rigorous name: if <span class="ic">B</span> is a subtype of <span class="ic">A</span>, then any code that works with <span class="ic">A</span> must work unchanged with <span class="ic">B</span>. A derived class must be a drop-in replacement for its base class.</p>
  <h2>The Rectangle/Square trap</h2>
  <pre class="code-block">class Rectangle {
  void setWidth(int w)  { width  = w; }
  void setHeight(int h) { height = h; }
  int area() { return width * height; }
}

class Square extends Rectangle {
  void setWidth(int w)  { width = height = w; }  // both change
  void setHeight(int h) { width = height = h; }
}

Rectangle r = new Square();
r.setWidth(5); r.setHeight(4);
print(r.area());    // 16, not 20 — the contract lies</pre>
  <p>Callers assume width and height are independent because the base class says nothing else. The subclass silently rewrites that assumption — substitutability breaks.</p>
  <h2>Common violations</h2>
  <ul>
    <li>Throwing for inputs the base contract accepts.</li>
    <li>Returning <span class="ic">null</span> where the base promised a value.</li>
    <li>Overriding a method to do nothing.</li>
    <li>Requiring extra setup before a call is valid.</li>
  </ul>
  <pre class="code-block">class ReadOnlyList extends List {
  void add(Object o) { throw new UnsupportedOperationException(); }
}
// Replacing a List breaks every caller that adds items.</pre>
  <div class="callout callout-tip">
    <strong>Test at the base level</strong>
    <h2>Escaping the trap</h2>
  <p>Do not make Square a Rectangle at all. Give both a shared <span class="ic">Shape</span> contract, or model shapes as immutable value objects. The classification that feels natural in real life is often the one that violates the code contract.</p>
    <p>Run one generic test suite against the base contract, then reuse it for every subtype. If a subtype fails the suite, it does not really fit the family.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02100000-0000-4000-8000-000000000411',
  '02100000-0000-4000-8000-000000000311',
  1,
  'LSP in Practice: Inheritance Traps',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>LSP in Practice: Inheritance Traps</title>
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
  <h1>LSP in Practice: Inheritance Traps</h1>
  <p>The moment a subclass deviates from the base contract, the &ldquo;is-a&rdquo; relationship starts to lie. Here are the traps that bite in real codebases.</p>
  <h2>Trap 1: Narrowed returns</h2>
  <pre class="code-block">class Report { String render() { ... } }
class PdfReport extends Report {
  String render() { return null; }   // callers expect a String
}</pre>
  <p>Returning <span class="ic">null</span>, a lesser capability, or an empty value where callers expect real data breaks every downstream assumption.</p>
  <h2>Trap 2: Signature drift</h2>
  <p>Subclasses that quietly change argument meaning, return incompatible types, or document different failure modes make the base contract fiction.</p>
  <h2>Trap 3: Unexpected exceptions</h2>
  <pre class="code-block">class Account { void withdraw(int amount) { ... } }
class FrozenAccount extends Account {
  void withdraw(int amount) { throw new AccountFrozen(); }
}</pre>
  <p>If the application does not catch <span class="ic">AccountFrozen</span>, swapping in a frozen account crashes the whole flow. The base contract never promised this could happen.</p>
  <h2>Fixing the fit</h2>
  <ul>
    <li>Describe failures in the contract; make subtypes honour it.</li>
    <li>When a subclass cannot fulfil part of the contract, that part does not belong to it — extract a smaller interface instead.</li>
    <li>Prefer composition: give the class a collaborator rather than forcing it down an inheritance branch.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Works-like-a beats is-a</strong>
    <div class="callout callout-info">
    <strong>Drift is silent</strong>
    <p>Signature drift rarely throws — it quietly returns <span class="ic">None</span> or empty values. That is why a shared contract suite is worth more than any number of per-subclass tests written ad hoc.</p>
  </div>
    <p>Ask <em>can this object safely replace every use of its base?</em> If the answer is no, the relationship is wrong — no matter how natural the classification sounds.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02100000-0000-4000-8000-000000000413',
  '02100000-0000-4000-8000-000000000313',
  1,
  'Interface Segregation Principle (ISP)',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Interface Segregation Principle (ISP)</title>
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
  <h1>Interface Segregation Principle (ISP)</h1>
  <p>No client should be forced to depend on methods it does not use. When one interface drags along everything, every client inherits every change to everything.</p>
  <h2>The fat interface</h2>
  <pre class="code-block">interface Worker {
  void code(String task);
  void cookLunch();
  void test(String suite);
}

class Robot implements Worker {
  public void code(String task) { ... }
  public void cookLunch() { /* not applicable */ }
  public void test(String suite) { ... }
}</pre>
  <p>The robot never cooks. Yet every change to <span class="ic">cookLunch</span> recompiles it and its tests, and someone writing a new <span class="ic">Worker</span> must invent behavior they will never use — usually an empty body or a thrown <span class="ic">UnsupportedOperationException</span>.</p>
  <h2>Role interfaces</h2>
  <pre class="code-block">interface Codable   { void code(String task); }
interface Testable  { void test(String suite); }
interface Feedable  { void cookLunch(); }

class Developer implements Codable, Testable {
  public void code(String task) { ... }
  public void test(String suite) { ... }
}
class Robot implements Codable, Testable {
  public void code(String task) { ... }
  public void test(String suite) { ... }
}</pre>
  <p>Now consumers depend only on the role they need. A build pipeline depends on <span class="ic">Testable</span>; a scheduler depends on <span class="ic">Codable</span>; the canteen depends on <span class="ic">Feedable</span>. Each role can change on its own.</p>
  <div class="callout callout-tip">
    <strong>Name the role</strong>
    <h2>When ISP pays most</h2>
  <ul>
    <li>Public SDKs and libraries — you cannot know every consumer.</li>
    <li>Third-party integrations — adapters implement only what your code calls.</li>
    <li>Framework hooks — a wide super-interface forces empty implementations on every adapter.</li>
  </ul>
    <p>Interfaces named after the <em>consumer role</em> (<span class="ic">PriceView</span>, <span class="ic">PersistenceTarget</span>) communicate intent far better than <span class="ic">EverythingService</span>.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02100000-0000-4000-8000-000000000414',
  '02100000-0000-4000-8000-000000000314',
  1,
  'ISP in Practice: Small Roles',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ISP in Practice: Small Roles</title>
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
  <h1>ISP in Practice: Small Roles</h1>
  <p>Fat interfaces usually start polite and small, then grow one method per feature request. The signals are predictable: methods with empty bodies, exceptions that say <span class="ic">NotSupported</span>, and comments like <span class="ic">// only used by web clients</span>.</p>
  <h2>An interface that does everything</h2>
  <pre class="code-block">interface ReportService {
  String renderTable();
  byte[] exportPdf();
  void sendEmail();
  void archive(String path);
}</pre>
  <p>The dashboard uses <span class="ic">renderTable</span>. A nightly job uses <span class="ic">exportPdf</span> and <span class="ic">archive</span>. The notification feature uses <span class="ic">sendEmail</span>. Three consumers, one giant contract — each consumer is coupled to changes meant for the other two.</p>
  <h2>Split by consumer</h2>
  <pre class="code-block">interface ReportViewer   { String renderTable(); }
interface ReportExporter { byte[] exportPdf(); void archive(String path); }
interface ReportNotifier { void sendEmail(); }</pre>
  <div class="callout callout-tip">
    <strong>One used method is enough</strong>
    <p>An interface that fits one consumer and contains one method is a good interface. Tiny and honest beats large and general.</p>
  </div>
  <h2>Granularity is a judgement call</h2>
  <p>Split when consumers genuinely diverge; merge when roles stay cohesive. If every consumer always uses the same three methods together, forcing three interfaces adds ceremony without payoff.</p>
  <div class="callout callout-info">
    <strong>Pair with DIP</strong>
    <h2>Segregation by direction</h2>
  <p>Splitting by <em>direction</em> is often the most useful cut: a reader interface for producers, a writer interface for consumers, a notifier for side effects. Two classes exchanging the same data often need opposite faces of the same contract.</p>
  <div class="callout callout-info">
    <strong>Skip the ceremony</strong>
    <p>Two consumers that use the identical three methods do not need three interfaces — that is ceremony, not segregation. ISP optimises the shape of the contract, not its number of files.</p>
  </div>
    <p>ISP shapes the contract; DIP sets its direction. Together they keep the blast radius of a change small.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02100000-0000-4000-8000-000000000416',
  '02100000-0000-4000-8000-000000000316',
  1,
  'Dependency Inversion Principle (DIP)',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dependency Inversion Principle (DIP)</title>
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
  <h1>Dependency Inversion Principle (DIP)</h1>
  <p>High-level modules should not depend on low-level modules; both should depend on abstractions. And abstractions should not depend on details — details should depend on abstractions.</p>
  <p>In plain words: <strong>the policy of your system (the &ldquo;what&rdquo;) must not be held hostage by an implementation (the &ldquo;how&rdquo;).</strong></p>
  <h2>The rigid version</h2>
  <pre class="code-block">class OrderService {
  private MySqlOrderRepository repo = new MySqlOrderRepository();
  void save(Order o) { repo.insertIntoMySql(o); }
}</pre>
  <p><span class="ic">OrderService</span> now knows the storage technology and the table dialect. When a second database arrives, the high-level flow is edited to follow it.</p>
  <h2>The inverted version</h2>
  <pre class="code-block">interface OrderRepository { void save(Order o); }

class OrderService {
  private OrderRepository repo;
  OrderService(OrderRepository repo) { this.repo = repo; }
  void save(Order o) { repo.save(o); }   // pure policy
}
class MySqlOrderRepository implements OrderRepository { ... }</pre>
  <p><span class="ic">OrderService</span> depends on the <em>abstraction</em>. Swapping storage, adding a cache in front, or substituting a test fake touches nothing in the policy layer.</p>
  <div class="callout callout-info">
    <strong>DIP is not DI, but they cooperate</strong>
    <p>DIP is the direction of dependence. Dependency injection is the technique that delivers the abstraction, so the policy never has to build it.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Who owns the abstraction?</strong>
    <h2>Reading the arrows</h2>
  <p>Draw the dependency graph: policy classes point at interfaces, interfaces point at nothing, implementations point at both. If any high-level class points directly at a concrete low-level class, an arrow crosses a boundary it should never cross.</p>
    <p>The interface describing what the policy needs should live with the policy module, not with the implementation. The low-level module then depends <em>backwards</em> on it.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02100000-0000-4000-8000-000000000417',
  '02100000-0000-4000-8000-000000000317',
  1,
  'Dependency Injection in Practice',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dependency Injection in Practice</title>
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
  <h1>Dependency Injection in Practice</h1>
  <p>Dependency injection (DI) is a delivery mechanism: instead of a class constructing its collaborators, they are passed in from outside. The class describes what it needs, and a composition root builds the graph.</p>
  <h2>Constructor injection, the default</h2>
  <pre class="code-block">class OrderProcessor {
  private final OrderValidator v;
  private final PriceCalculator c;
  private final OrderRepository r;
  private final OrderNotifier n;

  OrderProcessor(OrderValidator v, PriceCalculator c,
                 OrderRepository r, OrderNotifier n) {
    this.v = v; this.c = c; this.r = r; this.n = n;
  }

  void process(Order o) {
    v.validate(o); c.priceOf(o); r.save(o); n.confirm(o);
  }
}</pre>
  <p>The constructor states the class dependencies loudly — impossible to miss, and easy to fake in tests.</p>
  <h2>The composition root</h2>
  <pre class="code-block">OrderProcessor buildRoot() {
  return new OrderProcessor(
    new OrderValidator(),
    new PriceCalculator(),
    new MySqlOrderRepository(connect()),
    new OrderNotifier(new SmtpMailer())
  );
}</pre>
  <p>Wiring happens once, near the entry point, not spread across a dozen classes that each reach for their own <span class="ic">new</span>.</p>
  <h2>Anti-patterns to avoid</h2>
  <ul>
    <li>Grabbing dependencies from a global service locator inside every method.</li>
    <li>Property or field injection as the default — dependencies become hidden and optional.</li>
    <li>Building a <span class="ic">new</span> for every call deep inside a hot loop.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Containers are optional</strong>
    <h2>Lifetimes</h2>
  <ul>
    <li>Singleton — one instance for the whole process.</li>
    <li>Scoped — one instance per request or transaction.</li>
    <li>Transient — a fresh instance per resolution.</li>
  </ul>
  <p>Choose the smallest scope that is safe. A singleton that hoards per-request state is a class of bug that DI makes easy to fall into.</p>
  <div class="callout">
    <strong>Detect wiring errors early</strong>
    <p>Fail fast at the composition root — a loud construction error that names the missing dependency beats a stack trace from deep inside a request.</p>
  </div>
    <p>A few lines of hand-written wiring beat a heavy framework when your dependency graph is small. Reach for a container when the graph grows or you need scoped lifetimes.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02100000-0000-4000-8000-000000000419',
  '02100000-0000-4000-8000-000000000319',
  1,
  'Writing Tests for SOLID Code',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Writing Tests for SOLID Code</title>
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
  <h1>Writing Tests for SOLID Code</h1>
  <p>Tests never prove that code is perfectly designed, but they are the <strong>safety net</strong> that makes refactoring possible. You can only restructure fearlessly when a suite pins the current behavior down.</p>
  <h2>Arrange, Act, Assert</h2>
  <pre class="code-block">@Test
void loyaltyCustomerPaysNinetyPercent() {
  // Arrange
  DiscountStrategy s = new LoyaltyDiscount();
  Order order = new Order(100);
  // Act
  double total = s.apply(order);
  // Assert
  assertEquals(90.0, total, 0.01);
}</pre>
  <h2>What SOLID buys you in tests</h2>
  <table>
    <tr><th>Principle</th><th>Testing payoff</th></tr>
    <tr><td>SRP</td><td>A unit to test is small and has one behavior.</td></tr>
    <tr><td>OCP</td><td>New cases are new tests, not rewrites.</td></tr>
    <tr><td>LSP</td><td>One contract suite validates every subtype.</td></tr>
    <tr><td>ISP</td><td>Fakes implement only the role a test needs.</td></tr>
    <tr><td>DIP</td><td>Inject fakes; no database or mail server required.</td></tr>
  </table>
  <h2>Fakes, stubs, mocks</h2>
  <pre class="code-block">class InMemoryOrderRepository implements OrderRepository {
  private final Map&lt;Long, Order&gt; store = new HashMap();
  public void save(Order o) { store.put(o.id(), o); }
}</pre>
  <p>A fake implements the same interface with in-memory behavior, so the test runs fast, deterministically, and offline.</p>
  <div class="callout callout-tip">
    <strong>Test behavior, not a mock theatre</strong>
    <h2>Characterisation tests</h2>
  <p>Legacy code has no tests. Characterisation tests capture behavior exactly as it exists today — even the parts you suspect are bugs — so refactoring changes structure without silently changing output. Write them before you touch a line you cannot yet explain.</p>
    <p>Prefer small fakes and real assertions over mocks that verify five internal calls. A test that only cares how the class was wired becomes a suit of armour that resists every change.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02100000-0000-4000-8000-000000000420',
  '02100000-0000-4000-8000-000000000320',
  1,
  'Refactoring Toward SOLID',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Refactoring Toward SOLID</title>
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
  <h1>Refactoring Toward SOLID</h1>
  <p>Refactoring is <strong>restructuring without changing behavior</strong>. It is the engine that moves code toward SOLID — and the test suite is the crankshaft that keeps it from exploding.</p>
  <h2>The safe loop</h2>
  <ol>
    <li>Get to a green test baseline for the area you will touch.</li>
    <li>Pick the single smell you want to eliminate.</li>
    <li>Take the smallest possible step (extract one method or class).</li>
    <li>Run the tests. Fix nothing else in the same step.</li>
  </ol>
  <h2>Extract Method first</h2>
  <pre class="code-block">// before: one long method
void checkOut(Cart cart, Customer customer) {
  double total = 0;
  for (LineItem item : cart.items) total += item.price() * item.qty();
  total = applyMemberRate(total, customer);
  repo.save(new Order(customer, total));
}

// after
void checkOut(Cart cart, Customer customer) {
  double total = totalFor(cart);
  repo.save(new Order(customer, applyMemberRate(total, customer)));
}
double totalFor(Cart cart) {
  double total = 0;
  for (LineItem item : cart.items) total += item.price() * item.qty();
  return total;
}</pre>
  <h2>Classic moves toward SOLID</h2>
  <ul>
    <li><strong>Extract Class</strong> — split responsibilities (SRP).</li>
    <li><strong>Introduce Interface</strong> — name the seam a client needs (ISP, DIP).</li>
    <li><strong>Replace Conditional with Polymorphism</strong> — open the module (OCP).</li>
    <li><strong>Pull Up Contract</strong> — move rules to the base so subtypes honour them (LSP).</li>
  </ul>
  <div class="callout callout-tip">
    <strong>One step, one reason</strong>
    <h2>When not to refactor</h2>
  <p>Do not refactor a module you will rewrite, a spike you will delete, or a stable boundary the whole company depends on without an upgrade plan. Refactoring pays only when the code will live long enough to justify it.</p>
  <div class="callout callout-tip">
    <strong>The one-sentence rule</strong>
    <p>If you cannot describe a step in one sentence, it is too big to be safe. Split it until you can.</p>
  </div>
    <p>If a step changes behavior, it is not refactoring — it is a feature, and it deserves its own test and its own review.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02100000-0000-4000-8000-000000000422',
  '02100000-0000-4000-8000-000000000322',
  1,
  'When SOLID Goes Wrong',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>When SOLID Goes Wrong</title>
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
  <h1>When SOLID Goes Wrong</h1>
  <p>Principles describe healthy code, but they are also popular with their own failure mode: <strong>over-engineering dressed as purity</strong>. The cure is to notice the cost, not just the badge.</p>
  <h2>Symptoms of over-abstraction</h2>
  <ul>
    <li>An interface with exactly one implementation and no second consumer in sight.</li>
    <li>Chains of indirection: a call flows through six wrappers before doing anything.</li>
    <li>Factories that return a class that could simply have been <span class="ic">new</span>.</li>
    <li>&ldquo;Dependency injection&rdquo; used as an excuse to inject everything, everywhere.</li>
    <li>Comments explaining why a layer exists, because the code no longer does.</li>
  </ul>
  <h2>Why it happens</h2>
  <p>Speculative generality is the big one: abstractions built for features that never arrive. The abstraction then taxes <em>every</em> future change for a benefit that never materialised — YAGNI (you ain&rsquo;t gonna need it) is the antidote.</p>
  <table>
    <tr><th>Abstraction</th><th>Annual cost</th></tr>
    <tr><td>Every read becomes a method hop</td><td>Read tax on every visit</td></tr>
    <tr><td>Configuration keys for guessed options</td><td>Dead decisions to maintain</td></tr>
    <tr><td>One extra layer per repository</td><td>One more file per concept, forever</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Abstractions must pay rent</strong>
    <h2>Which layer to delete first</h2>
  <p>Start with the layers that exist for decoration: wrappers that add nothing, factories whose output is always the same class, and configuration keys nobody reads. Remove one layer per week and watch the diffs shrink.</p>
  <div class="callout callout-info">
    <strong>Ask who pays</strong>
    <p>Every abstraction introduces a tax paid by every reader. Charge it against a concrete, current burden — never against a hypothetical backlog item.</p>
  </div>
    <p>Ask: does this abstraction remove more change-cost than it adds? If the rent is due but the income never arrives, delete the layer.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02100000-0000-4000-8000-000000000423',
  '02100000-0000-4000-8000-000000000323',
  1,
  'Balancing Principles with Pragmatism',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Balancing Principles with Pragmatism</title>
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
  <h1>Balancing Principles with Pragmatism</h1>
  <p>SOLID is a tool kit, not a religion. Skilled engineers apply principles in proportion to risk — and routinely skip them where risk is low.</p>
  <h2>When to relax</h2>
  <ul>
    <li>A prototype you will throw away — structure that exists only to be deleted is waste.</li>
    <li>A tiny, stable leaf module nobody can break by accident.</li>
    <li>A one-off script: one user, one reason to change, zero consumers.</li>
    <li>A spike inside a careful architecture — isolated and marked as temporary.</li>
  </ul>
  <h2>Ask the right questions</h2>
  <table>
    <tr><th>Question</th><th>Implication</th></tr>
    <tr><td>How often will this change?</td><td>Rarely changing code needs fewer seams.</td></tr>
    <tr><td>How many consumers rely on it?</td><td>One consumer = simpler contract.</td></tr>
    <tr><td>What does a break cost?</td><td>High blast radius demands more care.</td></tr>
    <tr><td>Can I defer this decision?</td><td>If yes, keep it concrete today.</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Delay the seam until it pays</strong>
    <p>Concrete code is simpler and cheaper to read. Introduce the abstraction the moment — and not before — the second variant or consumer appears.</p>
  </div>
  <div class="callout callout-info">
    <strong>Consistency beats isolated purity</strong>
    <div class="callout callout-tip">
    <strong>Ship the principle, not the poster</strong>
    <p>Reviewers care about whether a change made the system cheaper to evolve, not whether it quotes the five letters. Judge every refactor by its effect on real change-cost.</p>
  </div>
    <p>A pragmatic convention applied the same way by the whole team outlives a purer design that only one person can navigate.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02100000-0000-4000-8000-000000000425',
  '02100000-0000-4000-8000-000000000325',
  1,
  'Capstone: Auditing the Legacy Codebase',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Auditing the Legacy Codebase</title>
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
  <h1>Capstone: Auditing the Legacy Codebase</h1>
  <p>The capstone: a legacy <span class="ic">OrderProcessor</span> inside an <span class="ic">orders</span> package has been running in production for three years. It grew, it works, and nobody dares touch it. Your job is to refactor it toward SOLID behind tests.</p>
  <h2>The codebase</h2>
  <pre class="code-block">orders/
  Order.java
  OrderProcessor.java   // the god class — 900 lines
  OrderStatus.java
  Discounts.java
  PricingEngine.java    // entangled with the processor
  EmailSender.java      // hard-wired to SMTP
  OrderQueries.java     // inline SQL
  OrderTest.java        // 3 slow tests, hits a real database</pre>
  <h2>Symptom checklist</h2>
  <table>
    <tr><th>Symptom</th><th>Nearby principle</th></tr>
    <tr><td>Validation, pricing, SQL, email in one class</td><td>SRP</td></tr>
    <tr><td>New promo means editing the processor if/else</td><td>OCP</td></tr>
    <tr><td>A subclass that throws for base-contract calls</td><td>LSP</td></tr>
    <tr><td>One giant service interface used by every client</td><td>ISP</td></tr>
    <tr><td>Classes construct their own databases and mailers</td><td>DIP</td></tr>
  </table>
  <h2>First pass: just look</h2>
  <ol>
    <li>Read <span class="ic">OrderProcessor</span> and list every responsibility you find.</li>
    <li>Run the three existing tests; note what they cover and how slow they are.</li>
    <li>Map each responsibility to a potential collaborator name.</li>
    <li>Write down every place a <span class="ic">new</span> reaches for infrastructure.</li>
  </ol>
  <div class="callout callout-info">
    <strong>No code changes yet</strong>
    <h2>Prioritise by blast radius</h2>
  <p>Order the work by how much risk each smell concentrates: the class at the center of every story first, then the interfaces every client depends on, then the wiring. A smell that only one screen feels can wait.</p>
    <p>The audit is a map. The next lesson turns that map into a migration plan.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02100000-0000-4000-8000-000000000426',
  '02100000-0000-4000-8000-000000000326',
  1,
  'Capstone: Planning the Refactor',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Planning the Refactor</title>
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
  <h1>Capstone: Planning the Refactor</h1>
  <p>The target architecture keeps <span class="ic">OrderProcessor</span> as a thin orchestrator, with every responsibility extracted to a focused collaborator and every infrastructure dependency injected from a composition root.</p>
  <h2>Target structure</h2>
  <pre class="code-block">orders/
  Order.java
  OrderStatus.java
  OrderValidator.java        // pure rules, no I/O
  PricingEngine.java          // discounts as strategies
  OrderRepository.java        // interface, owned by policy
  MySqlOrderRepository.java   // implementation detail
  OrderNotifier.java          // interface
  SmtpOrderNotifier.java      // implementation detail
  OrderProcessor.java         // thin orchestrator
  CompositionRoot.java        // wires the graph once</pre>
  <h2>The migration steps</h2>
  <ol>
    <li>Add characterization tests that pin current behavior (including a fake repository).</li>
    <li>Extract <span class="ic">OrderValidator</span> and route calls through it.</li>
    <li>Extract pricing and discounts; introduce a <span class="ic">DiscountStrategy</span> seam.</li>
    <li>Introduce <span class="ic">OrderRepository</span> and <span class="ic">OrderNotifier</span> interfaces.</li>
    <li>Move construction into <span class="ic">CompositionRoot</span>; constructor-inject every collaborator.</li>
    <li>Delete dead code and unused imports until the processor reads like a checklist.</li>
  </ol>
  <h2>Definition of done</h2>
  <ul>
    <li>External behavior identical; the slow integration tests still pass.</li>
    <li>A new fast suite covers every extracted unit without infrastructure.</li>
    <li>Adding a new discount type is one new class, zero edits to the processor.</li>
    <li>Each step is a separate, green, reviewable commit.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Plan backwards from the seams</strong>
    <div class="callout callout-info">
    <strong>Estimate in steps, not classes</strong>
    <p>A refactor plan is a sequence of green commits. If you cannot name the exact next step, the plan is not ready — go back to the audit until you can.</p>
  </div>
    <p>Start from the interfaces you want to see, and let each step create exactly one of them.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02100000-0000-4000-8000-000000000427',
  '02100000-0000-4000-8000-000000000327',
  1,
  'Capstone: Refactoring & Verification',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Refactoring & Verification</title>
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
  <h1>Capstone: Refactoring &amp; Verification</h1>
  <p>Execution is deliberately boring: one extraction, run the tests, commit. Boredom is the point — predictable steps with a green suite is how dangerous refactors survive contact with production code.</p>
  <h2>One extraction at a time</h2>
  <pre class="code-block">// Step 1 — pull validation out
class OrderValidator {
  void validate(Order o) {
    if (o.items().isEmpty()) throw new EmptyOrder();
    if (o.customer().isBlacklisted()) throw new BlockedCustomer();
  }
}

// Step 3 — the discount seam
interface DiscountStrategy { double apply(double base); }
class NoDiscountStrategy implements DiscountStrategy {
  public double apply(double base) { return base; }
}
class MemberDiscountStrategy implements DiscountStrategy {
  public double apply(double base) { return base * 0.9; }
}</pre>
  <h2>Verification loop</h2>
  <ol>
    <li>Run the full suite — fast unit tests and the slow integration tests.</li>
    <li>Diff each commit so it contains only the intended move.</li>
    <li>After modules 1-2, recount how many responsibilities remain in the processor.</li>
    <li>Smoke-test a real order through the recomposed root at least once.</li>
  </ol>
  <h2>The payoff: a new feature</h2>
  <p>Now marketing asks for a <span class="ic">SeasonalDiscount</span>. Because OCP did its job, the change is one new class registered in <span class="ic">CompositionRoot</span> — the processor, the engine, and the existing discount tests stay untouched.</p>
  <pre class="code-block">class SeasonalDiscount implements DiscountStrategy {
  private final double rate;
  SeasonalDiscount(double rate) { this.rate = rate; }
  public double apply(double base) { return base * rate; }
}</pre>
  <div class="callout callout-tip">
    <strong>Small green commits compound</strong>
    <div class="callout callout-info">
    <strong>Measure the result</strong>
    <p>Compare before and after: lines in the processor, test runtime, number of tests touching infrastructure. A refactor you cannot quantify is a refactor you cannot defend.</p>
  </div>
    <p>Twenty green steps you understand beat one heroic merge you hope survived. The final assessment will check that you can explain each step you took.</p>
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
  ('02100000-0000-4000-8000-000000000501', '02100000-0000-4000-8000-000000000303',
   'Which word best describes what the acronym SOLID represents?',
   'SOLID groups five design principles for object-oriented code: SRP, OCP, LSP, ISP, DIP.', 1),
  ('02100000-0000-4000-8000-000000000502', '02100000-0000-4000-8000-000000000303',
   'What does high cohesion within a single class mean?',
   'High cohesion means members serve one clear, related purpose.', 2),
  ('02100000-0000-4000-8000-000000000503', '02100000-0000-4000-8000-000000000303',
   'Which situation best matches tight coupling?',
   'Tight coupling shows up as a change ripple: edit one class and many others break.', 3),
  ('02100000-0000-4000-8000-000000000504', '02100000-0000-4000-8000-000000000306',
   'The Single Responsibility Principle states that a class should have...',
   'SRP: a class should have one reason to change, typically one actor.', 1),
  ('02100000-0000-4000-8000-000000000505', '02100000-0000-4000-8000-000000000306',
   'A class that validates, saves to a database, and emails customers violates which principle first?',
   'Three actors (validation, storage, notifications) in one class violate SRP first.', 2),
  ('02100000-0000-4000-8000-000000000506', '02100000-0000-4000-8000-000000000306',
   'Which signal strongly suggests an SRP violation?',
   'Disjoint member groups mean multiple responsibilities share a single class.', 3),
  ('02100000-0000-4000-8000-000000000507', '02100000-0000-4000-8000-000000000309',
   'A module is open for extension and closed for modification when...',
   'Closed to modification means new behavior arrives as new code, not edits to verified code.', 1),
  ('02100000-0000-4000-8000-000000000508', '02100000-0000-4000-8000-000000000309',
   'Which change best satisfies OCP when adding a triangle renderer?',
   'Adding a class that implements the existing interface needs no edits to existing code.', 2),
  ('02100000-0000-4000-8000-000000000509', '02100000-0000-4000-8000-000000000309',
   'The Strategy pattern helps you apply OCP by...',
   'Strategy lets the client choose behavior through an interface, keeping it closed.', 3),
  ('02100000-0000-4000-8000-000000000510', '02100000-0000-4000-8000-000000000312',
   'Liskov Substitution says a derived class may replace its base class when...',
   'Substitutability means callers relying on the base contract observe the same behavior.', 1),
  ('02100000-0000-4000-8000-000000000511', '02100000-0000-4000-8000-000000000312',
   'Why does the Rectangle/Square example break substitution?',
   'Square redefines setWidth/setHeight in a way the base contract never promised.', 2),
  ('02100000-0000-4000-8000-000000000512', '02100000-0000-4000-8000-000000000312',
   'Which subtype behavior most clearly violates LSP?',
   'Raising errors for accepted inputs breaks the contract the base class established.', 3),
  ('02100000-0000-4000-8000-000000000513', '02100000-0000-4000-8000-000000000315',
   'Interface Segregation means a client should not...',
   'ISP: dependencies should only cover the methods a client actually invokes.', 1),
  ('02100000-0000-4000-8000-000000000514', '02100000-0000-4000-8000-000000000315',
   'A fat interface usually forces implementors to...',
   'Fat interfaces push implementors toward empty stubs and NotSupported exceptions.', 2),
  ('02100000-0000-4000-8000-000000000515', '02100000-0000-4000-8000-000000000315',
   'Role interfaces are designed...',
   'Role interfaces match the shape of a single consumer need.', 3),
  ('02100000-0000-4000-8000-000000000516', '02100000-0000-4000-8000-000000000318',
   'DIP says high-level modules should depend on...',
   'High-level policy should depend on abstractions, with details depending backwards.', 1),
  ('02100000-0000-4000-8000-000000000517', '02100000-0000-4000-8000-000000000318',
   'Dependency injection is best described as...',
   'DI is the delivery mechanism: collaborators are supplied from outside.', 2),
  ('02100000-0000-4000-8000-000000000518', '02100000-0000-4000-8000-000000000318',
   'The composition root is the place where...',
   'The composition root builds the object graph once at the entry point.', 3),
  ('02100000-0000-4000-8000-000000000519', '02100000-0000-4000-8000-000000000321',
   'Why does arrangement come first in a test?',
   'Arrange establishes the preconditions so the Act step is meaningful.', 1),
  ('02100000-0000-4000-8000-000000000520', '02100000-0000-4000-8000-000000000321',
   'A fake or mock dependency in a unit test...',
   'Fakes and mocks replace infrastructure, making tests fast and deterministic.', 2),
  ('02100000-0000-4000-8000-000000000521', '02100000-0000-4000-8000-000000000321',
   'Safe refactoring is defined by...',
   'Refactoring only counts when observable behavior is preserved and tests stay green.', 3),
  ('02100000-0000-4000-8000-000000000522', '02100000-0000-4000-8000-000000000324',
   'Speculative generality means...',
   'Speculative generality is invention for hypothetical needs — YAGNI territory.', 1),
  ('02100000-0000-4000-8000-000000000523', '02100000-0000-4000-8000-000000000324',
   'Which situation most suggests over-engineering?',
   'Abstractions with one implementation and no second consumer rarely pay rent.', 2),
  ('02100000-0000-4000-8000-000000000524', '02100000-0000-4000-8000-000000000324',
   'Applying a principle pragmatically means...',
   'Pragmatism weighs real cost and risk before applying any principle.', 3),
  ('02100000-0000-4000-8000-000000000525', '02100000-0000-4000-8000-000000000328',
   'Which principle is concerned with a single reason to change?',
   'SRP is about the single reason to change.', 1),
  ('02100000-0000-4000-8000-000000000526', '02100000-0000-4000-8000-000000000328',
   'Adding a new report type with a new class, without editing the reporting engine, demonstrates...',
   'Adding behavior without editing existing code is the Open/Closed Principle in action.', 2),
  ('02100000-0000-4000-8000-000000000527', '02100000-0000-4000-8000-000000000328',
   'A subclass that raises errors for valid base-class inputs breaks...',
   'Throwing on valid base inputs breaks substitutability, the heart of LSP.', 3),
  ('02100000-0000-4000-8000-000000000528', '02100000-0000-4000-8000-000000000328',
   'Splitting one monolithic worker interface into separate roles applies...',
   'Splitting a fat interface into consumer roles is Interface Segregation.', 4),
  ('02100000-0000-4000-8000-000000000529', '02100000-0000-4000-8000-000000000328',
   'Which statement about DIP is true?',
   'DIP prefers abstractions owned by high-level policy over concrete low-level details.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): SOLID meaning
  ('02100000-0000-4000-8000-000000001001', '02100000-0000-4000-8000-000000000501', 'A set of five design principles for object-oriented code', TRUE,  1),
  ('02100000-0000-4000-8000-000000001002', '02100000-0000-4000-8000-000000000501', 'A database schema dialect', FALSE, 2),
  ('02100000-0000-4000-8000-000000001003', '02100000-0000-4000-8000-000000000501', 'A JavaScript framework', FALSE, 3),
  ('02100000-0000-4000-8000-000000001004', '02100000-0000-4000-8000-000000000501', 'An Agile ceremony', FALSE, 4),
  -- Q1 (501)q2: high cohesion
  ('02100000-0000-4000-8000-000000001005', '02100000-0000-4000-8000-000000000502', 'It exposes as many public methods as possible', FALSE, 1),
  ('02100000-0000-4000-8000-000000001006', '02100000-0000-4000-8000-000000000502', 'Its members are closely related and work toward one purpose', TRUE,  2),
  ('02100000-0000-4000-8000-000000001007', '02100000-0000-4000-8000-000000000502', 'It references many external classes', FALSE, 3),
  ('02100000-0000-4000-8000-000000001008', '02100000-0000-4000-8000-000000000502', 'Every method is static', FALSE, 4),
  -- Q1 (501)q3: tight coupling
  ('02100000-0000-4000-8000-000000001009', '02100000-0000-4000-8000-000000000503', 'Classes are independent of each other', FALSE, 1),
  ('02100000-0000-4000-8000-000000001010', '02100000-0000-4000-8000-000000000503', 'Tests run quickly and deterministically', FALSE, 2),
  ('02100000-0000-4000-8000-000000001011', '02100000-0000-4000-8000-000000000503', 'Modules have no imports at all', FALSE, 3),
  ('02100000-0000-4000-8000-000000001012', '02100000-0000-4000-8000-000000000503', 'A change in one class forces changes in many others', TRUE,  4),
  -- Q2 (504): SRP definition
  ('02100000-0000-4000-8000-000000001013', '02100000-0000-4000-8000-000000000504', 'At least ten public methods', FALSE, 1),
  ('02100000-0000-4000-8000-000000001014', '02100000-0000-4000-8000-000000000504', 'One method per field', FALSE, 2),
  ('02100000-0000-4000-8000-000000001015', '02100000-0000-4000-8000-000000000504', 'Exactly one reason to change', TRUE,  3),
  ('02100000-0000-4000-8000-000000001016', '02100000-0000-4000-8000-000000000504', 'No dependencies at all', FALSE, 4),
  -- Q2 (504)q2: which principle first
  ('02100000-0000-4000-8000-000000001017', '02100000-0000-4000-8000-000000000505', 'Single Responsibility', TRUE,  1),
  ('02100000-0000-4000-8000-000000001018', '02100000-0000-4000-8000-000000000505', 'Liskov Substitution', FALSE, 2),
  ('02100000-0000-4000-8000-000000001019', '02100000-0000-4000-8000-000000000505', 'Open/Closed', FALSE, 3),
  ('02100000-0000-4000-8000-000000001020', '02100000-0000-4000-8000-000000000505', 'Interface Segregation', FALSE, 4),
  -- Q2 (504)q3: SRP signal
  ('02100000-0000-4000-8000-000000001021', '02100000-0000-4000-8000-000000000506', 'The class has a short, noun-like name', FALSE, 1),
  ('02100000-0000-4000-8000-000000001022', '02100000-0000-4000-8000-000000000506', 'Widely separated groups of methods that use disjoint fields', TRUE,  2),
  ('02100000-0000-4000-8000-000000001023', '02100000-0000-4000-8000-000000000506', 'The class implements exactly one interface', FALSE, 3),
  ('02100000-0000-4000-8000-000000001024', '02100000-0000-4000-8000-000000000506', 'All public methods return void', FALSE, 4),
  -- Q3 (507): OCP definition
  ('02100000-0000-4000-8000-000000001025', '02100000-0000-4000-8000-000000000507', 'You can edit its private methods freely', FALSE, 1),
  ('02100000-0000-4000-8000-000000001026', '02100000-0000-4000-8000-000000000507', 'Its classes are all declared final', FALSE, 2),
  ('02100000-0000-4000-8000-000000001027', '02100000-0000-4000-8000-000000000507', 'You can add behavior with new code instead of editing verified code', TRUE,  3),
  ('02100000-0000-4000-8000-000000001028', '02100000-0000-4000-8000-000000000507', 'It has one long inheritance chain', FALSE, 4),
  -- Q3 (507)q2: adding triangle
  ('02100000-0000-4000-8000-000000001029', '02100000-0000-4000-8000-000000000508', 'Add a Triangle class that implements an existing Shape interface', TRUE,  1),
  ('02100000-0000-4000-8000-000000001030', '02100000-0000-4000-8000-000000000508', 'Add another if/else branch to the renderer', FALSE, 2),
  ('02100000-0000-4000-8000-000000001031', '02100000-0000-4000-8000-000000000508', 'Duplicate the renderer for triangles', FALSE, 3),
  ('02100000-0000-4000-8000-000000001032', '02100000-0000-4000-8000-000000000508', 'Change the Shape interface signature', FALSE, 4),
  -- Q3 (507)q3: strategy
  ('02100000-0000-4000-8000-000000001033', '02100000-0000-4000-8000-000000000509', 'Removing all interfaces from the codebase', FALSE, 1),
  ('02100000-0000-4000-8000-000000001034', '02100000-0000-4000-8000-000000000509', 'Letting a client swap behaviors without altering its code', TRUE,  2),
  ('02100000-0000-4000-8000-000000001035', '02100000-0000-4000-8000-000000000509', 'Locking every behavior into one class', FALSE, 3),
  ('02100000-0000-4000-8000-000000001036', '02100000-0000-4000-8000-000000000509', 'Forcing subclasses to copy logic', FALSE, 4),
  -- Q4 (510): LSP definition
  ('02100000-0000-4000-8000-000000001037', '02100000-0000-4000-8000-000000000510', 'The derived class has a different name', FALSE, 1),
  ('02100000-0000-4000-8000-000000001038', '02100000-0000-4000-8000-000000000510', 'The derived class overrides every method', FALSE, 2),
  ('02100000-0000-4000-8000-000000001039', '02100000-0000-4000-8000-000000000510', 'Callers cannot detect the difference from the contract', TRUE,  3),
  ('02100000-0000-4000-8000-000000001040', '02100000-0000-4000-8000-000000000510', 'The base class is declared abstract', FALSE, 4),
  -- Q4 (510)q2: rectangle/square
  ('02100000-0000-4000-8000-000000001041', '02100000-0000-4000-8000-000000000511', 'Both classes rely on inheritance', FALSE, 1),
  ('02100000-0000-4000-8000-000000001042', '02100000-0000-4000-8000-000000000511', 'Rectangles keep width and height private', FALSE, 2),
  ('02100000-0000-4000-8000-000000001043', '02100000-0000-4000-8000-000000000511', 'Area is computed as a double', FALSE, 3),
  ('02100000-0000-4000-8000-000000001044', '02100000-0000-4000-8000-000000000511', 'Square changes a setter in a way the base contract does not promise', TRUE,  4),
  -- Q4 (510)q3: violating behavior
  ('02100000-0000-4000-8000-000000001045', '02100000-0000-4000-8000-000000000512', 'Throwing an exception for an input the base contract accepts', TRUE,  1),
  ('02100000-0000-4000-8000-000000001046', '02100000-0000-4000-8000-000000000512', 'Adding a new private helper method', FALSE, 2),
  ('02100000-0000-4000-8000-000000001047', '02100000-0000-4000-8000-000000000512', 'Implementing an additional interface', FALSE, 3),
  ('02100000-0000-4000-8000-000000001048', '02100000-0000-4000-8000-000000000512', 'Using composition internally for one feature', FALSE, 4),
  -- Q5 (513): ISP definition
  ('02100000-0000-4000-8000-000000001049', '02100000-0000-4000-8000-000000000513', 'Depend on abstract classes instead', FALSE, 1),
  ('02100000-0000-4000-8000-000000001050', '02100000-0000-4000-8000-000000000513', 'Depend on methods it never calls', TRUE,  2),
  ('02100000-0000-4000-8000-000000001051', '02100000-0000-4000-8000-000000000513', 'Implement more than one interface', FALSE, 3),
  ('02100000-0000-4000-8000-000000001052', '02100000-0000-4000-8000-000000000513', 'Use constructor injection', FALSE, 4),
  -- Q5 (513)q2: fat interface
  ('02100000-0000-4000-8000-000000001053', '02100000-0000-4000-8000-000000000514', 'Write only pure functions', FALSE, 1),
  ('02100000-0000-4000-8000-000000001054', '02100000-0000-4000-8000-000000000514', 'Use composition over inheritance', FALSE, 2),
  ('02100000-0000-4000-8000-000000001055', '02100000-0000-4000-8000-000000000514', 'Provide empty stubs or throw NotSupported exceptions', TRUE,  3),
  ('02100000-0000-4000-8000-000000001056', '02100000-0000-4000-8000-000000000514', 'Remove all abstract methods', FALSE, 4),
  -- Q5 (513)q3: role interfaces
  ('02100000-0000-4000-8000-000000001057', '02100000-0000-4000-8000-000000000515', 'To be as broad as every possible client', FALSE, 1),
  ('02100000-0000-4000-8000-000000001058', '02100000-0000-4000-8000-000000000515', 'For generic serialize-everything services', FALSE, 2),
  ('02100000-0000-4000-8000-000000001059', '02100000-0000-4000-8000-000000000515', 'To replace classes entirely', FALSE, 3),
  ('02100000-0000-4000-8000-000000001060', '02100000-0000-4000-8000-000000000515', 'Around a distinct consumer role instead of one mega-contract', TRUE,  4),
  -- Q6 (516): DIP definition
  ('02100000-0000-4000-8000-000000001061', '02100000-0000-4000-8000-000000000516', 'Abstractions, not low-level concrete details', TRUE,  1),
  ('02100000-0000-4000-8000-000000001062', '02100000-0000-4000-8000-000000000516', 'The lowest-level utility class available', FALSE, 2),
  ('02100000-0000-4000-8000-000000001063', '02100000-0000-4000-8000-000000000516', 'Nothing at all in any layer', FALSE, 3),
  ('02100000-0000-4000-8000-000000001064', '02100000-0000-4000-8000-000000000516', 'Global singletons for every service', FALSE, 4),
  -- Q6 (516)q2: DI description
  ('02100000-0000-4000-8000-000000001065', '02100000-0000-4000-8000-000000000517', 'Hiding dependencies inside global state', FALSE, 1),
  ('02100000-0000-4000-8000-000000001066', '02100000-0000-4000-8000-000000000517', 'Supplying dependencies to an object from the outside', TRUE,  2),
  ('02100000-0000-4000-8000-000000001067', '02100000-0000-4000-8000-000000000517', 'A database migration tool', FALSE, 3),
  ('02100000-0000-4000-8000-000000001068', '02100000-0000-4000-8000-000000000517', 'An alternative to interfaces', FALSE, 4),
  -- Q6 (516)q3: composition root
  ('02100000-0000-4000-8000-000000001069', '02100000-0000-4000-8000-000000000518', 'Where private methods are kept', FALSE, 1),
  ('02100000-0000-4000-8000-000000001070', '02100000-0000-4000-8000-000000000518', 'Where SQL queries are written', FALSE, 2),
  ('02100000-0000-4000-8000-000000001071', '02100000-0000-4000-8000-000000000518', 'Where the object graph is wired together once', TRUE,  3),
  ('02100000-0000-4000-8000-000000001072', '02100000-0000-4000-8000-000000000518', 'Where only the database connection starts', FALSE, 4),
  -- Q7 (519): arrange first
  ('02100000-0000-4000-8000-000000001073', '02100000-0000-4000-8000-000000000519', 'To write the assertion as early as possible', FALSE, 1),
  ('02100000-0000-4000-8000-000000001074', '02100000-0000-4000-8000-000000000519', 'To run production code before the suite starts', FALSE, 2),
  ('02100000-0000-4000-8000-000000001075', '02100000-0000-4000-8000-000000000519', 'To skip environment setup entirely', FALSE, 3),
  ('02100000-0000-4000-8000-000000001076', '02100000-0000-4000-8000-000000000519', 'To establish the conditions the behavior depends on', TRUE,  4),
  -- Q7 (519)q2: fakes and mocks
  ('02100000-0000-4000-8000-000000001077', '02100000-0000-4000-8000-000000000520', 'Controls and observes interactions without real infrastructure', TRUE,  1),
  ('02100000-0000-4000-8000-000000001078', '02100000-0000-4000-8000-000000000520', 'Always starts a real database', FALSE, 2),
  ('02100000-0000-4000-8000-000000001079', '02100000-0000-4000-8000-000000000520', 'Replaces the test runner', FALSE, 3),
  ('02100000-0000-4000-8000-000000001080', '02100000-0000-4000-8000-000000000520', 'Deletes production code automatically', FALSE, 4),
  -- Q7 (519)q3: safe refactor
  ('02100000-0000-4000-8000-000000001081', '02100000-0000-4000-8000-000000000521', 'Rewriting the module from scratch each time', FALSE, 1),
  ('02100000-0000-4000-8000-000000001082', '02100000-0000-4000-8000-000000000521', 'Changes that preserve observable behavior under a passing suite', TRUE,  2),
  ('02100000-0000-4000-8000-000000001083', '02100000-0000-4000-8000-000000000521', 'Editing source without compiling', FALSE, 3),
  ('02100000-0000-4000-8000-000000001084', '02100000-0000-4000-8000-000000000521', 'Removing tests before restructuring', FALSE, 4),
  -- Q8 (522): speculative generality
  ('02100000-0000-4000-8000-000000001085', '02100000-0000-4000-8000-000000000522', 'Testing features before coding them', FALSE, 1),
  ('02100000-0000-4000-8000-000000001086', '02100000-0000-4000-8000-000000000522', 'Writing one test per public method', FALSE, 2),
  ('02100000-0000-4000-8000-000000001087', '02100000-0000-4000-8000-000000000522', 'Building abstractions for features that may never arrive', TRUE,  3),
  ('02100000-0000-4000-8000-000000001088', '02100000-0000-4000-8000-000000000522', 'Estimating story points for a sprint', FALSE, 4),
  -- Q8 (522)q2: over-engineering
  ('02100000-0000-4000-8000-000000001089', '02100000-0000-4000-8000-000000000523', 'A class with twelve small methods', FALSE, 1),
  ('02100000-0000-4000-8000-000000001090', '02100000-0000-4000-8000-000000000523', 'A test for every behavior', FALSE, 2),
  ('02100000-0000-4000-8000-000000001091', '02100000-0000-4000-8000-000000000523', 'A constructor with two injected dependencies', FALSE, 3),
  ('02100000-0000-4000-8000-000000001092', '02100000-0000-4000-8000-000000000523', 'A one-implementation interface with no second consumer in view', TRUE,  4),
  -- Q8 (522)q3: pragmatism
  ('02100000-0000-4000-8000-000000001093', '02100000-0000-4000-8000-000000000524', 'Using it where it reduces measurable cost and risk', TRUE,  1),
  ('02100000-0000-4000-8000-000000001094', '02100000-0000-4000-8000-000000000524', 'Applying all five principles everywhere, always', FALSE, 2),
  ('02100000-0000-4000-8000-000000001095', '02100000-0000-4000-8000-000000000524', 'Never using inheritance in any codebase', FALSE, 3),
  ('02100000-0000-4000-8000-000000001096', '02100000-0000-4000-8000-000000000524', 'Deleting every interface at the end of the year', FALSE, 4),
  -- Q9 (525): single reason to change
  ('02100000-0000-4000-8000-000000001097', '02100000-0000-4000-8000-000000000525', 'Open/Closed', FALSE, 1),
  ('02100000-0000-4000-8000-000000001098', '02100000-0000-4000-8000-000000000525', 'Single Responsibility', TRUE,  2),
  ('02100000-0000-4000-8000-000000001099', '02100000-0000-4000-8000-000000000525', 'Liskov Substitution', FALSE, 3),
  ('02100000-0000-4000-8000-000000001100', '02100000-0000-4000-8000-000000000525', 'Interface Segregation', FALSE, 4),
  -- Q9 (525)q2: new report type
  ('02100000-0000-4000-8000-000000001101', '02100000-0000-4000-8000-000000000526', 'Eager loading', FALSE, 1),
  ('02100000-0000-4000-8000-000000001102', '02100000-0000-4000-8000-000000000526', 'Database normalisation', FALSE, 2),
  ('02100000-0000-4000-8000-000000001103', '02100000-0000-4000-8000-000000000526', 'The Open/Closed Principle', TRUE,  3),
  ('02100000-0000-4000-8000-000000001104', '02100000-0000-4000-8000-000000000526', 'Dead code elimination', FALSE, 4),
  -- Q9 (525)q3: throwing subclass
  ('02100000-0000-4000-8000-000000001105', '02100000-0000-4000-8000-000000000527', 'The Dependency Inversion Principle', FALSE, 1),
  ('02100000-0000-4000-8000-000000001106', '02100000-0000-4000-8000-000000000527', 'Cache invalidation', FALSE, 2),
  ('02100000-0000-4000-8000-000000001107', '02100000-0000-4000-8000-000000000527', 'Single responsibility', FALSE, 3),
  ('02100000-0000-4000-8000-000000001108', '02100000-0000-4000-8000-000000000527', 'The Liskov Substitution Principle', TRUE,  4),
  -- Q9 (525)q4: splitting worker interface
  ('02100000-0000-4000-8000-000000001109', '02100000-0000-4000-8000-000000000528', 'The Interface Segregation Principle', TRUE,  1),
  ('02100000-0000-4000-8000-000000001110', '02100000-0000-4000-8000-000000000528', 'The Strategy pattern alone', FALSE, 2),
  ('02100000-0000-4000-8000-000000001111', '02100000-0000-4000-8000-000000000528', 'Iterative waterfall', FALSE, 3),
  ('02100000-0000-4000-8000-000000001112', '02100000-0000-4000-8000-000000000528', 'Database normalisation', FALSE, 4),
  -- Q9 (525)q5: DIP statement
  ('02100000-0000-4000-8000-000000001113', '02100000-0000-4000-8000-000000000529', 'Low-level classes should never implement interfaces', FALSE, 1),
  ('02100000-0000-4000-8000-000000001114', '02100000-0000-4000-8000-000000000529', 'High-level policy should own and depend on abstractions', TRUE,  2),
  ('02100000-0000-4000-8000-000000001115', '02100000-0000-4000-8000-000000000529', 'DIP forbids more than three layers of classes', FALSE, 3),
  ('02100000-0000-4000-8000-000000001116', '02100000-0000-4000-8000-000000000529', 'DIP and DI mean exactly the same thing', FALSE, 4)
ON CONFLICT (id) DO NOTHING;
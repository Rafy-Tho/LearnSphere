-- ============================================================================
-- SEED 035: Complete course — "Object-Oriented Programming"
-- ----------------------------------------------------------------------------
-- Instructor : Marcus Johnson     (10000000-0000-4000-8000-000000000002)
-- Category   : Programming Fundamentals (20000000-0000-4000-8000-000000000002)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 OOP Fundamentals           → C1 Classes & Objects · C2 Constructors & State
--   M2 Encapsulation              → C3 Encapsulation & Access · C4 Properties & Methods
--   M3 Inheritance & Polymorphism → C5 Inheritance · C6 Polymorphism & Contracts
--   M4 Design & Languages         → C7 Composition · C8 Languages & SOLID
--   M5 Capstone: Library System   → C9 Domain Modeling · C10 Build, Test & Refactor
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
  '02300000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000002',
  '20000000-0000-4000-8000-000000000002',
  'Object-Oriented Programming',
  'object-oriented-programming',
  'Design and build robust software with object-oriented programming. Master classes, objects, encapsulation, inheritance, polymorphism, composition, and solid design principles — then ship a complete library management system in Java.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  33
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('02300000-0000-4000-8000-000000000011', '02300000-0000-4000-8000-000000000001', 'Model real-world domains with classes and objects built from state and behavior.', 1),
  ('02300000-0000-4000-8000-000000000012', '02300000-0000-4000-8000-000000000001', 'Protect internal state with encapsulation and well-chosen access modifiers.',          2),
  ('02300000-0000-4000-8000-000000000013', '02300000-0000-4000-8000-000000000001', 'Reuse and extend behavior through inheritance, overriding, and polymorphism.',        3),
  ('02300000-0000-4000-8000-000000000014', '02300000-0000-4000-8000-000000000001', 'Design flexible systems by combining abstract classes, interfaces, and composition.', 4),
  ('02300000-0000-4000-8000-000000000015', '02300000-0000-4000-8000-000000000001', 'Design, build, test, and refactor a complete Java library management system.',       5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('02300000-0000-4000-8000-000000000101', '02300000-0000-4000-8000-000000000001', 1, 'OOP Fundamentals',           'Classes, objects, constructors, and the state they hold.',                       'PUBLISHED'),
  ('02300000-0000-4000-8000-000000000102', '02300000-0000-4000-8000-000000000001', 2, 'Encapsulation',              'Hide implementation details and expose safe, intentional interfaces.',           'PUBLISHED'),
  ('02300000-0000-4000-8000-000000000103', '02300000-0000-4000-8000-000000000001', 3, 'Inheritance & Polymorphism', 'Reuse behavior, override methods, and program against contracts.',               'PUBLISHED'),
  ('02300000-0000-4000-8000-000000000104', '02300000-0000-4000-8000-000000000001', 4, 'Design & Languages',         'Composition, SOLID principles, and how other languages implement OOP.',          'PUBLISHED'),
  ('02300000-0000-4000-8000-000000000105', '02300000-0000-4000-8000-000000000001', 5, 'Capstone: Library System',   'Design, build, test, and refactor a complete Java library management system.',   'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('02300000-0000-4000-8000-000000000201', '02300000-0000-4000-8000-000000000101', 1, 'Classes & Objects',          'Blueprints for state and behavior.',             'PUBLISHED'),
  ('02300000-0000-4000-8000-000000000202', '02300000-0000-4000-8000-000000000101', 2, 'Constructors & State',       'Initializing objects and managing what they hold.', 'PUBLISHED'),
  ('02300000-0000-4000-8000-000000000203', '02300000-0000-4000-8000-000000000102', 1, 'Encapsulation & Access',     'Guarding internal state with access modifiers.',  'PUBLISHED'),
  ('02300000-0000-4000-8000-000000000204', '02300000-0000-4000-8000-000000000102', 2, 'Properties & Methods',       'Safe accessors and behavior that acts on state.', 'PUBLISHED'),
  ('02300000-0000-4000-8000-000000000205', '02300000-0000-4000-8000-000000000103', 1, 'Inheritance',                'Extending classes, overriding, and super.',       'PUBLISHED'),
  ('02300000-0000-4000-8000-000000000206', '02300000-0000-4000-8000-000000000103', 2, 'Polymorphism & Contracts',   'Many forms, one interface; abstract classes and interfaces.', 'PUBLISHED'),
  ('02300000-0000-4000-8000-000000000207', '02300000-0000-4000-8000-000000000104', 1, 'Composition',                'Building objects from smaller objects.',          'PUBLISHED'),
  ('02300000-0000-4000-8000-000000000208', '02300000-0000-4000-8000-000000000104', 2, 'Languages & Design',         'Cross-language comparison and SOLID principles.', 'PUBLISHED'),
  ('02300000-0000-4000-8000-000000000209', '02300000-0000-4000-8000-000000000105', 1, 'Domain Modeling',            'Designing the library capstone.',                 'PUBLISHED'),
  ('02300000-0000-4000-8000-000000000210', '02300000-0000-4000-8000-000000000105', 2, 'Build, Test & Refactor',     'Assembling, testing, and refining the capstone.', 'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 02300000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('02300000-0000-4000-8000-000000000301', '02300000-0000-4000-8000-000000000201', 1, 'What is Object-Oriented Programming?', 'Understand the paradigm that organizes code around objects.',                  'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02300000-0000-4000-8000-000000000302', '02300000-0000-4000-8000-000000000201', 2, 'Classes and Objects',                 'Define blueprints and bring them to life as instances.',                      'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('02300000-0000-4000-8000-000000000303', '02300000-0000-4000-8000-000000000201', 3, 'Classes & Objects Quiz',              'Check your understanding of classes and objects.',                            'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02300000-0000-4000-8000-000000000304', '02300000-0000-4000-8000-000000000202', 1, 'Constructors and Object State',       'Initialize new objects and understand field defaults.',                        'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02300000-0000-4000-8000-000000000305', '02300000-0000-4000-8000-000000000202', 2, 'Fields, References, and Equality',    'Store state, share references, and compare objects correctly.',                'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('02300000-0000-4000-8000-000000000306', '02300000-0000-4000-8000-000000000202', 3, 'Constructors & State Quiz',           'Verify how objects are initialized and compared.',                             'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02300000-0000-4000-8000-000000000307', '02300000-0000-4000-8000-000000000203', 1, 'Encapsulation: Hiding Implementation', 'Bundle data and behavior; keep internals private.',                            'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02300000-0000-4000-8000-000000000308', '02300000-0000-4000-8000-000000000203', 2, 'Access Modifiers',                    'Control visibility with public, private, and protected.',                      'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02300000-0000-4000-8000-000000000309', '02300000-0000-4000-8000-000000000203', 3, 'Encapsulation Quiz',                  'Check your grasp of encapsulation and access control.',                        'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02300000-0000-4000-8000-000000000310', '02300000-0000-4000-8000-000000000204', 1, 'Properties: Getters and Setters',     'Expose safe, validated access to private state.',                              'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02300000-0000-4000-8000-000000000311', '02300000-0000-4000-8000-000000000204', 2, 'Methods: Behavior on Objects',        'Write cohesive behavior that operates on instance state.',                     'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('02300000-0000-4000-8000-000000000312', '02300000-0000-4000-8000-000000000204', 3, 'Properties & Methods Quiz',           'Verify safe accessors and object behavior.',                                   'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02300000-0000-4000-8000-000000000313', '02300000-0000-4000-8000-000000000205', 1, 'Inheritance: Extending Classes',      'Reuse and extend behavior across a hierarchy.',                                'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02300000-0000-4000-8000-000000000314', '02300000-0000-4000-8000-000000000205', 2, 'Overriding Methods and super',        'Replace inherited behavior and coordinate with the parent.',                   'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02300000-0000-4000-8000-000000000315', '02300000-0000-4000-8000-000000000205', 3, 'Inheritance Quiz',                    'Test your knowledge of inheritance and overriding.',                           'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02300000-0000-4000-8000-000000000316', '02300000-0000-4000-8000-000000000206', 1, 'Polymorphism: Many Forms, One Interface', 'Let one reference type drive many implementations.',                       'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02300000-0000-4000-8000-000000000317', '02300000-0000-4000-8000-000000000206', 2, 'Abstract Classes and Interfaces',     'Define contracts and partial implementations.',                                'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02300000-0000-4000-8000-000000000318', '02300000-0000-4000-8000-000000000206', 3, 'Polymorphism & Contracts Quiz',       'Check your polymorphic and contract-making skills.',                           'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02300000-0000-4000-8000-000000000319', '02300000-0000-4000-8000-000000000207', 1, 'Composition over Inheritance',        'Build flexible objects from smaller collaborators.',                           'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02300000-0000-4000-8000-000000000320', '02300000-0000-4000-8000-000000000207', 2, 'Association, Aggregation, and Composition', 'Model relationships precisely.',                                            'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('02300000-0000-4000-8000-000000000321', '02300000-0000-4000-8000-000000000207', 3, 'Composition Quiz',                    'Confirm you can choose the right relationship.',                               'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02300000-0000-4000-8000-000000000322', '02300000-0000-4000-8000-000000000208', 1, 'OOP in Different Languages',          'Compare Java, Python, JavaScript, and C++ implementations.',                   'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02300000-0000-4000-8000-000000000323', '02300000-0000-4000-8000-000000000208', 2, 'SOLID Principles for OOP',            'Design stable systems with five time-tested principles.',                      'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02300000-0000-4000-8000-000000000324', '02300000-0000-4000-8000-000000000208', 3, 'Design & Languages Quiz',             'Verify your OOP design and language knowledge.',                               'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02300000-0000-4000-8000-000000000325', '02300000-0000-4000-8000-000000000209', 1, 'Capstone Design: Modeling a Library', 'Design classes and relationships for a library system.',                       'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02300000-0000-4000-8000-000000000326', '02300000-0000-4000-8000-000000000210', 1, 'Building the Capstone: Book Catalog', 'Implement the library model and its operations.',                              'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02300000-0000-4000-8000-000000000327', '02300000-0000-4000-8000-000000000210', 2, 'Testing and Refactoring OOP Code',    'Verify behavior and improve the design safely.',                               'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02300000-0000-4000-8000-000000000328', '02300000-0000-4000-8000-000000000210', 3, 'Final Assessment',                    'Prove what you learned across the whole course.',                              'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 02300000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '02300000-0000-4000-8000-000000000401',
  '02300000-0000-4000-8000-000000000301',
  1,
  'What is Object-Oriented Programming?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What is Object-Oriented Programming?</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>What is Object-Oriented Programming?</h1>
  <p>Object-Oriented Programming (OOP) is a <strong>paradigm</strong>: a way of structuring programs. Instead of scattering data and logic across the codebase, OOP groups them together into <strong>objects</strong> — self-contained units that hold <em>state</em> (fields) and <em>behavior</em> (methods).</p>
  <p>Contrast it with a procedural style, where arrays live here and the functions that read them live over there:</p>
  <pre class="code-block">// Procedural: data and the logic that uses it are separate
double[] temps = { 18.4, 21.0, 17.9 };

// OOP: state and behavior travel together
Temperature today = new Temperature(21.0, "Celsius");
today.toFahrenheit();</pre>
  <h2>The four pillars</h2>
  <p>Nearly every OOP language is built on the same four ideas:</p>
  <table>
    <tr><th>Pillar</th><th>What it means</th><th>Pays off by</th></tr>
    <tr><td><strong>Encapsulation</strong></td><td>Data and the methods that operate on it stay together.</td><td>Protecting invariants.</td></tr>
    <tr><td><strong>Abstraction</strong></td><td>Expose the essential, hide the incidental detail.</td><td>Simpler callers.</td></tr>
    <tr><td><strong>Inheritance</strong></td><td>Reuse and extend behavior across a hierarchy.</td><td>Removing duplication.</td></tr>
    <tr><td><strong>Polymorphism</strong></td><td>One interface, many implementations.</td><td>Swapping parts freely.</td></tr>
  </table>
  <h2>Blueprint and instances</h2>
  <p>A <span class="ic">class</span> is a <strong>blueprint</strong>; an <span class="ic">object</span> is a concrete <strong>instance</strong> built from that blueprint. One class can produce many independent objects, each with its own state.</p>
  <div class="callout callout-tip">
    <strong>Think in nouns</strong>
    <p>When you design an OOP system, look at the problem for <em>nouns</em> (Customer, Order, Invoice) and <em>verbs</em> (place, pay, cancel). Nouns become classes; verbs become methods. This mirrors how you already describe the domain.</p>
  </div>
  <div class="callout callout-info">
    <strong>Not always the answer</strong>
    <p>OOP shines for domain-heavy applications with evolving rules. For a short script that just slides data around, procedural or functional code is often simpler. Good engineers pick the paradigm that fits the job.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02300000-0000-4000-8000-000000000402',
  '02300000-0000-4000-8000-000000000302',
  1,
  'Classes and Objects',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Classes and Objects</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Classes and Objects</h1>
  <p>A class bundles <strong>fields</strong> (the state) and <strong>methods</strong> (the behavior) into one type. Here is a minimal Java class representing a bank account:</p>
  <pre class="code-block">public class BankAccount {
    String owner;        // field — state
    double balance;      // field — state

    void deposit(double amount) {          // method — behavior
        balance = balance + amount;
    }
}</pre>
  <h2>Making instances with new</h2>
  <p>Describing the blueprint does nothing by itself. You create a live copy with the <span class="ic">new</span> keyword, and each copy is independent:</p>
  <pre class="code-block">BankAccount first = new BankAccount();
first.owner = "Ava";
first.deposit(250.0);

BankAccount second = new BankAccount();
second.owner = "Liam";
second.deposit(10.0);

System.out.println(first.balance);   // 250.0 — its own copy
System.out.println(second.balance);  // 10.0  — untouched by first</pre>
  <h2>Accessing members</h2>
  <ul>
    <li>The dot operator (<span class="ic">.</span>) reaches a field or method on an instance.</li>
    <li>Inside a method, fields of <em>that</em> instance are visible without a dot.</li>
    <li>Calling a method executes it against that instance&rsquo;s state.</li>
  </ul>
  <h2>Naming conventions</h2>
  <table>
    <tr><th>Kind</th><th>Style</th><th>Example</th></tr>
    <tr><td>Class name</td><td>PascalCase — a noun</td><td>BankAccount</td></tr>
    <tr><td>Field</td><td>camelCase</td><td>owner, balance</td></tr>
    <tr><td>Method</td><td>camelCase verb</td><td>deposit()</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>An object variable is a reference</strong>
    <p><span class="ic">first</span> does not contain the account; it contains a <em>pointer</em> to an object allocated in memory. Copying the variable copies the reference, not the object — a detail that matters as soon as two variables point at the same instance.</p>
  </div>
  <div class="callout callout-tip">
    <strong>One responsibility per class</strong>
    <p>If a class name needs the word &ldquo;And&rdquo; (CustomerAndDiscount), split it. Small classes with one clear job are easier to test and reason about.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02300000-0000-4000-8000-000000000404',
  '02300000-0000-4000-8000-000000000304',
  1,
  'Constructors and Object State',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Constructors and Object State</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Constructors and Object State</h1>
  <p>A <strong>constructor</strong> is the special method that runs the instant a new object is created. It has the class&rsquo;s name, never declares a return type, and exists to bring the object to a <em>valid</em> starting state.</p>
  <pre class="code-block">public class BankAccount {
    private String owner;
    private double balance;

    // parameterized constructor
    public BankAccount(String owner, double initialDeposit) {
        this.owner = owner;
        if (initialDeposit &lt; 0) {
            throw new IllegalArgumentException("Cannot open with a negative balance");
        }
        this.balance = initialDeposit;
    }
}

BankAccount account = new BankAccount("Ava", 250.0);  // constructor runs here</pre>
  <h2>this</h2>
  <p><span class="ic">this</span> names the current instance. Since the parameter <span class="ic">owner</span> shadows the field <span class="ic">owner</span>, <span class="ic">this.owner = owner</span> distinguishes them clearly.</p>
  <h2>Overloading constructors</h2>
  <p>You may declare several constructors with different parameters. One can delegate to another using <span class="ic">this(...)</span>:</p>
  <pre class="code-block">public BankAccount(String owner) {
    this(owner, 0.0);   // delegate to the two-parameter constructor
}</pre>
  <h2>Default values</h2>
  <p>A field you never assign still has a value. Java zeroes primitives and nulls references:</p>
  <table>
    <tr><th>Field type</th><th>Default</th></tr>
    <tr><td>int, long, short, byte</td><td>0</td></tr>
    <tr><td>double, float</td><td>0.0</td></tr>
    <tr><td>boolean</td><td>false</td></tr>
    <tr><td>any reference type</td><td>null</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Keep constructors short</strong>
    <p>A constructor should establish a valid state and stop. Heavy computation or I/O in a constructor makes objects slow to create and hard to test. Move the work to a method and call it deliberately.</p>
  </div>
  <div class="callout callout-info">
    <strong>Constructor is not a method</strong>
    <p>You cannot call a constructor later on an existing object. The only way a constructor runs is through <span class="ic">new</span>.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02300000-0000-4000-8000-000000000405',
  '02300000-0000-4000-8000-000000000305',
  1,
  'Fields, References, and Equality',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Fields, References, and Equality</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Fields, References, and Equality</h1>
  <p>Instance fields are the <strong>state</strong> of an object. Each instance owns an independent copy, so mutating one never bleeds into another. A <span class="ic">static</span> field, by contrast, is shared by every instance of the class.</p>
  <pre class="code-block">public class BankAccount {
    private static double interestRate = 0.02;  // shared by all accounts
    private String owner;                        // per-instance state
    private double balance;
}</pre>
  <h2>References alias objects</h2>
  <p>Assigning one object variable to another shares the <em>same</em> object:</p>
  <pre class="code-block">BankAccount a = new BankAccount("Ava", 100.0);
BankAccount b = a;          // both point to the same object
b.deposit(50.0);
System.out.println(a.balance);   // 150.0 — a and b are the same account</pre>
  <p>This is called <strong>aliasing</strong>. It is useful but dangerous: any write through one alias is visible through the other.</p>
  <h2>Equality: == versus equals</h2>
  <pre class="code-block">BankAccount x = new BankAccount("Ava", 100.0);
BankAccount y = new BankAccount("Ava", 100.0);

System.out.println(x == y);     // false — different references
System.out.println(x.equals(y)); // depends on the class definition</pre>
  <ul>
    <li><span class="ic">==</span> on objects compares <strong>references</strong> (are they the same instance?).</li>
    <li><span class="ic">equals</span> compares <strong>logical content</strong> — if the class overrides it.</li>
    <li>Override <span class="ic">equals</span> and <span class="ic">hashCode</span> together, or collections like HashMap misbehave.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Prefer immutable fields</strong>
    <p>Fields declared <span class="ic">final</span> and set once in the constructor produce immutable objects. They are trivially thread-safe, easy to reason about, and never surprise you through an alias. Reach for them by default.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02300000-0000-4000-8000-000000000407',
  '02300000-0000-4000-8000-000000000307',
  1,
  'Encapsulation: Hiding Implementation',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Encapsulation: Hiding Implementation</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Encapsulation: Hiding Implementation</h1>
  <p><strong>Encapsulation</strong> means bundling state and behavior together <em>and</em> hiding the internals behind a narrow, deliberate interface. The outside world should only reach the object through its public methods — never poking at raw fields.</p>
  <p>Without encapsulation, any caller can corrupt the object:</p>
  <pre class="code-block">// Rotten: the balance field is exposed
account.balance = -500;   // no one stops us — the account is now invalid</pre>
  <p>Encapsulated, the class owns its rules:</p>
  <pre class="code-block">public class BankAccount {
    private double balance;             // hidden

    public void deposit(double amount) {
        if (amount &lt;= 0) throw new IllegalArgumentException("Deposit must be positive");
        balance += amount;
    }

    public boolean withdraw(double amount) {
        if (amount &gt; balance) return false;   // refuse to go negative
        balance -= amount;
        return true;
    }

    public double getBalance() { return balance; }   // read-only window
}</pre>
  <p>Now every path that changes <span class="ic">balance</span> passes through code that can enforce the invariant &ldquo;never negative.&rdquo;</p>
  <h2>Why it matters</h2>
  <ul>
    <li><strong>Safety</strong> — invalid states become unrepresentable.</li>
    <li><strong>Flexibility</strong> — you can change the internals without breaking callers.</li>
    <li><strong>Testability</strong> — you test the public contract, not internal wires.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Encapsulation vs abstraction</strong>
    <p>Abstraction decides <em>what</em> an object exposes; encapsulation decides <em>how</em> it keeps the rest hidden. You abstract to simplify the interface, and you encapsulate to enforce it.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Default to private</strong>
    <p>Declare every field <span class="ic">private</span> and every helper <span class="ic">private</span>, then widen the visibility only when a real requirement demands it. Fewer public members means fewer promises to keep.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02300000-0000-4000-8000-000000000408',
  '02300000-0000-4000-8000-000000000308',
  1,
  'Access Modifiers',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Access Modifiers</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Access Modifiers</h1>
  <p>Access modifiers set the <strong>visibility</strong> of a member — who is allowed to see and call it. Java has four levels, from most to least restrictive:</p>
  <table>
    <tr><th>Modifier</th><th>Visible from</th><th>Typical use</th></tr>
    <tr><td>private</td><td>only this class</td><td>fields, helper methods</td></tr>
    <tr><td>(default)</td><td>same package</td><td>package-internal wiring</td></tr>
    <tr><td>protected</td><td>package + subclasses</td><td>hooks for subclassers</td></tr>
    <tr><td>public</td><td>everywhere</td><td>the published API</td></tr>
  </table>
  <pre class="code-block">public class Temperature {
    private double value;              // hidden from everyone
    protected String note;             // visible to subclasses
    public static final String SCALE = "Celsius";  // public constant

    public double getValue() {         // public read window
        return value;
    }
}</pre>
  <h2>private wins by default</h2>
  <p>Start every field at <span class="ic">private</span>. Widen to <span class="ic">package-private</span> when a collaborator in the same package genuinely needs it, and only use <span class="ic">public</span> for the surface your clients rely on. <span class="ic">protected</span> is a promise to subclasses — use it deliberately.</p>
  <h2>final as a modifier</h2>
  <ul>
    <li><span class="ic">final</span> on a field: cannot be reassigned.</li>
    <li><span class="ic">final</span> on a method: cannot be overridden.</li>
    <li><span class="ic">final</span> on a class: cannot be subclassed.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Public members are contracts</strong>
    <p>Every <span class="ic">public</span> member is a promise to external code. Once others depend on it, changing it breaks them. A small public surface is a flexible library.</p>
  </div>
  <div class="callout callout-info">
    <strong>Modifiers protect intent</strong>
    <p>A modifier does not add security — it expresses intent and enforces discipline at compile time. The real protection is that internal state can only ever change through methods you wrote.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02300000-0000-4000-8000-000000000410',
  '02300000-0000-4000-8000-000000000310',
  1,
  'Properties: Getters and Setters',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Properties: Getters and Setters</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Properties: Getters and Setters</h1>
  <p>Because fields are <span class="ic">private</span>, clients need a controlled way to read and change state. That is the job of <strong>accessor methods</strong>: getters read, setters write — and both may enforce rules.</p>
  <pre class="code-block">public class BankAccount {
    private double balance;

    public double getBalance() {           // getter — read
        return balance;
    }

    public void setBalance(double balance) { // setter — validated write
        if (balance &lt; 0) {
            throw new IllegalArgumentException("Balance cannot be negative");
        }
        this.balance = balance;
    }
}</pre>
  <p>The setter does more than assign — it <em>validates</em>, so a negative balance is impossible from the outside.</p>
  <h2>Read-only properties</h2>
  <p>To expose state that cannot be changed, provide a getter but no setter (and keep the field <span class="ic">final</span>):</p>
  <pre class="code-block">public class AccountNumber {
    private final String number;

    public AccountNumber(String number) { this.number = number; }

    public String getNumber() { return number; }   // write is impossible
}</pre>
  <h2>When not to bother</h2>
  <p>For dumb data carriers where no rule applies, accessors are ceremony. Modern Java offers <span class="ic">records</span> for exactly that case:</p>
  <pre class="code-block">public record Point(double x, double y) { }   // immutable, equals + hashCode built in</pre>
  <div class="callout callout-tip">
    <strong>Add setters only when change is legal</strong>
    <p>Getters are cheap promises; setters are expensive ones because they invite every caller to mutate. If a value has no reason to change, leave the setter out entirely.</p>
  </div>
  <div class="callout callout-info">
    <strong>Behavior beats raw access</strong>
    <p>Prefer domain methods that express <em>intent</em> — <span class="ic">account.deposit(50)</span> — over a getter plus a setter the caller orchestrates. The object keeps control of its own rules.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02300000-0000-4000-8000-000000000411',
  '02300000-0000-4000-8000-000000000311',
  1,
  'Methods: Behavior on Objects',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Methods: Behavior on Objects</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Methods: Behavior on Objects</h1>
  <p>Methods are where the object <em>acts</em>: they read the instance state, change it, or produce derived values. Each method should do exactly one thing.</p>
  <pre class="code-block">public class ShoppingCart {
    private final List&lt;Double&gt; prices = new ArrayList&lt;&gt;();
    private final List&lt;Integer&gt; quantities = new ArrayList&lt;&gt;();

    public void addItem(double price, int quantity) {
        prices.add(price);
        quantities.add(quantity);
    }

    public double total() {
        double sum = 0.0;
        for (int i = 0; i &lt; prices.size(); i++) {
            sum += prices.get(i) * quantities.get(i);
        }
        return sum;
    }

    public boolean isEmpty() {
        return prices.isEmpty();
    }
}</pre>
  <h2>Kinds of methods</h2>
  <table>
    <tr><th>Kind</th><th>Example</th><th>Purpose</th></tr>
    <tr><td>Mutator</td><td>addItem()</td><td>changes state</td></tr>
    <tr><td>Accessor</td><td>getP</td><td>reveals state</td></tr>
    <tr><td>Query</td><td>total(), isEmpty()</td><td>computes a result</td></tr>
  </table>
  <h2>Instance versus static</h2>
  <ul>
    <li><strong>Instance methods</strong> (no <span class="ic">static</span>) operate on <span class="ic">this</span> — they can touch fields.</li>
    <li><strong>Static methods</strong> belong to the class, not an instance; use them for utilities that need no state.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Tell, do not ask</strong>
    <p>Instead of pulling state out with getters and making decisions yourself, ask the object to perform the decision. <span class="ic">if (acc.getBalance() &lt; price)</span> becomes <span class="ic">acc.canAfford(price)</span> — the object owns its own rules.</p>
  </div>
  <div class="callout callout-info">
    <strong>Small methods compose</strong>
    <p>A 40-line method usually hides three or four ideas. Extract each into a named method; the main method then reads like a sentence, and each piece becomes independently testable.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02300000-0000-4000-8000-000000000413',
  '02300000-0000-4000-8000-000000000313',
  1,
  'Inheritance: Extending Classes',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Inheritance: Extending Classes</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Inheritance: Extending Classes</h1>
  <p><strong>Inheritance</strong> models an <em>is-a</em> relationship: a saving account <em>is a</em> bank account. A subclass (<span class="ic">SavingsAccount</span>) reuses everything a parent (<span class="ic">BankAccount</span>) provides and may add or replace members.</p>
  <pre class="code-block">public class BankAccount {
    protected double balance;

    public BankAccount(double initial) {
        if (initial &lt; 0) throw new IllegalArgumentException("Negative initial balance");
        this.balance = initial;
    }

    public void deposit(double amount) { balance += amount; }

    public double getBalance() { return balance; }
}

public class SavingsAccount extends BankAccount {
    private final double interestRate;

    public SavingsAccount(double initial, double interestRate) {
        super(initial);            // hand the deposit to the parent constructor
        this.interestRate = interestRate;
    }

    public void applyInterest() {
        balance += balance * interestRate;   // uses the inherited protected field
    }
}</pre>
  <h2>What is inherited?</h2>
  <ul>
    <li><span class="ic">public</span> and <span class="ic">protected</span> members are visible to the subclass.</li>
    <li><span class="ic">private</span> members exist but are not reachable directly — only through the parent&rsquo;s own methods.</li>
    <li>Constructors are <em>not inherited</em>. The subclass constructor must call one via <span class="ic">super(...)</span>.</li>
  </ul>
  <h2>Single inheritance</h2>
  <p>Java allows only <strong>one</strong> direct parent class (avoiding the diamond problem). An interface type, which you meet in Module 3, may substitute for a second parent.</p>
  <div class="callout callout-info">
    <strong>Is-a is a strict test</strong>
    <p>Before extending, ask: &ldquo;Is every <span class="ic">SavingsAccount</span> truly a <span class="ic">BankAccount</span>?&rdquo; If the answer is &ldquo;it contains one,&rdquo; you want composition, not inheritance. Force a has-a model through <span class="ic">extends</span> and the design will fight you later.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Shallow hierarchies win</strong>
    <p>Two or three levels of inheritance are easy to follow; eight are not. Deep chains couple every level and make changes ripple. Prefer flat trees and composition.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02300000-0000-4000-8000-000000000414',
  '02300000-0000-4000-8000-000000000314',
  1,
  'Overriding Methods and super',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Overriding Methods and super</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Overriding Methods and super</h1>
  <p><strong>Overriding</strong> means writing your own implementation of a method inherited from the parent, keeping the same signature. It is the mechanism behind polymorphism: the right method runs for the right concrete type.</p>
  <pre class="code-block">public class BankAccount {
    public String describe() {
        return "Account with balance " + balance;
    }
}

public class SavingsAccount extends BankAccount {
    @Override
    public String describe() {
        return "Savings: " + super.describe() + " and " + interestRate + " interest";
    }
}</pre>
  <h2>super calls the parent</h2>
  <p><span class="ic">super.describe()</span> reaches the parent&rsquo;s version so the subclass does not re-implement it. <span class="ic">super(...)</span> (with parentheses) invokes the parent constructor and, if present, must be the first statement.</p>
  <h2>Rules of overriding</h2>
  <ul>
    <li>Same name, same parameter list, same (or narrower) return type.</li>
    <li>Must not reduce visibility — a <span class="ic">public</span> parent method cannot become <span class="ic">protected</span> in a child.</li>
    <li>A <span class="ic">final</span> parent method cannot be overridden; a <span class="ic">static</span> method is <em>hidden</em>, not overridden.</li>
  </ul>
  <h2>Always annotate</h2>
  <p>Mark overrides with <span class="ic">@Override</span>. If the parent signature ever changes, the compiler immediately tells you the subclass no longer overrides anything — turning a silent logic bug into a compile error.</p>
  <div class="callout callout-tip">
    <strong>Extend, then enhance</strong>
    <p>A common safe pattern: call <span class="ic">super.method()</span> first, then add subclass behavior. That preserves the parent&rsquo;s guarantees and layers new rules on top instead of replacing them.</p>
  </div>
  <div class="callout callout-info">
    <strong>Override equals with care</strong>
    <p>Subclasses that redefine identity (equals/hashCode) break collection contracts for their parent references. Only override equality when instances of the subclass are truly interchangeable with the parent&rsquo;s.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02300000-0000-4000-8000-000000000416',
  '02300000-0000-4000-8000-000000000316',
  1,
  'Polymorphism: Many Forms, One Interface',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Polymorphism: Many Forms, One Interface</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Polymorphism: Many Forms, One Interface</h1>
  <p><strong>Polymorphism</strong> (&ldquo;many shapes&rdquo;) lets one reference type hold objects of any subtype. The call site decides <em>what</em> to do; the concrete object decides <em>how</em>. Java resolves the correct method at runtime — that is <strong>dynamic dispatch</strong>.</p>
  <pre class="code-block">public abstract class Notification {
    public abstract void send(String message);
}

public class EmailNotification extends Notification {
    @Override public void send(String message) {
        System.out.println("Email: " + message);
    }
}

public class SmsNotification extends Notification {
    @Override public void send(String message) {
        System.out.println("SMS: " + message);
    }
}

Notification n1 = new EmailNotification();
Notification n2 = new SmsNotification();
n1.send("Hello");   // prints the email line
n2.send("Hello");   // prints the SMS line — same call, different behavior</pre>
  <h2>Collections of one base type</h2>
  <pre class="code-block">List&lt;Notification&gt; queue = new ArrayList&lt;&gt;();
queue.add(new EmailNotification());
queue.add(new SmsNotification());

for (Notification n : queue) {
    n.send("You have mail");   // each sends its own way
}</pre>
  <p>New notification channels slot in without touching the loop: the loop depends only on the contract <span class="ic">Notification</span>.</p>
  <h2>Why this matters</h2>
  <ul>
    <li><strong>Open for extension</strong> — add types, do not rewrite callers.</li>
    <li><strong>Uniform handling</strong> — one loop drives many implementations.</li>
    <li><strong>Testability</strong> — substitute a fake implementation for real I/O.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Program to the contract</strong>
    <p>Declare variables and parameters with the <em>widest</em> useful type: <span class="ic">Notification n</span>, not <span class="ic">EmailNotification n</span>. Callers then work with any subtype and stay decoupled from the concrete class.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Polymorphism is why interfaces pay off</strong>
    <p>When a class depends on the concrete type, you cannot swap implementations without editing callers. When it depends on an abstraction, swapping becomes a one-line construction change.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02300000-0000-4000-8000-000000000417',
  '02300000-0000-4000-8000-000000000317',
  1,
  'Abstract Classes and Interfaces',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Abstract Classes and Interfaces</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Abstract Classes and Interfaces</h1>
  <p>Both types sit between a concrete class and pure abstraction, and both can hold <strong>abstract methods</strong> — signatures without a body that every creator must implement.</p>
  <h2>Abstract class</h2>
  <pre class="code-block">public abstract class Shape {
    protected final String name;

    protected Shape(String name) { this.name = name; }

    public abstract double area();      // each shape implements its own
    public String label() { return name + " area = " + area(); }  // shared behavior
}</pre>
  <p>An abstract class may keep <strong>state</strong> (fields), provide <em>shared implementations</em>, and require subclasses to fill in the <span class="ic">abstract</span> gaps. It cannot be instantiated directly.</p>
  <h2>Interface</h2>
  <pre class="code-block">public interface Payable {
    double amount();          // constant + signatures
    default void describe() { System.out.println("Amount: " + amount()); }
}</pre>
  <p>An interface declares a pure <strong>contract</strong> — what the object can do, not how, and (as of Java 8) may ship <span class="ic">default</span> implementations. A class can implement many interfaces but extend one class.</p>
  <h2>Choosing between them</h2>
  <table>
    <tr><th>You need…</th><th>Use</th></tr>
    <tr><td>State (fields) shared up the hierarchy</td><td>abstract class</td></tr>
    <tr><td>Shared implementation among related classes</td><td>abstract class</td></tr>
    <tr><td>A pure contract across unrelated classes</td><td>interface</td></tr>
    <tr><td>Multiple &ldquo;roles&rdquo; on one class</td><td>interfaces</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Interfaces define what; abstract classes share how</strong>
    <p>Start with an interface to spell out the contract others code against. Add an abstract class only when you have real shared state and behavior to hand down. This keeps the public surface abstract and flexible.</p>
  </div>
  <div class="callout callout-info">
    <strong>Default methods must not surprise</strong>
    <p>A default implementation is a strong commitment to all implementors. Use it for stable, optional conveniences — not for logic that variant classes will each want to override differently.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02300000-0000-4000-8000-000000000419',
  '02300000-0000-4000-8000-000000000319',
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
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Composition over Inheritance</h1>
  <p>Inheritance captures <em>is-a</em>; <strong>composition</strong> captures <em>has-a</em>. A car has an engine, an order has line items, a library has books. Composition wires objects together from smaller collaborators instead of stacking classes.</p>
  <pre class="code-block">public class Engine {
    public void start() { System.out.println("Engine running"); }
}

public class ElectricEngine extends Engine {
    @Override public void start() { System.out.println("Motor humming"); }
}

public class Car {
    private final Engine engine;          // has-a, not is-a

    public Car(Engine engine) { this.engine = engine; }   // inject any engine

    public void start() {
        engine.start();                   // delegate behavior
    }
}

Car petrol = new Car(new Engine());
Car ev     = new Car(new ElectricEngine());   // engine swapped without new class</pre>
  <p>To change behavior you construct a different collaborator — no new <span class="ic">Car</span> subclass required.</p>
  <h2>Inheritance vs composition</h2>
  <table>
    <tr><th></th><th>Inheritance</th><th>Composition</th></tr>
    <tr><td>Relationship</td><td>is-a</td><td>has-a</td></tr>
    <tr><td>Reused behavior</td><td>inherited automatically</td><td>delegated explicitly</td></tr>
    <tr><td>Coupling</td><td>tight (parent changes ripple)</td><td>loose (parts are swappable)</td></tr>
    <tr><td>Change cost</td><td>hierarchy edits</td><td>constructor wiring</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Compose by default, inherit by exception</strong>
    <p>Reach for inheritance only when a true is-a relationship and shared behavior genuinely exist. For everything else, build with composition — it keeps parts small, swappable, and testable in isolation.</p>
  </div>
  <div class="callout callout-info">
    <strong>Delegate, do not duplicate</strong>
    <p>With composition, expose the behavior you need and forward the call (`engine.start()`). Callers treat the whole as one unit, but each piece stays independently replaceable.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02300000-0000-4000-8000-000000000420',
  '02300000-0000-4000-8000-000000000320',
  1,
  'Association, Aggregation, and Composition',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Association, Aggregation, and Composition</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Association, Aggregation, and Composition</h1>
  <p>Not every has-a relationship is the same. Object modeling distinguishes three strengths of connection based on <strong>ownership</strong> and <strong>lifetime</strong>:</p>
  <table>
    <tr><th>Relationship</th><th>Strength</th><th>Lifetime</th><th>Example</th></tr>
    <tr><td>Association</td><td>weak</td><td>parts outlive the link</td><td>A Student takes a Course</td></tr>
    <tr><td>Aggregation</td><td>medium</td><td>parts exist independently</td><td>A Team has Players</td></tr>
    <tr><td>Composition</td><td>strong</td><td>parts die with the whole</td><td>A House owns Rooms</td></tr>
  </table>
  <pre class="code-block">class Student { /* ... */ }          // exists on its own
class Course  { /* ... */ }          // exists on its own
class Team    { List&lt;Player&gt; players; }  // aggregation: players persist after team ends
class House   { final List&lt;Room&gt; rooms; public void addRoom(Room r) { rooms.add(r); } }
                                     // composition: rooms belong to the house</pre>
  <h2>Reading the relationships</h2>
  <ul>
    <li><strong>Association</strong> — the bare knowledge that two classes interact (a link, often a parameter or a local).</li>
    <li><strong>Aggregation</strong> — a whole holds references to parts that also exist elsewhere (&ldquo;team has players&rdquo;).</li>
    <li><strong>Composition</strong> — the whole creates its parts, owns them exclusively, and removes them when it is destroyed.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Choose the weakest relationship that fits</strong>
    <p>Prefer association, then aggregation, then composition. The weaker the coupling, the fewer lifetime promises classes make and the easier they are to test in isolation.</p>
  </div>
  <div class="callout callout-info">
    <strong>Model the shared lifetime honestly</strong>
    <p>Ask: &ldquo;If the whole disappears, must the parts disappear too?&rdquo; Only composition answers yes. Making expiration semantics explicit prevents leaks and dangling references in real systems.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02300000-0000-4000-8000-000000000422',
  '02300000-0000-4000-8000-000000000322',
  1,
  'OOP in Different Languages',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>OOP in Different Languages</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>OOP in Different Languages</h1>
  <p>The four pillars transfer everywhere — the <em>syntax</em> does not. Here is how the main OOP languages express the same ideas.</p>
  <table>
    <tr><th>Language</th><th>Class syntax</th><th>Inheritance</th><th>Visibility</th></tr>
    <tr><td>Java</td><td>class + new</td><td>single, plus interfaces</td><td>private / protected / public</td></tr>
    <tr><td>C++</td><td>class + new</td><td>single or multiple</td><td>private / protected / public</td></tr>
    <tr><td>Python</td><td>class + call</td><td>multiple</td><td>underscore convention</td></tr>
    <tr><td>JavaScript (ES6)</td><td>class + new</td><td>single, via prototypes</td><td>none by default (TS/JS private #)</td></tr>
  </table>
  <h2>Python: conventions, not keywords</h2>
  <pre class="code-block">class BankAccount:
    def __init__(self, owner, balance):   # constructor
        self._owner = owner               # &quot;private&quot; by convention
        self._balance = balance

    def deposit(self, amount):
        self._balance += amount</pre>
  <p><span class="ic">_</span> marks intent; Python does not enforce privacy. It supports multiple inheritance and <span class="ic">@property</span> for getter/setter syntax.</p>
  <h2>JavaScript: prototypes under the class sugar</h2>
  <pre class="code-block">class BankAccount {
  #balance;                       // true private field (ES2022)
  constructor(owner, balance) {
    this.owner = owner;
    this.#balance = balance;
  }
}</pre>
  <p>Personally, <span class="ic">class</span> is syntax sugar over prototypes; methods live on a shared prototype object, and each instance stores its own fields.</p>
  <h2>C++: full control, multiple parents</h2>
  <pre class="code-block">class BankAccount {
protected:
  double balance;
public:
  BankAccount(double b) : balance(b) {}
};</pre>
  <p>C++ allows multiple inheritance, templates instead of interfaces, and <span class="ic">friend</span> access — powerful, and easy to misuse.</p>
  <div class="callout callout-info">
    <strong>Concepts travel, syntax does not</strong>
    <p>The hard-won lessons of this course — encapsulate, prefer composition, program to a contract — apply verbatim in every language above. You learn OOP once and translate it anywhere.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02300000-0000-4000-8000-000000000423',
  '02300000-0000-4000-8000-000000000323',
  1,
  'SOLID Principles for OOP',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SOLID Principles for OOP</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>SOLID Principles for OOP</h1>
  <p>SOLID is a five-letter checklist for classes that are easy to extend, swap, and understand. Treat it as a design compass, not dogma.</p>
  <table>
    <tr><th>Letter</th><th>Principle</th><th>Question it answers</th></tr>
    <tr><td>S</td><td>Single Responsibility</td><td>Does this class have one reason to change?</td></tr>
    <tr><td>O</td><td>Open/Closed</td><td>Can I extend behavior without editing it?</td></tr>
    <tr><td>L</td><td>Liskov Substitution</td><td>Can a subclass stand in for its parent?</td></tr>
    <tr><td>I</td><td>Interface Segregation</td><td>Is every consumer only seeing what it needs?</td></tr>
    <tr><td>D</td><td>Dependency Inversion</td><td>Do I depend on abstractions, not concretes?</td></tr>
  </table>
  <h2>Open/Closed in practice</h2>
  <p>Add behavior with a new implementor instead of editing existing classes:</p>
  <pre class="code-block">public interface PaymentMethod {
    double fees(double amount);
}

public class CardPayment implements PaymentMethod {
    @Override public double fees(double amount) { return amount * 0.02; }
}

public class CryptoPayment implements PaymentMethod {
    @Override public double fees(double amount) { return 0; }
}

// checkout() stays untouched when a new method appears:
public double checkout(PaymentMethod method, double amount) {
    return method.fees(amount);
}</pre>
  <h2>Liskov: keep the promise</h2>
  <p>If a method accepts a <span class="ic">BankAccount</span>, any subclass must honor its behavior — same preconditions, same outcomes. A subclass that <em>throws</em> where the parent returned is a design smell.</p>
  <div class="callout callout-tip">
    <strong>Smell radar</strong>
    <p>Editing a method whenever a new feature arrives? You are violating Open/Closed. A class called Manager that also validates and prints? That is Single Responsibility calling. Catch the smell early, refactor small.</p>
  </div>
  <div class="callout callout-info">
    <strong>Dependency Inversion is everywhere</strong>
    <p>Injection pattern: construct classes with their collaborators (a repository, an engine) instead of building them inside. Tests then inject fakes freely, and swapping implementation is a wiring change, not a rewrite.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02300000-0000-4000-8000-000000000425',
  '02300000-0000-4000-8000-000000000325',
  1,
  'Capstone Design: Modeling a Library',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone Design: Modeling a Library</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Capstone Design: Modeling a Library</h1>
  <p>You will build a small but complete <strong>library management system</strong>: members borrow and return books, and the library tracks both the catalog and active loans. Design first — code follows.</p>
  <h2>The classes</h2>
  <table>
    <tr><th>Class</th><th>State (fields)</th><th>Behavior (methods)</th></tr>
    <tr><td>Book</td><td>title, author, isbn</td><td>getters, matchesTitle()</td></tr>
    <tr><td>Catalog</td><td>collection of books</td><td>add, findByTitle, remove</td></tr>
    <tr><td>Member</td><td>name, id</td><td>borrow() delegating to Library</td></tr>
    <tr><td>Loan</td><td>book, member, due date</td><td>isOverdue()</td></tr>
    <tr><td>Library</td><td>catalog, members, active loans</td><td>borrowBook, returnBook, listLoans</td></tr>
  </table>
  <h2>Relationships</h2>
  <pre class="code-block">Library
  ├─ Catalog        (composition — owns its book list)
  │    └─ Book []   (composition — books live and die with the catalog)
  ├─ Member []      (aggregation — a member belongs to no library)
  └─ Loan []        (composition — a loan is created and retired by the library)</pre>
  <h2>Rules to enforce</h2>
  <ul>
    <li>A member can borrow at most 3 books at once.</li>
    <li>A book on loan cannot be borrowed again until returned.</li>
    <li>Returning a missing loan is an error — fail loudly.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Model nouns, then verbs</strong>
    <p>Write the domain sentences first: &ldquo;A member borrows a book from the library.&rdquo; Underline the nouns (classes) and circle the verbs (methods). The sentence structure <em>is</em> your class diagram.</p>
  </div>
  <div class="callout callout-info">
    <strong>Keep the domain pure</strong>
    <p>This layer prints nothing and talks to no UI. It answers questions and enforces rules. Presenting results happens in a separate step, which keeps every rule unit-testable.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02300000-0000-4000-8000-000000000426',
  '02300000-0000-4000-8000-000000000326',
  1,
  'Building the Capstone: Book Catalog',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Building the Capstone: Book Catalog</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Building the Capstone: Book Catalog</h1>
  <p>Now you implement the model. Start with the leaf classes and compose upward.</p>
  <pre class="code-block">public class Book {
    private final String title;
    private final String author;
    private final String isbn;

    public Book(String title, String author, String isbn) {
        this.title = title;
        this.author = author;
        this.isbn = isbn;
    }

    public boolean matchesTitle(String term) {
        return title.toLowerCase().contains(term.toLowerCase());
    }

    public String getTitle() { return title; }
    public String getAuthor() { return author; }
}</pre>
  <pre class="code-block">public class Catalog {
    private final List&lt;Book&gt; books = new ArrayList&lt;&gt;();

    public void add(Book book) {
        for (Book b : books) {
            if (b.getIsbn().equals(book.getIsbn())) {
                throw new IllegalArgumentException("Duplicate ISBN: " + book.getIsbn());
            }
        }
        books.add(book);
    }

    public List&lt;Book&gt; findByTitle(String term) {
        List&lt;Book&gt; result = new ArrayList&lt;&gt;();
        for (Book b : books) {
            if (b.matchesTitle(term)) result.add(b);
        }
        return result;
    }
}</pre>
  <p>Then the <span class="ic">Library</span> composes a <span class="ic">Catalog</span> and tracks loans, enforcing the borrowing rules at the single point where loans are created:</p>
  <pre class="code-block">public class Library {
    private final Catalog catalog;
    private final List&lt;Member&gt; members = new ArrayList&lt;&gt;();
    private final List&lt;Loan&gt; loans = new ArrayList&lt;&gt;();

    public Book borrow(Member member, String title) {
        if (activeLoanCount(member) &gt;= 3) {
            throw new IllegalStateException("Member already has 3 borrowed books");
        }
        Book found = catalog.findByTitle(title).get(0);   // first match
        if (isOnLoan(found)) {
            throw new IllegalStateException("Book is already on loan");
        }
        Loan loan = new Loan(found, member);
        loans.add(loan);
        return found;
    }
}</pre>
  <div class="callout callout-tip">
    <strong>Compose from the leaves up</strong>
    <p>Build and trust <span class="ic">Book</span> and <span class="ic">Catalog</span> first; they have no dependencies. <span class="ic">Library</span> then composes them — if a rule is hard to express, your collaborators were probably modeled wrong.</p>
  </div>
  <div class="callout callout-info">
    <strong>Fail loudly at the boundary</strong>
    <p>Duplicate ISBN, too many loans, book unavailable — surface each as an explicit exception at the point of change. The caller learns immediately, and the rules live in exactly one place.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02300000-0000-4000-8000-000000000427',
  '02300000-0000-4000-8000-000000000327',
  1,
  'Testing and Refactoring OOP Code',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Testing and Refactoring OOP Code</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Testing and Refactoring OOP Code</h1>
  <p>Clean OOP pays off on the test bench: because objects hide their internals and take collaborators through constructors, each unit can be tested alone with a fake collaborator.</p>
  <h2>Unit tests with JUnit style</h2>
  <pre class="code-block">import static org.junit.jupiter.api.Assertions.*;

class LibraryTest {
    @Test
    void duplicateIsbnIsRejected() {
        Catalog catalog = new Catalog();
        catalog.add(new Book("Dune", "Frank Herbert", "9783"));

        assertThrows(IllegalArgumentException.class, () -&gt;
            catalog.add(new Book("Dune Two", "Frank Herbert", "9783")));
    }

    @Test
    void memberCannotBorrowMoreThanThree() {
        Library lib = new Library();
        Member m = new Member("Ava", "M1");
        assertThrows(IllegalStateException.class, () -&gt; lib.borrow(m, "Dune"));
    }
}</pre>
  <p>Each test follows <strong>arrange / act / assert</strong>: set up, perform, verify. Test names read like sentences describing the rule.</p>
  <h2>Refactoring safely</h2>
  <ul>
    <li>Run the tests first — they are your safety net.</li>
    <li>Change one small thing: extract a method, rename a field, split a class.</li>
    <li>Run the tests again. Green means the behavior survived the change.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Test the contract, not the wiring</strong>
    <p>Assert on the rule (&ldquo;throws when duplicate&rdquo;), not on whether some internal list grew. A test tied to internals breaks for no reason when you improve the design.</p>
  </div>
  <div class="callout callout-info">
    <strong>Red, green, refactor</strong>
    <p>Write a failing test first when fixing bugs or adding rules. The red test proves the bug exists; the green pass proves it is gone; then refactor under the green umbrella.</p>
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
  ('02300000-0000-4000-8000-000000000501', '02300000-0000-4000-8000-000000000303',
   'What does a class describe in OOP?',
   'A class is a blueprint that defines the state and behavior of its objects.', 1),
  ('02300000-0000-4000-8000-000000000502', '02300000-0000-4000-8000-000000000303',
   'Which keyword creates a new object from a class in Java?',
   'new allocates the object and runs its constructor.', 2),
  ('02300000-0000-4000-8000-000000000503', '02300000-0000-4000-8000-000000000303',
   'Each object created from a class has what of its own?',
   'Instance fields are per-object, so every object holds an independent copy.', 3),
  ('02300000-0000-4000-8000-000000000504', '02300000-0000-4000-8000-000000000306',
   'What is a constructor?',
   'A special method that runs on new and brings the object to a valid starting state.', 1),
  ('02300000-0000-4000-8000-000000000505', '02300000-0000-4000-8000-000000000306',
   'Which keyword refers to the current instance inside a class?',
   'this distinguishes instance members from shadowing parameters.', 2),
  ('02300000-0000-4000-8000-000000000506', '02300000-0000-4000-8000-000000000306',
   'What is the default value of an int field that is never initialized?',
   'Java zeroes numeric primitives, so the default is 0.', 3),
  ('02300000-0000-4000-8000-000000000507', '02300000-0000-4000-8000-000000000309',
   'What is encapsulation?',
   'Bundling data with the methods that operate on it and hiding the internals.', 1),
  ('02300000-0000-4000-8000-000000000508', '02300000-0000-4000-8000-000000000309',
   'Which access modifier makes a member visible only inside its own class?',
   'private restricts access to the single class that declares the member.', 2),
  ('02300000-0000-4000-8000-000000000509', '02300000-0000-4000-8000-000000000309',
   'Why hide internal state behind public methods?',
   'Public methods let the class enforce rules every time state changes.', 3),
  ('02300000-0000-4000-8000-000000000510', '02300000-0000-4000-8000-000000000312',
   'Which member would you write to expose a private field for reading?',
   'A getter method returns the field without letting callers change it.', 1),
  ('02300000-0000-4000-8000-000000000511', '02300000-0000-4000-8000-000000000312',
   'Which construct allows validation to run when a field changes?',
   'A setter method is the single place that can validate a write.', 2),
  ('02300000-0000-4000-8000-000000000512', '02300000-0000-4000-8000-000000000312',
   'A method is best described as what?',
   'Methods express behavior that operates on the state of an object.', 3),
  ('02300000-0000-4000-8000-000000000513', '02300000-0000-4000-8000-000000000315',
   'Inheritance allows a child class to do what?',
   'A subclass reuses and extends the behavior of its parent class.', 1),
  ('02300000-0000-4000-8000-000000000514', '02300000-0000-4000-8000-000000000315',
   'Which keyword in Java explicitly calls a parent-class member?',
   'super reaches the parent constructor or a parent method.', 2),
  ('02300000-0000-4000-8000-000000000515', '02300000-0000-4000-8000-000000000315',
   'What is method overriding?',
   'Providing a new implementation of an inherited method in a subclass.', 3),
  ('02300000-0000-4000-8000-000000000516', '02300000-0000-4000-8000-000000000318',
   'Polymorphism means what?',
   'The same interface can drive many different implementations at runtime.', 1),
  ('02300000-0000-4000-8000-000000000517', '02300000-0000-4000-8000-000000000318',
   'Which member has a signature but no body and must be implemented by subclasses?',
   'An abstract method is the required gap that each subtype fills in.', 2),
  ('02300000-0000-4000-8000-000000000518', '02300000-0000-4000-8000-000000000318',
   'Which type declares a pure contract that a class can implement many times?',
   'An interface specifies what an object can do, not how.', 3),
  ('02300000-0000-4000-8000-000000000519', '02300000-0000-4000-8000-000000000321',
   'Composition over inheritance means what?',
   'Build objects from smaller collaborators instead of deep class hierarchies.', 1),
  ('02300000-0000-4000-8000-000000000520', '02300000-0000-4000-8000-000000000321',
   'Which relationship describes a Library that owns its Books?',
   'Composition owns the parts and ties their lifetime to the whole.', 2),
  ('02300000-0000-4000-8000-000000000521', '02300000-0000-4000-8000-000000000321',
   'What does composition imply about the parts?',
   'The parts are created with the whole and destroyed with it.', 3),
  ('02300000-0000-4000-8000-000000000522', '02300000-0000-4000-8000-000000000324',
   'Which language compiles to bytecode and uses single inheritance plus interfaces?',
   'Java enforces single class inheritance and adds interfaces for contracts.', 1),
  ('02300000-0000-4000-8000-000000000523', '02300000-0000-4000-8000-000000000324',
   'How does Python signal a private field?',
   'A leading underscore marks intent by convention, enforced only by discipline.', 2),
  ('02300000-0000-4000-8000-000000000524', '02300000-0000-4000-8000-000000000324',
   'Which SOLID principle says a class should have one reason to change?',
   'Single Responsibility keeps each class focused on one job.', 3),
  ('02300000-0000-4000-8000-000000000525', '02300000-0000-4000-8000-000000000328',
   'What are the four pillars of OOP?',
   'Encapsulation, abstraction, inheritance, and polymorphism.', 1),
  ('02300000-0000-4000-8000-000000000526', '02300000-0000-4000-8000-000000000328',
   'Which keyword prevents a Java class from being subclassed?',
   'final on a class forbids extending it.', 2),
  ('02300000-0000-4000-8000-000000000527', '02300000-0000-4000-8000-000000000328',
   'What can an abstract class provide that an interface cannot?',
   'An abstract class can hold instance fields, i.e. concrete state.', 3),
  ('02300000-0000-4000-8000-000000000528', '02300000-0000-4000-8000-000000000328',
   'What is a key advantage of composition over deep inheritance?',
   'The flexibility to swap collaborating parts at runtime.', 4),
  ('02300000-0000-4000-8000-000000000529', '02300000-0000-4000-8000-000000000328',
   'What is the best first step when testing an OOP solution?',
   'Test the smallest units in isolation with fake collaborators.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): class blueprint
  ('02300000-0000-4000-8000-000000001001', '02300000-0000-4000-8000-000000000501', 'A blueprint for state and behavior', TRUE,  1),
  ('02300000-0000-4000-8000-000000001002', '02300000-0000-4000-8000-000000000501', 'A single value stored in memory', FALSE, 2),
  ('02300000-0000-4000-8000-000000001003', '02300000-0000-4000-8000-000000000501', 'A function that runs at startup', FALSE, 3),
  ('02300000-0000-4000-8000-000000001004', '02300000-0000-4000-8000-000000000501', 'A configuration file on disk', FALSE, 4),
  -- Q1 (501)q2: new
  ('02300000-0000-4000-8000-000000001005', '02300000-0000-4000-8000-000000000502', 'new', TRUE,  1),
  ('02300000-0000-4000-8000-000000001006', '02300000-0000-4000-8000-000000000502', 'object', FALSE, 2),
  ('02300000-0000-4000-8000-000000001007', '02300000-0000-4000-8000-000000000502', 'create', FALSE, 3),
  ('02300000-0000-4000-8000-000000001008', '02300000-0000-4000-8000-000000000502', 'instanceof', FALSE, 4),
  -- Q1 (501)q3: own instance fields
  ('02300000-0000-4000-8000-000000001009', '02300000-0000-4000-8000-000000000503', 'its own copy of the instance fields', TRUE,  1),
  ('02300000-0000-4000-8000-000000001010', '02300000-0000-4000-8000-000000000503', 'a shared copy of every field', FALSE, 2),
  ('02300000-0000-4000-8000-000000001011', '02300000-0000-4000-8000-000000000503', 'no fields of its own', FALSE, 3),
  ('02300000-0000-4000-8000-000000001012', '02300000-0000-4000-8000-000000000503', 'the same state as all other instances', FALSE, 4),
  -- Q2 (504): constructor
  ('02300000-0000-4000-8000-000000001013', '02300000-0000-4000-8000-000000000504', 'A special method that initializes a new object', TRUE,  1),
  ('02300000-0000-4000-8000-000000001014', '02300000-0000-4000-8000-000000000504', 'A method that deletes an object', FALSE, 2),
  ('02300000-0000-4000-8000-000000001015', '02300000-0000-4000-8000-000000000504', 'A static utility function', FALSE, 3),
  ('02300000-0000-4000-8000-000000001016', '02300000-0000-4000-8000-000000000504', 'A loop that runs at startup', FALSE, 4),
  -- Q2 (504)q2: this
  ('02300000-0000-4000-8000-000000001017', '02300000-0000-4000-8000-000000000505', 'this', TRUE,  1),
  ('02300000-0000-4000-8000-000000001018', '02300000-0000-4000-8000-000000000505', 'current', FALSE, 2),
  ('02300000-0000-4000-8000-000000001019', '02300000-0000-4000-8000-000000000505', 'me', FALSE, 3),
  ('02300000-0000-4000-8000-000000001020', '02300000-0000-4000-8000-000000000505', 'that', FALSE, 4),
  -- Q2 (504)q3: int default 0
  ('02300000-0000-4000-8000-000000001021', '02300000-0000-4000-8000-000000000506', '0', TRUE,  1),
  ('02300000-0000-4000-8000-000000001022', '02300000-0000-4000-8000-000000000506', 'null', FALSE, 2),
  ('02300000-0000-4000-8000-000000001023', '02300000-0000-4000-8000-000000000506', 'undefined', FALSE, 3),
  ('02300000-0000-4000-8000-000000001024', '02300000-0000-4000-8000-000000000506', 'false', FALSE, 4),
  -- Q3 (507): encapsulation
  ('02300000-0000-4000-8000-000000001025', '02300000-0000-4000-8000-000000000507', 'Bundling data with the methods that operate on it', TRUE,  1),
  ('02300000-0000-4000-8000-000000001026', '02300000-0000-4000-8000-000000000507', 'Making every field public', FALSE, 2),
  ('02300000-0000-4000-8000-000000001027', '02300000-0000-4000-8000-000000000507', 'Copying code between classes', FALSE, 3),
  ('02300000-0000-4000-8000-000000001028', '02300000-0000-4000-8000-000000000507', 'Keeping all data in global variables', FALSE, 4),
  -- Q3 (507)q2: private
  ('02300000-0000-4000-8000-000000001029', '02300000-0000-4000-8000-000000000508', 'private', TRUE,  1),
  ('02300000-0000-4000-8000-000000001030', '02300000-0000-4000-8000-000000000508', 'protected', FALSE, 2),
  ('02300000-0000-4000-8000-000000001031', '02300000-0000-4000-8000-000000000508', 'public', FALSE, 3),
  ('02300000-0000-4000-8000-000000001032', '02300000-0000-4000-8000-000000000508', 'static', FALSE, 4),
  -- Q3 (507)q3: why hide
  ('02300000-0000-4000-8000-000000001033', '02300000-0000-4000-8000-000000000509', 'So the class can enforce rules on every change', TRUE,  1),
  ('02300000-0000-4000-8000-000000001034', '02300000-0000-4000-8000-000000000509', 'To make field access run faster', FALSE, 2),
  ('02300000-0000-4000-8000-000000001035', '02300000-0000-4000-8000-000000000509', 'To avoid writing documentation', FALSE, 3),
  ('02300000-0000-4000-8000-000000001036', '02300000-0000-4000-8000-000000000509', 'To stop other classes reading data at all', FALSE, 4),
  -- Q4 (510): getter
  ('02300000-0000-4000-8000-000000001037', '02300000-0000-4000-8000-000000000510', 'A getter method', TRUE,  1),
  ('02300000-0000-4000-8000-000000001038', '02300000-0000-4000-8000-000000000510', 'A destructor', FALSE, 2),
  ('02300000-0000-4000-8000-000000001039', '02300000-0000-4000-8000-000000000510', 'A package declaration', FALSE, 3),
  ('02300000-0000-4000-8000-000000001040', '02300000-0000-4000-8000-000000000510', 'A switch statement', FALSE, 4),
  -- Q4 (510)q2: setter validation
  ('02300000-0000-4000-8000-000000001041', '02300000-0000-4000-8000-000000000511', 'A setter method', TRUE,  1),
  ('02300000-0000-4000-8000-000000001042', '02300000-0000-4000-8000-000000000511', 'A getter method', FALSE, 2),
  ('02300000-0000-4000-8000-000000001043', '02300000-0000-4000-8000-000000000511', 'An import statement', FALSE, 3),
  ('02300000-0000-4000-8000-000000001044', '02300000-0000-4000-8000-000000000511', 'An infinite loop', FALSE, 4),
  -- Q4 (510)q3: method = behavior
  ('02300000-0000-4000-8000-000000001045', '02300000-0000-4000-8000-000000000512', 'Behavior that operates on an object state', TRUE,  1),
  ('02300000-0000-4000-8000-000000001046', '02300000-0000-4000-8000-000000000512', 'A synonym for a field', FALSE, 2),
  ('02300000-0000-4000-8000-000000001047', '02300000-0000-4000-8000-000000000512', 'The address of the object in memory', FALSE, 3),
  ('02300000-0000-4000-8000-000000001048', '02300000-0000-4000-8000-000000000512', 'A class name with parentheses', FALSE, 4),
  -- Q5 (513): reuse and extend parent
  ('02300000-0000-4000-8000-000000001049', '02300000-0000-4000-8000-000000000513', 'reuse and extend the behavior of a parent class', TRUE,  1),
  ('02300000-0000-4000-8000-000000001050', '02300000-0000-4000-8000-000000000513', 'copy the parent into a new file', FALSE, 2),
  ('02300000-0000-4000-8000-000000001051', '02300000-0000-4000-8000-000000000513', 'delete the parent class', FALSE, 3),
  ('02300000-0000-4000-8000-000000001052', '02300000-0000-4000-8000-000000000513', 'prevent the parent from loading', FALSE, 4),
  -- Q5 (513)q2: super
  ('02300000-0000-4000-8000-000000001053', '02300000-0000-4000-8000-000000000514', 'super', TRUE,  1),
  ('02300000-0000-4000-8000-000000001054', '02300000-0000-4000-8000-000000000514', 'base', FALSE, 2),
  ('02300000-0000-4000-8000-000000001055', '02300000-0000-4000-8000-000000000514', 'extra', FALSE, 3),
  ('02300000-0000-4000-8000-000000001056', '02300000-0000-4000-8000-000000000514', 'above', FALSE, 4),
  -- Q5 (513)q3: overriding
  ('02300000-0000-4000-8000-000000001057', '02300000-0000-4000-8000-000000000515', 'Providing a new implementation of an inherited method', TRUE,  1),
  ('02300000-0000-4000-8000-000000001058', '02300000-0000-4000-8000-000000000515', 'Declaring two methods with the same name but different parameters', FALSE, 2),
  ('02300000-0000-4000-8000-000000001059', '02300000-0000-4000-8000-000000000515', 'Calling a method from inside a constructor', FALSE, 3),
  ('02300000-0000-4000-8000-000000001060', '02300000-0000-4000-8000-000000000515', 'Removing a method from the source code', FALSE, 4),
  -- Q6 (516): polymorphism
  ('02300000-0000-4000-8000-000000001061', '02300000-0000-4000-8000-000000000516', 'The same interface driving different implementations', TRUE,  1),
  ('02300000-0000-4000-8000-000000001062', '02300000-0000-4000-8000-000000000516', 'Every class being abstract', FALSE, 2),
  ('02300000-0000-4000-8000-000000001063', '02300000-0000-4000-8000-000000000516', 'All methods returning the same type', FALSE, 3),
  ('02300000-0000-4000-8000-000000001064', '02300000-0000-4000-8000-000000000516', 'Objects that cannot be passed between methods', FALSE, 4),
  -- Q6 (516)q2: abstract method
  ('02300000-0000-4000-8000-000000001065', '02300000-0000-4000-8000-000000000517', 'an abstract method', TRUE,  1),
  ('02300000-0000-4000-8000-000000001066', '02300000-0000-4000-8000-000000000517', 'a final field', FALSE, 2),
  ('02300000-0000-4000-8000-000000001067', '02300000-0000-4000-8000-000000000517', 'a static block', FALSE, 3),
  ('02300000-0000-4000-8000-000000001068', '02300000-0000-4000-8000-000000000517', 'a local variable', FALSE, 4),
  -- Q6 (516)q3: interface
  ('02300000-0000-4000-8000-000000001069', '02300000-0000-4000-8000-000000000518', 'an interface', TRUE,  1),
  ('02300000-0000-4000-8000-000000001070', '02300000-0000-4000-8000-000000000518', 'an abstract class', FALSE, 2),
  ('02300000-0000-4000-8000-000000001071', '02300000-0000-4000-8000-000000000518', 'a concrete class', FALSE, 3),
  ('02300000-0000-4000-8000-000000001072', '02300000-0000-4000-8000-000000000518', 'an inner record', FALSE, 4),
  -- Q7 (519): composition over inheritance
  ('02300000-0000-4000-8000-000000001073', '02300000-0000-4000-8000-000000000519', 'Build objects from smaller objects instead of deep hierarchies', TRUE,  1),
  ('02300000-0000-4000-8000-000000001074', '02300000-0000-4000-8000-000000000519', 'Always inherit from exactly one parent', FALSE, 2),
  ('02300000-0000-4000-8000-000000001075', '02300000-0000-4000-8000-000000000519', 'Never use classes', FALSE, 3),
  ('02300000-0000-4000-8000-000000001076', '02300000-0000-4000-8000-000000000519', 'Copy every method into each subclass', FALSE, 4),
  -- Q7 (519)q2: library owns books
  ('02300000-0000-4000-8000-000000001077', '02300000-0000-4000-8000-000000000520', 'Composition', TRUE,  1),
  ('02300000-0000-4000-8000-000000001078', '02300000-0000-4000-8000-000000000520', 'Inheritance', FALSE, 2),
  ('02300000-0000-4000-8000-000000001079', '02300000-0000-4000-8000-000000000520', 'Cyclic dependency', FALSE, 3),
  ('02300000-0000-4000-8000-000000001080', '02300000-0000-4000-8000-000000000520', 'Dynamic dispatch', FALSE, 4),
  -- Q7 (519)q3: lifetime
  ('02300000-0000-4000-8000-000000001081', '02300000-0000-4000-8000-000000000521', 'The parts are created and destroyed with the whole', TRUE,  1),
  ('02300000-0000-4000-8000-000000001082', '02300000-0000-4000-8000-000000000521', 'Parts are always public', FALSE, 2),
  ('02300000-0000-4000-8000-000000001083', '02300000-0000-4000-8000-000000000521', 'Parts must be static', FALSE, 3),
  ('02300000-0000-4000-8000-000000001084', '02300000-0000-4000-8000-000000000521', 'Parts cannot hold data', FALSE, 4),
  -- Q8 (522): Java
  ('02300000-0000-4000-8000-000000001085', '02300000-0000-4000-8000-000000000522', 'Java', TRUE,  1),
  ('02300000-0000-4000-8000-000000001086', '02300000-0000-4000-8000-000000000522', 'C', FALSE, 2),
  ('02300000-0000-4000-8000-000000001087', '02300000-0000-4000-8000-000000000522', 'SQL', FALSE, 3),
  ('02300000-0000-4000-8000-000000001088', '02300000-0000-4000-8000-000000000522', 'HTML', FALSE, 4),
  -- Q8 (522)q2: python underscore
  ('02300000-0000-4000-8000-000000001089', '02300000-0000-4000-8000-000000000523', 'a leading underscore', TRUE,  1),
  ('02300000-0000-4000-8000-000000001090', '02300000-0000-4000-8000-000000000523', 'a leading dollar sign', FALSE, 2),
  ('02300000-0000-4000-8000-000000001091', '02300000-0000-4000-8000-000000000523', 'all capital letters', FALSE, 3),
  ('02300000-0000-4000-8000-000000001092', '02300000-0000-4000-8000-000000000523', 'a trailing exclamation mark', FALSE, 4),
  -- Q8 (522)q3: single responsibility
  ('02300000-0000-4000-8000-000000001093', '02300000-0000-4000-8000-000000000524', 'Single Responsibility Principle', TRUE,  1),
  ('02300000-0000-4000-8000-000000001094', '02300000-0000-4000-8000-000000000524', 'Liskov Substitution Principle', FALSE, 2),
  ('02300000-0000-4000-8000-000000001095', '02300000-0000-4000-8000-000000000524', 'Interface Segregation Principle', FALSE, 3),
  ('02300000-0000-4000-8000-000000001096', '02300000-0000-4000-8000-000000000524', 'Open/Closed Principle', FALSE, 4),
  -- Q9 (525): four pillars
  ('02300000-0000-4000-8000-000000001097', '02300000-0000-4000-8000-000000000525', 'encapsulation, abstraction, inheritance, polymorphism', TRUE,  1),
  ('02300000-0000-4000-8000-000000001098', '02300000-0000-4000-8000-000000000525', 'loops, branches, variables, constants', FALSE, 2),
  ('02300000-0000-4000-8000-000000001099', '02300000-0000-4000-8000-000000000525', 'classes, objects, modules, packages', FALSE, 3),
  ('02300000-0000-4000-8000-000000001100', '02300000-0000-4000-8000-000000000525', 'input, output, storage, network', FALSE, 4),
  -- Q9 (525)q2: final class
  ('02300000-0000-4000-8000-000000001101', '02300000-0000-4000-8000-000000000526', 'final', TRUE,  1),
  ('02300000-0000-4000-8000-000000001102', '02300000-0000-4000-8000-000000000526', 'stable', FALSE, 2),
  ('02300000-0000-4000-8000-000000001103', '02300000-0000-4000-8000-000000000526', 'locked', FALSE, 3),
  ('02300000-0000-4000-8000-000000001104', '02300000-0000-4000-8000-000000000526', 'closed', FALSE, 4),
  -- Q9 (525)q3: abstract class state
  ('02300000-0000-4000-8000-000000001105', '02300000-0000-4000-8000-000000000527', 'instance fields (state)', TRUE,  1),
  ('02300000-0000-4000-8000-000000001106', '02300000-0000-4000-8000-000000000527', 'method signatures only', FALSE, 2),
  ('02300000-0000-4000-8000-000000001107', '02300000-0000-4000-8000-000000000527', 'constructor names only', FALSE, 3),
  ('02300000-0000-4000-8000-000000001108', '02300000-0000-4000-8000-000000000527', 'built-in comparators', FALSE, 4),
  -- Q9 (525)q4: composition advantage
  ('02300000-0000-4000-8000-000000001109', '02300000-0000-4000-8000-000000000528', 'Flexibility to swap parts at runtime', TRUE,  1),
  ('02300000-0000-4000-8000-000000001110', '02300000-0000-4000-8000-000000000528', 'A guarantee of zero bugs', FALSE, 2),
  ('02300000-0000-4000-8000-000000001111', '02300000-0000-4000-8000-000000000528', 'Fewer files in the project', FALSE, 3),
  ('02300000-0000-4000-8000-000000001112', '02300000-0000-4000-8000-000000000528', 'Faster compiler performance', FALSE, 4),
  -- Q9 (525)q5: test units
  ('02300000-0000-4000-8000-000000001113', '02300000-0000-4000-8000-000000000529', 'Test the smallest units in isolation', TRUE,  1),
  ('02300000-0000-4000-8000-000000001114', '02300000-0000-4000-8000-000000000529', 'Start with ten nested integration tests', FALSE, 2),
  ('02300000-0000-4000-8000-000000001115', '02300000-0000-4000-8000-000000000529', 'Delete the tests to save time', FALSE, 3),
  ('02300000-0000-4000-8000-000000001116', '02300000-0000-4000-8000-000000000529', 'Only test the main method', FALSE, 4)
ON CONFLICT (id) DO NOTHING;
-- ============================================================================
-- SEED 014: Complete course — "TypeScript for Web Developers"
-- ----------------------------------------------------------------------------
-- Instructor : Sarah Chen        (10000000-0000-4000-8000-000000000001)
-- Category   : Web Development   (20000000-0000-4000-8000-000000000001)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 TypeScript Foundations      → C1 Why TypeScript & Setting Up · C2 Types, Variables & Functions
--   M2 Interfaces & Advanced Types → C3 Interfaces & Type Aliases · C4 Advanced Types & Type Narrowing
--   M3 Generics & Classes          → C5 Generics & Utility Types · C6 Classes & OOP Patterns
--   M4 Modules & Tooling           → C7 Modules & Compilation · C8 Frameworks & Developer Tooling
--   M5 Capstone: Task Manager      → C9 Project Setup & Data Models · C10 Building & Polishing
--
-- UUID block: 0E000000-0000-4000-8000-000000000001 .. 0E000000-0000-4000-8000-000000001116
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
  '0E000000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000001',
  '20000000-0000-4000-8000-000000000001',
  'TypeScript for Web Developers',
  'typescript-for-web-developers',
  'Write types that prevent whole classes of bugs before they ship. Master primitives, interfaces, generics, classes, narrowing, and modules — then integrate TypeScript with real frameworks and build a complete typed web application.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  12
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('0E000000-0000-4000-8000-000000000011', '0E000000-0000-4000-8000-000000000001', 'Set up the TypeScript toolchain and know exactly what the compiler does for you.', 1),
  ('0E000000-0000-4000-8000-000000000012', '0E000000-0000-4000-8000-000000000001', 'Annotate values and functions with primitives, unions, interfaces, and advanced types.', 2),
  ('0E000000-0000-4000-8000-000000000013', '0E000000-0000-4000-8000-000000000001', 'Write reusable generic components and encapsulate state with typed classes.',          3),
  ('0E000000-0000-4000-8000-000000000014', '0E000000-0000-4000-8000-000000000001', 'Configure tsconfig, structure code with modules, and use TypeScript with React and tooling.', 4),
  ('0E000000-0000-4000-8000-000000000015', '0E000000-0000-4000-8000-000000000001', 'Build and polish a complete typed web application with persistence and error handling.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('0E000000-0000-4000-8000-000000000101', '0E000000-0000-4000-8000-000000000001', 1, 'TypeScript Foundations',       'Why TypeScript exists, how it is installed, and the primitives that make up typed JavaScript.', 'PUBLISHED'),
  ('0E000000-0000-4000-8000-000000000102', '0E000000-0000-4000-8000-000000000001', 2, 'Interfaces & Advanced Types',  'Describe data precisely with interfaces, aliases, unions, and narrowing.',                   'PUBLISHED'),
  ('0E000000-0000-4000-8000-000000000103', '0E000000-0000-4000-8000-000000000001', 3, 'Generics & Classes',           'Build reusable and object-oriented TypeScript with generics and classes.',                    'PUBLISHED'),
  ('0E000000-0000-4000-8000-000000000104', '0E000000-0000-4000-8000-000000000001', 4, 'Modules & Tooling',            'Structure code, configure the compiler, and integrate with frameworks and tools.',            'PUBLISHED'),
  ('0E000000-0000-4000-8000-000000000105', '0E000000-0000-4000-8000-000000000001', 5, 'Capstone: Task Manager',       'Build a complete typed task manager application from scratch.',                               'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('0E000000-0000-4000-8000-000000000201', '0E000000-0000-4000-8000-000000000101', 1, 'Why TypeScript & Setting Up',      'The motivation for TypeScript and a working first setup.',                       'PUBLISHED'),
  ('0E000000-0000-4000-8000-000000000202', '0E000000-0000-4000-8000-000000000101', 2, 'Types, Variables & Functions',      'Build the vocabulary of typed values and functions.',                             'PUBLISHED'),
  ('0E000000-0000-4000-8000-000000000203', '0E000000-0000-4000-8000-000000000102', 1, 'Interfaces & Type Aliases',         'Shape your data with clear, reusable contracts.',                                 'PUBLISHED'),
  ('0E000000-0000-4000-8000-000000000204', '0E000000-0000-4000-8000-000000000102', 2, 'Advanced Types & Type Narrowing',   'Model complex domains with unions and runtime checks.',                           'PUBLISHED'),
  ('0E000000-0000-4000-8000-000000000205', '0E000000-0000-4000-8000-000000000103', 1, 'Generics & Utility Types',          'Write reusable code that adapts to any type.',                                   'PUBLISHED'),
  ('0E000000-0000-4000-8000-000000000206', '0E000000-0000-4000-8000-000000000103', 2, 'Classes & OOP Patterns',            'Encapsulate state and behavior with classes.',                                   'PUBLISHED'),
  ('0E000000-0000-4000-8000-000000000207', '0E000000-0000-4000-8000-000000000104', 1, 'Modules & Compilation',             'Organize files and control how the compiler emits code.',                         'PUBLISHED'),
  ('0E000000-0000-4000-8000-000000000208', '0E000000-0000-4000-8000-000000000104', 2, 'Frameworks & Developer Tooling',    'Use TypeScript with React, tests, and editors.',                                  'PUBLISHED'),
  ('0E000000-0000-4000-8000-000000000209', '0E000000-0000-4000-8000-000000000105', 1, 'Project Setup & Data Models',       'Scaffold the capstone and design its type model.',                                'PUBLISHED'),
  ('0E000000-0000-4000-8000-000000000210', '0E000000-0000-4000-8000-000000000105', 2, 'Building & Polishing',              'Assemble the app, add persistence, and harden it.',                               'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 0E000000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('0E000000-0000-4000-8000-000000000301', '0E000000-0000-4000-8000-000000000201', 1, 'What is TypeScript?',                'Understand what TypeScript adds to JavaScript and why teams adopt it.',           'TEXT',  'PUBLISHED', 'FREE', 10,  6),
  ('0E000000-0000-4000-8000-000000000302', '0E000000-0000-4000-8000-000000000201', 2, 'Setting Up a TypeScript Project',     'Install Node, TypeScript, and tsconfig, then compile your first file.',            'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('0E000000-0000-4000-8000-000000000303', '0E000000-0000-4000-8000-000000000201', 3, 'TypeScript Foundations Quiz',         'Check what you know about TypeScript fundamentals.',                               'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('0E000000-0000-4000-8000-000000000304', '0E000000-0000-4000-8000-000000000202', 1, 'Primitive Types & Variables',         'Annotate strings, numbers, booleans, arrays, and tuples.',                         'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('0E000000-0000-4000-8000-000000000305', '0E000000-0000-4000-8000-000000000202', 2, 'Functions & Type Annotations',        'Type parameters, return values, and full function signatures.',                    'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('0E000000-0000-4000-8000-000000000306', '0E000000-0000-4000-8000-000000000202', 3, 'Core Types Quiz',                     'Verify your grasp of primitives and functions.',                                  'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('0E000000-0000-4000-8000-000000000307', '0E000000-0000-4000-8000-000000000203', 1, 'Objects & Interfaces',                'Describe object shapes and enforce contracts structurally.',                       'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('0E000000-0000-4000-8000-000000000308', '0E000000-0000-4000-8000-000000000203', 2, 'Type Aliases & Literal Types',        'Name shapes and constrain values to fixed sets.',                                 'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('0E000000-0000-4000-8000-000000000309', '0E000000-0000-4000-8000-000000000203', 3, 'Interfaces & Aliases Quiz',           'Check your interface and type alias knowledge.',                                  'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('0E000000-0000-4000-8000-000000000310', '0E000000-0000-4000-8000-000000000204', 1, 'Unions & Advanced Types',             'Combine types with unions, intersections, and unknown.',                           'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('0E000000-0000-4000-8000-000000000311', '0E000000-0000-4000-8000-000000000204', 2, 'Type Narrowing',                      'Shrink a union to a concrete type with runtime checks.',                           'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('0E000000-0000-4000-8000-000000000312', '0E000000-0000-4000-8000-000000000204', 3, 'Advanced Types Quiz',                 'Test your union and narrowing skills.',                                           'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('0E000000-0000-4000-8000-000000000313', '0E000000-0000-4000-8000-000000000205', 1, 'Generics',                            'Build reusable components that work over many types.',                            'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('0E000000-0000-4000-8000-000000000314', '0E000000-0000-4000-8000-000000000205', 2, 'Utility Types',                       'Use built-ins like Partial, Pick, Omit, and Record.',                              'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('0E000000-0000-4000-8000-000000000315', '0E000000-0000-4000-8000-000000000205', 3, 'Generics Quiz',                       'Verify your generic and utility type knowledge.',                                  'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('0E000000-0000-4000-8000-000000000316', '0E000000-0000-4000-8000-000000000206', 1, 'Classes & Access Modifiers',          'Encapsulate state with public, private, protected, and readonly.',                 'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('0E000000-0000-4000-8000-000000000317', '0E000000-0000-4000-8000-000000000206', 2, 'Inheritance & Polymorphism',          'Extend classes and override behavior safely.',                                     'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('0E000000-0000-4000-8000-000000000318', '0E000000-0000-4000-8000-000000000206', 3, 'Classes Quiz',                        'Check your understanding of classes and modifiers.',                               'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('0E000000-0000-4000-8000-000000000319', '0E000000-0000-4000-8000-000000000207', 1, 'ES Modules & Type Imports',           'Split code into modules and import types cleanly.',                                'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('0E000000-0000-4000-8000-000000000320', '0E000000-0000-4000-8000-000000000207', 2, 'tsconfig & Build Options',            'Tune compiler options for strictness, targets, and output.',                       'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('0E000000-0000-4000-8000-000000000321', '0E000000-0000-4000-8000-000000000207', 3, 'Modules & Config Quiz',               'Test your module and tsconfig knowledge.',                                         'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('0E000000-0000-4000-8000-000000000322', '0E000000-0000-4000-8000-000000000208', 1, 'TypeScript with React',               'Type props, events, and state in React components.',                               'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('0E000000-0000-4000-8000-000000000323', '0E000000-0000-4000-8000-000000000208', 2, 'Testing & Editor Tooling',            'Run type checks in CI and debug types in the editor.',                             'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('0E000000-0000-4000-8000-000000000324', '0E000000-0000-4000-8000-000000000208', 3, 'Tooling Quiz',                        'Verify your framework and tooling knowledge.',                                     'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('0E000000-0000-4000-8000-000000000325', '0E000000-0000-4000-8000-000000000209', 1, 'Capstone: Project Setup & Data Models','Scaffold the typed task manager and model its domain data.',                        'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('0E000000-0000-4000-8000-000000000326', '0E000000-0000-4000-8000-000000000210', 1, 'Capstone: Building the Core Logic',   'Write pure typed services and a validating storage layer.',                         'TEXT',  'PUBLISHED', 'FREE', 10, 11),
  ('0E000000-0000-4000-8000-000000000327', '0E000000-0000-4000-8000-000000000210', 2, 'Capstone: UI, Persistence & Polishing','Wire typed renderers, events, persistence, and edge cases.',                        'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('0E000000-0000-4000-8000-000000000328', '0E000000-0000-4000-8000-000000000210', 3, 'Final Assessment',                    'Prove your TypeScript knowledge across the whole course.',                          'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 0E000000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '0E000000-0000-4000-8000-000000000401',
  '0E000000-0000-4000-8000-000000000301',
  1,
  'What is TypeScript?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What is TypeScript?</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #3178c6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #172554; color: #93c5fd; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #172554; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>What is TypeScript?</h1>
  <p>JavaScript runs everywhere, but large projects share one pain: typos, missing values, and wrong shapes surface only at runtime. <strong>TypeScript</strong> adds a static type system that catches these problems <em>before</em> the code ships.</p>
  <p>TypeScript is a <strong>superset of JavaScript</strong>: every valid JavaScript program is also valid TypeScript. The compiler checks your code, then erases the types — the plain JavaScript you already know is exactly what runs.</p>
  <h2>What the type system gives you</h2>
  <ul>
    <li><strong>Earlier discovery.</strong> Type errors appear in the editor and CI, not on your users screen.</li>
    <li><strong>Editor intelligence.</strong> Autocomplete, go-to-definition, and safe rename refactors.</li>
    <li><strong>Self-documentation.</strong> A signature reads like a contract for the reviewer.</li>
    <li><strong>Safe refactors.</strong> The compiler checks every call site as you reshape code.</li>
  </ul>
  <pre class="code-block">let greeting = 'hello';
greeting = 42;
// error: Type 'number' is not assignable to type 'string'.</pre>
  <div class="callout callout-info">
    <strong>Types are erased</strong>
    <p>Compilation removes every annotation — there is no runtime cost and no new behavior. What ships is ordinary JavaScript.</p>
  </div>
  <h2>JavaScript vs TypeScript</h2>
  <table>
    <tr><th>Aspect</th><th>JavaScript</th><th>TypeScript</th></tr>
    <tr><td>Type checking</td><td>Runtime only</td><td>Edit time and compile time</td></tr>
    <tr><td>Runs directly</td><td>Yes</td><td>Compiled first</td></tr>
    <tr><td>Annotations</td><td>None</td><td>Optional and incremental</td></tr>
  </table>
  <h2>What you will build</h2>
  <p>Across this course you will build a complete typed <strong>task manager</strong> — modeling its data, logic, and UI — ending in a polished, strictly-typed application you can keep and extend.</p>
  <div class="callout callout-tip">
    <strong>You already qualify</strong>
    <p>A working knowledge of JavaScript, HTML, and CSS is enough. TypeScript is a skill you add on top — not a fork of the language you know.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0E000000-0000-4000-8000-000000000402',
  '0E000000-0000-4000-8000-000000000302',
  1,
  'Setting Up a TypeScript Project',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Setting Up a TypeScript Project</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #3178c6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #172554; color: #93c5fd; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #172554; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Setting Up a TypeScript Project</h1>
  <p>You need three things: <strong>Node.js</strong> for the toolchain, the <span class="ic">typescript</span> package that provides the compiler, and a <span class="ic">tsconfig.json</span> that configures it.</p>
  <h2>Install the compiler</h2>
  <pre class="code-block">npm init -y
npm install --save-dev typescript
npx tsc --version   // e.g. 5.6.2</pre>
  <h2>Create tsconfig.json</h2>
  <p>There is no valid TypeScript project without a config file:</p>
  <pre class="code-block">npx tsc --init</pre>
  <p>The important options you will touch right away:</p>
  <table>
    <tr><th>Option</th><th>Effect</th></tr>
    <tr><td>target</td><td>Which JavaScript version the emitted code supports</td></tr>
    <tr><td>module</td><td>Which module system the output uses</td></tr>
    <tr><td>rootDir / outDir</td><td>Source folder and output folder</td></tr>
    <tr><td>strict</td><td>Enable the full compiler safety net</td></tr>
  </table>
  <h2>Compile your first file</h2>
  <pre class="code-block">export function greet(name: string): string {
  return 'Hello, ' + name + '!';
}

npx tsc                // compile once
npx tsc --watch        // recompile on every save</pre>
  <div class="callout callout-info">
    <strong>Type-check only mode</strong>
    <p><span class="ic">tsc --noEmit</span> checks types without writing output files. CI pipelines use it to gate every commit.</p>
  </div>
  <h2>Or use a starter</h2>
  <p>Frameworks ship their own setups. Vite scaffolds React, Vue, or vanilla projects that are TypeScript-ready:</p>
  <pre class="code-block">npm create vite@latest task-runner -- --template vanilla-ts</pre>
  <div class="callout callout-tip">
    <strong>Pin the version</strong>
    <p>Install TypeScript as a devDependency pinned to a version, so every developer and CI run uses byte-identical compiler behavior.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0E000000-0000-4000-8000-000000000404',
  '0E000000-0000-4000-8000-000000000304',
  1,
  'Primitive Types & Variables',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Primitive Types &amp; Variables</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #3178c6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #172554; color: #93c5fd; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #172554; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Primitive Types &amp; Variables</h1>
  <p>TypeScript reuses the JavaScript value system and adds <strong>annotations</strong> — a colon followed by a type name that says what a variable is allowed to hold.</p>
  <h2>The primitive types</h2>
  <table>
    <tr><th>Type</th><th>Example</th><th>Notes</th></tr>
    <tr><td>string</td><td>'hello'</td><td>Text values</td></tr>
    <tr><td>number</td><td>42, 3.14, NaN</td><td>Whole and fractional numbers</td></tr>
    <tr><td>boolean</td><td>true / false</td><td>Two truth values</td></tr>
    <tr><td>bigint</td><td>9007199254740993n</td><td>Arbitrary precision integers</td></tr>
    <tr><td>symbol</td><td>Symbol('tag')</td><td>Unique identity keys</td></tr>
    <tr><td>null / undefined</td><td>null, undefined</td><td>Absent values</td></tr>
    <tr><td>void</td><td>void</td><td>A return value that is unused</td></tr>
  </table>
  <h2>Annotated variables</h2>
  <pre class="code-block">const name: string = 'Ada';
let age: number = 36;
const isAdmin: boolean = true;</pre>
  <h2>Let inference do the work</h2>
  <p>You rarely need to annotate a simple initialization — the compiler infers the type from the value:</p>
  <pre class="code-block">const title = 'Task runner';   // inferred as string
let count = 0;                  // inferred as number
count = 'fast';                 // error: string is not assignable to number</pre>
  <h2>Arrays and tuples</h2>
  <pre class="code-block">const tags: string[] = ['web', 'typescript'];
const scores: Array&lt;number&gt; = [10, 8, 9];   // same meaning
tags.push('ts');

const rgb: [number, number, number] = [255, 0, 0];   // fixed-length tuple</pre>
  <div class="callout callout-info">
    <strong>any is the escape hatch</strong>
    <p><span class="ic">any</span> disables checking for a value. It looks fast and becomes a trap — prefer <span class="ic">unknown</span> plus a check when the shape is unknown.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Annotate where inference is weak</strong>
    <p>Empty arrays, function parameters, and the returns of exported functions deserve explicit types. The compiler stays strict while obvious cases stay terse.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0E000000-0000-4000-8000-000000000405',
  '0E000000-0000-4000-8000-000000000305',
  1,
  'Functions & Type Annotations',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Functions &amp; Type Annotations</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #3178c6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #172554; color: #93c5fd; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #172554; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Functions &amp; Type Annotations</h1>
  <p>Functions are where types earn their keep. Parameters get input types, the body is checked, and the return value is verified — every call site is validated too.</p>
  <h2>Parameter and return types</h2>
  <pre class="code-block">function add(a: number, b: number): number {
  return a + b;
}

const total = add(2, 3);      // number
add('two', 3);                // error: string is not assignable to number</pre>
  <h2>Arrow functions and callbacks</h2>
  <pre class="code-block">const double = (x: number): number =&gt; x * 2;

const labels = [1, 2, 3].map((n) =&gt; 'Item ' + n);   // string[]</pre>
  <p>Callbacks get <strong>contextual typing</strong>: <span class="ic">Array.map</span> knows what the callback receives and returns, so annotations become optional.</p>
  <h2>Optional, default, and rest parameters</h2>
  <pre class="code-block">function greet(name: string, greeting = 'Hello'): string {
  return greeting + ', ' + name + '!';
}

function sum(...nums: number[]): number {
  return nums.reduce((a, b) =&gt; a + b, 0);
}</pre>
  <table>
    <tr><th>Signature</th><th>Meaning</th></tr>
    <tr><td>name?: string</td><td>Optional — may be undefined</td></tr>
    <tr><td>name = 'Ada'</td><td>Optional with a default value</td></tr>
    <tr><td>...nums: number[]</td><td>Collects the remaining arguments</td></tr>
  </table>
  <h2>void and never</h2>
  <pre class="code-block">function log(message: string): void {
  console.log(message);
}

function fail(reason: string): never {
  throw new Error(reason);
}</pre>
  <div class="callout callout-tip">
    <strong>Never skip return types on exports</strong>
    <p>An explicit return type documents intent at a glance and catches accidental changes to a public signature.</p>
  </div>
  <div class="callout callout-info">
    <strong>Destructured parameters</strong>
    <p>Type the whole object, not the parts: <span class="ic">function draw({ x, y }: Point)</span>. Interfaces are exactly how you describe that </int>. The next lesson builds them.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0E000000-0000-4000-8000-000000000407',
  '0E000000-0000-4000-8000-000000000307',
  1,
  'Objects & Interfaces',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Objects &amp; Interfaces</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #3178c6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #172554; color: #93c5fd; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #172554; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Objects &amp; Interfaces</h1>
  <p>An <strong>interface</strong> describes the shape of an object: which properties exist and what type each holds. TypeScript is <strong>structural</strong> — any object with that shape is accepted.</p>
  <h2>Describing a shape</h2>
  <pre class="code-block">interface User {
  id: number;
  name: string;
  email: string;
}

function describe(user: User): string {
  return user.name + ' &lt;' + user.email + '&gt;';
}</pre>
  <h2>Structural typing</h2>
  <p>No class and no implements keyword is needed. If the object has the required members with compatible types, it is a <span class="ic">User</span>:</p>
  <pre class="code-block">const account = { id: 7, name: 'Ada', email: 'ada@dev.io' };
describe(account);   // fine — same shape</pre>
  <div class="callout callout-tip">
    <strong>Excess property checks</strong>
    <p>Assigning an object <em>literal</em> with an extra property errors, while a variable with the same shape passes — catching typos like <span class="ic">namee</span> without punishing reused objects.</p>
  </div>
  <h2>Flexible interface features</h2>
  <pre class="code-block">interface Config {
  readonly id: string;
  theme: string;
  cache?: boolean;
  [key: string]: unknown;
}</pre>
  <table>
    <tr><th>Feature</th><th>Syntax</th><th>Purpose</th></tr>
    <tr><td>Optional</td><td>cache?: boolean</td><td>Property may be absent</td></tr>
    <tr><td>Readonly</td><td>readonly id</td><td>Block reassignment</td></tr>
    <tr><td>Method</td><td>getName(): string</td><td>Required callable member</td></tr>
    <tr><td>Index signature</td><td>[key: string]: unknown</td><td>Unknown keys allowed</td></tr>
  </table>
  <h2>Extending interfaces</h2>
  <pre class="code-block">interface Employee extends User {
  role: 'admin' | 'editor';
  hireDate: Date;
}</pre>
  <div class="callout callout-info">
    <strong>Start from the data</strong>
    <p>Model the entities your feature handles first — a task, a user, a response. Clean interfaces make every downstream function trivial to type.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0E000000-0000-4000-8000-000000000408',
  '0E000000-0000-4000-8000-000000000308',
  1,
  'Type Aliases & Literal Types',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Type Aliases &amp; Literal Types</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #3178c6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #172554; color: #93c5fd; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #172554; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Type Aliases &amp; Literal Types</h1>
  <p>A <strong>type alias</strong> gives a name to any type — not just objects. Unions, tuples, functions, and primitives can all be aliased behind a descriptive name.</p>
  <h2>Naming any type</h2>
  <pre class="code-block">type Point = { x: number; y: number };
type Callback = (err: Error | null, point: Point) =&gt; void;
type Price = number | string;</pre>
  <h2>Literal types</h2>
  <p>A literal type has exactly one value. Union them to build a safe set of allowed options:</p>
  <pre class="code-block">type Unit = 'metric' | 'imperial';
type Status = 'draft' | 'published';

const unit: Unit = 'metric';
unit = 'kelvin';
// error: Type ''kelvin'' is not assignable to type 'Unit'.</pre>
  <h2>Interfaces vs type aliases</h2>
  <table>
    <tr><th>Capability</th><th>Interface</th><th>Type alias</th></tr>
    <tr><td>Extend or merge</td><td>Yes</td><td>No</td></tr>
    <tr><td>Alias a union or tuple</td><td>No</td><td>Yes</td></tr>
    <tr><td>Alias primitives</td><td>No</td><td>Yes</td></tr>
    <tr><td>Computed property keys</td><td>No</td><td>Yes</td></tr>
  </table>
  <h2>Combining aliases with intersections</h2>
  <pre class="code-block">type Named = { name: string };
type Aged = { age: number };
type Person = Named &amp; Aged;   // both property groups</pre>
  <div class="callout callout-tip">
    <strong>Const assertion</strong>
    <p><span class="ic">as const</span> makes a whole object literal deeply readonly with literal values — perfect for fixed lookup tables.</p>
  </div>
  <div class="callout callout-info">
    <strong>Rule of thumb</strong>
    <p>Use <strong>interfaces</strong> for object shapes that may grow, and <strong>aliases</strong> whenever you need a union, tuple, or renamed primitive. Both are erased at compile time.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0E000000-0000-4000-8000-000000000410',
  '0E000000-0000-4000-8000-000000000310',
  1,
  'Unions & Advanced Types',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Unions &amp; Advanced Types</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #3178c6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #172554; color: #93c5fd; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #172554; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Unions &amp; Advanced Types</h1>
  <p>Real data is rarely one single type. <strong>Unions</strong> say "one of these", <strong>intersections</strong> say "all of these", and a few syntax conveniences keep the plumbing readable.</p>
  <h2>Union types</h2>
  <pre class="code-block">type Id = number | string;

function lookUp(id: Id) {
  return typeof id === 'number' ? id : id.toUpperCase();
}</pre>
  <h2>Nullable pattern</h2>
  <pre class="code-block">type MaybeTask = Task | null;
const first: MaybeTask = tasks.length ? tasks[0] : null;</pre>
  <p>With <span class="ic">strictNullChecks</span> (on under <span class="ic">strict</span>), null and undefined are only accepted where the type says so.</p>
  <h2>Optional chaining and nullish coalescing</h2>
  <pre class="code-block">const label = task?.title ?? 'Untitled';
const tag = task?.tags?.[0] ?? 'none';
const total = (a ?? 0) + (b ?? 0);</pre>
  <ul>
    <li><span class="ic">?.</span> returns <span class="ic">undefined</span> instead of throwing on null or undefined.</li>
    <li><span class="ic">??</span> picks the fallback only on null or undefined — unlike <span class="ic">||</span>, it does not skip falsy values like 0 and empty strings.</li>
  </ul>
  <h2>unknown vs any</h2>
  <table>
    <tr><th>Type</th><th>Assignable to others</th><th>What can you do with it?</th></tr>
    <tr><td>any</td><td>Yes, everywhere</td><td>Anything — unchecked</td></tr>
    <tr><td>unknown</td><td>No, narrow first</td><td>Only after a check</td></tr>
    <tr><td>never</td><td>Yes, to everything</td><td>Nothing — represents impossible</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Prefer unknown</strong>
    <p>Data from outside — JSON, form fields, storage — should enter as <span class="ic">unknown</span> and be validated, then narrowed to a known shape.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Beware the non-null assertion</strong>
    <p><span class="ic">value!</span> promises the compiler a value is not null. It is a promise, not a check — reach for it last, after optional chaining and narrowing are exhausted.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0E000000-0000-4000-8000-000000000411',
  '0E000000-0000-4000-8000-000000000311',
  1,
  'Type Narrowing',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Type Narrowing</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #3178c6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #172554; color: #93c5fd; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #172554; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Type Narrowing</h1>
  <p>The compiler cannot know which member of a union a value holds at runtime. <strong>Narrowing</strong> uses runtime checks so TypeScript shrinks the type inside each branch.</p>
  <h2>typeof narrowing</h2>
  <pre class="code-block">function format(value: string | number): string {
  if (typeof value === 'string') return value.toUpperCase();
  return value.toFixed(2);
}</pre>
  <h2>Array.isArray and truthiness</h2>
  <pre class="code-block">function total(input: number | number[]): number {
  if (Array.isArray(input)) return input.reduce((a, b) =&gt; a + b, 0);
  return input;
}</pre>
  <h2>Discriminated unions</h2>
  <p>When every member of a union shares a literal <strong>discriminant</strong> field, the compiler narrows by it — this is the workhorse pattern of typed web apps:</p>
  <pre class="code-block">type Circle = { kind: 'circle'; radius: number };
type Square = { kind: 'square'; side: number };
type Shape = Circle | Square;

function area(shape: Shape): number {
  switch (shape.kind) {
    case 'circle': return Math.PI * shape.radius ** 2;
    case 'square': return shape.side * shape.side;
  }
}</pre>
  <div class="callout callout-info">
    <strong>Exhaustiveness</strong>
    <p>End a switch over a discriminated union with an unreachable check so a new variant fails the build until every branch handles it:</p>
  </div>
  <pre class="code-block">function assertNever(value: never): never {
  throw new Error('Unexpected variant: ' + value);
}</pre>
  <h2>in narrowing for objects</h2>
  <pre class="code-block">if ('radius' in shape) {
  shape.radius;   // narrowed to Circle
}</pre>
  <div class="callout callout-tip">
    <strong>Narrow early</strong>
    <p>Check inputs at the top of the function and return — the rest of the body then reads against a known, narrowed type. Deep nested conditionals are a code smell.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0E000000-0000-4000-8000-000000000413',
  '0E000000-0000-4000-8000-000000000313',
  1,
  'Generics',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Generics</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #3178c6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #172554; color: #93c5fd; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #172554; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Generics</h1>
  <p>A <strong>generic</strong> captures the type used at the call site and keeps the relationship between inputs and outputs intact — one function, many types, fully checked.</p>
  <h2>Identity, the first generic</h2>
  <pre class="code-block">function identity&lt;T&gt;(value: T): T {
  return value;
}

const n = identity(42);      // T inferred as number
const label = identity('go'); // T inferred as string</pre>
  <h2>Generic with an array</h2>
  <pre class="code-block">function first&lt;T&gt;(items: T[]): T | undefined {
  return items[0];
}

const head = first([1, 2, 3]);        // number | undefined
const tag = first(['a', 'b', 'c']);   // string | undefined</pre>
  <h2>Constraining type parameters</h2>
  <p><span class="ic">extends</span> limits what the caller may supply so the body can rely on real capabilities:</p>
  <pre class="code-block">interface HasLength {
  length: number;
}

function longest&lt;T extends HasLength&gt;(a: T, b: T): T {
  return a.length &gt;= b.length ? a : b;
}

longest('cat', 'dolphin');   // ok — strings have length
longest(42, 10);             // error: number has no length property</pre>
  <h2>Generic interfaces and classes</h2>
  <pre class="code-block">interface Box&lt;T&gt; {
  value: T;
}

class Stack&lt;T&gt; {
  private items: T[] = [];
  push(item: T): void {
    this.items.push(item);
  }
  pop(): T | undefined {
    return this.items.pop();
  }
}</pre>
  <div class="callout callout-info">
    <strong>Defaults</strong>
    <p>Provide a default when callers usually do not care: <span class="ic">interface Result&lt;T, E = Error&gt;</span>.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Let inference do the naming</strong>
    <p>Write <span class="ic">first(items)</span> and let T be inferred. Annotations belong on the declaration side, not duplicated at every call site.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0E000000-0000-4000-8000-000000000414',
  '0E000000-0000-4000-8000-000000000314',
  1,
  'Utility Types',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Utility Types</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #3178c6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #172554; color: #93c5fd; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #172554; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Utility Types</h1>
  <p>Every TypeScript install ships a toolbox of <strong>utility types</strong> that transform one type into another — no manual rewriting of the same shape twice.</p>
  <h2>The essentials</h2>
  <table>
    <tr><th>Utility</th><th>Produces</th><th>Example use</th></tr>
    <tr><td>Partial&lt;T&gt;</td><td>All properties optional</td><td>Form drafts</td></tr>
    <tr><td>Required&lt;T&gt;</td><td>All properties required</td><td>Committed records</td></tr>
    <tr><td>Readonly&lt;T&gt;</td><td>All properties readonly</td><td>Immutable snapshots</td></tr>
    <tr><td>Pick&lt;T, K&gt;</td><td>Only the chosen keys</td><td>Summary views</td></tr>
    <tr><td>Omit&lt;T, K&gt;</td><td>All keys except chosen</td><td>Creates without id</td></tr>
    <tr><td>Record&lt;K, V&gt;</td><td>Key-to-value map</td><td>Lookup tables</td></tr>
    <tr><td>ReturnType&lt;F&gt;</td><td>Return value of a function</td><td>Reuse a derived type</td></tr>
  </table>
  <h2>Working with the toolbox</h2>
  <pre class="code-block">interface Todo {
  id: number;
  title: string;
  done: boolean;
}

type Draft = Partial&lt;Todo&gt;;             // fields optional
type NewTodo = Omit&lt;Todo, 'id'&gt;;        // id not yet assigned
type Summary = Pick&lt;Todo, 'id' | 'title'&gt;;
type StatusMap = Record&lt;string, boolean&gt;;</pre>
  <h2>Combining with generics</h2>
  <pre class="code-block">function merge&lt;T&gt;(base: T, patch: Partial&lt;T&gt;): T {
  return { ...base, ...patch };
}</pre>
  <h2>Writing a mapped type</h2>
  <p>When the built-ins fall short, a <strong>mapped type</strong> walks every key of another type:</p>
  <pre class="code-block">type Nullable&lt;T&gt; = {
  [K in keyof T]: T[K] | null;
};

type NullableTodo = Nullable&lt;Todo&gt;;</pre>
  <div class="callout callout-tip">
    <strong>Stick to the toolbox first</strong>
    <p>Partial, Pick, and Record solve most day-to-day reshaping. Reach for a hand-written mapped or conditional type only when the built-ins cannot express it.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0E000000-0000-4000-8000-000000000416',
  '0E000000-0000-4000-8000-000000000316',
  1,
  'Classes & Access Modifiers',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Classes &amp; Access Modifiers</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #3178c6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #172554; color: #93c5fd; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #172554; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Classes &amp; Access Modifiers</h1>
  <p>Classes bundle state and behavior. TypeScript adds <strong>access modifiers</strong> that control who may touch each member — enforced at compile time, not by convention alone.</p>
  <h2>A typed class</h2>
  <pre class="code-block">class Counter {
  private count = 0;
  readonly label = 'Counter';

  constructor(private step = 1) {}

  increment(): void {
    this.count += this.step;
  }

  get value(): number {
    return this.count;
  }
}

const c = new Counter(2);
c.increment();
console.log(c.value);   // 2
c.count;                // error: property is private</pre>
  <h2>Access modifiers</h2>
  <table>
    <tr><th>Modifier</th><th>Who can access</th></tr>
    <tr><td>public</td><td>Everyone — the default</td></tr>
    <tr><td>private</td><td>Only inside the declaring class</td></tr>
    <tr><td>protected</td><td>Inside the class and its subclasses</td></tr>
    <tr><td>readonly</td><td>Readable everywhere, assignable once</td></tr>
    <tr><td>static</td><td>Belongs to the class, not instances</td></tr>
  </table>
  <p>A constructor parameter with an access modifier creates and assigns the field in one step — a <strong>parameter property</strong>:</p>
  <pre class="code-block">class Task {
  constructor(
    readonly id: string,
    public title: string,
    private createdAt: number = Date.now(),
  ) {}
}</pre>
  <div class="callout callout-tip">
    <strong>Hide the guts</strong>
    <p>Keep fields private and expose behavior through methods. Callers cannot corrupt internal state and the implementation stays free to change.</p>
  </div>
  <div class="callout callout-info">
    <strong>Checked, not boxed</strong>
    <p>Access modifiers are type-level contracts that compile away — not runtime security. The emitted JavaScript is still honest about what is inside.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0E000000-0000-4000-8000-000000000417',
  '0E000000-0000-4000-8000-000000000317',
  1,
  'Inheritance & Polymorphism',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Inheritance &amp; Polymorphism</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #3178c6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #172554; color: #93c5fd; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #172554; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Inheritance &amp; Polymorphism</h1>
  <p><strong>Inheritance</strong> lets a subclass reuse and extend its parent. TypeScript checks the relationship, so overrides cannot silently drift out of sync.</p>
  <h2>Extending a class</h2>
  <pre class="code-block">class Animal {
  constructor(public name: string) {}
  speak(): string {
    return this.name + ' makes a sound';
  }
}

class Dog extends Animal {
  override speak(): string {
    return this.name + ' barks';
  }
}

const rex = new Dog('Rex');
console.log(rex.speak());   // Rex barks</pre>
  <div class="callout callout-info">
    <strong>The override keyword</strong>
    <p>Marking overrides with <span class="ic">override</span> makes the compiler complain if the parent method changes or disappears — catching signature drift at compile time.</p>
  </div>
  <h2>Abstract classes</h2>
  <p>An <strong>abstract</strong> class can declare methods it does not implement, forcing subclasses to fill them in:</p>
  <pre class="code-block">abstract class Notifier {
  abstract send(message: string): void;

  notifyAll(messages: string[]): void {
    messages.forEach((m) =&gt; this.send(m));
  }
}

class EmailNotifier extends Notifier {
  send(message: string): void {
    console.log('Email:', message);
  }
}</pre>
  <h2>Protected and generic stores</h2>
  <pre class="code-block">class Store&lt;T&gt; {
  protected items: T[] = [];
  add(item: T): void {
    this.items.push(item);
  }
}</pre>
  <table>
    <tr><th>Pattern</th><th>When to use</th></tr>
    <tr><td>extends + override</td><td>A subclass genuinely is-a variant</td></tr>
    <tr><td>abstract base</td><td>Shared behavior, varied steps</td></tr>
    <tr><td>Composition</td><td>Reuse behavior without a shared tree</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Prefer composition</strong>
    <p>Deep inheritance chains become hard to reason about. Favor small classes that own typed collaborators over copying behavior down a long tree.</p>
  </div>
  <div class="callout callout-info">
    <strong>protected vs private</strong>
    <p>Subclasses may read <span class="ic">protected</span> members but never <span class="ic">private</span> ones. Pick protected only when a base class genuinely wants to share its internals.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0E000000-0000-4000-8000-000000000419',
  '0E000000-0000-4000-8000-000000000319',
  1,
  'ES Modules & Type Imports',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ES Modules &amp; Type Imports</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #3178c6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #172554; color: #93c5fd; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #172554; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>ES Modules &amp; Type Imports</h1>
  <p>Modules split code into files with explicit boundaries: <span class="ic">export</span> makes things public, <span class="ic">import</span> pulls them in. TypeScript extends the model with <strong>type-only imports</strong>.</p>
  <h2>Exporting and importing values</h2>
  <pre class="code-block">// models.ts
export interface User {
  id: number;
  name: string;
}
export const API_URL = '/api';

// app.ts
import { API_URL } from './models.js';
console.log(API_URL);</pre>
  <div class="callout callout-info">
    <strong>The .js extension</strong>
    <p>With Node-style resolution you import the compiled file name, <span class="ic">./models.js</span>, and TypeScript maps it back to <span class="ic">models.ts</span>.</p>
  </div>
  <h2>Type-only imports</h2>
  <pre class="code-block">import type { User } from './models.js';

function describe(user: User): string {
  return user.name;
}</pre>
  <ul>
    <li><span class="ic">import type</span> imports only types and erases to nothing in the output.</li>
    <li>A plain value import pulls real runtime code into the bundle.</li>
    <li>You can mix both: <span class="ic">import { API_URL, type User } from './models.js'</span>.</li>
  </ul>
  <h2>Default exports</h2>
  <pre class="code-block">// config.ts
export default { env: 'production', retries: 3 };</pre>
  <p>Default exports are convenient for a files main thing; named exports are explicit and less error-prone to rename.</p>
  <h2>What modules prevent</h2>
  <table>
    <tr><th>Problem</th><th>Without modules</th><th>With modules</th></tr>
    <tr><td>Global collision</td><td>Two files declare the same name</td><td>Scoped per file</td></tr>
    <tr><td>Hidden coupling</td><td>Any code reads anything</td><td>Explicit imports</td></tr>
    <tr><td>Tree shaking</td><td>Everything ships</td><td>Only what is imported</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>verbatimModuleSyntax</strong>
    <p>Enabling <span class="ic">verbatimModuleSyntax: true</span> in tsconfig makes the compiler demand the correct import style, keeping the emitted JavaScript honest.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0E000000-0000-4000-8000-000000000420',
  '0E000000-0000-4000-8000-000000000320',
  1,
  'tsconfig & Build Options',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>tsconfig &amp; Build Options</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #3178c6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #172554; color: #93c5fd; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #172554; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>tsconfig &amp; Build Options</h1>
  <p>tsconfig.json is the control center of a TypeScript project. A few options dominate the developer experience — especially everything under <span class="ic">strict</span>.</p>
  <h2>A sensible starting config</h2>
  <pre class="code-block">{
  "compilerOptions": {
    "target": "ES2022",
    "module": "commonjs",
    "moduleResolution": "node",
    "rootDir": "src",
    "outDir": "dist",
    "strict": true,
    "esModuleInterop": true,
    "skipLibCheck": true,
    "sourceMap": true,
    "noUnusedLocals": true
  },
  "include": ["src"]
}</pre>
  <h2>Options you will actually set</h2>
  <table>
    <tr><th>Option</th><th>Controls</th></tr>
    <tr><td>strict</td><td>The full safety net — null checks, implicit any, and more</td></tr>
    <tr><td>target</td><td>JavaScript version emitted for the runtime you support</td></tr>
    <tr><td>module / moduleResolution</td><td>Module system and resolution strategy</td></tr>
    <tr><td>rootDir / outDir</td><td>Source tree and compiled output folders</td></tr>
    <tr><td>noEmit</td><td>Type-check only, no output files</td></tr>
    <tr><td>declaration</td><td>Emit .d.ts files for library consumers</td></tr>
    <tr><td>sourceMap</td><td>Debug the bundled output against original sources</td></tr>
  </table>
  <h2>Why strict matters</h2>
  <p><span class="ic">strict</span> switches on a family of checks. The two that change everyday code the most:</p>
  <ul>
    <li><span class="ic">noImplicitAny</span> — bans parameters and values that silently fall back to <span class="ic">any</span>.</li>
    <li><span class="ic">strictNullChecks</span> — refuses to pretend null and undefined are harmless; every optional access becomes explicit.</li>
  </ul>
  <pre class="code-block">const title = document.getElementById('title').textContent;   // error: possibly null

const el = document.getElementById('title');
const title = el?.textContent ?? 'Untitled';   // handled</pre>
  <div class="callout callout-info">
    <strong>Turn it on now</strong>
    <p>Flipping strict on a legacy codebase is painful. Starting strict from lesson one costs nothing and the compiler pays you back on every refactor.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Three commands cover most days</strong>
    <p><span class="ic">tsc --noEmit</span> checks, <span class="ic">tsc --watch</span> re-checks on save, and <span class="ic">tsc</span> (or <span class="ic">npm run build</span>) emits the deployable output.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0E000000-0000-4000-8000-000000000422',
  '0E000000-0000-4000-8000-000000000322',
  1,
  'TypeScript with React',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TypeScript with React</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #3178c6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #172554; color: #93c5fd; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #172554; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>TypeScript with React</h1>
  <p>React and TypeScript pair perfectly: components are functions, so every prop contract is just a typed parameter object. Types turn a whole class of UI bugs into editor warnings.</p>
  <h2>Typed function components</h2>
  <pre class="code-block">interface ButtonProps {
  label: string;
  variant?: 'primary' | 'ghost';
  disabled?: boolean;
  onClick: () =&gt; void;
}

export function Button({ label, variant = 'primary', disabled = false, onClick }: ButtonProps) {
  return &lt;button className={variant} disabled={disabled} onClick={onClick}&gt;{label}&lt;/button&gt;;
}</pre>
  <h2>Typing state and refs</h2>
  <pre class="code-block">const [items, setItems] = useState&lt;Task[]&gt;([]);
const [draft, setDraft] = useState('');
const inputRef = useRef&lt;HTMLInputElement | null&gt;(null);</pre>
  <h2>Typing events</h2>
  <pre class="code-block">function handleSubmit(event: React.FormEvent&lt;HTMLFormElement&gt;): void {
  event.preventDefault();
  const form = new FormData(event.currentTarget);
  setDraft(String(form.get('title')));
}</pre>
  <h2>Common React-related types</h2>
  <table>
    <tr><th>Type</th><th>Where it appears</th></tr>
    <tr><td>React.ReactNode</td><td>children — anything React can render</td></tr>
    <tr><td>React.FC&lt;Props&gt;</td><td>Function component with typed props</td></tr>
    <tr><td>React.FormEvent&lt;T&gt;</td><td>Submit handlers</td></tr>
    <tr><td>React.ChangeEvent&lt;T&gt;</td><td>Input and select change events</td></tr>
    <tr><td>useState&lt;T&gt;</td><td>Typed state with its setter</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Children shape</strong>
    <p>Prefer <span class="ic">React.ReactNode</span> for the children prop — it covers strings, numbers, elements, fragments, and arrays.</p>
  </div>
  <div class="callout callout-tip">
    <strong>tsconfig for JSX</strong>
    <p>The starter sets <span class="ic">jsx: react-jsx</span>, so components compile without importing React in every file. Vite templates configure this for you.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0E000000-0000-4000-8000-000000000423',
  '0E000000-0000-4000-8000-000000000323',
  1,
  'Testing & Editor Tooling',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Testing &amp; Editor Tooling</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #3178c6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #172554; color: #93c5fd; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #172554; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Testing &amp; Editor Tooling</h1>
  <p>TypeScript earns its place in the pipeline: the compiler is a test that runs on every save and every commit, catching entire failure classes before a human ever runs a test.</p>
  <h2>Type check in CI</h2>
  <pre class="code-block">// package.json scripts — risk the type check in the build step
"check": "tsc --noEmit",
"build": "npm run check &amp;&amp; vite build"</pre>
  <h2>Vitest runs TypeScript directly</h2>
  <p>Vitest understands TypeScript out of the box. The same import graph you run becomes the test graph:</p>
  <pre class="code-block">import { describe, expect, it } from 'vitest';
import { parseLine } from './parser';

describe('parseLine', () =&gt; {
  it('extracts the label', () =&gt; {
    expect(parseLine('- buy milk').label).toBe('buy milk');
  });
});

npm test</pre>
  <h2>Editor: the TypeScript language server</h2>
  <ul>
    <li><strong>Diagnostics</strong> — squiggles update live as you type.</li>
    <li><strong>Quick fixes</strong> — add a missing import, infer a type, implement an interface.</li>
    <li><strong>Go to definition / find references</strong> — jump anywhere in the project graph.</li>
    <li><strong>Rename symbol</strong> — renames across files with the compiler as a safety net.</li>
  </ul>
  <h2>Source maps for debugging</h2>
  <p>With <span class="ic">sourceMap: true</span>, the debugger shows your original .ts lines instead of the compiled bundle — so breakpoints and stack traces finally make sense again.</p>
  <h2>Linting with the TypeScript parser</h2>
  <table>
    <tr><th>Tool</th><th>Job</th></tr>
    <tr><td>tsc --noEmit</td><td>Type correctness</td></tr>
    <tr><td>@typescript-eslint</td><td>Code style and risky patterns</td></tr>
    <tr><td>Prettier</td><td>Formatting consistency</td></tr>
    <tr><td>Vitest</td><td>Runtime behavior of logic</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Treat red squiggles as bugs</strong>
    <p>An unhandled diagnostic in the editor is the cheapest bug report you will ever get. Fix it at the source instead of shipping it to the build.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Read the tooltip fully</strong>
    <p>TypeScript errors read code-first, plain English second. Read to the final sentence — the reason almost always names the exact rule or type mismatch.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0E000000-0000-4000-8000-000000000425',
  '0E000000-0000-4000-8000-000000000325',
  1,
  'Capstone: Project Setup & Data Models',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Project Setup &amp; Data Models</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #3178c6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #172554; color: #93c5fd; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #172554; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Project Setup &amp; Data Models</h1>
  <p>Time to build the capstone: <strong>Taskr</strong>, a task manager with typed models, localStorage persistence, and a filtered, interactive UI — all in TypeScript.</p>
  <h2>Project structure</h2>
  <pre class="code-block">taskr/
  index.html
  styles.css
  src/
    models.ts       // domain types
    storage.ts      // typed persistence layer
    taskService.ts  // pure task logic
    ui.ts           // renderers
    app.ts          // entry point</pre>
  <h2>Model the domain first</h2>
  <p>Every screen and function in the app reads from this single source of truth:</p>
  <pre class="code-block">export type TaskStatus = 'open' | 'done';

export interface Task {
  id: string;
  title: string;
  status: TaskStatus;
  createdAt: number;
}

export type TaskFilter = 'all' | TaskStatus;</pre>
  <h2>Why this shape</h2>
  <ul>
    <li><span class="ic">id</span> — stable identity for updates and UI keys.</li>
    <li><span class="ic">status</span> — a literal union that filter and render branch on.</li>
    <li><span class="ic">createdAt</span> — sortable, with no extra parsing.</li>
    <li><span class="ic">title</span> — plain text, rendered safely as text.</li>
  </ul>
  <h2>Scaffold the files</h2>
  <pre class="code-block">npm create vite@latest taskr -- --template vanilla-ts
cd taskr
npm install</pre>
  <div class="callout callout-info">
    <strong>Vite uses strict out of the box</strong>
    <p>The vanilla-ts template ships with strict, a working tsconfig, and a build script that type-checks. You can focus on the domain.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Encode only what you use</strong>
    <p>Real models start lean. Add fields when a feature needs them — and the compiler will point out every place that must learn the new shape.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0E000000-0000-4000-8000-000000000426',
  '0E000000-0000-4000-8000-000000000326',
  1,
  'Capstone: Building the Core Logic',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Building the Core Logic</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #3178c6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #172554; color: #93c5fd; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #172554; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Building the Core Logic</h1>
  <p>With the models in place, the logic is pure functions over tasks: create, toggle, remove, and filter. Keeping them pure makes them trivial to test and reuse.</p>
  <h2>taskService.ts</h2>
  <pre class="code-block">import type { Task, TaskFilter } from './models';

export function createTask(title: string): Task {
  return {
    id: crypto.randomUUID(),
    title: title.trim(),
    status: 'open',
    createdAt: Date.now(),
  };
}

export function toggleTask(id: string, tasks: Task[]): Task[] {
  return tasks.map((task) =&gt;
    task.id === id
      ? { ...task, status: task.status === 'open' ? 'done' : 'open' }
      : task,
  );
}

export function filterTasks(tasks: Task[], filter: TaskFilter): Task[] {
  if (filter === 'all') return tasks;
  return tasks.filter((task) =&gt; task.status === filter);
}</pre>
  <div class="callout callout-tip">
    <strong>Immutable updates</strong>
    <p>Returning a fresh array with spread operators keeps the previous state intact — undo and re-render stay trivial, and the UI never misses a change.</p>
  </div>
  <h2>storage.ts — validate at the boundary</h2>
  <p>Storage is an outside world like any API. Parse to <span class="ic">unknown</span>, verify with checks, then cast into the typed shape:</p>
  <pre class="code-block">import type { Task } from './models';

const KEY = 'taskr:tasks';

export function loadTasks(): Task[] {
  const raw = localStorage.getItem(KEY);
  if (!raw) return [];
  try {
    const parsed: unknown = JSON.parse(raw);
    return Array.isArray(parsed) ? (parsed as Task[]) : [];
  } catch {
    return [];
  }
}

export function saveTasks(tasks: Task[]): void {
  localStorage.setItem(KEY, JSON.stringify(tasks));
}</pre>
  <div class="callout callout-info">
    <strong>Trust no input</strong>
    <p>Local storage can hold anything a previous version or a user wrote. Shape-checking at the boundary prevents the whole app from crashing on bad data.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '0E000000-0000-4000-8000-000000000427',
  '0E000000-0000-4000-8000-000000000327',
  1,
  'Capstone: UI, Persistence & Polishing',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: UI, Persistence &amp; Polishing</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #3178c6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #3b82f6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #172554; color: #93c5fd; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #172554; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: UI, Persistence &amp; Polishing</h1>
  <p>The final act wires logic to the page: typed renderers, event handlers, localStorage saves, and the empty and error states that make a demo feel like a product.</p>
  <h2>ui.ts — renderers</h2>
  <pre class="code-block">import type { Task } from './models';

export function renderList(tasks: Task[], listEl: HTMLElement): void {
  listEl.replaceChildren();

  if (tasks.length === 0) {
    const empty = document.createElement('li');
    empty.textContent = 'Nothing here — add a task.';
    listEl.append(empty);
    return;
  }

  for (const task of tasks) {
    const li = document.createElement('li');
    li.textContent = task.title;
    li.dataset.taskId = task.id;
    li.classList.toggle('done', task.status === 'done');
    listEl.append(li);
  }
}</pre>
  <div class="callout callout-info">
    <strong>textContent everywhere</strong>
    <p>Task titles come from user input. Rendering with <span class="ic">textContent</span> keeps them inert — no HTML injection, no scripting surprises.</p>
  </div>
  <h2>app.ts — entry point</h2>
  <p>Every mutation flows through one path: apply, save, render. Because the compiler guarantees the shape, the save never needs a second guess:</p>
  <pre class="code-block">// form submit handler (abridged)
const task = createTask(input.value);
tasks = [...tasks, task];
saveTasks(tasks);
renderList(filterTasks(tasks, filter), listEl);
input.value = '';</pre>
  <h2>Polishing checklist</h2>
  <table>
    <tr><th>State</th><th>Behavior</th></tr>
    <tr><td>Empty list</td><td>Friendly message, form still usable</td></tr>
    <tr><td>Corrupt storage</td><td>loadTasks returns empty instead of crashing</td></tr>
    <tr><td>Duplicate titles</td><td>Allowed — ids, not titles, own identity</td></tr>
    <tr><td>Filter switch</td><td>Re-render from current state, no reload</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>You built a typed app</strong>
    <p>From models through services to the DOM, every bridge was a typed contract. That is the payoff of the whole course — take the Final Assessment to prove it.</p>
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
  ('0E000000-0000-4000-8000-000000000501', '0E000000-0000-4000-8000-000000000303',
   'What does TypeScript add on top of JavaScript?',
   'A static type system checks the code before it runs and produces a clear error message.', 1),
  ('0E000000-0000-4000-8000-000000000502', '0E000000-0000-4000-8000-000000000303',
   'Which command compiles TypeScript into JavaScript?',
   'tsc is the official compiler shipped in the typescript package.', 2),
  ('0E000000-0000-4000-8000-000000000503', '0E000000-0000-4000-8000-000000000303',
   'What file extension does a TypeScript source file use?',
   'Source files use .ts; JSX in TypeScript lives in .tsx files.', 3),
  ('0E000000-0000-4000-8000-000000000504', '0E000000-0000-4000-8000-000000000306',
   'Which primitive type represents every number in TypeScript?',
   'Whole and fractional numbers are all the same number type.', 1),
  ('0E000000-0000-4000-8000-000000000505', '0E000000-0000-4000-8000-000000000306',
   'How do you declare an array that holds only strings?',
   'The [] suffix annotates an array; Array<string> is equivalent.', 2),
  ('0E000000-0000-4000-8000-000000000506', '0E000000-0000-4000-8000-000000000306',
   'What does TypeScript infer for: let count = 5;',
   'Inference reads the initializer, so the variable becomes number.', 3),
  ('0E000000-0000-4000-8000-000000000507', '0E000000-0000-4000-8000-000000000309',
   'How do you mark a property optional inside an interface?',
   'A trailing question mark after the property name declares it optional.', 1),
  ('0E000000-0000-4000-8000-000000000508', '0E000000-0000-4000-8000-000000000309',
   'What does: type ID = string | number do?',
   'It creates a union type alias that accepts either kind.', 2),
  ('0E000000-0000-4000-8000-000000000509', '0E000000-0000-4000-8000-000000000309',
   'Which statement about interfaces is true?',
   'Interfaces can be extended and merged; type aliases cannot be reopened.', 3),
  ('0E000000-0000-4000-8000-000000000510', '0E000000-0000-4000-8000-000000000312',
   'How should you treat a value of type unknown?',
   'Narrow it with runtime checks before using it.', 1),
  ('0E000000-0000-4000-8000-000000000511', '0E000000-0000-4000-8000-000000000312',
   'What is type narrowing?',
   'Refining a union to a concrete type by checking facts at runtime.', 2),
  ('0E000000-0000-4000-8000-000000000512', '0E000000-0000-4000-8000-000000000312',
   'Which check narrows a union of string and number down to a string?',
   'typeof value === ''string'' proves the branch safely.', 3),
  ('0E000000-0000-4000-8000-000000000513', '0E000000-0000-4000-8000-000000000315',
   'What problem do generics solve?',
   'One reusable component serves many types while staying type safe.', 1),
  ('0E000000-0000-4000-8000-000000000514', '0E000000-0000-4000-8000-000000000315',
   'What does Partial(T) do?',
   'It makes every property of T optional.', 2),
  ('0E000000-0000-4000-8000-000000000515', '0E000000-0000-4000-8000-000000000315',
   'How do you constrain what a type parameter accepts?',
   'With the extends keyword on the type parameter.', 3),
  ('0E000000-0000-4000-8000-000000000516', '0E000000-0000-4000-8000-000000000318',
   'Which modifier keeps a member private to its own class?',
   'private allows access only inside the declaring class.', 1),
  ('0E000000-0000-4000-8000-000000000517', '0E000000-0000-4000-8000-000000000318',
   'What does readonly prevent?',
   'Reassignment of the property after initialization.', 2),
  ('0E000000-0000-4000-8000-000000000518', '0E000000-0000-4000-8000-000000000318',
   'Who can access a protected member?',
   'The declaring class and any subclass.', 3),
  ('0E000000-0000-4000-8000-000000000519', '0E000000-0000-4000-8000-000000000321',
   'How do you import only a type so no value import is emitted?',
   'import type brings the type in and erases to nothing.', 1),
  ('0E000000-0000-4000-8000-000000000520', '0E000000-0000-4000-8000-000000000321',
   'Which tsconfig flag enables the strictest checking?',
   'strict switches on the full family of safety checks.', 2),
  ('0E000000-0000-4000-8000-000000000521', '0E000000-0000-4000-8000-000000000321',
   'What does tsc --noEmit do?',
   'Type-checks the project without writing any output files.', 3),
  ('0E000000-0000-4000-8000-000000000522', '0E000000-0000-4000-8000-000000000324',
   'How do you type the props of a React function component?',
   'With an interface applied to the props parameter.', 1),
  ('0E000000-0000-4000-8000-000000000523', '0E000000-0000-4000-8000-000000000324',
   'Which React hook takes a type argument for its state?',
   'useState accepts a type argument that types the state and its setter.', 2),
  ('0E000000-0000-4000-8000-000000000524', '0E000000-0000-4000-8000-000000000324',
   'What runs first in a typical typed build pipeline?',
   'A tsc type check before bundling.', 3),
  ('0E000000-0000-4000-8000-000000000525', '0E000000-0000-4000-8000-000000000328',
   'What type does the compiler assign to a const string variable?',
   'For a const declaration TypeScript infers a literal type matching the exact string.', 1),
  ('0E000000-0000-4000-8000-000000000526', '0E000000-0000-4000-8000-000000000328',
   'What does optional chaining (?.) do?',
   'Returns undefined instead of throwing on null or undefined.', 2),
  ('0E000000-0000-4000-8000-000000000527', '0E000000-0000-4000-8000-000000000328',
   'Why does strict mode catch more bugs?',
   'It flags implicit any and forces null and undefined to be handled.', 3),
  ('0E000000-0000-4000-8000-000000000528', '0E000000-0000-4000-8000-000000000328',
   'Which pattern best models a discriminated union?',
   'A shared literal discriminant field that selects the branch.', 4),
  ('0E000000-0000-4000-8000-000000000529', '0E000000-0000-4000-8000-000000000328',
   'Why model capstone data with types and interfaces?',
   'One source of truth keeps the whole app in sync as it grows.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): static type system
  ('0E000000-0000-4000-8000-000000001001', '0E000000-0000-4000-8000-000000000501', 'A static type system', TRUE,  1),
  ('0E000000-0000-4000-8000-000000001002', '0E000000-0000-4000-8000-000000000501', 'A new database engine', FALSE, 2),
  ('0E000000-0000-4000-8000-000000001003', '0E000000-0000-4000-8000-000000000501', 'A CSS preprocessor', FALSE, 3),
  ('0E000000-0000-4000-8000-000000001004', '0E000000-0000-4000-8000-000000000501', 'A browser plugin', FALSE, 4),
  -- Q1 (501)q2: tsc
  ('0E000000-0000-4000-8000-000000001005', '0E000000-0000-4000-8000-000000000502', 'tsc', TRUE,  1),
  ('0E000000-0000-4000-8000-000000001006', '0E000000-0000-4000-8000-000000000502', 'node', FALSE, 2),
  ('0E000000-0000-4000-8000-000000001007', '0E000000-0000-4000-8000-000000000502', 'npm install', FALSE, 3),
  ('0E000000-0000-4000-8000-000000001008', '0E000000-0000-4000-8000-000000000502', 'git commit', FALSE, 4),
  -- Q1 (501)q3: extension
  ('0E000000-0000-4000-8000-000000001009', '0E000000-0000-4000-8000-000000000503', '.ts', TRUE,  1),
  ('0E000000-0000-4000-8000-000000001010', '0E000000-0000-4000-8000-000000000503', '.js', FALSE, 2),
  ('0E000000-0000-4000-8000-000000001011', '0E000000-0000-4000-8000-000000000503', '.css', FALSE, 3),
  ('0E000000-0000-4000-8000-000000001012', '0E000000-0000-4000-8000-000000000503', '.json', FALSE, 4),
  -- Q2 (504): number type
  ('0E000000-0000-4000-8000-000000001013', '0E000000-0000-4000-8000-000000000504', 'number', TRUE,  1),
  ('0E000000-0000-4000-8000-000000001014', '0E000000-0000-4000-8000-000000000504', 'integer', FALSE, 2),
  ('0E000000-0000-4000-8000-000000001015', '0E000000-0000-4000-8000-000000000504', 'float', FALSE, 3),
  ('0E000000-0000-4000-8000-000000001016', '0E000000-0000-4000-8000-000000000504', 'digit', FALSE, 4),
  -- Q2 (504)q2: string array
  ('0E000000-0000-4000-8000-000000001017', '0E000000-0000-4000-8000-000000000505', 'string[]', TRUE,  1),
  ('0E000000-0000-4000-8000-000000001018', '0E000000-0000-4000-8000-000000000505', '(strings)', FALSE, 2),
  ('0E000000-0000-4000-8000-000000001019', '0E000000-0000-4000-8000-000000000505', '{strings}', FALSE, 3),
  ('0E000000-0000-4000-8000-000000001020', '0E000000-0000-4000-8000-000000000505', '@strings', FALSE, 4),
  -- Q2 (504)q3: inference
  ('0E000000-0000-4000-8000-000000001021', '0E000000-0000-4000-8000-000000000506', 'number', TRUE,  1),
  ('0E000000-0000-4000-8000-000000001022', '0E000000-0000-4000-8000-000000000506', 'string', FALSE, 2),
  ('0E000000-0000-4000-8000-000000001023', '0E000000-0000-4000-8000-000000000506', 'any', FALSE, 3),
  ('0E000000-0000-4000-8000-000000001024', '0E000000-0000-4000-8000-000000000506', 'unknown', FALSE, 4),
  -- Q3 (507): optional property
  ('0E000000-0000-4000-8000-000000001025', '0E000000-0000-4000-8000-000000000507', 'A trailing question mark', TRUE,  1),
  ('0E000000-0000-4000-8000-000000001026', '0E000000-0000-4000-8000-000000000507', 'A leading exclamation mark', FALSE, 2),
  ('0E000000-0000-4000-8000-000000001027', '0E000000-0000-4000-8000-000000000507', 'A hash prefix', FALSE, 3),
  ('0E000000-0000-4000-8000-000000001028', '0E000000-0000-4000-8000-000000000507', 'Square brackets around the name', FALSE, 4),
  -- Q3 (507)q2: union alias
  ('0E000000-0000-4000-8000-000000001029', '0E000000-0000-4000-8000-000000000508', 'A union type alias', TRUE,  1),
  ('0E000000-0000-4000-8000-000000001030', '0E000000-0000-4000-8000-000000000508', 'A class declaration', FALSE, 2),
  ('0E000000-0000-4000-8000-000000001031', '0E000000-0000-4000-8000-000000000508', 'A function overload', FALSE, 3),
  ('0E000000-0000-4000-8000-000000001032', '0E000000-0000-4000-8000-000000000508', 'A namespace', FALSE, 4),
  -- Q3 (507)q3: interface truth
  ('0E000000-0000-4000-8000-000000001033', '0E000000-0000-4000-8000-000000000509', 'Interfaces can be extended and merged', TRUE,  1),
  ('0E000000-0000-4000-8000-000000001034', '0E000000-0000-4000-8000-000000000509', 'Interfaces cannot describe objects', FALSE, 2),
  ('0E000000-0000-4000-8000-000000001035', '0E000000-0000-4000-8000-000000000509', 'Type aliases cannot hold unions', FALSE, 3),
  ('0E000000-0000-4000-8000-000000001036', '0E000000-0000-4000-8000-000000000509', 'Only interfaces can type functions', FALSE, 4),
  -- Q4 (510): unknown
  ('0E000000-0000-4000-8000-000000001037', '0E000000-0000-4000-8000-000000000510', 'Narrow it with checks first', TRUE,  1),
  ('0E000000-0000-4000-8000-000000001038', '0E000000-0000-4000-8000-000000000510', 'Cast it to any every time', FALSE, 2),
  ('0E000000-0000-4000-8000-000000001039', '0E000000-0000-4000-8000-000000000510', 'Convert it to a string immediately', FALSE, 3),
  ('0E000000-0000-4000-8000-000000001040', '0E000000-0000-4000-8000-000000000510', 'Ignore the value entirely', FALSE, 4),
  -- Q4 (510)q2: narrowing
  ('0E000000-0000-4000-8000-000000001041', '0E000000-0000-4000-8000-000000000511', 'Refining a union to a concrete type', TRUE,  1),
  ('0E000000-0000-4000-8000-000000001042', '0E000000-0000-4000-8000-000000000511', 'Splitting a class into interfaces', FALSE, 2),
  ('0E000000-0000-4000-8000-000000001043', '0E000000-0000-4000-8000-000000000511', 'Deleting unused TypeScript files', FALSE, 3),
  ('0E000000-0000-4000-8000-000000001044', '0E000000-0000-4000-8000-000000000511', 'Merging two objects into one', FALSE, 4),
  -- Q4 (510)q3: typeof check
  ('0E000000-0000-4000-8000-000000001045', '0E000000-0000-4000-8000-000000000512', 'typeof value === ''string''', TRUE,  1),
  ('0E000000-0000-4000-8000-000000001046', '0E000000-0000-4000-8000-000000000512', 'value + 1', FALSE, 2),
  ('0E000000-0000-4000-8000-000000001047', '0E000000-0000-4000-8000-000000000512', 'String(value)', FALSE, 3),
  ('0E000000-0000-4000-8000-000000001048', '0E000000-0000-4000-8000-000000000512', 'value.toString()', FALSE, 4),
  -- Q5 (513): generics purpose
  ('0E000000-0000-4000-8000-000000001049', '0E000000-0000-4000-8000-000000000513', 'Reusable components over many types', TRUE,  1),
  ('0E000000-0000-4000-8000-000000001050', '0E000000-0000-4000-8000-000000000513', 'Reusable CSS across components', FALSE, 2),
  ('0E000000-0000-4000-8000-000000001051', '0E000000-0000-4000-8000-000000000513', 'A faster JavaScript engine', FALSE, 3),
  ('0E000000-0000-4000-8000-000000001052', '0E000000-0000-4000-8000-000000000513', 'Automatic database migrations', FALSE, 4),
  -- Q5 (513)q2: Partial
  ('0E000000-0000-4000-8000-000000001053', '0E000000-0000-4000-8000-000000000514', 'Makes every property optional', TRUE,  1),
  ('0E000000-0000-4000-8000-000000001054', '0E000000-0000-4000-8000-000000000514', 'Makes every property readonly', FALSE, 2),
  ('0E000000-0000-4000-8000-000000001055', '0E000000-0000-4000-8000-000000000514', 'Removes all properties', FALSE, 3),
  ('0E000000-0000-4000-8000-000000001056', '0E000000-0000-4000-8000-000000000514', 'Adds a runtime type check', FALSE, 4),
  -- Q5 (513)q3: constraint
  ('0E000000-0000-4000-8000-000000001057', '0E000000-0000-4000-8000-000000000515', 'A type parameter constrained with extends', TRUE,  1),
  ('0E000000-0000-4000-8000-000000001058', '0E000000-0000-4000-8000-000000000515', 'A double exclamation assertion', FALSE, 2),
  ('0E000000-0000-4000-8000-000000001059', '0E000000-0000-4000-8000-000000000515', 'A namespace import', FALSE, 3),
  ('0E000000-0000-4000-8000-000000001060', '0E000000-0000-4000-8000-000000000515', 'A wildcard in the path', FALSE, 4),
  -- Q6 (516): private
  ('0E000000-0000-4000-8000-000000001061', '0E000000-0000-4000-8000-000000000516', 'private', TRUE,  1),
  ('0E000000-0000-4000-8000-000000001062', '0E000000-0000-4000-8000-000000000516', 'public', FALSE, 2),
  ('0E000000-0000-4000-8000-000000001063', '0E000000-0000-4000-8000-000000000516', 'static', FALSE, 3),
  ('0E000000-0000-4000-8000-000000001064', '0E000000-0000-4000-8000-000000000516', 'exported', FALSE, 4),
  -- Q6 (516)q2: readonly
  ('0E000000-0000-4000-8000-000000001065', '0E000000-0000-4000-8000-000000000517', 'Reassignment of the property', TRUE,  1),
  ('0E000000-0000-4000-8000-000000001066', '0E000000-0000-4000-8000-000000000517', 'Reading the property', FALSE, 2),
  ('0E000000-0000-4000-8000-000000001067', '0E000000-0000-4000-8000-000000000517', 'Creating the object', FALSE, 3),
  ('0E000000-0000-4000-8000-000000001068', '0E000000-0000-4000-8000-000000000517', 'Calling a method', FALSE, 4),
  -- Q6 (516)q3: protected
  ('0E000000-0000-4000-8000-000000001069', '0E000000-0000-4000-8000-000000000518', 'The class and its subclasses', TRUE,  1),
  ('0E000000-0000-4000-8000-000000001070', '0E000000-0000-4000-8000-000000000518', 'Only external modules', FALSE, 2),
  ('0E000000-0000-4000-8000-000000001071', '0E000000-0000-4000-8000-000000000518', 'Any code in the project', FALSE, 3),
  ('0E000000-0000-4000-8000-000000001072', '0E000000-0000-4000-8000-000000000518', 'Only runtime callers', FALSE, 4),
  -- Q7 (519): type import
  ('0E000000-0000-4000-8000-000000001073', '0E000000-0000-4000-8000-000000000519', 'import type at the top of a file', TRUE,  1),
  ('0E000000-0000-4000-8000-000000001074', '0E000000-0000-4000-8000-000000000519', 'A plain value import', FALSE, 2),
  ('0E000000-0000-4000-8000-000000001075', '0E000000-0000-4000-8000-000000000519', 'A global assignment', FALSE, 3),
  ('0E000000-0000-4000-8000-000000001076', '0E000000-0000-4000-8000-000000000519', 'A comment at the top', FALSE, 4),
  -- Q7 (519)q2: strict
  ('0E000000-0000-4000-8000-000000001077', '0E000000-0000-4000-8000-000000000520', 'strict', TRUE,  1),
  ('0E000000-0000-4000-8000-000000001078', '0E000000-0000-4000-8000-000000000520', 'fast-debug', FALSE, 2),
  ('0E000000-0000-4000-8000-000000001079', '0E000000-0000-4000-8000-000000000520', 'new-school', FALSE, 3),
  ('0E000000-0000-4000-8000-000000001080', '0E000000-0000-4000-8000-000000000520', 'permissive', FALSE, 4),
  -- Q7 (519)q3: noEmit
  ('0E000000-0000-4000-8000-000000001081', '0E000000-0000-4000-8000-000000000521', 'Type-checks without emitting files', TRUE,  1),
  ('0E000000-0000-4000-8000-000000001082', '0E000000-0000-4000-8000-000000000521', 'Emits minified JavaScript', FALSE, 2),
  ('0E000000-0000-4000-8000-000000001083', '0E000000-0000-4000-8000-000000000521', 'Deletes old output files', FALSE, 3),
  ('0E000000-0000-4000-8000-000000001084', '0E000000-0000-4000-8000-000000000521', 'Starts the dev server', FALSE, 4),
  -- Q8 (522): React props
  ('0E000000-0000-4000-8000-000000001085', '0E000000-0000-4000-8000-000000000522', 'With an interface on the props object', TRUE,  1),
  ('0E000000-0000-4000-8000-000000001086', '0E000000-0000-4000-8000-000000000522', 'With a CSS class name', FALSE, 2),
  ('0E000000-0000-4000-8000-000000001087', '0E000000-0000-4000-8000-000000000522', 'With an HTML attribute', FALSE, 3),
  ('0E000000-0000-4000-8000-000000001088', '0E000000-0000-4000-8000-000000000522', 'With a global variable', FALSE, 4),
  -- Q8 (522)q2: typed hook
  ('0E000000-0000-4000-8000-000000001089', '0E000000-0000-4000-8000-000000000523', 'useState', TRUE,  1),
  ('0E000000-0000-4000-8000-000000001090', '0E000000-0000-4000-8000-000000000523', 'useEffect', FALSE, 2),
  ('0E000000-0000-4000-8000-000000001091', '0E000000-0000-4000-8000-000000000523', 'useMemo', FALSE, 3),
  ('0E000000-0000-4000-8000-000000001092', '0E000000-0000-4000-8000-000000000523', 'useLayoutEffect', FALSE, 4),
  -- Q8 (522)q3: build first step
  ('0E000000-0000-4000-8000-000000001093', '0E000000-0000-4000-8000-000000000524', 'A tsc type check', TRUE,  1),
  ('0E000000-0000-4000-8000-000000001094', '0E000000-0000-4000-8000-000000000524', 'A screenshot test', FALSE, 2),
  ('0E000000-0000-4000-8000-000000001095', '0E000000-0000-4000-8000-000000000524', 'A font swap', FALSE, 3),
  ('0E000000-0000-4000-8000-000000001096', '0E000000-0000-4000-8000-000000000524', 'A cache purge', FALSE, 4),
  -- Q9 (525): const literal type
  ('0E000000-0000-4000-8000-000000001097', '0E000000-0000-4000-8000-000000000525', 'A literal type matching the exact string', TRUE,  1),
  ('0E000000-0000-4000-8000-000000001098', '0E000000-0000-4000-8000-000000000525', 'The general string type', FALSE, 2),
  ('0E000000-0000-4000-8000-000000001099', '0E000000-0000-4000-8000-000000000525', 'any', FALSE, 3),
  ('0E000000-0000-4000-8000-000000001100', '0E000000-0000-4000-8000-000000000525', 'unknown', FALSE, 4),
  -- Q9 (525)q2: optional chaining
  ('0E000000-0000-4000-8000-000000001101', '0E000000-0000-4000-8000-000000000526', 'Returns undefined instead of throwing', TRUE,  1),
  ('0E000000-0000-4000-8000-000000001102', '0E000000-0000-4000-8000-000000000526', 'Throws a TypeError immediately', FALSE, 2),
  ('0E000000-0000-4000-8000-000000001103', '0E000000-0000-4000-8000-000000000526', 'Returns a Promise', FALSE, 3),
  ('0E000000-0000-4000-8000-000000001104', '0E000000-0000-4000-8000-000000000526', 'Converts the value to a number', FALSE, 4),
  -- Q9 (525)q3: strict value
  ('0E000000-0000-4000-8000-000000001105', '0E000000-0000-4000-8000-000000000527', 'It flags implicit any and unsafe null usage', TRUE,  1),
  ('0E000000-0000-4000-8000-000000001106', '0E000000-0000-4000-8000-000000000527', 'It makes the code run faster', FALSE, 2),
  ('0E000000-0000-4000-8000-000000001107', '0E000000-0000-4000-8000-000000000527', 'It shrinks the JavaScript output', FALSE, 3),
  ('0E000000-0000-4000-8000-000000001108', '0E000000-0000-4000-8000-000000000527', 'It hides runtime errors', FALSE, 4),
  -- Q9 (525)q4: discriminated union
  ('0E000000-0000-4000-8000-000000001109', '0E000000-0000-4000-8000-000000000528', 'A shared literal discriminant', TRUE,  1),
  ('0E000000-0000-4000-8000-000000001110', '0E000000-0000-4000-8000-000000000528', 'A union of unrelated primitives', FALSE, 2),
  ('0E000000-0000-4000-8000-000000001111', '0E000000-0000-4000-8000-000000000528', 'A subclass for every value', FALSE, 3),
  ('0E000000-0000-4000-8000-000000001112', '0E000000-0000-4000-8000-000000000528', 'A global singleton object', FALSE, 4),
  -- Q9 (525)q5: models
  ('0E000000-0000-4000-8000-000000001113', '0E000000-0000-4000-8000-000000000529', 'It keeps the whole app in sync as types change', TRUE,  1),
  ('0E000000-0000-4000-8000-000000001114', '0E000000-0000-4000-8000-000000000529', 'It removes the need to write functions', FALSE, 2),
  ('0E000000-0000-4000-8000-000000001115', '0E000000-0000-4000-8000-000000000529', 'It lets you skip testing entirely', FALSE, 3),
  ('0E000000-0000-4000-8000-000000001116', '0E000000-0000-4000-8000-000000000529', 'It compiles the UI to native code', FALSE, 4)
ON CONFLICT (id) DO NOTHING;
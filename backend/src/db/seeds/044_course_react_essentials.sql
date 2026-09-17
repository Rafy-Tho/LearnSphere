-- ============================================================================
-- SEED 044: Complete course — "React Essentials"
-- ----------------------------------------------------------------------------
-- Instructor : Sarah Chen        (10000000-0000-4000-8000-000000000001)
-- Category   : Web Development   (20000000-0000-4000-8000-000000000001)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 React Foundations        → C1 Components & JSX · C2 Props & Composition
--   M2 State & Interactivity    → C3 State with useState · C4 Events & Forms
--   M3 Lists & UI Patterns      → C5 Lists & Keys · C6 Conditional Rendering
--   M4 Advanced Hooks           → C7 Effects & Lifecycle · C8 Context & Hook Rules
--   M5 Capstone: Task Manager   → C9 Project Setup · C10 Building & Polishing
--
-- Content: 19 TEXT lessons with lesson_contents (self-contained HTML + inline
-- CSS, dollar-quoted so apostrophes need no escaping) and 9 QUIZ lessons with
-- 29 questions / 116 options across the quizzes and quiz_options tables.
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
  '02C00000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000001',
  '20000000-0000-4000-8000-000000000001',
  'React Essentials',
  'react-essentials',
  'Master React end to end: components and JSX, props and composition, state, events, lists, conditional rendering, effects, context, and the Rules of Hooks — then ship a polished task manager capstone.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  42
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('02C00000-0000-4000-8000-000000000011', '02C00000-0000-4000-8000-000000000001', 'Compose interfaces from reusable components with JSX and props.',                         1),
  ('02C00000-0000-4000-8000-000000000012', '02C00000-0000-4000-8000-000000000001', 'Manage interactive state and build controlled forms with events.',                           2),
  ('02C00000-0000-4000-8000-000000000013', '02C00000-0000-4000-8000-000000000001', 'Render lists with stable keys and shape UI with conditional rendering.',                      3),
  ('02C00000-0000-4000-8000-000000000014', '02C00000-0000-4000-8000-000000000001', 'Handle side effects, context, and custom hooks by the Rules of Hooks.',                      4),
  ('02C00000-0000-4000-8000-000000000015', '02C00000-0000-4000-8000-000000000001', 'Apply Thinking in React to design and polish a task manager capstone.',                      5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('02C00000-0000-4000-8000-000000000101', '02C00000-0000-4000-8000-000000000001', 1, 'React Foundations',        'Understand components, JSX, props, and composition.',           'PUBLISHED'),
  ('02C00000-0000-4000-8000-000000000102', '02C00000-0000-4000-8000-000000000001', 2, 'State & Interactivity',    'Bring interfaces to life with state, events, and forms.',       'PUBLISHED'),
  ('02C00000-0000-4000-8000-000000000103', '02C00000-0000-4000-8000-000000000001', 3, 'Lists & UI Patterns',      'Render dynamic collections and conditional states.',            'PUBLISHED'),
  ('02C00000-0000-4000-8000-000000000104', '02C00000-0000-4000-8000-000000000001', 4, 'Advanced Hooks',           'Master effects, context, and custom hooks.',                    'PUBLISHED'),
  ('02C00000-0000-4000-8000-000000000105', '02C00000-0000-4000-8000-000000000001', 5, 'Capstone: Task Manager',   'Build a complete task manager with persistence and polish.',    'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('02C00000-0000-4000-8000-000000000201', '02C00000-0000-4000-8000-000000000101', 1, 'Components & JSX',      'Functions that describe UI and the syntax that drives them.',         'PUBLISHED'),
  ('02C00000-0000-4000-8000-000000000202', '02C00000-0000-4000-8000-000000000101', 2, 'Props & Composition',   'Share data between components and assemble flexible layouts.',        'PUBLISHED'),
  ('02C00000-0000-4000-8000-000000000203', '02C00000-0000-4000-8000-000000000102', 1, 'State with useState',   'Hold values that change over time and update them safely.',           'PUBLISHED'),
  ('02C00000-0000-4000-8000-000000000204', '02C00000-0000-4000-8000-000000000102', 2, 'Events & Forms',        'Handle user interaction with handlers and controlled inputs.',        'PUBLISHED'),
  ('02C00000-0000-4000-8000-000000000205', '02C00000-0000-4000-8000-000000000103', 1, 'Lists & Keys',          'Render collections and keep updates fast and correct.',               'PUBLISHED'),
  ('02C00000-0000-4000-8000-000000000206', '02C00000-0000-4000-8000-000000000103', 2, 'Conditional Rendering', 'Show the right UI for every state of the application.',               'PUBLISHED'),
  ('02C00000-0000-4000-8000-000000000207', '02C00000-0000-4000-8000-000000000104', 1, 'Effects & Lifecycle',   'Run side effects after the component renders.',                       'PUBLISHED'),
  ('02C00000-0000-4000-8000-000000000208', '02C00000-0000-4000-8000-000000000104', 2, 'Context & Hook Rules',  'Share state broadly and use hooks according to the rules.',           'PUBLISHED'),
  ('02C00000-0000-4000-8000-000000000209', '02C00000-0000-4000-8000-000000000105', 1, 'Project Setup',         'Plan the capstone and scaffold it with Vite.',                        'PUBLISHED'),
  ('02C00000-0000-4000-8000-000000000210', '02C00000-0000-4000-8000-000000000105', 2, 'Building & Polishing',  'Build, persist, and polish the final application.',                   'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 02C00000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('02C00000-0000-4000-8000-000000000301', '02C00000-0000-4000-8000-000000000201', 1, 'What is React?',                  'Explore the component model and the declarative way React renders the UI.',  'TEXT', 'PUBLISHED', 'FREE', 10,  6),
  ('02C00000-0000-4000-8000-000000000302', '02C00000-0000-4000-8000-000000000201', 2, 'JSX Deep Dive',                   'Write expressions, fragments, and camelCase attributes inside JSX.',         'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('02C00000-0000-4000-8000-000000000303', '02C00000-0000-4000-8000-000000000201', 3, 'Components & JSX Quiz',            'Check your grasp of components and the core JSX rules.',                      'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('02C00000-0000-4000-8000-000000000304', '02C00000-0000-4000-8000-000000000202', 1, 'Props: Passing Data',              'Feed components read-only inputs and make them genuinely reusable.',          'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('02C00000-0000-4000-8000-000000000305', '02C00000-0000-4000-8000-000000000202', 2, 'Composition & Children',           'Assemble flexible layouts from components using the children prop.',          'TEXT', 'PUBLISHED', 'FREE', 10,  9),
  ('02C00000-0000-4000-8000-000000000306', '02C00000-0000-4000-8000-000000000202', 3, 'Props & Composition Quiz',         'Verify you can pass data and compose components together.',                   'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('02C00000-0000-4000-8000-000000000307', '02C00000-0000-4000-8000-000000000203', 1, 'State with useState',              'Give components memory with useState and render interactive values.',         'TEXT', 'PUBLISHED', 'FREE', 10,  9),
  ('02C00000-0000-4000-8000-000000000308', '02C00000-0000-4000-8000-000000000203', 2, 'Batching & Immutable Updates',     'Update objects and arrays immutably and understand React batching.',          'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('02C00000-0000-4000-8000-000000000309', '02C00000-0000-4000-8000-000000000203', 3, 'State Basics Quiz',                'Test your understanding of state and the rules for updating it.',             'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('02C00000-0000-4000-8000-000000000310', '02C00000-0000-4000-8000-000000000204', 1, 'Handling Events',                  'React to clicks, typing, and form submission with handlers.',                 'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('02C00000-0000-4000-8000-000000000311', '02C00000-0000-4000-8000-000000000204', 2, 'Forms & Controlled Inputs',        'Build controlled inputs and keep the form state in one place.',               'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('02C00000-0000-4000-8000-000000000312', '02C00000-0000-4000-8000-000000000204', 3, 'Events & Forms Quiz',              'Check what you know about events and controlled forms.',                      'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('02C00000-0000-4000-8000-000000000313', '02C00000-0000-4000-8000-000000000205', 1, 'Rendering Lists',                  'Render collections of data with map and the key prop.',                       'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('02C00000-0000-4000-8000-000000000314', '02C00000-0000-4000-8000-000000000205', 2, 'Keys & Reconciliation',            'Understand reconciliation and choose stable, unique keys.',                   'TEXT', 'PUBLISHED', 'FREE', 10,  9),
  ('02C00000-0000-4000-8000-000000000315', '02C00000-0000-4000-8000-000000000205', 3, 'Lists & Keys Quiz',                'Verify your list rendering and key discipline.',                              'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('02C00000-0000-4000-8000-000000000316', '02C00000-0000-4000-8000-000000000206', 1, 'Conditional Rendering',            'Show different UI for loading, empty, and error states.',                     'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('02C00000-0000-4000-8000-000000000317', '02C00000-0000-4000-8000-000000000206', 2, 'Styling React Components',         'Attach styles with classes and inline style objects.',                        'TEXT', 'PUBLISHED', 'FREE', 10,  7),
  ('02C00000-0000-4000-8000-000000000318', '02C00000-0000-4000-8000-000000000206', 3, 'Conditional Rendering Quiz',       'Test your conditional rendering patterns.',                                   'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('02C00000-0000-4000-8000-000000000319', '02C00000-0000-4000-8000-000000000207', 1, 'Effects with useEffect',           'Run side effects after render with useEffect.',                              'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('02C00000-0000-4000-8000-000000000320', '02C00000-0000-4000-8000-000000000207', 2, 'Dependencies & Cleanup',           'Control re-runs with dependency arrays and clean up properly.',               'TEXT', 'PUBLISHED', 'FREE', 10, 11),
  ('02C00000-0000-4000-8000-000000000321', '02C00000-0000-4000-8000-000000000207', 3, 'Effects Quiz',                     'Check your effect and lifecycle knowledge.',                                 'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('02C00000-0000-4000-8000-000000000322', '02C00000-0000-4000-8000-000000000208', 1, 'Context: Shared State',            'Share values across the tree and avoid prop drilling.',                       'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('02C00000-0000-4000-8000-000000000323', '02C00000-0000-4000-8000-000000000208', 2, 'Custom Hooks & Hook Rules',        'Extract reusable logic into custom hooks and follow the Rules of Hooks.',     'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('02C00000-0000-4000-8000-000000000324', '02C00000-0000-4000-8000-000000000208', 3, 'Context & Hooks Quiz',             'Test your context usage and the Rules of Hooks.',                             'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('02C00000-0000-4000-8000-000000000325', '02C00000-0000-4000-8000-000000000209', 1, 'Thinking in React',                'Apply the Thinking in React process to plan a component tree.',               'TEXT', 'PUBLISHED', 'FREE', 10,  9),
  ('02C00000-0000-4000-8000-000000000326', '02C00000-0000-4000-8000-000000000209', 2, 'Capstone: Project Setup',          'Scaffold the task manager capstone with Vite and a static UI.',              'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('02C00000-0000-4000-8000-000000000327', '02C00000-0000-4000-8000-000000000210', 1, 'Capstone: Building & Polishing',   'Add state, persistence, and polish to complete the capstone app.',           'TEXT', 'PUBLISHED', 'FREE', 10, 12),
  ('02C00000-0000-4000-8000-000000000328', '02C00000-0000-4000-8000-000000000210', 2, 'Final Assessment',                 'Prove what you learned across the whole course.',                             'QUIZ', 'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 02C00000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '02C00000-0000-4000-8000-000000000401',
  '02C00000-0000-4000-8000-000000000301',
  1,
  'What is React?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What is React?</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #a5f3fc; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfeff; color: #0e7490; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #67e8f9; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #155e75; }
.dark .lesson-page table th { background: #164e63; color: #67e8f9; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>What is React?</h1>
  <p>React is a JavaScript library for building user interfaces out of <strong>components</strong> — small, isolated, reusable pieces that each describe a chunk of the screen. React handles the hard part: keeping the page in sync with your data.</p>
  <p>Before React, developers wrote step-by-step instructions for the browser: find this element, change that text, append that row. React inverts the model. You describe <em>what the UI should look like for a given state</em>, and React figures out the <em>how</em>. This is the declarative approach.</p>
  <h2>Components are the building blocks</h2>
  <p>A component is a function that returns a fragment of UI called <span class="ic">JSX</span>. Name components in PascalCase so React recognizes them:</p>
  <pre class="code-block">function Welcome() {
  const name = 'Ada';
  return (
    &lt;h1&gt;Welcome, {name}!&lt;/h1&gt;
  );
}

export default Welcome;</pre>
  <ul>
    <li><strong>Composable</strong> — components nest inside other components.</li>
    <li><strong>Reusable</strong> — render the same component many times with different data.</li>
    <li><strong>Isolated</strong> — each component manages its own look and behavior.</li>
  </ul>
  <h2>The declarative mental model</h2>
  <div class="callout">
    <strong>Imperative vs declarative</strong>
    <p>Vanilla JavaScript commands the DOM: <span class="ic">card.append(li)</span>. React declares the result: the UI is a function of state. When state changes, React re-renders the affected components automatically.</p>
  </div>
  <h2>What you will build</h2>
  <p>Across this course you will build a complete <strong>task manager</strong>: add and complete tasks, filter the list, persist it to the browser, and polish the UI — exercising every concept you learn, from props to effects.</p>
  <div class="callout callout-info">
    <strong>Prerequisites</strong>
    <p>You are expected to know JavaScript well: functions, arrays, objects, and basic DOM usage. React adds a declarative layer on top of that — everything you already know still applies.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02C00000-0000-4000-8000-000000000402',
  '02C00000-0000-4000-8000-000000000302',
  1,
  'JSX Deep Dive',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JSX Deep Dive</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #a5f3fc; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfeff; color: #0e7490; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #67e8f9; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #155e75; }
.dark .lesson-page table th { background: #164e63; color: #67e8f9; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>JSX Deep Dive</h1>
  <p><span class="ic">JSX</span> looks like HTML inside your JavaScript, but it is really a shorthand for creating elements. At build time it compiles to function calls — so everything you can do in JavaScript, you can do inside JSX.</p>
  <h2>The three must-follow rules</h2>
  <ol>
    <li><strong>Return one root element</strong> — wrap siblings in a fragment <span class="ic">&lt;&gt;...&lt;/&gt;</span>.</li>
    <li><strong>Close every tag</strong> — <span class="ic">&lt;img /&gt;</span> and <span class="ic">&lt;li&gt;&lt;/li&gt;</span>, no exceptions.</li>
    <li><strong>Use camelCase attributes</strong> — <span class="ic">className</span>, <span class="ic">onClick</span>, <span class="ic">strokeWidth</span>.</li>
  </ol>
  <h2>Expressions in braces</h2>
  <pre class="code-block">const user = { name: 'Ada', role: 'instructor' };

function Card() {
  const label = user.role.toUpperCase();
  return (
    &lt;div className="card"&gt;
      &lt;h2&gt;{user.name}&lt;/h2&gt;
      &lt;p&gt;{label}&lt;/p&gt;
      &lt;p&gt;{1 + 2}&lt;/p&gt;
      &lt;p&gt;{user.role === 'admin' ? 'Full access' : 'Member'}&lt;/p&gt;
    &lt;/div&gt;
  );
}</pre>
  <p>Braces accept any JavaScript expression: arithmetic, ternaries, property access, even array <span class="ic">.map()</span>. Statements like <span class="ic">if</span> are not allowed inside braces — compute the value first.</p>
  <h2>Escaping and text</h2>
  <p>JSX automatically escapes text. Write <span class="ic">{'&lt;3'}</span>, not raw HTML, and React renders it as a plain string — immune to injection by default.</p>
  <h2>Attribute translation table</h2>
  <table>
    <tr><th>HTML</th><th>JSX</th></tr>
    <tr><td>class</td><td>className</td></tr>
    <tr><td>for</td><td>htmlFor</td></tr>
    <tr><td>onclick</td><td>onClick</td></tr>
    <tr><td>tabindex</td><td>tabIndex</td></tr>
    <tr><td>stroke-width</td><td>strokeWidth</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Use the fragment</strong>
    <p><span class="ic">&lt;&gt;&lt;/&gt;</span> adds no DOM node. Reach for it whenever a component needs two sibling elements.</p>
  </div>
  <div class="callout callout-info">
    <strong>Comments</strong>
    <p>JSX comments live inside braces: <span class="ic">{/* a note */}</span>.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02C00000-0000-4000-8000-000000000404',
  '02C00000-0000-4000-8000-000000000304',
  1,
  'Props: Passing Data',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Props: Passing Data</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #a5f3fc; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfeff; color: #0e7490; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #67e8f9; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #155e75; }
.dark .lesson-page table th { background: #164e63; color: #67e8f9; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Props: Passing Data</h1>
  <p><span class="ic">props</span> are the inputs you pass to a component — the React way to make one component render differently. They arrive as a single object of key/value pairs, passed like HTML attributes.</p>
  <h2>Receiving props</h2>
  <pre class="code-block">function Card({ title, body, highlight = false }) {
  return (
    &lt;div className={'card' + (highlight ? ' highlight' : '')}&gt;
      &lt;h2&gt;{title}&lt;/h2&gt;
      &lt;p&gt;{body}&lt;/p&gt;
    &lt;/div&gt;
  );
}

export default function App() {
  return (
    &lt;Card
      title="Weather"
      body="Chance of rain: 10%"
      highlight
    /&gt;
  );
}</pre>
  <p>Destructuring in the signature is the idiomatic style. Default values — like <span class="ic">highlight = false</span> — apply when the prop is omitted.</p>
  <h2>Any JavaScript value goes</h2>
  <p>A prop can be a string, number, boolean, array, object, function, or even a React node:</p>
  <pre class="code-block">&lt;Avatar user={user} /&gt;                  // object
&lt;ProgressBar value={0.7} /&gt;             // number
&lt;ResetButton onReset={resetTasks} /&gt;     // function
&lt;Badge icon={&lt;Star /&gt;} /&gt;                // element</pre>
  <h2>Props are read-only</h2>
  <div class="callout">
    <strong>One-way data flow</strong>
    <p>Data flows <em>down</em>: parent → child. Never assign to a prop inside the child — <span class="ic">props.title = 'x'</span> is a bug. If a child needs to change data, it calls a callback prop the parent provides.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Props make components reusable</strong>
    <p>The same <span class="ic">Card</span> can render a task, a message, or a product. The less a component assumes about its data, the more useful it becomes.</p>
  </div>
  <h2>Why props exist</h2>
  <ul>
    <li>They keep components <strong>pure</strong>: same props, same output.</li>
    <li>They make the data flow <strong>visible</strong> in the JSX tree.</li>
    <li>They enable composition — the topic of the next lesson.</li>
  </ul>
</div>
</body>
</html>
$html$
),
(
  '02C00000-0000-4000-8000-000000000405',
  '02C00000-0000-4000-8000-000000000305',
  1,
  'Composition & Children',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Composition & Children</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #a5f3fc; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfeff; color: #0e7490; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #67e8f9; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #155e75; }
.dark .lesson-page table th { background: #164e63; color: #67e8f9; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Composition &amp; Children</h1>
  <p>Some components act as <strong>containers</strong>: a Card, a Modal, a Page. They should not hard-code their content. The <span class="ic">children</span> prop receives whatever JSX you nest inside a component — turning any component into a flexible shell.</p>
  <h2>The children prop</h2>
  <pre class="code-block">function Panel({ title, children }) {
  return (
    &lt;section className="panel"&gt;
      &lt;h2&gt;{title}&lt;/h2&gt;
      {children}
    &lt;/section&gt;
  );
}

function App() {
  return (
    &lt;Panel title="Today"&gt;
      &lt;p&gt;Clear and sunny, 21&amp;deg;C.&lt;/p&gt;
      &lt;p&gt;Strong breeze in the afternoon.&lt;/p&gt;
    &lt;/Panel&gt;
  );
}</pre>
  <p>Everything between the opening and closing tags of <span class="ic">&lt;Panel&gt;</span> arrives inside <span class="ic">props.children</span>.</p>
  <h2>Children can be anything</h2>
  <ul>
    <li>Elements and plain text.</li>
    <li>Other components, composed arbitrarily deep.</li>
    <li>Arrays produced by <span class="ic">map()</span>.</li>
    <li>Booleans and <span class="ic">null</span> — React simply skips rendering them.</li>
  </ul>
  <h2>Specialization and slots</h2>
  <p>Give a container both children <em>and</em> props, and the same shell can host completely different content:</p>
  <pre class="code-block">&lt;Card&gt;
  &lt;h3&gt;Task: review the pull request&lt;/h3&gt;
  &lt;button onClick={handleDone}&gt;Mark done&lt;/button&gt;
&lt;/Card&gt;

&lt;Card title="Tip"&gt;
  &lt;p&gt;Compose early, split late.&lt;/p&gt;
&lt;/Card&gt;</pre>
  <div class="callout callout-tip">
    <strong>Compose, do not extend</strong>
    <p>Instead of subclassing components, wrap them. A <span class="ic">Card</span> that accepts children is more reusable than a dozen near-identical card variants.</p>
  </div>
  <div class="callout callout-info">
    <strong>Layout components</strong>
    <p>Page shells, modals, and split panes are classic layout components. They manage structure; their children provide the content.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02C00000-0000-4000-8000-000000000407',
  '02C00000-0000-4000-8000-000000000307',
  1,
  'State with useState',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>State with useState</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #a5f3fc; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfeff; color: #0e7490; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #67e8f9; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #155e75; }
.dark .lesson-page table th { background: #164e63; color: #67e8f9; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>State with useState</h1>
  <p><span class="ic">state</span> is data that changes over time: an open page, a typed search, a selected item. <span class="ic">useState</span> gives a component a memory that survives re-renders.</p>
  <pre class="code-block">import { useState } from 'react';

export default function Counter() {
  const [count, setCount] = useState(0);

  function handleClick() {
    setCount(count + 1);
  }

  return (
    &lt;button onClick={handleClick}&gt;
      Clicked {count} times
    &lt;/button&gt;
  );
}</pre>
  <p><span class="ic">useState(0)</span> returns an array: the current value and an updater function. Destructure them in order — <span class="ic">[value, setValue]</span>.</p>
  <h2>How a render reads state</h2>
  <ul>
    <li>On the first render, <span class="ic">count</span> is the initial value, <span class="ic">0</span>.</li>
    <li>Clicking calls <span class="ic">setCount</span>, which schedules a re-render.</li>
    <li>On the next render, <span class="ic">count</span> is <span class="ic">1</span> — state persists across renders.</li>
  </ul>
  <div class="callout">
    <strong>Never mutate state directly</strong>
    <p><span class="ic">count = count + 1</span> changes a local value but does <em>not</em> trigger a re-render. Always call the setter.</p>
  </div>
  <h2>Lazy initial value</h2>
  <pre class="code-block">const [theme, setTheme] = useState(readTheme());        // readTheme() runs every render

const [theme, setTheme] = useState(() =&gt; readTheme());  // readTheme() runs once</pre>
  <p>Pass a function when the initial value is expensive to compute — a storage read, a parse, a scan. React calls it only on the first render.</p>
  <div class="callout callout-tip">
    <strong>One hook per piece of state</strong>
    <p>Split unrelated values into separate <span class="ic">useState</span> calls — <span class="ic">[query, setQuery]</span> and <span class="ic">[draft, setDraft]</span> — instead of one big object you partially overwrite.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02C00000-0000-4000-8000-000000000408',
  '02C00000-0000-4000-8000-000000000308',
  1,
  'Batching & Immutable Updates',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Batching & Immutable Updates</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #a5f3fc; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfeff; color: #0e7490; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #67e8f9; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #155e75; }
.dark .lesson-page table th { background: #164e63; color: #67e8f9; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>State Updates: Batching &amp; Immutability</h1>
  <p>React batches state updates — several setters inside one event handler produce a single re-render. And every update must treat state as <strong>immutable</strong>: copy first, then change.</p>
  <h2>Updating objects</h2>
  <pre class="code-block">const [task, setTask] = useState({ title: '', done: false });

setTask({ ...task, done: !task.done });   // copy, then override</pre>
  <h2>Updating arrays</h2>
  <pre class="code-block">const [tasks, setTasks] = useState(seedTasks);

setTasks([...tasks, newTask]);                          // add
setTasks(tasks.filter((t) =&gt; t.id !== id));             // remove
setTasks(tasks.map((t) =&gt; t.id === id ? { ...t, done: true } : t)); // update</pre>
  <p>Notice the pattern: <span class="ic">map</span>, <span class="ic">filter</span>, and spread never touch the original — they produce a new array.</p>
  <h2>Functional updates</h2>
  <p>When the next value depends on the previous, pass a function. React hands you the latest state, so rapid successive updates stay correct:</p>
  <pre class="code-block">setCount((c) =&gt; c + 1);   // works even when three are batched together</pre>
  <h2>One render per batch</h2>
  <p>React 18 batches inside handlers, promises, and timeouts automatically. The practical consequence: you cannot read the new state immediately after calling a setter — <span class="ic">console.log(count)</span> right after <span class="ic">setCount</span> still shows the old value.</p>
  <table>
    <tr><th>State</th><th>Props</th></tr>
    <tr><td>Owned by the component</td><td>Received from the parent</td></tr>
    <tr><td>Changed via the setter</td><td>Read-only</td></tr>
    <tr><td>Local memory</td><td>External configuration</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Why immutability matters</strong>
    <p>React decides what to re-render by comparing the previous and next values. A fresh object reference proves the data changed; mutating in place can be invisible to that comparison.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02C00000-0000-4000-8000-000000000410',
  '02C00000-0000-4000-8000-000000000310',
  1,
  'Handling Events',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Handling Events</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #a5f3fc; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfeff; color: #0e7490; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #67e8f9; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #155e75; }
.dark .lesson-page table th { background: #164e63; color: #67e8f9; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Handling Events</h1>
  <p>Events in React look like props: camelCase element attributes holding a handler function. You never attach listeners with <span class="ic">addEventListener</span> — you declare the handler in JSX.</p>
  <pre class="code-block">function DeleteButton({ onDelete, id }) {
  function handleClick() {
    onDelete(id);
  }

  return &lt;button onClick={handleClick}&gt;Delete&lt;/button&gt;;
}</pre>
  <h2>Pass a function, not a call</h2>
  <div class="callout">
    <strong>onClick={handleClick} vs onClick={handleClick()}</strong>
    <p>Calling <span class="ic">handleClick()</span> inside JSX runs the handler <em>during render</em> and passes its result. Pass the reference instead, and React invokes it when the event actually fires.</p>
  </div>
  <h2>The event object</h2>
  <pre class="code-block">&lt;input
  onChange={(event) =&gt; setQuery(event.target.value)}
/&gt;

&lt;form onSubmit={(event) =&gt; event.preventDefault()}&gt;...&lt;/form&gt;</pre>
  <p>Handlers receive the event as their argument, so inline arrows are the natural choice when you need both extra data and the event.</p>
  <h2>Passing arguments</h2>
  <pre class="code-block">&lt;li key={task.id}&gt;
  &lt;button onClick={() =&gt; onToggle(task.id)}&gt;Toggle&lt;/button&gt;

  &lt;input onChange={(e) =&gt; onRename(task.id, e.target.value)} /&gt;
&lt;/li&gt;</pre>
  <div class="callout callout-tip">
    <strong>Synthetic events</strong>
    <p>React wraps native events in a <span class="ic">SyntheticEvent</span> with the same interface. Since React 17 there is no pooling, so reading event fields inside a state updater is safe.</p>
  </div>
  <h2>Common event props</h2>
  <table>
    <tr><th>Event</th><th>Fires when</th></tr>
    <tr><td>onClick</td><td>an element is clicked</td></tr>
    <tr><td>onChange</td><td>a controlled field changes value</td></tr>
    <tr><td>onSubmit</td><td>a form is submitted</td></tr>
    <tr><td>onKeyDown</td><td>a key is pressed</td></tr>
    <tr><td>onFocus / onBlur</td><td>a field gains / loses focus</td></tr>
  </table>
</div>
</body>
</html>
$html$
),
(
  '02C00000-0000-4000-8000-000000000411',
  '02C00000-0000-4000-8000-000000000311',
  1,
  'Forms & Controlled Inputs',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Forms & Controlled Inputs</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #a5f3fc; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfeff; color: #0e7490; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #67e8f9; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #155e75; }
.dark .lesson-page table th { background: #164e63; color: #67e8f9; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Forms &amp; Controlled Inputs</h1>
  <p>A <strong>controlled input</strong> has its value driven entirely by state: <span class="ic">value</span> comes from state, and every keystroke flows back through <span class="ic">onChange</span>. One source of truth, no surprises.</p>
  <h2>A text field controlled by state</h2>
  <pre class="code-block">const [draft, setDraft] = useState('');

&lt;input
  value={draft}
  onChange={(e) =&gt; setDraft(e.target.value)}
  placeholder="What needs doing?"
/&gt;</pre>
  <h2>Multi-field forms</h2>
  <p>One state object plus one generic handler keeps forms tidy:</p>
  <pre class="code-block">const [form, setForm] = useState({ title: '', priority: 'medium' });

function handleChange(e) {
  const { name, value } = e.target;
  setForm((prev) =&gt; ({ ...prev, [name]: value }));
}

&lt;input name="title" value={form.title} onChange={handleChange} /&gt;
&lt;select name="priority" value={form.priority} onChange={handleChange}&gt;
  &lt;option value="high"&gt;High&lt;/option&gt;
  &lt;option value="medium"&gt;Medium&lt;/option&gt;
  &lt;option value="low"&gt;Low&lt;/option&gt;
&lt;/select&gt;</pre>
  <h2>Checkboxes</h2>
  <p>Checkboxes flip a boolean, so read <span class="ic">checked</span> from the event:</p>
  <pre class="code-block">&lt;input
  type="checkbox"
  checked={task.done}
  onChange={(e) =&gt; onToggle(task.id, e.target.checked)}
/&gt;</pre>
  <h2>Submitting</h2>
  <pre class="code-block">function handleSubmit(e) {
  e.preventDefault();               // stop the page reload
  if (!draft.trim()) return;        // ignore empty submissions
  onAdd(draft.trim());
  setDraft('');                     // clear after a valid submit
}

&lt;form onSubmit={handleSubmit}&gt;
  {content}
  &lt;button type="submit"&gt;Add task&lt;/button&gt;
&lt;/form&gt;</pre>
  <div class="callout callout-info">
    <strong>Uncontrolled inputs</strong>
    <p>Use <span class="ic">defaultValue</span> without <span class="ic">value</span> when you want the browser to own the field and read it once. Prefer controlled inputs by default — validation and derived UI become trivial.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Reset inside the handler</strong>
    <p>Clear the draft in <span class="ic">handleSubmit</span>, not after it. The next render then shows an empty field ready for the next entry.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02C00000-0000-4000-8000-000000000413',
  '02C00000-0000-4000-8000-000000000313',
  1,
  'Rendering Lists',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Rendering Lists</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #a5f3fc; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfeff; color: #0e7490; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #67e8f9; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #155e75; }
.dark .lesson-page table th { background: #164e63; color: #67e8f9; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Rendering Lists</h1>
  <p>Arrays belong in JSX. The idiomatic way to render a collection is <span class="ic">map()</span> returning one element per item — each with a <span class="ic">key</span>.</p>
  <h2>Map over the data</h2>
  <pre class="code-block">const tasks = [
  { id: 1, title: 'Learn JSX' },
  { id: 2, title: 'Write a component' },
];

function TaskList() {
  return (
    &lt;ul&gt;
      {tasks.map((task) =&gt; (
        &lt;li key={task.id}&gt;{task.title}&lt;/li&gt;
      ))}
    &lt;/ul&gt;
  );
}</pre>
  <h2>Render a component per item</h2>
  <p>Move the row into its own component and keep the <span class="ic">key</span> on the outermost element in the loop:</p>
  <pre class="code-block">{tasks.map((task) =&gt; (
  &lt;TaskItem
    key={task.id}
    task={task}
    onToggle={handleToggle}
    onDelete={handleDelete}
  /&gt;
))}</pre>
  <h2>Transform before you render</h2>
  <p>Filtering and sorting are plain array work you do above the <span class="ic">return</span>:</p>
  <pre class="code-block">const openTasks = tasks.filter((t) =&gt; !t.done);
const doneCount = tasks.filter((t) =&gt; t.done).length;</pre>
  <div class="callout">
    <strong>Keys, always</strong>
    <p><span class="ic">map()</span> without a <span class="ic">key</span> triggers a console warning and makes list updates unpredictable. Give every row a stable, unique key — the next lesson explains why.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Empty lists</strong>
    <p>When the array is empty, <span class="ic">map()</span> renders nothing at all. Pair it with a conditional empty state so users always get feedback.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02C00000-0000-4000-8000-000000000414',
  '02C00000-0000-4000-8000-000000000314',
  1,
  'Keys & Reconciliation',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Keys & Reconciliation</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #a5f3fc; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfeff; color: #0e7490; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #67e8f9; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #155e75; }
.dark .lesson-page table th { background: #164e63; color: #67e8f9; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Keys &amp; Reconciliation</h1>
  <p>When state changes, React compares the new element tree with the previous one and updates only what differs — this process is called <strong>reconciliation</strong>. Keys are the identity cards that make it fast and correct.</p>
  <h2>Matching items by identity</h2>
  <p>For a list, React matches entries by <span class="ic">key</span>. Two items sharing a key are treated as the <em>same</em> item, even if their position moved. This is how React keeps edits, focus, and local state attached to the right rows.</p>
  <h2>Why index keys break</h2>
  <pre class="code-block">{tasks.map((task, index) =&gt; (
  &lt;TaskItem key={index} /&gt;   // fragile
))}</pre>
  <ul>
    <li>Reordering the array shoves old components onto new data.</li>
    <li>Per-item state — a checkbox, a draft — follows the index, not the item.</li>
    <li>Inserting at the front shifts every index and rewrites the whole list.</li>
  </ul>
  <h2>What makes a good key</h2>
  <pre class="code-block">&lt;TaskItem key={task.id} task={task} /&gt;   // stable id from the data</pre>
  <div class="callout callout-tip">
    <strong>Stable · unique · predictable</strong>
    <p>Prefer a database <span class="ic">id</span> or another value intrinsic to the data. Never generate keys with <span class="ic">Math.random()</span> inside <span class="ic">map()</span> — they would change on every render.</p>
  </div>
  <div class="callout callout-info">
    <strong>Keys are not props</strong>
    <p><span class="ic">key</span> is read by React and never reaches your component. If a component needs its id, pass it separately: <span class="ic">task={task}</span>.</p>
  </div>
  <h2>Keys beyond lists</h2>
  <p>The same identity rule applies to sibling elements that can swap places — toggled panels, reorderable rows. Give such siblings keys too, and React keeps their state on the right element.</p>
</div>
</body>
</html>
$html$
),
(
  '02C00000-0000-4000-8000-000000000416',
  '02C00000-0000-4000-8000-000000000316',
  1,
  'Conditional Rendering',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Conditional Rendering</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #a5f3fc; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfeff; color: #0e7490; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #67e8f9; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #155e75; }
.dark .lesson-page table th { background: #164e63; color: #67e8f9; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Conditional Rendering</h1>
  <p>Conditional rendering shows different UI for different states — loaded vs loading, empty vs full, dark vs light. In React you decide with plain JavaScript.</p>
  <h2>if / else returns</h2>
  <pre class="code-block">function TaskList({ tasks }) {
  if (tasks.length === 0) {
    return &lt;p className="empty"&gt;No tasks yet. Add one above.&lt;/p&gt;;
  }
  return (
    &lt;ul&gt;
      {tasks.map((task) =&gt; (
        &lt;TaskItem key={task.id} task={task} /&gt;
      ))}
    &lt;/ul&gt;
  );
}</pre>
  <h2>Ternary and logical AND</h2>
  <pre class="code-block">{isSaving
  ? &lt;Spinner /&gt;
  : &lt;SaveButton /&gt;}

{error &amp;&amp; &lt;p className="error"&gt;{error}&lt;/p&gt;}</pre>
  <div class="callout">
    <strong>The 0 trap</strong>
    <p><span class="ic">{count &amp;&amp; &lt;Badge /&gt;}</span> renders <span class="ic">0</span> when <span class="ic">count</span> is zero, because <span class="ic">0</span> is falsy yet renderable. For numeric conditions use an explicit comparison or a ternary.</p>
  </div>
  <h2>Early returns as guards</h2>
  <pre class="code-block">function Profile({ user }) {
  if (user == null) return &lt;LoginPrompt /&gt;;
  return &lt;UserCard user={user} /&gt;;
}</pre>
  <p>Early returns keep the happy path flat — no deep nesting of conditionals. They are the standard tool for auth walls, missing data, and loading screens.</p>
  <div class="callout callout-tip">
    <strong>Keep render pure</strong>
    <p>Conditional rendering is about what to show, not about side effects. Decide inside the render; fetch and subscribe in effects or handlers.</p>
  </div>
  <div class="callout callout-info">
    <strong>null is a valid return</strong>
    <p>Returning <span class="ic">null</span> renders nothing at all — ideal when a component has no output for a given state.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02C00000-0000-4000-8000-000000000417',
  '02C00000-0000-4000-8000-000000000317',
  1,
  'Styling React Components',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Styling React Components</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #a5f3fc; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfeff; color: #0e7490; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #67e8f9; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #155e75; }
.dark .lesson-page table th { background: #164e63; color: #67e8f9; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Styling React Components</h1>
  <p>React does not replace CSS — it just makes the CSS surface explicit. Your component attaches classes and inline style objects; however you organize the stylesheet is up to you.</p>
  <h2>className plus stylesheets</h2>
  <pre class="code-block">&lt;button className="btn btn-primary"&gt;Save&lt;/button&gt;

/* app.css */
.btn { padding: 8px 14px; border-radius: 6px; }
.btn-primary { background: #06b6d4; color: white; }</pre>
  <h2>Dynamic classes</h2>
  <p>Build the class string from component state — the most common styling decision in a component:</p>
  <pre class="code-block">const classes = ['task-item'];
if (task.done) classes.push('task-item--done');
if (task.priority === 'high') classes.push('task-item--high');

&lt;li className={classes.join(' ')}&gt;{task.title}&lt;/li&gt;</pre>
  <h2>Inline styles as objects</h2>
  <p>Pass a style object for quick, one-off values. Property names are camelCased and values are strings or numbers:</p>
  <pre class="code-block">const style = {
  color: task.priority === 'high' ? '#dc2626' : '#111827',
  fontWeight: task.done ? 400 : 600,
};

&lt;p style={style}&gt;{task.title}&lt;/p&gt;</pre>
  <h2>Patterns used in this course</h2>
  <ul>
    <li>Plain <span class="ic">.css</span> files to keep the capstone approachable.</li>
    <li>Utility classes for layout plus BEM-ish modifiers above.</li>
    <li>CSS variables for the light/dark theme of the completed app.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Three-way class logic</strong>
    <p>For many conditional classes, the array + <span class="ic">join</span> pattern stays readable. Libraries like <span class="ic">clsx</span> do the same in one line.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02C00000-0000-4000-8000-000000000419',
  '02C00000-0000-4000-8000-000000000319',
  1,
  'Effects with useEffect',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Effects with useEffect</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #a5f3fc; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfeff; color: #0e7490; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #67e8f9; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #155e75; }
.dark .lesson-page table th { background: #164e63; color: #67e8f9; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Effects with useEffect</h1>
  <p><span class="ic">useEffect</span> runs code <em>after</em> the render commits to the screen — the correct home for network requests, timers, and subscriptions that talk to the outside world.</p>
  <h2>Fetching data</h2>
  <pre class="code-block">import { useEffect, useState } from 'react';

function TaskStats({ userId }) {
  const [stats, setStats] = useState(null);

  useEffect(() =&gt; {
    fetch(`/api/users/${userId}/stats`)
      .then((res) =&gt; res.json())
      .then((data) =&gt; setStats(data))
      .catch((err) =&gt; setError(err));
  }, [userId]);

  if (stats === null) return &lt;p&gt;Loading stats...&lt;/p&gt;;
  return (
    &lt;p&gt;You have completed {stats.done} of {stats.total} tasks.&lt;/p&gt;
  );
}</pre>
  <h2>What runs when</h2>
  <table>
    <tr><th>Dependency array</th><th>When the effect runs</th></tr>
    <tr><td>[]</td><td>once, after the first render</td></tr>
    <tr><td>[userId]</td><td>after the first render and whenever userId changes</td></tr>
    <tr><td>(no array)</td><td>after every render — almost always a mistake</td></tr>
  </table>
  <h2>Loading and error states</h2>
  <pre class="code-block">const [status, setStatus] = useState('loading');
const [data, setData] = useState(null);
const [error, setError] = useState(null);</pre>
  <div class="callout">
    <strong>Do not set state during render</strong>
    <p>Calling a setter inside the component body (before <span class="ic">return</span>) triggers an infinite loop. Setters belong in effects and event handlers.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Render stays pure</strong>
    <p>Expensive or external work — fetching, logging, subscribing — belongs in effects, never in the render body itself. The render must be able to repeat without side effects.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02C00000-0000-4000-8000-000000000420',
  '02C00000-0000-4000-8000-000000000320',
  1,
  'Dependencies & Cleanup',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dependencies & Cleanup</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #a5f3fc; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfeff; color: #0e7490; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #67e8f9; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #155e75; }
.dark .lesson-page table th { background: #164e63; color: #67e8f9; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Dependencies &amp; Cleanup</h1>
  <p>An effect needs two more pieces of discipline to be correct: a truthful dependency array, and a cleanup function that undoes whatever the effect started.</p>
  <h2>Cleanup in action</h2>
  <pre class="code-block">useEffect(() =&gt; {
  const timer = setInterval(() =&gt; setNow(new Date()), 1000);
  return () =&gt; clearInterval(timer);   // called before the next run
}, []);                                // and once on unmount</pre>
  <h2>Cleanup protects stale work</h2>
  <pre class="code-block">useEffect(() =&gt; {
  let cancelled = false;

  fetch(`/api/search?q=${query}`)
    .then((res) =&gt; res.json())
    .then((results) =&gt; {
      if (!cancelled) setResults(results);
    });

  return () =&gt; { cancelled = true; };
}, [query]);</pre>
  <p>As the query changes, the previous request is cancelled in the cleanup so a slow, out-of-date response can never overwrite newer results.</p>
  <h2>Dependency arrays</h2>
  <ul>
    <li>List every value from outside the effect that the effect reads.</li>
    <li>Omit the array entirely for effects that must run after every render.</li>
    <li>Use <span class="ic">[]</span> only for mount-and-unmount effects like the timer above — the <span class="ic">setNow</span> function is stable, so listing it is unnecessary.</li>
  </ul>
  <div class="callout">
    <strong>Missing dependencies lie</strong>
    <p>The linter exists to catch this: when an effect reads a prop or state but omits it from the array, it still runs on stale values. Add it, or restructure the effect.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Cleanup is for every subscription</strong>
    <p>Event listeners, sockets, observers, and intervals all leak if nothing releases them. If your effect creates a subscription, your cleanup must remove it.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02C00000-0000-4000-8000-000000000422',
  '02C00000-0000-4000-8000-000000000322',
  1,
  'Context: Shared State',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Context: Shared State</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #a5f3fc; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfeff; color: #0e7490; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #67e8f9; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #155e75; }
.dark .lesson-page table th { background: #164e63; color: #67e8f9; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Context: Shared State</h1>
  <p><strong>Context</strong> lets a component share a value with every descendant — theme, session, locale, feature flags — without drilling props through every level in between.</p>
  <h2>Create the context</h2>
  <pre class="code-block">import { createContext, useContext, useState } from 'react';

const ThemeContext = createContext(null);</pre>
  <h2>Provide the value</h2>
  <pre class="code-block">function App() {
  const [theme, setTheme] = useState('light');

  return (
    &lt;ThemeContext.Provider value={{ theme, setTheme }}&gt;
      &lt;Page /&gt;
    &lt;/ThemeContext.Provider&gt;
  );
}</pre>
  <h2>Consume it anywhere below</h2>
  <pre class="code-block">function ThemeToggle() {
  const { theme, setTheme } = useContext(ThemeContext);

  return (
    &lt;button onClick={() =&gt; setTheme(theme === 'light' ? 'dark' : 'light')}&gt;
      Switch to {theme === 'light' ? 'dark' : 'light'} mode
    &lt;/button&gt;
  );
}</pre>
  <h2>Share handlers too</h2>
  <p>Context is not limited to values — putting the action functions in the same object lets deep siblings call them without a prop chain:</p>
  <pre class="code-block">const TasksContext = createContext(null);

function TasksProvider({ children }) {
  const [tasks, setTasks] = useState(seed);

  const addTask = (title) =&gt; setTasks((prev) =&gt; [...prev, createTask(title)]);
  const toggleTask = (id) =&gt;
    setTasks((prev) =&gt; prev.map((t) =&gt; (t.id === id ? { ...t, done: !t.done } : t)));

  return (
    &lt;TasksContext.Provider value={{ tasks, addTask, toggleTask }}&gt;
      {children}
    &lt;/TasksContext.Provider&gt;
  );
}</pre>
  <div class="callout">
    <strong>Context is not a state manager</strong>
    <p>Every consumer re-renders when the provider value changes. Keep frequently-changing, fine-grained data in local state and reserve context for broader, slower-changing shared values.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Guard the consumer</strong>
    <p>If a consumer could render outside the provider, throw a descriptive error instead of silently defaulting to <span class="ic">null</span>.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02C00000-0000-4000-8000-000000000423',
  '02C00000-0000-4000-8000-000000000323',
  1,
  'Custom Hooks & Hook Rules',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Custom Hooks & Hook Rules</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #a5f3fc; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfeff; color: #0e7490; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #67e8f9; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #155e75; }
.dark .lesson-page table th { background: #164e63; color: #67e8f9; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Custom Hooks &amp; Hook Rules</h1>
  <p>A <strong>custom hook</strong> is a function whose name starts with <span class="ic">use</span> and that calls other hooks. It is the cleanest way to share behavior — fetching, timers, form logic — between components.</p>
  <h2>Extract a hook</h2>
  <pre class="code-block">function useClock() {
  const [now, setNow] = useState(new Date());

  useEffect(() =&gt; {
    const timer = setInterval(() =&gt; setNow(new Date()), 1000);
    return () =&gt; clearInterval(timer);
  }, []);

  return now.toLocaleTimeString();
}

function Clock() {
  const time = useClock();   // reuse in any component
  return &lt;span&gt;{time}&lt;/span&gt;;
}</pre>
  <h2>Share a fetch</h2>
  <pre class="code-block">function useTasks(userId) {
  const [tasks, setTasks] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() =&gt; {
    let cancelled = false;
    setLoading(true);
    fetch(`/api/users/${userId}/tasks`)
      .then((res) =&gt; res.json())
      .then((data) =&gt; { if (!cancelled) setTasks(data); })
      .finally(() =&gt; { if (!cancelled) setLoading(false); });
    return () =&gt; { cancelled = true; };
  }, [userId]);

  return { tasks, loading };
}</pre>
  <p>Each component that calls <span class="ic">useTasks</span> gets its own state and effect — hooks are not shared between callers, only the logic is.</p>
  <h2>The rules of hooks</h2>
  <ul>
    <li>Only call hooks at the top level of a component or a custom hook — never in loops, conditions, or nested functions.</li>
    <li>Hooks must be called unconditionally in the same order on every render.</li>
    <li>Hooks start with <span class="ic">use</span>, so the linter can verify the two rules above.</li>
  </ul>
  <div class="callout">
    <strong>Why the rules matter</strong>
    <p>React pairs each hook call with the state it owns by position in the call order. Skipping a call on one render shifts every pair that follows and corrupts the component's state.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Name with intent</strong>
    <p>Name hooks for the value they return or the behavior they encapsulate: <span class="ic">useClock</span>, <span class="ic">useTasks</span>, <span class="ic">useLocalStorage</span>, <span class="ic">useDebounce</span>.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02C00000-0000-4000-8000-000000000425',
  '02C00000-0000-4000-8000-000000000325',
  1,
  'Thinking in React',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thinking in React</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #a5f3fc; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfeff; color: #0e7490; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #67e8f9; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #155e75; }
.dark .lesson-page table th { background: #164e63; color: #67e8f9; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Thinking in React</h1>
  <p>The React mindset is a repeatable process — break the design into components, build a static version, and only then make it interactive. Practice it now, on a real feature.</p>
  <h2>The workflow</h2>
  <ol>
    <li><strong>Break the UI into components.</strong> Sketch boxes, name them, and draw the parent-child arrows.</li>
    <li><strong>Build a static version.</strong> Props flow down; nothing changes yet. This validates the component tree.</li>
    <li><strong>Find the minimal state.</strong> Ask: does this data change? Can I derive it from other state instead?</li>
    <li><strong>Place state with context in mind.</strong> Near the components that need it, or in a provider if it spans siblings.</li>
    <li><strong>Wire the data flow.</strong> Handlers flow down as props; updates flow up through setters.</li>
  </ol>
  <h2>What is NOT state</h2>
  <table>
    <tr><th>Not state</th><th>Because...</th></tr>
    <tr><td>Props from the parent</td><td>The parent already owns it</td></tr>
    <tr><td>Things computable from props or state</td><td>Derive, don't duplicate</td></tr>
    <tr><td>Values that never change</td><td>Constants belong outside the component</td></tr>
    <tr><td>A copy of another piece of state</td><td>Two sources of truth get out of sync</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Inverted data flow</strong>
    <p>Children cannot change their props — they call a handler the parent provides. Lifting the setter up a level is the standard way to keep one source of truth.</p>
  </div>
  <div class="callout callout-info">
    <strong>Say what, not how</strong>
    <p>Name events by what happened (<span class="ic">onToggle</span>, <span class="ic">onDelete</span>), not by implementation. Child components stay reusable and the parent decides the details.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02C00000-0000-4000-8000-000000000426',
  '02C00000-0000-4000-8000-000000000326',
  1,
  'Capstone: Project Setup',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Project Setup</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #a5f3fc; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfeff; color: #0e7490; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #67e8f9; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #155e75; }
.dark .lesson-page table th { background: #164e63; color: #67e8f9; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Project Setup</h1>
  <p>Time to build. In the capstone you construct a small task manager end to end — the code pattern behind every tutorial to-do app scaled into a thoughtful component tree.</p>
  <h2>Generate the app</h2>
  <pre class="code-block">npm create vite@latest task-manager -- --template react
cd task-manager
npm install
npm run dev</pre>
  <h2>Planned component tree</h2>
  <pre class="code-block">App
+-- TaskInput            (controlled input + submit)
+-- TaskList
|   +-- TaskItem         (checkbox, title, delete)
+-- TaskControls         (filter + clear completed)
+-- ProgressSummary      (derived counts)</pre>
  <h2>Static version first</h2>
  <p>Build the tree with hardcoded data and no setters. Verify each part renders correctly before adding state:</p>
  <pre class="code-block">const seed = [
  { id: 1, title: 'Set up the project', done: true },
  { id: 2, title: 'Build TaskInput', done: false },
  { id: 3, title: 'Connect state', done: false },
];</pre>
  <h2>State placement</h2>
  <ul>
    <li><span class="ic">tasks</span> lives in <span class="ic">App</span> — TaskList and ProgressSummary both need it.</li>
    <li><span class="ic">draft</span> lives in <span class="ic">TaskInput</span> — no other component reads it.</li>
    <li><span class="ic">filter</span> lives in <span class="ic">App</span> so TaskControls (set) and TaskList (read) share it.</li>
  </ul>
  <div class="callout">
    <strong>Derived values, not new state</strong>
    <p>Active count, done count, and filtered rows are computed with <span class="ic">filter</span> and <span class="ic">map</span> at render time. Storing them as state invites the two-sources-of-truth bug.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Match the CSS file</strong>
    <p>Keep class names in sync with <span class="ic">styles.css</span> as you go, and the final polish is already half done.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02C00000-0000-4000-8000-000000000427',
  '02C00000-0000-4000-8000-000000000327',
  1,
  'Capstone: Building & Polishing',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Building & Polishing</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #a5f3fc; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfeff; color: #0e7490; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #67e8f9; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #155e75; }
.dark .lesson-page table th { background: #164e63; color: #67e8f9; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Building &amp; Polishing</h1>
  <p>Now the static tree comes alive: wire the handlers, filter the list, persist changes, and polish the details.</p>
  <h2>Wire the handlers in App</h2>
  <pre class="code-block">function App() {
  const [tasks, setTasks] = useState(seed);
  const [filter, setFilter] = useState('all');

  const addTask = (title) =&gt;
    setTasks((prev) =&gt; [...prev, createTask(title)]);

  const toggleTask = (id) =&gt;
    setTasks((prev) =&gt; prev.map((t) =&gt; (t.id === id ? { ...t, done: !t.done } : t)));

  const deleteTask = (id) =&gt;
    setTasks((prev) =&gt; prev.filter((t) =&gt; t.id !== id));

  return (
    &lt;main className="app"&gt;
      &lt;TaskInput onAdd={addTask} /&gt;
      &lt;TaskList
        tasks={visibleTasks}
        onToggle={toggleTask}
        onDelete={deleteTask}
      /&gt;
      &lt;TaskControls filter={filter} onFilterChange={setFilter} /&gt;
    &lt;/main&gt;
  );
}</pre>
  <h2>Filters are derived, not stored</h2>
  <pre class="code-block">const visibleTasks = tasks.filter((t) =&gt; {
  if (filter === 'active') return !t.done;
  if (filter === 'done') return t.done;
  return true;
});</pre>
  <h2>Empty states</h2>
  <pre class="code-block">{visibleTasks.length === 0 &amp;&amp; (
  &lt;p className="empty"&gt;Nothing here yet. Add your first task!&lt;/p&gt;
)}</pre>
  <h2>Persist with a custom hook</h2>
  <pre class="code-block">function useLocalStorage(key, initial) {
  const [value, setValue] = useState(() =&gt; JSON.parse(localStorage.getItem(key)) ?? initial);

  useEffect(() =&gt; {
    localStorage.setItem(key, JSON.stringify(value));
  }, [key, value]);

  return [value, setValue];
}</pre>
  <h2>Polish checklist</h2>
  <ul>
    <li>Empty-state message for every tab.</li>
    <li>Disabled submit button when the draft is blank.</li>
    <li>Delete with a confirm-free but forgiving layout (edit instead of destroy).</li>
    <li>A light/dark theme switch via Context.</li>
    <li>Derived counts in <span class="ic">ProgressSummary</span>.</li>
  </ul>
  <div class="callout">
    <strong>Test the interactions</strong>
    <p>Add, toggle, filter, delete, refresh, switch theme. Every flow you repeat is a free regression test.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Ship it</strong>
    <p>This is a complete React project you built from a blank <span class="ic">vite</span> template. Every concept from this course appears in your files — that is the goal.</p>
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
  ('02C00000-0000-4000-8000-000000000501', '02C00000-0000-4000-8000-000000000303',
   'Which statement best describes a React component?',
   'A component is a function that returns a tree of React elements.', 1),
  ('02C00000-0000-4000-8000-000000000502', '02C00000-0000-4000-8000-000000000303',
   'Why does React reconcile a virtual representation of the UI?',
   'React diffs the virtual tree and updates only the parts of the real DOM that changed.', 2),
  ('02C00000-0000-4000-8000-000000000503', '02C00000-0000-4000-8000-000000000303',
   'What happens to JSX before the browser runs your app?',
   'JSX is compiled into JavaScript function calls that build the element tree.', 3),
  ('02C00000-0000-4000-8000-000000000504', '02C00000-0000-4000-8000-000000000306',
   'What do props represent for a component?',
   'Props are read-only input values that a parent passes to its child.', 1),
  ('02C00000-0000-4000-8000-000000000505', '02C00000-0000-4000-8000-000000000306',
   'When does a component use the children prop?',
   'To render arbitrary content placed between its opening and closing tags.', 2),
  ('02C00000-0000-4000-8000-000000000506', '02C00000-0000-4000-8000-000000000306',
   'Why can a component not change its own props?',
   'Props flow down from the parent, which owns the value and re-renders the child with changes.', 3),
  ('02C00000-0000-4000-8000-000000000507', '02C00000-0000-4000-8000-000000000309',
   'What does the useState(0) call return?',
   'It returns a pair: the current value and a setter function.', 1),
  ('02C00000-0000-4000-8000-000000000508', '02C00000-0000-4000-8000-000000000309',
   'Why pass an updater function to a state setter?',
   'The updater receives the latest state, so rapid or batched updates never read a stale value.', 2),
  ('02C00000-0000-4000-8000-000000000509', '02C00000-0000-4000-8000-000000000309',
   'Which call toggles the done field without mutating the task?',
   'Spreading the object keeps a fresh reference and only the overridden field changes.', 3),
  ('02C00000-0000-4000-8000-000000000510', '02C00000-0000-4000-8000-000000000312',
   'Why pass a function reference to onClick instead of a call?',
   'A call runs during render; a reference lets React invoke the handler when the click happens.', 1),
  ('02C00000-0000-4000-8000-000000000511', '02C00000-0000-4000-8000-000000000312',
   'Why call preventDefault() inside a submit handler?',
   'It stops the browser default page reload so React can handle the submission.', 2),
  ('02C00000-0000-4000-8000-000000000512', '02C00000-0000-4000-8000-000000000312',
   'What makes an input controlled?',
   'Its value comes from state and every keystroke flows back through onChange.', 3),
  ('02C00000-0000-4000-8000-000000000513', '02C00000-0000-4000-8000-000000000315',
   'How do you render an array of items inside JSX?',
   'Call map() so each item returns an element for the list.', 1),
  ('02C00000-0000-4000-8000-000000000514', '02C00000-0000-4000-8000-000000000315',
   'Why is the array index a poor choice of key?',
   'Indexes shift when items are reordered, so React reuses components for the wrong items.', 2),
  ('02C00000-0000-4000-8000-000000000515', '02C00000-0000-4000-8000-000000000315',
   'Where does the key attribute belong?',
   'On the outermost element returned inside the map loop.', 3),
  ('02C00000-0000-4000-8000-000000000516', '02C00000-0000-4000-8000-000000000318',
   'Why does {count && <Badge />} render 0 when count is 0?',
   '0 is falsy yet still a renderable value, so it passes straight through &&.', 1),
  ('02C00000-0000-4000-8000-000000000517', '02C00000-0000-4000-8000-000000000318',
   'Why prefer an early return over deep nesting?',
   'It keeps the happy path flat while guarding missing data like an unauthenticated user.', 2),
  ('02C00000-0000-4000-8000-000000000518', '02C00000-0000-4000-8000-000000000318',
   'Which pattern is cleanest for several conditional classes?',
   'Build an array and join the class names with a space.', 3),
  ('02C00000-0000-4000-8000-000000000519', '02C00000-0000-4000-8000-000000000321',
   'When does an effect with an empty dependency array run?',
   'Once, after the component first commits to the screen.', 1),
  ('02C00000-0000-4000-8000-000000000520', '02C00000-0000-4000-8000-000000000321',
   'Where do network requests belong in a React component?',
   'In effects and event handlers, never during the render.', 2),
  ('02C00000-0000-4000-8000-000000000521', '02C00000-0000-4000-8000-000000000321',
   'What is the cleanup function of an effect for?',
   'Releasing subscriptions, timers, and listeners before the next run and on unmount.', 3),
  ('02C00000-0000-4000-8000-000000000522', '02C00000-0000-4000-8000-000000000324',
   'When is Context the right choice?',
   'When a broadly-changing value such as a theme is needed by many descendants.', 1),
  ('02C00000-0000-4000-8000-000000000523', '02C00000-0000-4000-8000-000000000324',
   'Why must hooks always be called in the same order at the top level?',
   'React pairs each hook with its state by call position, so skipping a call corrupts the pairs.', 2),
  ('02C00000-0000-4000-8000-000000000524', '02C00000-0000-4000-8000-000000000324',
   'What makes a function a custom hook?',
   'Its name starts with use and it calls other hooks.', 3),
  ('02C00000-0000-4000-8000-000000000525', '02C00000-0000-4000-8000-000000000328',
   'What is the first step of Thinking in React?',
   'Break the design into components and build a static version before adding any state.', 1),
  ('02C00000-0000-4000-8000-000000000526', '02C00000-0000-4000-8000-000000000328',
   'Which value should NOT be stored as state?',
   'A value derivable from existing state, such as the count of done tasks, is not state.', 2),
  ('02C00000-0000-4000-8000-000000000527', '02C00000-0000-4000-8000-000000000328',
   'Why use functional updates for array state?',
   'The updater reads the latest state, which stays correct when updates are batched.', 3),
  ('02C00000-0000-4000-8000-000000000528', '02C00000-0000-4000-8000-000000000328',
   'Where should state shared by sibling lists and summaries live?',
   'Lift it up to their closest common ancestor component.', 4),
  ('02C00000-0000-4000-8000-000000000529', '02C00000-0000-4000-8000-000000000328',
   'What cleanup does a setInterval effect require?',
   'A returned cleanup that clears the interval before the next run and on unmount.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the correct answer is always at position 1.
--    Q1 options 1001-1004 · Q2 1005-1008 · ... · Q29 1113-1116.
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): component definition
  ('02C00000-0000-4000-8000-000000001001', '02C00000-0000-4000-8000-000000000501', 'A function that returns a tree of React elements', TRUE,  1),
  ('02C00000-0000-4000-8000-000000001002', '02C00000-0000-4000-8000-000000000501', 'A database table for the UI', FALSE, 2),
  ('02C00000-0000-4000-8000-000000001003', '02C00000-0000-4000-8000-000000000501', 'A build tool that compiles CSS', FALSE, 3),
  ('02C00000-0000-4000-8000-000000001004', '02C00000-0000-4000-8000-000000000501', 'A browser plugin for styling', FALSE, 4),
  -- Q2 (502): reconciliation
  ('02C00000-0000-4000-8000-000000001005', '02C00000-0000-4000-8000-000000000502', 'To efficiently update the real DOM', TRUE,  1),
  ('02C00000-0000-4000-8000-000000001006', '02C00000-0000-4000-8000-000000000502', 'To replace HTML entirely', FALSE, 2),
  ('02C00000-0000-4000-8000-000000001007', '02C00000-0000-4000-8000-000000000502', 'To fetch data from a server', FALSE, 3),
  ('02C00000-0000-4000-8000-000000001008', '02C00000-0000-4000-8000-000000000502', 'To skip writing JavaScript', FALSE, 4),
  -- Q3 (503): JSX compilation
  ('02C00000-0000-4000-8000-000000001009', '02C00000-0000-4000-8000-000000000503', 'It is compiled into JavaScript function calls', TRUE,  1),
  ('02C00000-0000-4000-8000-000000001010', '02C00000-0000-4000-8000-000000000503', 'It runs unchanged in the browser', FALSE, 2),
  ('02C00000-0000-4000-8000-000000001011', '02C00000-0000-4000-8000-000000000503', 'It is translated into CSS rules', FALSE, 3),
  ('02C00000-0000-4000-8000-000000001012', '02C00000-0000-4000-8000-000000000503', 'It is executed only on the server', FALSE, 4),
  -- Q4 (504): props
  ('02C00000-0000-4000-8000-000000001013', '02C00000-0000-4000-8000-000000000504', 'Read-only input from the parent', TRUE,  1),
  ('02C00000-0000-4000-8000-000000001014', '02C00000-0000-4000-8000-000000000504', 'Mutable local state', FALSE, 2),
  ('02C00000-0000-4000-8000-000000001015', '02C00000-0000-4000-8000-000000000504', 'Global variables set by the router', FALSE, 3),
  ('02C00000-0000-4000-8000-000000001016', '02C00000-0000-4000-8000-000000000504', 'Direct references to the DOM', FALSE, 4),
  -- Q5 (505): children
  ('02C00000-0000-4000-8000-000000001017', '02C00000-0000-4000-8000-000000000505', 'To render content placed between the tags', TRUE,  1),
  ('02C00000-0000-4000-8000-000000001018', '02C00000-0000-4000-8000-000000000505', 'To rename a component tag', FALSE, 2),
  ('02C00000-0000-4000-8000-000000001019', '02C00000-0000-4000-8000-000000000505', 'To fetch data from an API', FALSE, 3),
  ('02C00000-0000-4000-8000-000000001020', '02C00000-0000-4000-8000-000000000505', 'To style the parent element', FALSE, 4),
  -- Q6 (506): props ownership
  ('02C00000-0000-4000-8000-000000001021', '02C00000-0000-4000-8000-000000000506', 'The parent owns the value', TRUE,  1),
  ('02C00000-0000-4000-8000-000000001022', '02C00000-0000-4000-8000-000000000506', 'Props are stored in localStorage', FALSE, 2),
  ('02C00000-0000-4000-8000-000000001023', '02C00000-0000-4000-8000-000000000506', 'Props only hold styling values', FALSE, 3),
  ('02C00000-0000-4000-8000-000000001024', '02C00000-0000-4000-8000-000000000506', 'Props sync automatically to the server', FALSE, 4),
  -- Q7 (507): useState return
  ('02C00000-0000-4000-8000-000000001025', '02C00000-0000-4000-8000-000000000507', 'The current value and a setter function', TRUE,  1),
  ('02C00000-0000-4000-8000-000000001026', '02C00000-0000-4000-8000-000000000507', 'Only the initial value', FALSE, 2),
  ('02C00000-0000-4000-8000-000000001027', '02C00000-0000-4000-8000-000000000507', 'A Promise that resolves to state', FALSE, 3),
  ('02C00000-0000-4000-8000-000000001028', '02C00000-0000-4000-8000-000000000507', 'A direct reference to the DOM node', FALSE, 4),
  -- Q8 (508): functional updates
  ('02C00000-0000-4000-8000-000000001029', '02C00000-0000-4000-8000-000000000508', 'It always reads the latest state', TRUE,  1),
  ('02C00000-0000-4000-8000-000000001030', '02C00000-0000-4000-8000-000000000508', 'It makes updates run more slowly', FALSE, 2),
  ('02C00000-0000-4000-8000-000000001031', '02C00000-0000-4000-8000-000000000508', 'It triggers a network request', FALSE, 3),
  ('02C00000-0000-4000-8000-000000001032', '02C00000-0000-4000-8000-000000000508', 'It duplicates the state object', FALSE, 4),
  -- Q9 (509): immutable update
  ('02C00000-0000-4000-8000-000000001033', '02C00000-0000-4000-8000-000000000509', 'setTask({ ...task, done: !task.done })', TRUE,  1),
  ('02C00000-0000-4000-8000-000000001034', '02C00000-0000-4000-8000-000000000509', 'setTask(task)', FALSE, 2),
  ('02C00000-0000-4000-8000-000000001035', '02C00000-0000-4000-8000-000000000509', 'setTask(task.id)', FALSE, 3),
  ('02C00000-0000-4000-8000-000000001036', '02C00000-0000-4000-8000-000000000509', 'setTask(null)', FALSE, 4),
  -- Q10 (510): event reference
  ('02C00000-0000-4000-8000-000000001037', '02C00000-0000-4000-8000-000000000510', 'A call runs during render; a reference runs on click', TRUE,  1),
  ('02C00000-0000-4000-8000-000000001038', '02C00000-0000-4000-8000-000000000510', 'Both behave identically', FALSE, 2),
  ('02C00000-0000-4000-8000-000000001039', '02C00000-0000-4000-8000-000000000510', 'References are only for performance', FALSE, 3),
  ('02C00000-0000-4000-8000-000000001040', '02C00000-0000-4000-8000-000000000510', 'Calls are how event types are declared', FALSE, 4),
  -- Q11 (511): preventDefault
  ('02C00000-0000-4000-8000-000000001041', '02C00000-0000-4000-8000-000000000511', 'To stop the page reload', TRUE,  1),
  ('02C00000-0000-4000-8000-000000001042', '02C00000-0000-4000-8000-000000000511', 'To prevent state updates', FALSE, 2),
  ('02C00000-0000-4000-8000-000000001043', '02C00000-0000-4000-8000-000000000511', 'To disable the submit button', FALSE, 3),
  ('02C00000-0000-4000-8000-000000001044', '02C00000-0000-4000-8000-000000000511', 'To stop the input from focusing', FALSE, 4),
  -- Q12 (512): controlled input
  ('02C00000-0000-4000-8000-000000001045', '02C00000-0000-4000-8000-000000000512', 'Its value is bound to state via value and onChange', TRUE,  1),
  ('02C00000-0000-4000-8000-000000001046', '02C00000-0000-4000-8000-000000000512', 'It uses the defaultChecked attribute', FALSE, 2),
  ('02C00000-0000-4000-8000-000000001047', '02C00000-0000-4000-8000-000000000512', 'It has a disabled attribute', FALSE, 3),
  ('02C00000-0000-4000-8000-000000001048', '02C00000-0000-4000-8000-000000000512', 'It has a name attribute', FALSE, 4),
  -- Q13 (513): rendering lists
  ('02C00000-0000-4000-8000-000000001049', '02C00000-0000-4000-8000-000000000513', 'tasks.map(...)', TRUE,  1),
  ('02C00000-0000-4000-8000-000000001050', '02C00000-0000-4000-8000-000000000513', 'tasks.forEach(...)', FALSE, 2),
  ('02C00000-0000-4000-8000-000000001051', '02C00000-0000-4000-8000-000000000513', 'tasks.join(...)', FALSE, 3),
  ('02C00000-0000-4000-8000-000000001052', '02C00000-0000-4000-8000-000000000513', 'Object.keys(tasks)', FALSE, 4),
  -- Q14 (514): index keys
  ('02C00000-0000-4000-8000-000000001053', '02C00000-0000-4000-8000-000000000514', 'Indexes shift when the list reorders', TRUE,  1),
  ('02C00000-0000-4000-8000-000000001054', '02C00000-0000-4000-8000-000000000514', 'Indexes are never unique', FALSE, 2),
  ('02C00000-0000-4000-8000-000000001055', '02C00000-0000-4000-8000-000000000514', 'Indexes are faster to render', FALSE, 3),
  ('02C00000-0000-4000-8000-000000001056', '02C00000-0000-4000-8000-000000000514', 'Indexes are the only allowed keys', FALSE, 4),
  -- Q15 (515): key placement
  ('02C00000-0000-4000-8000-000000001057', '02C00000-0000-4000-8000-000000000515', 'On the outermost element inside the loop', TRUE,  1),
  ('02C00000-0000-4000-8000-000000001058', '02C00000-0000-4000-8000-000000000515', 'On every child element', FALSE, 2),
  ('02C00000-0000-4000-8000-000000001059', '02C00000-0000-4000-8000-000000000515', 'On the parent ul element', FALSE, 3),
  ('02C00000-0000-4000-8000-000000001060', '02C00000-0000-4000-8000-000000000515', 'On the component function itself', FALSE, 4),
  -- Q16 (516): && truth trap
  ('02C00000-0000-4000-8000-000000001061', '02C00000-0000-4000-8000-000000000516', '0 is falsy yet still rendered', TRUE,  1),
  ('02C00000-0000-4000-8000-000000001062', '02C00000-0000-4000-8000-000000000516', '0 is converted to undefined', FALSE, 2),
  ('02C00000-0000-4000-8000-000000001063', '02C00000-0000-4000-8000-000000000516', 'The Badge component renders the zero', FALSE, 3),
  ('02C00000-0000-4000-8000-000000001064', '02C00000-0000-4000-8000-000000000516', '&& is not supported inside JSX', FALSE, 4),
  -- Q17 (517): early returns
  ('02C00000-0000-4000-8000-000000001065', '02C00000-0000-4000-8000-000000000517', 'It keeps the happy path flat', TRUE,  1),
  ('02C00000-0000-4000-8000-000000001066', '02C00000-0000-4000-8000-000000000517', 'It always skips the parent render', FALSE, 2),
  ('02C00000-0000-4000-8000-000000001067', '02C00000-0000-4000-8000-000000000517', 'It is the only way to render two components', FALSE, 3),
  ('02C00000-0000-4000-8000-000000001068', '02C00000-0000-4000-8000-000000000517', 'It replaces useEffect', FALSE, 4),
  -- Q18 (518): conditional classes
  ('02C00000-0000-4000-8000-000000001069', '02C00000-0000-4000-8000-000000000518', 'Build an array and join with a space', TRUE,  1),
  ('02C00000-0000-4000-8000-000000001070', '02C00000-0000-4000-8000-000000000518', 'Pass multiple style props', FALSE, 2),
  ('02C00000-0000-4000-8000-000000001071', '02C00000-0000-4000-8000-000000000518', 'Overwrite the stylesheet per render', FALSE, 3),
  ('02C00000-0000-4000-8000-000000001072', '02C00000-0000-4000-8000-000000000518', 'Write inline scripts in the JSX', FALSE, 4),
  -- Q19 (519): empty deps
  ('02C00000-0000-4000-8000-000000001073', '02C00000-0000-4000-8000-000000000519', 'Once, after the first render', TRUE,  1),
  ('02C00000-0000-4000-8000-000000001074', '02C00000-0000-4000-8000-000000000519', 'After every render', FALSE, 2),
  ('02C00000-0000-4000-8000-000000001075', '02C00000-0000-4000-8000-000000000519', 'Only on unmount', FALSE, 3),
  ('02C00000-0000-4000-8000-000000001076', '02C00000-0000-4000-8000-000000000519', 'Only when props change', FALSE, 4),
  -- Q20 (520): where fetches live
  ('02C00000-0000-4000-8000-000000001077', '02C00000-0000-4000-8000-000000000520', 'In effects and event handlers', TRUE,  1),
  ('02C00000-0000-4000-8000-000000001078', '02C00000-0000-4000-8000-000000000520', 'In the render body', FALSE, 2),
  ('02C00000-0000-4000-8000-000000001079', '02C00000-0000-4000-8000-000000000520', 'Inside the JSX markup', FALSE, 3),
  ('02C00000-0000-4000-8000-000000001080', '02C00000-0000-4000-8000-000000000520', 'Inside the CSS file', FALSE, 4),
  -- Q21 (521): cleanup purpose
  ('02C00000-0000-4000-8000-000000001081', '02C00000-0000-4000-8000-000000000521', 'Releases subscriptions and timers', TRUE,  1),
  ('02C00000-0000-4000-8000-000000001082', '02C00000-0000-4000-8000-000000000521', 'Resets all state to its defaults', FALSE, 2),
  ('02C00000-0000-4000-8000-000000001083', '02C00000-0000-4000-8000-000000000521', 'Commits a new render', FALSE, 3),
  ('02C00000-0000-4000-8000-000000001084', '02C00000-0000-4000-8000-000000000521', 'Deletes the fetched data', FALSE, 4),
  -- Q22 (522): when to use context
  ('02C00000-0000-4000-8000-000000001085', '02C00000-0000-4000-8000-000000000522', 'A value needed by many descendants', TRUE,  1),
  ('02C00000-0000-4000-8000-000000001086', '02C00000-0000-4000-8000-000000000522', 'Minor state used by a single component', FALSE, 2),
  ('02C00000-0000-4000-8000-000000001087', '02C00000-0000-4000-8000-000000000522', 'Values that change on every keystroke', FALSE, 3),
  ('02C00000-0000-4000-8000-000000001088', '02C00000-0000-4000-8000-000000000522', 'One-time network responses', FALSE, 4),
  -- Q23 (523): rules of hooks
  ('02C00000-0000-4000-8000-000000001089', '02C00000-0000-4000-8000-000000000523', 'React pairs each hook with state by call order', TRUE,  1),
  ('02C00000-0000-4000-8000-000000001090', '02C00000-0000-4000-8000-000000000523', 'To produce smaller bundles', FALSE, 2),
  ('02C00000-0000-4000-8000-000000001091', '02C00000-0000-4000-8000-000000000523', 'Because the import order must be stable', FALSE, 3),
  ('02C00000-0000-4000-8000-000000001092', '02C00000-0000-4000-8000-000000000523', 'To avoid network calls during tests', FALSE, 4),
  -- Q24 (524): custom hook
  ('02C00000-0000-4000-8000-000000001093', '02C00000-0000-4000-8000-000000000524', 'It starts with use and calls other hooks', TRUE,  1),
  ('02C00000-0000-4000-8000-000000001094', '02C00000-0000-4000-8000-000000000524', 'It is saved in a .css file', FALSE, 2),
  ('02C00000-0000-4000-8000-000000001095', '02C00000-0000-4000-8000-000000000524', 'It returns only string values', FALSE, 3),
  ('02C00000-0000-4000-8000-000000001096', '02C00000-0000-4000-8000-000000000524', 'It must be declared as async', FALSE, 4),
  -- Q25 (525): thinking in react
  ('02C00000-0000-4000-8000-000000001097', '02C00000-0000-4000-8000-000000000525', 'Build a static version first', TRUE,  1),
  ('02C00000-0000-4000-8000-000000001098', '02C00000-0000-4000-8000-000000000525', 'Connect the database first', FALSE, 2),
  ('02C00000-0000-4000-8000-000000001099', '02C00000-0000-4000-8000-000000000525', 'Add every useState at once', FALSE, 3),
  ('02C00000-0000-4000-8000-000000001100', '02C00000-0000-4000-8000-000000000525', 'Write the CSS before the JSX', FALSE, 4),
  -- Q26 (526): what is not state
  ('02C00000-0000-4000-8000-000000001101', '02C00000-0000-4000-8000-000000000526', 'A value derived from existing state', TRUE,  1),
  ('02C00000-0000-4000-8000-000000001102', '02C00000-0000-4000-8000-000000000526', 'The tasks array itself', FALSE, 2),
  ('02C00000-0000-4000-8000-000000001103', '02C00000-0000-4000-8000-000000000526', 'The open text draft', FALSE, 3),
  ('02C00000-0000-4000-8000-000000001104', '02C00000-0000-4000-8000-000000000526', 'The selected filter tab', FALSE, 4),
  -- Q27 (527): functional updates in practice
  ('02C00000-0000-4000-8000-000000001105', '02C00000-0000-4000-8000-000000000527', 'It reads the latest state inside batches', TRUE,  1),
  ('02C00000-0000-4000-8000-000000001106', '02C00000-0000-4000-8000-000000000527', 'It writes directly to the DOM', FALSE, 2),
  ('02C00000-0000-4000-8000-000000001107', '02C00000-0000-4000-8000-000000000527', 'It is required for all strings', FALSE, 3),
  ('02C00000-0000-4000-8000-000000001108', '02C00000-0000-4000-8000-000000000527', 'It disables re-rendering', FALSE, 4),
  -- Q28 (528): lifting state
  ('02C00000-0000-4000-8000-000000001109', '02C00000-0000-4000-8000-000000000528', 'In the closest common ancestor', TRUE,  1),
  ('02C00000-0000-4000-8000-000000001110', '02C00000-0000-4000-8000-000000000528', 'In each sibling separately', FALSE, 2),
  ('02C00000-0000-4000-8000-000000001111', '02C00000-0000-4000-8000-000000000528', 'In a global CSS variable', FALSE, 3),
  ('02C00000-0000-4000-8000-000000001112', '02C00000-0000-4000-8000-000000000528', 'Inside the submit button', FALSE, 4),
  -- Q29 (529): interval cleanup
  ('02C00000-0000-4000-8000-000000001113', '02C00000-0000-4000-8000-000000000529', 'A returned cleanup that clears the interval', TRUE,  1),
  ('02C00000-0000-4000-8000-000000001114', '02C00000-0000-4000-8000-000000000529', 'An interval created inside the cleanup', FALSE, 2),
  ('02C00000-0000-4000-8000-000000001115', '02C00000-0000-4000-8000-000000000529', 'No cleanup is required', FALSE, 3),
  ('02C00000-0000-4000-8000-000000001116', '02C00000-0000-4000-8000-000000000529', 'localStorage.removeItem in the effect', FALSE, 4)
ON CONFLICT (id) DO NOTHING;
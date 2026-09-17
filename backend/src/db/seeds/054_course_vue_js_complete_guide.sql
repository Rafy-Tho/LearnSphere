-- ============================================================================
-- SEED 054: Complete course — "Vue.js: The Complete Guide"
-- ----------------------------------------------------------------------------
-- Instructor : Sarah Chen        (10000000-0000-4000-8000-000000000001)
-- Category   : Web Development   (20000000-0000-4000-8000-000000000001)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Vue Fundamentals        → C1 Getting Started · C2 Templates & Directives
--   M2 Core Reactivity         → C3 Computed Properties & Watchers · C4 Components & Props
--   M3 Component Interaction   → C5 Events & Slots · C6 Composition API & Lifecycle
--   M4 State, Routing, Tooling → C7 Vue Router & Pinia · C8 Vite & Single-File Components
--   M5 Capstone: Task Manager  → C9 Project Setup · C10 Building & Polishing
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
  '03600000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000001',
  '20000000-0000-4000-8000-000000000001',
  'Vue.js: The Complete Guide',
  'vue-js-complete-guide',
  'Learn Vue.js from first principles to a shippable app: the reactivity model, directives, components and props, the Composition API, lifecycle hooks, Vue Router, and Pinia state — then build a complete task manager.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  52
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('03600000-0000-4000-8000-000000000011', '03600000-0000-4000-8000-000000000001', 'Build reactive interfaces with the Vue instance, templates, and directives.',  1),
  ('03600000-0000-4000-8000-000000000012', '03600000-0000-4000-8000-000000000001', 'Master computed properties, watchers, and reusable components with props and events.', 2),
  ('03600000-0000-4000-8000-000000000013', '03600000-0000-4000-8000-000000000001', 'Write organized apps with the Composition API, lifecycle hooks, and slots.',   3),
  ('03600000-0000-4000-8000-000000000014', '03600000-0000-4000-8000-000000000001', 'Add client-side routing with Vue Router and global state with Pinia.',         4),
  ('03600000-0000-4000-8000-000000000015', '03600000-0000-4000-8000-000000000001', 'Ship a polished task manager capstone built with Vite single-file components.',  5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('03600000-0000-4000-8000-000000000101', '03600000-0000-4000-8000-000000000001', 1, 'Vue Fundamentals',          'Understand the Vue philosophy and render your first reactive templates.',  'PUBLISHED'),
  ('03600000-0000-4000-8000-000000000102', '03600000-0000-4000-8000-000000000001', 2, 'Core Reactivity',           'Model derived state with computed values and build reusable components.',  'PUBLISHED'),
  ('03600000-0000-4000-8000-000000000103', '03600000-0000-4000-8000-000000000001', 3, 'Component Interaction',     'Make components talk through events and slots, using the Composition API.','PUBLISHED'),
  ('03600000-0000-4000-8000-000000000104', '03600000-0000-4000-8000-000000000001', 4, 'State, Routing & Tooling',  'Add navigation, global state, and modern build tooling to your apps.',     'PUBLISHED'),
  ('03600000-0000-4000-8000-000000000105', '03600000-0000-4000-8000-000000000001', 5, 'Capstone: Task Manager',    'Plan, build, and polish a complete task manager application.',             'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('03600000-0000-4000-8000-000000000201', '03600000-0000-4000-8000-000000000101', 1, 'Getting Started',         'The Vue philosophy and your first app instance.',        'PUBLISHED'),
  ('03600000-0000-4000-8000-000000000202', '03600000-0000-4000-8000-000000000101', 2, 'Templates & Directives',  'Render data and respond to state with directives.',      'PUBLISHED'),
  ('03600000-0000-4000-8000-000000000203', '03600000-0000-4000-8000-000000000102', 1, 'Computed & Watchers',     'Derive and react to state efficiently.',                  'PUBLISHED'),
  ('03600000-0000-4000-8000-000000000204', '03600000-0000-4000-8000-000000000102', 2, 'Components & Props',      'Compose UI from isolated, reusable components.',          'PUBLISHED'),
  ('03600000-0000-4000-8000-000000000205', '03600000-0000-4000-8000-000000000103', 1, 'Events & Slots',          'Pass data up and project content down with slots.',       'PUBLISHED'),
  ('03600000-0000-4000-8000-000000000206', '03600000-0000-4000-8000-000000000103', 2, 'Composition & Lifecycle', 'Organize logic with the Composition API and lifecycle hooks.','PUBLISHED'),
  ('03600000-0000-4000-8000-000000000207', '03600000-0000-4000-8000-000000000104', 1, 'Router & Pinia',          'Add navigation and share state across the app.',          'PUBLISHED'),
  ('03600000-0000-4000-8000-000000000208', '03600000-0000-4000-8000-000000000104', 2, 'Vite & Single-File Components','Compile, develop, and ship with modern tooling.',      'PUBLISHED'),
  ('03600000-0000-4000-8000-000000000209', '03600000-0000-4000-8000-000000000105', 1, 'Project Setup',           'Scaffold and plan the capstone task manager.',            'PUBLISHED'),
  ('03600000-0000-4000-8000-000000000210', '03600000-0000-4000-8000-000000000105', 2, 'Building & Polishing',    'Assemble the UI, persist state, and polish the app.',     'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 03600000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('03600000-0000-4000-8000-000000000301', '03600000-0000-4000-8000-000000000201', 1, 'Why Vue?',                      'Understand the Vue philosophy and the problems frameworks solve.',          'TEXT',  'PUBLISHED', 'FREE', 10,  6),
  ('03600000-0000-4000-8000-000000000302', '03600000-0000-4000-8000-000000000201', 2, 'Instances & Templates',         'Create a Vue app instance and render reactive data in templates.',          'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03600000-0000-4000-8000-000000000303', '03600000-0000-4000-8000-000000000201', 3, 'Vue Fundamentals Quiz',         'Check your understanding of Vue fundamentals.',                             'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03600000-0000-4000-8000-000000000304', '03600000-0000-4000-8000-000000000202', 1, 'Directives I: v-bind & Conditionals','Bind attributes and show or hide content with v-if and v-show.',        'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03600000-0000-4000-8000-000000000305', '03600000-0000-4000-8000-000000000202', 2, 'Directives II: Lists & Forms',  'Render lists with v-for and bind form fields with v-model.',               'TEXT',  'PUBLISHED', 'FREE', 10, 11),
  ('03600000-0000-4000-8000-000000000306', '03600000-0000-4000-8000-000000000202', 3, 'Directives Quiz',                'Test your directive knowledge.',                                            'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03600000-0000-4000-8000-000000000307', '03600000-0000-4000-8000-000000000203', 1, 'Computed Properties',           'Derive and cache values that respond to reactive state.',                   'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03600000-0000-4000-8000-000000000308', '03600000-0000-4000-8000-000000000203', 2, 'Methods & Watchers',            'Handle events, run methods, and react to state changes with watch.',       'TEXT',  'PUBLISHED', 'FREE', 10, 11),
  ('03600000-0000-4000-8000-000000000309', '03600000-0000-4000-8000-000000000203', 3, 'Computed & Watchers Quiz',      'Verify your grasp of computed properties and watchers.',                    'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03600000-0000-4000-8000-000000000310', '03600000-0000-4000-8000-000000000204', 1, 'Components & Props',            'Compose UIs from isolated components that receive data via props.',         'TEXT',  'PUBLISHED', 'FREE', 10, 11),
  ('03600000-0000-4000-8000-000000000311', '03600000-0000-4000-8000-000000000204', 2, 'Component Events',              'Send data from children to parents with custom events.',                    'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03600000-0000-4000-8000-000000000312', '03600000-0000-4000-8000-000000000204', 3, 'Components & Events Quiz',      'Test your components and events knowledge.',                                'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03600000-0000-4000-8000-000000000313', '03600000-0000-4000-8000-000000000205', 1, 'Slots',                          'Project parent content into components through slot outlets.',             'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03600000-0000-4000-8000-000000000314', '03600000-0000-4000-8000-000000000205', 2, 'Composition API: ref & reactive','Organize logic with the Composition API, ref, and reactive.',             'TEXT',  'PUBLISHED', 'FREE', 10, 11),
  ('03600000-0000-4000-8000-000000000315', '03600000-0000-4000-8000-000000000205', 3, 'Events, Slots & Composition Quiz','Check your events, slots, and Composition API knowledge.',                'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03600000-0000-4000-8000-000000000316', '03600000-0000-4000-8000-000000000206', 1, 'Lifecycle Hooks',               'Hook into component creation, updates, and unmounting.',                    'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('03600000-0000-4000-8000-000000000317', '03600000-0000-4000-8000-000000000206', 2, 'Reactivity in Depth',           'Understand the reactivity engine behind ref and reactive.',                 'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03600000-0000-4000-8000-000000000318', '03600000-0000-4000-8000-000000000206', 3, 'Lifecycle & Reactivity Quiz',   'Test your lifecycle and reactivity knowledge.',                             'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03600000-0000-4000-8000-000000000319', '03600000-0000-4000-8000-000000000207', 1, 'Vue Router',                    'Add multi-view navigation with routes, params, and guards.',                'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03600000-0000-4000-8000-000000000320', '03600000-0000-4000-8000-000000000207', 2, 'Pinia: State Management',       'Share global state through Pinia stores, getters, and actions.',            'TEXT',  'PUBLISHED', 'FREE', 10, 11),
  ('03600000-0000-4000-8000-000000000321', '03600000-0000-4000-8000-000000000207', 3, 'Router & Pinia Quiz',           'Verify your router and Pinia knowledge.',                                   'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03600000-0000-4000-8000-000000000322', '03600000-0000-4000-8000-000000000208', 1, 'Vite & Single-File Components', 'Scaffold, develop, and build projects with Vite tooling.',                  'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03600000-0000-4000-8000-000000000323', '03600000-0000-4000-8000-000000000208', 2, 'SFC Structure & Scoped Styles','Structure single-file component blocks and keep styles scoped.',           'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03600000-0000-4000-8000-000000000324', '03600000-0000-4000-8000-000000000208', 3, 'Tooling & SFC Quiz',            'Test your tooling and single-file component knowledge.',                    'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03600000-0000-4000-8000-000000000325', '03600000-0000-4000-8000-000000000209', 1, 'Capstone: Project Setup',       'Plan and scaffold the capstone task manager application.',                  'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03600000-0000-4000-8000-000000000326', '03600000-0000-4000-8000-000000000210', 1, 'Building the Task Manager UI', 'Build the task manager components, forms, and filters.',                    'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03600000-0000-4000-8000-000000000327', '03600000-0000-4000-8000-000000000210', 2, 'State Persistence & Polish',   'Persist state, handle loading, and polish the user experience.',            'TEXT',  'PUBLISHED', 'FREE', 10, 11),
  ('03600000-0000-4000-8000-000000000328', '03600000-0000-4000-8000-000000000210', 3, 'Final Assessment',             'Prove what you learned across the whole course.',                           'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 03600000-…-0401 .. 0427)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '03600000-0000-4000-8000-000000000401',
  '03600000-0000-4000-8000-000000000301',
  1,
  'Why Vue?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Why Vue?</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #42b883; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #d1fae5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Why Vue?</h1>
  <p>Vue.js is a <strong>progressive JavaScript framework</strong> for building user interfaces. &ldquo;Progressive&rdquo; means you can adopt it in small steps &mdash; one view on one page today, a full toolchain app tomorrow &mdash; without rewriting what you already have.</p>
  <p>Its defining idea is <strong>reactivity</strong>: you describe what the interface should look like, and Vue keeps it in sync with your data. Instead of hunting for elements and patching them by hand, you declare relationships and let the framework handle updates.</p>
  <h2>Imperative vs declarative</h2>
  <p>Plain JavaScript is imperative &mdash; you list every step. Vue is declarative &mdash; you describe the result.</p>
  <pre class="code-block">// Imperative — every change is orchestrated by hand
const span = document.getElementById('message');
span.textContent = appData.message;

// Declarative — the template describes the result
// &lt;span&gt;{{ app.message }}&lt;/span&gt;</pre>
  <p>Whenever <span class="ic">app.message</span> changes, the span updates automatically. No manual DOM surgery.</p>
  <h2>What Vue gives you</h2>
  <table>
    <tr><th>Feature</th><th>What it does</th></tr>
    <tr><td>Reactivity</td><td>UI updates automatically when state changes</td></tr>
    <tr><td>Components</td><td>Isolated, reusable units of markup and behavior</td></tr>
    <tr><td>Directives</td><td>Declarative control over rendering and binding</td></tr>
    <tr><td>Router &amp; Pinia</td><td>Official routing and state solutions</td></tr>
  </table>
  <h2>A progressive framework</h2>
  <ul>
    <li>Add Vue from a CDN to sprinkle reactivity into existing pages.</li>
    <li>Use the full Vite toolchain for large applications.</li>
    <li>Optionally add TypeScript and single-file component usage.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Prerequisites</strong>
    <p>You should already know HTML, CSS, and the basics of JavaScript. Vue itself, routing, and state are taught here from zero.</p>
  </div>
  <div class="callout callout-tip">
    <strong>What you will build</strong>
    <p>Throughout the course you will build a complete <strong>task manager</strong> &mdash; components, routing, a global store, and persistence &mdash; proving every concept in a real app.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03600000-0000-4000-8000-000000000402',
  '03600000-0000-4000-8000-000000000302',
  1,
  'Instances & Templates',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Instances & Templates</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #42b883; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #d1fae5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Instances &amp; Templates</h1>
  <p>Every Vue application starts with an <strong>instance</strong>: an object created by <span class="ic">createApp</span> that owns the reactive state and renders your template.</p>
  <pre class="code-block">import { createApp } from 'vue';

createApp({
  data() {
    return { message: 'Hello Vue!' };
  }
}).mount('#app');</pre>
  <p><span class="ic">app.mount('#app')</span> attaches the instance to the <span class="ic">&lt;div id="app"&gt;</span> element (or SVG container) in your HTML and takes over rendering inside it.</p>
  <div class="callout">
    <strong>data must be a function</strong>
    <p><span class="ic">data()</span> returns a fresh object per instance. If it were a plain object, every created instance would share the same state &mdash; a classic source of bugs.</p>
  </div>
  <h2>Interpolation with moustaches</h2>
  <p>Inside the instance template, double curly braces render any JavaScript expression:</p>
  <pre class="code-block">&lt;div id="app"&gt;
  &lt;h1&gt;{{ message }}&lt;/h1&gt;
  &lt;p&gt;{{ message.toUpperCase() }}&lt;/p&gt;
  &lt;p&gt;{{ tasks.length }} tasks remaining&lt;/p&gt;
&lt;/div&gt;</pre>
  <p>Expressions run in the component scope, so <span class="ic">message</span> and <span class="ic">tasks</span> resolve against your data. Every access creates a reactive dependency.</p>
  <h2>A first look at directives</h2>
  <p>Directives are template attributes starting with <span class="ic">v-</span>. They bind behavior to markup &mdash; you will use them constantly:</p>
  <pre class="code-block">&lt;p v-if="tasks.length === 0"&gt;No tasks yet.&lt;/p&gt;
&lt;a v-bind:href="docsUrl"&gt;Documentation&lt;/a&gt;</pre>
  <h2>Rendering raw HTML safely</h2>
  <p>Moustaches escape HTML, so injected markup is rendered as plain text &mdash; a built-in defense against cross-site scripting. <span class="ic">v-html</span> bypasses that, so only ever use it with trusted content.</p>
  <div class="callout callout-tip">
    <strong>Inspect with Vue Devtools</strong>
    <p>The official browser extension adds a &ldquo;Vue&rdquo; panel. There you can edit reactive state live and inspect the component tree &mdash; invaluable while learning.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03600000-0000-4000-8000-000000000404',
  '03600000-0000-4000-8000-000000000304',
  1,
  'Directives I: v-bind & Conditionals',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Directives I: v-bind & Conditionals</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #42b883; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #d1fae5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Directives I: v-bind &amp; Conditionals</h1>
  <p>Directives teach the template new behaviors. The first one to learn is <span class="ic">v-bind</span> &mdash; it synchronizes an HTML attribute with a reactive value.</p>
  <pre class="code-block">// Full form
&lt;img v-bind:src="user.avatar" v-bind:alt="user.name"&gt;

// Shorthand — the colon is the shorthand for v-bind
&lt;img :src="user.avatar" :alt="user.name"&gt;
&lt;a :href="docsUrl" :target="openInNewTab ? '_blank' : '_self'"&gt;Docs&lt;/a&gt;</pre>
  <p>The right side is a JavaScript expression evaluated in the component scope, so ternaries and method calls work inline.</p>
  <h2>Binding classes and styles</h2>
  <p>Classes accept an object keyed by class name; the boolean value decides inclusion:</p>
  <pre class="code-block">&lt;li :class="{ completed: task.done, urgent: task.priority === 'high' }"&gt;
  {{ task.title }}
&lt;/li&gt;

// Array syntax lets you merge dynamic classes
&lt;div :class="['task', { 'is-overdue': isOverdue }]"&gt;&lt;/div&gt;</pre>
  <h2>Conditional rendering: v-if</h2>
  <p><span class="ic">v-if</span> and its siblings <span class="ic">v-else-if</span> / <span class="ic">v-else</span> add or remove whole elements from the DOM:</p>
  <pre class="code-block">&lt;p v-if="tasks.length === 0"&gt;You have no tasks.&lt;/p&gt;
&lt;p v-else-if="tasks.length === 1"&gt;One task left to do.&lt;/p&gt;
&lt;p v-else&gt;{{ tasks.length }} tasks left.&lt;/p&gt;</pre>
  <h2>v-show vs v-if</h2>
  <p><span class="ic">v-show</span> always renders the element but toggles CSS <span class="ic">display</span>. Pick based on how the element is used:</p>
  <table>
    <tr><th>Directive</th><th>DOM</th><th>Best for</th></tr>
    <tr><td>v-if</td><td>destroyed / recreated</td><td>rarely toggled, expensive content</td></tr>
    <tr><td>v-show</td><td>kept, display toggled</td><td>very frequent toggling</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Readability first</strong>
    <p>Keep conditional expressions short. If a condition grows past two or three terms, move it into a <span class="ic">computed</span> property &mdash; you will learn those next.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03600000-0000-4000-8000-000000000405',
  '03600000-0000-4000-8000-000000000305',
  1,
  'Directives II: Lists & Forms',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Directives II: Lists & Forms</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #42b883; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #d1fae5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Directives II: Lists &amp; Forms</h1>
  <p>Two directives power almost every interactive page: <span class="ic">v-for</span> renders collections, and <span class="ic">v-model</span> binds form controls to state.</p>
  <h2>Rendering lists with v-for</h2>
  <pre class="code-block">&lt;ul&gt;
  &lt;li v-for="task in tasks" :key="task.id"&gt;
    {{ task.title }}
  &lt;/li&gt;
&lt;/ul&gt;

// Need the index? Destructure it as a second binding
&lt;li v-for="(task, index) in tasks" :key="task.id"&gt;{{ index }}: {{ task.title }}&lt;/li&gt;</pre>
  <p><span class="ic">v-for</span> also iterates objects and fixed counts, though arrays are the common case.</p>
  <div class="callout">
    <strong>Always set :key</strong>
    <p>The key gives each row a stable identity so Vue can update a single item instead of re-rendering the whole list. Use a unique id &mdash; the array index makes a poor key when items can be reordered or removed.</p>
  </div>
  <h2>Two-way binding with v-model</h2>
  <p><span class="ic">v-model</span> combines a value read and an input write. Typing updates <span class="ic">draft.title</span>; changing state updates the field:</p>
  <pre class="code-block">&lt;input v-model="draft.title" placeholder="Task title"&gt;
&lt;textarea v-model="draft.notes"&gt;&lt;/textarea&gt;
&lt;select v-model="draft.priority"&gt;
  &lt;option value="low"&gt;Low&lt;/option&gt;
  &lt;option value="high"&gt;High&lt;/option&gt;
&lt;/select&gt;
&lt;input type="checkbox" v-model="draft.done"&gt; Mark as done</pre>
  <p>Checkboxes bind to booleans, and checkboxes inside <span class="ic">v-for</span> collect values into an array automatically.</p>
  <h2>Modifiers</h2>
  <table>
    <tr><th>Modifier</th><th>Purpose</th></tr>
    <tr><td>.number</td><td>Parse input as a number</td></tr>
    <tr><td>.trim</td><td>Strip leading and trailing whitespace</td></tr>
    <tr><td>.lazy</td><td>Sync on change instead of every keystroke</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Prefer trim</strong>
    <p>Users paste stray spaces. <span class="ic">v-model.trim</span> on a title field prevents &ldquo;Buy milk &rdquo; from differing from &ldquo;Buy milk&rdquo; &mdash; a tiny fix that avoids a real class of bugs.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03600000-0000-4000-8000-000000000407',
  '03600000-0000-4000-8000-000000000307',
  1,
  'Computed Properties',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Computed Properties</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #42b883; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #d1fae5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Computed Properties</h1>
  <p>Some values you show are <em>derived</em> from other state: a filtered list, a total, a formatted label. A <strong>computed property</strong> declares that derivation and caches it.</p>
  <pre class="code-block">const app = Vue.createApp({
  data() {
    return {
      tasks: [
        { id: 1, title: 'Write report', done: false },
        { id: 2, title: 'Buy milk', done: true },
        { id: 3, title: 'Call mom', done: false }
      ]
    };
  },
  computed: {
    remaining() {
      return this.tasks.filter(t =&gt; !t.done).length;
    },
    progress() {
      return Math.round((this.tasks.filter(t =&gt; t.done).length / this.tasks.length) * 100);
    }
  }
});</pre>
  <p>In the template you use them like plain data: <span class="ic">{{ remaining }}</span>.</p>
  <h2>Why caching matters</h2>
  <p>A computed property runs its function once and caches the result. It only re-evaluates when a reactive dependency changes. Methods, by contrast, run on <em>every</em> render &mdash; wasteful for expensive filtering.</p>
  <table>
    <tr><th>Tool</th><th>Runs</th><th>Use for</th></tr>
    <tr><td>computed</td><td>when deps change, cached</td><td>derived values in the template</td></tr>
    <tr><td>method</td><td>every render</td><td>reusable logic with parameters</td></tr>
    <tr><td>watch</td><td>when a watched source changes</td><td>side effects, not rendering</td></tr>
  </table>
  <h2>Computed setters</h2>
  <p>Rarely, you want to write to a computed value. A setter lets a v-model write through a computed:</p>
  <pre class="code-block">computed: {
  fullName: {
    get() {
      return this.firstName + ' ' + this.lastName;
    },
    set(value) {
      const parts = value.split(' ');
      this.firstName = parts[0];
      this.lastName = parts.slice(1).join(' ');
    }
  }
}</pre>
  <div class="callout callout-tip">
    <strong>Keep computeds pure</strong>
    <p>No API calls, no DOM writes, no mutation of other state inside a computed getter. If you violate that, caching becomes a bug instead of a feature. Side effects belong in watchers (next lesson).</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03600000-0000-4000-8000-000000000408',
  '03600000-0000-4000-8000-000000000308',
  1,
  'Methods & Watchers',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Methods & Watchers</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #42b883; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #d1fae5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Methods &amp; Watchers</h1>
  <p><strong>Methods</strong> handle events; <strong>watchers</strong> run code in response to state changes. Together they cover the side effects that computed properties must not touch.</p>
  <h2>Handling events with methods</h2>
  <pre class="code-block">const app = Vue.createApp({
  data() { return { tasks: [], draft: '' }; },
  methods: {
    addTask() {
      if (!this.draft.trim()) return;
      this.tasks.push({ title: this.draft.trim(), done: false });
      this.draft = '';
    },
    toggleDone(task) {
      task.done = !task.done;
    }
  }
});</pre>
  <pre class="code-block">&lt;form @submit.prevent="addTask"&gt;
  &lt;input v-model="draft" placeholder="New task"&gt;
  &lt;button&gt;Add&lt;/button&gt;
&lt;/form&gt;
&lt;button @click="toggleDone(task)"&gt;Toggle&lt;/button&gt;</pre>
  <p><span class="ic">@</span> is the shorthand for <span class="ic">v-on</span>. Modifiers keep handlers clean:</p>
  <table>
    <tr><th>Modifier</th><th>Effect</th></tr>
    <tr><td>.prevent</td><td>calls event.preventDefault()</td></tr>
    <tr><td>.stop</td><td>calls event.stopPropagation()</td></tr>
    <tr><td>.once</td><td>fires the handler only once</td></tr>
    <tr><td>.self</td><td>only when the target is the element itself</td></tr>
  </table>
  <h2>Watchers</h2>
  <p>A watch observes a reactive source and runs a callback with the new and old values. Reach for it when a change must trigger a side effect:</p>
  <pre class="code-block">watch: {
  tabs(current, previous) {
    console.log('Switched from', previous, 'to', current);
    this.saveToStorage();
  },
  // Deep option — detect nested changes inside an object
  tasks: {
    handler() { this.saveToStorage(); },
    deep: true
  }
}</pre>
  <div class="callout callout-info">
    <strong>Decision rule</strong>
    <p>Deriving a value? Use <span class="ic">computed</span>. Responding to a change with an action (storage, API, logging)? Use <span class="ic">watch</span>. Handling an event? Use a <span class="ic">method</span>.</p>
  </div>
  <div class="callout callout-tip">
    <strong>immediate</strong>
    <p>Pass <span class="ic">{ immediate: true }</span> to run the watcher once right away &mdash; handy for seeding UI from an initial value.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03600000-0000-4000-8000-000000000410',
  '03600000-0000-4000-8000-000000000310',
  1,
  'Components & Props',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Components & Props</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #42b883; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #d1fae5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Components &amp; Props</h1>
  <p>A <strong>component</strong> is a reusable unit of template, logic, and style. Larger UIs are built by composing components like building blocks.</p>
  <h2>Anatomy of a single-file component</h2>
  <pre class="code-block">&lt;template&gt;
  &lt;li :class="{ done: task.done }"&gt;{{ task.title }}&lt;/li&gt;
&lt;/template&gt;

&lt;script&gt;
export default {
  props: ['task']
};
&lt;/script&gt;

&lt;style scoped&gt;
.done { text-decoration: line-through; }
&lt;/style&gt;</pre>
  <h2>Declaring props</h2>
  <p>Props are the interface a parent uses to hand data to a child. Declare them explicitly and pass values statically or dynamically:</p>
  <pre class="code-block">&lt;!-- parent --&gt;
&lt;TaskItem task="Buy milk" /&gt;
&lt;TaskItem :task="activeTask" /&gt;
&lt;TaskItem v-for="item in tasks" :key="item.id" :task="item" /&gt;</pre>
  <pre class="code-block">// child
props: {
  task: {
    type: Object,
    required: true
  },
  priority: {
    type: String,
    default: 'normal'
  }
}</pre>
  <h2>One-way data flow</h2>
  <p>Props flow <em>down</em>: a parent updates; children re-render. A child must never mutate a prop &mdash; to change values it asks the parent through events (next lesson).</p>
  <table>
    <tr><th>Validator</th><th>Ensures</th></tr>
    <tr><td>type</td><td>the prop is of the given type</td></tr>
    <tr><td>required</td><td>the prop is always passed</td></tr>
    <tr><td>default</td><td>a fallback when omitted</td></tr>
    <tr><td>validator</td><td>a custom function returns true/false</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Descriptive props</strong>
    <p>Use camelCase in script (<span class="ic">taskTitle</span>) and kebab-case in templates (<span class="ic">task-title</span>) &mdash; Vue maps between the two automatically in single-file components.</p>
  </div>
  <div class="callout callout-info">
    <strong>Keep components focused</strong>
    <p>If a component does more than one obvious job, split it. Small, single-purpose components compose better and are easier to test.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03600000-0000-4000-8000-000000000411',
  '03600000-0000-4000-8000-000000000311',
  1,
  'Component Events',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Component Events</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #42b883; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #d1fae5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Component Events</h1>
  <p>When a child needs its parent to change state, it announces an <strong>event</strong>. The parent listens and decides what to do &mdash; data flow stays one-way and predictable.</p>
  <h2>Declaring and emitting</h2>
  <pre class="code-block">// TaskItem.vue — the child
export default {
  props: ['task'],
  emits: ['toggle', 'remove'],
  methods: {
    onToggle() {
      this.$emit('toggle', this.task);       // payload = the task
    },
    onRemove() {
      this.$emit('remove', this.task.id);
    }
  }
};</pre>
  <pre class="code-block">&lt;!-- parent listens with @event --&gt;
&lt;TaskItem
  v-for="task in tasks"
  :key="task.id"
  :task="task"
  @toggle="toggleTask"
  @remove="removeTask"
/&gt;</pre>
  <p>Declaring events in <span class="ic">emits</span> documents the component interface and helps tooling validate usage.</p>
  <h2>v-model on a component</h2>
  <p><span class="ic">v-model</span> on a custom component is shorthand for a <span class="ic">modelValue</span> prop plus an <span class="ic">update:modelValue</span> event:</p>
  <pre class="code-block">&lt;!-- MyInput.vue --&gt;
props: ['modelValue'],
emits: ['update:modelValue'],
methods: {
  onInput(event) {
    this.$emit('update:modelValue', event.target.value);
  }
}</pre>
  <pre class="code-block">&lt;!-- used as --&gt;
&lt;MyInput v-model="draft.title" /&gt;

&lt;!-- which expands to --&gt;
&lt;MyInput :modelValue="draft.title" @update:modelValue="v =&gt; draft.title = v" /&gt;</pre>
  <h2>Event naming</h2>
  <table>
    <tr><th>Pattern</th><th>Example</th><th>Purpose</th></tr>
    <tr><td>action-noun</td><td>@remove, @toggle</td><td>simple state changes</td></tr>
    <tr><td>update:modelValue</td><td>@update:modelValue</td><td>v-model contract</td></tr>
    <tr><td>update:propName</td><td>@update:priority</td><td>editable sub-property</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Payloads keep parents in charge</strong>
    <p>Emit the minimal data the parent needs (an id, a task). The parent holds the logic, so the same child can be reused in different parents with different rules.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03600000-0000-4000-8000-000000000413',
  '03600000-0000-4000-8000-000000000313',
  1,
  'Slots',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Slots</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #42b883; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #d1fae5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Slots</h1>
  <p>Props pass <em>data</em> into a component; <strong>slots</strong> pass <em>markup</em>. A slot is an outlet inside a child where the parent injects its own content.</p>
  <h2>The default slot</h2>
  <pre class="code-block">&lt;!-- Card.vue --&gt;
&lt;div class="card"&gt;
  &lt;slot /&gt;
&lt;/div&gt;

&lt;!-- used as --&gt;
&lt;Card&gt;
  &lt;h3&gt;Buy milk&lt;/h3&gt;
  &lt;p&gt;Due tomorrow&lt;/p&gt;
&lt;/Card&gt;</pre>
  <p>Anything between the opening and closing tags renders inside the slot. A <span class="ic">&lt;slot&gt;</span> may carry <strong>fallback content</strong>, shown when the parent supplies nothing.</p>
  <h2>Named slots</h2>
  <p>Give layouts multiple outlets and fill them with the <span class="ic">#</span> template syntax:</p>
  <pre class="code-block">&lt;Card&gt;
  &lt;template #header&gt;
    &lt;h3&gt;{{ task.title }}&lt;/h3&gt;
  &lt;/template&gt;

  &lt;p&gt;Main body goes to the default slot.&lt;/p&gt;

  &lt;template #footer&gt;
    &lt;button @click="removeTask(task)"&gt;Remove&lt;/button&gt;
  &lt;/template&gt;
&lt;/Card&gt;</pre>
  <h2>Scoped slots</h2>
  <p>A scoped slot lets the child hand data back to the parent&rsquo;s content, so layout choices stay in the parent:</p>
  <pre class="code-block">&lt;!-- Dropdown.vue exposes its open state --&gt;
&lt;slot name="trigger" :isOpen="isOpen"&gt;&lt;/slot&gt;

&lt;!-- parent uses slot props --&gt;
&lt;template #trigger="slotProps"&gt;
  &lt;button&gt;{{ slotProps.isOpen ? 'Close' : 'Menu' }}&lt;/button&gt;
&lt;/template&gt;</pre>
  <table>
    <tr><th>Tool</th><th>Direction</th><th>Use for</th></tr>
    <tr><td>props</td><td>parent → child</td><td>data a component needs</td></tr>
    <tr><td>events</td><td>child → parent</td><td>notifying parents</td></tr>
    <tr><td>slots</td><td>parent → child markup</td><td>layout and wrappers</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Slots make components composable</strong>
    <p>Wrap a base component with slots (think modals, panels, list rows) and let consumers decide the inner markup &mdash; no prop explosion, no rewriting the child.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03600000-0000-4000-8000-000000000414',
  '03600000-0000-4000-8000-000000000314',
  1,
  'Composition API: ref & reactive',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Composition API: ref & reactive</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #42b883; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #d1fae5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Composition API: ref &amp; reactive</h1>
  <p>The Options API organizes code by role (<span class="ic">data</span>, <span class="ic">methods</span>, <span class="ic">computed</span>). The <strong>Composition API</strong> organizes by feature &mdash; logic that belongs together lives together, and <span class="ic">&lt;script setup&gt;</span> makes it concise.</p>
  <pre class="code-block">&lt;script setup&gt;
import { ref } from 'vue';

// ref wraps a primitive. Read and write via .value in script.
const count = ref(0);
function increment() {
  count.value++;
}
&lt;/script&gt;

&lt;template&gt;
  &lt;button @click="increment"&gt;Clicked {{ count }} times&lt;/button&gt;
&lt;/template&gt;</pre>
  <p>In the template the <span class="ic">.value</span> disappears &mdash; refs are auto-unwrapped while rendering.</p>
  <h2>reactive for objects</h2>
  <p>For an object of related fields, <span class="ic">reactive()</span> makes the whole structure reactive, and <span class="ic">toRefs()</span> turns its properties into refs for destructuring:</p>
  <pre class="code-block">const form = reactive({
  title: '',
  priority: 'normal',
  done: false
});

// track properties as refs in a watch — great for scalars
const { title, priority } = toRefs(form);</pre>
  <h2>Computed in Composition API</h2>
  <pre class="code-block">import { ref, computed } from 'vue';

const tasks = ref([]);
const remaining = computed(() =&gt; tasks.value.filter(t =&gt; !t.done).length);</pre>
  <table>
    <tr><th>Utility</th><th>Wraps</th><th>Access in script</th></tr>
    <tr><td>ref</td><td>any value</td><td>.value</td></tr>
    <tr><td>reactive</td><td>plain object</td><td>property directly</td></tr>
    <tr><td>computed</td><td>derived value</td><td>.value</td></tr>
  </table>
  <div class="callout">
    <strong>Never destructure reactive directly</strong>
    <p><span class="ic">const { title } = reactive({...})</span> extracts a plain value with no tracking link. Use <span class="ic">toRefs()</span> when you need standalone refs.</p>
  </div>
  <div class="callout callout-info">
    <strong>Composables</strong>
    <p>A composable is just a function using these utilities &mdash; extract <span class="ic">useTasks()</span>, import it anywhere, and share logic across components without mixins.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03600000-0000-4000-8000-000000000416',
  '03600000-0000-4000-8000-000000000316',
  1,
  'Lifecycle Hooks',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Lifecycle Hooks</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #42b883; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #d1fae5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Lifecycle Hooks</h1>
  <p>Every component passes through phases: <strong>creation</strong> &rarr; <strong>mounting</strong> &rarr; <strong>updating</strong> &rarr; <strong>unmounting</strong>. Lifecycle hooks let you run code at each stage.</p>
  <h2>The main phases</h2>
  <table>
    <tr><th>Hook</th><th>Runs when</th><th>Use for</th></tr>
    <tr><td>beforeCreate</td><td>setup begins</td><td>early setup (rare)</td></tr>
    <tr><td>created</td><td>state and methods ready</td><td>initializing state</td></tr>
    <tr><td>mounted</td><td>component inserted in the DOM</td><td>fetching data, DOM access</td></tr>
    <tr><td>updated</td><td>after a reactive re-render</td><td>per-change DOM work</td></tr>
    <tr><td>unmounted</td><td>component destroyed</td><td>cleanup: timers, listeners</td></tr>
  </table>
  <h2>In the Composition API</h2>
  <pre class="code-block">&lt;script setup&gt;
import { ref, onMounted, onUnmounted } from 'vue';

const tasks = ref([]);
let timer = null;

onMounted(async () =&gt; {
  // data that needs the DOM live here
  tasks.value = await loadTasks();
  timer = setInterval(refresh, 30000);
});

onUnmounted(() =&gt; {
  clearInterval(timer);   // always cancel what you started
});
&lt;/script&gt;</pre>
  <p>The mapping is direct: <span class="ic">onBeforeUnmount</span> &rarr; beforeUnmount, <span class="ic">onUpdated</span> &rarr; updated, and so on for every Options API hook.</p>
  <div class="callout callout-tip">
    <strong>Fetch in mounted, not in setup</strong>
    <p>Setup runs before the DOM exists. Put network calls and DOM give-me-the-height code in <span class="ic">onMounted</span> so the element is real.</p>
  </div>
  <div class="callout callout-info">
    <strong>Cleanup symmetry</strong>
    <p>Anything you set up &mdash; an interval, a window listener, a subscription &mdash; must be torn down in <span class="ic">onUnmounted</span>. Leaked listeners outlive the component and cause ghost bugs.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03600000-0000-4000-8000-000000000417',
  '03600000-0000-4000-8000-000000000317',
  1,
  'Reactivity in Depth',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reactivity in Depth</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #42b883; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #d1fae5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Reactivity in Depth</h1>
  <p>Vue&rsquo;s magic works by <strong>tracking dependencies</strong>. When a render reads a reactive property, it registers &ldquo;this render depends on that property&rdquo;. When the property is written, Vue re-runs the affects it.</p>
  <h2>How tracking works</h2>
  <p>Under the hood Vue wraps your object in a <strong>Proxy</strong>. Reads (get) collect the current effect; writes (set) notify it:</p>
  <pre class="code-block">import { reactive, effect } from 'vue';

const user = reactive({ name: 'Lia', city: 'Lisbon' });

effect(() =&gt; {
  // runs now, then again whenever name or city changes
  console.log(user.name, 'in', user.city);
});</pre>
  <p>The template render function is just an effect like this one tied to each component instance.</p>
  <h2>ref vs reactive</h2>
  <table>
    <tr><th>Utility</th><th>Behavior</th><th>Prefer when</th></tr>
    <tr><td>ref</td><td>wraps any value; .value access</td><td>primitives, interchangeable state</td></tr>
    <tr><td>reactive</td><td>Proxies a plain object deeply</td><td>a cohesive object of related fields</td></tr>
  </table>
  <h2>Performance escapes</h2>
  <p>Deep tracking can be wasteful for huge collections. <span class="ic">shallowRef</span> and <span class="ic">shallowReactive</span> track only the top level; replace the whole value to trigger updates. <span class="ic">markRaw</span> excludes objects &mdash; useful for heavy third-party instances:</p>
  <pre class="code-block">import { shallowRef, markRaw } from 'vue';

const chart = shallowRef(createChartInstance());  // skip deep proxy</pre>
  <h2>nextTick and the update queue</h2>
  <p>Writes are batched and applied before the next paint. After mutating state, read the fresh DOM inside <span class="ic">nextTick</span>:</p>
  <pre class="code-block">import { nextTick } from 'vue';

tasks.value.push(newTask);
await nextTick();
scrollToLastItem();</pre>
  <div class="callout callout-tip">
    <strong>Reactivity is automatic</strong>
    <p>You almost never call effects by hand &mdash; computed and watchers register themselves. Keep reads pure and the graph maintains itself.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03600000-0000-4000-8000-000000000419',
  '03600000-0000-4000-8000-000000000319',
  1,
  'Vue Router',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Vue Router</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #42b883; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #d1fae5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Vue Router</h1>
  <p>A single page can feel multi-page. <strong>Vue Router</strong> maps URLs to components, updates the history, and lets users use the back button &mdash; all without a page reload.</p>
  <h2>Setup</h2>
  <pre class="code-block">import { createRouter, createWebHistory } from 'vue-router';
import TaskList from './views/TaskList.vue';
import TaskDetail from './views/TaskDetail.vue';

const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: '/', redirect: '/tasks' },
    { path: '/tasks', component: TaskList },
    { path: '/tasks/:id', component: TaskDetail },
    { path: '/:pathMatch(.*)*', component: NotFound }
  ]
});

app.use(router);
app.mount('#app');</pre>
  <h2>Rendering views and links</h2>
  <pre class="code-block">&lt;!-- the outlet where the matched component renders --&gt;
&lt;RouterView /&gt;

&lt;!-- a real link, no full reload, active state handled for you --&gt;
&lt;RouterLink to="/tasks"&gt;Tasks&lt;/RouterLink&gt;
&lt;RouterLink :to="`/tasks/${task.id}`"&gt;Details&lt;/RouterLink&gt;</pre>
  <h2>Reading params and navigating</h2>
  <pre class="code-block">import { useRoute, useRouter } from 'vue-router';

// inside a routed component
const route = useRoute();
const router = useRouter();

const id = route.params.id;          // from /tasks/:id
const goHome = () =&gt; router.push('/tasks');
const goBack = () =&gt; router.back();</pre>
  <h2>Navigation guards</h2>
  <p>Guards run before a navigation settles &mdash; great for auth:</p>
  <pre class="code-block">router.beforeEach((to, from) =&gt; {
  if (to.path.startsWith('/admin') &amp;&amp; !isLoggedIn()) {
    return { path: '/login' };
  }
});</pre>
  <table>
    <tr><th>API</th><th>Purpose</th></tr>
    <tr><td>RouterView / RouterLink</td><td>outlet and links</td></tr>
    <tr><td>useRoute / useRouter</td><td>read URL, navigate</td></tr>
    <tr><td>beforeEach / afterEach</td><td>guard navigation</td></tr>
    <tr><td>:params, query</td><td>dynamic segments and query string</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Params change, component does not</strong>
    <p>Moving from <span class="ic">/tasks/1</span> to <span class="ic">/tasks/2</span> reuses the same component. Watch <span class="ic">route.params.id</span> (or use a keyed RouterView) or you will render stale data.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03600000-0000-4000-8000-000000000420',
  '03600000-0000-4000-8000-000000000320',
  1,
  'Pinia: State Management',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pinia: State Management</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #42b883; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #d1fae5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Pinia: State Management</h1>
  <p>Props and events are great for local data, but when many siblings and routes need the same state &mdash; say the task list &mdash; lift it into a <strong>store</strong>. Pinia is Vue&rsquo;s official store: reactive, typed, and debug-friendly.</p>
  <h2>Defining a store</h2>
  <pre class="code-block">// stores/tasks.js
import { defineStore } from 'pinia';

export const useTasksStore = defineStore('tasks', {
  state: () =&gt; ({
    items: [],
    filter: 'all'
  }),
  getters: {
    remaining(state) {
      return state.items.filter(t =&gt; !t.done).length;
    },
    visible(state) {
      if (state.filter === 'active') return state.items.filter(t =&gt; !t.done);
      if (state.filter === 'done') return state.items.filter(t =&gt; t.done);
      return state.items;
    }
  },
  actions: {
    add(title) {
      this.items.push({ id: crypto.randomUUID(), title, done: false });
    },
    toggle(id) {
      const task = this.items.find(t =&gt; t.id === id);
      if (task) task.done = !task.done;
    }
  }
});</pre>
  <h2>Using the store in components</h2>
  <pre class="code-block">import { useTasksStore } from './stores/tasks.js';
import { storeToRefs } from 'pinia';

const store = useTasksStore();

// state and getters must go through storeToRefs to stay reactive
const { items, visible } = storeToRefs(store);
// actions can be destructured directly
const { add, toggle } = store;</pre>
  <h2>Why the storeToRefs dance?</h2>
  <p>Destructuring <span class="ic">store.items</span> extracts a plain value with no tracking link out of context. <span class="ic">storeToRefs</span> hands you refs that update as the store changes.</p>
  <h2>Asynchronous actions</h2>
  <pre class="code-block">actions: {
  async load() {
    this.loading = true;
    try {
      this.items = await fetchTasks();   // store is reactive — just mutate it
    } finally {
      this.loading = false;
    }
  }
}</pre>
  <table>
    <tr><th>Store part</th><th>Role</th><th>Analogy</th></tr>
    <tr><td>state</td><td>the data</td><td>a reactive object</td></tr>
    <tr><td>getters</td><td>derived data</td><td>computed with history</td></tr>
    <tr><td>actions</td><td>mutations and async work</td><td>methods</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Start local, promote to store</strong>
    <p>Keep state inside a component until a second one needs it. Premature stores add indirection; a shared store that is genuinely shared is a joy.</p>
  </div>
  <div class="callout callout-info">
    <strong>Devtools</strong>
    <p>Pinia registers in Vue Devtools &mdash; inspect state, time-travel through actions, and pin a value to watch it live.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03600000-0000-4000-8000-000000000422',
  '03600000-0000-4000-8000-000000000322',
  1,
  'Vite & Single-File Components',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Vite & Single-File Components</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #42b883; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #d1fae5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Vite &amp; Single-File Components</h1>
  <p>The CDN route is fine for experiments. For real apps you need a <strong>build step</strong> that compiles single-file components, bundles modules, and optimizes the output. That tool is <strong>Vite</strong>.</p>
  <h2>Scaffold a project</h2>
  <pre class="code-block">npm create vue@latest
# name: task-manager
# features: Vue Router, Pinia, plus prettier defaults

cd task-manager
npm install
npm run dev</pre>
  <p>Vite serves modules over the network with almost instant startup. Edit a component and the page updates in place &mdash; that is <strong>hot module replacement</strong> (HMR), which keeps your component&rsquo;s state alive while swapping its code.</p>
  <h2>The npm scripts</h2>
  <table>
    <tr><th>Script</th><th>Runs</th></tr>
    <tr><td>npm run dev</td><td>development server with HMR</td></tr>
    <tr><td>npm run build</td><td>optimized production bundle into dist/</td></tr>
    <tr><td>npm run preview</td><td>serves the built dist/ locally</td></tr>
  </table>
  <h2>Assets</h2>
  <pre class="code-block">npm install
npm run dev</pre>
  <p>Import assets from your script or style so the bundler hashes and optimizes them; files in the <span class="ic">public/</span> folder are copied verbatim at root URLs.</p>
  <div class="callout callout-info">
    <strong>Where does the SFC fit?</strong>
    <p>A single-file component (http ends of this course) is a .vue file holding <span class="ic">&lt;template&gt;</span>, <span class="ic">&lt;script&gt;</span>, and <span class="ic">&lt;style&gt;</span>. Vite compiles it into importable JavaScript at build time.</p>
  </div>
  <div class="callout callout-tip">
    <strong>No build steps to start</strong>
    <p>For one small page, a CDN script is perfectly fine. Adopt Vite when you reach multiple components, routing, or deployment artifacts.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03600000-0000-4000-8000-000000000423',
  '03600000-0000-4000-8000-000000000323',
  1,
  'SFC Structure & Scoped Styles',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SFC Structure & Scoped Styles</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #42b883; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #d1fae5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>SFC Structure &amp; Scoped Styles</h1>
  <p>A <strong>single-file component</strong> (SFC) keeps template, logic, and style in one .vue file. The three blocks form a clear contract:</p>
  <pre class="code-block">&lt;template&gt;
  &lt;div class="row"&gt;
    &lt;slot /&gt;
  &lt;/div&gt;
&lt;/template&gt;

&lt;script setup&gt;
const title = 'Settings';
&lt;/script&gt;

&lt;style scoped&gt;
.row { display: flex; gap: 1rem; padding: 12px; }
&lt;/style&gt;</pre>
  <table>
    <tr><th>Block</th><th>Role</th><th>Notes</th></tr>
    <tr><td>&lt;template&gt;</td><td>markup</td><td>one root per SFC in Vue 2, multiple allowed in Vue 3</td></tr>
    <tr><td>&lt;script setup&gt;</td><td>logic</td><td>top-level bindings are usable in the template</td></tr>
    <tr><td>&lt;style scoped&gt;</td><td>styling</td><td>compiled to component-local selectors</td></tr>
  </table>
  <h2>Scoped styles, under the hood</h2>
  <p>Scoped styles get rewritten with a unique <span class="ic">data-v-xxxx</span> attribute on your markup and selectors:</p>
  <pre class="code-block">&lt;div class="row" data-v-b8861c3a&gt;&lt;/div&gt;
.row[data-v-b8861c3a] { display: flex; }</pre>
  <p>Because the attribute lives only on the component&rsquo;s own nodes, styles never leak to grandchildren &mdash; so a child component&rsquo;s internals stay unstyled. To intentionally reach a child slot element or a child root, use the <span class="ic">:deep()</span> selector:</p>
  <pre class="code-block">&lt;style scoped&gt;
/* target elements inside a child via attribute-scoped selector */
.selection :deep(.child-line) { font-weight: 700; }
&lt;/style&gt;</pre>
  <h2>Global styles and variables</h2>
  <pre class="code-block">&lt;style&gt; /* no scoped — genuinely global */
:root { --brand: #42b883; }
&lt;/style&gt;</pre>
  <p>Reserve global blocks for reset rules and design tokens; keep everything else scoped.</p>
  <div class="callout callout-tip">
    <strong>One feature, one file</strong>
    <p>Organize by feature: <span class="ic">TaskForm.vue</span>, <span class="ic">TaskList.vue</span>, <span class="ic">StatusFilter.vue</span>. Cohesive files make navigation, reuse, and code review faster.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03600000-0000-4000-8000-000000000425',
  '03600000-0000-4000-8000-000000000325',
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
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #42b883; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #d1fae5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Project Setup</h1>
  <p>The capstone is a <strong>task manager</strong>: add tasks, mark them done, filter by status, and keep everything persisted across reloads. It exercises every skill from this course.</p>
  <h2>Feature list</h2>
  <ul>
    <li>Add a task with a title (and optional priority).</li>
    <li>Toggle tasks as done; remove individual tasks.</li>
    <li>Filter the list: all / active / done.</li>
    <li>A footer summarizing remaining tasks.</li>
    <li>Persist the list to localStorage so reloads keep your data.</li>
  </ul>
  <h2>Scaffold with Vite</h2>
  <pre class="code-block">npm create vue@latest
# name: task-manager · features: Router, Pinia, no TypeScript

cd task-manager
npm install
npm run dev</pre>
  <h2>Project structure</h2>
  <pre class="code-block">task-manager/
  src/
    main.js               // create app, install router + pinia
    App.vue               // shell: header, nav, RouterView
    router/index.js       // routes
    stores/tasks.js       // Pinia store
    components/
      TaskForm.vue
      TaskList.vue
      TaskItem.vue
      StatusFilter.vue
    views/
      TaskListView.vue
      TaskDetailView.vue
  index.html
  package.json</pre>
  <h2>Wire the router first</h2>
  <pre class="code-block">// router/index.js
import { createRouter, createWebHistory } from 'vue-router';
import TaskList from '../views/TaskListView.vue';
import TaskDetail from '../views/TaskDetailView.vue';

export default createRouter({
  history: createWebHistory(),
  routes: [
    { path: '/', redirect: '/tasks' },
    { path: '/tasks', component: TaskList },
    { path: '/tasks/:id', component: TaskDetail }
  ]
});</pre>
  <div class="callout callout-tip">
    <strong>Build a skeleton first</strong>
    <p>Get a route that renders &ldquo;Hello&rdquo; before adding features. A running skeleton de-risks the whole build and gives you a safe checkpoint.</p>
  </div>
  <div class="callout callout-info">
    <strong>Version your ideas</strong>
    <p>Commit after each working step. When a later change breaks something, you can diff or roll back instead of puzzling over the whole app.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03600000-0000-4000-8000-000000000426',
  '03600000-0000-4000-8000-000000000326',
  1,
  'Building the Task Manager UI',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Building the Task Manager UI</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #42b883; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #d1fae5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Building the Task Manager UI</h1>
  <p>Time to assemble the app. Each building block stays small and focused: a form that emits additions, a list that renders rows, and a filter bar that drives the view.</p>
  <h2>App shell</h2>
  <pre class="code-block">&lt;!-- App.vue --&gt;
&lt;template&gt;
  &lt;header&gt;
    &lt;h1&gt;Task Manager&lt;/h1&gt;
    &lt;RouterLink to="/tasks"&gt;All tasks&lt;/RouterLink&gt;
  &lt;/header&gt;
  &lt;main&gt;
    &lt;RouterView /&gt;
  &lt;/main&gt;
&lt;/template&gt;</pre>
  <h2>TaskForm — capture input, emit upwards</h2>
  <pre class="code-block">&lt;script setup&gt;
import { ref } from 'vue';

const title = ref('');
const emit = defineEmits(['add']);

function submit() {
  const trimmed = title.value.trim();
  if (!trimmed) return;
  emit('add', trimmed);
  title.value = '';
}
&lt;/script&gt;

&lt;template&gt;
  &lt;form @submit.prevent="submit"&gt;
    &lt;input v-model="title" placeholder="What needs doing?"&gt;
    &lt;button&gt;Add task&lt;/button&gt;
  &lt;/form&gt;
&lt;/template&gt;</pre>
  <h2>TaskItem — data in, events out</h2>
  <pre class="code-block">&lt;script setup&gt;
const props = defineProps({ task: { type: Object, required: true } });
const emit = defineEmits(['toggle', 'remove']);
&lt;/script&gt;

&lt;template&gt;
  &lt;li :class="{ done: task.done }"&gt;
    &lt;input type="checkbox" :checked="task.done" @change="emit('toggle', task.id)"&gt;
    &lt;span&gt;{{ task.title }}&lt;/span&gt;
    &lt;button @click="emit('remove', task.id)"&gt;Remove&lt;/button&gt;
  &lt;/li&gt;
&lt;/template&gt;</pre>
  <h2>Filters as computed selectors</h2>
  <pre class="code-block">const visibleTasks = computed(() =&gt; {
  if (filter.value === 'active') return tasks.value.filter(t =&gt; !t.done);
  if (filter.value === 'done') return tasks.value.filter(t =&gt; t.done);
  return tasks.value;
});</pre>
  <table>
    <tr><th>Component</th><th>Responsibility</th></tr>
    <tr><td>TaskForm</td><td>collect title, emit add</td></tr>
    <tr><td>TaskList</td><td>v-for items with :key, delegate events</td></tr>
    <tr><td>TaskItem</td><td>render one row, emit toggle/remove</td></tr>
    <tr><td>StatusFilter</td><td>all / active / done switcher</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Keys again</strong>
    <p>Every list row keeps a stable <span class="ic">:key="task.id"</span>. Without it, toggling one row during reorders can reuse the wrong element and leave stale UI state.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03600000-0000-4000-8000-000000000427',
  '03600000-0000-4000-8000-000000000327',
  1,
  'State Persistence & Polish',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>State Persistence & Polish</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #42b883; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #d1fae5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #064e3b; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>State Persistence &amp; Polish</h1>
  <p>The core UI works. Now make it feel like a product: survive reloads, handle empty states, and animate changes with restraint.</p>
  <h2>The Pinia store with persistence</h2>
  <pre class="code-block">// stores/tasks.js
import { defineStore } from 'pinia';

const KEY = 'task-manager.tasks';

function loadSaved() {
  try {
    const parsed = JSON.parse(localStorage.getItem(KEY) || '[]');
    return Array.isArray(parsed) ? parsed : [];
  } catch {
    return [];
  }
}

export const useTasksStore = defineStore('tasks', {
  state: () =&gt; ({ items: loadSaved(), filter: 'all' }),
  getters: {
    remaining: (s) =&gt; s.items.filter(t =&gt; !t.done).length
  },
  actions: {
    save() {
      localStorage.setItem(KEY, JSON.stringify(this.items));
    },
    add(title) {
      const task = { id: crypto.randomUUID(), title, done: false };
      this.items.push(task);
      this.save();
    },
    toggle(id) {
      const task = this.items.find(t =&gt; t.id === id);
      if (task) { task.done = !task.done; this.save(); }
    }
  }
});</pre>
  <p>Saving inside each action keeps the write close to the change; a watcher with <span class="ic">deep: true</span> or <span class="ic">store.$subscribe</span> is the alternative when state mutates in many places.</p>
  <div class="callout">
    <strong>Never trust storage blindly</strong>
    <p>Users, old versions, and extensions can leave garbage in localStorage. Always parse inside <span class="ic">try/catch</span> and validate the shape before treating it as state &mdash; the schema here started with a single unguarded parse and corrupted the app.</p>
  </div>
  <h2>Empty and loading states</h2>
  <pre class="code-block">&lt;p v-if="store.items.length === 0" class="empty"&gt;
  No tasks yet. Add your first one above.
&lt;/p&gt;</pre>
  <p>If your app loads from an API, show a spinner in <span class="ic">onMounted</span>, render placeholder rows, and map errors to friendly copy. Both states prevent silent blank screens.</p>
  <h2>Transitions, tastefully</h2>
  <pre class="code-block">&lt;TransitionGroup name="list" tag="ul"&gt;
  &lt;li v-for="task in visibleTasks" :key="task.id"&gt;
    &lt;TaskItem :task="task" /&gt;
  &lt;/li&gt;
&lt;/TransitionGroup&gt;</pre>
  <table>
    <tr><th>Polish</th><th>Why</th></tr>
    <tr><td>crypto.randomUUID ids</td><td>collision-free keys, no counter state</td></tr>
    <tr><td>disabled submit on empty</td><td>prevents no-op adds while typing</td></tr>
    <tr><td>fade/slide lists</td><td>signals insertion and removal</td></tr>
    <tr><td>aria labels on icon buttons</td><td>accessible and testable</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Ship it</strong>
    <p>Run <span class="ic">npm run build</span>, preview the result, and test the flow on a phone-size window. You have now shipped a real Vue application.</p>
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
  ('03600000-0000-4000-8000-000000000501', '03600000-0000-4000-8000-000000000303',
   'Which function creates the Vue application instance?',
   'createApp initializes the root component of a Vue application.', 1),
  ('03600000-0000-4000-8000-000000000502', '03600000-0000-4000-8000-000000000303',
   'What does app.mount("#app") accomplish?',
   'mount attaches the app instance to the DOM element it manages.', 2),
  ('03600000-0000-4000-8000-000000000503', '03600000-0000-4000-8000-000000000303',
   'Which syntax renders reactive data in a template?',
   'Double curly braces render the value and stay in sync with state.', 3),
  ('03600000-0000-4000-8000-000000000504', '03600000-0000-4000-8000-000000000306',
   'Which directive renders content only when a condition is true?',
   'v-if removes the element entirely when the condition is falsy.', 1),
  ('03600000-0000-4000-8000-000000000505', '03600000-0000-4000-8000-000000000306',
   'What is the key difference between v-show and v-if?',
   'v-show toggles display while v-if builds and destroys the element.', 2),
  ('03600000-0000-4000-8000-000000000506', '03600000-0000-4000-8000-000000000306',
   'Which directive binds an attribute to a reactive value?',
   'v-bind (shorthand :) synchronizes an attribute with a property.', 3),
  ('03600000-0000-4000-8000-000000000507', '03600000-0000-4000-8000-000000000309',
   'Why are computed properties more efficient than methods?',
   'Computed values are cached and only recompute when dependencies change.', 1),
  ('03600000-0000-4000-8000-000000000508', '03600000-0000-4000-8000-000000000309',
   'When should you prefer watch over computed?',
   'Watch is for side effects; computed derives values for rendering.', 2),
  ('03600000-0000-4000-8000-000000000509', '03600000-0000-4000-8000-000000000309',
   'Which event modifier prevents the default browser submit behavior?',
   '.prevent calls preventDefault on the underlying event.', 3),
  ('03600000-0000-4000-8000-000000000510', '03600000-0000-4000-8000-000000000312',
   'How do components receive data from a parent?',
   'Props flow down from the parent to the child component.', 1),
  ('03600000-0000-4000-8000-000000000511', '03600000-0000-4000-8000-000000000312',
   'What does one-way data flow require of a child component?',
   'Children must never mutate props; they emit events to request changes.', 2),
  ('03600000-0000-4000-8000-000000000512', '03600000-0000-4000-8000-000000000312',
   'How does a child announce an event to its parent?',
   'defineEmits declares events the child can emit for the parent to handle.', 3),
  ('03600000-0000-4000-8000-000000000513', '03600000-0000-4000-8000-000000000315',
   'Which feature lets a parent project content into a child?',
   'Slots provide outlets where parent markup is rendered.', 1),
  ('03600000-0000-4000-8000-000000000514', '03600000-0000-4000-8000-000000000315',
   'What is the named slot syntax inside the parent template?',
   'A template element with #name fills the matching named slot.', 2),
  ('03600000-0000-4000-8000-000000000515', '03600000-0000-4000-8000-000000000315',
   'Which prop and event does v-model map to on a component?',
   'v-model maps to the modelValue prop and the update:modelValue event.', 3),
  ('03600000-0000-4000-8000-000000000516', '03600000-0000-4000-8000-000000000318',
   'How do you access the value of a ref inside a script?',
   'A ref holds its value on the .value property for script access.', 1),
  ('03600000-0000-4000-8000-000000000517', '03600000-0000-4000-8000-000000000318',
   'Which utility wraps a plain object so its properties are reactive?',
   'reactive() converts a plain object into a deep reactive proxy.', 2),
  ('03600000-0000-4000-8000-000000000518', '03600000-0000-4000-8000-000000000318',
   'Which lifecycle hook is the standard place to fetch data on mount?',
   'onMounted runs after the component exists in the DOM.', 3),
  ('03600000-0000-4000-8000-000000000519', '03600000-0000-4000-8000-000000000321',
   'Which component renders the component matched by the current route?',
   'RouterView is the outlet where the routed component appears.', 1),
  ('03600000-0000-4000-8000-000000000520', '03600000-0000-4000-8000-000000000321',
   'How do you navigate programmatically inside a component?',
   'useRouter().push adds a new entry to the navigation history.', 2),
  ('03600000-0000-4000-8000-000000000521', '03600000-0000-4000-8000-000000000321',
   'In Pinia, which concept provides derived state from the store?',
   'Getters compute derived values from the store state.', 3),
  ('03600000-0000-4000-8000-000000000522', '03600000-0000-4000-8000-000000000324',
   'What does a scoped style block do?',
   'Scoped styles apply only to the current component via a data attribute.', 1),
  ('03600000-0000-4000-8000-000000000523', '03600000-0000-4000-8000-000000000324',
   'Which dev-server feature updates the UI while preserving state?',
   'HMR hot-swaps changed modules without a full page reload.', 2),
  ('03600000-0000-4000-8000-000000000524', '03600000-0000-4000-8000-000000000324',
   'What three top-level blocks make up a single-file component?',
   'An SFC is composed of template, script, and style blocks.', 3),
  ('03600000-0000-4000-8000-000000000525', '03600000-0000-4000-8000-000000000328',
   'What does it mean that Vue data is reactive?',
   'The view re-renders automatically whenever tracked state changes.', 1),
  ('03600000-0000-4000-8000-000000000526', '03600000-0000-4000-8000-000000000328',
   'Why is the key attribute important on v-for items?',
   'Keys give rows a stable identity so Vue can reconcile efficiently.', 2),
  ('03600000-0000-4000-8000-000000000527', '03600000-0000-4000-8000-000000000328',
   'A child needs to notify its parent of a user action. What should it do?',
   'Declare and emit a custom event; the parent listens and updates state.', 3),
  ('03600000-0000-4000-8000-000000000528', '03600000-0000-4000-8000-000000000328',
   'Why wrap Pinia state in storeToRefs after destructuring?',
   'storeToRefs preserves reactivity for destructured store properties.', 4),
  ('03600000-0000-4000-8000-000000000529', '03600000-0000-4000-8000-000000000328',
   'Which approach keeps persisted data safe on a fresh page load?',
   'Parse stored JSON inside try/catch with a validated fallback.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): createApp
  ('03600000-0000-4000-8000-000000001001', '03600000-0000-4000-8000-000000000501', 'createApp', TRUE,  1),
  ('03600000-0000-4000-8000-000000001002', '03600000-0000-4000-8000-000000000501', 'createElement', FALSE, 2),
  ('03600000-0000-4000-8000-000000001003', '03600000-0000-4000-8000-000000000501', 'new Vue()', FALSE, 3),
  ('03600000-0000-4000-8000-000000001004', '03600000-0000-4000-8000-000000000501', 'mount', FALSE, 4),
  -- Q1 (502): mount
  ('03600000-0000-4000-8000-000000001005', '03600000-0000-4000-8000-000000000502', 'Attaches the app to that element', TRUE,  1),
  ('03600000-0000-4000-8000-000000001006', '03600000-0000-4000-8000-000000000502', 'Replaces the entire page', FALSE, 2),
  ('03600000-0000-4000-8000-000000001007', '03600000-0000-4000-8000-000000000502', 'Starts the dev server', FALSE, 3),
  ('03600000-0000-4000-8000-000000001008', '03600000-0000-4000-8000-000000000502', 'Compiles the style block', FALSE, 4),
  -- Q1 (503): moustache
  ('03600000-0000-4000-8000-000000001009', '03600000-0000-4000-8000-000000000503', '#{ variable }', FALSE, 1),
  ('03600000-0000-4000-8000-000000001010', '03600000-0000-4000-8000-000000000503', '{{ variable }}', TRUE,  2),
  ('03600000-0000-4000-8000-000000001011', '03600000-0000-4000-8000-000000000503', '%{ variable }%', FALSE, 3),
  ('03600000-0000-4000-8000-000000001012', '03600000-0000-4000-8000-000000000503', '${ variable }', FALSE, 4),
  -- Q2 (504): v-if
  ('03600000-0000-4000-8000-000000001013', '03600000-0000-4000-8000-000000000504', 'v-if', TRUE,  1),
  ('03600000-0000-4000-8000-000000001014', '03600000-0000-4000-8000-000000000504', 'v-bind', FALSE, 2),
  ('03600000-0000-4000-8000-000000001015', '03600000-0000-4000-8000-000000000504', 'v-model', FALSE, 3),
  ('03600000-0000-4000-8000-000000001016', '03600000-0000-4000-8000-000000000504', 'v-once', FALSE, 4),
  -- Q2 (505): v-show vs v-if
  ('03600000-0000-4000-8000-000000001017', '03600000-0000-4000-8000-000000000505', 'v-show keeps the element in the DOM', TRUE,  1),
  ('03600000-0000-4000-8000-000000001018', '03600000-0000-4000-8000-000000000505', 'v-show removes the element from the DOM', FALSE, 2),
  ('03600000-0000-4000-8000-000000001019', '03600000-0000-4000-8000-000000000505', 'v-show only works on form controls', FALSE, 3),
  ('03600000-0000-4000-8000-000000001020', '03600000-0000-4000-8000-000000000505', 'They are identical in behavior', FALSE, 4),
  -- Q2 (506): v-bind
  ('03600000-0000-4000-8000-000000001021', '03600000-0000-4000-8000-000000000506', 'v-model', FALSE, 1),
  ('03600000-0000-4000-8000-000000001022', '03600000-0000-4000-8000-000000000506', 'v-on', FALSE, 2),
  ('03600000-0000-4000-8000-000000001023', '03600000-0000-4000-8000-000000000506', 'v-bind', TRUE,  3),
  ('03600000-0000-4000-8000-000000001024', '03600000-0000-4000-8000-000000000506', 'v-html', FALSE, 4),
  -- Q3 (507): computed caching
  ('03600000-0000-4000-8000-000000001025', '03600000-0000-4000-8000-000000000507', 'They are cached based on reactive dependencies', TRUE,  1),
  ('03600000-0000-4000-8000-000000001026', '03600000-0000-4000-8000-000000000507', 'They run again on every render', FALSE, 2),
  ('03600000-0000-4000-8000-000000001027', '03600000-0000-4000-8000-000000000507', 'They cannot read reactive state', FALSE, 3),
  ('03600000-0000-4000-8000-000000001028', '03600000-0000-4000-8000-000000000507', 'They always run asynchronously', FALSE, 4),
  -- Q3 (508): watch vs computed
  ('03600000-0000-4000-8000-000000001029', '03600000-0000-4000-8000-000000000508', 'For side effects like API calls or storage', TRUE,  1),
  ('03600000-0000-4000-8000-000000001030', '03600000-0000-4000-8000-000000000508', 'For pure value derivation', FALSE, 2),
  ('03600000-0000-4000-8000-000000001031', '03600000-0000-4000-8000-000000000508', 'For template rendering', FALSE, 3),
  ('03600000-0000-4000-8000-000000001032', '03600000-0000-4000-8000-000000000508', 'For prop validation', FALSE, 4),
  -- Q3 (509): .prevent
  ('03600000-0000-4000-8000-000000001033', '03600000-0000-4000-8000-000000000509', '.prevent', TRUE,  1),
  ('03600000-0000-4000-8000-000000001034', '03600000-0000-4000-8000-000000000509', '.stop', FALSE, 2),
  ('03600000-0000-4000-8000-000000001035', '03600000-0000-4000-8000-000000000509', '.self', FALSE, 3),
  ('03600000-0000-4000-8000-000000001036', '03600000-0000-4000-8000-000000000509', '.once', FALSE, 4),
  -- Q4 (510): props
  ('03600000-0000-4000-8000-000000001037', '03600000-0000-4000-8000-000000000510', 'Through props', TRUE,  1),
  ('03600000-0000-4000-8000-000000001038', '03600000-0000-4000-8000-000000000510', 'Through data()', FALSE, 2),
  ('03600000-0000-4000-8000-000000001039', '03600000-0000-4000-8000-000000000510', 'Through slots', FALSE, 3),
  ('03600000-0000-4000-8000-000000001040', '03600000-0000-4000-8000-000000000510', 'Through computed', FALSE, 4),
  -- Q4 (511): one-way flow
  ('03600000-0000-4000-8000-000000001041', '03600000-0000-4000-8000-000000000511', 'It must never mutate props', TRUE,  1),
  ('03600000-0000-4000-8000-000000001042', '03600000-0000-4000-8000-000000000511', 'It may mutate props freely', FALSE, 2),
  ('03600000-0000-4000-8000-000000001043', '03600000-0000-4000-8000-000000000511', 'It must create the parent state', FALSE, 3),
  ('03600000-0000-4000-8000-000000001044', '03600000-0000-4000-8000-000000000511', 'It must use v-model on every prop', FALSE, 4),
  -- Q4 (512): defineEmits
  ('03600000-0000-4000-8000-000000001045', '03600000-0000-4000-8000-000000000512', 'defineEmits and calling emit', TRUE,  1),
  ('03600000-0000-4000-8000-000000001046', '03600000-0000-4000-8000-000000000512', 'Mutating the data() object', FALSE, 2),
  ('03600000-0000-4000-8000-000000001047', '03600000-0000-4000-8000-000000000512', 'Scheduling a setTimeout', FALSE, 3),
  ('03600000-0000-4000-8000-000000001048', '03600000-0000-4000-8000-000000000512', 'Using provide/inject', FALSE, 4),
  -- Q5 (513): slots
  ('03600000-0000-4000-8000-000000001049', '03600000-0000-4000-8000-000000000513', 'Slots', TRUE,  1),
  ('03600000-0000-4000-8000-000000001050', '03600000-0000-4000-8000-000000000513', 'Props', FALSE, 2),
  ('03600000-0000-4000-8000-000000001051', '03600000-0000-4000-8000-000000000513', 'Getters', FALSE, 3),
  ('03600000-0000-4000-8000-000000001052', '03600000-0000-4000-8000-000000000513', 'Watchers', FALSE, 4),
  -- Q5 (514): named slot syntax
  ('03600000-0000-4000-8000-000000001053', '03600000-0000-4000-8000-000000000514', '&lt;template #header&gt;', TRUE,  1),
  ('03600000-0000-4000-8000-000000001054', '03600000-0000-4000-8000-000000000514', '&lt;header slot&gt;', FALSE, 2),
  ('03600000-0000-4000-8000-000000001055', '03600000-0000-4000-8000-000000000514', '&lt;slot name="header"&gt;', FALSE, 3),
  ('03600000-0000-4000-8000-000000001056', '03600000-0000-4000-8000-000000000514', '&lt;div #header&gt;', FALSE, 4),
  -- Q5 (515): v-model on component
  ('03600000-0000-4000-8000-000000001057', '03600000-0000-4000-8000-000000000515', 'modelValue and update:modelValue', TRUE,  1),
  ('03600000-0000-4000-8000-000000001058', '03600000-0000-4000-8000-000000000515', 'value and change', FALSE, 2),
  ('03600000-0000-4000-8000-000000001059', '03600000-0000-4000-8000-000000000515', 'input and output', FALSE, 3),
  ('03600000-0000-4000-8000-000000001060', '03600000-0000-4000-8000-000000000515', 'model and sync', FALSE, 4),
  -- Q6 (516): ref .value
  ('03600000-0000-4000-8000-000000001061', '03600000-0000-4000-8000-000000000516', 'Through its .value property', TRUE,  1),
  ('03600000-0000-4000-8000-000000001062', '03600000-0000-4000-8000-000000000516', 'Directly without a suffix', FALSE, 2),
  ('03600000-0000-4000-8000-000000001063', '03600000-0000-4000-8000-000000000516', 'Only inside a computed', FALSE, 3),
  ('03600000-0000-4000-8000-000000001064', '03600000-0000-4000-8000-000000000516', 'Via the $refs object', FALSE, 4),
  -- Q6 (517): reactive
  ('03600000-0000-4000-8000-000000001065', '03600000-0000-4000-8000-000000000517', 'reactive()', TRUE,  1),
  ('03600000-0000-4000-8000-000000001066', '03600000-0000-4000-8000-000000000517', 'ref()', FALSE, 2),
  ('03600000-0000-4000-8000-000000001067', '03600000-0000-4000-8000-000000000517', 'computed()', FALSE, 3),
  ('03600000-0000-4000-8000-000000001068', '03600000-0000-4000-8000-000000000517', 'watch()', FALSE, 4),
  -- Q6 (518): onMounted
  ('03600000-0000-4000-8000-000000001069', '03600000-0000-4000-8000-000000000518', 'onMounted', TRUE,  1),
  ('03600000-0000-4000-8000-000000001070', '03600000-0000-4000-8000-000000000518', 'onCreated', FALSE, 2),
  ('03600000-0000-4000-8000-000000001071', '03600000-0000-4000-8000-000000000518', 'onBeforeRender', FALSE, 3),
  ('03600000-0000-4000-8000-000000001072', '03600000-0000-4000-8000-000000000518', 'onDestroyed', FALSE, 4),
  -- Q7 (519): RouterView
  ('03600000-0000-4000-8000-000000001073', '03600000-0000-4000-8000-000000000519', 'RouterView', TRUE,  1),
  ('03600000-0000-4000-8000-000000001074', '03600000-0000-4000-8000-000000000519', 'RouterLink', FALSE, 2),
  ('03600000-0000-4000-8000-000000001075', '03600000-0000-4000-8000-000000000519', 'AppRoot', FALSE, 3),
  ('03600000-0000-4000-8000-000000001076', '03600000-0000-4000-8000-000000000519', 'RouteOutlet', FALSE, 4),
  -- Q7 (520): useRouter().push
  ('03600000-0000-4000-8000-000000001077', '03600000-0000-4000-8000-000000000520', 'useRouter().push(location)', TRUE,  1),
  ('03600000-0000-4000-8000-000000001078', '03600000-0000-4000-8000-000000000520', 'window.location = location', FALSE, 2),
  ('03600000-0000-4000-8000-000000001079', '03600000-0000-4000-8000-000000000520', 'router.go(0)', FALSE, 3),
  ('03600000-0000-4000-8000-000000001080', '03600000-0000-4000-8000-000000000520', 'createRouter(location)', FALSE, 4),
  -- Q7 (521): getters
  ('03600000-0000-4000-8000-000000001081', '03600000-0000-4000-8000-000000000521', 'Getters', TRUE,  1),
  ('03600000-0000-4000-8000-000000001082', '03600000-0000-4000-8000-000000000521', 'Actions', FALSE, 2),
  ('03600000-0000-4000-8000-000000001083', '03600000-0000-4000-8000-000000000521', 'Watchers', FALSE, 3),
  ('03600000-0000-4000-8000-000000001084', '03600000-0000-4000-8000-000000000521', 'Props', FALSE, 4),
  -- Q8 (522): scoped styles
  ('03600000-0000-4000-8000-000000001085', '03600000-0000-4000-8000-000000000522', 'Restricts styles to the current component', TRUE,  1),
  ('03600000-0000-4000-8000-000000001086', '03600000-0000-4000-8000-000000000522', 'Applies styles to every component', FALSE, 2),
  ('03600000-0000-4000-8000-000000001087', '03600000-0000-4000-8000-000000000522', 'Removes all styling', FALSE, 3),
  ('03600000-0000-4000-8000-000000001088', '03600000-0000-4000-8000-000000000522', 'Inlines an external stylesheet', FALSE, 4),
  -- Q8 (523): HMR
  ('03600000-0000-4000-8000-000000001089', '03600000-0000-4000-8000-000000000523', 'Hot module replacement (HMR)', TRUE,  1),
  ('03600000-0000-4000-8000-000000001090', '03600000-0000-4000-8000-000000000523', 'A full page refresh', FALSE, 2),
  ('03600000-0000-4000-8000-000000001091', '03600000-0000-4000-8000-000000000523', 'Manual compilation', FALSE, 3),
  ('03600000-0000-4000-8000-000000001092', '03600000-0000-4000-8000-000000000523', 'Progressive hydration', FALSE, 4),
  -- Q8 (524): SFC blocks
  ('03600000-0000-4000-8000-000000001093', '03600000-0000-4000-8000-000000000524', 'template, script, style', TRUE,  1),
  ('03600000-0000-4000-8000-000000001094', '03600000-0000-4000-8000-000000000524', 'html, js, css', FALSE, 2),
  ('03600000-0000-4000-8000-000000001095', '03600000-0000-4000-8000-000000000524', 'header, body, footer', FALSE, 3),
  ('03600000-0000-4000-8000-000000001096', '03600000-0000-4000-8000-000000000524', 'model, view, controller', FALSE, 4),
  -- Q9 (525): reactive meaning
  ('03600000-0000-4000-8000-000000001097', '03600000-0000-4000-8000-000000000525', 'The UI re-renders when tracked state changes', TRUE,  1),
  ('03600000-0000-4000-8000-000000001098', '03600000-0000-4000-8000-000000000525', 'State can never change', FALSE, 2),
  ('03600000-0000-4000-8000-000000001099', '03600000-0000-4000-8000-000000000525', 'Only the server can change state', FALSE, 3),
  ('03600000-0000-4000-8000-000000001100', '03600000-0000-4000-8000-000000000525', 'Pages reload on every edit', FALSE, 4),
  -- Q9 (526): key attribute
  ('03600000-0000-4000-8000-000000001101', '03600000-0000-4000-8000-000000000526', 'It gives rows a stable identity for reconciliation', TRUE,  1),
  ('03600000-0000-4000-8000-000000001102', '03600000-0000-4000-8000-000000000526', 'It styles the rows', FALSE, 2),
  ('03600000-0000-4000-8000-000000001103', '03600000-0000-4000-8000-000000000526', 'It sorts the list', FALSE, 3),
  ('03600000-0000-4000-8000-000000001104', '03600000-0000-4000-8000-000000000526', 'It makes rows read-only', FALSE, 4),
  -- Q9 (527): emit event
  ('03600000-0000-4000-8000-000000001105', '03600000-0000-4000-8000-000000000527', 'Emit a custom event for the parent', TRUE,  1),
  ('03600000-0000-4000-8000-000000001106', '03600000-0000-4000-8000-000000000527', 'Mutate the parent prop', FALSE, 2),
  ('03600000-0000-4000-8000-000000001107', '03600000-0000-4000-8000-000000000527', 'Rename the prop', FALSE, 3),
  ('03600000-0000-4000-8000-000000001108', '03600000-0000-4000-8000-000000000527', 'Delete the component', FALSE, 4),
  -- Q9 (528): storeToRefs
  ('03600000-0000-4000-8000-000000001109', '03600000-0000-4000-8000-000000000528', 'It preserves reactivity when destructuring', TRUE,  1),
  ('03600000-0000-4000-8000-000000001110', '03600000-0000-4000-8000-000000000528', 'It makes the store run faster', FALSE, 2),
  ('03600000-0000-4000-8000-000000001111', '03600000-0000-4000-8000-000000000528', 'It serializes the store to JSON', FALSE, 3),
  ('03600000-0000-4000-8000-000000001112', '03600000-0000-4000-8000-000000000528', 'It removes all side effects', FALSE, 4),
  -- Q9 (529): safe persistence
  ('03600000-0000-4000-8000-000000001113', '03600000-0000-4000-8000-000000000529', 'Parse JSON inside try/catch with a fallback', TRUE,  1),
  ('03600000-0000-4000-8000-000000001114', '03600000-0000-4000-8000-000000000529', 'Trust every stored value blindly', FALSE, 2),
  ('03600000-0000-4000-8000-000000001115', '03600000-0000-4000-8000-000000000529', 'Store only raw strings', FALSE, 3),
  ('03600000-0000-4000-8000-000000001116', '03600000-0000-4000-8000-000000000529', 'Skip validation entirely', FALSE, 4)
ON CONFLICT (id) DO NOTHING;
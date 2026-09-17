-- ============================================================================
-- SEED 004: Complete course — "JavaScript for the Web"
-- ----------------------------------------------------------------------------
-- Instructor : Sarah Chen        (10000000-0000-4000-8000-000000000001)
-- Category   : Web Development   (20000000-0000-4000-8000-000000000001)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 JavaScript Language Core  → C1 Variables, Types & Operators · C2 Functions & Control Flow
--   M2 Working with the DOM      → C3 Selecting & Modifying Elements · C4 Events & Forms
--   M3 Modern JavaScript          → C5 ES6+ Essentials · C6 Error Handling & Async
--   M4 Data & APIs               → C7 JSON & the Fetch API · C8 Building with Real APIs
--   M5 Capstone: Weather App     → C9 Project Setup · C10 Building & Polishing
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
  '40000000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000001',
  '20000000-0000-4000-8000-000000000001',
  'JavaScript for the Web',
  'javascript-for-the-web',
  'Add interactivity to your pages. Master JavaScript fundamentals, the DOM, modern ES6+ syntax, and asynchronous APIs — then build a complete weather application that talks to a real API.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  2
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('40000000-0000-4000-8000-000000000011', '40000000-0000-4000-8000-000000000001', 'Write clean JavaScript: variables, types, functions, and control flow.',      1),
  ('40000000-0000-4000-8000-000000000012', '40000000-0000-4000-8000-000000000001', 'Select and modify DOM elements and respond to user events.',                    2),
  ('40000000-0000-4000-8000-000000000013', '40000000-0000-4000-8000-000000000001', 'Use modern ES6+ syntax: arrow functions, destructuring, and modules.',           3),
  ('40000000-0000-4000-8000-000000000014', '40000000-0000-4000-8000-000000000001', 'Fetch and render data from REST APIs with Promises and async/await.',             4),
  ('40000000-0000-4000-8000-000000000015', '40000000-0000-4000-8000-000000000001', 'Build and polish a complete interactive weather application with error handling.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('40000000-0000-4000-8000-000000000101', '40000000-0000-4000-8000-000000000001', 1, 'JavaScript Language Core',   'Learn variables, types, functions, and control flow.',        'PUBLISHED'),
  ('40000000-0000-4000-8000-000000000102', '40000000-0000-4000-8000-000000000001', 2, 'Working with the DOM',       'Make pages respond to user actions by manipulating the DOM.',  'PUBLISHED'),
  ('40000000-0000-4000-8000-000000000103', '40000000-0000-4000-8000-000000000001', 3, 'Modern JavaScript',          'Adopt ES6+ syntax and asynchronous error handling.',           'PUBLISHED'),
  ('40000000-0000-4000-8000-000000000104', '40000000-0000-4000-8000-000000000001', 4, 'Data & APIs',                'Fetch JSON, call REST APIs, and render real data.',            'PUBLISHED'),
  ('40000000-0000-4000-8000-000000000105', '40000000-0000-4000-8000-000000000001', 5, 'Capstone: Weather App',      'Build and polish a complete weather application.',             'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('40000000-0000-4000-8000-000000000201', '40000000-0000-4000-8000-000000000101', 1, 'Variables, Types & Operators', 'The building blocks of JavaScript data.',        'PUBLISHED'),
  ('40000000-0000-4000-8000-000000000202', '40000000-0000-4000-8000-000000000101', 2, 'Functions & Control Flow',     'Reusable logic and program decisions.',           'PUBLISHED'),
  ('40000000-0000-4000-8000-000000000203', '40000000-0000-4000-8000-000000000102', 1, 'Selecting & Modifying Elements','Find and change page content.',                   'PUBLISHED'),
  ('40000000-0000-4000-8000-000000000204', '40000000-0000-4000-8000-000000000102', 2, 'Events & Forms',               'React to clicks, keystrokes, and form input.',    'PUBLISHED'),
  ('40000000-0000-4000-8000-000000000205', '40000000-0000-4000-8000-000000000103', 1, 'ES6+ Essentials',              'Arrow functions, destructuring, and modules.',    'PUBLISHED'),
  ('40000000-0000-4000-8000-000000000206', '40000000-0000-4000-8000-000000000103', 2, 'Error Handling & Async',       'Throw, catch, and await with confidence.',        'PUBLISHED'),
  ('40000000-0000-4000-8000-000000000207', '40000000-0000-4000-8000-000000000104', 1, 'JSON & the Fetch API',        'Read JSON and make HTTP requests from the browser.', 'PUBLISHED'),
  ('40000000-0000-4000-8000-000000000208', '40000000-0000-4000-8000-000000000104', 2, 'Building with Real APIs',     'Structure reusable request code and render data.', 'PUBLISHED'),
  ('40000000-0000-4000-8000-000000000209', '40000000-0000-4000-8000-000000000105', 1, 'Project Setup',               'Scaffold the capstone weather application.',      'PUBLISHED'),
  ('40000000-0000-4000-8000-000000000210', '40000000-0000-4000-8000-000000000105', 2, 'Building & Polishing',        'Assemble, style, and harden the app.',            'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 40000000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('40000000-0000-4000-8000-000000000301', '40000000-0000-4000-8000-000000000201', 1, 'What is JavaScript?',                 'Understand how the browser runs JavaScript and where your code lives.',  'TEXT',  'PUBLISHED', 'FREE', 10,  5),
  ('40000000-0000-4000-8000-000000000302', '40000000-0000-4000-8000-000000000201', 2, 'Variables, Types & Operators',         'Declare variables and work with numbers, strings, booleans, and arrays.','TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('40000000-0000-4000-8000-000000000303', '40000000-0000-4000-8000-000000000201', 3, 'Language Basics Quiz',                 'Check your understanding of JavaScript fundamentals.',                   'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('40000000-0000-4000-8000-000000000304', '40000000-0000-4000-8000-000000000202', 1, 'Functions',                            'Write reusable functions with parameters, returns, and scopes.',         'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('40000000-0000-4000-8000-000000000305', '40000000-0000-4000-8000-000000000202', 2, 'Control Flow & Loops',                 'Branch with if/else/switch and repeat with loops.',                       'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('40000000-0000-4000-8000-000000000306', '40000000-0000-4000-8000-000000000202', 3, 'Functions & Control Flow Quiz',        'Test your grasp of functions and program flow.',                         'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('40000000-0000-4000-8000-000000000307', '40000000-0000-4000-8000-000000000203', 1, 'Selecting Elements',                   'Find nodes with querySelector, getElementById, and more.',                'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('40000000-0000-4000-8000-000000000308', '40000000-0000-4000-8000-000000000203', 2, 'Modifying Content & Attributes',       'Change text, HTML, and attributes on the fly.',                           'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('40000000-0000-4000-8000-000000000309', '40000000-0000-4000-8000-000000000203', 3, 'DOM Selection Quiz',                   'Verify you can find and modify elements.',                                'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('40000000-0000-4000-8000-000000000310', '40000000-0000-4000-8000-000000000204', 1, 'Events & Event Listeners',             'React to clicks, keyboard input, and page load.',                         'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('40000000-0000-4000-8000-000000000311', '40000000-0000-4000-8000-000000000204', 2, 'Forms & Input Handling',               'Read form values, validate input, and prevent reloads.',                  'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('40000000-0000-4000-8000-000000000312', '40000000-0000-4000-8000-000000000204', 3, 'Events & Forms Quiz',                  'Check what you know about events and forms.',                             'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('40000000-0000-4000-8000-000000000313', '40000000-0000-4000-8000-000000000205', 1, 'Arrow Functions & Destructuring',      'Write concise functions and unpack objects and arrays.',                  'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('40000000-0000-4000-8000-000000000314', '40000000-0000-4000-8000-000000000205', 2, 'Template Literals & Modules',          'Build strings cleanly and split code into modules.',                      'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('40000000-0000-4000-8000-000000000315', '40000000-0000-4000-8000-000000000205', 3, 'ES6+ Quiz',                            'Test your modern JavaScript knowledge.',                                  'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('40000000-0000-4000-8000-000000000316', '40000000-0000-4000-8000-000000000206', 1, 'Errors & Exception Handling',          'Throw, catch, and finally — handle failure gracefully.',                  'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('40000000-0000-4000-8000-000000000317', '40000000-0000-4000-8000-000000000206', 2, 'Promises & async/await',               'Write asynchronous code that is easy to read and reason about.',           'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('40000000-0000-4000-8000-000000000318', '40000000-0000-4000-8000-000000000206', 3, 'Async JavaScript Quiz',                'Check your async and error-handling skills.',                             'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('40000000-0000-4000-8000-000000000319', '40000000-0000-4000-8000-000000000207', 1, 'The Fetch API',                        'Make network requests and read responses in the browser.',                'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('40000000-0000-4000-8000-000000000320', '40000000-0000-4000-8000-000000000207', 2, 'JSON & REST Conventions',              'Model data as JSON and talk to RESTful endpoints.',                       'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('40000000-0000-4000-8000-000000000321', '40000000-0000-4000-8000-000000000207', 3, 'Fetch & JSON Quiz',                    'Verify you can fetch and parse data.',                                    'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('40000000-0000-4000-8000-000000000322', '40000000-0000-4000-8000-000000000208', 1, 'Building a Request Helper',            'Wrap fetch in a reusable, typed helper.',                                 'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('40000000-0000-4000-8000-000000000323', '40000000-0000-4000-8000-000000000208', 2, 'Rendering API Data',                   'Turn JSON into visible, interactive UI.',                                 'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('40000000-0000-4000-8000-000000000324', '40000000-0000-4000-8000-000000000208', 3, 'Real APIs Quiz',                        'Check your API integration knowledge.',                                   'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('40000000-0000-4000-8000-000000000325', '40000000-0000-4000-8000-000000000209', 1, 'Project Setup & API Key',               'Create the files and secure an OpenWeatherMap key.',                      'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('40000000-0000-4000-8000-000000000326', '40000000-0000-4000-8000-000000000210', 1, 'Building the Weather App UI',           'Structure and style the forecast interface.',                             'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('40000000-0000-4000-8000-000000000327', '40000000-0000-4000-8000-000000000210', 2, 'Loading States & Error Handling',      'Handle slow networks and failed requests with grace.',                    'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('40000000-0000-4000-8000-000000000328', '40000000-0000-4000-8000-000000000210', 3, 'Final Assessment',                     'Prove what you learned across the whole course.',                         'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 40000000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '40000000-0000-4000-8000-000000000401',
  '40000000-0000-4000-8000-000000000301',
  1,
  'What is JavaScript?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What is JavaScript?</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f59e0b; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b45309; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fffbeb; color: #b45309; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fffbeb; color: #b45309; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fbbf24; }
.dark .lesson-page h2 { color: #fcd34d; }
.dark .lesson-page .ic { background: #451a03; color: #fcd34d; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #451a03; color: #fcd34d; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>What is JavaScript?</h1>
  <p>JavaScript is the <strong>behavior layer</strong> of the web. HTML defines content, CSS defines appearance, and JavaScript makes pages respond: buttons that react, forms that validate, data that loads without a page refresh.</p>
  <p>Unlike HTML and CSS, JavaScript is a <strong>full programming language</strong> — with variables, functions, loops, and error handling. It runs <em>in the browser</em>, and since 2009 it also runs on servers via Node.js, mobile apps via React Native, and even desktops via Electron.</p>
  <h2>Where does your code live?</h2>
  <ul>
    <li><span class="ic">&lt;script&gt;</span> tags at the end of the body of an HTML file.</li>
    <li>External files referenced with <span class="ic">&lt;script src="app.js"&gt;&lt;/script&gt;</span>.</li>
    <li>The browser DevTools &ldquo;Console&rdquo; panel for quick experiments.</li>
  </ul>
  <p>Your first program:</p>
  <pre class="code-block">&lt;script&gt;
  console.log('Hello from JavaScript!');
&lt;/script&gt;</pre>
  <div class="callout callout-tip">
    <strong>Try it now</strong>
    <p>Open DevTools (F12) → Console and type the snippet above. <span class="ic">console.log</span> prints to the console — your new best friend for debugging.</p>
  </div>
  <h2>What you will build</h2>
  <p>In this course you will progressively build an interactive <strong>weather application</strong>: select a city, fetch real forecast data from an API, render it to the page, and handle loading and error states like production software does.</p>
  <div class="callout callout-info">
    <strong>Note</strong>
    <p>You are expected to already know HTML and CSS. Everything else — variables, the DOM, async code — you will learn here from zero.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '40000000-0000-4000-8000-000000000402',
  '40000000-0000-4000-8000-000000000302',
  1,
  'Variables, Types & Operators',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Variables, Types & Operators</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f59e0b; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b45309; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fffbeb; color: #b45309; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fffbeb; color: #b45309; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fbbf24; }
.dark .lesson-page h2 { color: #fcd34d; }
.dark .lesson-page .ic { background: #451a03; color: #fcd34d; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #451a03; color: #fcd34d; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Variables, Types &amp; Operators</h1>
  <p>Variables are named boxes that hold values. In modern JavaScript you declare them with <span class="ic">let</span> or <span class="ic">const</span>:</p>
  <pre class="code-block">const city = 'Lisbon';      // a constant — cannot be reassigned
let   temp = 21;            // a variable — can be reassigned
temp = 23;                  // fine

// city = 'Porto';          // error: assignment to constant</pre>
  <div class="callout">
    <strong>Rule of thumb</strong>
    <p>Default to <span class="ic">const</span>. Only use <span class="ic">let</span> when you truly reassign. The old <span class="ic">var</span> is historical — avoid it in new code.</p>
  </div>
  <h2>Core data types</h2>
  <table>
    <tr><th>Type</th><th>Example</th><th>Notes</th></tr>
    <tr><td>string</td><td>'hello'</td><td>Text in quotes</td></tr>
    <tr><td>number</td><td>21, 3.14</td><td>Integers and decimals</td></tr>
    <tr><td>boolean</td><td>true / false</td><td>Yes / no</td></tr>
    <tr><td>null</td><td>null</td><td>Intentionally empty</td></tr>
    <tr><td>undefined</td><td>undefined</td><td>Not assigned yet</td></tr>
    <tr><td>array</td><td>[1, 2, 3]</td><td>Ordered list</td></tr>
    <tr><td>object</td><td>{ name: 'Lia' }</td><td>Key / value map</td></tr>
  </table>
  <h2>Operators</h2>
  <p>Arithmetic: <span class="ic">+ - * / %</span>. Comparison: <span class="ic">=== !== &lt; &gt;</span>. Logic: <span class="ic">&amp;&amp; || !</span>.</p>
  <pre class="code-block">console.log(7 % 3);          // 1 — remainder
console.log(10 === '10');    // false — strict (type-aware) equality
console.log(10 == '10');     // true — loose equality, avoid this
const isWarm = temp &gt;= 20 && temp &lt;= 28;</pre>
  <p>Arrays and objects let you store collections:</p>
  <pre class="code-block">const days = ['Mon', 'Tue', 'Wed'];
days.push('Thu');                    // add to the end
console.log(days[1]);                // 'Tue'

const forecast = { city: 'Lisbon', temp: 23, rain: false };
console.log(forecast.city);          // 'Lisbon'</pre>
  <div class="callout callout-info">
    <strong>typeof</strong>
    <p><span class="ic">typeof value</span> tells you a value&rsquo;s type. It is invaluable while debugging.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '40000000-0000-4000-8000-000000000404',
  '40000000-0000-4000-8000-000000000304',
  1,
  'Functions',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Functions</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f59e0b; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b45309; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fffbeb; color: #b45309; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fbbf24; }
.dark .lesson-page h2 { color: #fcd34d; }
.dark .lesson-page .ic { background: #451a03; color: #fcd34d; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Functions</h1>
  <p>A function is a reusable block of behavior that accepts inputs (<em>parameters</em>) and can return an output (<em>return value</em>).</p>
  <pre class="code-block">function celsiusToFahrenheit(c) {
  return c * 9 / 5 + 32;
}

console.log(celsiusToFahrenheit(25));   // 77</pre>
  <h2>Parameters and defaults</h2>
  <p>Parameters behave like local variables. You can give them default values that apply when callers omit them:</p>
  <pre class="code-block">function greet(name, greeting = 'Hello') {
  return greeting + ', ' + name + '!';
}

greet('Ana');            // 'Hello, Ana!'
greet('Ana', 'Hi');      // 'Hi, Ana!'</pre>
  <h2>Return values</h2>
  <ul>
    <li>A function <em>without</em> a <span class="ic">return</span> returns <span class="ic">undefined</span>.</li>
    <li><span class="ic">return</span> stops the function immediately.</li>
    <li>Return <em>early</em> to guard against bad input.</li>
  </ul>
  <pre class="code-block">function ratio(a, b) {
  if (b === 0) return null;    // guard clause
  return a / b;
}</pre>
  <h2>Scope</h2>
  <p>Variables declared inside a function are <strong>local</strong> to it. Variables declared at the top level are <strong>global</strong> and visible everywhere — use them sparingly.</p>
  <pre class="code-block">const unit = 'km/h';              // global

function speedLabel(value) {
  const rounded = Math.round(value);   // local
  return rounded + ' ' + unit;         // can read global
}

// console.log(rounded);  // ReferenceError: not defined</pre>
  <div class="callout callout-tip">
    <strong>One job per function</strong>
    <p>Small functions with descriptive names (e.g. <span class="ic">formatTemperature</span>) are easier to test and reuse. If a function is doing three things, split it.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '40000000-0000-4000-8000-000000000405',
  '40000000-0000-4000-8000-000000000305',
  1,
  'Control Flow & Loops',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Control Flow & Loops</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f59e0b; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b45309; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fffbeb; color: #b45309; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fbbf24; }
.dark .lesson-page h2 { color: #fcd34d; }
.dark .lesson-page .ic { background: #451a03; color: #fcd34d; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Control Flow &amp; Loops</h1>
  <p>Programs make decisions with <strong>conditionals</strong> and repeat work with <strong>loops</strong>.</p>
  <h2>if / else if / else</h2>
  <pre class="code-block">const temp = 5;

if (temp &lt;= 0) {
  console.log('Freezing!');
} else if (temp &lt; 20) {
  console.log('Cool and crisp.');
} else {
  console.log('Warm enough.');
}</pre>
  <h2>switch</h2>
  <p>For comparing one value against many exact options, <span class="ic">switch</span> reads nicely:</p>
  <pre class="code-block">const wind = 'storm';

switch (wind) {
  case 'calm':     console.log('No wind');   break;
  case 'breeze':   console.log('Light air'); break;
  case 'storm':    console.log('Seek shelter'); break;
  default:         console.log('Unknown');   break;
}</pre>
  <h2>Loops</h2>
  <p><span class="ic">for</span> counts; <span class="ic">while</span> repeats until a condition becomes false:</p>
  <pre class="code-block">for (let day = 1; day &lt;= 5; day++) {
  console.log('Day', day);
}

let energy = 100;
while (energy &gt; 0) {
  console.log('Running... energy =', energy);
  energy -= 25;
}</pre>
  <p>For arrays, <span class="ic">for...of</span> is the cleanest:</p>
  <pre class="code-block">const temps = [18, 22, 25, 19];
let total = 0;

for (const t of temps) {
  total += t;
}

console.log(total / temps.length);   // average = 21</pre>
  <div class="callout callout-info">
    <strong>break and continue</strong>
    <p><span class="ic">break</span> exits a loop entirely; <span class="ic">continue</span> skips to the next iteration. Use them to avoid nested conditionals.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Infinite loops</strong>
    <p>Always make sure your loop condition eventually becomes false — a missing increment is the most common cause of a frozen tab.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '40000000-0000-4000-8000-000000000407',
  '40000000-0000-4000-8000-000000000307',
  1,
  'Selecting Elements',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Selecting Elements</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f59e0b; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b45309; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fffbeb; color: #b45309; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fbbf24; }
.dark .lesson-page h2 { color: #fcd34d; }
.dark .lesson-page .ic { background: #451a03; color: #fcd34d; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Selecting Elements</h1>
  <p>Before you can change the page, you must <strong>find</strong> elements. The <span class="ic">document</span> object exposes several methods.</p>
  <h2>By id, selector, or class</h2>
  <pre class="code-block">// Single element by id
const title = document.getElementById('app-title');

// First match for any CSS selector
const searchBtn = document.querySelector('button.search');

// All matches — returns a NodeList
const cards = document.querySelectorAll('.card');
const headings = document.querySelectorAll('h2');</pre>
  <div class="callout">
    <strong>querySelector returns null</strong>
    <p>If nothing matches, <span class="ic">querySelector</span> returns <span class="ic">null</span>. Always check before using the result, or you will hit a &ldquo;cannot read property&rdquo; error.</p>
  </div>
  <h2>Walking the tree</h2>
  <p>From an element you can reach its relatives:</p>
  <pre class="code-block">card.children;       // child elements
card.parentElement;  // parent element
card.nextElementSibling; // the next sibling
card.closest('.row');     // nearest ancestor matching a selector</pre>
  <h2>NodeList vs array</h2>
  <p><span class="ic">querySelectorAll</span> returns a <span class="ic">NodeList</span>, which supports <span class="ic">forEach</span> but not <span class="ic">map</span> directly. Convert it when you need array methods:</p>
  <pre class="code-block">const texts = [...document.querySelectorAll('.card')]
  .map(card =&gt; card.textContent);</pre>
  <div class="callout callout-tip">
    <strong>Scope selection</strong>
    <p>Prefetch a container once, then select within it: <span class="ic">list.querySelectorAll('li')</span>. It is faster and less likely to grab the wrong element.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '40000000-0000-4000-8000-000000000408',
  '40000000-0000-4000-8000-000000000308',
  1,
  'Modifying Content & Attributes',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Modifying Content & Attributes</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f59e0b; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b45309; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fffbeb; color: #b45309; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fbbf24; }
.dark .lesson-page h2 { color: #fcd34d; }
.dark .lesson-page .ic { background: #451a03; color: #fcd34d; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Modifying Content &amp; Attributes</h1>
  <p>Once you have an element reference, updating it is straightforward.</p>
  <h2>Text vs HTML</h2>
  <pre class="code-block">el.textContent = 'New text';       // safe — treats it as plain text
el.innerHTML = '&lt;strong&gt;HTML&lt;/strong&gt;'; // powerful but injects markup</pre>
  <div class="callout">
    <strong>Security</strong>
    <p>Never put user input into <span class="ic">innerHTML</span> — it enables XSS (script injection). Use <span class="ic">textContent</span> for anything a user or an API could supply.</p>
  </div>
  <h2>Attributes and styles</h2>
  <pre class="code-block">img.src = 'weather.png';
img.alt = 'Sunny icon';
input.disabled = true;

el.classList.add('active');      // toggle / remove also available
el.style.backgroundColor = '#0ea5e9';</pre>
  <h2>Creating elements</h2>
  <p>Building elements in code keeps your markup predictable:</p>
  <pre class="code-block">const li = document.createElement('li');
li.textContent = forecast.city;

const list = document.getElementById('cities');
list.append(li);                       // append to end
list.prepend(li);                      // insert at start</pre>
  <h2>Removing nodes</h2>
  <pre class="code-block">const notice = document.querySelector('.notice');
notice.remove();

// or clear a whole container
list.replaceChildren();</pre>
  <div class="callout callout-tip">
    <strong>min vs max</strong>
    <p>Re-rendering an entire list on every change causes layout thrash. Prefer updating only the nodes that actually changed.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '40000000-0000-4000-8000-000000000410',
  '40000000-0000-4000-8000-000000000310',
  1,
  'Events & Event Listeners',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Events & Event Listeners</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f59e0b; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b45309; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fffbeb; color: #b45309; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fbbf24; }
.dark .lesson-page h2 { color: #fcd34d; }
.dark .lesson-page .ic { background: #451a03; color: #fcd34d; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Events &amp; Event Listeners</h1>
  <p>Events are how JavaScript notices user interaction: clicks, keystrokes, mouse movement, form submission, and more.</p>
  <h2>addEventListener</h2>
  <pre class="code-block">const btn = document.getElementById('refresh');

btn.addEventListener('click', () =&gt; {
  console.log('Refreshing...');
});</pre>
  <p>The <em>event object</em> carries details about what happened:</p>
  <pre class="code-block">document.addEventListener('keydown', (event) =&gt; {
  console.log('Key pressed:', event.key);   // e.g. 'Enter'
  if (event.key === 'Escape') closeModal();
});</pre>
  <h2>Common events</h2>
  <table>
    <tr><th>Event</th><th>Fires when…</th></tr>
    <tr><td>click</td><td>an element is clicked</td></tr>
    <tr><td>submit</td><td>a form is submitted</td></tr>
    <tr><td>input</td><td>a field changes value</td></tr>
    <tr><td>change</td><td>a field loses focus with new value</td></tr>
    <tr><td>keydown / keyup</td><td>a key is pressed / released</td></tr>
    <tr><td>DOMContentLoaded</td><td>the HTML has been parsed</td></tr>
  </table>
  <h2>Event delegation</h2>
  <p>For many dynamic elements, listen on the <em>parent</em> once instead of each child:</p>
  <pre class="code-block">list.addEventListener('click', (event) =&gt; {
  const item = event.target.closest('li');   // walk up
  if (!item) return;                          // not a list item
  console.log('Clicked:', item.textContent);
});</pre>
  <div class="callout callout-tip">
    <strong>Why delegation wins</strong>
    <p>Items added later still work, and you attach one listener instead of hundreds. This is the standard pattern for dynamic UIs.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '40000000-0000-4000-8000-000000000411',
  '40000000-0000-4000-8000-000000000311',
  1,
  'Forms & Input Handling',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Forms & Input Handling</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f59e0b; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b45309; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fffbeb; color: #b45309; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fbbf24; }
.dark .lesson-page h2 { color: #fcd34d; }
.dark .lesson-page .ic { background: #451a03; color: #fcd34d; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Forms &amp; Input Handling</h1>
  <p>Forms give users a way to send data into your application. Your job in JavaScript is to read that data, validate it, and act on it — <em>without</em> reloading the page.</p>
  <h2>Catching the submit event</h2>
  <pre class="code-block">const form = document.getElementById('city-form');

form.addEventListener('submit', (event) =&gt; {
  event.preventDefault();   // stop the browser from reloading

  const cityInput = document.getElementById('city');
  console.log('Searching for:', cityInput.value.trim());
});</pre>
  <div class="callout">
    <strong>Always preventDefault</strong>
    <p>Submitting a form naturally navigates the page. Calling <span class="ic">event.preventDefault()</span> keeps the user on the page so your code can handle the data instead.</p>
  </div>
  <h2>Reading input values</h2>
  <pre class="code-block">const input   = document.getElementById('city');
const unitSel = document.getElementById('unit');
const remember = document.getElementById('remember');

const city   = input.value.trim();
const unit   = unitSel.value;          // 'metric' | 'imperial'
const memory = remember.checked;       // boolean</pre>
  <h2>Validating input</h2>
  <pre class="code-block">function validateCity(value) {
  if (!value) return 'City name is required.';
  if (value.length &lt; 2) return 'City must be at least 2 characters.';
  return null;                          // null = valid
}</pre>
  <p>Show the error message inline and prevent the request:</p>
  <pre class="code-block">const error = validateCity(city);
if (error) {
  document.getElementById('error-message').textContent = error;
  return;
}
document.getElementById('error-message').textContent = '';</pre>
  <div class="callout callout-tip">
    <strong>trim everything</strong>
    <p>Users paste stray spaces. <span class="ic">value.trim()</span> removes leading and trailing whitespace before you search — a tiny fix that prevents a surprising class of bugs.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '40000000-0000-4000-8000-000000000413',
  '40000000-0000-4000-8000-000000000313',
  1,
  'Arrow Functions & Destructuring',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Arrow Functions & Destructuring</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f59e0b; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b45309; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fffbeb; color: #b45309; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fbbf24; }
.dark .lesson-page h2 { color: #fcd34d; }
.dark .lesson-page .ic { background: #451a03; color: #fcd34d; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Arrow Functions &amp; Destructuring</h1>
  <p>Modern JavaScript gives you terser, more expressive ways to write everyday code.</p>
  <h2>Arrow functions</h2>
  <pre class="code-block">// Traditional
function double(x) { return x * 2; }

// Arrow, full form
const double = (x) =&gt; { return x * 2; };

// Arrow, implicit return (single expression)
const double = x =&gt; x * 2;

// Inline callback
const squares = [1, 2, 3].map(n =&gt; n * n);</pre>
  <h2>Object and array destructuring</h2>
  <p>Unpack values straight into variables:</p>
  <pre class="code-block">const forecast = { city: 'Oslo', temp: 10, wind: { speed: 4 } };

const { city, temp, wind } = forecast;
console.log(city, temp);      // Oslo 10

const units = ['metric', 'imperial'];
const [metric, imperial] = units;

// Rename + defaults
const { city: name = 'Unknown' } = forecast;</pre>
  <h2>Rest and spread</h2>
  <pre class="code-block">function sum(...numbers) {           // rest: collects args
  return numbers.reduce((a, b) =&gt; a + b, 0);
}

const base = { name: 'box' };
const styled = { ...base, color: 'blue' };   // spread: copy + extend</pre>
  <div class="callout callout-info">
    <strong>this in arrows</strong>
    <p>Arrow functions do <em>not</em> create their own <span class="ic">this</span> — they inherit it from the surrounding scope. That makes them ideal for callbacks inside classes and event handlers.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '40000000-0000-4000-8000-000000000414',
  '40000000-0000-4000-8000-000000000314',
  1,
  'Template Literals & Modules',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Template Literals & Modules</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f59e0b; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b45309; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fffbeb; color: #b45309; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fbbf24; }
.dark .lesson-page h2 { color: #fcd34d; }
.dark .lesson-page .ic { background: #451a03; color: #fcd34d; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Template Literals &amp; Modules</h1>
  <p>Two features that make modern JavaScript dramatically more pleasant: backtick strings and import/export.</p>
  <h2>Template literals</h2>
  <pre class="code-block">const city = 'Oslo';
const temp = 10;

// Old style — painful concatenation
const oldStyle = 'It is ' + temp + '&deg;C in ' + city + '.';

// Template literal — reads like the sentence it produces
const message = `It is ${temp}&deg;C in ${city}.`;

// Multi-line strings for free
const card = `
  &lt;div class="card"&gt;
    &lt;h2&gt;${city}&lt;/h2&gt;
    &lt;p&gt;${temp}&deg;C&lt;/p&gt;
  &lt;/div&gt;
`;</pre>
  <div class="callout callout-tip">
    <strong>Beware injection</strong>
    <p>Interpolating user data into <span class="ic">innerHTML</span> is unsafe. Use <span class="ic">textContent</span> when the value could come from a user or an API.</p>
  </div>
  <h2>Modules</h2>
  <p>ES modules let you split code across files. The script tag opts in with <span class="ic">type="module"</span>:</p>
  <pre class="code-block">&lt;script type="module" src="app.js"&gt;&lt;/script&gt;</pre>
  <pre class="code-block">// weather.js — named exports
export function formatTemp(c, unit = 'metric') {
  return unit === 'metric' ? `${c}&deg;C` : `${c * 9 / 5 + 32}&deg;F`;
}

// app.js — import
import { formatTemp } from './weather.js';

console.log(formatTemp(25));       // '25°C'</pre>
  <p>Modules load asynchronously and are strictly scoped — nothing leaks to the global object.</p>
  <div class="callout callout-info">
    <strong>One default export</strong>
    <p><span class="ic">export default</span> names the &ldquo;main&rdquo; thing a file provides; named imports are explicit and auto-importable in editors. Prefer named where possible.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '40000000-0000-4000-8000-000000000416',
  '40000000-0000-4000-8000-000000000316',
  1,
  'Errors & Exception Handling',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Errors & Exception Handling</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f59e0b; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b45309; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fffbeb; color: #b45309; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fbbf24; }
.dark .lesson-page h2 { color: #fcd34d; }
.dark .lesson-page .ic { background: #451a03; color: #fcd34d; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Errors &amp; Exception Handling</h1>
  <p>Code fails. Network requests drop, inputs are invalid, data is missing. Handling failure gracefully is what separates prototype code from production code.</p>
  <h2>throw and try/catch</h2>
  <pre class="code-block">function divide(a, b) {
  if (b === 0) {
    throw new Error('Division by zero is not allowed.');
  }
  return a / b;
}

try {
  console.log(divide(10, 0));
} catch (error) {
  console.error('Something failed:', error.message);
} finally {
  console.log('This always runs.');
}</pre>
  <ul>
    <li><span class="ic">throw</span> — raise an error with a descriptive message.</li>
    <li><span class="ic">try</span> — the risky code.</li>
    <li><span class="ic">catch</span> — handle the failure; <span class="ic">error.message</span> carries the reason.</li>
    <li><span class="ic">finally</span> — cleanup (close cursors, reset state) that runs either way.</li>
  </ul>
  <h2>Error objects</h2>
  <pre class="code-block">try {
  JSON.parse('{bad json');
} catch (error) {
  console.log(error.name);      // 'SyntaxError'
  console.log(error.message);   // details from the parser
} finally {
  console.log('Attempt finished.');
}</pre>
  <div class="callout callout-tip">
    <strong>Fail early, fail loud</strong>
    <p>Validate inputs at the top of a function and <span class="ic">throw</span> with an action-oriented message (&ldquo;Provide a city name&rdquo;). Loud failures are debuggable; silent ones are time sinks.</p>
  </div>
  <h2>Where NOT to use try/catch</h2>
  <p>Do not wrap simple math or string ops that cannot realistically fail. Reserve <span class="ic">try/catch</span> for operations with external uncertainty: parsing, JSON, storage, and network calls.</p>
</div>
</body>
</html>
$html$
),
(
  '40000000-0000-4000-8000-000000000417',
  '40000000-0000-4000-8000-000000000317',
  1,
  'Promises & async/await',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Promises & async/await</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f59e0b; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b45309; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fffbeb; color: #b45309; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fbbf24; }
.dark .lesson-page h2 { color: #fcd34d; }
.dark .lesson-page .ic { background: #451a03; color: #fcd34d; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Promises &amp; async/await</h1>
  <p>Some operations finish later: reading a file, calling an API, waiting 2 seconds. JavaScript models &ldquo;later&rdquo; with <strong>Promises</strong> — objects representing a value that will exist at some point in the future.</p>
  <h2>Promises</h2>
  <p>A promise is either <em>pending</em>, <em>fulfilled</em>, or <em>rejected</em>. You attach reactions:</p>
  <pre class="code-block">fetchTemp('Oslo')
  .then(temp =&gt; console.log(temp))
  .catch(error =&gt; console.error(error.message))
  .finally(() =&gt; hideSpinner());</pre>
  <h2>async/await — the readable version</h2>
  <p>Await pauses an <span class="ic">async</span> function until the promise settles:</p>
  <pre class="code-block">async function showTemp(city) {
  showSpinner();
  try {
    const temp = await fetchTemp(city);
    renderTemp(temp);
  } catch (error) {
    renderError(error.message);
  } finally {
    hideSpinner();
  }
}</pre>
  <div class="callout callout-info">
    <strong>await only inside async</strong>
    <p>Every function that uses <span class="ic">await</span> must be declared <span class="ic">async</span>. An <span class="ic">async</span> function always returns a promise.</p>
  </div>
  <h2>Parallel work</h2>
  <p>Fire independent requests in parallel and wait for all of them:</p>
  <pre class="code-block">const [today, forecast] = await Promise.all([
  fetchDaily(city),
  fetchForecast(city),
]);

console.log(today.temp, forecast.list.length);</pre>
  <div class="callout callout-tip">
    <strong>Don&rsquo;t await in a loop</strong>
    <p>Sequential awaits on independent requests waste time. Collect the promises, then use <span class="ic">Promise.all</span>.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '40000000-0000-4000-8000-000000000419',
  '40000000-0000-4000-8000-000000000319',
  1,
  'The Fetch API',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Fetch API</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f59e0b; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b45309; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fffbeb; color: #b45309; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fbbf24; }
.dark .lesson-page h2 { color: #fcd34d; }
.dark .lesson-page .ic { background: #451a03; color: #fcd34d; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>The Fetch API</h1>
  <p><span class="ic">fetch()</span> is the browser&rsquo;s built-in way to make HTTP requests. It returns a promise that resolves once the server has <em>responded</em> (not necessarily successfully).</p>
  <h2>Basic GET</h2>
  <pre class="code-block">const res = await fetch('https://example.com/api/weather');

if (!res.ok) {
  throw new Error(`Request failed: ${res.status}`);
}

const data = await res.json();
console.log(data);</pre>
  <h2>Check res.ok</h2>
  <div class="callout">
    <strong>HTTP 404 still resolves</strong>
    <p><span class="ic">fetch</span> only rejects on a <em>network</em> failure. A 404 or 500 response fulfills the promise — so you must check <span class="ic">res.ok</span> (or <span class="ic">res.status</span>) yourself.</p>
  </div>
  <h2>Sending a POST</h2>
  <pre class="code-block">const res = await fetch('/api/favorites', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({ city: 'Oslo' }),
});

if (!res.ok) throw new Error(`Failed to save: ${res.status}`);</pre>
  <h2>Handling both failure modes</h2>
  <pre class="code-block">async function getJSON(url) {
  let res;
  try {
    res = await fetch(url);
  } catch {
    throw new Error('Network error — are you online?');
  }
  if (!res.ok) {
    throw new Error(`Server responded with ${res.status}`);
  }
  return res.json();
}</pre>
  <div class="callout callout-tip">
    <strong>AbortController for timeouts</strong>
    <p>Slow requests hang forever by default. Pass a <span class="ic">signal</span> from an <span class="ic">AbortController</span> to cancel after a timeout — you will add this to your weather app capstone.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '40000000-0000-4000-8000-000000000420',
  '40000000-0000-4000-8000-000000000320',
  1,
  'JSON & REST Conventions',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JSON & REST Conventions</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f59e0b; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b45309; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fffbeb; color: #b45309; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fbbf24; }
.dark .lesson-page h2 { color: #fcd34d; }
.dark .lesson-page .ic { background: #451a03; color: #fcd34d; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>JSON &amp; REST Conventions</h1>
  <p>JSON (JavaScript Object Notation) is the de-facto data format for APIs. It mirrors JavaScript objects, so parsing it in a browser is effortless.</p>
  <h2>JSON shape</h2>
  <pre class="code-block">{
  "city": "Oslo",
  "country": "NO",
  "temp": 10,
  "units": "metric",
  "forecast": [
    { "day": "Mon", "temp_max": 12, "temp_min": 6 },
    { "day": "Tue", "temp_max": 14, "temp_min": 8 }
  ]
}</pre>
  <ul>
    <li>Keys must be double-quoted strings.</li>
    <li>Trailing commas are <em>not</em> allowed.</li>
    <li><span class="ic">true/false/null</span> must be lowercase.</li>
  </ul>
  <h2>Parse and stringify</h2>
  <pre class="code-block">const parsed = JSON.parse(text);          // string → object
const text = JSON.stringify(obj);         // object → string</pre>
  <div class="callout callout-tip">
    <strong>Guard against bad JSON</strong>
    <p><span class="ic">JSON.parse</span> throws on malformed input. Wrap API calls in <span class="ic">try/catch</span> and treat shape-errors as a first-class failure.</p>
  </div>
  <h2>REST conventions</h2>
  <p>REST APIs expose <em>resources</em> via URLs and HTTP methods:</p>
  <table>
    <tr><th>Method</th><th>Meaning</th><th>Example</th></tr>
    <tr><td>GET</td><td>read</td><td>GET /cities/oslo</td></tr>
    <tr><td>POST</td><td>create</td><td>POST /cities</td></tr>
    <tr><td>PUT / PATCH</td><td>update</td><td>PATCH /cities/oslo</td></tr>
    <tr><td>DELETE</td><td>remove</td><td>DELETE /cities/oslo</td></tr>
  </table>
  <p>Status codes tell you the outcome: <span class="ic">200/201</span> success, <span class="ic">400/404</span> client errors, <span class="ic">500</span> server errors.</p>
  <div class="callout callout-info">
    <strong>Read the docs</strong>
    <p>Every API returns its own shape (some nest data deeper than others). Fetch the raw response in DevTools Network tab to see the real structure before you write render code.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '40000000-0000-4000-8000-000000000422',
  '40000000-0000-4000-8000-000000000322',
  1,
  'Building a Request Helper',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Building a Request Helper</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f59e0b; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b45309; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fffbeb; color: #b45309; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fbbf24; }
.dark .lesson-page h2 { color: #fcd34d; }
.dark .lesson-page .ic { background: #451a03; color: #fcd34d; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Building a Request Helper</h1>
  <p>Repeated <span class="ic">fetch</span> boilerplate lives in one place: a small wrapper that handles errors, timeouts, and parsing consistently.</p>
  <h2>A minimal request helper</h2>
  <pre class="code-block">const TIMEOUT_MS = 8000;

export async function request(url, options = {}) {
  const controller = new AbortController();
  const timer = setTimeout(() =&gt; controller.abort(), TIMEOUT_MS);

  try {
    const res = await fetch(url, {
      ...options,
      signal: controller.signal,
      headers: { 'Content-Type': 'application/json', ...options.headers },
    });

    if (!res.ok) {
      throw new Error(`Request failed with status ${res.status}`);
    }

    return res.status === 204 ? null : res.json();
  } catch (error) {
    if (error.name === 'AbortError') {
      throw new Error('The request timed out. Please try again.');
    }
    throw error;
  } finally {
    clearTimeout(timer);
  }
}</pre>
  <h2>Using the helper</h2>
  <pre class="code-block">import { request } from './http.js';

export async function getWeather(city) {
  const data = await request(
    `https://api.example.com/weather?city=${encodeURIComponent(city)}`
  );
  return data;
}</pre>
  <div class="callout callout-tip">
    <strong>encodeURIComponent</strong>
    <p>Always encode dynamic path/query values. A city like &ldquo;San Francisco&rdquo; contains a space and the character <span class="ic">&amp;</span> in some names breaks URLs.</p>
  </div>
  <div class="callout callout-info">
    <strong>Only one concern</strong>
    <p>This helper does <em>one</em> thing: turn a URL into parsed JSON (or a clear error). Keeping it generic lets a search page and a favorites page reuse it unchanged.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '40000000-0000-4000-8000-000000000423',
  '40000000-0000-4000-8000-000000000323',
  1,
  'Rendering API Data',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Rendering API Data</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f59e0b; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b45309; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fffbeb; color: #b45309; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fbbf24; }
.dark .lesson-page h2 { color: #fcd34d; }
.dark .lesson-page .ic { background: #451a03; color: #fcd34d; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Rendering API Data</h1>
  <p>Data is useless until it reaches the user. A reliable renderer separates three concerns: <strong>fetch</strong>, <strong>transform</strong>, and <strong>paint</strong>.</p>
  <h2>1. Fetch</h2>
  <pre class="code-block">const data = await getWeather(city);</pre>
  <h2>2. Transform into presentational model</h2>
  <p>APIs rarely return exactly what you want to display. Map to your own shape:</p>
  <pre class="code-block">function toViewModel(raw) {
  return {
    city: raw.name,
    temp: Math.round(raw.main.temp),
    feels: Math.round(raw.main.feels_like),
    description: raw.weather[0].description,
    humidity: raw.main.humidity,
  };
}</pre>
  <h2>3. Paint safely with textContent</h2>
  <pre class="code-block">function renderWeather(model) {
  document.getElementById('city').textContent = model.city;
  document.getElementById('temp').textContent = `${model.temp}&deg;C`;
  document.getElementById('desc').textContent = model.description;
  document.getElementById('humidity').textContent = `${model.humidity}%`;
}</pre>
  <div class="callout">
    <strong>Drive UI from data, not HTML scraping</strong>
    <p>Create a fresh element per item and fill it with <span class="ic">textContent</span>. This avoids stale state and injection bugs.</p>
  </div>
  <h2>Rendering lists</h2>
  <pre class="code-block">function renderForecast(days) {
  const list = document.getElementById('forecast');
  list.replaceChildren();               // clear previous

  for (const day of days) {
    const li = document.createElement('li');
    li.textContent = `${day.day}: ${day.tempMax}&deg;C`;
    list.append(li);
  }
}</pre>
  <div class="callout callout-tip">
    <strong>replaceChildren is atomic</strong>
    <p>One call replaces the whole list — no flicker, no leftover stale entries from the previous search.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '40000000-0000-4000-8000-000000000425',
  '40000000-0000-4000-8000-000000000325',
  1,
  'Project Setup & API Key',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Project Setup & API Key</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f59e0b; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b45309; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fffbeb; color: #b45309; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fbbf24; }
.dark .lesson-page h2 { color: #fcd34d; }
.dark .lesson-page .ic { background: #451a03; color: #fcd34d; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Project Setup &amp; API Key</h1>
  <p>Time to build the capstone: a weather app that searches a real API. You will use OpenWeatherMap&rsquo;s free tier — no card required.</p>
  <h2>Project structure</h2>
  <pre class="code-block">weather-app/
  index.html
  styles.css
  http.js        // the request helper from module 4
  app.js         // entry point — wires everything together
  weather.js     // API functions and view-model mapping</pre>
  <h2>Get an API key</h2>
  <ol>
    <li>Create a free account at openweathermap.org.</li>
    <li>Go to &ldquo;API keys&rdquo; and copy your default key.</li>
    <li>Verify it in the browser:</li>
  </ol>
  <pre class="code-block">const URL =
  'https://api.openweathermap.org/data/2.5/weather' +
  '?q=Lisbon&units=metric&appid=YOUR_KEY';

const data = await fetch(URL).then(r =&gt; r.json());
console.log(data.main.temp);   // e.g. 22.4</pre>
  <div class="callout">
    <strong>Security warning</strong>
    <p>Browser code is <em>public</em> — a key embedded in JS is exposed to anyone. Free-tier keys are fine for learning; for production route calls through your own backend.</p>
  </div>
  <h2>Wire the files</h2>
  <pre class="code-block">&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
&lt;head&gt;
  &lt;meta charset="UTF-8"&gt;
  &lt;meta name="viewport" content="width=device-width, initial-scale=1.0"&gt;
  &lt;title&gt;Weather App&lt;/title&gt;
  &lt;link rel="stylesheet" href="styles.css"&gt;
&lt;/head&gt;
&lt;body&gt;
  &lt;form id="city-form"&gt;
    &lt;input id="city" placeholder="Search a city"&gt;
    &lt;button&gt;Search&lt;/button&gt;
  &lt;/form&gt;
  &lt;p id="error-message"&gt;&lt;/p&gt;
  &lt;div id="weather" hidden&gt;&lt;/div&gt;
  &lt;div id="spinner" hidden&gt;Loading…&lt;/div&gt;
  &lt;script type="module" src="app.js"&gt;&lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;</pre>
  <div class="callout callout-tip">
    <strong>type="module"</strong>
    <p>You import <span class="ic">http.js</span> and <span class="ic">weather.js</span>, so the script tag must be marked <span class="ic">type="module"</span>.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '40000000-0000-4000-8000-000000000426',
  '40000000-0000-4000-8000-000000000326',
  1,
  'Building the Weather App UI',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Building the Weather App UI</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f59e0b; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b45309; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fffbeb; color: #b45309; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fbbf24; }
.dark .lesson-page h2 { color: #fcd34d; }
.dark .lesson-page .ic { background: #451a03; color: #fcd34d; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Building the Weather App UI</h1>
  <p>Assemble the pieces into one cohesive app: the module script wires the form, the API functions, and the renderers.</p>
  <h2>app.js — entry point</h2>
  <pre class="code-block">import { getWeather } from './weather.js';
import { renderWeather, renderError, showLoading, hideLoading } from './ui.js';

const form = document.getElementById('city-form');
const input = document.getElementById('city');

form.addEventListener('submit', async (event) =&gt; {
  event.preventDefault();
  const city = input.value.trim();
  if (!city) return;

  showLoading();
  renderError('');
  try {
    const data = await getWeather(city);
    renderWeather(toViewModel(data));
  } catch (error) {
    renderError(error.message);
  } finally {
    hideLoading();
  }
});</pre>
  <h2>weather.js — API + view model</h2>
  <pre class="code-block">import { request } from './http.js';

const BASE =
  'https://api.openweathermap.org/data/2.5/weather';
const KEY = 'YOUR_API_KEY';   // free tier

export async function getWeather(city) {
  const data = await request(
    `${BASE}?q=${encodeURIComponent(city)}&units=metric&appid=${KEY}`
  );
  return {
    city: data.name,
    temp: Math.round(data.main.temp),
    description: data.weather[0].description,
    humidity: data.main.humidity,
  };
}</pre>
  <h2>ui.js — renderers</h2>
  <pre class="code-block">const box = document.getElementById('weather');

export function renderWeather(m) {
  box.hidden = false;
  box.innerHTML = '';    // start clean
  const h2 = document.createElement('h2');
  h2.textContent = m.city;
  const p = document.createElement('p');
  p.textContent = `${m.temp}&deg;C — ${m.description}`;
  box.append(h2, p);
}

export function renderError(msg) {
  document.getElementById('error-message').textContent = msg;
}</pre>
  <div class="callout callout-tip">
    <strong>Clear before render</strong>
    <p>Always reset the container before painting new data. A leftover card from the last search confuses users.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '40000000-0000-4000-8000-000000000427',
  '40000000-0000-4000-8000-000000000327',
  1,
  'Loading States & Error Handling',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Loading States & Error Handling</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f59e0b; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b45309; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fffbeb; color: #b45309; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fbbf24; }
.dark .lesson-page h2 { color: #fcd34d; }
.dark .lesson-page .ic { background: #451a03; color: #fcd34d; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Loading States &amp; Error Handling</h1>
  <p>A polished app never stalls silently and never shows raw red text. You track two things while a request is in flight: <strong>is it loading?</strong> and <strong>did it fail?</strong></p>
  <h2>Toggle loading</h2>
  <pre class="code-block">function showLoading() {
  document.getElementById('spinner').hidden = false;
  document.getElementById('weather').hidden = true;
}

function hideLoading() {
  document.getElementById('spinner').hidden = true;
}</pre>
  <h2>Display human errors</h2>
  <pre class="code-block">const friendly = {
  'not found': 'City not found — check the spelling.',
  'timed out': 'The request timed out. Try again.',
  'Network error': 'No connection. Are you online?',
};

export function renderError(raw) {
  for (const [key, message] of Object.entries(friendly)) {
    if (raw.toLowerCase().includes(key.toLowerCase())) {
      document.getElementById('error-message').textContent = message;
      return;
    }
  }
  document.getElementById('error-message').textContent = raw;
}</pre>
  <div class="callout">
    <strong>Never echo raw server errors to users</strong>
    <p>Map common failures to friendly copy and log the technical detail to the console for debugging.</p>
  </div>
  <h2>The three-state UI</h2>
  <ul>
    <li><strong>Idle</strong> — empty state &ldquo;Search for a city&hellip;&rdquo;</li>
    <li><strong>Loading</strong> — spinner visible, form still usable</li>
    <li><strong>Loaded or Error</strong> — content (or message) replaces the spinner</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Disable double submits</strong>
    <p>Set the button&rsquo;s <span class="ic">disabled</span> while loading so a user cannot fire five requests for the same city.</p>
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
  ('40000000-0000-4000-8000-000000000501', '40000000-0000-4000-8000-000000000303',
   'Which keyword declares a block-scoped constant binding?',
   'const declares a binding whose value cannot be reassigned.', 1),
  ('40000000-0000-4000-8000-000000000502', '40000000-0000-4000-8000-000000000303',
   'What does typeof "42" return?',
   'The value is a string, so typeof returns "string".', 2),
  ('40000000-0000-4000-8000-000000000503', '40000000-0000-4000-8000-000000000303',
   'Which equality operator compares both value AND type?',
   '=== is the strict operator used to avoid coercion surprises.', 3),
  ('40000000-0000-4000-8000-000000000504', '40000000-0000-4000-8000-000000000306',
   'What does a function without a return statement return?',
   'It returns undefined by default.', 1),
  ('40000000-0000-4000-8000-000000000505', '40000000-0000-4000-8000-000000000306',
   'Which statement stops a loop iteration immediately?',
   'continue skips the rest of the current iteration.', 2),
  ('40000000-0000-4000-8000-000000000506', '40000000-0000-4000-8000-000000000306',
   'Which loop is cleanest for iterating over an array?',
   'for...of reads each element directly, no index needed.', 3),
  ('40000000-0000-4000-8000-000000000507', '40000000-0000-4000-8000-000000000309',
   'What does document.querySelector(".card") return when nothing matches?',
   'It returns null, which must be guarded before use.', 1),
  ('40000000-0000-4000-8000-000000000508', '40000000-0000-4000-8000-000000000309',
   'Which is the safe way to insert plain text into an element?',
   'textContent treats the value as text, never markup.', 2),
  ('40000000-0000-4000-8000-000000000509', '40000000-0000-4000-8000-000000000309',
   'What does [...document.querySelectorAll("li")] do?',
   'Spreading a NodeList converts it to a plain array.', 3),
  ('40000000-0000-4000-8000-000000000510', '40000000-0000-4000-8000-000000000312',
   'Why call event.preventDefault() inside a submit handler?',
   'It stops the browser from reloading the page on submit.', 1),
  ('40000000-0000-4000-8000-000000000511', '40000000-0000-4000-8000-000000000312',
   'Which event fires with every keystroke in an input?',
   'input fires immediately while the user types.', 2),
  ('40000000-0000-4000-8000-000000000512', '40000000-0000-4000-8000-000000000312',
   'What is event delegation?',
   'Listening on a parent and handling matching descendants via event.target.', 3),
  ('40000000-0000-4000-8000-000000000513', '40000000-0000-4000-8000-000000000315',
   'Which syntax gives an implicit return?',
   'Arrow functions return the expression when written without braces.', 1),
  ('40000000-0000-4000-8000-000000000514', '40000000-0000-4000-8000-000000000315',
   'What does destructuring extract?',
   'It unpacks object properties or array items into variables.', 2),
  ('40000000-0000-4000-8000-000000000515', '40000000-0000-4000-8000-000000000315',
   'How do template literals embed JS expressions?',
   'Expressions inside ${...} are evaluated and inserted.', 3),
  ('40000000-0000-4000-8000-000000000516', '40000000-0000-4000-8000-000000000318',
   'Which finally-statement always runs?',
   'finally executes whether the try block succeeds or throws.', 1),
  ('40000000-0000-4000-8000-000000000517', '40000000-0000-4000-8000-000000000318',
   'What is a Promise?',
   'An object representing a value available now, later, or never.', 2),
  ('40000000-0000-4000-8000-000000000518', '40000000-0000-4000-8000-000000000318',
   'What does await do?',
   'It pauses an async function until a promise settles.', 3),
  ('40000000-0000-4000-8000-000000000519', '40000000-0000-4000-8000-000000000321',
   'When does fetch reject its promise?',
   'Only on network failure — HTTP errors still resolve.', 1),
  ('40000000-0000-4000-8000-000000000520', '40000000-0000-4000-8000-000000000321',
   'Which property tells you the HTTP status was successful?',
   'res.ok is true for status codes 200-299.', 2),
  ('40000000-0000-4000-8000-000000000521', '40000000-0000-4000-8000-000000000321',
   'What does res.json() return?',
   'A promise that resolves to the parsed JSON body.', 3),
  ('40000000-0000-4000-8000-000000000522', '40000000-0000-4000-8000-000000000324',
   'Why encode dynamic values in a URL?',
   'encodeURIComponent prevents spaces and special chars from breaking the URL.', 1),
  ('40000000-0000-4000-8000-000000000523', '40000000-0000-4000-8000-000000000324',
   'Which REST verb is used to read a resource?',
   'GET fetches a representation of the resource.', 2),
  ('40000000-0000-4000-8000-000000000524', '40000000-0000-4000-8000-000000000324',
   'What is a good way to avoid stale list data?',
   'replaceChildren() atomically clears and refills the container.', 3),
  ('40000000-0000-4000-8000-000000000525', '40000000-0000-4000-8000-000000000328',
   'Which declaration style is preferred by default?',
   'const — only use let when the value must be reassigned.', 1),
  ('40000000-0000-4000-8000-000000000526', '40000000-0000-4000-8000-000000000328',
   'What is the purpose of showing a spinner while fetching?',
   'It communicates that work is in progress, preventing confusion.', 2),
  ('40000000-0000-4000-8000-000000000527', '40000000-0000-4000-8000-000000000328',
   'Where should business logic like unit conversion live?',
   'In small pure functions that are easy to test and reuse.', 3),
  ('40000000-0000-4000-8000-000000000528', '40000000-0000-4000-8000-000000000328',
   'How should you handle a missing API key?',
   'Fail loudly with a clear message and log context to the console.', 4),
  ('40000000-0000-4000-8000-000000000529', '40000000-0000-4000-8000-000000000328',
   'Which practice keeps user input safe from injection?',
   'Always render user or API data via textContent.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): const
  ('40000000-0000-4000-8000-000000001001', '40000000-0000-4000-8000-000000000501', 'const', TRUE,  1),
  ('40000000-0000-4000-8000-000000001002', '40000000-0000-4000-8000-000000000501', 'var', FALSE, 2),
  ('40000000-0000-4000-8000-000000001003', '40000000-0000-4000-8000-000000000501', 'let', FALSE, 3),
  ('40000000-0000-4000-8000-000000001004', '40000000-0000-4000-8000-000000000501', 'static', FALSE, 4),
  -- Q1 (501)q2: typeof
  ('40000000-0000-4000-8000-000000001005', '40000000-0000-4000-8000-000000000502', '"string"', TRUE,  1),
  ('40000000-0000-4000-8000-000000001006', '40000000-0000-4000-8000-000000000502', '"number"', FALSE, 2),
  ('40000000-0000-4000-8000-000000001007', '40000000-0000-4000-8000-000000000502', '"integer"', FALSE, 3),
  ('40000000-0000-4000-8000-000000001008', '40000000-0000-4000-8000-000000000502', '"text"', FALSE, 4),
  -- Q1 (501)q3: ===
  ('40000000-0000-4000-8000-000000001009', '40000000-0000-4000-8000-000000000503', '===', TRUE,  1),
  ('40000000-0000-4000-8000-000000001010', '40000000-0000-4000-8000-000000000503', '==', FALSE, 2),
  ('40000000-0000-4000-8000-000000001011', '40000000-0000-4000-8000-000000000503', '= (assignment)', FALSE, 3),
  ('40000000-0000-4000-8000-000000001012', '40000000-0000-4000-8000-000000000503', '===' , FALSE, 4),
  -- Q2 (504): undefined return
  ('40000000-0000-4000-8000-000000001013', '40000000-0000-4000-8000-000000000504', 'undefined', TRUE,  1),
  ('40000000-0000-4000-8000-000000001014', '40000000-0000-4000-8000-000000000504', 'null', FALSE, 2),
  ('40000000-0000-4000-8000-000000001015', '40000000-0000-4000-8000-000000000504', '0', FALSE, 3),
  ('40000000-0000-4000-8000-000000001016', '40000000-0000-4000-8000-000000000504', 'NaN', FALSE, 4),
  -- Q2 (504)q2: continue
  ('40000000-0000-4000-8000-000000001017', '40000000-0000-4000-8000-000000000505', 'continue', TRUE,  1),
  ('40000000-0000-4000-8000-000000001018', '40000000-0000-4000-8000-000000000505', 'break', FALSE, 2),
  ('40000000-0000-4000-8000-000000001019', '40000000-0000-4000-8000-000000000505', 'return', FALSE, 3),
  ('40000000-0000-4000-8000-000000001020', '40000000-0000-4000-8000-000000000505', 'exit', FALSE, 4),
  -- Q2 (504)q3: for...of
  ('40000000-0000-4000-8000-000000001021', '40000000-0000-4000-8000-000000000506', 'for...of', TRUE,  1),
  ('40000000-0000-4000-8000-000000001022', '40000000-0000-4000-8000-000000000506', 'for...in', FALSE, 2),
  ('40000000-0000-4000-8000-000000001023', '40000000-0000-4000-8000-000000000506', 'while', FALSE, 3),
  ('40000000-0000-4000-8000-000000001024', '40000000-0000-4000-8000-000000000506', 'do...while', FALSE, 4),
  -- Q3 (507): querySelector null
  ('40000000-0000-4000-8000-000000001025', '40000000-0000-4000-8000-000000000507', 'null', TRUE,  1),
  ('40000000-0000-4000-8000-000000001026', '40000000-0000-4000-8000-000000000507', 'undefined', FALSE, 2),
  ('40000000-0000-4000-8000-000000001027', '40000000-0000-4000-8000-000000000507', 'false', FALSE, 3),
  ('40000000-0000-4000-8000-000000001028', '40000000-0000-4000-8000-000000000507', '[]', FALSE, 4),
  -- Q3 (507)q2: textContent
  ('40000000-0000-4000-8000-000000001029', '40000000-0000-4000-8000-000000000508', 'textContent', TRUE,  1),
  ('40000000-0000-4000-8000-000000001030', '40000000-0000-4000-8000-000000000508', 'innerHTML', FALSE, 2),
  ('40000000-0000-4000-8000-000000001031', '40000000-0000-4000-8000-000000000508', 'outerHTML', FALSE, 3),
  ('40000000-0000-4000-8000-000000001032', '40000000-0000-4000-8000-000000000508', 'setAttribute', FALSE, 4),
  -- Q3 (507)q3: spread NodeList
  ('40000000-0000-4000-8000-000000001033', '40000000-0000-4000-8000-000000000509', 'Converts it to a plain array', TRUE,  1),
  ('40000000-0000-4000-8000-000000001034', '40000000-0000-4000-8000-000000000509', 'Sorts the nodes', FALSE, 2),
  ('40000000-0000-4000-8000-000000001035', '40000000-0000-4000-8000-000000000509', 'Selects them again', FALSE, 3),
  ('40000000-0000-4000-8000-000000001036', '40000000-0000-4000-8000-000000000509', 'Deletes them', FALSE, 4),
  -- Q4 (510): preventDefault
  ('40000000-0000-4000-8000-000000001037', '40000000-0000-4000-8000-000000000510', 'Stops the page reload', TRUE,  1),
  ('40000000-0000-4000-8000-000000001038', '40000000-0000-4000-8000-000000000510', 'Stops all other events', FALSE, 2),
  ('40000000-0000-4000-8000-000000001039', '40000000-0000-4000-8000-000000000510', 'Clears the form', FALSE, 3),
  ('40000000-0000-4000-8000-000000001040', '40000000-0000-4000-8000-000000000510', 'Disables the button', FALSE, 4),
  -- Q4 (510)q2: input event
  ('40000000-0000-4000-8000-000000001041', '40000000-0000-4000-8000-000000000511', 'input', TRUE,  1),
  ('40000000-0000-4000-8000-000000001042', '40000000-0000-4000-8000-000000000511', 'click', FALSE, 2),
  ('40000000-0000-4000-8000-000000001043', '40000000-0000-4000-8000-000000000511', 'change', FALSE, 3),
  ('40000000-0000-4000-8000-000000001044', '40000000-0000-4000-8000-000000000511', 'submit', FALSE, 4),
  -- Q4 (510)q3: delegation
  ('40000000-0000-4000-8000-000000001045', '40000000-0000-4000-8000-000000000512', 'Listening on a parent for descendants', TRUE,  1),
  ('40000000-0000-4000-8000-000000001046', '40000000-0000-4000-8000-000000000512', 'Listening for every child separately', FALSE, 2),
  ('40000000-0000-4000-8000-000000001047', '40000000-0000-4000-8000-000000000512', 'Removing all listeners', FALSE, 3),
  ('40000000-0000-4000-8000-000000001048', '40000000-0000-4000-8000-000000000512', 'Firing an event manually', FALSE, 4),
  -- Q5 (513): implicit return
  ('40000000-0000-4000-8000-000000001049', '40000000-0000-4000-8000-000000000513', 'Arrow function shorthand', TRUE,  1),
  ('40000000-0000-4000-8000-000000001050', '40000000-0000-4000-8000-000000000513', 'function declarations', FALSE, 2),
  ('40000000-0000-4000-8000-000000001051', '40000000-0000-4000-8000-000000000513', 'class methods', FALSE, 3),
  ('40000000-0000-4000-8000-000000001052', '40000000-0000-4000-8000-000000000513', 'constructor functions', FALSE, 4),
  -- Q5 (513)q2: destructuring
  ('40000000-0000-4000-8000-000000001053', '40000000-0000-4000-8000-000000000514', 'Unpacks values into variables', TRUE,  1),
  ('40000000-0000-4000-8000-000000001054', '40000000-0000-4000-8000-000000000514', 'Deletes object keys', FALSE, 2),
  ('40000000-0000-4000-8000-000000001055', '40000000-0000-4000-8000-000000000514', 'Copies an array', FALSE, 3),
  ('40000000-0000-4000-8000-000000001056', '40000000-0000-4000-8000-000000000514', 'Freezes an object', FALSE, 4),
  -- Q5 (513)q3: template literals
  ('40000000-0000-4000-8000-000000001057', '40000000-0000-4000-8000-000000000515', 'Expressions inside ${...}', TRUE,  1),
  ('40000000-0000-4000-8000-000000001058', '40000000-0000-4000-8000-000000000515', 'Expressions in &lt;% %&gt;', FALSE, 2),
  ('40000000-0000-4000-8000-000000001059', '40000000-0000-4000-8000-000000000515', 'Expressions in (( ))', FALSE, 3),
  ('40000000-0000-4000-8000-000000001060', '40000000-0000-4000-8000-000000000515', 'Expressions in [[ ]]', FALSE, 4),
  -- Q6 (516): finally
  ('40000000-0000-4000-8000-000000001061', '40000000-0000-4000-8000-000000000516', 'finally', TRUE,  1),
  ('40000000-0000-4000-8000-000000001062', '40000000-0000-4000-8000-000000000516', 'catch', FALSE, 2),
  ('40000000-0000-4000-8000-000000001063', '40000000-0000-4000-8000-000000000516', 'throw', FALSE, 3),
  ('40000000-0000-4000-8000-000000001064', '40000000-0000-4000-8000-000000000516', 'break', FALSE, 4),
  -- Q6 (516)q2: promise
  ('40000000-0000-4000-8000-000000001065', '40000000-0000-4000-8000-000000000517', 'A value available now or later', TRUE,  1),
  ('40000000-0000-4000-8000-000000001066', '40000000-0000-4000-8000-000000000517', 'A synchronous function', FALSE, 2),
  ('40000000-0000-4000-8000-000000001067', '40000000-0000-4000-8000-000000000517', 'A DOM node', FALSE, 3),
  ('40000000-0000-4000-8000-000000001068', '40000000-0000-4000-8000-000000000517', 'A CSS style rule', FALSE, 4),
  -- Q6 (516)q3: await
  ('40000000-0000-4000-8000-000000001069', '40000000-0000-4000-8000-000000000518', 'Pauses until the promise settles', TRUE,  1),
  ('40000000-0000-4000-8000-000000001070', '40000000-0000-4000-8000-000000000518', 'Cancels the promise', FALSE, 2),
  ('40000000-0000-4000-8000-000000001071', '40000000-0000-4000-8000-000000000518', 'Converts to a string', FALSE, 3),
  ('40000000-0000-4000-8000-000000001072', '40000000-0000-4000-8000-000000000518', 'Throws immediately', FALSE, 4),
  -- Q7 (519): fetch rejection
  ('40000000-0000-4000-8000-000000001073', '40000000-0000-4000-8000-000000000519', 'On network failure only', TRUE,  1),
  ('40000000-0000-4000-8000-000000001074', '40000000-0000-4000-8000-000000000519', 'On any 4xx status', FALSE, 2),
  ('40000000-0000-4000-8000-000000001075', '40000000-0000-4000-8000-000000000519', 'On any 5xx status', FALSE, 3),
  ('40000000-0000-4000-8000-000000001076', '40000000-0000-4000-8000-000000000519', 'After parsing JSON', FALSE, 4),
  -- Q7 (519)q2: res.ok
  ('40000000-0000-4000-8000-000000001077', '40000000-0000-4000-8000-000000000520', 'res.ok', TRUE,  1),
  ('40000000-0000-4000-8000-000000001078', '40000000-0000-4000-8000-000000000520', 'res.body', FALSE, 2),
  ('40000000-0000-4000-8000-000000001079', '40000000-0000-4000-8000-000000000520', 'res.type', FALSE, 3),
  ('40000000-0000-4000-8000-000000001080', '40000000-0000-4000-8000-000000000520', 'res.data', FALSE, 4),
  -- Q7 (519)q3: res.json
  ('40000000-0000-4000-8000-000000001081', '40000000-0000-4000-8000-000000000521', 'A promise resolving to parsed JSON', TRUE,  1),
  ('40000000-0000-4000-8000-000000001082', '40000000-0000-4000-8000-000000000521', 'A parsed string object', FALSE, 2),
  ('40000000-0000-4000-8000-000000001083', '40000000-0000-4000-8000-000000000521', 'The raw response body', FALSE, 3),
  ('40000000-0000-4000-8000-000000001084', '40000000-0000-4000-8000-000000000521', 'A DOM element', FALSE, 4),
  -- Q8 (522): encodeURIComponent
  ('40000000-0000-4000-8000-000000001085', '40000000-0000-4000-8000-000000000522', 'It escapes unsafe URL characters', TRUE,  1),
  ('40000000-0000-4000-8000-000000001086', '40000000-0000-4000-8000-000000000522', 'It encrypts the string', FALSE, 2),
  ('40000000-0000-4000-8000-000000001087', '40000000-0000-4000-8000-000000000522', 'It compresses the data', FALSE, 3),
  ('40000000-0000-4000-8000-000000001088', '40000000-0000-4000-8000-000000000522', 'It sorts characters', FALSE, 4),
  -- Q8 (522)q2: GET
  ('40000000-0000-4000-8000-000000001089', '40000000-0000-4000-8000-000000000523', 'GET', TRUE,  1),
  ('40000000-0000-4000-8000-000000001090', '40000000-0000-4000-8000-000000000523', 'POST', FALSE, 2),
  ('40000000-0000-4000-8000-000000001091', '40000000-0000-4000-8000-000000000523', 'DELETE', FALSE, 3),
  ('40000000-0000-4000-8000-000000001092', '40000000-0000-4000-8000-000000000523', 'PATCH', FALSE, 4),
  -- Q8 (522)q3: replaceChildren
  ('40000000-0000-4000-8000-000000001093', '40000000-0000-4000-8000-000000000524', 'replaceChildren()', TRUE,  1),
  ('40000000-0000-4000-8000-000000001094', '40000000-0000-4000-8000-000000000524', 'append()', FALSE, 2),
  ('40000000-0000-4000-8000-000000001095', '40000000-0000-4000-8000-000000000524', 'prepend()', FALSE, 3),
  ('40000000-0000-4000-8000-000000001096', '40000000-0000-4000-8000-000000000524', 'cloneNode()', FALSE, 4),
  -- Q9 (525): const default
  ('40000000-0000-4000-8000-000000001097', '40000000-0000-4000-8000-000000000525', 'const', TRUE,  1),
  ('40000000-0000-4000-8000-000000001098', '40000000-0000-4000-8000-000000000525', 'let', FALSE, 2),
  ('40000000-0000-4000-8000-000000001099', '40000000-0000-4000-8000-000000000525', 'var', FALSE, 3),
  ('40000000-0000-4000-8000-000000001100', '40000000-0000-4000-8000-000000000525', 'function', FALSE, 4),
  -- Q9 (525)q2: spinner
  ('40000000-0000-4000-8000-000000001101', '40000000-0000-4000-8000-000000000526', 'Shows work is in progress', TRUE,  1),
  ('40000000-0000-4000-8000-000000001102', '40000000-0000-4000-8000-000000000526', 'Makes the page prettier', FALSE, 2),
  ('40000000-0000-4000-8000-000000001103', '40000000-0000-4000-8000-000000000526', 'Encrypts the request', FALSE, 3),
  ('40000000-0000-4000-8000-000000001104', '40000000-0000-4000-8000-000000000526', 'Debugs the code', FALSE, 4),
  -- Q9 (525)q3: pure functions
  ('40000000-0000-4000-8000-000000001105', '40000000-0000-4000-8000-000000000527', 'In small pure functions', TRUE,  1),
  ('40000000-0000-4000-8000-000000001106', '40000000-0000-4000-8000-000000000527', 'In the fetch call', FALSE, 2),
  ('40000000-0000-4000-8000-000000001107', '40000000-0000-4000-8000-000000000527', 'In CSS style blocks', FALSE, 3),
  ('40000000-0000-4000-8000-000000001108', '40000000-0000-4000-8000-000000000527', 'In HTML attributes', FALSE, 4),
  -- Q9 (525)q4: API key
  ('40000000-0000-4000-8000-000000001109', '40000000-0000-4000-8000-000000000528', 'Fail loudly with a clear message', TRUE,  1),
  ('40000000-0000-4000-8000-000000001110', '40000000-0000-4000-8000-000000000528', 'Ignore it silently', FALSE, 2),
  ('40000000-0000-4000-8000-000000001111', '40000000-0000-4000-8000-000000000528', 'Generate a random key', FALSE, 3),
  ('40000000-0000-4000-8000-000000001112', '40000000-0000-4000-8000-000000000528', 'Log it to the console', FALSE, 4),
  -- Q9 (525)q5: safe rendering
  ('40000000-0000-4000-8000-000000001113', '40000000-0000-4000-8000-000000000529', 'Render with textContent', TRUE,  1),
  ('40000000-0000-4000-8000-000000001114', '40000000-0000-4000-8000-000000000529', 'Render with innerHTML', FALSE, 2),
  ('40000000-0000-4000-8000-000000001115', '40000000-0000-4000-8000-000000000529', 'Render with outerHTML', FALSE, 3),
  ('40000000-0000-4000-8000-000000001116', '40000000-0000-4000-8000-000000000529', 'Render with document.write', FALSE, 4)
ON CONFLICT (id) DO NOTHING;
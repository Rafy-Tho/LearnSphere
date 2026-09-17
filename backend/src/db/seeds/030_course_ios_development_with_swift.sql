-- ============================================================================
-- SEED 030: Complete course — "iOS Development with Swift"
-- ----------------------------------------------------------------------------
-- Instructor : Marcus Johnson    (10000000-0000-4000-8000-000000000002)
-- Category   : Mobile Development (20000000-0000-4000-8000-000000000007)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Swift Language Basics        → C1 Getting Started with Swift · C2 Optionals & Collections
--   M2 Swift Fundamentals           → C3 Structs, Classes & Protocols · C4 Control Flow, Functions & Errors
--   M3 SwiftUI                      → C5 SwiftUI Views & State · C6 Navigation & Lists
--   M4 Data & Networking            → C7 Networking with async/await · C8 Persistence
--   M5 Testing & App Store          → C9 Testing & Quality · C10 App Store & Capstone
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
  '01E00000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000002',
  '20000000-0000-4000-8000-000000000007',
  'iOS Development with Swift',
  'ios-development-with-swift',
  'Build production-ready iPhone apps with Swift and SwiftUI. Master the language, optionals, structs, and protocols, then layer in declarative SwiftUI views, async networking, persistence, testing, and App Store release.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  28
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('01E00000-0000-4000-8000-000000000011', '01E00000-0000-4000-8000-000000000001', 'Write clean Swift: variables, constants, data types, and safe optionals.', 1),
  ('01E00000-0000-4000-8000-000000000012', '01E00000-0000-4000-8000-000000000001', 'Model data with structs, classes, protocols, and error handling.',          2),
  ('01E00000-0000-4000-8000-000000000013', '01E00000-0000-4000-8000-000000000001', 'Build declarative SwiftUI interfaces driven by state, navigation, and lists.', 3),
  ('01E00000-0000-4000-8000-000000000014', '01E00000-0000-4000-8000-000000000001', 'Fetch and decode JSON with async/await, then persist data locally.',        4),
  ('01E00000-0000-4000-8000-000000000015', '01E00000-0000-4000-8000-000000000001', 'Test your code with XCTest and take an app all the way to the App Store.',  5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('01E00000-0000-4000-8000-000000000101', '01E00000-0000-4000-8000-000000000001', 1, 'Swift Language Basics',     'Variables, data types, optionals, and collections.',        'PUBLISHED'),
  ('01E00000-0000-4000-8000-000000000102', '01E00000-0000-4000-8000-000000000001', 2, 'Swift Fundamentals',        'Types, protocols, closures, and error handling.',           'PUBLISHED'),
  ('01E00000-0000-4000-8000-000000000103', '01E00000-0000-4000-8000-000000000001', 3, 'SwiftUI',                   'Declarative views, state, navigation, and lists.',          'PUBLISHED'),
  ('01E00000-0000-4000-8000-000000000104', '01E00000-0000-4000-8000-000000000001', 4, 'Data & Networking',         'async/await networking, JSON decoding, and persistence.',   'PUBLISHED'),
  ('01E00000-0000-4000-8000-000000000105', '01E00000-0000-4000-8000-000000000001', 5, 'Testing & App Store',       'Test, package, and ship your application.',                 'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('01E00000-0000-4000-8000-000000000201', '01E00000-0000-4000-8000-000000000101', 1, 'Getting Started with Swift', 'Explore Xcode and the mechanics of a Swift program.',    'PUBLISHED'),
  ('01E00000-0000-4000-8000-000000000202', '01E00000-0000-4000-8000-000000000101', 2, 'Optionals & Collections',    'Handle missing values and grouped data with confidence.', 'PUBLISHED'),
  ('01E00000-0000-4000-8000-000000000203', '01E00000-0000-4000-8000-000000000102', 1, 'Structs, Classes & Protocols','Model real-world ideas with Swift types.',               'PUBLISHED'),
  ('01E00000-0000-4000-8000-000000000204', '01E00000-0000-4000-8000-000000000102', 2, 'Control Flow, Functions & Errors','Direct program flow and handle failure gracefully.',    'PUBLISHED'),
  ('01E00000-0000-4000-8000-000000000205', '01E00000-0000-4000-8000-000000000103', 1, 'SwiftUI Views & State',      'Build declarative interfaces that react to data.',        'PUBLISHED'),
  ('01E00000-0000-4000-8000-000000000206', '01E00000-0000-4000-8000-000000000103', 2, 'Navigation & Lists',         'Move between screens and render dynamic content.',        'PUBLISHED'),
  ('01E00000-0000-4000-8000-000000000207', '01E00000-0000-4000-8000-000000000104', 1, 'Networking with async/await','Fetch and decode data from the network.',                 'PUBLISHED'),
  ('01E00000-0000-4000-8000-000000000208', '01E00000-0000-4000-8000-000000000104', 2, 'Persistence',                'Save data so users can pick up where they left off.',     'PUBLISHED'),
  ('01E00000-0000-4000-8000-000000000209', '01E00000-0000-4000-8000-000000000105', 1, 'Testing & Quality',          'Verify behavior with unit tests before you ship.',        'PUBLISHED'),
  ('01E00000-0000-4000-8000-000000000210', '01E00000-0000-4000-8000-000000000105', 2, 'App Store & Capstone',       'Package your work and go to market.',                      'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 01E00000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('01E00000-0000-4000-8000-000000000301', '01E00000-0000-4000-8000-000000000201', 1, 'Swift & Xcode Basics',              'Understand where Swift runs, explore Xcode, and declare your first values.', 'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01E00000-0000-4000-8000-000000000302', '01E00000-0000-4000-8000-000000000201', 2, 'Data Types & Operators',            'Work with numbers, strings, booleans, and Swift operators.',               'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('01E00000-0000-4000-8000-000000000303', '01E00000-0000-4000-8000-000000000201', 3, 'Swift Basics Quiz',                  'Check your understanding of Swift fundamentals.',                           'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01E00000-0000-4000-8000-000000000304', '01E00000-0000-4000-8000-000000000202', 1, 'Optionals & Unwrapping',             'Model missing values safely and unwrap them without crashes.',               'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('01E00000-0000-4000-8000-000000000305', '01E00000-0000-4000-8000-000000000202', 2, 'Arrays, Sets & Dictionaries',        'Store and look up data with Swift collections.',                            'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01E00000-0000-4000-8000-000000000306', '01E00000-0000-4000-8000-000000000202', 3, 'Optionals & Collections Quiz',       'Verify safe unwrapping and collection knowledge.',                           'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01E00000-0000-4000-8000-000000000307', '01E00000-0000-4000-8000-000000000203', 1, 'Structs & Value Semantics',          'Bundle properties and methods into self-contained value types.',             'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01E00000-0000-4000-8000-000000000308', '01E00000-0000-4000-8000-000000000203', 2, 'Classes, Inheritance & Protocols',   'Share behavior with reference types and conformance blueprints.',            'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01E00000-0000-4000-8000-000000000309', '01E00000-0000-4000-8000-000000000203', 3, 'Types & Protocols Quiz',             'Test your modeling with structs, classes, and protocols.',                  'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01E00000-0000-4000-8000-000000000310', '01E00000-0000-4000-8000-000000000204', 1, 'Control Flow & Functions',           'Branch, iterate, and package logic into functions.',                        'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('01E00000-0000-4000-8000-000000000311', '01E00000-0000-4000-8000-000000000204', 2, 'Closures & Error Handling',          'Pass behavior around and fail gracefully with do/catch.',                   'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('01E00000-0000-4000-8000-000000000312', '01E00000-0000-4000-8000-000000000204', 3, 'Control Flow & Errors Quiz',         'Check your functions, closures, and error handling skills.',                 'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01E00000-0000-4000-8000-000000000313', '01E00000-0000-4000-8000-000000000205', 1, 'SwiftUI Views & Layout',             'Compose interfaces declaratively with stacks and modifiers.',                'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01E00000-0000-4000-8000-000000000314', '01E00000-0000-4000-8000-000000000205', 2, 'State with @State & @Binding',        'Make views react to change with property wrappers.',                        'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('01E00000-0000-4000-8000-000000000315', '01E00000-0000-4000-8000-000000000205', 3, 'SwiftUI Views & State Quiz',         'Verify your declarative UI and state knowledge.',                            'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01E00000-0000-4000-8000-000000000316', '01E00000-0000-4000-8000-000000000206', 1, 'NavigationStack & NavigationLink',   'Drive push navigation across a hierarchy of screens.',                       'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01E00000-0000-4000-8000-000000000317', '01E00000-0000-4000-8000-000000000206', 2, 'Lists & Dynamic Content',            'Render scrollable, data-driven rows with ForEach.',                          'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01E00000-0000-4000-8000-000000000318', '01E00000-0000-4000-8000-000000000206', 3, 'Navigation & Lists Quiz',            'Test pushing destinations and rendering lists.',                             'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01E00000-0000-4000-8000-000000000319', '01E00000-0000-4000-8000-000000000207', 1, 'Networking with async/await',        'Make HTTP requests with URLSession and modern concurrency.',                 'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01E00000-0000-4000-8000-000000000320', '01E00000-0000-4000-8000-000000000207', 2, 'Codable & JSON Decoding',            'Map JSON responses to Swift models safely.',                                 'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('01E00000-0000-4000-8000-000000000321', '01E00000-0000-4000-8000-000000000207', 3, 'Networking & JSON Quiz',             'Check your async networking and decoding skills.',                           'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01E00000-0000-4000-8000-000000000322', '01E00000-0000-4000-8000-000000000208', 1, 'UserDefaults & Preferences',        'Store small preferences with the built-in key-value store.',                 'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01E00000-0000-4000-8000-000000000323', '01E00000-0000-4000-8000-000000000208', 2, 'File Persistence with Codable',     'Save and load model data to the Documents directory.',                       'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01E00000-0000-4000-8000-000000000324', '01E00000-0000-4000-8000-000000000208', 3, 'Persistence Quiz',                  'Verify your storage strategies across both APIs.',                           'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01E00000-0000-4000-8000-000000000325', '01E00000-0000-4000-8000-000000000209', 1, 'Testing with XCTest',                'Write unit tests that protect your code from regressions.',                  'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01E00000-0000-4000-8000-000000000326', '01E00000-0000-4000-8000-000000000210', 1, 'App Store Basics',                   'Prepare, submit, and manage an app through App Store Connect.',              'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('01E00000-0000-4000-8000-000000000327', '01E00000-0000-4000-8000-000000000210', 2, 'Capstone: Building MyNotes',         'Combine every skill into a finished, ship-ready app.',                       'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('01E00000-0000-4000-8000-000000000328', '01E00000-0000-4000-8000-000000000210', 3, 'Final Assessment',                   'Prove what you learned across the whole course.',                            'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 01E00000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '01E00000-0000-4000-8000-000000000401',
  '01E00000-0000-4000-8000-000000000301',
  1,
  'Swift & Xcode Basics',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Swift & Xcode Basics</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
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
.dark .lesson-page .ic { background: #172554; color: #bfdbfe; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #172554; color: #bfdbfe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Swift &amp; Xcode Basics</h1>
  <p>Swift is the programming language that powers nearly every iOS app. It is <strong>safe</strong>, <strong>fast</strong>, and designed to make common mistakes impossible — the compiler catches entire classes of bugs before your app ever runs.</p>
  <p>You write Swift inside <strong>Xcode</strong>, Apple&rsquo;s integrated development environment. Xcode provides the editor, the <span class="ic">Simulator</span> for testing, and the <span class="ic">build</span> pipeline that turns your code into a runnable app.</p>
  <h2>Your first playground</h2>
  <p>A <strong>playground</strong> is a scratch file that runs Swift line by line with instant feedback. Launch Xcode and create a new playground to follow along.</p>
  <pre class="code-block">var score = 0          // a variable — can change
let appName = &quot;GoFit&quot;  // a constant — cannot change

score = 10             // fine, score is a var
// appName = &quot;FitPro&quot; // error: cannot assign to a let

print(&quot;Welcome to \(appName)&quot;)
print(&quot;Best score: \(score)&quot;)</pre>
  <p>Removing the comment before <span class="ic">appName = "FitPro"</span> produces a compile error — constants cannot be reassigned. That single rule prevents an enormous number of bugs.</p>
  <h2>let vs var</h2>
  <table>
    <tr><th>Keyword</th><th>Meaning</th><th>When to use</th></tr>
    <tr><td>let</td><td>constant</td><td>Always, unless the value must change</td></tr>
    <tr><td>var</td><td>variable</td><td>Only when you genuinely reassign</td></tr>
  </table>
  <h2>Type inference and print</h2>
  <pre class="code-block">let title: String = &quot;Weather&quot;   // explicit type annotation
let high: Double = 21.5        // inferred as Double
let count: Int = 4             // inferred as Int

print(&quot;Today: \(title), high \(high)°C&quot;)</pre>
  <p>You rarely need the annotation — Swift infers each type from its initial value. Use annotations when the intent is not obvious or you want a narrower type.</p>
  <div class="callout callout-tip">
    <strong>Interpolation</strong>
    <p>Put values inside a string with <span class="ic">\(expression)</span>. It is safer and shorter than concatenating with <span class="ic">+</span>.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01E00000-0000-4000-8000-000000000402',
  '01E00000-0000-4000-8000-000000000302',
  1,
  'Data Types & Operators',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Data Types & Operators</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
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
.dark .lesson-page .ic { background: #172554; color: #bfdbfe; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #172554; color: #bfdbfe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Data Types &amp; Operators</h1>
  <p>Every value in Swift has a type that dictates what you can do with it. The workhorses are <span class="ic">Int</span> for whole numbers, <span class="ic">Double</span> for decimals, <span class="ic">String</span> for text, and <span class="ic">Bool</span> for true or false.</p>
  <table>
    <tr><th>Type</th><th>Example</th><th>Notes</th></tr>
    <tr><td>Int</td><td>42</td><td>Whole numbers</td></tr>
    <tr><td>Double</td><td>3.14</td><td>Fractional numbers</td></tr>
    <tr><td>String</td><td>"Hello"</td><td>Text in double quotes</td></tr>
    <tr><td>Bool</td><td>true</td><td>Only true or false</td></tr>
  </table>
  <h2>Operators</h2>
  <pre class="code-block">let apples = 6
let people = 2
let each = apples / people          // 3
let remainder = apples % people     // 0

let price = 4.99
let total = price * 2               // 9.98

let message = &quot;Overcast&quot;
let combined = &quot;Forecast: &quot; + message

let high = 19.0
let isCold = high &lt; 0
let isWarm = high &gt; 18 &amp;&amp; high &lt; 26   // logical AND</pre>
  <h2>Type safety</h2>
  <p>Swift refuses to mix numbers and text without you asking. The result is you never silently add a String to an Int by accident. Convert explicitly instead:</p>
  <pre class="code-block">let sales = &quot;128&quot;
let parsed = Int(sales)             // Optional(128) — may be nil!

let count = 7
let label = &quot;Count: &quot; + String(count)  // explicit conversion
let label2 = &quot;Count: \(count)&quot;         // interpolation is cleaner</pre>
  <h2>Comparison and logic</h2>
  <ul>
    <li>Equality: <span class="ic">a == b</span> and <span class="ic">a != b</span>.</li>
    <li>Ordering: <span class="ic">&lt;</span> <span class="ic">&lt;=</span> <span class="ic">&gt;</span> <span class="ic">&gt;=</span>.</li>
    <li>Logic: <span class="ic">&amp;&amp;</span>, <span class="ic">||</span>, and <span class="ic">!</span>.</li>
  </ul>
  <div class="callout">
    <strong>String comparisons are case-sensitive</strong>
    <p><span class="ic">"Portland" == "portland"</span> is false. When user input drives a lookup, normalize it with <span class="ic">lowercased()</span> first.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Int() of a decimal truncates</strong>
    <p><span class="ic">Int(4.99)</span> is 4, not 5. For rounding use <span class="ic">rounded()</span> on a Double first.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01E00000-0000-4000-8000-000000000404',
  '01E00000-0000-4000-8000-000000000304',
  1,
  'Optionals & Unwrapping',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Optionals & Unwrapping</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
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
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #172554; color: #bfdbfe; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Optionals &amp; Unwrapping</h1>
  <p>Real data is messy: a search returns nothing, a dictionary key is missing, a server field is absent. Swift represents &ldquo;there is no value&rdquo; with <span class="ic">nil</span>, and every value that might be <span class="ic">nil</span> must be declared as an <strong>optional</strong>.</p>
  <p>Append <span class="ic">?</span> to a type to make it optional:</p>
  <pre class="code-block">var city: String? = &quot;Portland&quot;
city = nil                // valid — optionals may hold nil

func find(named query: String) -&gt; String? {
  return query.isEmpty ? nil : query
}

print(find(named: &quot;Hood&quot;))     // Optional(&quot;Hood&quot;)
print(find(named: &quot;&quot;))        // nil</pre>
  <div class="callout">
    <strong>An optional is a wrapped value</strong>
    <p>You cannot use an optional where a plain String is expected. <span class="ic">String?</span> and <span class="ic">String</span> are different types; you must <em>unwrap</em> first.</p>
  </div>
  <h2>if let — unwrap only when present</h2>
  <pre class="code-block">if let name = find(named: &quot;Hood&quot;) {
  print(&quot;Found city: \(name)&quot;)
} else {
  print(&quot;No matching city&quot;)
}</pre>
  <p><span class="ic">if let</span> evaluates the expression; when it holds a value, the unwrapped value is bound and the body runs. When it is <span class="ic">nil</span>, the else branch runs. No crash possible.</p>
  <h2>guard let — exit early</h2>
  <pre class="code-block">func render(city: String?) {
  guard let safe = city, !safe.isEmpty else {
    print(&quot;Nothing to render&quot;)
    return
  }
  print(&quot;Rendering \(safe)&quot;)
}</pre>
  <p><span class="ic">guard</span> is perfect for validating inputs at the top of a function: the happy path continues and the failure path returns immediately.</p>
  <h2>The nil-coalescing operator</h2>
  <pre class="code-block">let saved = defaults.string(forKey: &quot;lastCity&quot;)
let label = saved ?? &quot;Unknown&quot;      // value or fallback</pre>
  <div class="callout callout-tip">
    <strong>Prefer ?? when a default makes sense</strong>
    <p><span class="ic">a ?? b</span> reads as &ldquo;use a, or b if a is nil&rdquo;. Combined with <span class="ic">?.</span> for chaining, it handles most everyday optional work.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01E00000-0000-4000-8000-000000000405',
  '01E00000-0000-4000-8000-000000000305',
  1,
  'Arrays, Sets & Dictionaries',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Arrays, Sets & Dictionaries</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
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
.dark .lesson-page .ic { background: #172554; color: #bfdbfe; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #172554; color: #bfdbfe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Arrays, Sets &amp; Dictionaries</h1>
  <p>Collections group many values into one. Swift gives you three core kinds: ordered <span class="ic">Array</span>, unique <span class="ic">Set</span>, and keyed <span class="ic">Dictionary</span>.</p>
  <table>
    <tr><th>Type</th><th>Ordered?</th><th>Duplicates?</th><th>Access by</th></tr>
    <tr><td>Array</td><td>Yes</td><td>Yes</td><td>Index number</td></tr>
    <tr><td>Set</td><td>No</td><td>No</td><td>Membership</td></tr>
    <tr><td>Dictionary</td><td>No</td><td>Keys are unique</td><td>Key value</td></tr>
  </table>
  <h2>Arrays</h2>
  <pre class="code-block">var cities = [&quot;Portland&quot;, &quot;Seattle&quot;]
cities.append(&quot;Denver&quot;)
cities += [&quot;Austin&quot;]
let first = cities[0]          // &quot;Portland&quot;
let count = cities.count       // 4

for city in cities {
  print(city)
}</pre>
  <h2>Dictionaries</h2>
  <pre class="code-block">var scores = [String: Int]()
scores[&quot;Lia&quot;] = 92
scores[&quot;Omar&quot;] = 78
scores[&quot;Lia&quot;]              // Optional(92) — always optional

let fallback = scores[&quot;Kim&quot;] ?? 0   // 0
scores.removeValue(forKey: &quot;Omar&quot;)</pre>
  <p>Dictionary lookups return <strong>optionals</strong> because the key may be absent — combine that idea with the nil-coalescing operator from the previous lesson.</p>
  <h2>Sets</h2>
  <pre class="code-block">var tags: Set&lt;String&gt; = []
tags.insert(&quot;swift&quot;)
tags.insert(&quot;swift&quot;)        // silently ignored
print(tags.count)            // 1
print(tags.contains(&quot;swift&quot;))  // true

let a: Set = [1, 2, 3]
let b: Set = [2, 3, 4]
print(a.intersection(b))     // [2, 3]
print(a.union(b))            // [1, 2, 3, 4]</pre>
  <div class="callout callout-info">
    <strong>When to reach for a Set</strong>
    <p>Use a Set whenever duplicate-insensitivity matters: seen-you-again checks, tags, and membership tests. Both <span class="ic">contains</span> and insertion are constant-time.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Order is an array promise</strong>
    <p>Dictionaries and sets make no guarantee about iteration order. If display order matters, sort or store in an array.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01E00000-0000-4000-8000-000000000407',
  '01E00000-0000-4000-8000-000000000307',
  1,
  'Structs & Value Semantics',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Structs & Value Semantics</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
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
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #172554; color: #bfdbfe; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Structs &amp; Value Semantics</h1>
  <p>A <strong>struct</strong> bundles related properties and methods into one named type. It is the primary way you model data in Swift — before any UI, design the structures your app talks about.</p>
  <pre class="code-block">struct Forecast {
  var city: String
  var high: Double
  var low: Double

  var average: Double {            // computed property
    (high + low) / 2
  }

  mutating func applyChill(_ drop: Double) {
    low -= drop
  }
}

let today = Forecast(city: &quot;Oslo&quot;, high: 12.0, low: 6.0)
print(today.city)        // Oslo
print(today.average)     // 9.0</pre>
  <div class="callout">
    <strong>Memberwise initialization</strong>
    <p>Structs get a free <em>memberwise</em> initializer — you can create one with <span class="ic">Forecast(city:high:low:)</span> without writing an <span class="ic">init</span>. Add your own <span class="ic">init</span> when you need validation or defaults.</p>
  </div>
  <h2>Value semantics</h2>
  <p>Structs are <strong>value types</strong>: assigning or passing one copies it. Mutating the copy never touches the original.</p>
  <pre class="code-block">var copy = today
copy.city = &quot;Stockholm&quot;

print(today.city)      // Oslo — unchanged
print(copy.city)       // Stockholm</pre>
  <p>This isolation keeps bugs local. Each screen can transform the data it was handed without surprising other parts of the app.</p>
  <h2>Methods that mutate</h2>
  <p>A method that changes properties must be marked <span class="ic">mutating</span> because it reassigns the instance behind the scene:</p>
  <pre class="code-block">struct Counter {
  var value = 0
  mutating func bump() { value += 1 }
}

var counter = Counter()
counter.bump()
print(counter.value)   // 1</pre>
  <div class="callout callout-tip">
    <strong>Model first, render second</strong>
    <p>Structs hold pure data and the small rules that belong with it (averages, validation, formatting). Keep them free of UI so they stay testable.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01E00000-0000-4000-8000-000000000408',
  '01E00000-0000-4000-8000-000000000308',
  1,
  'Classes, Inheritance & Protocols',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Classes, Inheritance & Protocols</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
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
.dark .lesson-page .ic { background: #172554; color: #bfdbfe; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #172554; color: #bfdbfe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Classes, Inheritance &amp; Protocols</h1>
  <p>Swift gives you two flavors of type: <strong>structs</strong> (value types) and <strong>classes</strong> (reference types). Classes support inheritance and deallocation hooks, and thanks to them shared state stays shared.</p>
  <table>
    <tr><th></th><th>Struct</th><th>Class</th></tr>
    <tr><td>Copy behavior</td><td>Copied on assignment</td><td>Shared reference</td></tr>
    <tr><td>Inheritance</td><td>No</td><td>Yes</td></tr>
    <tr><td>deinit</td><td>No</td><td>Yes</td></tr>
    <tr><td>Free initializer</td><td>Memberwise</td><td>Not automatic</td></tr>
  </table>
  <h2>Classes and inheritance</h2>
  <pre class="code-block">class GameLevel {
  var name: String
  var stars = 0

  init(name: String) {
    self.name = name
  }

  func clear() -&gt; Bool {
    stars += 1
    return true
  }
}

class BossLevel: GameLevel {          // inherits from GameLevel
  override func clear() -&gt; Bool {
    stars += 3
    return true
  }
}

let level: GameLevel = BossLevel(name: &quot;Citadel&quot;)
print(level.clear())                  // polymorphism: BossLevel wins</pre>
  <h2>Protocols — blueprints of behavior</h2>
  <pre class="code-block">protocol Summarizable {
  var summary: String { get }
  func describe() -&gt; String
}

struct City: Summarizable {
  var name: String
  var summary: String { &quot;City of \(name)&quot; }
  func describe() -&gt; String { summary }
}

func printSummary(of item: Summarizable) {
  print(item.describe())
}

printSummary(of: City(name: &quot;Portland&quot;))</pre>
  <p>Protocols decouple <em>what</em> something can do from <em>how</em> it does it. Any type — struct, class, enum — can conform, and functions can accept the protocol instead of a concrete type.</p>
  <div class="callout callout-tip">
    <strong>Default to structs</strong>
    <p>Prefer structs for data. Reach for a class when you need shared reference state, inheritance, or Objective-C interop. Combine either with protocols to stay flexible.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01E00000-0000-4000-8000-000000000410',
  '01E00000-0000-4000-8000-000000000310',
  1,
  'Control Flow & Functions',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Control Flow & Functions</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
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
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #172554; color: #bfdbfe; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Control Flow &amp; Functions</h1>
  <p>Programs make decisions, repeat work, and package logic into callable units. Swift&rsquo;s control flow is familiar, with a few extra superpowers like <span class="ic">switch</span> without implicit fallthrough.</p>
  <h2>if / else-if / else</h2>
  <pre class="code-block">let temp = 24

if temp &gt; 30 {
  print(&quot;Hot&quot;)
} else if temp &lt; 10 {
  print(&quot;Cold&quot;)
} else {
  print(&quot;Mild&quot;)
}</pre>
  <h2>Switch</h2>
  <pre class="code-block">let score = 87
var grade: String

switch score {
case 0..&lt;60:  grade = &quot;F&quot;
case 60..&lt;80: grade = &quot;C&quot;
case 80..&lt;90: grade = &quot;B&quot;
case 90...100: grade = &quot;A&quot;
default:      grade = &quot;Unknown&quot;
}
print(grade)   // B</pre>
  <h2>Loops</h2>
  <pre class="code-block">for day in 1...7 {
  print(&quot;Day \(day)&quot;)
}

for step in stride(from: 0, to: 60, by: 10) {
  print(step)                 // 0 10 20 30 40 50
}

var energy = 100
while energy &gt; 0 {
  print(&quot;Energy: \(energy)&quot;)
  energy -= 25
}</pre>
  <h2>Functions</h2>
  <pre class="code-block">func greet(_ person: String, with greeting: String = &quot;Hi&quot;) -&gt; String {
  return &quot;\(greeting), \(person)!&quot;
}

print(greet(&quot;Ana&quot;))                // Hi, Ana!
print(greet(&quot;Ana&quot;, with: &quot;Hello&quot;)) // Hello, Ana!</pre>
  <ul>
    <li><span class="ic">_</span> removes an external label so callers write <span class="ic">greet("Ana")</span>.</li>
    <li>Default values let callers omit an argument.</li>
    <li>The <span class="ic">-&gt; String</span> declares the return type.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Early returns keep code flat</strong>
    <p>Validate inputs up front (often with <span class="ic">guard</span>) and return. Deeply nested ifs are the most common readability smell in real code.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01E00000-0000-4000-8000-000000000411',
  '01E00000-0000-4000-8000-000000000311',
  1,
  'Closures & Error Handling',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Closures & Error Handling</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
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
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #172554; color: #bfdbfe; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Closures &amp; Error Handling</h1>
  <p>A <strong>closure</strong> is a block of behavior you can store and pass around — Swift&rsquo;s version of a function value. Combined with <span class="ic">map</span>, <span class="ic">filter</span>, and <span class="ic">sorted</span>, it powers a lot of idiomatic code.</p>
  <h2>Closures in practice</h2>
  <pre class="code-block">let numbers = [3, 1, 4, 1, 5]

let doubled = numbers.map { $0 * 2 }
let small = numbers.filter { $0 &lt; 4 }
let sorted = numbers.sorted { $0 &lt; $1 }

print(doubled)   // [6, 2, 8, 2, 10]
print(sorted)    // [1, 1, 3, 4, 5]</pre>
  <p><span class="ic">$0</span>, <span class="ic">$1</span>, &hellip; are shorthand parameter names. When the closure is the last argument you can drop the parentheses entirely — the <em>trailing closure</em> syntax above.</p>
  <p>You can also store and call closures directly:</p>
  <pre class="code-block">let formatTemp: (Double, String) -&gt; String = { value, unit in
  return unit == &quot;celsius&quot; ? &quot;\(value)°C&quot; : &quot;\(value)°F&quot;
}

print(formatTemp(21.5, &quot;celsius&quot;))   // 21.5°C</pre>
  <h2>Throwing errors</h2>
  <pre class="code-block">enum ScoreError: Error {
  case belowZero
  case tooLarge
}

func validate(_ score: Int) throws -&gt; Int {
  guard score &gt;= 0 else { throw ScoreError.belowZero }
  guard score &lt;= 100 else { throw ScoreError.tooLarge }
  return score
}</pre>
  <h2>do/catch, try?, defer</h2>
  <pre class="code-block">do {
  let ok = try validate(120)
  print(ok)
} catch ScoreError.belowZero {
  print(&quot;Too low&quot;)
} catch {
  print(&quot;Invalid: \(error)&quot;)
}

let fallback = try? validate(120)   // nil — error swallowed
print(fallback ?? &quot;rejected&quot;)</pre>
  <div class="callout callout-tip">
    <strong>try? for best-effort</strong>
    <p>When a failure is acceptable and <span class="ic">nil</span> says it all, <span class="ic">try?</span> collapses error handling into an optional. Reserve <span class="ic">do/catch</span> for failures you must explain to a user.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01E00000-0000-4000-8000-000000000413',
  '01E00000-0000-4000-8000-000000000313',
  1,
  'SwiftUI Views & Layout',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SwiftUI Views & Layout</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
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
.dark .lesson-page .ic { background: #172554; color: #bfdbfe; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #172554; color: #bfdbfe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>SwiftUI Views &amp; Layout</h1>
  <p>SwiftUI builds interfaces <strong>declaratively</strong>: you describe what the interface should be, and the framework figures out how to draw and update it. The <span class="ic">View</span> protocol is the contract every screen follows.</p>
  <pre class="code-block">import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      Text(&quot;Hello, iOS&quot;)
        .font(.largeTitle)
        .foregroundStyle(.blue)

      Image(systemName: &quot;sun.max.fill&quot;)
        .resizable()
        .frame(width: 60, height: 60)

      Text(&quot;Portland: 21&deg;C&quot;)
        .padding()
        .background(.thinMaterial)
    }
  }
}</pre>
  <h2>Stacks arrange content</h2>
  <table>
    <tr><th>Container</th><th>Axis</th></tr>
    <tr><td>VStack</td><td>Vertical (top to bottom)</td></tr>
    <tr><td>HStack</td><td>Horizontal (left to right)</td></tr>
    <tr><td>ZStack</td><td>Depth (back to front)</td></tr>
  </table>
  <h2>Modifiers style views</h2>
  <p>Almost every visual attribute is a <strong>modifier</strong> — a method that returns a new, configured view.</p>
  <pre class="code-block">Text(&quot;Saved&quot;)
  .font(.headline)
  .foregroundColor(.green)
  .padding(12)
  .background(Capsule().fill(Color.green.opacity(0.2)))</pre>
  <div class="callout callout-tip">
    <strong>Order matters</strong>
    <p>Modifiers apply in order, so <span class="ic">padding</span> followed by <span class="ic">background</span> colors the padded area; reversing them colors only the original content.</p>
  </div>
  <h2>Small reusable views</h2>
  <pre class="code-block">struct StatCard: View {
  let label: String
  let value: String

  var body: some View {
    VStack(spacing: 4) {
      Text(label).font(.caption).foregroundStyle(.secondary)
      Text(value).font(.title2.weight(.semibold))
    }
    .frame(maxWidth: .infinity)
    .padding()
    .background(.background.secondary)
    .clipShape(RoundedRectangle(cornerRadius: 12))
  }
}</pre>
  <p>The preview canvas lets you see changes instantly — split the editor and you can iterate on layout without running the app.</p>
</div>
</body>
</html>
$html$
),
(
  '01E00000-0000-4000-8000-000000000414',
  '01E00000-0000-4000-8000-000000000314',
  1,
  'State with @State & @Binding',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>State with @State & @Binding</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
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
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #172554; color: #bfdbfe; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>State with @State &amp; @Binding</h1>
  <p>Views are pure functions of their data: change the data and the view redraws. <strong>Property wrappers</strong> tell SwiftUI which data belongs to a view and how changes should flow.</p>
  <h2>@State — the source of truth</h2>
  <p><span class="ic">@State</span> owns mutable, view-local data. When it changes, SwiftUI re-evaluates <span class="ic">body</span> automatically.</p>
  <pre class="code-block">struct CounterView: View {
  @State private var count = 0

  var body: some View {
    VStack(spacing: 16) {
      Text(&quot;Count: \(count)&quot;)
        .font(.title)

      HStack {
        Button(&quot;+1&quot;) { count += 1 }
        Button(&quot;Reset&quot;) { count = 0 }
          .disabled(count == 0)
      }
    }
  }
}</pre>
  <h2>@Binding — a two-way link</h2>
  <p>Pass editable state down with <span class="ic">@Binding</span>. The child reads and writes through the link; the parent still owns the value.</p>
  <pre class="code-block">struct SettingsView: View {
  @State private var notifications = true

  var body: some View {
    ToggleRow(isEnabled: $notifications)   // $ gives a Binding
  }
}

struct ToggleRow: View {
  @Binding var isEnabled: Bool

  var body: some View {
    Toggle(&quot;Notifications&quot;, isOn: $isEnabled)
  }
}</pre>
  <p>The <span class="ic">$</span> prefix converts a property-wrapped value into its <span class="ic">Binding</span>. Text fields and toggles all expect bindings:</p>
  <pre class="code-block">TextField(&quot;Search a city&quot;, text: $query)
  .textFieldStyle(.roundedBorder)</pre>
  <div class="callout">
    <strong>Ownership stays in one place</strong>
    <p>Keep the <span class="ic">@State</span> in the highest view that truly needs it and pass <span class="ic">@Binding</span> downward. Data flows down; events flow up.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Private by default</strong>
    <p>Mark <span class="ic">@State</span> properties <span class="ic">private</span>. Only the containing view may initialize it directly.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01E00000-0000-4000-8000-000000000416',
  '01E00000-0000-4000-8000-000000000316',
  1,
  'NavigationStack & NavigationLink',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NavigationStack & NavigationLink</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
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
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #172554; color: #bfdbfe; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>NavigationStack &amp; NavigationLink</h1>
  <p>Most apps are a hierarchy: a top list, a detail screen, and a settings screen. <span class="ic">NavigationStack</span> owns that stack, and <span class="ic">NavigationLink</span> pushes destinations onto it.</p>
  <h2>A basic navigation stack</h2>
  <pre class="code-block">struct HomeView: View {
  var body: some View {
    NavigationStack {
      List {
        NavigationLink(&quot;Forecast&quot;) { ForecastDetailView() }
        NavigationLink(&quot;Settings&quot;) { SettingsView() }
      }
      .navigationTitle(&quot;Weather&quot;)
    }
  }
}</pre>
  <p>The back button appears automatically; the system animates the push and manages the transition.</p>
  <h2>Value-based navigation</h2>
  <p>For dynamic screens, push a <em>value</em> and let SwiftUI render the matching destination. The value type must be <span class="ic">Hashable</span>.</p>
  <pre class="code-block">struct CityList: View {
  let cities: [City]

  var body: some View {
    NavigationStack {
      List(cities) { city in
        NavigationLink(value: city) { Text(city.name) }
      }
      .navigationDestination(for: City.self) { city in
        CityDetailView(city: city)
      }
      .navigationTitle(&quot;Cities&quot;)
    }
  }
}</pre>
  <h2>Programmatic control with NavigationPath</h2>
  <pre class="code-block">struct Router: View {
  @State private var path = NavigationPath()

  var body: some View {
    NavigationStack(path: $path) {
      Button(&quot;Open second screen&quot;) {
        path.append(&quot;deeplink-target&quot;)
      }
      .navigationDestination(for: String.self) { route in
        Text(&quot;You reached \(route)&quot;)
      }
    }
  }
}</pre>
  <div class="callout callout-tip">
    <strong>NavigationView is legacy</strong>
    <p>Use <span class="ic">NavigationStack</span> (iOS 16+). The older <span class="ic">NavigationView</span> is deprecated and behaves poorly with dynamic paths.</p>
  </div>
  <div class="callout callout-info">
    <strong>Match destination types</strong>
    <p>A <span class="ic">navigationDestination(for:)</span> must pair with a <span class="ic">NavigationLink(value:)</span> of the same type — otherwise nothing is pushed.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01E00000-0000-4000-8000-000000000417',
  '01E00000-0000-4000-8000-000000000317',
  1,
  'Lists & Dynamic Content',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Lists & Dynamic Content</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
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
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #172554; color: #bfdbfe; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Lists &amp; Dynamic Content</h1>
  <p><span class="ic">List</span> renders a scrollable collection of rows with a native look and free features like swipe actions and deletion. It pairs with the model work you did in earlier modules.</p>
  <h2>Identifiable keeps rows stable</h2>
  <p>SwiftUI needs to know <em>which</em> row is which when data changes. Conforming your model to <span class="ic">Identifiable</span> gives it a stable <span class="ic">id</span>.</p>
  <pre class="code-block">struct City: Identifiable, Hashable {
  let id = UUID()
  var name: String
  var country: String
  var population: Int
}

struct CityRow: View {
  let city: City

  var body: some View {
    VStack(alignment: .leading) {
      Text(city.name).font(.headline)
      Text(&quot;\(city.country) — \(city.population.formatted())&quot;)
        .font(.subheadline)
        .foregroundStyle(.secondary)
    }
  }
}</pre>
  <h2>List + ForEach</h2>
  <pre class="code-block">struct CityListView: View {
  let cities: [City]

  var body: some View {
    List {
      ForEach(cities) { city in
        NavigationLink(value: city) { CityRow(city: city) }
      }
    }
    .navigationDestination(for: City.self) { city in
      CityDetailView(city: city)
    }
  }
}</pre>
  <p>You can also skip <span class="ic">ForEach</span> entirely: <span class="ic">List(cities) { city in ... }</span> does the same for simple cases.</p>
  <h2>Editing: delete and move</h2>
  <pre class="code-block">List {
  ForEach(items) { item in
    Row(item)
  }
  .onDelete { offsets in items.remove(atOffsets: offsets) }
  .onMove { source, destination in items.move(fromOffsets: source, toOffset: destination) }
}</pre>
  <div class="callout callout-tip">
    <strong>Prefers constant data</strong>
    <p>Rows should read from the model, never build rows by slicing arrays inside <span class="ic">body</span> with raw indices — index drift is the classic list bug.</p>
  </div>
  <div class="callout callout-info">
    <strong>Sections organize</strong>
    <p>Wrap rows in <span class="ic">Section("Favorites") { ... }</span> to add headers and styled grouping.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01E00000-0000-4000-8000-000000000419',
  '01E00000-0000-4000-8000-000000000319',
  1,
  'Networking with async/await',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Networking with async/await</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
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
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #172554; color: #bfdbfe; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Networking with async/await</h1>
  <p>Swift models slow work — network calls, file reads — with <strong>async/await</strong>. An <span class="ic">async</span> function can pause without blocking the UI thread, and <span class="ic">await</span> marks the pause points.</p>
  <h2>Fetching with URLSession</h2>
  <pre class="code-block">struct WeatherResponse: Decodable {
  let name: String
  let main: Main

  struct Main: Decodable {
    let temp: Double
  }
}

func fetchWeather(city: String) async throws -&gt; WeatherResponse {
  let encoded = city.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? &quot;&quot;
  let url = URL(string: &quot;https://api.example.com/weather?q=\(encoded)&quot;)!

  let (data, response) = try await URLSession.shared.data(from: url)

  guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
    throw URLError(.badServerResponse)
  }

  return try JSONDecoder().decode(WeatherResponse.self, from: data)
}</pre>
  <p><span class="ic">URLSession.shared.data(from:)</span> returns the raw bytes and the HTTP response <em>after awaiting</em>. We still check the status code — network layer errors and HTTP errors are different things.</p>
  <h2>Calling from a view</h2>
  <pre class="code-block">struct ForecastView: View {
  @State private var weather: WeatherResponse?
  @State private var message = &quot;&quot;

  var body: some View {
    VStack {
      if let weather {
        Text(weather.name).font(.title)
        Text(&quot;\(weather.main.temp)&deg;C&quot;).font(.largeTitle)
      } else if !message.isEmpty {
        Text(message).foregroundStyle(.red)
      } else {
        ProgressView()
      }
    }
    .task {
      do {
        weather = try await fetchWeather(city: &quot;Portland&quot;)
      } catch {
        message = error.localizedDescription
      }
    }
  }
}</pre>
  <div class="callout callout-tip">
    <strong>.task is cancellation-aware</strong>
    <p><span class="ic">.task { }</span> launches on the main actor when the view appears and cancels automatically when it disappears — no leaked requests.</p>
  </div>
  <div class="callout">
    <strong>Never block the main thread</strong>
    <p>Do not use <span class="ic">DispatchQueue.main.sync</span> or semaphores to &ldquo;wait&rdquo; for a request. Nothing renders during a main-thread block; the app freezes.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01E00000-0000-4000-8000-000000000420',
  '01E00000-0000-4000-8000-000000000320',
  1,
  'Codable & JSON Decoding',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Codable & JSON Decoding</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
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
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #172554; color: #bfdbfe; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Codable &amp; JSON Decoding</h1>
  <p>A network response is just text until you turn it into typed models. Declare <span class="ic">Decodable</span> conformance on your structs and <span class="ic">JSONDecoder</span> does the mapping — including nested structures.</p>
  <h2>The payload</h2>
  <pre class="code-block">{
  &quot;name&quot;: &quot;Portland&quot;,
  &quot;main&quot;: {
    &quot;temp&quot;: 21.5,
    &quot;humidity&quot;: 62
  },
  &quot;weather&quot;: [
    { &quot;main&quot;: &quot;Clouds&quot;, &quot;description&quot;: &quot;scattered clouds&quot; }
  ]
}</pre>
  <h2>The model</h2>
  <pre class="code-block">struct CurrentWeather: Decodable {
  let name: String
  let main: Main
  let weather: [Condition]

  struct Main: Decodable {
    let temp: Double
    let humidity: Int
  }

  struct Condition: Decodable {
    let main: String
  }
}</pre>
  <p>Property names match JSON keys by default. Only rename when the server disagrees with your style:</p>
  <pre class="code-block">struct CurrentWeather: Decodable {
  let cityName: String
  let temperature: Double

  enum CodingKeys: String, CodingKey {
    case cityName = &quot;name&quot;
    case temperature = &quot;temp&quot;
  }
}</pre>
  <h2>Decoding the data</h2>
  <pre class="code-block">let decoder = JSONDecoder()

do {
  let weather = try decoder.decode(CurrentWeather.self, from: data)
  print(weather.temperature)
} catch {
  print(&quot;Decode failed: \(error)&quot;)
}</pre>
  <ul>
    <li>Decoding <strong>throws</strong> — a misplaced key or type mismatch surfaces as an error.</li>
    <li>Handle optional fields with optional properties rather than force-unwrapping.</li>
    <li>Dates need a strategy; read the API docs and set <span class="ic">decoder.dateDecodingStrategy</span> accordingly.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Decode, then transform</strong>
    <p>Keep models close to the wire format. Compute display-friendly values (formatted dates, rounded temps) in view-model code, not in the decoder.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01E00000-0000-4000-8000-000000000422',
  '01E00000-0000-4000-8000-000000000322',
  1,
  'UserDefaults & Preferences',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>UserDefaults & Preferences</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
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
.dark .lesson-page .ic { background: #172554; color: #bfdbfe; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #172554; color: #bfdbfe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>UserDefaults &amp; Preferences</h1>
  <p>Settings like the last searched city, a theme choice, or a unit preference should survive app restarts. <span class="ic">UserDefaults</span> is the built-in store for small, lightweight values.</p>
  <pre class="code-block">let defaults = UserDefaults.standard

// Save
defaults.set(&quot;Portland&quot;, forKey: &quot;lastCity&quot;)
defaults.set(21.5, forKey: &quot;lastTemp&quot;)
defaults.set(true, forKey: &quot;isCelsius&quot;)
defaults.set([&quot;Portland&quot;, &quot;Seattle&quot;], forKey: &quot;recentCities&quot;)

// Load — remember, the value may be nil
let lastCity = defaults.string(forKey: &quot;lastCity&quot;)
let lastTemp = defaults.double(forKey: &quot;lastTemp&quot;)
let isCelsius = defaults.bool(forKey: &quot;isCelsius&quot;)
let recent = defaults.stringArray(forKey: &quot;recentCities&quot;) ?? []

// Remove
defaults.removeObject(forKey: &quot;lastTemp&quot;)</pre>
  <h2>Reading methods</h2>
  <table>
    <tr><th>Stored</th><th>Read with</th></tr>
    <tr><td>String</td><td>string(forKey:)</td></tr>
    <tr><td>Int / Double / Bool</td><td>integer(forKey:) / double(forKey:) / bool(forKey:)</td></tr>
    <tr><td>[String]</td><td>stringArray(forKey:)</td></tr>
    <tr><td>Data</td><td>data(forKey:)</td></tr>
  </table>
  <p>Reading a missing key returns <span class="ic">nil</span> (or 0 / false for the numeric variants) — never a crash.</p>
  <h2>UserDefaults as a source of truth in SwiftUI</h2>
  <pre class="code-block">@AppStorage(&quot;isCelsius&quot;) private var isCelsius = true

Toggle(&quot;Celsius&quot;, isOn: $isCelsius)</pre>
  <p><span class="ic">@AppStorage</span> wraps a UserDefaults key as observable state: writing updates both the store and the UI automatically.</p>
  <div class="callout">
    <strong>Right tool for the job</strong>
    <p>Use UserDefaults for <em>preferences</em>. Collections of documents or records belong in files (next lesson) — UserDefaults is not a database.</p>
  </div>
  <div class="callout callout-info">
    <strong>Never store secrets here</strong>
    <p>UserDefaults is unencrypted and visible to anyone who backs up a device. API keys and tokens belong in the Keychain.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01E00000-0000-4000-8000-000000000423',
  '01E00000-0000-4000-8000-000000000323',
  1,
  'File Persistence with Codable',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>File Persistence with Codable</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
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
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #172554; color: #bfdbfe; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>File Persistence with Codable</h1>
  <p>For lists and documents, write your own files. The <span class="ic">Documents</span> directory is backed up and user-visible; <span class="ic">JSONEncoder</span> + <span class="ic">JSONDecoder</span> convert Codable models to bytes and back.</p>
  <h2>The model and store</h2>
  <pre class="code-block">struct Note: Codable, Identifiable {
  var id = UUID()
  var title: String
  var body: String
  var createdAt = Date()
}

final class NoteStore {
  static let shared = NoteStore()
  var notes: [Note] = []

  private var fileURL: URL {
    let docs = FileManager.default.urls(
      for: .documentDirectory,
      in: .userDomainMask
    )[0]
    return docs.appendingPathComponent(&quot;notes.json&quot;)
  }

  func save() throws {
    let data = try JSONEncoder().encode(notes)
    try data.write(to: fileURL, options: [.atomic])
  }

  func load() {
    guard let data = try? Data(contentsOf: fileURL) else { return }
    notes = (try? JSONDecoder().decode([Note].self, from: data)) ?? []
  }
}</pre>
  <h2>A closer look</h2>
  <ul>
    <li><span class="ic">FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)</span> resolves the app&rsquo;s Documents folder in a sandbox — always use this, never hardcode paths.</li>
    <li><span class="ic">.atomic</span> writes to a temp file and swaps it into place, so a crash mid-write cannot corrupt your data.</li>
    <li><span class="ic">try?</span> treats a missing file as &ldquo;start empty&rdquo; rather than an error.</li>
  </ul>
  <h2>Wire it into the UI</h2>
  <pre class="code-block">struct NotesView: View {
  @State private var store = NoteStore()

  var body: some View {
    List(store.notes) { note in
      VStack(alignment: .leading) {
        Text(note.title).font(.headline)
        Text(note.body).font(.subheadline).foregroundStyle(.secondary)
      }
    }
    .onAppear { store.load() }
    .toolbar {
      Button(&quot;Add&quot;) {
        store.notes.append(Note(title: &quot;New&quot;, body: &quot;&quot;))
        try? store.save()
      }
    }
  }
}</pre>
  <div class="callout callout-tip">
    <strong>Persist after every mutation</strong>
    <p>Save immediately whenever the array changes. Postponing saves is how apps lose your work at the worst moment.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01E00000-0000-4000-8000-000000000425',
  '01E00000-0000-4000-8000-000000000325',
  1,
  'Testing with XCTest',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Testing with XCTest</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
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
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #172554; color: #bfdbfe; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Testing with XCTest</h1>
  <p>Your model logic — validation, averages, decoding — is the part that <em>can</em> be tested, and XCTest is the framework Xcode ships for the job. Pure functions and value types make it easy.</p>
  <h2>Create the test target</h2>
  <ol>
    <li><span class="ic">File → New → Target → Unit Testing Bundle</span>.</li>
    <li>Name it like <span class="ic">MyNotesTests</span> and let Xcode create the scheme.</li>
    <li>Run with <span class="ic">Product → Test</span> (or Cmd+U).</li>
  </ol>
  <h2>A test case</h2>
  <pre class="code-block">import XCTest
@testable import MyNotes

final class ScoreCalculatorTests: XCTestCase {

  func testValidScorePassesThrough() {
    let result = ScoreCalculator.validate(87)
    XCTAssertEqual(try result.get(), 87)
  }

  func testScoreBelowZeroIsRejected() {
    XCTAssertThrowsError(try ScoreCalculator.validate(-1)) { error in
      XCTAssertEqual(error as? ScoreError, .belowZero)
    }
  }

  func testAverageRoundsCorrectly() {
    let avg = Forecast(city: &quot;Oslo&quot;, high: 12, low: 6).average
    XCTAssertEqual(avg, 9.0, accuracy: 0.001)
  }
}</pre>
  <p><span class="ic">@testable import</span> exposes your app&rsquo;s internal types to the test target. Every <span class="ic">func testX()</span> runs as its own scenario.</p>
  <h2>Lifecycle hooks</h2>
  <pre class="code-block">final class NoteStoreTests: XCTestCase {
  private var store: NoteStore!

  override func setUp() {
    super.setUp()
    store = NoteStore()   // fresh state per test
  }

  override func tearDown() {
    store = nil
    super.tearDown()
  }
}</pre>
  <h2>Common assertions</h2>
  <ul>
    <li><span class="ic">XCTAssertEqual(a, b)</span> — equality; add <span class="ic">accuracy:</span> for Doubles.</li>
    <li><span class="ic">XCTAssertNil / XCTAssertNotNil</span> — optional checks.</li>
    <li><span class="ic">XCTAssertThrowsError</span> — the code must fail.</li>
    <li><span class="ic">XCTAssertTrue / XCTAssertFalse</span> — boolean outcomes.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Test before you fix</strong>
    <p>When a bug is reported, write a test that reproduces it, watch it fail, then fix the code until it passes. That test guards the fix forever.</p>
  </div>
  <div class="callout callout-info">
    <strong>Keep tests fast</strong>
    <p>Favor pure functions over network and UI. A suite that runs in seconds will actually be run — daily, and in CI.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01E00000-0000-4000-8000-000000000426',
  '01E00000-0000-4000-8000-000000000326',
  1,
  'App Store Basics',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>App Store Basics</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
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
.dark .lesson-page .ic { background: #172554; color: #bfdbfe; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #172554; color: #bfdbfe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>App Store Basics</h1>
  <p>Shipping is a process, not a button. You will prepare metadata in <strong>App Store Connect</strong>, upload a build from Xcode, test it with <strong>TestFlight</strong>, and submit it for review.</p>
  <h2>The pipeline</h2>
  <table>
    <tr><th>Step</th><th>What you do</th></tr>
    <tr><td>1. Developer account</td><td>Enroll in the Apple Developer Program</td></tr>
    <tr><td>2. App record</td><td>Create the app&rsquo;s listing in App Store Connect</td></tr>
    <tr><td>3. Signing</td><td>Xcode manages certificates and provisioning automatically</td></tr>
    <tr><td>4. Upload</td><td>Archive and distribute an internal build</td></tr>
    <tr><td>5. TestFlight</td><td>Invite testers and install on real devices</td></tr>
    <tr><td>6. Submit</td><td>Complete metadata, screenshots, and privacy answers</td></tr>
    <tr><td>7. Review</td><td>Wait for human + automated review</td></tr>
  </table>
  <h2>Signing in one line</h2>
  <p>With <span class="ic">Signing &amp; Capabilities → Automatically manage signing</span>, Xcode creates the certificates and provisioning profiles. You only need the team selected in <span class="ic">General</span>.</p>
  <h2>Metadata that matters</h2>
  <ul>
    <li>App name, subtitle, and a short description that leads with value.</li>
    <li>6.7-inch and 6.5-inch screenshots showing core screens, not empty states.</li>
    <li>Privacy &ldquo;nutrition labels&rdquo; — declare every data collection accurately.</li>
    <li>A support URL and privacy policy URL.</li>
  </ul>
  <h2>Review guidelines to remember</h2>
  <div class="callout">
    <strong>2.3 and 5.1 bite people</strong>
    <p>Guideline 2.3 bans inaccurate or misleading metadata; 5.1 covers user data and requires consent. Read both before submitting to avoid an easy rejection cycle.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Release on your terms</strong>
    <p>Use <span class="ic">TestFlight</span> with beta testers first, and set <span class="ic">Manual Release</span> so you control when the build goes live.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01E00000-0000-4000-8000-000000000427',
  '01E00000-0000-4000-8000-000000000327',
  1,
  'Capstone: Building MyNotes',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Building MyNotes</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
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
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #172554; color: #bfdbfe; }
.dark .lesson-page .callout { background: #172554; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Building MyNotes</h1>
  <p>Time to combine everything: a <strong>notes app</strong> that lists notes, adds new ones, edits detail, persists to disk with <span class="ic">Codable</span>, and keeps its logic covered by tests.</p>
  <h2>1. The model</h2>
  <pre class="code-block">struct Note: Codable, Identifiable {
  var id = UUID()
  var title: String
  var body: String
  var createdAt = Date()
}</pre>
  <h2>2. The store (from module 4)</h2>
  <pre class="code-block">final class NoteStore {
  static let shared = NoteStore()
  var notes: [Note] = []

  func save() throws { /* encode and write to Documents */ }
  func load() { /* read and decode, or start empty */ }
}</pre>
  <h2>3. The list view</h2>
  <pre class="code-block">struct NotesListView: View {
  @State private var store = NoteStore.shared

  var body: some View {
    NavigationStack {
      List(store.notes) { note in
        NavigationLink(value: note) { NoteRow(note: note) }
      }
      .navigationDestination(for: Note.self) { note in
        NoteDetailView(note: note)
      }
      .navigationTitle(&quot;MyNotes&quot;)
      .toolbar {
        Button {
          store.notes.append(Note(title: &quot;New Note&quot;, body: &quot;&quot;))
          try? store.save()
        } label: {
          Label(&quot;Add&quot;, systemImage: &quot;plus&quot;)
        }
      }
    }
  }
}</pre>
  <h2>4. The detail view</h2>
  <pre class="code-block">struct NoteDetailView: View {
  @State var note: Note

  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      TextField(&quot;Title&quot;, text: $note.title).font(.title2.bold())
      TextEditor(text: $note.body).frame(minHeight: 200)
    }
    .padding()
  }
}</pre>
  <h2>5. The test</h2>
  <pre class="code-block">func testStoreRoundTripsNotes() throws {
  let store = NoteStore()
  store.notes = [Note(title: &quot;Hello&quot;, body: &quot;World&quot;)]
  try store.save()
  let other = NoteStore()
  other.load()
  XCTAssertEqual(other.notes.count, 1)
  XCTAssertEqual(other.notes.first?.title, &quot;Hello&quot;)
}</pre>
  <div class="callout callout-tip">
    <strong>Extensions to stretch into</strong>
    <p>Search with <span class="ic">filter { $0.title.localizedCaseInsensitiveContains(query) }</span>, swipe-to-delete with <span class="ic">onDelete</span>, or sort by <span class="ic">createdAt</span>. Each builds on a pattern already in this course.</p>
  </div>
  <div class="callout callout-info">
    <strong>Ship checklist</strong>
    <p>Tests green with Cmd+U, hardcoded strings replaced, empty states handled, and the app run on a physical device. Then you are ready for the App Store lesson.</p>
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
  ('01E00000-0000-4000-8000-000000000501', '01E00000-0000-4000-8000-000000000303',
   'Which keyword declares a value that cannot be reassigned?',
   'let creates a constant; the compiler rejects any later reassignment.', 1),
  ('01E00000-0000-4000-8000-000000000502', '01E00000-0000-4000-8000-000000000303',
   'Which type represents a whole number in Swift?',
   'Int stores whole numbers; Double and Float store fractional values.', 2),
  ('01E00000-0000-4000-8000-000000000503', '01E00000-0000-4000-8000-000000000303',
   'What does type inference do?',
   'The compiler works out each constants type from its initial value.', 3),
  ('01E00000-0000-4000-8000-000000000504', '01E00000-0000-4000-8000-000000000306',
   'How do you declare an optional String variable?',
   'Appending ? to a type marks it optional: it may hold a value or nil.', 1),
  ('01E00000-0000-4000-8000-000000000505', '01E00000-0000-4000-8000-000000000306',
   'Which code safely unwraps an optional and binds the value?',
   'if let unwraps only when a value is present, so the body is safe.', 2),
  ('01E00000-0000-4000-8000-000000000506', '01E00000-0000-4000-8000-000000000306',
   'Which collection stores unordered, unique values?',
   'A Set drops duplicates and does not guarantee ordering.', 3),
  ('01E00000-0000-4000-8000-000000000507', '01E00000-0000-4000-8000-000000000309',
   'Which statement about structs is true?',
   'A struct is a value type; copying it creates an independent copy.', 1),
  ('01E00000-0000-4000-8000-000000000508', '01E00000-0000-4000-8000-000000000309',
   'How does one class inherit from another in Swift?',
   'Write the superclass name after a colon in the class declaration.', 2),
  ('01E00000-0000-4000-8000-000000000509', '01E00000-0000-4000-8000-000000000309',
   'What is a protocol?',
   'A protocol lists requirements that conforming types must implement.', 3),
  ('01E00000-0000-4000-8000-000000000510', '01E00000-0000-4000-8000-000000000312',
   'Which keyword exits a loop immediately?',
   'break stops the loop; continue skips to the next iteration.', 1),
  ('01E00000-0000-4000-8000-000000000511', '01E00000-0000-4000-8000-000000000312',
   'What does an underscore in func count(_ items: [Int]) do?',
   'It removes the external label so callers omit the argument name.', 2),
  ('01E00000-0000-4000-8000-000000000512', '01E00000-0000-4000-8000-000000000312',
   'How do you declare a function that can throw an error?',
   'Add throws to the signature, then use try when calling it.', 3),
  ('01E00000-0000-4000-8000-000000000513', '01E00000-0000-4000-8000-000000000315',
   'Which property wrapper owns mutable state inside a view?',
   '@State stores a source of truth that the view can update.', 1),
  ('01E00000-0000-4000-8000-000000000514', '01E00000-0000-4000-8000-000000000315',
   'Which container stacks children vertically, top to bottom?',
   'VStack arranges children along the vertical axis.', 2),
  ('01E00000-0000-4000-8000-000000000515', '01E00000-0000-4000-8000-000000000315',
   'What happens when a @State property changes?',
   'SwiftUI invalidates the view and re-evaluates its body.', 3),
  ('01E00000-0000-4000-8000-000000000516', '01E00000-0000-4000-8000-000000000318',
   'Which container provides push-based navigation?',
   'NavigationStack pushes destinations and manages a path.', 1),
  ('01E00000-0000-4000-8000-000000000517', '01E00000-0000-4000-8000-000000000318',
   'What does NavigationLink do?',
   'It creates a tappable row that pushes a destination onto the stack.', 2),
  ('01E00000-0000-4000-8000-000000000518', '01E00000-0000-4000-8000-000000000318',
   'Which protocol gives each row a stable identity in a List?',
   'Conforming to Identifiable provides the id that ForEach requires.', 3),
  ('01E00000-0000-4000-8000-000000000519', '01E00000-0000-4000-8000-000000000321',
   'What does await do inside an async function?',
   'await suspends the function until the awaited task provides a result.', 1),
  ('01E00000-0000-4000-8000-000000000520', '01E00000-0000-4000-8000-000000000321',
   'Which type starts an asynchronous unit of work from a view?',
   'Task launches a structured concurrency task you can cancel.', 2),
  ('01E00000-0000-4000-8000-000000000521', '01E00000-0000-4000-8000-000000000321',
   'Which protocol enables JSONDecoder to map JSON into your types?',
   'Codable combines Encodable and Decodable for JSON mapping.', 3),
  ('01E00000-0000-4000-8000-000000000522', '01E00000-0000-4000-8000-000000000324',
   'Which store is ideal for small preference values?',
   'UserDefaults keeps lightweight key-value data without files or schemas.', 1),
  ('01E00000-0000-4000-8000-000000000523', '01E00000-0000-4000-8000-000000000324',
   'Which call writes an encoded Data blob to a file URL?',
   'Data.write(to:options:) persists the encoded payload to a file URL.', 2),
  ('01E00000-0000-4000-8000-000000000524', '01E00000-0000-4000-8000-000000000324',
   'Which directory may iOS clear automatically when space is low?',
   'The Caches directory is non-critical and safe to purge.', 3),
  ('01E00000-0000-4000-8000-000000000525', '01E00000-0000-4000-8000-000000000328',
   'Which type wraps a value that may be absent?',
   'Optional can hold a value or nil; you unwrap it before use.', 1),
  ('01E00000-0000-4000-8000-000000000526', '01E00000-0000-4000-8000-000000000328',
   'Which view renders a scrollable list of rows?',
   'List provides a table-style list with built-in styling.', 2),
  ('01E00000-0000-4000-8000-000000000527', '01E00000-0000-4000-8000-000000000328',
   'Which steps decode a JSON response correctly?',
   'Conform your model to Codable, then decode with JSONDecoder.', 3),
  ('01E00000-0000-4000-8000-000000000528', '01E00000-0000-4000-8000-000000000328',
   'Which property wrapper passes editable state down to a child view?',
   '@Binding creates a two-way link to a @State value owned by a parent.', 4),
  ('01E00000-0000-4000-8000-000000000529', '01E00000-0000-4000-8000-000000000328',
   'What do you create in App Store Connect before your first upload?',
   'An app record holds metadata, builds, and review information.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): let
  ('01E00000-0000-4000-8000-000000001001', '01E00000-0000-4000-8000-000000000501', 'let', TRUE,  1),
  ('01E00000-0000-4000-8000-000000001002', '01E00000-0000-4000-8000-000000000501', 'var', FALSE, 2),
  ('01E00000-0000-4000-8000-000000001003', '01E00000-0000-4000-8000-000000000501', 'const', FALSE, 3),
  ('01E00000-0000-4000-8000-000000001004', '01E00000-0000-4000-8000-000000000501', 'final', FALSE, 4),
  -- Q1 (501)q2: Int
  ('01E00000-0000-4000-8000-000000001005', '01E00000-0000-4000-8000-000000000502', 'Int', TRUE,  1),
  ('01E00000-0000-4000-8000-000000001006', '01E00000-0000-4000-8000-000000000502', 'Double', FALSE, 2),
  ('01E00000-0000-4000-8000-000000001007', '01E00000-0000-4000-8000-000000000502', 'String', FALSE, 3),
  ('01E00000-0000-4000-8000-000000001008', '01E00000-0000-4000-8000-000000000502', 'Bool', FALSE, 4),
  -- Q1 (501)q3: type inference
  ('01E00000-0000-4000-8000-000000001009', '01E00000-0000-4000-8000-000000000503', 'It infers the type from the initial value', TRUE,  1),
  ('01E00000-0000-4000-8000-000000001010', '01E00000-0000-4000-8000-000000000503', 'It converts values to strings', FALSE, 2),
  ('01E00000-0000-4000-8000-000000001011', '01E00000-0000-4000-8000-000000000503', 'It removes type safety', FALSE, 3),
  ('01E00000-0000-4000-8000-000000001012', '01E00000-0000-4000-8000-000000000503', 'It picks a random type', FALSE, 4),
  -- Q2 (504): optional String
  ('01E00000-0000-4000-8000-000000001013', '01E00000-0000-4000-8000-000000000504', 'var name: String?', TRUE,  1),
  ('01E00000-0000-4000-8000-000000001014', '01E00000-0000-4000-8000-000000000504', 'var name: String', FALSE, 2),
  ('01E00000-0000-4000-8000-000000001015', '01E00000-0000-4000-8000-000000000504', 'let name: String = nil', FALSE, 3),
  ('01E00000-0000-4000-8000-000000001016', '01E00000-0000-4000-8000-000000000504', 'var name: Int', FALSE, 4),
  -- Q2 (504)q2: if let
  ('01E00000-0000-4000-8000-000000001017', '01E00000-0000-4000-8000-000000000505', 'if let value = optionalValue', TRUE,  1),
  ('01E00000-0000-4000-8000-000000001018', '01E00000-0000-4000-8000-000000000505', 'let value = optionalValue', FALSE, 2),
  ('01E00000-0000-4000-8000-000000001019', '01E00000-0000-4000-8000-000000000505', 'for value in optionalValue', FALSE, 3),
  ('01E00000-0000-4000-8000-000000001020', '01E00000-0000-4000-8000-000000000505', 'while value = optionalValue', FALSE, 4),
  -- Q2 (504)q3: Set
  ('01E00000-0000-4000-8000-000000001021', '01E00000-0000-4000-8000-000000000506', 'Set', TRUE,  1),
  ('01E00000-0000-4000-8000-000000001022', '01E00000-0000-4000-8000-000000000506', 'Array', FALSE, 2),
  ('01E00000-0000-4000-8000-000000001023', '01E00000-0000-4000-8000-000000000506', 'Dictionary', FALSE, 3),
  ('01E00000-0000-4000-8000-000000001024', '01E00000-0000-4000-8000-000000000506', 'String', FALSE, 4),
  -- Q3 (507): structs
  ('01E00000-0000-4000-8000-000000001025', '01E00000-0000-4000-8000-000000000507', 'They are copied by value', TRUE,  1),
  ('01E00000-0000-4000-8000-000000001026', '01E00000-0000-4000-8000-000000000507', 'They are shared by reference', FALSE, 2),
  ('01E00000-0000-4000-8000-000000001027', '01E00000-0000-4000-8000-000000000507', 'They cannot have methods', FALSE, 3),
  ('01E00000-0000-4000-8000-000000001028', '01E00000-0000-4000-8000-000000000507', 'They require an init body', FALSE, 4),
  -- Q3 (507)q2: inheritance
  ('01E00000-0000-4000-8000-000000001029', '01E00000-0000-4000-8000-000000000508', 'class Dog: Animal', TRUE,  1),
  ('01E00000-0000-4000-8000-000000001030', '01E00000-0000-4000-8000-000000000508', 'class Dog extends Animal', FALSE, 2),
  ('01E00000-0000-4000-8000-000000001031', '01E00000-0000-4000-8000-000000000508', 'class Dog inherits Animal', FALSE, 3),
  ('01E00000-0000-4000-8000-000000001032', '01E00000-0000-4000-8000-000000000508', 'import Animal', FALSE, 4),
  -- Q3 (507)q3: protocol
  ('01E00000-0000-4000-8000-000000001033', '01E00000-0000-4000-8000-000000000509', 'A blueprint of requirements', TRUE,  1),
  ('01E00000-0000-4000-8000-000000001034', '01E00000-0000-4000-8000-000000000509', 'A stored property', FALSE, 2),
  ('01E00000-0000-4000-8000-000000001035', '01E00000-0000-4000-8000-000000000509', 'A built-in collection', FALSE, 3),
  ('01E00000-0000-4000-8000-000000001036', '01E00000-0000-4000-8000-000000000509', 'A view container', FALSE, 4),
  -- Q4 (510): break
  ('01E00000-0000-4000-8000-000000001037', '01E00000-0000-4000-8000-000000000510', 'break', TRUE,  1),
  ('01E00000-0000-4000-8000-000000001038', '01E00000-0000-4000-8000-000000000510', 'continue', FALSE, 2),
  ('01E00000-0000-4000-8000-000000001039', '01E00000-0000-4000-8000-000000000510', 'return', FALSE, 3),
  ('01E00000-0000-4000-8000-000000001040', '01E00000-0000-4000-8000-000000000510', 'print', FALSE, 4),
  -- Q4 (510)q2: underscore
  ('01E00000-0000-4000-8000-000000001041', '01E00000-0000-4000-8000-000000000511', 'It removes the external label', TRUE,  1),
  ('01E00000-0000-4000-8000-000000001042', '01E00000-0000-4000-8000-000000000511', 'It marks the value inout', FALSE, 2),
  ('01E00000-0000-4000-8000-000000001043', '01E00000-0000-4000-8000-000000000511', 'It makes the parameter variadic', FALSE, 3),
  ('01E00000-0000-4000-8000-000000001044', '01E00000-0000-4000-8000-000000000511', 'It names the return type', FALSE, 4),
  -- Q4 (510)q3: throws
  ('01E00000-0000-4000-8000-000000001045', '01E00000-0000-4000-8000-000000000512', 'Add throws to the signature', TRUE,  1),
  ('01E00000-0000-4000-8000-000000001046', '01E00000-0000-4000-8000-000000000512', 'Add try to the signature', FALSE, 2),
  ('01E00000-0000-4000-8000-000000001047', '01E00000-0000-4000-8000-000000000512', 'Wrap the body in a for loop', FALSE, 3),
  ('01E00000-0000-4000-8000-000000001048', '01E00000-0000-4000-8000-000000000512', 'Mark the function private', FALSE, 4),
  -- Q5 (513): @State
  ('01E00000-0000-4000-8000-000000001049', '01E00000-0000-4000-8000-000000000513', '@State', TRUE,  1),
  ('01E00000-0000-4000-8000-000000001050', '01E00000-0000-4000-8000-000000000513', '@Binding', FALSE, 2),
  ('01E00000-0000-4000-8000-000000001051', '01E00000-0000-4000-8000-000000000513', '@Published', FALSE, 3),
  ('01E00000-0000-4000-8000-000000001052', '01E00000-0000-4000-8000-000000000513', '@FocusState', FALSE, 4),
  -- Q5 (513)q2: VStack
  ('01E00000-0000-4000-8000-000000001053', '01E00000-0000-4000-8000-000000000514', 'VStack', TRUE,  1),
  ('01E00000-0000-4000-8000-000000001054', '01E00000-0000-4000-8000-000000000514', 'HStack', FALSE, 2),
  ('01E00000-0000-4000-8000-000000001055', '01E00000-0000-4000-8000-000000000514', 'ZStack', FALSE, 3),
  ('01E00000-0000-4000-8000-000000001056', '01E00000-0000-4000-8000-000000000514', 'Grid', FALSE, 4),
  -- Q5 (513)q3: body re-evaluates
  ('01E00000-0000-4000-8000-000000001057', '01E00000-0000-4000-8000-000000000515', 'The body re-evaluates', TRUE,  1),
  ('01E00000-0000-4000-8000-000000001058', '01E00000-0000-4000-8000-000000000515', 'The app relaunches', FALSE, 2),
  ('01E00000-0000-4000-8000-000000001059', '01E00000-0000-4000-8000-000000000515', 'Nothing happens', FALSE, 3),
  ('01E00000-0000-4000-8000-000000001060', '01E00000-0000-4000-8000-000000000515', 'The value stays stale', FALSE, 4),
  -- Q6 (516): NavigationStack
  ('01E00000-0000-4000-8000-000000001061', '01E00000-0000-4000-8000-000000000516', 'NavigationStack', TRUE,  1),
  ('01E00000-0000-4000-8000-000000001062', '01E00000-0000-4000-8000-000000000516', 'TabView', FALSE, 2),
  ('01E00000-0000-4000-8000-000000001063', '01E00000-0000-4000-8000-000000000516', 'HStack', FALSE, 3),
  ('01E00000-0000-4000-8000-000000001064', '01E00000-0000-4000-8000-000000000516', 'ScrollView', FALSE, 4),
  -- Q6 (516)q2: NavigationLink
  ('01E00000-0000-4000-8000-000000001065', '01E00000-0000-4000-8000-000000000517', 'It pushes a destination', TRUE,  1),
  ('01E00000-0000-4000-8000-000000001066', '01E00000-0000-4000-8000-000000000517', 'It presents an alert', FALSE, 2),
  ('01E00000-0000-4000-8000-000000001067', '01E00000-0000-4000-8000-000000000517', 'It dismisses the screen', FALSE, 3),
  ('01E00000-0000-4000-8000-000000001068', '01E00000-0000-4000-8000-000000000517', 'It downloads data', FALSE, 4),
  -- Q6 (516)q3: Identifiable
  ('01E00000-0000-4000-8000-000000001069', '01E00000-0000-4000-8000-000000000518', 'Identifiable', TRUE,  1),
  ('01E00000-0000-4000-8000-000000001070', '01E00000-0000-4000-8000-000000000518', 'Equatable', FALSE, 2),
  ('01E00000-0000-4000-8000-000000001071', '01E00000-0000-4000-8000-000000000518', 'Codable', FALSE, 3),
  ('01E00000-0000-4000-8000-000000001072', '01E00000-0000-4000-8000-000000000518', 'CustomStringConvertible', FALSE, 4),
  -- Q7 (519): await
  ('01E00000-0000-4000-8000-000000001073', '01E00000-0000-4000-8000-000000000519', 'It suspends until the task finishes', TRUE,  1),
  ('01E00000-0000-4000-8000-000000001074', '01E00000-0000-4000-8000-000000000519', 'It runs work in parallel without waiting', FALSE, 2),
  ('01E00000-0000-4000-8000-000000001075', '01E00000-0000-4000-8000-000000000519', 'It force-unwraps the result', FALSE, 3),
  ('01E00000-0000-4000-8000-000000001076', '01E00000-0000-4000-8000-000000000519', 'It cancels the request', FALSE, 4),
  -- Q7 (519)q2: Task
  ('01E00000-0000-4000-8000-000000001077', '01E00000-0000-4000-8000-000000000520', 'Task', TRUE,  1),
  ('01E00000-0000-4000-8000-000000001078', '01E00000-0000-4000-8000-000000000520', 'DispatchQueue', FALSE, 2),
  ('01E00000-0000-4000-8000-000000001079', '01E00000-0000-4000-8000-000000000520', 'Operation', FALSE, 3),
  ('01E00000-0000-4000-8000-000000001080', '01E00000-0000-4000-8000-000000000520', 'Timer', FALSE, 4),
  -- Q7 (519)q3: Codable
  ('01E00000-0000-4000-8000-000000001081', '01E00000-0000-4000-8000-000000000521', 'Codable', TRUE,  1),
  ('01E00000-0000-4000-8000-000000001082', '01E00000-0000-4000-8000-000000000521', 'Equatable', FALSE, 2),
  ('01E00000-0000-4000-8000-000000001083', '01E00000-0000-4000-8000-000000000521', 'Identifiable', FALSE, 3),
  ('01E00000-0000-4000-8000-000000001084', '01E00000-0000-4000-8000-000000000521', 'View', FALSE, 4),
  -- Q8 (522): UserDefaults
  ('01E00000-0000-4000-8000-000000001085', '01E00000-0000-4000-8000-000000000522', 'UserDefaults', TRUE,  1),
  ('01E00000-0000-4000-8000-000000001086', '01E00000-0000-4000-8000-000000000522', 'Keychain', FALSE, 2),
  ('01E00000-0000-4000-8000-000000001087', '01E00000-0000-4000-8000-000000000522', 'FileManager', FALSE, 3),
  ('01E00000-0000-4000-8000-000000001088', '01E00000-0000-4000-8000-000000000522', 'URLSession', FALSE, 4),
  -- Q8 (522)q2: write(to:)
  ('01E00000-0000-4000-8000-000000001089', '01E00000-0000-4000-8000-000000000523', 'data.write(to: options:)', TRUE,  1),
  ('01E00000-0000-4000-8000-000000001090', '01E00000-0000-4000-8000-000000000523', 'JSONEncoder().encode(data)', FALSE, 2),
  ('01E00000-0000-4000-8000-000000001091', '01E00000-0000-4000-8000-000000000523', 'UserDefaults.set(data, forKey:)', FALSE, 3),
  ('01E00000-0000-4000-8000-000000001092', '01E00000-0000-4000-8000-000000000523', 'data.append(data)', FALSE, 4),
  -- Q8 (522)q3: Caches
  ('01E00000-0000-4000-8000-000000001093', '01E00000-0000-4000-8000-000000000524', 'The Caches directory', TRUE,  1),
  ('01E00000-0000-4000-8000-000000001094', '01E00000-0000-4000-8000-000000000524', 'The Documents directory', FALSE, 2),
  ('01E00000-0000-4000-8000-000000001095', '01E00000-0000-4000-8000-000000000524', 'Application Support', FALSE, 3),
  ('01E00000-0000-4000-8000-000000001096', '01E00000-0000-4000-8000-000000000524', 'The app bundle', FALSE, 4),
  -- Q9 (525): Optional
  ('01E00000-0000-4000-8000-000000001097', '01E00000-0000-4000-8000-000000000525', 'Optional', TRUE,  1),
  ('01E00000-0000-4000-8000-000000001098', '01E00000-0000-4000-8000-000000000525', 'Struct', FALSE, 2),
  ('01E00000-0000-4000-8000-000000001099', '01E00000-0000-4000-8000-000000000525', 'Protocol', FALSE, 3),
  ('01E00000-0000-4000-8000-000000001100', '01E00000-0000-4000-8000-000000000525', 'Closure', FALSE, 4),
  -- Q9 (525)q2: List
  ('01E00000-0000-4000-8000-000000001101', '01E00000-0000-4000-8000-000000000526', 'List', TRUE,  1),
  ('01E00000-0000-4000-8000-000000001102', '01E00000-0000-4000-8000-000000000526', 'VStack', FALSE, 2),
  ('01E00000-0000-4000-8000-000000001103', '01E00000-0000-4000-8000-000000000526', 'NavigationStack', FALSE, 3),
  ('01E00000-0000-4000-8000-000000001104', '01E00000-0000-4000-8000-000000000526', 'Spacer', FALSE, 4),
  -- Q9 (525)q3: Codable decode
  ('01E00000-0000-4000-8000-000000001105', '01E00000-0000-4000-8000-000000000527', 'Conform to Codable and use JSONDecoder', TRUE,  1),
  ('01E00000-0000-4000-8000-000000001106', '01E00000-0000-4000-8000-000000000527', 'Use JSON.parse', FALSE, 2),
  ('01E00000-0000-4000-8000-000000001107', '01E00000-0000-4000-8000-000000000527', 'Read the raw string directly', FALSE, 3),
  ('01E00000-0000-4000-8000-000000001108', '01E00000-0000-4000-8000-000000000527', 'Call UIKit to parse', FALSE, 4),
  -- Q9 (525)q4: @Binding
  ('01E00000-0000-4000-8000-000000001109', '01E00000-0000-4000-8000-000000000528', '@Binding', TRUE,  1),
  ('01E00000-0000-4000-8000-000000001110', '01E00000-0000-4000-8000-000000000528', '@Published', FALSE, 2),
  ('01E00000-0000-4000-8000-000000001111', '01E00000-0000-4000-8000-000000000528', '@Environment', FALSE, 3),
  ('01E00000-0000-4000-8000-000000001112', '01E00000-0000-4000-8000-000000000528', '@FocusState', FALSE, 4),
  -- Q9 (525)q5: app record
  ('01E00000-0000-4000-8000-000000001113', '01E00000-0000-4000-8000-000000000529', 'An app record', TRUE,  1),
  ('01E00000-0000-4000-8000-000000001114', '01E00000-0000-4000-8000-000000000529', 'A crash report', FALSE, 2),
  ('01E00000-0000-4000-8000-000000001115', '01E00000-0000-4000-8000-000000000529', 'A device profile', FALSE, 3),
  ('01E00000-0000-4000-8000-000000001116', '01E00000-0000-4000-8000-000000000529', 'A payment plan', FALSE, 4)
ON CONFLICT (id) DO NOTHING;
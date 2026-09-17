-- ============================================================================
-- SEED 020: Complete course — "Flutter: Cross-Platform Apps"
-- ----------------------------------------------------------------------------
-- Instructor : Marcus Johnson      (10000000-0000-4000-8000-000000000002)
-- Category   : Mobile Development  (20000000-0000-4000-8000-000000000007)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
-- Position   : 18
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Dart Essentials            → C1 Flutter & Dart Overview · C2 Dart Language Core
--   M2 Flutter Fundamentals       → C3 Widgets in Depth · C4 Layout & Styling
--   M3 Building Interactive UIs   → C5 State Management · C6 Navigation & Forms
--   M4 Data & Networking          → C7 Networking & JSON · C8 Local Persistence
--   M5 Capstone: Travel Journal   → C9 Project Setup · C10 Building & Polishing
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
  '01400000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000002',
  '20000000-0000-4000-8000-000000000007',
  'Flutter: Cross-Platform Apps',
  'flutter-cross-platform-apps',
  'Build one codebase and ship to Android, iOS, and the web. Master the Dart language, Flutter widgets, layout, state, navigation, networking, and persistence — then assemble a complete cross-platform travel journal app.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  18
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('01400000-0000-4000-8000-000000000011', '01400000-0000-4000-8000-000000000001', 'Write type-safe Dart: variables, functions, collections, classes, and null safety.', 1),
  ('01400000-0000-4000-8000-000000000012', '01400000-0000-4000-8000-000000000001', 'Compose UIs from Flutter widgets and lay them out with Rows, Columns, and Stacks.',    2),
  ('01400000-0000-4000-8000-000000000013', '01400000-0000-4000-8000-000000000001', 'Manage state with setState and scalable patterns like Provider.',                       3),
  ('01400000-0000-4000-8000-000000000014', '01400000-0000-4000-8000-000000000001', 'Navigate between screens, validate forms, fetch JSON over HTTP, and persist data.',      4),
  ('01400000-0000-4000-8000-000000000015', '01400000-0000-4000-8000-000000000001', 'Build and polish a complete cross-platform travel journal application.',                5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('01400000-0000-4000-8000-000000000101', '01400000-0000-4000-8000-000000000001', 1, 'Dart Essentials',            'Learn the Dart language that powers Flutter: variables, functions, collections, classes, and null safety.', 'PUBLISHED'),
  ('01400000-0000-4000-8000-000000000102', '01400000-0000-4000-8000-000000000001', 2, 'Flutter Fundamentals',       'Understand widgets, the widget tree, layout primitives, and Material styling.',                              'PUBLISHED'),
  ('01400000-0000-4000-8000-000000000103', '01400000-0000-4000-8000-000000000001', 3, 'Building Interactive UIs',   'Manage state, navigate between screens, and build validated forms.',                                        'PUBLISHED'),
  ('01400000-0000-4000-8000-000000000104', '01400000-0000-4000-8000-000000000001', 4, 'Data & Networking',          'Fetch JSON over HTTP and persist data on the device.',                                                      'PUBLISHED'),
  ('01400000-0000-4000-8000-000000000105', '01400000-0000-4000-8000-000000000001', 5, 'Capstone: Travel Journal',   'Build and polish a complete cross-platform travel journal application.',                                    'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('01400000-0000-4000-8000-000000000201', '01400000-0000-4000-8000-000000000101', 1, 'Flutter & Dart Overview',  'Understand how Flutter renders cross-platform and where Dart code lives.', 'PUBLISHED'),
  ('01400000-0000-4000-8000-000000000202', '01400000-0000-4000-8000-000000000101', 2, 'Dart Language Core',       'Variables, control flow, collections, classes, and null safety.',           'PUBLISHED'),
  ('01400000-0000-4000-8000-000000000203', '01400000-0000-4000-8000-000000000102', 1, 'Widgets in Depth',         'Compose UIs from Stateless and Stateful widgets.',                          'PUBLISHED'),
  ('01400000-0000-4000-8000-000000000204', '01400000-0000-4000-8000-000000000102', 2, 'Layout & Styling',         'Arrange and style UIs with layout primitives and Material themes.',         'PUBLISHED'),
  ('01400000-0000-4000-8000-000000000205', '01400000-0000-4000-8000-000000000103', 1, 'State Management',         'Keep UI in sync with state using setState and Provider.',                   'PUBLISHED'),
  ('01400000-0000-4000-8000-000000000206', '01400000-0000-4000-8000-000000000103', 2, 'Navigation & Forms',       'Move between screens and collect validated user input.',                    'PUBLISHED'),
  ('01400000-0000-4000-8000-000000000207', '01400000-0000-4000-8000-000000000104', 1, 'Networking & JSON',        'Talk to REST APIs and parse JSON into model classes.',                      'PUBLISHED'),
  ('01400000-0000-4000-8000-000000000208', '01400000-0000-4000-8000-000000000104', 2, 'Local Persistence',        'Save user data with SharedPreferences and SQLite.',                         'PUBLISHED'),
  ('01400000-0000-4000-8000-000000000209', '01400000-0000-4000-8000-000000000105', 1, 'Project Setup',            'Scaffold the capstone travel journal application.',                         'PUBLISHED'),
  ('01400000-0000-4000-8000-000000000210', '01400000-0000-4000-8000-000000000105', 2, 'Building & Polishing',     'Assemble screens, persist data, and polish the app.',                       'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 01400000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('01400000-0000-4000-8000-000000000301', '01400000-0000-4000-8000-000000000201', 1, 'What is Flutter?',                  'Understand how Flutter renders cross-platform and create your first project.',            'TEXT',  'PUBLISHED', 'FREE', 10,  6),
  ('01400000-0000-4000-8000-000000000302', '01400000-0000-4000-8000-000000000201', 2, 'Variables, Types & Functions',      'Declare typed variables and write reusable functions in Dart.',                            'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01400000-0000-4000-8000-000000000303', '01400000-0000-4000-8000-000000000201', 3, 'Flutter & Dart Basics Quiz',        'Check your understanding of Flutter and foundational Dart.',                              'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01400000-0000-4000-8000-000000000304', '01400000-0000-4000-8000-000000000202', 1, 'Control Flow & Collections',        'Branch, loop, and work with lists, sets, and maps in Dart.',                               'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01400000-0000-4000-8000-000000000305', '01400000-0000-4000-8000-000000000202', 2, 'Classes, Objects & Null Safety',    'Model real things with classes and rely on sound null safety.',                            'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01400000-0000-4000-8000-000000000306', '01400000-0000-4000-8000-000000000202', 3, 'Dart Language Quiz',                'Test your Dart language knowledge.',                                                       'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01400000-0000-4000-8000-000000000307', '01400000-0000-4000-8000-000000000203', 1, 'The Widget Tree & Stateless Widgets', 'See everything as widgets and build static UI with StatelessWidget.',                     'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01400000-0000-4000-8000-000000000308', '01400000-0000-4000-8000-000000000203', 2, 'Stateful Widgets & Lifecycle',      'Hold mutable data and respond to lifecycle callbacks.',                                    'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01400000-0000-4000-8000-000000000309', '01400000-0000-4000-8000-000000000203', 3, 'Widgets Quiz',                      'Verify you understand Flutter widgets and rebuilding.',                                   'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01400000-0000-4000-8000-000000000310', '01400000-0000-4000-8000-000000000204', 1, 'Layout: Rows, Columns & Stacks',    'Arrange UI with Flutter layout primitives and alignment.',                                 'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01400000-0000-4000-8000-000000000311', '01400000-0000-4000-8000-000000000204', 2, 'Styling, Themes & Material Design', 'Style text, colors, and app-wide themes the Material way.',                                'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01400000-0000-4000-8000-000000000312', '01400000-0000-4000-8000-000000000204', 3, 'Layout & Styling Quiz',             'Check your layout and theming knowledge.',                                                'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01400000-0000-4000-8000-000000000313', '01400000-0000-4000-8000-000000000205', 1, 'State with setState',               'Keep UI in sync with mutable state inside State objects.',                                 'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01400000-0000-4000-8000-000000000314', '01400000-0000-4000-8000-000000000205', 2, 'Scaling State: Provider & InheritedWidget', 'Share state across the tree with InheritedWidget and Provider.',                    'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01400000-0000-4000-8000-000000000315', '01400000-0000-4000-8000-000000000205', 3, 'State Management Quiz',             'Test your state management skills.',                                                       'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01400000-0000-4000-8000-000000000316', '01400000-0000-4000-8000-000000000206', 1, 'Navigation & Routing',              'Move between screens with the Navigator and named routes.',                                 'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01400000-0000-4000-8000-000000000317', '01400000-0000-4000-8000-000000000206', 2, 'Forms, Input & Validation',         'Collect input with Form, TextFormField, and validators.',                                  'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('01400000-0000-4000-8000-000000000318', '01400000-0000-4000-8000-000000000206', 3, 'Navigation & Forms Quiz',           'Check what you know about navigation and forms.',                                          'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01400000-0000-4000-8000-000000000319', '01400000-0000-4000-8000-000000000207', 1, 'HTTP Requests with http',           'Fetch data from REST endpoints with the http package.',                                    'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01400000-0000-4000-8000-000000000320', '01400000-0000-4000-8000-000000000207', 2, 'JSON Parsing & Model Classes',      'Convert JSON payloads into typed Dart models.',                                            'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01400000-0000-4000-8000-000000000321', '01400000-0000-4000-8000-000000000207', 3, 'Networking & JSON Quiz',            'Verify your HTTP and JSON skills.',                                                        'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01400000-0000-4000-8000-000000000322', '01400000-0000-4000-8000-000000000208', 1, 'SharedPreferences & Local Storage', 'Persist small key-value data on the device.',                                              'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01400000-0000-4000-8000-000000000323', '01400000-0000-4000-8000-000000000208', 2, 'Persistence Patterns & Async I/O',  'Model persistence with repositories, SQLite, and futures.',                                'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('01400000-0000-4000-8000-000000000324', '01400000-0000-4000-8000-000000000208', 3, 'Persistence Quiz',                  'Check your data persistence knowledge.',                                                   'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01400000-0000-4000-8000-000000000325', '01400000-0000-4000-8000-000000000209', 1, 'Capstone Setup & Architecture',     'Scaffold the travel journal project and design its data flow.',                             'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01400000-0000-4000-8000-000000000326', '01400000-0000-4000-8000-000000000209', 2, 'Building the App Shell',            'Create the screens, navigation, and theme for the journal.',                                'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('01400000-0000-4000-8000-000000000327', '01400000-0000-4000-8000-000000000210', 1, 'Data Layer & Polish',               'Persist entries, handle loading, and polish the experience.',                               'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('01400000-0000-4000-8000-000000000328', '01400000-0000-4000-8000-000000000210', 2, 'Final Assessment',                  'Prove what you learned across the whole course.',                                          'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 01400000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '01400000-0000-4000-8000-000000000401',
  '01400000-0000-4000-8000-000000000301',
  1,
  'What is Flutter?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What is Flutter?</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>What is Flutter?</h1>
  <p><strong>Flutter</strong> is Google&rsquo;s UI toolkit for building fast, beautiful apps from a single codebase. One Dart codebase compiles to native machine code for Android and iOS, and to JavaScript or WebAssembly for the browser — no separate apps to maintain.</p>
  <p>At the heart of Flutter is the <strong>widget</strong>: every button, card, and screen is declared as a widget, and widgets compose to form the whole interface. Because Flutter paints every pixel itself (via the Skia or Impeller renderer), your UI looks and behaves consistently across platforms.</p>
  <h2>What you will build</h2>
  <p>Over this course you will progressively build a <strong>travel journal</strong> app: add journal entries, rate every trip, persist entries on the device, and polish the whole experience — the same workflow used for production Flutter apps.</p>
  <h2>Check your setup</h2>
  <p>Install the Flutter SDK, then verify your environment:</p>
  <pre class="code-block">flutter --version
flutter doctor</pre>
  <p><span class="ic">flutter doctor</span> reports missing Android and iOS toolchains and offers one-line fixes as you install them.</p>
  <h2>Create your first project</h2>
  <pre class="code-block">flutter create travel_journal
cd travel_journal
flutter run</pre>
  <p>Your project lands in folders you will come to know well:</p>
  <ul>
    <li><span class="ic">lib/main.dart</span> — the Dart entry point and first widget.</li>
    <li><span class="ic">pubspec.yaml</span> — dependencies and assets.</li>
    <li><span class="ic">android/</span>, <span class="ic">ios/</span>, <span class="ic">web/</span> — the platform shells.</li>
  </ul>
  <p>Every Dart app starts with a <span class="ic">main()</span> function:</p>
  <pre class="code-block">void main() {
  runApp(const TravelJournalApp());
}</pre>
  <div class="callout callout-tip">
    <strong>Pick one device profile</strong>
    <p>Most of this course runs fastest on a single profile (Chrome or an emulator). You can switch any time — the code is identical everywhere.</p>
  </div>
  <div class="callout callout-info">
    <strong>No bridges</strong>
    <p>Flutter does not translate widgets into native widgets; it renders them itself. That is why scrolling feels consistent and why one bug fix ships to every platform at once.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01400000-0000-4000-8000-000000000402',
  '01400000-0000-4000-8000-000000000302',
  1,
  'Variables, Types & Functions',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Variables, Types & Functions</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Variables, Types &amp; Functions</h1>
  <p>Dart is a <strong>statically typed</strong> language: the compiler knows the type of every value. That catches whole classes of bugs before the app even runs.</p>
  <h2>Declaring variables</h2>
  <pre class="code-block">// Explicit type — always allowed
String city = 'Oslo';

// Type inference — the compiler figures it out
var km = 420;                  // int
double rating = 4.5;           // fractional value

// final: assigned once. const: compile-time constant.
final String traveler = 'Ana';
const appName = 'Travel Journal';
final now = DateTime.now();    // runtime value, fine</pre>
  <div class="callout">
    <strong>final vs const</strong>
    <p><span class="ic">final</span> is assigned once at runtime. <span class="ic">const</span> must be known at compile time. Prefer <span class="ic">const</span> when you can — the compiler caches it.</p>
  </div>
  <h2>Built-in types</h2>
  <table>
    <tr><th>Type</th><th>Example</th><th>Notes</th></tr>
    <tr><td>int</td><td>42</td><td>Whole numbers</td></tr>
    <tr><td>double</td><td>3.14</td><td>Fractional numbers</td></tr>
    <tr><td>String</td><td>'Oslo'</td><td>Text in single or double quotes</td></tr>
    <tr><td>bool</td><td>true</td><td>true or false</td></tr>
    <tr><td>List</td><td>[1, 2, 3]</td><td>Ordered collection</td></tr>
    <tr><td>Map</td><td>{'key': 1}</td><td>Key-value pairs</td></tr>
    <tr><td>dynamic</td><td>anything</td><td>Opt out of static checks</td></tr>
  </table>
  <h2>Functions</h2>
  <p>A function names a piece of reusable behavior. It has a return type, a name, and parameters:</p>
  <pre class="code-block">double celsiusToFahrenheit(double c) {
  return c * 9 / 5 + 32;
}

// Arrow syntax — single-expression body
double add(double a, double b) =&gt; a + b;

// Named parameters with defaults
String badge({String name = 'Guest', int trips = 0}) {
  return '$name — $trips trips';
}

print(badge(name: 'Mark', trips: 4));</pre>
  <p>The <span class="ic">$</span> interpolation embeds variables directly inside a string: <span class="ic">'$name — $trips trips'</span>.</p>
  <div class="callout callout-tip">
    <strong>Prefer final by default</strong>
    <p>Values you never reassign should be <span class="ic">final</span>. It documents intent and lets the analyzer warn about accidental reassignment.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01400000-0000-4000-8000-000000000404',
  '01400000-0000-4000-8000-000000000304',
  1,
  'Control Flow & Collections',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Control Flow & Collections</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Control Flow &amp; Collections</h1>
  <p>Programs branch with conditionals, repeat with loops, and organize data in collections — the code behind every form and feed.</p>
  <h2>Conditionals</h2>
  <pre class="code-block">int rating = 4;

if (rating &gt;= 5) {
  print('Excellent');
} else if (rating &gt;= 3) {
  print('Good');
} else {
  print('Needs work');
}

String label = rating &gt;= 3 ? 'Good' : 'Poor'; // ternary

switch (rating) {
  case 5: print('Five stars'); break;
  case 4: print('Four stars'); break;
  default: print('Other');
}</pre>
  <h2>Loops</h2>
  <pre class="code-block">for (int i = 0; i &lt; 3; i++) {
  print('Visit $i');
}

var cities = ['Oslo', 'Kyoto', 'Lisbon'];
for (var city in cities) {
  print('Heading to $city');
}

int energy = 100;
while (energy &gt; 0) {
  energy -= 25;
  print('Remaining: $energy');
}</pre>
  <h2>Collections</h2>
  <table>
    <tr><th>Collection</th><th>Literal</th><th>Best for</th></tr>
    <tr><td>List</td><td>[1, 2, 3]</td><td>Ordered, indexed items</td></tr>
    <tr><td>Set</td><td>{'a', 'b'}</td><td>Unique items</td></tr>
    <tr><td>Map</td><td>{'k': 1}</td><td>Key-value lookup</td></tr>
  </table>
  <pre class="code-block">var tags = &lt;String&gt;['beach', 'city'];
tags.add('hike');

var visited = &lt;String&gt;{'Oslo', 'Oslo', 'Kyoto'}; // duplicates collapse
print(visited.length);                       // 2

var ratings = &lt;String, int&gt;{'Lisbon': 5, 'Oslo': 4};
ratings['Kyoto'] = 5;                         // add or update
print(ratings['Oslo']);                       // 4</pre>
  <h2>Collection sugar</h2>
  <pre class="code-block">// spread — combine lists
var all = ['Oslo', ...visited];

// collection-if — conditionally include
var note = [
  'Title',
  if (ratings.isNotEmpty) 'Rated trips: ${ratings.length}',
];

// collection-for — build from a loop
var greetings = [for (var c in cities) 'Hello $c'];</pre>
  <div class="callout callout-info">
    <strong>Map lookups return nullable</strong>
    <p><span class="ic">ratings['Nope']</span> returns <span class="ic">null</span>, not an error. You will handle that gracefully when you learn null safety next.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Type an empty collection</strong>
    <p>Write <span class="ic">&lt;String&gt;[...]</span> when a list can be empty. It tells the analyzer what elements the list holds, which keeps filtering and casting sound.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01400000-0000-4000-8000-000000000405',
  '01400000-0000-4000-8000-000000000305',
  1,
  'Classes, Objects & Null Safety',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Classes, Objects & Null Safety</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Classes, Objects &amp; Null Safety</h1>
  <p>Classes are blueprints for objects. In Flutter you model real things — a journal entry, a user, a weather reading — as classes with fields and behavior.</p>
  <h2>Defining a class</h2>
  <pre class="code-block">class JournalEntry {
  final String title;
  final String note;
  int rating;

  JournalEntry({
    required this.title,
    required this.note,
    this.rating = 0,
  });

  @override
  String toString() =&gt; 'JournalEntry($title, $rating stars)';
}

var entry = JournalEntry(
  title: 'Kyoto in spring',
  note: 'Cherry blossoms everywhere.',
  rating: 5,
);</pre>
  <p><span class="ic">this.title</span> assigns the constructor parameter directly to the field. <span class="ic">required</span> forces callers to pass the named argument — the analyzer refuses to compile otherwise.</p>
  <h2>Sound null safety</h2>
  <p>In Dart, <strong>every type is non-nullable by default</strong>. A <span class="ic">String</span> can never hold <span class="ic">null</span> — the compiler guarantees it.</p>
  <table>
    <tr><th>Operator</th><th>Meaning</th></tr>
    <tr><td>int?</td><td>Nullable — may hold null</td></tr>
    <tr><td>x ?? 'fallback'</td><td>Use fallback when x is null</td></tr>
    <tr><td>x?.length</td><td>Read length only when x is not null</td></tr>
    <tr><td>value!</td><td>I insist this value is non-null</td></tr>
    <tr><td>late int x</td><td>Assigned later, before first use</td></tr>
  </table>
  <pre class="code-block">String? nickname;

void greet() {
  // nickname?.toUpperCase()  → null when nickname is null
  // nickname ?? 'Traveler'   → the fallback
  print('Hello ${nickname ?? 'Traveler'}');

  // Definite assignment: assign before a non-nullable use.
  late String started;
  started = '14:00';
  print(started);
}</pre>
  <div class="callout">
    <strong>Null safety is a feature, not friction</strong>
    <p>A refused compile is the bug being caught <em>before</em> your users hit it. Unwrap with <span class="ic">??</span>, <span class="ic">?.</span>, and finally <span class="ic">!</span> only when you are certain.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Promotion does the work</strong>
    <p>After checking <span class="ic">if (nickname != null)</span>, the analyzer promotes <span class="ic">nickname</span> to non-null inside the branch — no <span class="ic">!</span> needed.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01400000-0000-4000-8000-000000000407',
  '01400000-0000-4000-8000-000000000307',
  1,
  'The Widget Tree & Stateless Widgets',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Widget Tree & Stateless Widgets</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>The Widget Tree &amp; Stateless Widgets</h1>
  <p>Everything in Flutter is a widget, and widgets form a <strong>tree</strong>: a <span class="ic">MaterialApp</span> contains a <span class="ic">Scaffold</span>, which contains an <span class="ic">AppBar</span> and a <span class="ic">body</span>, and so on down to the smallest <span class="ic">Text</span>.</p>
  <p>A widget is an <strong>immutable description</strong> of part of the UI. When a widget describes something that can change, it carries the data needed to describe it at that moment.</p>
  <h2>StatelessWidget</h2>
  <p>If a piece of UI never changes on its own, it is a <span class="ic">StatelessWidget</span>. All you implement is <span class="ic">build()</span>:</p>
  <pre class="code-block">class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Travel Journal')),
      body: const Column(
        children: [
          Text('Plan your next trip'),
          Icon(Icons.flight_takeoff),
        ],
      ),
    );
  }
}</pre>
  <h2>The minimum app</h2>
  <pre class="code-block">void main() {
  runApp(
    MaterialApp(
      title: 'Travel Journal',
      home: const HomeScreen(),
    ),
  );
}</pre>
  <ul>
    <li><span class="ic">MaterialApp</span> — top of the tree: theming and navigation.</li>
    <li><span class="ic">Scaffold</span> — the structure of a screen: app bar, body, floating buttons.</li>
    <li><span class="ic">const</span> — constant widgets are created once and skipped on rebuild.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Const where possible</strong>
    <p>When a subtree never changes, mark it <span class="ic">const</span>. Flutter skips rebuilding it, which keeps even complex screens fast.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Read errors from the bottom</strong>
    <p>Flutter layout errors look daunting. The useful line is near the bottom: the widget that no longer fits. Fix one constraint at a time.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01400000-0000-4000-8000-000000000408',
  '01400000-0000-4000-8000-000000000308',
  1,
  'Stateful Widgets & Lifecycle',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Stateful Widgets & Lifecycle</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Stateful Widgets &amp; Lifecycle</h1>
  <p>When UI must respond to taps, timers, or data arriving, you need a <span class="ic">StatefulWidget</span>: two classes that work together.</p>
  <h2>The pair</h2>
  <pre class="code-block">class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  State&lt;LikeButton&gt; createState() =&gt; _LikeButtonState();
}

class _LikeButtonState extends State&lt;LikeButton&gt; {
  int _likes = 0;

  void _onTap() {
    setState(() {
      _likes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onTap,
      child: Text('Likes: $_likes'),
    );
  }
}</pre>
  <ul>
    <li><span class="ic">StatefulWidget</span> — immutable widget that describes how to create its state.</li>
    <li><span class="ic">State</span> — holds mutable fields (<span class="ic">_likes</span>) and the <span class="ic">build()</span> method.</li>
    <li><span class="ic">setState()</span> — marks the state dirty; Flutter rebuilds it next frame.</li>
  </ul>
  <h2>Lifecycle callbacks</h2>
  <table>
    <tr><th>Callback</th><th>Runs when…</th></tr>
    <tr><td>initState()</td><td>The State is first attached — set up controllers here</td></tr>
    <tr><td>didChangeDependencies()</td><td>An inherited dependency changed</td></tr>
    <tr><td>build()</td><td>The UI is (re)built</td></tr>
    <tr><td>didUpdateWidget()</td><td>The parent passed a new widget instance</td></tr>
    <tr><td>dispose()</td><td>The State is being removed — clean up here</td></tr>
  </table>
  <pre class="code-block">@override
void initState() {
  super.initState();
  _controller = TextEditingController();
}

@override
void dispose() {
  _controller.dispose();
  super.dispose();
}</pre>
  <div class="callout">
    <strong>Keep mutable fields in State</strong>
    <p>Mutable fields belong in the <span class="ic">State</span> class, never in the widget. The widget itself is immutable and may be recreated at any time.</p>
  </div>
  <div class="callout callout-tip">
    <strong>dispose what you create</strong>
    <p>Controllers, timers, and streams must be released in <span class="ic">dispose()</span> — otherwise you leak resources and the analyzer will remind you.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01400000-0000-4000-8000-000000000410',
  '01400000-0000-4000-8000-000000000310',
  1,
  'Layout: Rows, Columns & Stacks',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Layout: Rows, Columns & Stacks</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Layout: Rows, Columns &amp; Stacks</h1>
  <p>Flutter lays out screens by composing layout widgets. The three you will use constantly are <span class="ic">Row</span>, <span class="ic">Column</span>, and <span class="ic">Stack</span>.</p>
  <h2>Row and Column</h2>
  <pre class="code-block">Column(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('Kyoto, Japan'),
    Text('Chip: Spring blossoms'),
    Row(children: [Icon(Icons.star), Text('5.0')]),
  ],
)</pre>
  <ul>
    <li><span class="ic">Column</span> — stacks children vertically (top to bottom).</li>
    <li><span class="ic">Row</span> — arranges children horizontally.</li>
    <li><span class="ic">mainAxisAlignment</span> — distribution along the primary axis.</li>
    <li><span class="ic">crossAxisAlignment</span> — alignment along the secondary axis.</li>
  </ul>
  <h2>Expanded and Flexible</h2>
  <p><span class="ic">Expanded</span> makes a child fill the remaining space; <span class="ic">Flexible</span> lets a child shrink when space is tight:</p>
  <pre class="code-block">Row(
  children: [
    Expanded(
      flex: 2,
      child: Card(child: Text('Left panel', textAlign: TextAlign.center)),
    ),
    Expanded(
      flex: 1,
      child: Icon(Icons.arrow_forward),
    ),
  ],
)</pre>
  <h2>Stack</h2>
  <p><span class="ic">Stack</span> paints children on top of each other — perfect for overlays and badges:</p>
  <pre class="code-block">Stack(
  alignment: Alignment.bottomRight,
  children: [
    Image.asset('assets/kyoto_photo.jpg'),
    Padding(
      padding: const EdgeInsets.all(12),
      child: Text('Trip 12', style: TextStyle(color: Colors.white)),
    ),
  ],
)</pre>
  <h2>Spacing and alignment</h2>
  <table>
    <tr><th>Widget</th><th>Purpose</th></tr>
    <tr><td>SizedBox</td><td>Fixed width and/or height gaps</td></tr>
    <tr><td>Padding</td><td>Whitespace around content</td></tr>
    <tr><td>Center</td><td>Center a child</td></tr>
    <tr><td>Align</td><td>Align a child precisely</td></tr>
    <tr><td>ConstrainedBox</td><td>Cap or force dimensions</td></tr>
  </table>
  <div class="callout">
    <strong>Layout overflow is a bug</strong>
    <p>The yellow-and-black stripes in debug mode mean a child could not fit. The fix is almost always an <span class="ic">Expanded</span>, a <span class="ic">SingleChildScrollView</span>, or a smaller fixed size.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Nest with intention</strong>
    <p>Each layout widget adds a pass. Nesting is normal, but if a screen needs 30 levels, extract a small named widget.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01400000-0000-4000-8000-000000000411',
  '01400000-0000-4000-8000-000000000311',
  1,
  'Styling, Themes & Material Design',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Styling, Themes & Material Design</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Styling, Themes &amp; Material Design</h1>
  <p>Material Design is Flutter&rsquo;s default visual language. Instead of styling every widget by hand, you define a <span class="ic">ThemeData</span> once and let widgets inherit it.</p>
  <h2>An app-wide theme</h2>
  <pre class="code-block">MaterialApp(
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
    useMaterial3: true,
  ),
  darkTheme: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.teal,
      brightness: Brightness.dark,
    ),
  ),
  home: const HomeScreen(),
)</pre>
  <p>Providing both <span class="ic">theme</span> and <span class="ic">darkTheme</span> gives users automatic light and dark modes with no extra code.</p>
  <h2>Reading the theme</h2>
  <pre class="code-block">final scheme = Theme.of(context).colorScheme;

Text(
  entry.title,
  style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: scheme.onSurface,
  ),
);</pre>
  <h2>Text styles for consistency</h2>
  <pre class="code-block">textTheme: const TextTheme(
  headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
  bodyMedium: TextStyle(fontSize: 16),
)</pre>
  <h2>Styled building blocks</h2>
  <table>
    <tr><th>Widget</th><th>Role</th></tr>
    <tr><td>ElevatedButton</td><td>Primary actions</td></tr>
    <tr><td>OutlinedButton</td><td>Secondary actions</td></tr>
    <tr><td>Card</td><td>Contained content blocks</td></tr>
    <tr><td>Chip</td><td>Short labels like tags</td></tr>
    <tr><td>Icon</td><td>Material icons</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Use theme colors, not raw hex values</strong>
    <p>Reference <span class="ic">colorScheme.primary</span> instead of a hard-coded color. Change one seed color and the whole app re-themes — that is the point.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Test both themes</strong>
    <p>Run the app in light and dark mode before release. A color that works on white can vanish on near-black.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01400000-0000-4000-8000-000000000413',
  '01400000-0000-4000-8000-000000000313',
  1,
  'State with setState',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>State with setState</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>State with setState</h1>
  <p>The simplest and most common way to manage state is directly inside a <span class="ic">State</span> object: keep fields, mutate them inside <span class="ic">setState</span>, and let <span class="ic">build()</span> reflect the new values.</p>
  <h2>Mutable state in one widget</h2>
  <pre class="code-block">class RatingStars extends StatefulWidget {
  const RatingStars({super.key});

  @override
  State&lt;RatingStars&gt; createState() =&gt; _RatingStarsState();
}

class _RatingStarsState extends State&lt;RatingStars&gt; {
  int _stars = 0;

  void _setRating(int value) {
    setState(() {
      _stars = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index &lt; _stars ? Icons.star : Icons.star_border,
          ),
          onPressed: () =&gt; _setRating(index + 1),
        );
      }),
    );
  }
}</pre>
  <p>Tapping a star calls <span class="ic">_setRating</span>, which calls <span class="ic">setState</span>, which schedules a rebuild. <span class="ic">build()</span> runs again and paints the new filled stars.</p>
  <h2>Rules that keep it predictable</h2>
  <ul>
    <li>Change state only inside <span class="ic">setState(() { ... })</span>.</li>
    <li>Never call <span class="ic">setState</span> after <span class="ic">dispose()</span> — guard async callbacks.</li>
    <li>Keep <span class="ic">build()</span> pure: read state, never mutate it.</li>
  </ul>
  <pre class="code-block">if (!mounted) return;   // after an await, before setState</pre>
  <div class="callout callout-tip">
    <strong>Guard post-await setState</strong>
    <p>An async operation may finish after the widget was removed. Check <span class="ic">mounted</span> before calling <span class="ic">setState</span> to avoid the classic lifecycle error.</p>
  </div>
  <h2>When to move beyond setState</h2>
  <p>Local state in one widget is perfect. The moment two distant screens must share values — the chosen unit, the logged-in user — move the state upward and share it. That is the next lesson.</p>
  <div class="callout callout-info">
    <strong>Scoped rebuilds</strong>
    <p>When <span class="ic">setState</span> fires, only that <span class="ic">State</span> rebuilds. Children marked <span class="ic">const</span> are skipped entirely, which keeps updates cheap.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01400000-0000-4000-8000-000000000414',
  '01400000-0000-4000-8000-000000000314',
  1,
  'Scaling State: Provider & InheritedWidget',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Scaling State: Provider & InheritedWidget</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Scaling State: Provider &amp; InheritedWidget</h1>
  <p>Passing the same value through five constructor arguments is called <strong>prop drilling</strong>. Flutter&rsquo;s answer is <span class="ic">InheritedWidget</span>: data that any descendant can read without it being passed down every level.</p>
  <h2>InheritedWidget in short</h2>
  <pre class="code-block">class UnitScope extends InheritedWidget {
  const UnitScope({required this.unit, required super.child});

  final Unit unit;

  static Unit of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType&lt;UnitScope&gt;()!.unit;
  }

  @override
  bool updateShouldNotify(UnitScope oldWidget) =&gt; unit != oldWidget.unit;
}</pre>
  <p>Any widget beneath <span class="ic">UnitScope</span> reads <span class="ic">UnitScope.of(context)</span> and depends on it automatically. When <span class="ic">unit</span> changes, dependents rebuild.</p>
  <h2>Provider: the ergonomic layer</h2>
  <p>The <span class="ic">provider</span> package wraps this pattern in a tidy API. A model class exposes state changes; widgets read and react.</p>
  <pre class="code-block">class JournalModel extends ChangeNotifier {
  final List&lt;String&gt; _entries = [];

  List&lt;String&gt; get entries =&gt; List.unmodifiable(_entries);

  void add(String title) {
    _entries.add(title);
    notifyListeners();
  }
}</pre>
  <pre class="code-block">ChangeNotifierProvider(
  create: (_) =&gt; JournalModel(),
  child: const TravelJournalApp(),
)</pre>
  <pre class="code-block">// read without listening (callbacks, gestures)
final model = context.read&lt;JournalModel&gt;();

// listen and rebuild when data changes (build methods)
final entries = context.watch&lt;JournalModel&gt;().entries;</pre>
  <h2>Choosing by need</h2>
  <table>
    <tr><th>Situation</th><th>Approach</th></tr>
    <tr><td>One widget, local value</td><td>setState</td></tr>
    <tr><td>Shared by a few siblings</td><td>Lift state + callbacks</td></tr>
    <tr><td>Shared app-wide</td><td>ChangeNotifier + Provider</td></tr>
    <tr><td>Async server state</td><td>Provider with futures and streams</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>watch to rebuild, read to act</strong>
    <p>Use <span class="ic">context.watch</span> in <span class="ic">build()</span> when the UI shows the value. Use <span class="ic">context.read</span> in callbacks — you want to act, not rebuild.</p>
  </div>
  <div class="callout callout-info">
    <strong>One model per concern</strong>
    <p>Keep separate <span class="ic">ChangeNotifier</span> classes for user session, settings, and journal data. Narrow models notify fewer rebuilds.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01400000-0000-4000-8000-000000000416',
  '01400000-0000-4000-8000-000000000316',
  1,
  'Navigation & Routing',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Navigation & Routing</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Navigation &amp; Routing</h1>
  <p>Screens are pages, and pages are managed by a <span class="ic">Navigator</span> — a stack you push onto and pop from.</p>
  <h2>Pushing a screen</h2>
  <pre class="code-block">Navigator.push(
  context,
  MaterialPageRoute(builder: (_) =&gt; const EntryDetailScreen(entry: entry)),
);</pre>
  <p><span class="ic">MaterialPageRoute</span> brings platform-correct transitions and back gestures for free.</p>
  <h2>Popping with a result</h2>
  <pre class="code-block">// inside EntryDetailScreen
Navigator.pop(context, 'Saved: ${entry.title}');</pre>
  <pre class="code-block">final result = await Navigator.push&lt;String&gt;(
  context,
  MaterialPageRoute(builder: (_) =&gt; const EntryDetailScreen(entry: entry)),
);
if (result != null) {
  setState(() =&gt; _lastAction = result);
}</pre>
  <p>The route type parameter <span class="ic">&lt;String&gt;</span> tells Dart what the route returns.</p>
  <h2>Named routes</h2>
  <p>Named routes centralize the map of screen names in one place:</p>
  <pre class="code-block">MaterialApp(
  routes: {
    '/':      (_) =&gt; const HomeScreen(),
    '/new':   (_) =&gt; const NewEntryScreen(),
  },
)</pre>
  <pre class="code-block">Navigator.pushNamed(context, '/new');</pre>
  <h2>Replacing and clearing</h2>
  <table>
    <tr><th>Method</th><th>Effect</th></tr>
    <tr><td>push()</td><td>Add a route</td></tr>
    <tr><td>pop()</td><td>Remove the current route</td></tr>
    <tr><td>pushReplacement()</td><td>Swap the current route</td></tr>
    <tr><td>pushNamedAndRemoveUntil()</td><td>Clear the stack to a base route</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Pass data, not globals</strong>
    <p>Hand entries to a screen through its constructor or Provider — never through a global variable. It keeps screens testable and obvious.</p>
  </div>
  <div class="callout callout-info">
    <strong>Read the result</strong>
    <p><span class="ic">push</span> returns a <span class="ic">Future</span>. Await it when the next screen produces a value you want — the pattern every settings screen uses.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01400000-0000-4000-8000-000000000417',
  '01400000-0000-4000-8000-000000000317',
  1,
  'Forms, Input & Validation',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Forms, Input & Validation</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Forms, Input &amp; Validation</h1>
  <p>Forms are how users bring data into the app. Flutter&rsquo;s <span class="ic">Form</span> + <span class="ic">TextFormField</span> pair handles validation and data collection in one place.</p>
  <h2>A validated form</h2>
  <pre class="code-block">final _formKey = GlobalKey&lt;FormState&gt;();
final _titleController = TextEditingController();

Form(
  key: _formKey,
  child: Column(
    children: [
      TextFormField(
        controller: _titleController,
        decoration: const InputDecoration(
          labelText: 'Trip title',
          hintText: 'Kyoto in spring',
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Please enter a title.';
          }
          return null;
        },
      ),
      ElevatedButton(
        onPressed: _submit,
        child: const Text('Save entry'),
      ),
    ],
  ),
)</pre>
  <h2>Validate and read</h2>
  <pre class="code-block">void _submit() {
  if (!_formKey.currentState!.validate()) return;  // shows errors

  _formKey.currentState!.save();                    // save() on each field
  final title = _titleController.text.trim();

  // hand the data to the model or repository
}</pre>
  <h2>Field options that matter</h2>
  <ul>
    <li><span class="ic">obscureText: true</span> — mask passwords.</li>
    <li><span class="ic">keyboardType: TextInputType.multiline</span> — multi-line notes.</li>
    <li><span class="ic">autovalidateMode: AutovalidateMode.onUserInteraction</span> — live feedback.</li>
    <li><span class="ic">maxLength: 80</span> — cap long titles.</li>
  </ul>
  <div class="callout">
    <strong>validator returns null to pass</strong>
    <p>Return <span class="ic">null</span> when valid. Return an error <span class="ic">String</span> when invalid — that message renders under the field automatically.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Always dispose controllers</strong>
    <p>Create a <span class="ic">TextEditingController</span> in <span class="ic">initState</span> and release it in <span class="ic">dispose</span>. It is cheap and eliminates a whole family of leaks.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01400000-0000-4000-8000-000000000419',
  '01400000-0000-4000-8000-000000000319',
  1,
  'HTTP Requests with http',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HTTP Requests with http</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>HTTP Requests with http</h1>
  <p>Most apps reach out to servers. Flutter&rsquo;s standard client for that is the <span class="ic">http</span> package — a thin, familiar wrapper over HTTP.</p>
  <h2>Add the dependency</h2>
  <pre class="code-block">dependencies:
  http: ^1.2.0</pre>
  <p>Then run <span class="ic">flutter pub get</span>.</p>
  <h2>A GET request</h2>
  <pre class="code-block">import 'package:http/http.dart' as http;

Future&lt;String&gt; fetchWeather(String city) async {
  final uri = Uri.parse(
    'https://api.example.com/weather?city=${Uri.encodeQueryComponent(city)}',
  );

  final response = await http.get(uri);

  if (response.statusCode != 200) {
    throw Exception('Request failed: ${response.statusCode}');
  }

  return response.body;   // raw JSON text
}</pre>
  <ul>
    <li><span class="ic">http.get</span> returns a <span class="ic">Future&lt;http.Response&gt;</span>.</li>
    <li><span class="ic">response.statusCode</span> — the HTTP status.</li>
    <li><span class="ic">response.body</span> — the raw body as a string.</li>
    <li><span class="ic">Uri.encodeQueryComponent</span> — escape user input in the URL.</li>
  </ul>
  <h2>POSTing JSON</h2>
  <pre class="code-block">import 'dart:convert';

final response = await http.post(
  Uri.parse('https://api.example.com/entries'),
  headers: {'Content-Type': 'application/json'},
  body: jsonEncode({'title': 'Kyoto', 'rating': 5}),
);</pre>
  <table>
    <tr><th>Method</th><th>Purpose</th><th>Helper</th></tr>
    <tr><td>GET</td><td>Read data</td><td>http.get(url)</td></tr>
    <tr><td>POST</td><td>Create data</td><td>http.post(url, body: ...)</td></tr>
    <tr><td>PUT / PATCH</td><td>Update data</td><td>http.put / http.patch</td></tr>
    <tr><td>DELETE</td><td>Remove data</td><td>http.delete(url)</td></tr>
  </table>
  <div class="callout">
    <strong>statusCode is on you</strong>
    <p><span class="ic">http.get</span> does not throw on a 404 or 500 — only on transport errors. Check <span class="ic">statusCode</span> yourself and translate failures into your own errors.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Time out long requests</strong>
    <p>Wrap calls with <span class="ic">.timeout(const Duration(seconds: 10))</span> so a hanging server becomes a friendly error instead of a frozen spinner.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01400000-0000-4000-8000-000000000420',
  '01400000-0000-4000-8000-000000000320',
  1,
  'JSON Parsing & Model Classes',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JSON Parsing & Model Classes</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>JSON Parsing &amp; Model Classes</h1>
  <p>Servers talk JSON; Dart talks objects. The bridge is a pair of methods every model owns: <span class="ic">fromJson</span> and <span class="ic">toJson</span>.</p>
  <h2>The model</h2>
  <pre class="code-block">class Entry {
  const Entry({
    required this.id,
    required this.title,
    required this.note,
    this.rating = 0,
  });

  final int id;
  final String title;
  final String note;
  final int rating;

  factory Entry.fromJson(Map&lt;String, dynamic&gt; json) {
    return Entry(
      id: json['id'] as int,
      title: json['title'] as String,
      note: json['note'] as String,
      rating: json['rating'] as int? ?? 0,
    );
  }

  Map&lt;String, dynamic&gt; toJson() {
    return {'id': id, 'title': title, 'note': note, 'rating': rating};
  }
}</pre>
  <h2>Decode and encode</h2>
  <pre class="code-block">// string → Dart values
final map = jsonDecode(response.body) as Map&lt;String, dynamic&gt;;
final entry = Entry.fromJson(map);

// Dart values → string
final payload = jsonEncode(entry.toJson());</pre>
  <h2>Decoding lists</h2>
  <pre class="code-block">final data = jsonDecode(response.body) as List&lt;dynamic&gt;;

final entries = data
    .map((item) =&gt; Entry.fromJson(item as Map&lt;String, dynamic&gt;))
    .toList();</pre>
  <h2>Type your casts</h2>
  <table>
    <tr><th>JSON value</th><th>Dart cast</th></tr>
    <tr><td>{"count": 7}</td><td>json['count'] as int</td></tr>
    <tr><td>"Kyoto"</td><td>json['title'] as String</td></tr>
    <tr><td>true</td><td>json['draft'] as bool</td></tr>
    <tr><td>"2026-04-01"</td><td>DateTime.parse(json['date'] as String)</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>fromJson is the single source</strong>
    <p>Map the API shape to your model inside <span class="ic">fromJson</span> only. Screens then work with typed fields, and a rename in the API changes one file.</p>
  </div>
  <div class="callout callout-info">
    <strong>Graceful missing keys</strong>
    <p>APIs change. Use <span class="ic">?? default</span> for optional fields so a missing key never crashes the whole decode.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01400000-0000-4000-8000-000000000422',
  '01400000-0000-4000-8000-000000000322',
  1,
  'SharedPreferences & Local Storage',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SharedPreferences & Local Storage</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>SharedPreferences &amp; Local Storage</h1>
  <p>Some data must survive an app restart: the chosen unit, the last tab, the onboarding flag. <span class="ic">shared_preferences</span> stores exactly that — small key-value pairs.</p>
  <h2>Add the package</h2>
  <pre class="code-block">dependencies:
  shared_preferences: ^2.2.0</pre>
  <h2>Write and read</h2>
  <pre class="code-block">import 'package:shared_preferences/shared_preferences.dart';

const _favoriteKey = 'favorite_city';

Future&lt;void&gt; saveFavorite(String city) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(_favoriteKey, city);
}

Future&lt;String?&gt; loadFavorite() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(_favoriteKey);
}

Future&lt;void&gt; clearFavorite() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove(_favoriteKey);
}</pre>
  <p>Every call goes through <span class="ic">getInstance()</span>, which you await once and reuse.</p>
  <h2>Supported types</h2>
  <table>
    <tr><th>Setter</th><th>Getter</th></tr>
    <tr><td>setBool</td><td>getBool</td></tr>
    <tr><td>setInt</td><td>getInt</td></tr>
    <tr><td>setDouble</td><td>getDouble</td></tr>
    <tr><td>setString</td><td>getString</td></tr>
    <tr><td>setStringList</td><td>getStringList</td></tr>
  </table>
  <p>Lists and maps need an encode step: <span class="ic">jsonEncode</span> the object into a string, store it, and <span class="ic">jsonDecode</span> it back when reading.</p>
  <div class="callout">
    <strong>SharedPreferences is not a database</strong>
    <p>Keep it for small settings, not large or relational data. It is read as one blob into memory — gigabytes of journal entries do not belong here.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Isolate storage behind a repository</strong>
    <p>Screen code should call a repository method like <span class="ic">loadSettings()</span>, never <span class="ic">SharedPreferences</span> directly. Swap implementations later without touching UI.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01400000-0000-4000-8000-000000000423',
  '01400000-0000-4000-8000-000000000323',
  1,
  'Persistence Patterns & Async I/O',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Persistence Patterns & Async I/O</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Persistence Patterns &amp; Async I/O</h1>
  <p>For relational, queryable data — your list of journal entries — reach for a real database. The <span class="ic">sqflite</span> package brings SQLite to Flutter, and repositories keep the details out of the UI.</p>
  <h2>The repository boundary</h2>
  <pre class="code-block">abstract class EntryRepository {
  Future&lt;List&lt;Entry&gt;&gt; loadAll();
  Future&lt;void&gt; add(Entry entry);
  Future&lt;void&gt; delete(int id);
}</pre>
  <p>Screens depend on the interface. The implementation may use SQLite today and a server later, with no UI change.</p>
  <h2>SQLite with sqflite</h2>
  <pre class="code-block">final db = await openDatabase(
  join(await getDatabasesPath(), 'journal.db'),
  onCreate: (db, version) {
    return db.execute(
      'CREATE TABLE entries('
      'id INTEGER PRIMARY KEY, '
      'title TEXT NOT NULL, '
      'note TEXT NOT NULL, '
      'rating INTEGER NOT NULL)',
    );
  },
  version: 1,
);</pre>
  <pre class="code-block">// insert
await db.insert('entries', entry.toJson());

// query
final rows = await db.query('entries', orderBy: 'rating DESC');
final entries = rows.map(Entry.fromJson).toList();</pre>
  <p><span class="ic">fromJson</span> doubles as the row mapper here — the same model serves APIs and the database.</p>
  <h2>Keep the UI simple with FutureBuilder</h2>
  <pre class="code-block">Future&lt;List&lt;Entry&gt;&gt; _future;

@override
void initState() {
  super.initState();
  _future = repository.loadAll();
}

@override
Widget build(BuildContext context) {
  return FutureBuilder&lt;List&lt;Entry&gt;&gt;(
    future: _future,
    builder: (context, snapshot) {
      if (snapshot.hasError) return const Text('Could not load entries.');
      if (!snapshot.hasData) return const CircularProgressIndicator();
      final entries = snapshot.data!;
      return ListView.separated(
        itemCount: entries.length,
        separatorBuilder: (_, __) =&gt; const Divider(),
        itemBuilder: (context, index) =&gt; EntryTile(entry: entries[index]),
      );
    },
  );
}</pre>
  <div class="callout callout-tip">
    <strong>Handle every state</strong>
    <p>A production screen shows at least: loading, empty, error, and data. <span class="ic">FutureBuilder</span> gives you the branches — paint something meaningful in each.</p>
  </div>
  <div class="callout callout-info">
    <strong>Never block the UI thread</strong>
    <p>Disk and database work are async Futures by design. Keep awaits on I/O and quick UI work on the main thread — that combination keeps apps at 60fps.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01400000-0000-4000-8000-000000000425',
  '01400000-0000-4000-8000-000000000325',
  1,
  'Capstone Setup & Architecture',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone Setup & Architecture</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone Setup &amp; Architecture</h1>
  <p>Time to build the capstone end to end: a <strong>Travel Journal</strong> where you add trips, rate them, and keep the list on the device.</p>
  <h2>Create the project</h2>
  <pre class="code-block">flutter create travel_journal
cd travel_journal</pre>
  <h2>Dependencies</h2>
  <pre class="code-block">dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.0
  shared_preferences: ^2.2.0
  http: ^1.2.0</pre>
  <h2>Folder structure</h2>
  <pre class="code-block">lib/
  main.dart                 // app, theme, provider wiring
  models/
    entry.dart              // Entry model with fromJson/toJson
  repositories/
    entry_repository.dart      // save and load interface
    entry_repository_json.dart // SharedPreferences-backed implementation
  screens/
    home_screen.dart        // the list of trips
    entry_screen.dart       // create and edit an entry
  widgets/
    entry_card.dart         // reusable list tile</pre>
  <h2>The data flow</h2>
  <ul>
    <li><span class="ic">Entry</span> — pure model: fields plus <span class="ic">fromJson</span>/<span class="ic">toJson</span>.</li>
    <li><span class="ic">EntryRepository</span> — the interface that screens rely on.</li>
    <li><span class="ic">EntryRepositoryJson</span> — persists entries as a JSON list.</li>
    <li><span class="ic">JournalModel</span> — ChangeNotifier that owns the live list.</li>
    <li><span class="ic">HomeScreen</span> — watches the model and renders entries.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Separate responsibility by layer</strong>
    <p>Screens render and react; the model coordinates; the repository persists. When a screen stops talking to storage directly, every future change stays small.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Model first</strong>
    <p>Write <span class="ic">Entry</span> and its JSON methods before any screen. A stable model makes the UI code fall into place quickly.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01400000-0000-4000-8000-000000000426',
  '01400000-0000-4000-8000-000000000326',
  1,
  'Building the App Shell',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Building the App Shell</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Building the App Shell</h1>
  <p>Now assemble the skeleton: a themed <span class="ic">MaterialApp</span>, the journal <span class="ic">HomeScreen</span>, and navigation to the entry editor.</p>
  <h2>main.dart</h2>
  <pre class="code-block">void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) =&gt; JournalModel(EntryRepositoryJson()),
      child: const TravelJournalApp(),
    ),
  );
}

class TravelJournalApp extends StatelessWidget {
  const TravelJournalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Journal',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF027DFD)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}</pre>
  <h2>HomeScreen</h2>
  <pre class="code-block">class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final entries = context.watch&lt;JournalModel&gt;().entries;

    return Scaffold(
      appBar: AppBar(title: const Text('My Trips')),
      body: entries.isEmpty
          ? const Center(child: Text('No trips yet — add your first!'))
          : ListView.separated(
              itemCount: entries.length,
              separatorBuilder: (_, __) =&gt; const Divider(),
              itemBuilder: (context, index) {
                return EntryCard(entry: entries[index]);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) =&gt; const EntryScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}</pre>
  <h2>EntryCard — a reusable tile</h2>
  <pre class="code-block">class EntryCard extends StatelessWidget {
  const EntryCard({super.key, required this.entry});

  final Entry entry;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(Icons.place, color: scheme.primary),
      title: Text(entry.title),
      subtitle: Text(entry.note, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: Text('${entry.rating}★'),
    );
  }
}</pre>
  <div class="callout callout-tip">
    <strong>Watch data, not timers</strong>
    <p><span class="ic">context.watch</span> in <span class="ic">build()</span> means the list rebuilds exactly when the model changes — no manual refresh calls needed.</p>
  </div>
  <div class="callout callout-info">
    <strong>Empty state first</strong>
    <p>A brand-new journal has zero trips. That first empty state is your chance to guide the user to the <span class="ic">FloatingActionButton</span>.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01400000-0000-4000-8000-000000000427',
  '01400000-0000-4000-8000-000000000327',
  1,
  'Data Layer & Polish',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Data Layer & Polish</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Data Layer &amp; Polish</h1>
  <p>The final stretch: persist entries, load them at startup, and polish the details that make the app feel finished.</p>
  <h2>The JSON-backed repository</h2>
  <pre class="code-block">class EntryRepositoryJson implements EntryRepository {
  static const _key = 'journal_entries_v1';

  Future&lt;List&lt;Entry&gt;&gt; loadAll() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null) return [];

    final data = jsonDecode(raw) as List&lt;dynamic&gt;;
    return data
        .map((item) =&gt; Entry.fromJson(item as Map&lt;String, dynamic&gt;))
        .toList();
  }

  Future&lt;void&gt; saveAll(List&lt;Entry&gt; entries) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _key,
      jsonEncode(entries.map((e) =&gt; e.toJson()).toList()),
    );
  }
}</pre>
  <h2>The model</h2>
  <pre class="code-block">class JournalModel extends ChangeNotifier {
  JournalModel(this._repository);

  final EntryRepository _repository;
  List&lt;Entry&gt; _entries = [];

  List&lt;Entry&gt; get entries =&gt; List.unmodifiable(_entries);

  Future&lt;void&gt; load() async {
    _entries = await _repository.loadAll();
    notifyListeners();
  }

  Future&lt;void&gt; add(Entry entry) async {
    _entries = [..._entries, entry];
    notifyListeners();
    await _repository.saveAll(_entries);
  }

  Future&lt;void&gt; remove(int id) async {
    _entries = _entries.where((e) =&gt; e.id != id).toList();
    notifyListeners();
    await _repository.saveAll(_entries);
  }
}</pre>
  <h2>Loading at startup</h2>
  <pre class="code-block">void main() {
  final model = JournalModel(EntryRepositoryJson());
  model.load();                    // fire-and-forget startup read

  runApp(
    ChangeNotifierProvider.value(
      value: model,
      child: const TravelJournalApp(),
    ),
  );
}</pre>
  <h2>Polish checklist</h2>
  <ul>
    <li>Friendly errors: wrap <span class="ic">load()</span> in a try/catch and offer a retry button.</li>
    <li>Consistent icons from one family and one color seed.</li>
    <li>Leave navigation transitions on their Material defaults.</li>
    <li>Run <span class="ic">flutter analyze</span> and resolve every warning.</li>
    <li>Test on a physical device, not only an emulator.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Persist after every change</strong>
    <p>Save in the model method that mutates the list — add, delete, edit. A list that only saves sometimes loses data exactly when users expect it to keep it.</p>
  </div>
  <div class="callout callout-info">
    <strong>Guard the write</strong>
    <p>Writes can fail (disk full, closed preferences). A <span class="ic">try/catch</span> around <span class="ic">saveAll</span> that surfaces a snackbar beats silent data loss.</p>
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
  ('01400000-0000-4000-8000-000000000501', '01400000-0000-4000-8000-000000000303',
   'What is the fundamental UI building block in every Flutter app?',
   'Widgets are the atomic units of Flutter UI; every visual element is one.', 1),
  ('01400000-0000-4000-8000-000000000502', '01400000-0000-4000-8000-000000000303',
   'Which language is used to write Flutter applications?',
   'Flutter apps are written in Dart, a type-safe language developed by Google.', 2),
  ('01400000-0000-4000-8000-000000000503', '01400000-0000-4000-8000-000000000303',
   'Which command scaffolds a new Flutter project?',
   'flutter create generates a runnable project skeleton in the current directory.', 3),
  ('01400000-0000-4000-8000-000000000504', '01400000-0000-4000-8000-000000000306',
   'Which keyword declares a Dart variable that is assigned once?',
   'final variables are assigned once; const is reserved for compile-time constants.', 1),
  ('01400000-0000-4000-8000-000000000505', '01400000-0000-4000-8000-000000000306',
   'How do you declare a nullable integer in Dart?',
   'A question-mark suffix marks the type as nullable: int?.', 2),
  ('01400000-0000-4000-8000-000000000506', '01400000-0000-4000-8000-000000000306',
   'What does sound null safety guarantee?',
   'A type declared non-nullable can never hold null at runtime.', 3),
  ('01400000-0000-4000-8000-000000000507', '01400000-0000-4000-8000-000000000309',
   'Which widget builds a single static UI that never changes?',
   'StatelessWidget renders fixed content and has no mutable state.', 1),
  ('01400000-0000-4000-8000-000000000508', '01400000-0000-4000-8000-000000000309',
   'Which method must every widget implement?',
   'build() returns the widget subtree that this widget renders.', 2),
  ('01400000-0000-4000-8000-000000000509', '01400000-0000-4000-8000-000000000309',
   'What triggers a rebuild of a StatefulWidget UI?',
   'Calling setState marks the State dirty and schedules a rebuild.', 3),
  ('01400000-0000-4000-8000-000000000510', '01400000-0000-4000-8000-000000000312',
   'Which widget arranges children vertically?',
   'Column stacks children from top to bottom.', 1),
  ('01400000-0000-4000-8000-000000000511', '01400000-0000-4000-8000-000000000312',
   'Which property spaces children along the main axis?',
   'mainAxisAlignment controls distribution along the Row or Column main axis.', 2),
  ('01400000-0000-4000-8000-000000000512', '01400000-0000-4000-8000-000000000312',
   'Where do you configure an app-wide color scheme?',
   'ThemeData in MaterialApp centralizes colors and text styles for the whole app.', 3),
  ('01400000-0000-4000-8000-000000000513', '01400000-0000-4000-8000-000000000315',
   'What does calling setState do?',
   'It marks the State dirty so Flutter rebuilds the widget on the next frame.', 1),
  ('01400000-0000-4000-8000-000000000514', '01400000-0000-4000-8000-000000000315',
   'What is the purpose of an InheritedWidget?',
   'It makes data available to descendant widgets without prop drilling.', 2),
  ('01400000-0000-4000-8000-000000000515', '01400000-0000-4000-8000-000000000315',
   'Which Provider widget rebuilds consumers when a ChangeNotifier fires?',
   'ChangeNotifierProvider exposes a ChangeNotifier and rebuilds its dependents.', 3),
  ('01400000-0000-4000-8000-000000000516', '01400000-0000-4000-8000-000000000318',
   'How do you push a new screen onto the navigation stack?',
   'Navigator.push adds a MaterialPageRoute to the top of the stack.', 1),
  ('01400000-0000-4000-8000-000000000517', '01400000-0000-4000-8000-000000000318',
   'Which callback validates a TextFormField value?',
   'The validator callback returns an error message or null when valid.', 2),
  ('01400000-0000-4000-8000-000000000518', '01400000-0000-4000-8000-000000000318',
   'How do you return a result from a popped route?',
   'Navigator.pop(context, result) delivers the value to the awaiting caller.', 3),
  ('01400000-0000-4000-8000-000000000519', '01400000-0000-4000-8000-000000000321',
   'What does http.get() return?',
   'It returns a Future that resolves to an http Response object.', 1),
  ('01400000-0000-4000-8000-000000000520', '01400000-0000-4000-8000-000000000321',
   'Which class method converts a JSON map into a model?',
   'A fromJson factory constructor builds model instances from parsed JSON.', 2),
  ('01400000-0000-4000-8000-000000000521', '01400000-0000-4000-8000-000000000321',
   'How do you turn a JSON string into a Dart Map?',
   'jsonDecode parses the string into Dart primitives and collections.', 3),
  ('01400000-0000-4000-8000-000000000522', '01400000-0000-4000-8000-000000000324',
   'What is SharedPreferences best suited for?',
   'It stores small key-value pairs that load as one blob into memory.', 1),
  ('01400000-0000-4000-8000-000000000523', '01400000-0000-4000-8000-000000000324',
   'Which package provides SQLite on Flutter?',
   'sqflite gives you a relational database wrapped in friendly Dart APIs.', 2),
  ('01400000-0000-4000-8000-000000000524', '01400000-0000-4000-8000-000000000324',
   'Why do persistence calls return Futures?',
   'Disk and database I/O run off the UI thread and complete later.', 3),
  ('01400000-0000-4000-8000-000000000525', '01400000-0000-4000-8000-000000000328',
   'What is the correct widget structure for a full screen?',
   'MaterialApp wraps Scaffold, which provides the app bar and body.', 1),
  ('01400000-0000-4000-8000-000000000526', '01400000-0000-4000-8000-000000000328',
   'When should you choose Provider over setState?',
   'Use Provider when state must be shared across many distant widgets.', 2),
  ('01400000-0000-4000-8000-000000000527', '01400000-0000-4000-8000-000000000328',
   'What does toJson return?',
   'toJson returns a Map that is ready for jsonEncode.', 3),
  ('01400000-0000-4000-8000-000000000528', '01400000-0000-4000-8000-000000000328',
   'Which storage fits a list of journal entries on-device?',
   'A JSON list in SharedPreferences or rows in SQLite both work for small data.', 4),
  ('01400000-0000-4000-8000-000000000529', '01400000-0000-4000-8000-000000000328',
   'What is the last step before distributing your Flutter app?',
   'Build a release bundle and test the signed app on a physical device.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): widgets
  ('01400000-0000-4000-8000-000000001001', '01400000-0000-4000-8000-000000000501', 'Widgets', TRUE,  1),
  ('01400000-0000-4000-8000-000000001002', '01400000-0000-4000-8000-000000000501', 'Views', FALSE, 2),
  ('01400000-0000-4000-8000-000000001003', '01400000-0000-4000-8000-000000000501', 'Activities', FALSE, 3),
  ('01400000-0000-4000-8000-000000001004', '01400000-0000-4000-8000-000000000501', 'Fragments', FALSE, 4),
  -- Q1 (502): dart
  ('01400000-0000-4000-8000-000000001005', '01400000-0000-4000-8000-000000000502', 'Dart', TRUE,  1),
  ('01400000-0000-4000-8000-000000001006', '01400000-0000-4000-8000-000000000502', 'Kotlin', FALSE, 2),
  ('01400000-0000-4000-8000-000000001007', '01400000-0000-4000-8000-000000000502', 'Swift', FALSE, 3),
  ('01400000-0000-4000-8000-000000001008', '01400000-0000-4000-8000-000000000502', 'Java', FALSE, 4),
  -- Q1 (503): flutter create
  ('01400000-0000-4000-8000-000000001009', '01400000-0000-4000-8000-000000000503', 'flutter create', TRUE,  1),
  ('01400000-0000-4000-8000-000000001010', '01400000-0000-4000-8000-000000000503', 'flutter new', FALSE, 2),
  ('01400000-0000-4000-8000-000000001011', '01400000-0000-4000-8000-000000000503', 'dart init', FALSE, 3),
  ('01400000-0000-4000-8000-000000001012', '01400000-0000-4000-8000-000000000503', 'flutter build', FALSE, 4),
  -- Q2 (504): final
  ('01400000-0000-4000-8000-000000001013', '01400000-0000-4000-8000-000000000504', 'final', TRUE,  1),
  ('01400000-0000-4000-8000-000000001014', '01400000-0000-4000-8000-000000000504', 'var', FALSE, 2),
  ('01400000-0000-4000-8000-000000001015', '01400000-0000-4000-8000-000000000504', 'dynamic', FALSE, 3),
  ('01400000-0000-4000-8000-000000001016', '01400000-0000-4000-8000-000000000504', 'late', FALSE, 4),
  -- Q2 (505): nullable int
  ('01400000-0000-4000-8000-000000001017', '01400000-0000-4000-8000-000000000505', 'int?', TRUE,  1),
  ('01400000-0000-4000-8000-000000001018', '01400000-0000-4000-8000-000000000505', 'int', FALSE, 2),
  ('01400000-0000-4000-8000-000000001019', '01400000-0000-4000-8000-000000000505', 'int!', FALSE, 3),
  ('01400000-0000-4000-8000-000000001020', '01400000-0000-4000-8000-000000000505', 'Nothing', FALSE, 4),
  -- Q2 (506): null safety
  ('01400000-0000-4000-8000-000000001021', '01400000-0000-4000-8000-000000000506', 'Non-nullable types never hold null', TRUE,  1),
  ('01400000-0000-4000-8000-000000001022', '01400000-0000-4000-8000-000000000506', 'Null is allowed everywhere', FALSE, 2),
  ('01400000-0000-4000-8000-000000001023', '01400000-0000-4000-8000-000000000506', 'Every variable is nullable', FALSE, 3),
  ('01400000-0000-4000-8000-000000001024', '01400000-0000-4000-8000-000000000506', 'The compiler ignores null', FALSE, 4),
  -- Q3 (507): stateless
  ('01400000-0000-4000-8000-000000001025', '01400000-0000-4000-8000-000000000507', 'StatelessWidget', TRUE,  1),
  ('01400000-0000-4000-8000-000000001026', '01400000-0000-4000-8000-000000000507', 'StatefulWidget', FALSE, 2),
  ('01400000-0000-4000-8000-000000001027', '01400000-0000-4000-8000-000000000507', 'Container', FALSE, 3),
  ('01400000-0000-4000-8000-000000001028', '01400000-0000-4000-8000-000000000507', 'FutureBuilder', FALSE, 4),
  -- Q3 (508): build
  ('01400000-0000-4000-8000-000000001029', '01400000-0000-4000-8000-000000000508', 'build()', TRUE,  1),
  ('01400000-0000-4000-8000-000000001030', '01400000-0000-4000-8000-000000000508', 'render()', FALSE, 2),
  ('01400000-0000-4000-8000-000000001031', '01400000-0000-4000-8000-000000000508', 'paint()', FALSE, 3),
  ('01400000-0000-4000-8000-000000001032', '01400000-0000-4000-8000-000000000508', 'start()', FALSE, 4),
  -- Q3 (509): setState rebuild
  ('01400000-0000-4000-8000-000000001033', '01400000-0000-4000-8000-000000000509', 'setState()', TRUE,  1),
  ('01400000-0000-4000-8000-000000001034', '01400000-0000-4000-8000-000000000509', 'rebuild()', FALSE, 2),
  ('01400000-0000-4000-8000-000000001035', '01400000-0000-4000-8000-000000000509', 'refresh()', FALSE, 3),
  ('01400000-0000-4000-8000-000000001036', '01400000-0000-4000-8000-000000000509', 'update()', FALSE, 4),
  -- Q4 (510): column
  ('01400000-0000-4000-8000-000000001037', '01400000-0000-4000-8000-000000000510', 'Column', TRUE,  1),
  ('01400000-0000-4000-8000-000000001038', '01400000-0000-4000-8000-000000000510', 'Row', FALSE, 2),
  ('01400000-0000-4000-8000-000000001039', '01400000-0000-4000-8000-000000000510', 'Stack', FALSE, 3),
  ('01400000-0000-4000-8000-000000001040', '01400000-0000-4000-8000-000000000510', 'Wrap', FALSE, 4),
  -- Q4 (511): mainAxisAlignment
  ('01400000-0000-4000-8000-000000001041', '01400000-0000-4000-8000-000000000511', 'mainAxisAlignment', TRUE,  1),
  ('01400000-0000-4000-8000-000000001042', '01400000-0000-4000-8000-000000000511', 'crossAxisAlignment', FALSE, 2),
  ('01400000-0000-4000-8000-000000001043', '01400000-0000-4000-8000-000000000511', 'spaceBetween', FALSE, 3),
  ('01400000-0000-4000-8000-000000001044', '01400000-0000-4000-8000-000000000511', 'padding', FALSE, 4),
  -- Q4 (512): theme
  ('01400000-0000-4000-8000-000000001045', '01400000-0000-4000-8000-000000000512', 'ThemeData', TRUE,  1),
  ('01400000-0000-4000-8000-000000001046', '01400000-0000-4000-8000-000000000512', 'AppBar color', FALSE, 2),
  ('01400000-0000-4000-8000-000000001047', '01400000-0000-4000-8000-000000000512', 'Each widget style', FALSE, 3),
  ('01400000-0000-4000-8000-000000001048', '01400000-0000-4000-8000-000000000512', 'pubspec.yaml', FALSE, 4),
  -- Q5 (513): setState
  ('01400000-0000-4000-8000-000000001049', '01400000-0000-4000-8000-000000000513', 'Schedules a rebuild', TRUE,  1),
  ('01400000-0000-4000-8000-000000001050', '01400000-0000-4000-8000-000000000513', 'Re-creates the app', FALSE, 2),
  ('01400000-0000-4000-8000-000000001051', '01400000-0000-4000-8000-000000000513', 'Saves to disk', FALSE, 3),
  ('01400000-0000-4000-8000-000000001052', '01400000-0000-4000-8000-000000000513', 'Clears all state', FALSE, 4),
  -- Q5 (514): inherited widget
  ('01400000-0000-4000-8000-000000001053', '01400000-0000-4000-8000-000000000514', 'Shares data down the tree', TRUE,  1),
  ('01400000-0000-4000-8000-000000001054', '01400000-0000-4000-8000-000000000514', 'Renders long lists', FALSE, 2),
  ('01400000-0000-4000-8000-000000001055', '01400000-0000-4000-8000-000000000514', 'Animates widgets', FALSE, 3),
  ('01400000-0000-4000-8000-000000001056', '01400000-0000-4000-8000-000000000514', 'Fetches network data', FALSE, 4),
  -- Q5 (515): change notifier provider
  ('01400000-0000-4000-8000-000000001057', '01400000-0000-4000-8000-000000000515', 'ChangeNotifierProvider', TRUE,  1),
  ('01400000-0000-4000-8000-000000001058', '01400000-0000-4000-8000-000000000515', 'StatelessWidget', FALSE, 2),
  ('01400000-0000-4000-8000-000000001059', '01400000-0000-4000-8000-000000000515', 'MaterialApp', FALSE, 3),
  ('01400000-0000-4000-8000-000000001060', '01400000-0000-4000-8000-000000000515', 'Align', FALSE, 4),
  -- Q6 (516): navigator push
  ('01400000-0000-4000-8000-000000001061', '01400000-0000-4000-8000-000000000516', 'Navigator.push()', TRUE,  1),
  ('01400000-0000-4000-8000-000000001062', '01400000-0000-4000-8000-000000000516', 'Navigator.pop()', FALSE, 2),
  ('01400000-0000-4000-8000-000000001063', '01400000-0000-4000-8000-000000000516', 'Navigator.next()', FALSE, 3),
  ('01400000-0000-4000-8000-000000001064', '01400000-0000-4000-8000-000000000516', 'Navigator.open()', FALSE, 4),
  -- Q6 (517): validator
  ('01400000-0000-4000-8000-000000001065', '01400000-0000-4000-8000-000000000517', 'validator', TRUE,  1),
  ('01400000-0000-4000-8000-000000001066', '01400000-0000-4000-8000-000000000517', 'onChanged', FALSE, 2),
  ('01400000-0000-4000-8000-000000001067', '01400000-0000-4000-8000-000000000517', 'onSaved', FALSE, 3),
  ('01400000-0000-4000-8000-000000001068', '01400000-0000-4000-8000-000000000517', 'build', FALSE, 4),
  -- Q6 (518): pop result
  ('01400000-0000-4000-8000-000000001069', '01400000-0000-4000-8000-000000000518', 'Navigator.pop(context, result)', TRUE,  1),
  ('01400000-0000-4000-8000-000000001070', '01400000-0000-4000-8000-000000000518', 'Navigator.push(context, result)', FALSE, 2),
  ('01400000-0000-4000-8000-000000001071', '01400000-0000-4000-8000-000000000518', 'Navigator.result(result)', FALSE, 3),
  ('01400000-0000-4000-8000-000000001072', '01400000-0000-4000-8000-000000000518', 'setState(result)', FALSE, 4),
  -- Q7 (519): http.get
  ('01400000-0000-4000-8000-000000001073', '01400000-0000-4000-8000-000000000519', 'A Future of a Response', TRUE,  1),
  ('01400000-0000-4000-8000-000000001074', '01400000-0000-4000-8000-000000000519', 'A String', FALSE, 2),
  ('01400000-0000-4000-8000-000000001075', '01400000-0000-4000-8000-000000000519', 'A Map', FALSE, 3),
  ('01400000-0000-4000-8000-000000001076', '01400000-0000-4000-8000-000000000519', 'A Widget', FALSE, 4),
  -- Q7 (520): fromJson
  ('01400000-0000-4000-8000-000000001077', '01400000-0000-4000-8000-000000000520', 'fromJson', TRUE,  1),
  ('01400000-0000-4000-8000-000000001078', '01400000-0000-4000-8000-000000000520', 'toJson', FALSE, 2),
  ('01400000-0000-4000-8000-000000001079', '01400000-0000-4000-8000-000000000520', 'jsonDecode', FALSE, 3),
  ('01400000-0000-4000-8000-000000001080', '01400000-0000-4000-8000-000000000520', 'serialize', FALSE, 4),
  -- Q7 (521): jsonDecode
  ('01400000-0000-4000-8000-000000001081', '01400000-0000-4000-8000-000000000521', 'jsonDecode()', TRUE,  1),
  ('01400000-0000-4000-8000-000000001082', '01400000-0000-4000-8000-000000000521', 'jsonEncode()', FALSE, 2),
  ('01400000-0000-4000-8000-000000001083', '01400000-0000-4000-8000-000000000521', 'http.get()', FALSE, 3),
  ('01400000-0000-4000-8000-000000001084', '01400000-0000-4000-8000-000000000521', 'utf8.decode()', FALSE, 4),
  -- Q8 (522): shared prefs
  ('01400000-0000-4000-8000-000000001085', '01400000-0000-4000-8000-000000000522', 'Small key-value data', TRUE,  1),
  ('01400000-0000-4000-8000-000000001086', '01400000-0000-4000-8000-000000000522', 'Large relational data', FALSE, 2),
  ('01400000-0000-4000-8000-000000001087', '01400000-0000-4000-8000-000000000522', 'Binary media files', FALSE, 3),
  ('01400000-0000-4000-8000-000000001088', '01400000-0000-4000-8000-000000000522', 'Video streaming', FALSE, 4),
  -- Q8 (523): sqflite
  ('01400000-0000-4000-8000-000000001089', '01400000-0000-4000-8000-000000000523', 'sqflite', TRUE,  1),
  ('01400000-0000-4000-8000-000000001090', '01400000-0000-4000-8000-000000000523', 'shared_preferences', FALSE, 2),
  ('01400000-0000-4000-8000-000000001091', '01400000-0000-4000-8000-000000000523', 'http', FALSE, 3),
  ('01400000-0000-4000-8000-000000001092', '01400000-0000-4000-8000-000000000523', 'path_provider', FALSE, 4),
  -- Q8 (524): async io
  ('01400000-0000-4000-8000-000000001093', '01400000-0000-4000-8000-000000000524', 'I/O is asynchronous', TRUE,  1),
  ('01400000-0000-4000-8000-000000001094', '01400000-0000-4000-8000-000000000524', 'To slow the app down', FALSE, 2),
  ('01400000-0000-4000-8000-000000001095', '01400000-0000-4000-8000-000000000524', 'To block user input', FALSE, 3),
  ('01400000-0000-4000-8000-000000001096', '01400000-0000-4000-8000-000000000524', 'For animations only', FALSE, 4),
  -- Q9 (525): widget structure
  ('01400000-0000-4000-8000-000000001097', '01400000-0000-4000-8000-000000000525', 'MaterialApp wraps Scaffold', TRUE,  1),
  ('01400000-0000-4000-8000-000000001098', '01400000-0000-4000-8000-000000000525', 'Scaffold wraps MaterialApp', FALSE, 2),
  ('01400000-0000-4000-8000-000000001099', '01400000-0000-4000-8000-000000000525', 'Row wraps MaterialApp', FALSE, 3),
  ('01400000-0000-4000-8000-000000001100', '01400000-0000-4000-8000-000000000525', 'Stack wraps the body', FALSE, 4),
  -- Q9 (526): provider vs setState
  ('01400000-0000-4000-8000-000000001101', '01400000-0000-4000-8000-000000000526', 'Shared across many widgets', TRUE,  1),
  ('01400000-0000-4000-8000-000000001102', '01400000-0000-4000-8000-000000000526', 'A single local toggle', FALSE, 2),
  ('01400000-0000-4000-8000-000000001103', '01400000-0000-4000-8000-000000000526', 'Static labels only', FALSE, 3),
  ('01400000-0000-4000-8000-000000001104', '01400000-0000-4000-8000-000000000526', 'Images only', FALSE, 4),
  -- Q9 (527): toJson
  ('01400000-0000-4000-8000-000000001105', '01400000-0000-4000-8000-000000000527', 'A Map ready for jsonEncode', TRUE,  1),
  ('01400000-0000-4000-8000-000000001106', '01400000-0000-4000-8000-000000000527', 'A JSON string', FALSE, 2),
  ('01400000-0000-4000-8000-000000001107', '01400000-0000-4000-8000-000000000527', 'A widget subtree', FALSE, 3),
  ('01400000-0000-4000-8000-000000001108', '01400000-0000-4000-8000-000000000527', 'A file handle', FALSE, 4),
  -- Q9 (528): storage choice
  ('01400000-0000-4000-8000-000000001109', '01400000-0000-4000-8000-000000000528', 'JSON list or SQLite rows', TRUE,  1),
  ('01400000-0000-4000-8000-000000001110', '01400000-0000-4000-8000-000000000528', 'A single bool flag', FALSE, 2),
  ('01400000-0000-4000-8000-000000001111', '01400000-0000-4000-8000-000000000528', 'An asset file', FALSE, 3),
  ('01400000-0000-4000-8000-000000001112', '01400000-0000-4000-8000-000000000528', 'No storage at all', FALSE, 4),
  -- Q9 (529): release
  ('01400000-0000-4000-8000-000000001113', '01400000-0000-4000-8000-000000000529', 'Build a release bundle', TRUE,  1),
  ('01400000-0000-4000-8000-000000001114', '01400000-0000-4000-8000-000000000529', 'Delete the source code', FALSE, 2),
  ('01400000-0000-4000-8000-000000001115', '01400000-0000-4000-8000-000000000529', 'Remove all tests', FALSE, 3),
  ('01400000-0000-4000-8000-000000001116', '01400000-0000-4000-8000-000000000529', 'Increase debug prints', FALSE, 4)
ON CONFLICT (id) DO NOTHING;
-- ============================================================================
-- SEED 060: Complete course — "SwiftUI for Modern iOS"
-- ----------------------------------------------------------------------------
-- Instructor : Marcus Johnson    (10000000-0000-4000-8000-000000000002)
-- Category   : Mobile Development (20000000-0000-4000-8000-000000000007)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Swift Essentials           → C1 Language Fundamentals · C2 Types, Control Flow & Protocols
--   M2 SwiftUI Basics             → C3 Declarative UI · C4 Views & Modifiers
--   M3 Layout & State             → C5 Layout & Stacks · C6 State Management
--   M4 Data, Lists & Interaction  → C7 Lists & Navigation · C8 Forms & Animation
--   M5 Capstone: Data & Launch    → C9 Networking & SwiftData · C10 Lifecycle & Deployment
--
-- Content: 19 TEXT lessons with lesson_contents (self-contained HTML + inline
-- CSS, dollar-quoted so apostrophes need no escaping) and 9 QUIZ lessons with
-- 29 questions / 116 options across quizzes + `quizzes` and `quiz_options`.
--
-- Capstone: every module builds toward a "Reading List" app that saves books,
-- tracks progress, loads book data from a network API, and persists locally
-- with SwiftData — the app you will prepare for the App Store in Module 5.
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
  '03C00000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000002',
  '20000000-0000-4000-8000-000000000007',
  'SwiftUI for Modern iOS',
  'swiftui-for-modern-ios',
  'Build modern iOS apps from scratch with SwiftUI. Master the Swift language, declarative interfaces, view modifiers, state management, lists, forms, animations, networking with URLSession, and SwiftData persistence — then ship a complete Reading List app ready for the App Store.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  58
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('03C00000-0000-4000-8000-000000000011', '03C00000-0000-4000-8000-000000000001', 'Write idiomatic Swift with constants, optionals, collections, functions, and protocols.',        1),
  ('03C00000-0000-4000-8000-000000000012', '03C00000-0000-4000-8000-000000000001', 'Build declarative SwiftUI interfaces with views, modifiers, and reusable components.',          2),
  ('03C00000-0000-4000-8000-000000000013', '03C00000-0000-4000-8000-000000000001', 'Manage state with bindings, observable models, and the environment.',                          3),
  ('03C00000-0000-4000-8000-000000000014', '03C00000-0000-4000-8000-000000000001', 'Create lists, navigation, forms, and animations that feel native on iOS.',                     4),
  ('03C00000-0000-4000-8000-000000000015', '03C00000-0000-4000-8000-000000000001', 'Fetch JSON with URLSession, persist data with SwiftData, and prepare an app for release.',     5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('03C00000-0000-4000-8000-000000000101', '03C00000-0000-4000-8000-000000000001', 1, 'Swift Essentials',            'Learn the Swift language: types, optionals, control flow, and value types.', 'PUBLISHED'),
  ('03C00000-0000-4000-8000-000000000102', '03C00000-0000-4000-8000-000000000001', 2, 'SwiftUI Basics',              'Compose declarative interfaces with the View protocol, views, and modifiers.','PUBLISHED'),
  ('03C00000-0000-4000-8000-000000000103', '03C00000-0000-4000-8000-000000000001', 3, 'Layout & State',              'Build layouts with stacks and drive the interface from state.',              'PUBLISHED'),
  ('03C00000-0000-4000-8000-000000000104', '03C00000-0000-4000-8000-000000000001', 4, 'Data, Lists & Interaction',   'Present collections, navigate, collect input, and animate changes.',         'PUBLISHED'),
  ('03C00000-0000-4000-8000-000000000105', '03C00000-0000-4000-8000-000000000001', 5, 'Capstone: Data & Launch',     'Add networking and persistence, then prepare your app for release.',         'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('03C00000-0000-4000-8000-000000000201', '03C00000-0000-4000-8000-000000000101', 1, 'Language Fundamentals',        'Variables, constants, types, and the Swift playground.',         'PUBLISHED'),
  ('03C00000-0000-4000-8000-000000000202', '03C00000-0000-4000-8000-000000000101', 2, 'Types, Control Flow & Protocols','Collections, optionals, functions, and value types.',            'PUBLISHED'),
  ('03C00000-0000-4000-8000-000000000203', '03C00000-0000-4000-8000-000000000102', 1, 'Declarative UI',               'The App protocol, the View protocol, and your first interface.',  'PUBLISHED'),
  ('03C00000-0000-4000-8000-000000000204', '03C00000-0000-4000-8000-000000000102', 2, 'Views & Modifiers',            'Compose and style views with a modifier chain.',                  'PUBLISHED'),
  ('03C00000-0000-4000-8000-000000000205', '03C00000-0000-4000-8000-000000000103', 1, 'Layout & Stacks',              'Stack containers, spacing, alignment, and frames.',               'PUBLISHED'),
  ('03C00000-0000-4000-8000-000000000206', '03C00000-0000-4000-8000-000000000103', 2, 'State Management',             'Bindings, observable models, and the environment.',               'PUBLISHED'),
  ('03C00000-0000-4000-8000-000000000207', '03C00000-0000-4000-8000-000000000104', 1, 'Lists & Navigation',           'Present collections and move between screens.',                   'PUBLISHED'),
  ('03C00000-0000-4000-8000-000000000208', '03C00000-0000-4000-8000-000000000104', 2, 'Forms & Animation',            'Collect user input and animate interface changes.',               'PUBLISHED'),
  ('03C00000-0000-4000-8000-000000000209', '03C00000-0000-4000-8000-000000000105', 1, 'Networking & SwiftData',       'Load JSON from the network and store data locally.',              'PUBLISHED'),
  ('03C00000-0000-4000-8000-000000000210', '03C00000-0000-4000-8000-000000000105', 2, 'Lifecycle & Deployment',       'Prepare, sign, and publish your app to the App Store.',           'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 03C00000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('03C00000-0000-4000-8000-000000000301', '03C00000-0000-4000-8000-000000000201', 1, 'Swift Language Tour',                        'Meet the toolkit and write your first lines of Swift.',                   'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('03C00000-0000-4000-8000-000000000302', '03C00000-0000-4000-8000-000000000201', 2, 'Types, Optionals & Collections',              'Work with numbers, strings, optionals, arrays, and dictionaries.',        'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03C00000-0000-4000-8000-000000000303', '03C00000-0000-4000-8000-000000000201', 3, 'Swift Essentials Quiz',                       'Check your understanding of Swift fundamentals.',                         'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03C00000-0000-4000-8000-000000000304', '03C00000-0000-4000-8000-000000000202', 1, 'Control Flow & Functions',                    'Make decisions with if and switch, repeat with loops, and write functions.','TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03C00000-0000-4000-8000-000000000305', '03C00000-0000-4000-8000-000000000202', 2, 'Structs, Classes & Protocols',                'Model data with structs, classes, enums, and protocols.',                'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03C00000-0000-4000-8000-000000000306', '03C00000-0000-4000-8000-000000000202', 3, 'Swift Language Quiz',                         'Test your grasp of Swift types and language structure.',                  'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03C00000-0000-4000-8000-000000000307', '03C00000-0000-4000-8000-000000000203', 1, 'Your First SwiftUI View',                     'Run your first SwiftUI app and meet the App and Scene types.',            'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('03C00000-0000-4000-8000-000000000308', '03C00000-0000-4000-8000-000000000203', 2, 'The View Protocol & Declarative UI',          'Understand the View protocol and declarative composition.',               'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03C00000-0000-4000-8000-000000000309', '03C00000-0000-4000-8000-000000000203', 3, 'SwiftUI Basics Quiz',                         'Check your grasp of declarative UI basics.',                              'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03C00000-0000-4000-8000-000000000310', '03C00000-0000-4000-8000-000000000204', 1, 'Views & Modifiers',                           'Style and shape views with a modifier chain.',                             'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03C00000-0000-4000-8000-000000000311', '03C00000-0000-4000-8000-000000000204', 2, 'Building Reusable Views',                     'Split your interface into small, reusable components.',                    'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03C00000-0000-4000-8000-000000000312', '03C00000-0000-4000-8000-000000000204', 3, 'Views & Modifiers Quiz',                      'Test your knowledge of views and modifiers.',                              'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03C00000-0000-4000-8000-000000000313', '03C00000-0000-4000-8000-000000000205', 1, 'Stacks & Layout',                             'Arrange interfaces with VStack, HStack, and ZStack.',                     'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03C00000-0000-4000-8000-000000000314', '03C00000-0000-4000-8000-000000000205', 2, 'Alignment, Spacing & Layout Control',         'Control spacing, alignment, and frames for polished layouts.',             'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('03C00000-0000-4000-8000-000000000315', '03C00000-0000-4000-8000-000000000205', 3, 'Layout & Stacks Quiz',                        'Check your layout and stacking skills.',                                   'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03C00000-0000-4000-8000-000000000316', '03C00000-0000-4000-8000-000000000206', 1, 'State Management with @State & @Binding',     'Drive interfaces from state with @State and @Binding.',                    'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03C00000-0000-4000-8000-000000000317', '03C00000-0000-4000-8000-000000000206', 2, 'Observable Models & Environment',             'Share model data with @Observable and the environment.',                   'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03C00000-0000-4000-8000-000000000318', '03C00000-0000-4000-8000-000000000206', 3, 'State Management Quiz',                       'Test your state management knowledge.',                                    'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03C00000-0000-4000-8000-000000000319', '03C00000-0000-4000-8000-000000000207', 1, 'Lists & ForEach',                             'Present scrolling collections with List and ForEach.',                     'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03C00000-0000-4000-8000-000000000320', '03C00000-0000-4000-8000-000000000207', 2, 'NavigationStack & Navigation',                'Move between screens with NavigationStack and links.',                     'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03C00000-0000-4000-8000-000000000321', '03C00000-0000-4000-8000-000000000207', 3, 'Lists & Navigation Quiz',                     'Check your list and navigation skills.',                                   'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03C00000-0000-4000-8000-000000000322', '03C00000-0000-4000-8000-000000000208', 1, 'Forms & Data Entry',                          'Collect and validate input with Form controls.',                            'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03C00000-0000-4000-8000-000000000323', '03C00000-0000-4000-8000-000000000208', 2, 'Animations & Transitions',                    'Add motion and life to interfaces with animations.',                        'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('03C00000-0000-4000-8000-000000000324', '03C00000-0000-4000-8000-000000000208', 3, 'Forms & Animation Quiz',                      'Check your forms and animation knowledge.',                                'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03C00000-0000-4000-8000-000000000325', '03C00000-0000-4000-8000-000000000209', 1, 'Networking & Combine Fundamentals',           'Load JSON from the network with URLSession and async/await.',               'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03C00000-0000-4000-8000-000000000326', '03C00000-0000-4000-8000-000000000209', 2, 'SwiftData: Persistent Local Storage',         'Persist data locally with SwiftData models and queries.',                  'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03C00000-0000-4000-8000-000000000327', '03C00000-0000-4000-8000-000000000210', 1, 'App Lifecycle & Deployment',                  'Understand the app lifecycle and prepare a build for the App Store.',       'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03C00000-0000-4000-8000-000000000328', '03C00000-0000-4000-8000-000000000210', 2, 'Final Assessment',                            'Prove what you learned across the whole course.',                          'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 03C00000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '03C00000-0000-4000-8000-000000000401',
  '03C00000-0000-4000-8000-000000000301',
  1,
  'Swift Language Tour',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Swift Language Tour</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Swift Language Tour</h1>
  <p>Swift is Apple&rsquo;s modern programming language for iOS, iPadOS, macOS, watchOS, and visionOS apps. It is <strong>fast, safe, and expressive</strong> — and it powers SwiftUI, the declarative framework you will use for every interface in this course.</p>
  <p>Throughout this course you will build a <strong>Reading List</strong> app: save books you want to read, track reading progress, and persist everything locally with SwiftData. Every idea in this module maps directly onto that app.</p>
  <h2>Hello, Swift</h2>
  <p>Open Xcode, create a <em>Playground</em>, and run:</p>
  <pre class="code-block">var greeting = &quot;Hello, Swift!&quot;
print(greeting)

greeting = &quot;Hello, ReadingList!&quot;
print(greeting)</pre>
  <p><span class="ic">var</span> declares a <em>variable</em> that can change. Change it to <span class="ic">let</span> and Swift refuses to reassign — <strong>let means constant</strong>:</p>
  <pre class="code-block">let bookTitle = &quot;The Pragmatic Programmer&quot;
bookTitle = &quot;Clean Code&quot;   // error: cannot assign to a constant</pre>
  <div class="callout callout-tip">
    <strong>Prefer let</strong>
    <p>Reach for <span class="ic">let</span> by default. Constants are safer, easier to reason about, and let the compiler optimize your code.</p>
  </div>
  <h2>String interpolation</h2>
  <p>Build strings by wrapping values in <span class="ic">\( )</span>:</p>
  <pre class="code-block">let pages = 352
print(&quot;That book has \(pages) pages.&quot;)</pre>
  <h2>Comments</h2>
  <pre class="code-block">// single-line comment

/* multi-line
   comment */</pre>
  <p>Comments are ignored by the compiler but invaluable to readers — including future you. Use them to explain <em>why</em>, not what.</p>
</div>
</body>
</html>
$html$
),
(
  '03C00000-0000-4000-8000-000000000402',
  '03C00000-0000-4000-8000-000000000302',
  1,
  'Types, Optionals & Collections',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Types, Optionals & Collections</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Types, Optionals &amp; Collections</h1>
  <p>Swift is a <strong>strongly typed</strong> language: every value has a type, and the compiler checks how types are used. That catches whole classes of bugs before your app ever runs.</p>
  <h2>Common types</h2>
  <table>
    <tr><th>Type</th><th>Example</th><th>Notes</th></tr>
    <tr><td>Int</td><td>42</td><td>Whole numbers</td></tr>
    <tr><td>Double</td><td>3.14</td><td>Fractional numbers</td></tr>
    <tr><td>Bool</td><td>true</td><td>true or false</td></tr>
    <tr><td>String</td><td>&quot;Swift&quot;</td><td>Text</td></tr>
    <tr><td>Optional</td><td>Int?</td><td>A value or nil</td></tr>
  </table>
  <pre class="code-block">let title: String = &quot;SwiftUI for Modern iOS&quot;
let pages: Int = 412
let rating: Double = 4.8
let isFiction: Bool = false</pre>
  <p>Swift usually <em>infers</em> the type, so explicit annotations are optional — but they document intent.</p>
  <h2>Optionals</h2>
  <p>An optional can hold a value <em>or</em> nothing (<span class="ic">nil</span>). A book might be missing a publication year:</p>
  <pre class="code-block">var publicationYear: Int? = 2024
publicationYear = nil   // not known yet</pre>
  <p>You cannot use an optional as a plain value. Unwrap it safely with <span class="ic">if let</span> or <span class="ic">guard let</span>:</p>
  <pre class="code-block">if let year = publicationYear {
    print(&quot;Published in \(year)&quot;)
} else {
    print(&quot;Year unknown&quot;)
}</pre>
  <div class="callout">
    <strong>Never force unwrap</strong>
    <p><span class="ic">value!</span> crashes your app if the optional is nil. Treat force unwrapping as a red flag in code review.</p>
  </div>
  <h2>Arrays and dictionaries</h2>
  <pre class="code-block">var shelf: [String] = [&quot;Clean Code&quot;, &quot;Designing Data-Intensive Apps&quot;]
shelf.append(&quot;The Pragmatic Programmer&quot;)
print(shelf[0])                    // Clean Code

let byAuthor: [String: Int] = [&quot;Knuth&quot;: 3, &quot;Martin&quot;: 5]</pre>
  <p><span class="ic">Array</span> keeps order and allows duplicates; <span class="ic">Set</span> stores unique values; <span class="ic">Dictionary</span> maps keys to values. Your Reading List app will lean heavily on arrays of books.</p>
  <div class="callout callout-tip">
    <strong>Bind, then use</strong>
    <p><span class="ic">guard let</span> early-exits the current scope with nil; <span class="ic">if let</span> runs only when a value exists. Both are safe — pick the one that reads best for your code.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03C00000-0000-4000-8000-000000000404',
  '03C00000-0000-4000-8000-000000000304',
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
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Control Flow &amp; Functions</h1>
  <p>Programs branch on conditions and repeat work. Swift makes both readable.</p>
  <h2>if and guard</h2>
  <pre class="code-block">let rating = 4.5

if rating &gt;= 4.5 {
    print(&quot;A must-read&quot;)
} else if rating &gt;= 4.0 {
    print(&quot;Worth your time&quot;)
} else {
    print(&quot;Skippable&quot;)
}</pre>
  <h2>switch</h2>
  <p><span class="ic">switch</span> handles many exact cases and is <em>exhaustive</em> — every case must be covered:</p>
  <pre class="code-block">switch status {
case &quot;reading&quot;:
    print(&quot;Currently reading&quot;)
case &quot;finished&quot;:
    print(&quot;Finished&quot;)
default:
    print(&quot;Not started&quot;)
}</pre>
  <h2>Loops</h2>
  <p>Ranges and <span class="ic">for-in</span> work together naturally:</p>
  <pre class="code-block">for page in 1...10 {
    print(&quot;Reading page \(page)&quot;)
}

let books = [&quot;Clean Code&quot;, &quot;Refactoring&quot;]
for book in books {
    print(book)
}</pre>
  <p><span class="ic">while</span> repeats until a condition turns false; <span class="ic">repeat-while</span> runs at least once.</p>
  <div class="callout callout-tip">
    <strong>Half-open ranges</strong>
    <p><span class="ic">0..&lt;10</span> means zero through nine; <span class="ic">0...10</span> includes ten. The half-open form is the one you pick by default to avoid off-by-one errors.</p>
  </div>
  <h2>Functions</h2>
  <p>Functions package behavior with parameters, argument labels, and default values:</p>
  <pre class="code-block">func progress(current: Int, total: Int) -&gt; Double {
    Double(current) / Double(total)
}

print(progress(current: 140, total: 400))   // 0.35</pre>
  <p>Swift infers a single-expression body, so the implicit <span class="ic">return</span> above is valid. Multi-value results come from tuples:</p>
  <pre class="code-block">func pagesLeft(current: Int, total: Int) -&gt; (read: Int, left: Int) {
    (read: current, left: total - current)
}

let result = pagesLeft(current: 140, total: 400)
print(result.left)   // 260</pre>
  </div>
</body>
</html>
$html$
),
(
  '03C00000-0000-4000-8000-000000000405',
  '03C00000-0000-4000-8000-000000000305',
  1,
  'Structs, Classes & Protocols',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Structs, Classes & Protocols</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Structs, Classes &amp; Protocols</h1>
  <p>You model your domain with <strong>structs</strong> (value types) and, less often, <strong>classes</strong> (reference types). Protocols describe the shape an idea must have.</p>
  <h2>Structs</h2>
  <p>A struct bundles related data and behavior. Memberwise initialization comes free:</p>
  <pre class="code-block">struct Book {
    var title: String
    var pages: Int
    var rating: Double

    func summary() -&gt; String {
        &quot;\(title) — \(pages) pages&quot;
    }
}

let book = Book(title: &quot;Refactoring&quot;, pages: 448, rating: 4.7)
print(book.summary())</pre>
  <p>Assigning a struct <strong>copies</strong> it — each copy is fully independent (value semantics):</p>
  <pre class="code-block">var a = Book(title: &quot;Clean Code&quot;, pages: 464, rating: 4.7)
var b = a
b.rating = 4.0
print(a.rating)   // 4.7 — a is untouched</pre>
  <h2>Classes</h2>
  <p>Classes share one instance between all references. They support inheritance and are used when identity matters, such as the observable models you will meet in Module 3.</p>
  <div class="callout callout-tip">
    <strong>Default to structs</strong>
    <p>Apple guidance: prefer structs for value-like data. Reaching for a class is the exception, not the rule.</p>
  </div>
  <h2>Enums</h2>
  <p>Enums model a closed set of options and can carry related values:</p>
  <pre class="code-block">enum ReadingStatus {
    case unread
    case reading(page: Int)
    case finished
}</pre>
  <h2>Protocols</h2>
  <p>A protocol lists requirements; any type that conforms satisfies them:</p>
  <pre class="code-block">protocol Describable {
    var title: String { get }
    func describe() -&gt; String
}

extension Book: Describable {
    func describe() -&gt; String { summary() }
}</pre>
  </div>
</body>
</html>
$html$
),
(
  '03C00000-0000-4000-8000-000000000407',
  '03C00000-0000-4000-8000-000000000307',
  1,
  'Your First SwiftUI View',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Your First SwiftUI View</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Your First SwiftUI View</h1>
  <p>In Xcode, create a new app using the &ldquo;<strong>SwiftUI App</strong>&rdquo; template. It generates an entry point and one screen — the smallest possible SwiftUI application.</p>
  <h2>The app entry point</h2>
  <pre class="code-block">import SwiftUI

@main
struct ReadingListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}</pre>
  <p><span class="ic">@main</span> marks where the program starts. The <span class="ic">App</span> protocol describes the app container; <span class="ic">WindowGroup</span> is a <em>scene</em> that hosts your views — SwiftUI manages how it appears across devices.</p>
  <h2>A view in three lines</h2>
  <pre class="code-block">struct ContentView: View {
    var body: some View {
        Text(&quot;Hello, Reading List!&quot;)
    }
}</pre>
  <p>A view is a struct that describes <em>what</em> to render. SwiftUI does the rendering work. `var body` is the interface description, and it can be rebuilt any time state changes.</p>
  <h2>Add a splash of order</h2>
  <pre class="code-block">struct ContentView: View {
    var body: some View {
        VStack {
            Text(&quot;Reading List&quot;)
                .font(.largeTitle)
            Text(&quot;Books worth reading&quot;)
                .foregroundStyle(.secondary)
        }
    }
}</pre>
  <p>You just used a <strong>stack</strong> (details in Module 3) and two <strong>modifiers</strong> (next lesson). This is the whole pattern of SwiftUI: describe, style, repeat.</p>
  <div class="callout callout-tip">
    <strong>View = value</strong>
    <p>Think of every view as a small, immutable value that describes one screen region. Combining tiny views into larger ones is the core of SwiftUI composition.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03C00000-0000-4000-8000-000000000408',
  '03C00000-0000-4000-8000-000000000308',
  1,
  'The View Protocol & Declarative UI',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The View Protocol & Declarative UI</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>The View Protocol &amp; Declarative UI</h1>
  <p>Every screen region in SwiftUI is a <strong>view</strong> — a struct that conforms to the <span class="ic">View</span> protocol and describes its appearance.</p>
  <h2>The one requirement</h2>
  <pre class="code-block">struct GreetingView: View {
    let name: String

    var body: some View {
        Text(&quot;Hello, \(name)!&quot;)
    }
}</pre>
  <p>A conforming type needs exactly one thing: a computed <span class="ic">body</span> property of type <span class="ic">some View</span>. That opaque type lets SwiftUI see the concrete layout while hiding the details from you.</p>
  <h2>Declarative vs imperative</h2>
  <table>
    <tr><th>Imperative (UIKit)</th><th>Declarative (SwiftUI)</th></tr>
    <tr><td>You create and wire views step by step</td><td>You describe the end state</td></tr>
    <tr><td>You mutate UI when data changes</td><td>The UI recomputes from state</td></tr>
    <tr><td>Difficult to trace ownership</td><td>One source of truth per screen</td></tr>
  </table>
  <div class="callout">
    <strong>You describe, SwiftUI renders</strong>
    <p>Your code never says &ldquo;update this label&rdquo;. It says &ldquo;here is the whole screen given this data&rdquo; — SwiftUI diff-renders the changes for you.</p>
  </div>
  <h2>Composition and the result builder</h2>
  <p>Builders let you stack views without ceremony:</p>
  <pre class="code-block">struct LibraryView: View {
    var body: some View {
        VStack {
            GreetingView(name: &quot;Marcus&quot;)
            Spacer()
            Text(&quot;3 books waiting&quot;)
        }
    }
}</pre>
  <p><span class="ic">VStack</span> is a container <em>view</em>; its content closure is transformed by the <span class="ic">@ViewBuilder</span> result builder, which combines the child views.</p>
  <h2>Views as values</h2>
  <ul>
    <li>Views are lightweight values — creating them is cheap.</li>
    <li>Combine them: a screen is a tree of small views.</li>
    <li>The same view can appear on many screens.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Keep data separate</strong>
    <p>Views should render model values, not mutate them directly. You will connect the two with state management in Module 3.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03C00000-0000-4000-8000-000000000410',
  '03C00000-0000-4000-8000-000000000310',
  1,
  'Views & Modifiers',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Views & Modifiers</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Views &amp; Modifiers</h1>
  <p><strong>Modifiers</strong> are method calls that return a new, wrapped view — each one changes one aspect of appearance or behavior.</p>
  <h2>A stylized title</h2>
  <pre class="code-block">Text(&quot;Bookshelf&quot;)
    .font(.largeTitle)
    .fontWeight(.bold)
    .foregroundStyle(.indigo)
    .padding(12)
    .background(.indigo.opacity(0.1))
    .clipShape(RoundedRectangle(cornerRadius: 10))</pre>
  <p>Read the chain top to bottom: the text is sized, weighted, colored, padded, given a backdrop, then rounded.</p>
  <h2>Order matters</h2>
  <p>Each modifier wraps the result of everything before it. Padding <em>then</em> background means the background covers the padding; reversing them shrinks the colored area to the text:</p>
  <pre class="code-block">Text(&quot;Notice&quot;)
    .padding()
    .background(.yellow)   // background includes the padding

Text(&quot;Notice&quot;)
    .background(.yellow)   // only behind the glyphs
    .padding()</pre>
  <div class="callout">
    <strong>Modifiers are not in-place edits</strong>
    <p>Think of each as building a new view shell around the previous one. That mental model makes order-of-effects bugs obvious.</p>
  </div>
  <h2>Everyday modifiers</h2>
  <table>
    <tr><th>Modifier</th><th>Effect</th></tr>
    <tr><td>.font(.title)</td><td>Text style</td></tr>
    <tr><td>.foregroundStyle(.red)</td><td>Foreground color</td></tr>
    <tr><td>.frame(width: 64, height: 64)</td><td>Fixed size</td></tr>
    <tr><td>.padding(8)</td><td>Adds space around content</td></tr>
    <tr><td>.cornerRadius(8)</td><td>Rounds corners of the clipped view</td></tr>
    <tr><td>.opacity(0.5)</td><td>Alpha transparency</td></tr>
  </table>
  <h2>Buttons</h2>
  <pre class="code-block">Button {
    addBook()
} label: {
    Label(&quot;Add Book&quot;, systemImage: &quot;plus&quot;)
}
.buttonStyle(.borderedProminent)</pre>
  <p>The <em>action</em> closure is the first argument; the <em>label</em> closure draws the content. Prefer <span class="ic">Label</span> to pair an icon with text.</p>
  <div class="callout callout-tip">
    <strong>Style from a single place</strong>
    <p>Wrap the whole button stack in <span class="ic">.buttonStyle(.borderedProminent)</span> so the design system lives in one modifier, not replicated per button.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03C00000-0000-4000-8000-000000000411',
  '03C00000-0000-4000-8000-000000000311',
  1,
  'Building Reusable Views',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Building Reusable Views</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Building Reusable Views</h1>
  <p>Big screens become unwieldy fast. The cure is the same one from Module 1: small, single-purpose components. In SwiftUI that means <strong>extracting subviews</strong>.</p>
  <h2>Extract a row view</h2>
  <p>Instead of one giant body, give each idea its own view:</p>
  <pre class="code-block">struct BookRow: View {
    let book: Book

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(book.title)
                    .font(.headline)
                Text(book.author)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Text(&quot;\(book.rating, specifier: &quot;%.1f&quot;)&quot;)
                .foregroundStyle(.indigo)
        }
    }
}</pre>
  <p><span class="ic">BookRow</span> declares its needs: a <span class="ic">Book</span>. Wherever a book must appear — list, detail, search — you use this one view.</p>
  <h2>Configure, don&rsquo;t hardcode</h2>
  <p>Give components properties instead of baking in values:</p>
  <pre class="code-block">struct StatusBadge: View {
    let status: ReadingStatus

    var body: some View {
        Text(label)
            .font(.caption.weight(.semibold))
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(color.opacity(0.15))
            .clipShape(Capsule())
    }

    private var label: String { switch status {
        case .unread: return &quot;Unread&quot;
        case .reading: return &quot;Reading&quot;
        case .finished: return &quot;Finished&quot; } }

    private var color: Color { switch status {
        case .unread: return .gray
        case .reading: return .indigo
        case .finished: return .green } }
}</pre>
  <h2>Custom modifiers</h2>
  <p>Repeated styling belongs in a <span class="ic">ViewModifier</span>:</p>
  <pre class="code-block">struct SectionHeading: ViewModifier {
    func body(content: Content) -&gt; some View {
        content
            .font(.title2.bold())
            .foregroundStyle(.indigo)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

extension Text {
    func sectionHeading() -&gt; some View {
        modifier(SectionHeading())
    }
}</pre>
  <div class="callout callout-tip">
    <strong>Preview each component</strong>
    <p>Give every component a <span class="ic">#Preview</span> with sample data. Previewing in isolation makes iteration fast and keeps components honest.</p>
  </div>
  </div>
</body>
</html>
$html$
),
(
  '03C00000-0000-4000-8000-000000000413',
  '03C00000-0000-4000-8000-000000000313',
  1,
  'Stacks & Layout',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Stacks & Layout</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Stacks &amp; Layout</h1>
  <p>Three stack containers build almost every layout you need.</p>
  <table>
    <tr><th>Container</th><th>Axis</th><th>Typical use</th></tr>
    <tr><td>VStack</td><td>Vertical</td><td>Cards, side-by-side fields</td></tr>
    <tr><td>HStack</td><td>Horizontal</td><td>Rows, header bars</td></tr>
    <tr><td>ZStack</td><td>Depth</td><td>Overlays, backgrounds</td></tr>
  </table>
  <h2>A typical card</h2>
  <pre class="code-block">VStack(alignment: .leading, spacing: 8) {
    Text(&quot;Designing Data-Intensive Apps&quot;)
        .font(.headline)
    HStack {
        Text(&quot;Martin Kleppmann&quot;)
            .font(.subheadline)
            .foregroundStyle(.secondary)
        Spacer()
        Text(&quot;Finished&quot;).foregroundStyle(.green)
    }
}
.padding()
.background(.thinMaterial)
.cornerRadius(12)</pre>
  <p><span class="ic">alignment</span> lines up children along the cross axis; <span class="ic">spacing</span> sets the gap between them.</p>
  <div class="callout callout-tip">
    <strong>Spacer fills the slack</strong>
    <p><span class="ic">Spacer()</span> expands to swallow leftover space, pushing its neighbors to the edges. It is the easiest way to distribute layout.</p>
  </div>
  <h2>ZStack for overlays</h2>
  <pre class="code-block">ZStack(alignment: .topTrailing) {
    RoundedRectangle(cornerRadius: 12).fill(.indigo.opacity(0.2))
    Text(&quot;New&quot;)
        .font(.caption.bold())
        .padding(6)
        .background(.indigo, in: Capsule())
        .foregroundStyle(.white)
        .padding(8)
}
.frame(height: 120)</pre>
  <p>ZStack draws its children back to front on the &ldquo;z axis&rdquo;, perfect for badges and floating elements.</p>
  <h2>Making space with frame</h2>
  <pre class="code-block">Text(&quot;Reading Progress&quot;)
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding()</pre>
  <p><span class="ic">frame(maxWidth: .infinity)</span> lets the view stretch to fill available width — the default way to achieve full-width rows.</p>
  </div>
</body>
</html>
$html$
),
(
  '03C00000-0000-4000-8000-000000000414',
  '03C00000-0000-4000-8000-000000000314',
  1,
  'Alignment, Spacing & Layout Control',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Alignment, Spacing & Layout Control</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Alignment, Spacing &amp; Layout Control</h1>
  <p>Stacks give you the skeleton; alignment, spacing, and frame options turn it into a polished, adaptive screen.</p>
  <h2>Alignment along the other axis</h2>
  <pre class="code-block">VStack(alignment: .leading, spacing: 4) {
    Text(&quot;Title&quot;).font(.headline)
    Text(&quot;Subtitle&quot;).font(.subheadline)
}
// every child left-aligned on the vertical axis</pre>
  <p><span class="ic">HStack(alignment: .top)</span> adds <span class="ic">.top</span>, <span class="ic">.center</span>, and <span class="ic">.bottom</span>; <span class="ic">VStack(alignment:)</span> takes <span class="ic">.leading</span>, <span class="ic">.center</span>, and <span class="ic">.trailing</span>.</p>
  <h2>Frames give room to breathe</h2>
  <pre class="code-block">Text(&quot;Reading List&quot;)
    .font(.title)
    .frame(maxWidth: .infinity, maxHeight: 44)

Rectangle()
    .fill(.indigo.gradient)
    .frame(width: 120, height: 120)
    .clipShape(RoundedRectangle(cornerRadius: 16))</pre>
  <p>Frames can be fixed (<span class="ic">width:</span>), flexible (maxWidth), or both — combine with an <span class="ic">alignment:</span> to position content inside the reserved area.</p>
  <div class="callout callout-tip">
    <strong>fixedSize wins when it counts</strong>
    <p>When a flexible container compresses your text, <span class="ic">.fixedSize()</span> lets a view ignore available space and use its ideal size — great for labels inside wide stacks.</p>
  </div>
  <h2>Overlay and background views</h2>
  <pre class="code-block">ZStack {
    Rectangle().fill(.indigo.gradient)
    Text(&quot;42% read&quot;).font(.headline).foregroundStyle(.white)
}

// …or declaratively:
Rectangle()
    .fill(.indigo.gradient)
    .overlay {
        Text(&quot;42% read&quot;).font(.headline).foregroundStyle(.white)
    }</pre>
  <p><span class="ic">overlay</span> draws on top of a view; <span class="ic">background(_:alignment:)</span> draws behind it. Prefer them over ZStack when a modifier says it more clearly.</p>
  <h2>Layout priority</h2>
  <pre class="code-block">HStack {
    Text(&quot;A long title that may need to wrap&quot;)
        .layoutPriority(1)
    Text(&quot;∞&quot;)
}</pre>
  <p><span class="ic">layoutPriority(_:)</span> tells SwiftUI which child keeps its space when space is tight — higher number wins.</p>
  </div>
</body>
</html>
$html$
),
(
  '03C00000-0000-4000-8000-000000000416',
  '03C00000-0000-4000-8000-000000000316',
  1,
  'State Management with @State & @Binding',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>State Management with @State & @Binding</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>State Management with @State &amp; @Binding</h1>
  <p>SwiftUI rerenders the <span class="ic">body</span> whenever the data it depends on changes. The wrapper you choose decides <em>where</em> that data lives.</p>
  <h2>@State — the source of truth</h2>
  <pre class="code-block">struct AddBookView: View {
    @State private var title = &quot;&quot;

    var body: some View {
        TextField(&quot;Book title&quot;, text: $title)
            .textFieldStyle(.roundedBorder)
    }
}</pre>
  <p><span class="ic">@State</span> owns a value displayed on screen. Typing updates <span class="ic">title</span>, and SwiftUI re-renders the field automatically — no &ldquo;update the label&rdquo; calls.</p>
  <div class="callout">
    <strong>Private by design</strong>
    <p>Mark <span class="ic">@State</span> as <span class="ic">private</span>. It belongs to this view; other views must not reach in.</p>
  </div>
  <h2>@Binding — a two-way connection</h2>
  <p>When two views must share one value, the owner keeps <span class="ic">@State</span> and the editor receives a <strong>binding</strong>:</p>
  <pre class="code-block">struct RatingEditor: View {
    @Binding var rating: Double

    var body: some View {
        Slider(value: $rating, in: 0...5, step: 0.5)
    }
}

struct BookDetailView: View {
    @State private var rating = 4.5

    var body: some View {
        RatingEditor(rating: $rating)
    }
}</pre>
  <p>The <span class="ic">$</span> prefix projects the value into a binding — the child can read it and write it back, and both views stay in sync.</p>
  <h2>Driving interfaces from state</h2>
  <pre class="code-block">@State private var pagesRead = 140

VStack {
    Text(&quot;\(pagesRead) pages logged&quot;)
    Button(&quot;Log another page&quot;) { pagesRead += 1 }
}</pre>
  <p>UI is a pure function of state: change state, and the interface adapts. This single idea replaces most of the manual view-updating you would do in UIKit.</p>
  <div class="callout callout-tip">
    <strong>Raise state up</strong>
    <p>If two sibling views need the same value, hoist it to their shared parent and pass bindings down. Each value then has exactly one owner.</p>
  </div>
  </div>
</body>
</html>
$html$
),
(
  '03C00000-0000-4000-8000-000000000417',
  '03C00000-0000-4000-8000-000000000317',
  1,
  'Observable Models & Environment',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Observable Models & Environment</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Observable Models &amp; Environment</h1>
  <p>When model data must be shared app-wide, declare a class with the <span class="ic">@Observable</span> macro. SwiftUI then tracks which properties a view actually reads and re-renders only when those change.</p>
  <h2>An observable library</h2>
  <pre class="code-block">import Observation

@Observable
final class Library {
    var books: [Book] = []
    var currentTitle: String = &quot;&quot;

    func add(_ book: Book) {
        books.append(book)
    }
}</pre>
  <p>Own the instance with <span class="ic">@State</span> at the top of your hierarchy:</p>
  <pre class="code-block">struct LibraryView: View {
    @State private var library = Library()

    var body: some View {
        List(library.books) { book in
            BookRow(book: book)
        }
        .toolbar {
            Button(&quot;Add&quot;) {
                library.add(Book(title: &quot;Thinking in SwiftUI&quot;))
            }
        }
    }
}</pre>
  <h2>Passing the model down</h2>
  <p>Create it once, then offer it to descendants with the environment:</p>
  <pre class="code-block">LibraryView()
    .environment(library)</pre>
  <pre class="code-block">struct AddBookView: View {
    @Environment(Library.self) private var library

    var body: some View {
        TextField(&quot;Title&quot;, text: $library.currentTitle)
    }
}</pre>
  <p><span class="ic">@Environment(Library.self)</span> reads the instance without threading it through every initializer — clean for deep view trees.</p>
  <h2>Ownership rules of thumb</h2>
  <table>
    <tr><th>Wrapper</th><th>Owns the value</th><th>Typical use</th></tr>
    <tr><td>@State</td><td>This view</td><td>Local UI values and model roots</td></tr>
    <tr><td>@Binding</td><td>The parent</td><td>Passing read/write access down</td></tr>
    <tr><td>@Observable + @Environment</td><td>App or container</td><td>Shared model data</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>One source of truth</strong>
    <p>If the same value is stored twice, they will drift apart. Decide where each piece of data lives, and give every other view a binding or environment read.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03C00000-0000-4000-8000-000000000419',
  '03C00000-0000-4000-8000-000000000319',
  1,
  'Lists & ForEach',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Lists & ForEach</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Lists &amp; ForEach</h1>
  <p><span class="ic">List</span> is SwiftUI&rsquo;s scrolling collection: styling, selection, and deletions come built in.</p>
  <h2>The simplest book shelf</h2>
  <pre class="code-block">struct Book: Identifiable {
    let id = UUID()
    var title: String
    var author: String
}

struct LibraryView: View {
    @State private var books: [Book] = []

    var body: some View {
        List(books) { book in
            BookRow(book: book)
        }
    }
}</pre>
  <p>Conforming to <span class="ic">Identifiable</span> gives every row a stable <span class="ic">id</span>, which <span class="ic">List</span> uses to diff and animate updates.</p>
  <div class="callout callout-tip">
    <strong>Value types without an id</strong>
    <p>For plain values like <span class="ic">[String]</span>, pass an explicit identity: <span class="ic">List(cities, id: \.self)</span>. Identifiable is nicer, but <span class="ic">id:</span> covers simple cases.</p>
  </div>
  <h2>Sections and ForEach</h2>
  <pre class="code-block">List {
    Section(&quot;Reading&quot;) {
        ForEach(readingBooks) { book in
            BookRow(book: book)
        }
    }
    Section(&quot;Finished&quot;) {
        ForEach(finishedBooks) { book in
            BookRow(book: book)
        }
    }
}</pre>
  <p>Combine <span class="ic">Section</span> headers with <span class="ic">ForEach</span> when rows need editing gestures or headers.</p>
  <h2>Swipe actions</h2>
  <pre class="code-block">List(books) { $book in
    BookRow(book: book)
        .swipeActions(edge: .leading) {
            Button(&quot;Mark Read&quot;) { book.markFinished() }
                .tint(.green)
        }
        .swipeActions {
            Button(role: .destructive) { book.remove() } label: {
                Label(&quot;Delete&quot;, systemImage: &quot;trash&quot;)
            }
        }
}</pre>
  <p>The <span class="ic">$book</span> binding form even lets a row mutate its own model in place.</p>
  <h2>Delete and reorder</h2>
  <pre class="code-block">List {
    ForEach(books) { book in
        BookRow(book: book)
    }
    .onDelete(perform: removeRows)
    .onMove(perform: moveRows)
}</pre>
  <p><span class="ic">onDelete</span> and <span class="ic">onMove</span> wire the standard swipe-to-delete and drag-to-reorder gestures to functions on your array.</p>
  </div>
</body>
</html>
$html$
),
(
  '03C00000-0000-4000-8000-000000000420',
  '03C00000-0000-4000-8000-000000000320',
  1,
  'NavigationStack & Navigation',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NavigationStack & Navigation</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>NavigationStack &amp; Navigation</h1>
  <p>Move a user from list to detail with <span class="ic">NavigationStack</span> — SwiftUI gives you the back button, title, and swipe-back gesture for free.</p>
  <h2>Wrap the root</h2>
  <pre class="code-block">struct LibraryRoot: View {
    @State private var library = Library()

    var body: some View {
        NavigationStack {
            List(library.books) { book in
                BookRow(book: book)
            }
            .navigationTitle(&quot;Reading List&quot;)
        }
    }
}</pre>
  <p><span class="ic">navigationTitle</span> sets the large title; the stack provides the navigation bar and manages pushed screens.</p>
  <h2>NavigationLink and destinations</h2>
  <pre class="code-block">List(library.books) { book in
    NavigationLink(value: book) {
        BookRow(book: book)
    }
}
.navigationDestination(for: Book.self) { book in
    BookDetailView(book: book)
}</pre>
  <p>Link + <span class="ic">navigationDestination</span> pairs a row with its detail screen. The link only says &ldquo;navigate with this value&rdquo;; the destination closure decides what to build.</p>
  <h2>Programmatic navigation</h2>
  <p>When a screen must drive navigation itself, bind the stack to a path:</p>
  <pre class="code-block">@State private var path: [Book] = []

NavigationStack(path: $path) {
    List(library.books) { book in
        NavigationLink(value: book) { BookRow(book: book) }
    }
    .navigationDestination(for: Book.self) { book in
        BookDetailView(book: book)
    }
    .toolbar {
        Button(&quot;Top 5&quot;) {
            path = Array(library.books.prefix(5))
        }
    }
}</pre>
  <p>The path is plain state — push by appending, pop by removing. Deep links and back-to-home buttons become trivial.</p>
  <h2>Toolbars</h2>
  <pre class="code-block">.toolbar {
    ToolbarItem(placement: .topBarTrailing) {
        Button { showAddSheet = true } label: {
            Image(systemName: &quot;plus&quot;)
        }
    }
}
.sheet(isPresented: $showAddSheet) {
    AddBookView()
}</pre>
  <p>Buttons live in the <span class="ic">toolbar</span>; <span class="ic">sheet</span> presents a modal panel, dragged down to dismiss.</p>
  <div class="callout callout-tip">
    <strong>Push, don&rsquo;t pile on</strong>
    <p>Use stacks for parent-child detail flows, sheets for one-off actions like &ldquo;Add Book&rdquo;, and tabs to separate top-level sections.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03C00000-0000-4000-8000-000000000422',
  '03C00000-0000-4000-8000-000000000322',
  1,
  'Forms & Data Entry',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Forms & Data Entry</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Forms &amp; Data Entry</h1>
  <p><span class="ic">Form</span> gives input-heavy screens the native iOS grouped look with almost no styling work.</p>
  <h2>An add-book form</h2>
  <pre class="code-block">struct AddBookView: View {
    @State private var title = &quot;&quot;
    @State private var author = &quot;&quot;
    @State private var rating = 4.0
    @State private var alreadyRead = false

    var body: some View {
        Form {
            Section(&quot;Book&quot;) {
                TextField(&quot;Title&quot;, text: $title)
                TextField(&quot;Author&quot;, text: $author)
            }
            Section(&quot;Rating&quot;) {
                Stepper(value: $rating, in: 0.5...5, step: 0.5) {
                    Text(&quot;\(rating, specifier: &quot;%.1f&quot;) stars&quot;)
                }
                Slider(value: $rating, in: 0...5, step: 0.5)
            }
            Section {
                Toggle(&quot;Already read&quot;, isOn: $alreadyRead)
                Button(&quot;Save&quot;) { save() }
                    .disabled(title.trimmingCharacters(in: .whitespaces).isEmpty)
            }
        }
        .navigationTitle(&quot;Add Book&quot;)
    }
}</pre>
  <p>Every control binds to state with <span class="ic">$</span>; <span class="ic">disabled</span> prevents saving an empty title.</p>
  <h2>More controls</h2>
  <table>
    <tr><th>Control</th><th>Binds</th><th>Ideal for</th></tr>
    <tr><td>TextField</td><td>String $</td><td>Free-form text</td></tr>
    <tr><td>SecureField</td><td>String $</td><td>Passwords</td></tr>
    <tr><td>Toggle</td><td>Bool $</td><td>On/off settings</td></tr>
    <tr><td>Picker</td><td>Selection</td><td>One of many options</td></tr>
    <tr><td>DatePicker</td><td>Date $</td><td>Dates and times</td></tr>
    <tr><td>Stepper / Slider</td><td>Numeric $</td><td>Numbers with bounds</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Section titles are free</strong>
    <p>Sections group related input and add captions. Reorder controls by moving rows — Forms are just lists of views.</p>
  </div>
  <h2>Keyboard focus and dismissal</h2>
  <pre class="code-block">@FocusState private var titleFocused: Bool

TextField(&quot;Title&quot;, text: $title)
    .focused($titleFocused)

.toolbar {
    ToolbarItemGroup(placement: .keyboard) {
        Button(&quot;Done&quot;) { titleFocused = false }
    }
}</pre>
  <p><span class="ic">@FocusState</span> tracks which field has the keyboard; the keyboard toolbar adds a &ldquo;Done&rdquo; button to dismiss it.</p>
  </div>
</body>
</html>
$html$
),
(
  '03C00000-0000-4000-8000-000000000423',
  '03C00000-0000-4000-8000-000000000323',
  1,
  'Animations & Transitions',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Animations & Transitions</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Animations &amp; Transitions</h1>
  <p>Animation is the natural consequence of changing state: wrap state changes in <span class="ic">withAnimation</span>, and SwiftUI interpolates between the old and new interface.</p>
  <h2>Animate a state change</h2>
  <pre class="code-block">@State private var isExpanded = false

Button {
    withAnimation(.spring(duration: 0.4)) {
        isExpanded.toggle()
    }
} label: {
    Text(isExpanded ? &quot;Collapse&quot; : &quot;Details&quot;)
}

if isExpanded {
    Text(&quot;Only 120 pages to the finish line!&quot;)
        .padding()
        .transition(.opacity.combined(with: .move(edge: .top)))
}</pre>
  <p>The <span class="ic">.transition</span> describes how a view appears and disappears; <span class="ic">withAnimation</span> supplies the temperature and curve for the whole change.</p>
  <div class="callout callout-tip">
    <strong>Spring for UI feel</strong>
    <p><span class="ic">.spring</span> gives a natural, physical motion that suits buttons and reveals. Use <span class="ic">.easeInOut</span> for subtle fades and lists.</p>
  </div>
  <h2>Per-view animation</h2>
  <pre class="code-block">Circle()
    .fill(isFavorite ? .yellow : .gray)
    .frame(width: 44, height: 44)
    .scaleEffect(isFavorite ? 1.15 : 1.0)
    .animation(.spring(response: 0.3, dampingFraction: 0.6),
               value: isFavorite)</pre>
  <p><span class="ic">.animation(_:value:)</span> animates only when that specific value changes — precise, and it avoids animating unrelated updates.</p>
  <h2>Axis-aligned moves with matchedGeometryEffect</h2>
  <p>The most magical-feeling effect is moving a view between layouts:</p>
  <pre class="code-block">@Namespace private var cover

ZStack {
    if showLarge {
        coverArt.matchedGeometryEffect(id: &quot;cover&quot;, in: cover)
    }
}
// the same id in another view flies between the two layouts</pre>
  <p><span class="ic">matchedGeometryEffect</span> shares a <span class="ic">@Namespace</span> so SwiftUI animates one view smoothly to another position and size.</p>
  <div class="callout callout-tip">
    <strong>Animation is not decoration</strong>
    <p>Good animation explains <em>what changed</em> and where the user should look next. Fade a new book in when it is added to the shelf; that tiny detail reads as polish.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03C00000-0000-4000-8000-000000000425',
  '03C00000-0000-4000-8000-000000000325',
  1,
  'Networking & Combine Fundamentals',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Networking & Combine Fundamentals</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Networking &amp; Combine Fundamentals</h1>
  <p>Real apps load data over the network. Your Reading List can enrich saved books — cover images, ratings, even syncing — via a REST API.</p>
  <h2>Model the response with Codable</h2>
  <pre class="code-block">struct BookSearchResult: Codable {
    let title: String
    let authors: [String]
    let pageCount: Int?
}

struct SearchResponse: Codable {
    let items: [BookSearchResult]
}</pre>
  <p><span class="ic">Codable</span> turns JSON into strongly typed Swift structs. Optional fields map to optionals — the <span class="ic">pageCount</span> above may simply be missing.</p>
  <h2>Fetch with URLSession</h2>
  <pre class="code-block">final class BookAPIClient {
    func search(_ query: String) async throws -&gt; SearchResponse {
        var components = URLComponents(string: &quot;https://api.example.com/books&quot;)!
        components.queryItems = [
            URLQueryItem(name: &quot;q&quot;, value: query)
        ]

        let (data, response) = try await URLSession.shared.data(from: components.url!)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw APIError.badResponse
        }
        return try JSONDecoder().decode(SearchResponse.self, from: data)
    }
}</pre>
  <p><span class="ic">async/await</span> reads like synchronous code; the compiler handles the concurrency. Always check the HTTP status and wrap decoding in the throwing path.</p>
  <h2>Call it from a view</h2>
  <pre class="code-block">@State private var results: [BookSearchResult] = []
@State private var isLoading = false

func runSearch() async {
    isLoading = true
    defer { isLoading = false }
    do {
        let response = try await client.search(query)
        results = response.items
    } catch {
        lastError = error
    }
}</pre>
  <p><span class="ic">URLSession</span> never blocks the main thread; the <span class="ic">.task</span> modifier in SwiftUI runs it when the view appears and cancels with it.</p>
  <div class="callout callout-tip">
    <strong>Load in a task</strong>
    <p><span class="ic">.task { await runSearch() }</span> starts the fetch with the view and automatically cancels it when the view goes away — no dangling responses.</p>
  </div>
  <h2>Combine — publishers at a glance</h2>
  <p>Combine models <em>streams of values over time</em>. A search field publisher, throttled and mapped, can drive the same call reactively:</p>
  <pre class="code-block">$query
    .debounce(for: .milliseconds(400), scheduler: RunLoop.main)
    .sink { text in
        Task { results = try await client.search(text).items }
    }</pre>
  <div class="callout callout-info">
    <strong>Choose your tool</strong>
    <p>For one-shot requests, <span class="ic">async/await</span> is clearer. Use Combine when you want debouncing, reacting to many events, or composing streams. Both integrate cleanly with SwiftUI.</p>
  </div>
  </div>
</body>
</html>
$html$
),
(
  '03C00000-0000-4000-8000-000000000426',
  '03C00000-0000-4000-8000-000000000326',
  1,
  'SwiftData: Persistent Local Storage',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SwiftData: Persistent Local Storage</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>SwiftData: Persistent Local Storage</h1>
  <p>Books added to your Reading List must survive relaunches. <strong>SwiftData</strong> is Apple&rsquo;s object persistence framework — your models become rows in a local database automatically.</p>
  <h2>Mark a model</h2>
  <pre class="code-block">import SwiftData

@Model
final class Book {
    var title: String
    var author: String
    var pageCount: Int
    var progressPages: Int
    var addedAt: Date

    init(title: String, author: String, pageCount: Int) {
        self.title = title
        self.author = author
        self.pageCount = pageCount
        self.progressPages = 0
        self.addedAt = .now
    }
}</pre>
  <p><span class="ic">@Model</span> marks a stored class; stored properties become columns. SwiftData manages identity, relations, and migration scaffolding for you.</p>
  <h2>Attach the container</h2>
  <pre class="code-block">@main
struct ReadingListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}</pre>
  <p><span class="ic">.modelContainer(for:)</span> sets up storage and injects the <span class="ic">ModelContext</span> into the environment for the whole app.</p>
  <h2>Read with @Query, write with the context</h2>
  <pre class="code-block">struct LibraryView: View {
    @Query(sort: \Book.addedAt, order: .reverse)
    private var books: [Book]

    @Environment(\.modelContext) private var context

    var body: some View {
        List(books) { book in
            BookRow(book: book)
        }
        .toolbar {
            Button(&quot;Add&quot;) { addDraft() }
        }
    }

    func addDraft() {
        let book = Book(title: &quot;Draft&quot;, author: &quot;TBD&quot;, pageCount: 0)
        context.insert(book)
        try? context.save()
    }
}</pre>
  <div class="callout callout-tip">
    <strong>Autosaves keep things simple</strong>
    <p>SwiftData autosaves in the background, but an explicit <span class="ic">try context.save()</span> surfaces disk failures while you are still developing.</p>
  </div>
  <h2>Filter with predicates</h2>
  <pre class="code-block">@Query(filter: #Predicate&lt;Book&gt; { $0.progressPages &gt; 0 })
private var started: [Book]</pre>
  <p><span class="ic">#Predicate</span> filters rows in the database layer; combine it with a sort for paginated, searchable shelves.</p>
  </div>
</body>
</html>
$html$
),
(
  '03C00000-0000-4000-8000-000000000427',
  '03C00000-0000-4000-8000-000000000327',
  1,
  'App Lifecycle & Deployment',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>App Lifecycle & Deployment</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>App Lifecycle &amp; Deployment</h1>
  <p>Your Reading List app is nearly complete. The last mile is making it behave correctly across app states and shipping it to real devices.</p>
  <h2>Lifecycle states</h2>
  <p>iOS apps move between <strong>active</strong>, <strong>inactive</strong>, and <strong>background</strong> as the user switches apps. Watch <span class="ic">scenePhase</span> to react:</p>
  <pre class="code-block">@Environment(\.scenePhase) private var scenePhase

var body: some Scene {
    WindowGroup {
        ContentView()
    }
    .onChange(of: scenePhase) { _, newPhase in
        switch newPhase {
        case .active:
            print(&quot;Resumed&quot;)
        case .inactive:
            print(&quot;Interrupted&quot;)
        case .background:
            print(&quot;In background — save state&quot;)
        @unknown default:
            break
        }
    }
}</pre>
  <p>Persist anything important before <span class="ic">background</span> — SwiftData autosaves, but finishing UI state keeps things tidy.</p>
  <h2>Configuration checklist</h2>
  <table>
    <tr><th>Concern</th><th>Where</th></tr>
    <tr><td>Launch screen</td><td>Launch screen asset catalog</td></tr>
    <tr><td>Display name</td><td>Info.plist</td></tr>
    <tr><td>Privacy strings</td><td>Usage descriptions in Info.plist</td></tr>
    <tr><td>App icon</td><td>Asset catalog, all required sizes</td></tr>
  </table>
  <h2>Signing and TestFlight</h2>
  <ol>
    <li>Set your signing team under <strong>Signing &amp; Capabilities</strong>.</li>
    <li>Bump the <strong>build number</strong> for every upload.</li>
    <li>Archive in Xcode and upload with the Organizer.</li>
    <li>Test on real devices via <strong>TestFlight</strong> before submission.</li>
  </ol>
  <p>TestFlight builds are actual installable packages for beta testers — the closest thing to production you can get without releasing.</p>
  <h2>Submission</h2>
  <p>In App Store Connect, add the build, fill in app information, choose pricing, and submit for review. Expect a review cycle of hours to a few days, and keep crash logs and feedback channels close after launch.</p>
  <div class="callout callout-tip">
    <strong>Ship small and often</strong>
    <p>Fast iteration beats a &ldquo;perfect&rdquo; first release. As your Reading List evolves, keep older installs working with versioned models and SwiftData migrations.</p>
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
  ('03C00000-0000-4000-8000-000000000501', '03C00000-0000-4000-8000-000000000303',
   'Which keyword declares a constant that cannot be reassigned?',
   'let creates an immutable binding; var allows later reassignment.', 1),
  ('03C00000-0000-4000-8000-000000000502', '03C00000-0000-4000-8000-000000000303',
   'What does 7 / 2 evaluate to when both operands are Int?',
   'Integer division truncates toward zero, so 7 / 2 is 3.', 2),
  ('03C00000-0000-4000-8000-000000000503', '03C00000-0000-4000-8000-000000000303',
   'Which collection preserves insertion order and allows duplicates?',
   'Array keeps order; Set and Dictionary do not preserve duplicates.', 3),
  ('03C00000-0000-4000-8000-000000000504', '03C00000-0000-4000-8000-000000000306',
   'Which syntax unwraps an optional and exits early when it is nil?',
   'guard let binds the value and requires an else branch that exits the scope.', 1),
  ('03C00000-0000-4000-8000-000000000505', '03C00000-0000-4000-8000-000000000306',
   'What does assigning one struct to another do?',
   'Structs use value semantics, so the assignment copies the whole value.', 2),
  ('03C00000-0000-4000-8000-000000000506', '03C00000-0000-4000-8000-000000000306',
   'Where does a struct define custom initialization logic?',
   'The init method runs when you create an instance.', 3),
  ('03C00000-0000-4000-8000-000000000507', '03C00000-0000-4000-8000-000000000309',
   'What does the @main attribute mark in a SwiftUI app?',
   'It marks the App entry point that SwiftUI launches.', 1),
  ('03C00000-0000-4000-8000-000000000508', '03C00000-0000-4000-8000-000000000309',
   'What must every View type provide?',
   'A computed body property of type some View that describes the interface.', 2),
  ('03C00000-0000-4000-8000-000000000509', '03C00000-0000-4000-8000-000000000309',
   'Which container stacks its children vertically?',
   'VStack arranges views top to bottom.', 3),
  ('03C00000-0000-4000-8000-000000000510', '03C00000-0000-4000-8000-000000000312',
   'Why does modifier order matter in SwiftUI?',
   'Each modifier wraps the result of the previous one, so order changes the outcome.', 1),
  ('03C00000-0000-4000-8000-000000000511', '03C00000-0000-4000-8000-000000000312',
   'Which modifier gives a view an explicit width and height?',
   'The frame modifier fixes the view to the given dimensions.', 2),
  ('03C00000-0000-4000-8000-000000000512', '03C00000-0000-4000-8000-000000000312',
   'How do you change the text color of a view?',
   'foregroundStyle (or foregroundColor) tints the foreground.', 3),
  ('03C00000-0000-4000-8000-000000000513', '03C00000-0000-4000-8000-000000000315',
   'Which container draws children on top of each other?',
   'ZStack overlays views along the depth axis.', 1),
  ('03C00000-0000-4000-8000-000000000514', '03C00000-0000-4000-8000-000000000315',
   'What does Spacer do inside a stack?',
   'It expands to absorb leftover space and push siblings apart.', 2),
  ('03C00000-0000-4000-8000-000000000515', '03C00000-0000-4000-8000-000000000315',
   'Which modifier lets a view use its ideal size?',
   'fixedSize makes the view ignore available space and hug its content.', 3),
  ('03C00000-0000-4000-8000-000000000516', '03C00000-0000-4000-8000-000000000318',
   'Where should a @State property be declared?',
   'In the view that owns the value, ideally marked private.', 1),
  ('03C00000-0000-4000-8000-000000000517', '03C00000-0000-4000-8000-000000000318',
   'What does the $ prefix on a @State value produce?',
   'A two-way binding that both reads and writes the stored value.', 2),
  ('03C00000-0000-4000-8000-000000000518', '03C00000-0000-4000-8000-000000000318',
   'Why mark model classes with @Observable?',
   'So SwiftUI tracks property reads and re-renders only affected views.', 3),
  ('03C00000-0000-4000-8000-000000000519', '03C00000-0000-4000-8000-000000000321',
   'What does Identifiable give a List row?',
   'A stable identity that lets the List diff and animate changes.', 1),
  ('03C00000-0000-4000-8000-000000000520', '03C00000-0000-4000-8000-000000000321',
   'Which modifier adds swipe-to-delete inside a List?',
   'onDelete wires the standard delete gesture to a function.', 2),
  ('03C00000-0000-4000-8000-000000000521', '03C00000-0000-4000-8000-000000000321',
   'What does NavigationStack(path:) store when you bind a value?',
   'Navigational data it uses to push and pop programmatically.', 3),
  ('03C00000-0000-4000-8000-000000000522', '03C00000-0000-4000-8000-000000000324',
   'How do you animate a state change in SwiftUI?',
   'Wrap the change in withAnimation, or attach .animation to a view.', 1),
  ('03C00000-0000-4000-8000-000000000523', '03C00000-0000-4000-8000-000000000324',
   'Which container is best for a grouped settings screen?',
   'Form provides the iOS grouped look and layout for input controls.', 2),
  ('03C00000-0000-4000-8000-000000000524', '03C00000-0000-4000-8000-000000000324',
   'Which control binds user-typed text to a String?',
   'TextField connects directly to a string binding.', 3),
  ('03C00000-0000-4000-8000-000000000525', '03C00000-0000-4000-8000-000000000328',
   'Which type best models a JSON payload in Swift?',
   'A Codable struct maps the payload to typed properties.', 1),
  ('03C00000-0000-4000-8000-000000000526', '03C00000-0000-4000-8000-000000000328',
   'How do you store a SwiftData model class?',
   'Mark it with @Model and insert it into the ModelContext.', 2),
  ('03C00000-0000-4000-8000-000000000527', '03C00000-0000-4000-8000-000000000328',
   'What does @Query provide inside a view?',
   'Persisted results that stay in sync with the store.', 3),
  ('03C00000-0000-4000-8000-000000000528', '03C00000-0000-4000-8000-000000000328',
   'Which object runs an asynchronous network request?',
   'URLSession provides async data(from:) requests.', 4),
  ('03C00000-0000-4000-8000-000000000529', '03C00000-0000-4000-8000-000000000328',
   'What does the scenePhase environment report?',
   'Whether the app is active, inactive, or in the background.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): let
  ('03C00000-0000-4000-8000-000000001001', '03C00000-0000-4000-8000-000000000501', 'let', TRUE,  1),
  ('03C00000-0000-4000-8000-000000001002', '03C00000-0000-4000-8000-000000000501', 'var', FALSE, 2),
  ('03C00000-0000-4000-8000-000000001003', '03C00000-0000-4000-8000-000000000501', 'const', FALSE, 3),
  ('03C00000-0000-4000-8000-000000001004', '03C00000-0000-4000-8000-000000000501', 'static', FALSE, 4),
  -- Q1 (501)q2: integer division
  ('03C00000-0000-4000-8000-000000001005', '03C00000-0000-4000-8000-000000000502', '3.5', FALSE, 1),
  ('03C00000-0000-4000-8000-000000001006', '03C00000-0000-4000-8000-000000000502', '3', TRUE,  2),
  ('03C00000-0000-4000-8000-000000001007', '03C00000-0000-4000-8000-000000000502', '2', FALSE, 3),
  ('03C00000-0000-4000-8000-000000001008', '03C00000-0000-4000-8000-000000000502', '14', FALSE, 4),
  -- Q1 (501)q3: array order
  ('03C00000-0000-4000-8000-000000001009', '03C00000-0000-4000-8000-000000000503', 'Set', FALSE, 1),
  ('03C00000-0000-4000-8000-000000001010', '03C00000-0000-4000-8000-000000000503', 'Dictionary', FALSE, 2),
  ('03C00000-0000-4000-8000-000000001011', '03C00000-0000-4000-8000-000000000503', 'Array', TRUE,  3),
  ('03C00000-0000-4000-8000-000000001012', '03C00000-0000-4000-8000-000000000503', 'Tuple', FALSE, 4),
  -- Q2 (504): guard let
  ('03C00000-0000-4000-8000-000000001013', '03C00000-0000-4000-8000-000000000504', 'if let', FALSE, 1),
  ('03C00000-0000-4000-8000-000000001014', '03C00000-0000-4000-8000-000000000504', 'guard let', TRUE,  2),
  ('03C00000-0000-4000-8000-000000001015', '03C00000-0000-4000-8000-000000000504', '! force unwrap', FALSE, 3),
  ('03C00000-0000-4000-8000-000000001016', '03C00000-0000-4000-8000-000000000504', '?? nil coalescing', FALSE, 4),
  -- Q2 (504)q2: value semantics
  ('03C00000-0000-4000-8000-000000001017', '03C00000-0000-4000-8000-000000000505', 'It copies the value', TRUE,  1),
  ('03C00000-0000-4000-8000-000000001018', '03C00000-0000-4000-8000-000000000505', 'It shares one instance', FALSE, 2),
  ('03C00000-0000-4000-8000-000000001019', '03C00000-0000-4000-8000-000000000505', 'It converts to a class', FALSE, 3),
  ('03C00000-0000-4000-8000-000000001020', '03C00000-0000-4000-8000-000000000505', 'It deletes the original', FALSE, 4),
  -- Q2 (504)q3: init
  ('03C00000-0000-4000-8000-000000001021', '03C00000-0000-4000-8000-000000000506', 'setup', FALSE, 1),
  ('03C00000-0000-4000-8000-000000001022', '03C00000-0000-4000-8000-000000000506', 'create', FALSE, 2),
  ('03C00000-0000-4000-8000-000000001023', '03C00000-0000-4000-8000-000000000506', 'init', TRUE,  3),
  ('03C00000-0000-4000-8000-000000001024', '03C00000-0000-4000-8000-000000000506', 'new', FALSE, 4),
  -- Q3 (507): @main
  ('03C00000-0000-4000-8000-000000001025', '03C00000-0000-4000-8000-000000000507', 'The App entry point', TRUE,  1),
  ('03C00000-0000-4000-8000-000000001026', '03C00000-0000-4000-8000-000000000507', 'The first visible view', FALSE, 2),
  ('03C00000-0000-4000-8000-000000001027', '03C00000-0000-4000-8000-000000000507', 'The app icon', FALSE, 3),
  ('03C00000-0000-4000-8000-000000001028', '03C00000-0000-4000-8000-000000000507', 'A data model', FALSE, 4),
  -- Q3 (507)q2: View body
  ('03C00000-0000-4000-8000-000000001029', '03C00000-0000-4000-8000-000000000508', 'A stored array of subviews', FALSE, 1),
  ('03C00000-0000-4000-8000-000000001030', '03C00000-0000-4000-8000-000000000508', 'A computed body of type some View', TRUE,  2),
  ('03C00000-0000-4000-8000-000000001031', '03C00000-0000-4000-8000-000000000508', 'An init method', FALSE, 3),
  ('03C00000-0000-4000-8000-000000001032', '03C00000-0000-4000-8000-000000000508', 'A @main attribute', FALSE, 4),
  -- Q3 (507)q3: vertical stack
  ('03C00000-0000-4000-8000-000000001033', '03C00000-0000-4000-8000-000000000509', 'HStack', FALSE, 1),
  ('03C00000-0000-4000-8000-000000001034', '03C00000-0000-4000-8000-000000000509', 'ZStack', FALSE, 2),
  ('03C00000-0000-4000-8000-000000001035', '03C00000-0000-4000-8000-000000000509', 'Grid', FALSE, 3),
  ('03C00000-0000-4000-8000-000000001036', '03C00000-0000-4000-8000-000000000509', 'VStack', TRUE,  4),
  -- Q4 (510): modifier order
  ('03C00000-0000-4000-8000-000000001037', '03C00000-0000-4000-8000-000000000510', 'Every modifier wraps the previous result', TRUE,  1),
  ('03C00000-0000-4000-8000-000000001038', '03C00000-0000-4000-8000-000000000510', 'The order never matters', FALSE, 2),
  ('03C00000-0000-4000-8000-000000001039', '03C00000-0000-4000-8000-000000000510', 'Only text is affected', FALSE, 3),
  ('03C00000-0000-4000-8000-000000001040', '03C00000-0000-4000-8000-000000000510', 'Modifiers are applied alphabetically', FALSE, 4),
  -- Q4 (510)q2: frame
  ('03C00000-0000-4000-8000-000000001041', '03C00000-0000-4000-8000-000000000511', 'padding', FALSE, 1),
  ('03C00000-0000-4000-8000-000000001042', '03C00000-0000-4000-8000-000000000511', 'frame', TRUE,  2),
  ('03C00000-0000-4000-8000-000000001043', '03C00000-0000-4000-8000-000000000511', 'font', FALSE, 3),
  ('03C00000-0000-4000-8000-000000001044', '03C00000-0000-4000-8000-000000000511', 'opacity', FALSE, 4),
  -- Q4 (510)q3: text color
  ('03C00000-0000-4000-8000-000000001045', '03C00000-0000-4000-8000-000000000512', 'fontWeight', FALSE, 1),
  ('03C00000-0000-4000-8000-000000001046', '03C00000-0000-4000-8000-000000000512', 'textColor', FALSE, 2),
  ('03C00000-0000-4000-8000-000000001047', '03C00000-0000-4000-8000-000000000512', 'foregroundStyle', TRUE,  3),
  ('03C00000-0000-4000-8000-000000001048', '03C00000-0000-4000-8000-000000000512', 'background', FALSE, 4),
  -- Q5 (513): ZStack
  ('03C00000-0000-4000-8000-000000001049', '03C00000-0000-4000-8000-000000000513', 'VStack', FALSE, 1),
  ('03C00000-0000-4000-8000-000000001050', '03C00000-0000-4000-8000-000000000513', 'HStack', FALSE, 2),
  ('03C00000-0000-4000-8000-000000001051', '03C00000-0000-4000-8000-000000000513', 'ZStack', TRUE,  3),
  ('03C00000-0000-4000-8000-000000001052', '03C00000-0000-4000-8000-000000000513', 'Spacer', FALSE, 4),
  -- Q5 (513)q2: Spacer
  ('03C00000-0000-4000-8000-000000001053', '03C00000-0000-4000-8000-000000000514', 'Pushes views apart', TRUE,  1),
  ('03C00000-0000-4000-8000-000000001054', '03C00000-0000-4000-8000-000000000514', 'Adds padding', FALSE, 2),
  ('03C00000-0000-4000-8000-000000001055', '03C00000-0000-4000-8000-000000000514', 'Centers content', FALSE, 3),
  ('03C00000-0000-4000-8000-000000001056', '03C00000-0000-4000-8000-000000000514', 'Crops content', FALSE, 4),
  -- Q5 (513)q3: fixedSize
  ('03C00000-0000-4000-8000-000000001057', '03C00000-0000-4000-8000-000000000515', 'clipShape', FALSE, 1),
  ('03C00000-0000-4000-8000-000000001058', '03C00000-0000-4000-8000-000000000515', 'fixedSize', TRUE,  2),
  ('03C00000-0000-4000-8000-000000001059', '03C00000-0000-4000-8000-000000000515', 'aspectRatio', FALSE, 3),
  ('03C00000-0000-4000-8000-000000001060', '03C00000-0000-4000-8000-000000000515', 'ignoresSafeArea', FALSE, 4),
  -- Q6 (516): @State owner
  ('03C00000-0000-4000-8000-000000001061', '03C00000-0000-4000-8000-000000000516', 'On any global object', FALSE, 1),
  ('03C00000-0000-4000-8000-000000001062', '03C00000-0000-4000-8000-000000000516', 'In the view that owns the value', TRUE,  2),
  ('03C00000-0000-4000-8000-000000001063', '03C00000-0000-4000-8000-000000000516', 'In a class only', FALSE, 3),
  ('03C00000-0000-4000-8000-000000001064', '03C00000-0000-4000-8000-000000000516', 'In the App delegate', FALSE, 4),
  -- Q6 (516)q2: binding
  ('03C00000-0000-4000-8000-000000001065', '03C00000-0000-4000-8000-000000000517', 'A two-way binding', TRUE,  1),
  ('03C00000-0000-4000-8000-000000001066', '03C00000-0000-4000-8000-000000000517', 'A constant copy', FALSE, 2),
  ('03C00000-0000-4000-8000-000000001067', '03C00000-0000-4000-8000-000000000517', 'A computed value', FALSE, 3),
  ('03C00000-0000-4000-8000-000000001068', '03C00000-0000-4000-8000-000000000517', 'A weak reference', FALSE, 4),
  -- Q6 (516)q3: @Observable
  ('03C00000-0000-4000-8000-000000001069', '03C00000-0000-4000-8000-000000000518', 'It serializes data to disk', FALSE, 1),
  ('03C00000-0000-4000-8000-000000001070', '03C00000-0000-4000-8000-000000000518', 'It prevents memberwise init', FALSE, 2),
  ('03C00000-0000-4000-8000-000000001071', '03C00000-0000-4000-8000-000000000518', 'It tracks property changes to update views', TRUE,  3),
  ('03C00000-0000-4000-8000-000000001072', '03C00000-0000-4000-8000-000000000518', 'It makes the model a struct', FALSE, 4),
  -- Q7 (519): Identifiable
  ('03C00000-0000-4000-8000-000000001073', '03C00000-0000-4000-8000-000000000519', 'A stable identity for diffing rows', TRUE,  1),
  ('03C00000-0000-4000-8000-000000001074', '03C00000-0000-4000-8000-000000000519', 'A fixed row height', FALSE, 2),
  ('03C00000-0000-4000-8000-000000001075', '03C00000-0000-4000-8000-000000000519', 'A navigation title', FALSE, 3),
  ('03C00000-0000-4000-8000-000000001076', '03C00000-0000-4000-8000-000000000519', 'A color scheme', FALSE, 4),
  -- Q7 (519)q2: onDelete
  ('03C00000-0000-4000-8000-000000001077', '03C00000-0000-4000-8000-000000000520', 'removeRows', FALSE, 1),
  ('03C00000-0000-4000-8000-000000001078', '03C00000-0000-4000-8000-000000000520', 'sweep', FALSE, 2),
  ('03C00000-0000-4000-8000-000000001079', '03C00000-0000-4000-8000-000000000520', 'deleteAction', FALSE, 3),
  ('03C00000-0000-4000-8000-000000001080', '03C00000-0000-4000-8000-000000000520', 'onDelete', TRUE,  4),
  -- Q7 (519)q3: navigation path
  ('03C00000-0000-4000-8000-000000001081', '03C00000-0000-4000-8000-000000000521', 'A path of navigation data', TRUE,  1),
  ('03C00000-0000-4000-8000-000000001082', '03C00000-0000-4000-8000-000000000521', 'A list of styles', FALSE, 2),
  ('03C00000-0000-4000-8000-000000001083', '03C00000-0000-4000-8000-000000000521', 'A view builder', FALSE, 3),
  ('03C00000-0000-4000-8000-000000001084', '03C00000-0000-4000-8000-000000000521', 'A dismiss action', FALSE, 4),
  -- Q8 (522): withAnimation
  ('03C00000-0000-4000-8000-000000001085', '03C00000-0000-4000-8000-000000000522', 'By reloading the app', FALSE, 1),
  ('03C00000-0000-4000-8000-000000001086', '03C00000-0000-4000-8000-000000000522', 'With withAnimation', TRUE,  2),
  ('03C00000-0000-4000-8000-000000001087', '03C00000-0000-4000-8000-000000000522', 'With a DispatchQueue', FALSE, 3),
  ('03C00000-0000-4000-8000-000000001088', '03C00000-0000-4000-8000-000000000522', 'Automatically on every change', FALSE, 4),
  -- Q8 (522)q2: Form
  ('03C00000-0000-4000-8000-000000001089', '03C00000-0000-4000-8000-000000000523', 'ScrollView', FALSE, 1),
  ('03C00000-0000-4000-8000-000000001090', '03C00000-0000-4000-8000-000000000523', 'Canvas', FALSE, 2),
  ('03C00000-0000-4000-8000-000000001091', '03C00000-0000-4000-8000-000000000523', 'Form', TRUE,  3),
  ('03C00000-0000-4000-8000-000000001092', '03C00000-0000-4000-8000-000000000523', 'List with images', FALSE, 4),
  -- Q8 (522)q3: TextField
  ('03C00000-0000-4000-8000-000000001093', '03C00000-0000-4000-8000-000000000524', 'Toggle', FALSE, 1),
  ('03C00000-0000-4000-8000-000000001094', '03C00000-0000-4000-8000-000000000524', 'DatePicker', FALSE, 2),
  ('03C00000-0000-4000-8000-000000001095', '03C00000-0000-4000-8000-000000000524', 'Stepper', FALSE, 3),
  ('03C00000-0000-4000-8000-000000001096', '03C00000-0000-4000-8000-000000000524', 'TextField', TRUE,  4),
  -- Q9 (525): Codable
  ('03C00000-0000-4000-8000-000000001097', '03C00000-0000-4000-8000-000000000525', 'A Codable struct', TRUE,  1),
  ('03C00000-0000-4000-8000-000000001098', '03C00000-0000-4000-8000-000000000525', 'A UIViewController', FALSE, 2),
  ('03C00000-0000-4000-8000-000000001099', '03C00000-0000-4000-8000-000000000525', 'A CLLocation', FALSE, 3),
  ('03C00000-0000-4000-8000-000000001100', '03C00000-0000-4000-8000-000000000525', 'A Formatter', FALSE, 4),
  -- Q9 (525)q2: SwiftData model
  ('03C00000-0000-4000-8000-000000001101', '03C00000-0000-4000-8000-000000000526', 'Mark it with @Model and insert it into the context', TRUE,  1),
  ('03C00000-0000-4000-8000-000000001102', '03C00000-0000-4000-8000-000000000526', 'Store it in UserDefaults only', FALSE, 2),
  ('03C00000-0000-4000-8000-000000001103', '03C00000-0000-4000-8000-000000000526', 'Write it to a plist', FALSE, 3),
  ('03C00000-0000-4000-8000-000000001104', '03C00000-0000-4000-8000-000000000526', 'Create a global singleton', FALSE, 4),
  -- Q9 (525)q3: @Query
  ('03C00000-0000-4000-8000-000000001105', '03C00000-0000-4000-8000-000000000527', 'Persisted results that stay in sync', TRUE,  1),
  ('03C00000-0000-4000-8000-000000001106', '03C00000-0000-4000-8000-000000000527', 'It fixes layout issues', FALSE, 2),
  ('03C00000-0000-4000-8000-000000001107', '03C00000-0000-4000-8000-000000000527', 'It queues network calls', FALSE, 3),
  ('03C00000-0000-4000-8000-000000001108', '03C00000-0000-4000-8000-000000000527', 'It builds the app binary', FALSE, 4),
  -- Q9 (525)q4: URLSession
  ('03C00000-0000-4000-8000-000000001109', '03C00000-0000-4000-8000-000000000528', 'URLSession', TRUE,  1),
  ('03C00000-0000-4000-8000-000000001110', '03C00000-0000-4000-8000-000000000528', 'CLLocationManager', FALSE, 2),
  ('03C00000-0000-4000-8000-000000001111', '03C00000-0000-4000-8000-000000000528', 'PHPhotoLibrary', FALSE, 3),
  ('03C00000-0000-4000-8000-000000001112', '03C00000-0000-4000-8000-000000000528', 'UIFont', FALSE, 4),
  -- Q9 (525)q5: scenePhase
  ('03C00000-0000-4000-8000-000000001113', '03C00000-0000-4000-8000-000000000529', 'Active, inactive, and background states', TRUE,  1),
  ('03C00000-0000-4000-8000-000000001114', '03C00000-0000-4000-8000-000000000529', 'Screen brightness', FALSE, 2),
  ('03C00000-0000-4000-8000-000000001115', '03C00000-0000-4000-8000-000000000529', 'Battery level', FALSE, 3),
  ('03C00000-0000-4000-8000-000000001116', '03C00000-0000-4000-8000-000000000529', 'Network speed', FALSE, 4)
ON CONFLICT (id) DO NOTHING;
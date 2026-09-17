-- ============================================================================
-- SEED 040: Complete course — "Android Development with Kotlin"
-- ----------------------------------------------------------------------------
-- Instructor : Marcus Johnson     (10000000-0000-4000-8000-000000000002)
-- Category   : Mobile Development (20000000-0000-4000-8000-000000000007)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Kotlin Language Basics      → C1 Getting Started with Kotlin · C2 Functions, Null Safety & Classes
--   M2 Android Project Fundamentals→ C3 Project Structure & Gradle · C4 Activities & the Lifecycle
--   M3 Building UI with Views      → C5 Views & XML Layouts · C6 Intents & Navigation
--   M4 Modern Android Development  → C7 RecyclerView & Lists · C8 Coroutines & Networking
--   M5 Data & Capstone App         → C9 Room Persistence · C10 Capstone App & Testing
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
  '02800000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000002',
  '20000000-0000-4000-8000-000000000007',
  'Android Development with Kotlin',
  'android-development-with-kotlin',
  'Build production-ready Android apps with Kotlin. Master the Kotlin language, project anatomy, Activities, Views and XML layouts, Intents, RecyclerView, coroutines, Retrofit networking, and Room persistence — then ship a complete capstone app.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  38
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('02800000-0000-4000-8000-000000000011', '02800000-0000-4000-8000-000000000001', 'Write idiomatic Kotlin: variables, functions, null safety, classes, and collections.', 1),
  ('02800000-0000-4000-8000-000000000012', '02800000-0000-4000-8000-000000000001', 'Navigate the Android Studio project structure, Gradle, and the manifest with confidence.',  2),
  ('02800000-0000-4000-8000-000000000013', '02800000-0000-4000-8000-000000000001', 'Build interactive UIs with Views, XML layouts, event handling, and RecyclerView.',        3),
  ('02800000-0000-4000-8000-000000000014', '02800000-0000-4000-8000-000000000001', 'Handle background work with coroutines and talk to web APIs with Retrofit.',             4),
  ('02800000-0000-4000-8000-000000000015', '02800000-0000-4000-8000-000000000001', 'Persist data with Room and assemble and test a complete Android app.',                   5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('02800000-0000-4000-8000-000000000101', '02800000-0000-4000-8000-000000000001', 1, 'Kotlin Language Basics',       'Learn val/var, types, functions, lambdas, null safety, and classes.', 'PUBLISHED'),
  ('02800000-0000-4000-8000-000000000102', '02800000-0000-4000-8000-000000000001', 2, 'Android Project Fundamentals', 'Understand project anatomy, Gradle, and the Activity lifecycle.',      'PUBLISHED'),
  ('02800000-0000-4000-8000-000000000103', '02800000-0000-4000-8000-000000000001', 3, 'Building UI with Views',       'Create layouts in XML and wire up widgets and Intents.',              'PUBLISHED'),
  ('02800000-0000-4000-8000-000000000104', '02800000-0000-4000-8000-000000000001', 4, 'Modern Android Development',   'Build lists with RecyclerView and go async with coroutines and Retrofit.','PUBLISHED'),
  ('02800000-0000-4000-8000-000000000105', '02800000-0000-4000-8000-000000000001', 5, 'Data & Capstone App',          'Persist with Room and ship a polished task-manager app.',             'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('02800000-0000-4000-8000-000000000201', '02800000-0000-4000-8000-000000000101', 1, 'Getting Started with Kotlin',     'Kotlin syntax, types, and control flow.',          'PUBLISHED'),
  ('02800000-0000-4000-8000-000000000202', '02800000-0000-4000-8000-000000000101', 2, 'Functions, Null Safety & Classes', 'Reusable logic, safe types, and object modeling.',  'PUBLISHED'),
  ('02800000-0000-4000-8000-000000000203', '02800000-0000-4000-8000-000000000102', 1, 'Project Structure & Gradle',      'Understand the project files and the build system.', 'PUBLISHED'),
  ('02800000-0000-4000-8000-000000000204', '02800000-0000-4000-8000-000000000102', 2, 'Activities & the Lifecycle',      'Screen lifecycle and state management.',            'PUBLISHED'),
  ('02800000-0000-4000-8000-000000000205', '02800000-0000-4000-8000-000000000103', 1, 'Views & XML Layouts',             'The building blocks of Android UI.',                'PUBLISHED'),
  ('02800000-0000-4000-8000-000000000206', '02800000-0000-4000-8000-000000000103', 2, 'Intents & Navigation',            'Move between screens with data.',                   'PUBLISHED'),
  ('02800000-0000-4000-8000-000000000207', '02800000-0000-4000-8000-000000000104', 1, 'RecyclerView & Lists',            'High-performance scrolling lists.',                 'PUBLISHED'),
  ('02800000-0000-4000-8000-000000000208', '02800000-0000-4000-8000-000000000104', 2, 'Coroutines & Networking',         'Async code and web APIs.',                          'PUBLISHED'),
  ('02800000-0000-4000-8000-000000000209', '02800000-0000-4000-8000-000000000105', 1, 'Room Persistence',                'Store data locally with Room.',                     'PUBLISHED'),
  ('02800000-0000-4000-8000-000000000210', '02800000-0000-4000-8000-000000000105', 2, 'Capstone App & Testing',          'Assemble and verify the final application.',        'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 02800000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('02800000-0000-4000-8000-000000000301', '02800000-0000-4000-8000-000000000201', 1, 'What is Kotlin?',                 'Meet Kotlin, Android Studio, and your first app project.',             'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  7),
  ('02800000-0000-4000-8000-000000000302', '02800000-0000-4000-8000-000000000201', 2, 'Variables, Types & Basic Syntax', 'Work with val and var, primitive types, when, and loops.',              'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('02800000-0000-4000-8000-000000000303', '02800000-0000-4000-8000-000000000201', 3, 'Kotlin Basics Quiz',              'Check your Kotlin fundamentals.',                                       'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('02800000-0000-4000-8000-000000000304', '02800000-0000-4000-8000-000000000202', 1, 'Functions & Lambda Expressions',  'Write functions, default arguments, and lambdas.',                     'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('02800000-0000-4000-8000-000000000305', '02800000-0000-4000-8000-000000000202', 2, 'Null Safety & Classes',           'Nullable types, safe calls, classes, and collections.',                'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 11),
  ('02800000-0000-4000-8000-000000000306', '02800000-0000-4000-8000-000000000202', 3, 'Functions & Classes Quiz',        'Test your functions and null safety skills.',                           'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('02800000-0000-4000-8000-000000000307', '02800000-0000-4000-8000-000000000203', 1, 'Anatomy of an Android Project',   'Explore the manifest, resources, and source sets.',                    'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('02800000-0000-4000-8000-000000000308', '02800000-0000-4000-8000-000000000203', 2, 'Gradle & Dependencies',          'Configure build files and add libraries.',                              'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('02800000-0000-4000-8000-000000000309', '02800000-0000-4000-8000-000000000203', 3, 'Project & Gradle Quiz',          'Verify your project structure knowledge.',                              'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('02800000-0000-4000-8000-000000000310', '02800000-0000-4000-8000-000000000204', 1, 'Activities & the Lifecycle',     'Create and manage screen Activities.',                                  'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('02800000-0000-4000-8000-000000000311', '02800000-0000-4000-8000-000000000204', 2, 'Saving & Restoring State',       'Preserve UI state across configuration changes.',                       'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  9),
  ('02800000-0000-4000-8000-000000000312', '02800000-0000-4000-8000-000000000204', 3, 'Activity Lifecycle Quiz',        'Confirm your lifecycle skills.',                                        'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('02800000-0000-4000-8000-000000000313', '02800000-0000-4000-8000-000000000205', 1, 'Views, ViewGroups & XML Layouts','Compose UI with XML and ConstraintLayout.',                             'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 11),
  ('02800000-0000-4000-8000-000000000314', '02800000-0000-4000-8000-000000000205', 2, 'Widgets & Event Handling',       'Wire buttons and text input to actions.',                               'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('02800000-0000-4000-8000-000000000315', '02800000-0000-4000-8000-000000000205', 3, 'Views & Layouts Quiz',           'Test your layout and widget knowledge.',                                'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('02800000-0000-4000-8000-000000000316', '02800000-0000-4000-8000-000000000206', 1, 'Intents & Starting Activities',  'Launch new screens with the Intent system.',                            'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('02800000-0000-4000-8000-000000000317', '02800000-0000-4000-8000-000000000206', 2, 'Passing Data Between Screens',   'Share extras and handle results between Activities.',                   'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  9),
  ('02800000-0000-4000-8000-000000000318', '02800000-0000-4000-8000-000000000206', 3, 'Intents & Navigation Quiz',      'Check your navigation skills.',                                         'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('02800000-0000-4000-8000-000000000319', '02800000-0000-4000-8000-000000000207', 1, 'RecyclerView & Adapters',       'Render large lists with RecyclerView.',                                 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('02800000-0000-4000-8000-000000000320', '02800000-0000-4000-8000-000000000207', 2, 'ViewHolders & List Interactivity','Optimize bindings and handle taps.',                                   'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('02800000-0000-4000-8000-000000000321', '02800000-0000-4000-8000-000000000207', 3, 'RecyclerView Quiz',              'Verify your list-building skills.',                                     'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('02800000-0000-4000-8000-000000000322', '02800000-0000-4000-8000-000000000208', 1, 'Coroutines on the Main Thread',  'Structured concurrency and suspend functions.',                         'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 11),
  ('02800000-0000-4000-8000-000000000323', '02800000-0000-4000-8000-000000000208', 2, 'Retrofit & JSON Networking',     'Call REST APIs with Retrofit and converters.',                          'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('02800000-0000-4000-8000-000000000324', '02800000-0000-4000-8000-000000000208', 3, 'Coroutines & Networking Quiz',   'Confirm your async and API knowledge.',                                 'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('02800000-0000-4000-8000-000000000325', '02800000-0000-4000-8000-000000000209', 1, 'Room Persistence & Entities',    'Model tables and query them with Room.',                                'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 11),
  ('02800000-0000-4000-8000-000000000326', '02800000-0000-4000-8000-000000000210', 1, 'Capstone: Task Manager App',     'Assemble everything into a complete application.',                      'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('02800000-0000-4000-8000-000000000327', '02800000-0000-4000-8000-000000000210', 2, 'Testing Your Android App',       'Write unit and UI tests and run them with Gradle.',                     'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  9),
  ('02800000-0000-4000-8000-000000000328', '02800000-0000-4000-8000-000000000210', 3, 'Final Assessment',               'Prove your Kotlin and Android mastery.',                                'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 02800000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '02800000-0000-4000-8000-000000000401',
  '02800000-0000-4000-8000-000000000301',
  1,
  'What is Kotlin?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What is Kotlin?</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p, .lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>What is Kotlin?</h1>
  <p>Kotlin is a modern, statically typed programming language created by JetBrains. It became the official language for Android development in 2019, and today the vast majority of new Android apps are written in it. Kotlin compiles to <strong>JVM bytecode</strong>, so it runs everywhere Java runs — including Android&rsquo;s runtime.</p>
  <h2>Why Android chose Kotlin</h2>
  <ul>
    <li><strong>Concise</strong> — less boilerplate than Java, so you read and write less code.</li>
    <li><strong>Null safety</strong> — the type system prevents most null-pointer crashes at compile time.</li>
    <li><strong>Full interop</strong> — Kotlin and Java call each other freely, so every Android library still works.</li>
    <li><strong>Coroutines</strong> — simple, structured handling of background work.</li>
  </ul>
  <h2>Set up Android Studio</h2>
  <ol>
    <li>Download and install Android Studio (a recent stable release).</li>
    <li>Open it and create a new project with the <em>Empty Views Activity</em> template.</li>
    <li>Choose <span class="ic">Kotlin</span> as the language and a <em>Minimum SDK</em> of API 26 or newer.</li>
  </ol>
  <p>Every Activity you create starts with a class that looks like this:</p>
  <pre class="code-block">package com.example.myfirstapp

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }
}</pre>
  <h2>What you will build</h2>
  <p>Throughout this course you will build a complete <strong>task manager app</strong>: a list screen powered by RecyclerView, data loaded from a REST API with Retrofit, cached locally with Room, and held together by coroutines and a ViewModel.</p>
  <div class="callout callout-tip">
    <strong>Run early, run often</strong>
    <p>Press the green play button to install on an emulator or a physical device with USB debugging enabled. The fastest feedback loop is a small change followed by a quick run.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02800000-0000-4000-8000-000000000402',
  '02800000-0000-4000-8000-000000000302',
  1,
  'Variables, Types & Basic Syntax',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Variables, Types & Basic Syntax</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p, .lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Variables, Types &amp; Basic Syntax</h1>
  <p>Kotlin declares a variable with <span class="ic">val</span> (a <strong>read-only</strong> reference) or <span class="ic">var</span> (a <strong>mutable</strong> one). Kotlin infers the type from the assigned value.</p>
  <pre class="code-block">val appName = "Tasker"     // read-only: cannot be reassigned
var taskCount = 0          // mutable: can be reassigned
taskCount = 1              // fine

val isComplete = false
val rating: Double = 4.5   // explicit type is optional</pre>
  <div class="callout">
    <strong>Rule of thumb</strong>
    <p>Default to <span class="ic">val</span>. Reach for <span class="ic">var</span> only when the value genuinely changes.</p>
  </div>
  <h2>Core types</h2>
  <table>
    <tr><th>Type</th><th>Example</th><th>Notes</th></tr>
    <tr><td>Int</td><td>42</td><td>Whole number</td></tr>
    <tr><td>Long</td><td>42L</td><td>Large whole number</td></tr>
    <tr><td>Double</td><td>3.14</td><td>Decimal number</td></tr>
    <tr><td>Boolean</td><td>true / false</td><td>Yes or no</td></tr>
    <tr><td>Char</td><td>'A'</td><td>Single character</td></tr>
    <tr><td>String</td><td>"hello"</td><td>Text</td></tr>
  </table>
  <h2>Strings and templates</h2>
  <p>Strings interpolate expressions — no clunky concatenation:</p>
  <pre class="code-block">val tasksDone = 7
val total = 12
val message = "You finished $tasksDone of $total tasks."
val percent = "That is ${tasksDone * 100 / total}%."</pre>
  <h2>when — the smart switch</h2>
  <pre class="code-block">val priority = "high"

val color = when (priority) {
    "high"   -&gt; "#dc2626"
    "medium" -&gt; "#f59e0b"
    "low"    -&gt; "#16a34a"
    else     -&gt; "#6b7280"
}</pre>
  <p>A range makes <span class="ic">when</span> even more expressive:</p>
  <pre class="code-block">val score = 87
when (score) {
    in 0..59   -&gt; println("Needs work")
    in 60..89  -&gt; println("Good")
    else       -&gt; println("Excellent")
}</pre>
  <h2>Loops</h2>
  <pre class="code-block">for (i in 1..5) println(i)
for (i in 1 until 5) println(i)

var remaining = 3
while (remaining &gt; 0) {
    println("Loading... $remaining")
    remaining--
}</pre>
</div>
</body>
</html>
$html$
),
(
  '02800000-0000-4000-8000-000000000404',
  '02800000-0000-4000-8000-000000000304',
  1,
  'Functions & Lambda Expressions',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Functions & Lambda Expressions</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p, .lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Functions &amp; Lambda Expressions</h1>
  <p>Functions are declared with the <span class="ic">fun</span> keyword. Parameters come with types, and the return type follows the parameter list:</p>
  <pre class="code-block">fun greet(name: String, greeting: String = "Hello"): String {
    return "$greeting, $name!"
}

fun add(a: Int, b: Int) = a + b   // expression body — no braces, no return</pre>
  <h2>Default and named arguments</h2>
  <pre class="code-block">println(greet("Ana"))               // Hello, Ana!
println(greet("Ana", "Hi"))         // Hi, Ana!</pre>
  <h2>Lambda expressions</h2>
  <p>A lambda is an anonymous function value. The arrow separates parameters from the body:</p>
  <pre class="code-block">val square = { x: Int -&gt; x * x }
println(square(5))              // 25

val greeting: (String) -&gt; String = { name -&gt; "Hello, $name!" }</pre>
  <h2>Higher-order functions</h2>
  <p>Collections lean on lambdas. When a lambda has exactly one parameter you can use <span class="ic">it</span>:</p>
  <pre class="code-block">val minutes = listOf(45, 12, 33, 8)

val short = minutes.filter { it &lt; 30 }       // [12, 8]
val doubled = minutes.map { it * 2 }         // [90, 24, 66, 16]
val total = minutes.sum()</pre>
  <p>You can write your own higher-order function that takes a lambda as its last parameter:</p>
  <pre class="code-block">fun format(task: String, style: (String) -&gt; String): String {
    return style(task)
}

val upper = format("buy milk") { name -&gt; name.uppercase() }
println(upper)   // BUY MILK</pre>
  <div class="callout callout-info">
    <strong>Trailing lambda syntax</strong>
    <p>When a lambda is the last parameter, Kotlin lets you put it outside the parentheses — that is why <span class="ic">setOnClickListener { ... }</span> reads so cleanly on Android.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02800000-0000-4000-8000-000000000405',
  '02800000-0000-4000-8000-000000000305',
  1,
  'Null Safety & Classes',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Null Safety & Classes</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p, .lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Null Safety &amp; Classes</h1>
  <p>Kotlin makes null impossible-by-default: a variable either can hold null (a <strong>nullable type</strong>, written with a trailing <span class="ic">?</span>) or it cannot. The compiler enforces the difference.</p>
  <pre class="code-block">val nickname: String? = null   // nullable — may be null

val display = nickname ?: "Guest"      // elvis: fallback value
val length = nickname?.length ?: 0     // safe call, then elvis

// nickname.length             // compile error — never allowed
</pre>
  <div class="callout">
    <strong>Avoid !!</strong>
    <p>Do not use <span class="ic">!!</span> just to silence the compiler. The <span class="ic">?.</span> and <span class="ic">?:</span> operators express intent safely.</p>
  </div>
  <h2>Classes</h2>
  <p>The constructor parameters live right in the class header:</p>
  <pre class="code-block">class Task(val title: String, var done: Boolean = false) {
    fun toggle() {
        done = !done
    }
}

val task = Task("Buy milk")
task.toggle()
println(task.done)   // true</pre>
  <h2>Data classes</h2>
  <p><span class="ic">data class</span> gets <span class="ic">toString</span>, <span class="ic">equals</span>, and <span class="ic">copy</span> for free:</p>
  <pre class="code-block">data class TaskItem(val id: Long, val title: String, val done: Boolean = false)

val item = TaskItem(1, "Write code")
val copy = item.copy(done = true)
println(copy)   // TaskItem(id=1, title=Write code, done=true)</pre>
  <h2>Collections</h2>
  <p>Kotlin separates read-only views from mutating collections:</p>
  <pre class="code-block">val readOnly: List&lt;String&gt; = listOf("a", "b", "c")
val mutable: MutableList&lt;String&gt; = mutableListOf("a")
mutable.add("b")

val counts = mapOf("one" to 1, "two" to 2)</pre>
  <h2>Companion objects</h2>
  <p>Values that belong to the class rather than an instance live in a <span class="ic">companion object</span>:</p>
  <pre class="code-block">class Config {
    companion object {
        const val DEFAULT_API_URL = "https://api.example.com"
    }
}

println(Config.DEFAULT_API_URL)</pre>
</div>
</body>
</html>
$html$
),
(
  '02800000-0000-4000-8000-000000000407',
  '02800000-0000-4000-8000-000000000307',
  1,
  'Anatomy of an Android Project',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Anatomy of an Android Project</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p, .lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Anatomy of an Android Project</h1>
  <p>Android Studio creates a well-known folder layout. A typical single-module project looks like this:</p>
  <pre class="code-block">MyApp/
  settings.gradle.kts
  build.gradle.kts          // project-level build script
  gradle.properties
  gradle/libs.versions.toml
  app/                      // the actual app module
    build.gradle.kts        // app dependencies and SDK config
    src/main/
      AndroidManifest.xml   // declares the app to Android
      java/com/example/     // Kotlin source files
      res/                  // layouts, strings, images
</pre>
  <h2>The manifest</h2>
  <p><span class="ic">AndroidManifest.xml</span> is the contract your app makes with the OS — which screens exist, which permissions you need, and which icon and name to show:</p>
  <pre class="code-block">&lt;manifest xmlns:android="http://schemas.android.com/apk/res/android"&gt;
    &lt;application
        android:label="@string/app_name"
        android:icon="@mipmap/ic_launcher"&gt;
        &lt;activity
            android:name=".MainActivity"
            android:exported="true"&gt;
            &lt;intent-filter&gt;
                &lt;action android:name="android.intent.action.MAIN"/&gt;
                &lt;category android:name="android.intent.category.LAUNCHER"/&gt;
            &lt;/intent-filter&gt;
        &lt;/activity&gt;
    &lt;/application&gt;
&lt;/manifest&gt;</pre>
  <h2>Where the files live</h2>
  <table>
    <tr><th>Folder</th><th>Purpose</th></tr>
    <tr><td>app/src/main/java</td><td>Kotlin classes, including your Activities</td></tr>
    <tr><td>app/src/main/res/layout</td><td>XML layout files for screens and list items</td></tr>
    <tr><td>app/src/main/res/values</td><td>strings.xml, colors.xml, themes.xml</td></tr>
    <tr><td>app/src/main/res/drawable</td><td>Vector and bitmap graphics</td></tr>
    <tr><td>app/src/main/res/mipmap</td><td>Launcher icons at multiple densities</td></tr>
  </table>
  <h2>Resources and the R class</h2>
  <p>Every resource gets a generated id in the <span class="ic">R</span> class. Reference them as <span class="ic">R.layout.activity_main</span> or <span class="ic">R.string.app_name</span>:</p>
  <pre class="code-block">&lt;resources&gt;
    &lt;string name="app_name"&gt;Tasker&lt;/string&gt;
    &lt;string name="add_task"&gt;Add task&lt;/string&gt;
&lt;/resources&gt;</pre>
  <div class="callout callout-info">
    <strong>Never hardcode strings</strong>
    <p>Android Lint flags literal strings scattered in code and layout. Put user-facing text in <span class="ic">res/values/strings.xml</span> — it is the first step to a multi-language app.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02800000-0000-4000-8000-000000000408',
  '02800000-0000-4000-8000-000000000308',
  1,
  'Gradle & Dependencies',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Gradle & Dependencies</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p, .lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Gradle &amp; Dependencies</h1>
  <p>Gradle is the build system behind every Android project. Modern projects use its <strong>Kotlin DSL</strong>, so build scripts end in <span class="ic">.kts</span>. The file that matters most is the app module&rsquo;s script:</p>
  <pre class="code-block">// app/build.gradle.kts
plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
}

android {
    namespace = "com.example.tasker"
    compileSdk = 34

    defaultConfig {
        applicationId = "com.example.tasker"
        minSdk = 26
        targetSdk = 34
        versionCode = 1
    }

    buildTypes {
        release {
            isMinifyEnabled = false
        }
    }
}

dependencies {
    implementation("androidx.core:core-ktx:1.13.1")
    implementation("androidx.appcompat:appcompat:1.7.0")
    implementation("androidx.recyclerview:recyclerview:1.3.2")
    implementation("com.squareup.retrofit2:retrofit:2.11.0")
    implementation("androidx.room:room-runtime:2.6.1")
}</pre>
  <h2>Key settings</h2>
  <table>
    <tr><th>Setting</th><th>Meaning</th></tr>
    <tr><td>compileSdk</td><td>Android API level the code compiles against</td></tr>
    <tr><td>minSdk</td><td>Lowest Android version your app supports</td></tr>
    <tr><td>targetSdk</td><td>API level that dictates runtime behavior</td></tr>
  </table>
  <h2>Adding a dependency</h2>
  <ol>
    <li>Find the artifact coordinates — group, name, version — on the library website.</li>
    <li>Add an <span class="ic">implementation(...)</span> line under <span class="ic">dependencies</span>.</li>
    <li>Click <em>Sync Now</em> so Gradle downloads it and updates the IDE index.</li>
  </ol>
  <h2>Common Gradle tasks</h2>
  <pre class="code-block">./gradlew assembleDebug     // build a debuggable APK
./gradlew test              // run local unit tests
./gradlew lint              // static analysis</pre>
  <div class="callout callout-tip">
    <strong>Read the last lines</strong>
    <p>When a build fails, the useful message is usually near the bottom of the error. Scroll the Build window to the end before googling the top error line.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02800000-0000-4000-8000-000000000410',
  '02800000-0000-4000-8000-000000000310',
  1,
  'Activities & the Lifecycle',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Activities & the Lifecycle</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p, .lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Activities &amp; the Lifecycle</h1>
  <p>An <strong>Activity</strong> is a single, user-focused screen in your app. It owns a window, and its lifecycle is managed entirely by the operating system — Android calls methods on your Activity as the user navigates, locks the screen, or rotates the device.</p>
  <h2>Creating an Activity</h2>
  <pre class="code-block">class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }
}</pre>
  <p>Every Activity you launch must be registered in the manifest, and one Activity must include the launcher intent-filter so the app appears on the home screen.</p>
  <h2>The lifecycle callbacks</h2>
  <table>
    <tr><th>Callback</th><th>What it means</th></tr>
    <tr><td>onCreate</td><td>Screen is created — inflate the layout, set up listeners</td></tr>
    <tr><td>onStart</td><td>Screen is about to become visible</td></tr>
    <tr><td>onResume</td><td>Screen is visible and interactive — foreground work here</td></tr>
    <tr><td>onPause</td><td>Another window is taking focus</td></tr>
    <tr><td>onStop</td><td>Screen is fully hidden — release camera, sensors, and heavy resources</td></tr>
    <tr><td>onDestroy</td><td>Screen is being torn down — clean up remaining references</td></tr>
  </table>
  <p>You can watch the sequence with a bit of logging:</p>
  <pre class="code-block">override fun onStart() {
    super.onStart()
    Log.d(TAG, "onStart called")
}

override fun onStop() {
    super.onStop()
    Log.d(TAG, "onStop called")
}</pre>
  <h2>Why the lifecycle matters</h2>
  <ul>
    <li>Rotating the phone destroys and recreates the Activity by default.</li>
    <li>Background apps may be killed under memory pressure — <span class="ic">onStop</span> is your chance to save work.</li>
    <li>Leaking resources (sensors, media players, location) causes crashes and battery drain.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Logcat is your microscope</strong>
    <p>Open the <em>Logcat</em> tool window, filter by your <span class="ic">TAG</span>, and rotate the emulator — you will watch every callback fire in order.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02800000-0000-4000-8000-000000000411',
  '02800000-0000-4000-8000-000000000311',
  1,
  'Saving & Restoring State',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Saving & Restoring State</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p, .lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Saving &amp; Restoring State</h1>
  <p>When a device rotates, the system tears down the current Activity and builds a fresh one — any field in memory is lost. Android gives you two ways to survive this: <strong>saved instance state</strong> and, better, a <strong>ViewModel</strong>.</p>
  <h2>Saved instance state</h2>
  <p>Write small, transient values into a <span class="ic">Bundle</span> and read them back in <span class="ic">onCreate</span>:</p>
  <pre class="code-block">private var counter = 0

override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    counter = savedInstanceState?.getInt("counter") ?: 0
}

override fun onSaveInstanceState(outState: Bundle) {
    outState.putInt("counter", counter)
    super.onSaveInstanceState(outState)
}</pre>
  <h2>Why ViewModel is better</h2>
  <p>A <span class="ic">ViewModel</span> outlives the Activity — it is created once per screen and survives rotation:</p>
  <pre class="code-block">class CounterViewModel : ViewModel() {
    var count = 0
        private set

    fun increment() {
        count++
    }
}

class MainActivity : AppCompatActivity() {
    private val viewModel: CounterViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        button.setOnClickListener {
            viewModel.increment()
            textView.text = "Count: ${viewModel.count}"
        }
    }
}</pre>
  <h2>What goes where</h2>
  <table>
    <tr><th>Data</th><th>Home</th></tr>
    <tr><td>In-progress form input</td><td>onSaveInstanceState Bundle</td></tr>
    <tr><td>Screen data (lists, loaded results)</td><td>ViewModel</td></tr>
    <tr><td>User preferences</td><td>DataStore / SharedPreferences</td></tr>
    <tr><td>Large or critical records</td><td>Room database</td></tr>
  </table>
</div>
</body>
</html>
$html$
),
(
  '02800000-0000-4000-8000-000000000413',
  '02800000-0000-4000-8000-000000000313',
  1,
  'Views, ViewGroups & XML Layouts',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Views, ViewGroups & XML Layouts</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p, .lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Views, ViewGroups &amp; XML Layouts</h1>
  <p>Every pixel of an Android screen is drawn by <strong>Views</strong> — <span class="ic">TextView</span> for text, <span class="ic">Button</span> for taps, <span class="ic">EditText</span> for input. <strong>ViewGroups</strong> are containers that measure and position child views; <span class="ic">ConstraintLayout</span> and <span class="ic">LinearLayout</span> are the most common.</p>
  <h2>A layout file</h2>
  <pre class="code-block">&lt;!-- res/layout/activity_main.xml --&gt;
&lt;androidx.constraintlayout.widget.ConstraintLayout
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="match_parent"
    android:layout_height="match_parent"&gt;

    &lt;TextView
        android:id="@+id/titleText"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="@string/task_title"
        android:textSize="24sp"/&gt;

&lt;/androidx.constraintlayout.widget.ConstraintLayout&gt;</pre>
  <h2>Essential attributes</h2>
  <table>
    <tr><th>Attribute</th><th>Value</th><th>Meaning</th></tr>
    <tr><td>layout_width / layout_height</td><td>match_parent, wrap_content, or a size</td><td>How the view is sized</td></tr>
    <tr><td>layout_margin*</td><td>8dp, 16dp</td><td>Space outside the view bounds</td></tr>
    <tr><td>padding</td><td>8dp, 16dp</td><td>Space inside the view bounds</td></tr>
    <tr><td>gravity</td><td>center, start</td><td>Aligns content inside the view</td></tr>
  </table>
  <h2>dp, sp, and density</h2>
  <ul>
    <li><span class="ic">dp</span> (density-independent pixels) — consistent physical size; use for sizes, margins, radii.</li>
    <li><span class="ic">sp</span> (scale-independent pixels) — dp scaled by the user&rsquo;s font setting; use for text.</li>
    <li><span class="ic">px</span> — raw pixels; never hardcode these.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>One container, many children</strong>
    <p>LinearLayout stacks children in a row or column. ConstraintLayout pins each view to the parent or other views — flat hierarchies render faster. Start with ConstraintLayout for full screens.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02800000-0000-4000-8000-000000000414',
  '02800000-0000-4000-8000-000000000314',
  1,
  'Widgets & Event Handling',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Widgets & Event Handling</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p, .lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Widgets &amp; Event Handling</h1>
  <p>Layouts describe the screen; Kotlin brings it to life. The pattern is always the same: give the widget an <span class="ic">android:id</span> in XML, find it in code, and attach a listener.</p>
  <h2>The layout</h2>
  <pre class="code-block">&lt;EditText
    android:id="@+id/taskInput"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:hint="@string/task_hint"/&gt;

&lt;Button
    android:id="@+id/addButton"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:text="@string/add_task"/&gt;

&lt;TextView
    android:id="@+id/statusText"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"/&gt;</pre>
  <h2>Finding views and handling clicks</h2>
  <pre class="code-block">class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val input = findViewById&lt;EditText&gt;(R.id.taskInput)
        val status = findViewById&lt;TextView&gt;(R.id.statusText)

        findViewById&lt;Button&gt;(R.id.addButton).setOnClickListener {
            val text = input.text.toString().trim()
            if (text.isEmpty()) {
                status.text = "A task needs a name."
                return@setOnClickListener
            }
            status.text = "Added: $text"
        }
    }
}</pre>
  <h2>Common widget events</h2>
  <table>
    <tr><th>Widget</th><th>Listener</th><th>Fires when…</th></tr>
    <tr><td>Button</td><td>setOnClickListener</td><td>the button is tapped</td></tr>
    <tr><td>EditText</td><td>addTextChangedListener</td><td>the text changes</td></tr>
    <tr><td>Switch</td><td>setOnCheckedChangeListener</td><td>the switch toggles</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Validate before acting</strong>
    <p>Check the input and stop early with a clear message — an empty value should never reach your data layer.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02800000-0000-4000-8000-000000000416',
  '02800000-0000-4000-8000-000000000316',
  1,
  'Intents & Starting Activities',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Intents & Starting Activities</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p, .lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Intents &amp; Starting Activities</h1>
  <p>An <strong>Intent</strong> is a message that describes an action to perform — most commonly, &ldquo;open this screen&rdquo;. An <em>explicit</em> intent names the target class; an <em>implicit</em> intent describes what you want and lets any app answer.</p>
  <h2>Explicit intent</h2>
  <pre class="code-block">val intent = Intent(this, DetailActivity::class.java)
startActivity(intent)</pre>
  <p>Then tell Android the target exists. Inside the manifest:</p>
  <pre class="code-block">&lt;activity
    android:name=".DetailActivity"
    android:exported="true"/&gt;</pre>
  <div class="callout">
    <strong>Manifest is mandatory</strong>
    <p>Trying to start an unregistered Activity throws an <span class="ic">ActivityNotFoundException</span> — check AndroidManifest.xml first.</p>
  </div>
  <h2>Implicit intents</h2>
  <p>Letting the system pick an app keeps your app humble:</p>
  <pre class="code-block">val share = Intent(Intent.ACTION_SEND).apply {
    type = "text/plain"
    putExtra(Intent.EXTRA_TEXT, "Check out my task app!")
}
startActivity(Intent.createChooser(share, "Share via"))</pre>
  <h2>The back stack</h2>
  <p>Activities stack as you navigate. Pressing back pops the stack and finishes the current Activity; <span class="ic">finish()</span> does the same from code.</p>
  <h2>Intent extras travel automatically</h2>
  <ul>
    <li>The new Activity receives the same Intent that started it.</li>
    <li>Extras are small key-value pairs for lightweight data — ids and short text.</li>
    <li>For heavy payloads, keep an id and load the real object from a repository.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Starter functions</strong>
    <p>Give each Activity a companion function that builds its intent:</p>
    <pre class="code-block">class DetailActivity : AppCompatActivity() {
    companion object {
        const val EXTRA_TASK_ID = "task_id"
        fun newIntent(context: Context, taskId: Long) =
            Intent(context, DetailActivity::class.java)
                .putExtra(EXTRA_TASK_ID, taskId)
    }
}</pre>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02800000-0000-4000-8000-000000000417',
  '02800000-0000-4000-8000-000000000317',
  1,
  'Passing Data Between Screens',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Passing Data Between Screens</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p, .lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Passing Data Between Screens</h1>
  <p>Screens rarely live in isolation — a list screen sends an item to a detail screen, and a form screen returns a result. Intent <strong>extras</strong> carry that data with the message.</p>
  <h2>Sending extras</h2>
  <pre class="code-block">fun openDetail(task: Task) {
    val intent = Intent(this, DetailActivity::class.java).apply {
        putExtra("task_id", task.id)
        putExtra("task_title", task.title)
        putExtra("task_done", task.done)
    }
    startActivity(intent)
}</pre>
  <h2>Reading extras</h2>
  <p>Read them in <span class="ic">onCreate</span> with defaults that show up clearly if a key is missing:</p>
  <pre class="code-block">class DetailActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_detail)

        val taskId = intent.getLongExtra("task_id", -1L)
        val title = intent.getStringExtra("task_title") ?: "Untitled"
        val done = intent.getBooleanExtra("task_done", false)

        textView.text = "#$taskId — $title"
    }
}</pre>
  <h2>Supported extras</h2>
  <table>
    <tr><th>Method</th><th>Data</th></tr>
    <tr><td>putString / getStringExtra</td><td>Text</td></tr>
    <tr><td>putInt / putLong / getIntExtra / getLongExtra</td><td>Numbers</td></tr>
    <tr><td>putBoolean / getBooleanExtra</td><td>Flags</td></tr>
  </table>
  <h2>Getting a result back</h2>
  <p>Modern apps use the Activity Result API — register a contract, launch, and read the result in a callback:</p>
  <pre class="code-block">private val launchResult =
    registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { result -&gt;
        val message = result.data?.getStringExtra("result_message")
        if (message != null) statusText.text = message
    }

fun askUser() {
    val intent = Intent(this, InputActivity::class.java)
    launchResult.launch(intent)
}</pre>
  <div class="callout callout-tip">
    <strong>Stick to ids</strong>
    <p>Pass the task <em>id</em>, not the whole object graph. The destination reloads the full record from Room or the network.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02800000-0000-4000-8000-000000000419',
  '02800000-0000-4000-8000-000000000319',
  1,
  'RecyclerView & Adapters',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>RecyclerView & Adapters</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p, .lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>RecyclerView &amp; Adapters</h1>
  <p><strong>RecyclerView</strong> renders scrolling lists efficiently by recycling item views that scroll offscreen. Three pieces make it work: the <strong>RecyclerView</strong>, a <strong>LayoutManager</strong> that positions items, and an <strong>Adapter</strong> that converts data into item views.</p>
  <h2>Layout</h2>
  <pre class="code-block">&lt;androidx.recyclerview.widget.RecyclerView
    android:id="@+id/taskList"
    android:layout_width="match_parent"
    android:layout_height="match_parent"/&gt;</pre>
  <h2>One item layout</h2>
  <pre class="code-block">&lt;!-- res/layout/item_task.xml --&gt;
&lt;androidx.constraintlayout.widget.ConstraintLayout
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:padding="16dp"&gt;

    &lt;TextView
        android:id="@+id/taskTitle"
        android:layout_width="0dp"
        android:layout_height="wrap_content"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintEnd_toEndOf="parent"/&gt;

&lt;/androidx.constraintlayout.widget.ConstraintLayout&gt;</pre>
  <h2>The adapter</h2>
  <p>Three callbacks matter: item count, creating an item view, and binding data to it.</p>
  <pre class="code-block">class TaskAdapter(private val tasks: List&lt;Task&gt;) :
    RecyclerView.Adapter&lt;TaskAdapter.TaskViewHolder&gt;() {

    inner class TaskViewHolder(val binding: ItemTaskBinding) :
        RecyclerView.ViewHolder(binding.root)

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): TaskViewHolder {
        val binding = ItemTaskBinding.inflate(
            LayoutInflater.from(parent.context), parent, false
        )
        return TaskViewHolder(binding)
    }

    override fun getItemCount(): Int = tasks.size

    override fun onBindViewHolder(holder: TaskViewHolder, position: Int) {
        holder.binding.taskTitle.text = tasks[position].title
    }
}</pre>
  <h2>Wiring it up</h2>
  <pre class="code-block">recyclerView.layoutManager = LinearLayoutManager(this)
recyclerView.adapter = TaskAdapter(tasks)</pre>
  <p>Swap <span class="ic">LinearLayoutManager</span> for <span class="ic">GridLayoutManager(this, 2)</span> to render a two-column grid instead.</p>
  <div class="callout callout-info">
    <strong>Recycling explained</strong>
    <p>Scrolled-off views are re-bound with new data and reused — which is why <span class="ic">onBindViewHolder</span> must set every field, or a recycled row shows stale content.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02800000-0000-4000-8000-000000000420',
  '02800000-0000-4000-8000-000000000320',
  1,
  'ViewHolders & List Interactivity',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ViewHolders & List Interactivity</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p, .lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>ViewHolders &amp; List Interactivity</h1>
  <p>A <strong>ViewHolder</strong> holds references to the inflated views of one row. Because RecyclerView reuses holders, lookups happen once per holder instead of once per scroll frame — this is the heart of RecyclerView&rsquo;s performance.</p>
  <h2>An interactive adapter</h2>
  <pre class="code-block">class TaskAdapter(
    private var tasks: List&lt;Task&gt;,
    private val onItemClick: (Task) -&gt; Unit
) : RecyclerView.Adapter&lt;TaskAdapter.TaskViewHolder&gt;() {

    inner class TaskViewHolder(val binding: ItemTaskBinding) :
        RecyclerView.ViewHolder(binding.root)

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): TaskViewHolder {
        val binding = ItemTaskBinding.inflate(
            LayoutInflater.from(parent.context), parent, false
        )
        return TaskViewHolder(binding)
    }

    override fun getItemCount(): Int = tasks.size

    override fun onBindViewHolder(holder: TaskViewHolder, position: Int) {
        val task = tasks[position]
        holder.binding.taskTitle.text = task.title
        holder.itemView.setOnClickListener {
            onItemClick(task)
        }
    }
}</pre>
  <h2>Handling taps</h2>
  <p>Keep the adapter dumb — it reports <em>which</em> task was tapped; navigation is the Activity&rsquo;s job:</p>
  <pre class="code-block">val adapter = TaskAdapter(tasks) { task -&gt;
    startActivity(DetailActivity.newIntent(this, task.id))
}
recyclerView.adapter = adapter</pre>
  <h2>Updating the list</h2>
  <p><span class="ic">notifyDataSetChanged()</span> is blunt and rebinds everything visible. The modern approach is diffing:</p>
  <pre class="code-block">class TaskListAdapter :
    ListAdapter&lt;Task, TaskListAdapter.TaskViewHolder&gt;(DiffCallback) {

    object DiffCallback : DiffUtil.ItemCallback&lt;Task&gt;() {
        override fun areItemsTheSame(oldItem: Task, newItem: Task) =
            oldItem.id == newItem.id

        override fun areContentsTheSame(oldItem: Task, newItem: Task) =
            oldItem == newItem
    }

    override fun onBindViewHolder(holder: TaskViewHolder, position: Int) {
        holder.binding.taskTitle.text = getItem(position).title
    }
}</pre>
  <table>
    <tr><th>Situation</th><th>Call</th></tr>
    <tr><td>Whole list replaced</td><td>submitList(newList) on a ListAdapter</td></tr>
    <tr><td>One item changed</td><td>notifyItemChanged(position)</td></tr>
    <tr><td>Rough, small lists</td><td>notifyDataSetChanged</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Observable data</strong>
    <p>Combine <span class="ic">ListAdapter.submitList</span> with a <span class="ic">Flow</span> from Room or the repository and your list stays in sync with no manual refresh calls.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02800000-0000-4000-8000-000000000422',
  '02800000-0000-4000-8000-000000000322',
  1,
  'Coroutines on the Main Thread',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Coroutines on the Main Thread</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p, .lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Coroutines on the Main Thread</h1>
  <p>Android draws UI on the <strong>main thread</strong>. Block it and the app freezes; block it too long and Android shows an ANR dialog. <strong>Coroutines</strong> let you write code that pauses and resumes without freezing.</p>
  <h2>Suspend functions</h2>
  <p>Mark a function <span class="ic">suspend</span> to say &ldquo;this does asynchronous work and can be paused.&rdquo; It can only be called from a coroutine or another suspend function:</p>
  <pre class="code-block">suspend fun fetchTasks(): List&lt;Task&gt; {
    delay(300)   // pretend a network call
    return listOf(Task(1, "Buy milk"), Task(2, "Ship app"))
}</pre>
  <h2>Launch with a scope</h2>
  <p><span class="ic">lifecycleScope</span> on an Activity cancels its coroutines automatically when the Activity is destroyed:</p>
  <pre class="code-block">lifecycleScope.launch {
    val tasks = fetchTasks()
    taskList.adapter = TaskAdapter(tasks)
}</pre>
  <h2>Dispatchers decide the thread</h2>
  <table>
    <tr><th>Dispatcher</th><th>Use for</th></tr>
    <tr><td>Dispatchers.Main</td><td>Updating the UI</td></tr>
    <tr><td>Dispatchers.IO</td><td>Network, files, and databases</td></tr>
    <tr><td>Dispatchers.Default</td><td>CPU-heavy computation</td></tr>
  </table>
  <h2>withContext for one-off switching</h2>
  <pre class="code-block">lifecycleScope.launch {
    val result = withContext(Dispatchers.IO) { fetchTasks() }
    resultsTextView.text = "Loaded ${result.size} tasks"
}</pre>
  <p>The code <em>reads</em> sequentially — <span class="ic">withContext</span> suspends, works off the main thread, and resumes only when the result is ready.</p>
  <div class="callout">
    <strong>Never block the main thread</strong>
    <p>Long-running or blocking operations on the main thread cause jank or an ANR dialog. Everything that can wait should be a coroutine.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02800000-0000-4000-8000-000000000423',
  '02800000-0000-4000-8000-000000000323',
  1,
  'Retrofit & JSON Networking',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Retrofit & JSON Networking</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p, .lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Retrofit &amp; JSON Networking</h1>
  <p><strong>Retrofit</strong> turns a REST API into ordinary Kotlin calls. You describe the API with an interface, Retrofit builds the HTTP client, and a <strong>converter</strong> maps JSON bytes into data classes. Paired with suspend functions, networking nearly disappears from your code.</p>
  <h2>Add the dependencies</h2>
  <pre class="code-block">implementation("com.squareup.retrofit2:retrofit:2.11.0")
implementation("com.squareup.retrofit2:converter-gson:2.11.0")</pre>
  <h2>Model and describe the API</h2>
  <pre class="code-block">// {"id": 1, "title": "Buy milk", "done": false}
data class TaskDto(
    val id: Long,
    val title: String,
    val done: Boolean
)

interface TaskApi {

    @GET("tasks")
    suspend fun getTasks(): List&lt;TaskDto&gt;

    @POST("tasks")
    suspend fun createTask(@Body task: TaskDto): TaskDto
}</pre>
  <h2>Build the Retrofit instance</h2>
  <pre class="code-block">object ApiClient {
    private const val BASE_URL = "https://api.example.com/"

    val taskApi: TaskApi by lazy {
        Retrofit.Builder()
            .baseUrl(BASE_URL)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(TaskApi::class.java)
    }
}</pre>
  <h2>Call it from a coroutine</h2>
  <pre class="code-block">lifecycleScope.launch {
    try {
        val tasks = withContext(Dispatchers.IO) {
            ApiClient.taskApi.getTasks()
        }
        taskList.adapter = TaskAdapter(tasks)
    } catch (e: Exception) {
        statusText.text = "Could not load tasks. Please try again."
    }
}</pre>
  <h2>Common annotations</h2>
  <table>
    <tr><th>Annotation</th><th>Meaning</th></tr>
    <tr><td>@GET / @POST / @PUT / @DELETE</td><td>HTTP method for the endpoint</td></tr>
    <tr><td>@Path("id")</td><td>Replaces {id} in the URL</td></tr>
    <tr><td>@Query("page")</td><td>Adds ?page= to the URL</td></tr>
    <tr><td>@Body</td><td>Sends an object as the request body</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Internet permission</strong>
    <p>Network calls need a manifest declaration: <span class="ic">&lt;uses-permission android:name="android.permission.INTERNET"/&gt;</span>.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02800000-0000-4000-8000-000000000425',
  '02800000-0000-4000-8000-000000000325',
  1,
  'Room Persistence & Entities',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Room Persistence & Entities</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p, .lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Room Persistence &amp; Entities</h1>
  <p><strong>Room</strong> is an SQLite abstraction with compile-time safety. It is built from three pieces: an <strong>Entity</strong> that maps to a table, a <strong>DAO</strong> that maps to queries, and a <strong>Database</strong> class that owns the connection.</p>
  <h2>Add Room</h2>
  <pre class="code-block">implementation("androidx.room:room-runtime:2.6.1")
implementation("androidx.room:room-ktx:2.6.1")
ksp("androidx.room:room-compiler:2.6.1")</pre>
  <h2>The entity</h2>
  <p>An entity is a data class annotated with <span class="ic">@Entity</span>. Each property becomes a column by default:</p>
  <pre class="code-block">@Entity(tableName = "tasks")
data class TaskEntity(
    @PrimaryKey val id: Long,
    val title: String,
    val done: Boolean = false
)</pre>
  <h2>The DAO</h2>
  <p>The Data Access Object declares every query. Room validates the SQL at compile time — a typo in a column name fails the build, not the app:</p>
  <pre class="code-block">@Dao
interface TaskDao {

    @Query("SELECT * FROM tasks ORDER BY id ASC")
    fun observeAll(): Flow&lt;List&lt;TaskEntity&gt;&gt;

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun upsert(task: TaskEntity)

    @Query("DELETE FROM tasks WHERE id = :id")
    suspend fun deleteById(id: Long)
}</pre>
  <h2>The database</h2>
  <pre class="code-block">@Database(
    entities = [TaskEntity::class],
    version = 1
)
abstract class AppDatabase : RoomDatabase() {
    abstract fun taskDao(): TaskDao

    companion object {
        fun build(context: Context): AppDatabase =
            Room.databaseBuilder(
                context,
                AppDatabase::class.java,
                "tasks.db"
            ).build()
    }
}</pre>
  <h2>Reactive queries</h2>
  <p>Return <span class="ic">Flow</span> from a query and Room re-emits when the table changes — the UI collects it forever and stays in sync:</p>
  <pre class="code-block">lifecycleScope.launch {
    db.taskDao().observeAll().collect { tasks -&gt;
        adapter.submitList(tasks)
    }
}</pre>
  <h2>Migrations</h2>
  <p>Bump the <span class="ic">@Database version</span> and add a <span class="ic">Migration</span> whenever the schema changes; without one, Room throws at open time.</p>
  <div class="callout callout-info">
    <strong>I/O off the main thread</strong>
    <p>Database access is I/O. Room understands suspend functions natively, or wrap writes in <span class="ic">withContext(Dispatchers.IO)</span>.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02800000-0000-4000-8000-000000000426',
  '02800000-0000-4000-8000-000000000326',
  1,
  'Capstone: Task Manager App',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Task Manager App</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p, .lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Task Manager App</h1>
  <p>Time to assemble everything into one coherent app. The architecture is simple and testable: <strong>UI → ViewModel → Repository → (Retrofit + Room)</strong>. The repository is the single source of truth; the database is the cache; the API is the remote.</p>
  <h2>The repository</h2>
  <pre class="code-block">class TaskRepository(
    private val api: TaskApi,
    private val dao: TaskDao
) {
    val tasks: Flow&lt;List&lt;Task&gt;&gt; =
        dao.observeAll().map { entities -&gt;
            entities.map { it.toDomain() }
        }

    suspend fun refresh() {
        try {
            val fresh = withContext(Dispatchers.IO) {
                api.getTasks()
            }
            dao.upsertAll(fresh.map { it.toEntity() })
        } catch (e: IOException) {
            // keep showing cached data; the UI shows a non-blocking hint
        }
    }
}</pre>
  <h2>The ViewModel</h2>
  <pre class="code-block">class TaskViewModel(private val repository: TaskRepository) : ViewModel() {

    val tasks: StateFlow&lt;List&lt;Task&gt;&gt; =
        repository.tasks.stateIn(
            viewModelScope,
            SharingStarted.WhileSubscribed(5000),
            emptyList()
        )

    init {
        viewModelScope.launch {
            repository.refresh()
        }
    }

    fun toggle(task: Task) {
        viewModelScope.launch {
            repository.toggle(task)
        }
    }
}</pre>
  <p>The Activity stays thin — it creates the view, submits the Flow to the adapter, and forwards user actions to the ViewModel.</p>
  <h2>Checklist for the build</h2>
  <table>
    <tr><th>Piece</th><th>Where</th></tr>
    <tr><td>INTERNET permission</td><td>AndroidManifest.xml</td></tr>
    <tr><td>Task API (Retrofit)</td><td>TaskApi interface + ApiClient</td></tr>
    <tr><td>Room tables</td><td>TaskEntity, TaskDao, AppDatabase</td></tr>
    <tr><td>List UI</td><td>RecyclerView + ListAdapter with DiffUtil</td></tr>
    <tr><td>State holder</td><td>TaskViewModel + StateFlow</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Polish counts</strong>
    <p>Add swipe-to-delete (ItemTouchHelper), a loading indicator on the first load, and empty-state copy — a list that explains itself is a finished list.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02800000-0000-4000-8000-000000000427',
  '02800000-0000-4000-8000-000000000327',
  1,
  'Testing Your Android App',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Testing Your Android App</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p, .lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #064e3b; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Testing Your Android App</h1>
  <p>Tests protect the code you already wrote. Android splits them into two worlds: <strong>local unit tests</strong> that run fast on your machine&rsquo;s JVM, and <strong>instrumented tests</strong> that run on a device against the real Android framework.</p>
  <h2>Keep logic pure for testability</h2>
  <p>The single biggest lever is separating logic from the Android plumbing:</p>
  <pre class="code-block">object TaskFormatter {
    fun formatCount(done: Int, total: Int): String {
        return "$done of $total tasks complete"
    }
}</pre>
  <h2>Local unit test</h2>
  <p>Live in <span class="ic">app/src/test/java/…</span>, plain JUnit, no device needed:</p>
  <pre class="code-block">class TaskFormatterTest {

    @Test
    fun formatCount_reportsProgress() {
        val result = TaskFormatter.formatCount(2, 5)
        assertEquals("2 of 5 tasks complete", result)
    }
}</pre>
  <p>Run them with <span class="ic">./gradlew testDebugUnitTest</span>.</p>
  <h2>Instrumented test</h2>
  <p>In <span class="ic">app/src/androidTest/java/…</span>, drive the app the way a user does with Espresso:</p>
  <pre class="code-block">@RunWith(AndroidJUnit4::class)
class AddTaskFlowTest {

    @get:Rule
    val activityRule = ActivityScenarioRule(MainActivity::class.java)

    @Test
    fun typingTaskAndTappingAdd_showsItInTheList() {
        onView(withId(R.id.taskInput)).perform(typeText("Buy milk"))
        onView(withId(R.id.addButton)).perform(click())
        onView(withText("Buy milk")).check(matches(isDisplayed()))
    }
}</pre>
  <p>Run on an emulator or connected device with <span class="ic">./gradlew connectedDebugAndroidTest</span>.</p>
  <h2>A small test checklist</h2>
  <table>
    <tr><th>What</th><th>Type</th><th>Runs</th></tr>
    <tr><td>Formatter and mapper functions</td><td>Local unit test</td><td>./gradlew test</td></tr>
    <tr><td>Repository with a fake API + in-memory Room</td><td>Local unit test</td><td>./gradlew test</td></tr>
    <tr><td>Full screen flow: type, tap, verify</td><td>Instrumented (Espresso)</td><td>./gradlew connectedDebugAndroidTest</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Test the weird inputs too</strong>
    <p>Empty strings, zero counts, and failed fetches — a suite that covers edge cases is what makes you confident hitting the install button.</p>
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
  ('02800000-0000-4000-8000-000000000501', '02800000-0000-4000-8000-000000000303',
   'Which keyword declares a read-only immutable reference in Kotlin?',
   'val declares a reference that cannot be reassigned after initialization.', 1),
  ('02800000-0000-4000-8000-000000000502', '02800000-0000-4000-8000-000000000303',
   'What is the inferred Kotlin type of the literal 42?',
   'Integer literals default to the Int type.', 2),
  ('02800000-0000-4000-8000-000000000503', '02800000-0000-4000-8000-000000000303',
   'Which expression in Kotlin replaces the classic switch statement?',
   'when supports branches, ranges, and an else fallback.', 3),
  ('02800000-0000-4000-8000-000000000504', '02800000-0000-4000-8000-000000000306',
   'Which operator performs a safe call on a nullable value?',
   'The ?. operator skips the call and yields null when the receiver is null.', 1),
  ('02800000-0000-4000-8000-000000000505', '02800000-0000-4000-8000-000000000306',
   'Which keyword exits a function immediately and hands back a value?',
   'return stops the function and sends the value to the caller.', 2),
  ('02800000-0000-4000-8000-000000000506', '02800000-0000-4000-8000-000000000306',
   'What is a lambda expression?',
   'A lambda is an anonymous function value defined in curly braces.', 3),
  ('02800000-0000-4000-8000-000000000507', '02800000-0000-4000-8000-000000000309',
   'Where are Activities registered so the system knows about them?',
   'Every Activity is declared inside AndroidManifest.xml.', 1),
  ('02800000-0000-4000-8000-000000000508', '02800000-0000-4000-8000-000000000309',
   'Which file declares the app module dependencies and SDK versions?',
   'app/build.gradle.kts holds the android block and dependencies block.', 2),
  ('02800000-0000-4000-8000-000000000509', '02800000-0000-4000-8000-000000000309',
   'What language do modern Gradle build scripts (.kts) use?',
   'The Kotlin DSL lets you write build scripts in Kotlin.', 3),
  ('02800000-0000-4000-8000-000000000510', '02800000-0000-4000-8000-000000000312',
   'Which lifecycle callback runs when the Activity becomes visible to the user?',
   'onStart is called once the Activity enters the visible state.', 1),
  ('02800000-0000-4000-8000-000000000511', '02800000-0000-4000-8000-000000000312',
   'Where should you release heavy resources such as sensors or media players?',
   'onStop fires when the screen is fully hidden, the right time to release heavy resources.', 2),
  ('02800000-0000-4000-8000-000000000512', '02800000-0000-4000-8000-000000000312',
   'What does onSaveInstanceState help you do?',
   'It saves small transient UI values that survive rotation and process recreation.', 3),
  ('02800000-0000-4000-8000-000000000513', '02800000-0000-4000-8000-000000000315',
   'Which ViewGroup measures and positions children using constraints?',
   'ConstraintLayout pins each view with constraints to the parent and sibling views.', 1),
  ('02800000-0000-4000-8000-000000000514', '02800000-0000-4000-8000-000000000315',
   'Which XML attributes control a view size?',
   'android:layout_width and android:layout_height define sizing.', 2),
  ('02800000-0000-4000-8000-000000000515', '02800000-0000-4000-8000-000000000315',
   'Which method locates a view by its id at runtime?',
   'findViewById returns the view with the matching android:id.', 3),
  ('02800000-0000-4000-8000-000000000516', '02800000-0000-4000-8000-000000000318',
   'Which class describes an action to perform, such as opening a screen?',
   'An Intent is a message describing an operation to carry out.', 1),
  ('02800000-0000-4000-8000-000000000517', '02800000-0000-4000-8000-000000000318',
   'Which call starts a new Activity from the current one?',
   'startActivity(intent) launches the requested Activity.', 2),
  ('02800000-0000-4000-8000-000000000518', '02800000-0000-4000-8000-000000000318',
   'How do you attach data to an Intent using key-value pairs?',
   'putExtra(key, value) stashes extras that travel with the intent.', 3),
  ('02800000-0000-4000-8000-000000000519', '02800000-0000-4000-8000-000000000321',
   'Which component turns your data into the item views RecyclerView shows?',
   'The adapter creates and binds rows from the data list.', 1),
  ('02800000-0000-4000-8000-000000000520', '02800000-0000-4000-8000-000000000321',
   'Which class caches the view references for one list row?',
   'The ViewHolder holds the inflated views so bindings avoid repeated lookups.', 2),
  ('02800000-0000-4000-8000-000000000521', '02800000-0000-4000-8000-000000000321',
   'Which LayoutManager arranges items in a vertical scrolling list?',
   'LinearLayoutManager stacks items in a line, vertically by default.', 3),
  ('02800000-0000-4000-8000-000000000522', '02800000-0000-4000-8000-000000000324',
   'Which keyword marks a function that must be called from a coroutine?',
   'suspend functions pause and resume and can only run inside a coroutine.', 1),
  ('02800000-0000-4000-8000-000000000523', '02800000-0000-4000-8000-000000000324',
   'In Retrofit, what converts JSON responses into Kotlin objects?',
   'A converter factory such as GsonConverterFactory maps JSON to data classes.', 2),
  ('02800000-0000-4000-8000-000000000524', '02800000-0000-4000-8000-000000000324',
   'Which Retrofit annotation declares an HTTP GET request?',
   '@GET names the HTTP verb for the described endpoint.', 3),
  ('02800000-0000-4000-8000-000000000525', '02800000-0000-4000-8000-000000000328',
   'Why can Kotlin and Java code coexist in one Android project?',
   'Kotlin compiles to JVM bytecode and interoperates directly with Java.', 1),
  ('02800000-0000-4000-8000-000000000526', '02800000-0000-4000-8000-000000000328',
   'What is the recommended home for UI state that must survive rotation?',
   'A ViewModel outlives the Activity and survives configuration changes.', 2),
  ('02800000-0000-4000-8000-000000000527', '02800000-0000-4000-8000-000000000328',
   'Which Room component is validated against the schema at compile time?',
   'DAO query strings are checked by Room at compile time, catching typos early.', 3),
  ('02800000-0000-4000-8000-000000000528', '02800000-0000-4000-8000-000000000328',
   'Which coroutine dispatcher is tuned for network and database work?',
   'Dispatchers.IO is designed for blocking I/O like HTTP calls and disk access.', 4),
  ('02800000-0000-4000-8000-000000000529', '02800000-0000-4000-8000-000000000328',
   'Which Gradle task produces a debuggable, installable APK?',
   'assembleDebug builds the debug APK under app/build/outputs/apk.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): val
  ('02800000-0000-4000-8000-000000001001', '02800000-0000-4000-8000-000000000501', 'val', TRUE,  1),
  ('02800000-0000-4000-8000-000000001002', '02800000-0000-4000-8000-000000000501', 'var', FALSE, 2),
  ('02800000-0000-4000-8000-000000001003', '02800000-0000-4000-8000-000000000501', 'const', FALSE, 3),
  ('02800000-0000-4000-8000-000000001004', '02800000-0000-4000-8000-000000000501', 'static', FALSE, 4),
  -- Q1 (501)q2: Int literal
  ('02800000-0000-4000-8000-000000001005', '02800000-0000-4000-8000-000000000502', 'Long', FALSE, 1),
  ('02800000-0000-4000-8000-000000001006', '02800000-0000-4000-8000-000000000502', 'Double', FALSE, 2),
  ('02800000-0000-4000-8000-000000001007', '02800000-0000-4000-8000-000000000502', 'Int', TRUE,  3),
  ('02800000-0000-4000-8000-000000001008', '02800000-0000-4000-8000-000000000502', 'Float', FALSE, 4),
  -- Q1 (501)q3: when
  ('02800000-0000-4000-8000-000000001009', '02800000-0000-4000-8000-000000000503', 'if', FALSE, 1),
  ('02800000-0000-4000-8000-000000001010', '02800000-0000-4000-8000-000000000503', 'when', TRUE,  2),
  ('02800000-0000-4000-8000-000000001011', '02800000-0000-4000-8000-000000000503', 'switch', FALSE, 3),
  ('02800000-0000-4000-8000-000000001012', '02800000-0000-4000-8000-000000000503', 'match', FALSE, 4),
  -- Q2 (504): safe call
  ('02800000-0000-4000-8000-000000001013', '02800000-0000-4000-8000-000000000504', '?.', TRUE,  1),
  ('02800000-0000-4000-8000-000000001014', '02800000-0000-4000-8000-000000000504', '!!', FALSE, 2),
  ('02800000-0000-4000-8000-000000001015', '02800000-0000-4000-8000-000000000504', '?:', FALSE, 3),
  ('02800000-0000-4000-8000-000000001016', '02800000-0000-4000-8000-000000000504', '&', FALSE, 4),
  -- Q2 (504)q2: return
  ('02800000-0000-4000-8000-000000001017', '02800000-0000-4000-8000-000000000505', 'break', FALSE, 1),
  ('02800000-0000-4000-8000-000000001018', '02800000-0000-4000-8000-000000000505', 'continue', FALSE, 2),
  ('02800000-0000-4000-8000-000000001019', '02800000-0000-4000-8000-000000000505', 'return', TRUE,  3),
  ('02800000-0000-4000-8000-000000001020', '02800000-0000-4000-8000-000000000505', 'exit', FALSE, 4),
  -- Q2 (504)q3: lambda
  ('02800000-0000-4000-8000-000000001021', '02800000-0000-4000-8000-000000000506', 'An anonymous function value', TRUE,  1),
  ('02800000-0000-4000-8000-000000001022', '02800000-0000-4000-8000-000000000506', 'A named class method', FALSE, 2),
  ('02800000-0000-4000-8000-000000001023', '02800000-0000-4000-8000-000000000506', 'A loop construct', FALSE, 3),
  ('02800000-0000-4000-8000-000000001024', '02800000-0000-4000-8000-000000000506', 'A nullable type', FALSE, 4),
  -- Q3 (507): manifest
  ('02800000-0000-4000-8000-000000001025', '02800000-0000-4000-8000-000000000507', 'AndroidManifest.xml', TRUE,  1),
  ('02800000-0000-4000-8000-000000001026', '02800000-0000-4000-8000-000000000507', 'strings.xml', FALSE, 2),
  ('02800000-0000-4000-8000-000000001027', '02800000-0000-4000-8000-000000000507', 'activity_main.xml', FALSE, 3),
  ('02800000-0000-4000-8000-000000001028', '02800000-0000-4000-8000-000000000507', 'build.gradle.kts', FALSE, 4),
  -- Q3 (507)q2: app gradle
  ('02800000-0000-4000-8000-000000001029', '02800000-0000-4000-8000-000000000508', 'app/build.gradle.kts', TRUE,  1),
  ('02800000-0000-4000-8000-000000001030', '02800000-0000-4000-8000-000000000508', 'settings.gradle.kts', FALSE, 2),
  ('02800000-0000-4000-8000-000000001031', '02800000-0000-4000-8000-000000000508', 'gradle.properties', FALSE, 3),
  ('02800000-0000-4000-8000-000000001032', '02800000-0000-4000-8000-000000000508', 'local.properties', FALSE, 4),
  -- Q3 (507)q3: Kotlin DSL
  ('02800000-0000-4000-8000-000000001033', '02800000-0000-4000-8000-000000000509', 'Kotlin DSL', TRUE,  1),
  ('02800000-0000-4000-8000-000000001034', '02800000-0000-4000-8000-000000000509', 'Groovy DSL', FALSE, 2),
  ('02800000-0000-4000-8000-000000001035', '02800000-0000-4000-8000-000000000509', 'JSON config', FALSE, 3),
  ('02800000-0000-4000-8000-000000001036', '02800000-0000-4000-8000-000000000509', 'YAML config', FALSE, 4),
  -- Q4 (510): onStart
  ('02800000-0000-4000-8000-000000001037', '02800000-0000-4000-8000-000000000510', 'onCreate', FALSE, 1),
  ('02800000-0000-4000-8000-000000001038', '02800000-0000-4000-8000-000000000510', 'onStart', TRUE,  2),
  ('02800000-0000-4000-8000-000000001039', '02800000-0000-4000-8000-000000000510', 'onResume', FALSE, 3),
  ('02800000-0000-4000-8000-000000001040', '02800000-0000-4000-8000-000000000510', 'onPause', FALSE, 4),
  -- Q4 (510)q2: onStop
  ('02800000-0000-4000-8000-000000001041', '02800000-0000-4000-8000-000000000511', 'onStop', TRUE,  1),
  ('02800000-0000-4000-8000-000000001042', '02800000-0000-4000-8000-000000000511', 'onPause', FALSE, 2),
  ('02800000-0000-4000-8000-000000001043', '02800000-0000-4000-8000-000000000511', 'onDestroy', FALSE, 3),
  ('02800000-0000-4000-8000-000000001044', '02800000-0000-4000-8000-000000000511', 'onCreate', FALSE, 4),
  -- Q4 (510)q3: save state
  ('02800000-0000-4000-8000-000000001045', '02800000-0000-4000-8000-000000000512', 'Preserves transient state across configuration changes', TRUE,  1),
  ('02800000-0000-4000-8000-000000001046', '02800000-0000-4000-8000-000000000512', 'Deletes all local data', FALSE, 2),
  ('02800000-0000-4000-8000-000000001047', '02800000-0000-4000-8000-000000000512', 'Starts a new Activity', FALSE, 3),
  ('02800000-0000-4000-8000-000000001048', '02800000-0000-4000-8000-000000000512', 'Inflates the layout', FALSE, 4),
  -- Q5 (513): ConstraintLayout
  ('02800000-0000-4000-8000-000000001049', '02800000-0000-4000-8000-000000000513', 'ConstraintLayout', TRUE,  1),
  ('02800000-0000-4000-8000-000000001050', '02800000-0000-4000-8000-000000000513', 'ListView', FALSE, 2),
  ('02800000-0000-4000-8000-000000001051', '02800000-0000-4000-8000-000000000513', 'FrameLayout', FALSE, 3),
  ('02800000-0000-4000-8000-000000001052', '02800000-0000-4000-8000-000000000513', 'ScrollView', FALSE, 4),
  -- Q5 (513)q2: size attributes
  ('02800000-0000-4000-8000-000000001053', '02800000-0000-4000-8000-000000000514', 'layout_width and layout_height', TRUE,  1),
  ('02800000-0000-4000-8000-000000001054', '02800000-0000-4000-8000-000000000514', 'layout_margin and padding', FALSE, 2),
  ('02800000-0000-4000-8000-000000001055', '02800000-0000-4000-8000-000000000514', 'android:id and android:text', FALSE, 3),
  ('02800000-0000-4000-8000-000000001056', '02800000-0000-4000-8000-000000000514', 'gravity and weight', FALSE, 4),
  -- Q5 (513)q3: findViewById
  ('02800000-0000-4000-8000-000000001057', '02800000-0000-4000-8000-000000000515', 'findViewById', TRUE,  1),
  ('02800000-0000-4000-8000-000000001058', '02800000-0000-4000-8000-000000000515', 'getViewById', FALSE, 2),
  ('02800000-0000-4000-8000-000000001059', '02800000-0000-4000-8000-000000000515', 'locateView', FALSE, 3),
  ('02800000-0000-4000-8000-000000001060', '02800000-0000-4000-8000-000000000515', 'createView', FALSE, 4),
  -- Q6 (516): Intent
  ('02800000-0000-4000-8000-000000001061', '02800000-0000-4000-8000-000000000516', 'Intent', TRUE,  1),
  ('02800000-0000-4000-8000-000000001062', '02800000-0000-4000-8000-000000000516', 'Bundle', FALSE, 2),
  ('02800000-0000-4000-8000-000000001063', '02800000-0000-4000-8000-000000000516', 'Fragment', FALSE, 3),
  ('02800000-0000-4000-8000-000000001064', '02800000-0000-4000-8000-000000000516', 'Service', FALSE, 4),
  -- Q6 (516)q2: startActivity
  ('02800000-0000-4000-8000-000000001065', '02800000-0000-4000-8000-000000000517', 'startActivity(intent)', TRUE,  1),
  ('02800000-0000-4000-8000-000000001066', '02800000-0000-4000-8000-000000000517', 'startView(activity)', FALSE, 2),
  ('02800000-0000-4000-8000-000000001067', '02800000-0000-4000-8000-000000000517', 'launchScreen(intent)', FALSE, 3),
  ('02800000-0000-4000-8000-000000001068', '02800000-0000-4000-8000-000000000517', 'goToActivity(intent)', FALSE, 4),
  -- Q6 (516)q3: putExtra
  ('02800000-0000-4000-8000-000000001069', '02800000-0000-4000-8000-000000000518', 'putExtra(key, value)', TRUE,  1),
  ('02800000-0000-4000-8000-000000001070', '02800000-0000-4000-8000-000000000518', 'addExtra(key, value)', FALSE, 2),
  ('02800000-0000-4000-8000-000000001071', '02800000-0000-4000-8000-000000000518', 'setExtra(key, value)', FALSE, 3),
  ('02800000-0000-4000-8000-000000001072', '02800000-0000-4000-8000-000000000518', 'attachExtra(key, value)', FALSE, 4),
  -- Q7 (519): adapter
  ('02800000-0000-4000-8000-000000001073', '02800000-0000-4000-8000-000000000519', 'Adapter', TRUE,  1),
  ('02800000-0000-4000-8000-000000001074', '02800000-0000-4000-8000-000000000519', 'ViewHolder', FALSE, 2),
  ('02800000-0000-4000-8000-000000001075', '02800000-0000-4000-8000-000000000519', 'LayoutManager', FALSE, 3),
  ('02800000-0000-4000-8000-000000001076', '02800000-0000-4000-8000-000000000519', 'ItemDecorator', FALSE, 4),
  -- Q7 (519)q2: ViewHolder
  ('02800000-0000-4000-8000-000000001077', '02800000-0000-4000-8000-000000000520', 'ViewHolder', TRUE,  1),
  ('02800000-0000-4000-8000-000000001078', '02800000-0000-4000-8000-000000000520', 'RecyclerPool', FALSE, 2),
  ('02800000-0000-4000-8000-000000001079', '02800000-0000-4000-8000-000000000520', 'AdapterSource', FALSE, 3),
  ('02800000-0000-4000-8000-000000001080', '02800000-0000-4000-8000-000000000520', 'LayoutInflater', FALSE, 4),
  -- Q7 (519)q3: LinearLayoutManager
  ('02800000-0000-4000-8000-000000001081', '02800000-0000-4000-8000-000000000521', 'LinearLayoutManager', TRUE,  1),
  ('02800000-0000-4000-8000-000000001082', '02800000-0000-4000-8000-000000000521', 'GridLayoutManager', FALSE, 2),
  ('02800000-0000-4000-8000-000000001083', '02800000-0000-4000-8000-000000000521', 'ConstraintLayoutManager', FALSE, 3),
  ('02800000-0000-4000-8000-000000001084', '02800000-0000-4000-8000-000000000521', 'FrameLayoutManager', FALSE, 4),
  -- Q8 (522): suspend
  ('02800000-0000-4000-8000-000000001085', '02800000-0000-4000-8000-000000000522', 'suspend', TRUE,  1),
  ('02800000-0000-4000-8000-000000001086', '02800000-0000-4000-8000-000000000522', 'async', FALSE, 2),
  ('02800000-0000-4000-8000-000000001087', '02800000-0000-4000-8000-000000000522', 'await', FALSE, 3),
  ('02800000-0000-4000-8000-000000001088', '02800000-0000-4000-8000-000000000522', 'thread', FALSE, 4),
  -- Q8 (522)q2: converter
  ('02800000-0000-4000-8000-000000001089', '02800000-0000-4000-8000-000000000523', 'A JSON converter such as Gson', TRUE,  1),
  ('02800000-0000-4000-8000-000000001090', '02800000-0000-4000-8000-000000000523', 'A database driver', FALSE, 2),
  ('02800000-0000-4000-8000-000000001091', '02800000-0000-4000-8000-000000000523', 'A layout inflater', FALSE, 3),
  ('02800000-0000-4000-8000-000000001092', '02800000-0000-4000-8000-000000000523', 'A notification channel', FALSE, 4),
  -- Q8 (522)q3: @GET
  ('02800000-0000-4000-8000-000000001093', '02800000-0000-4000-8000-000000000524', '@GET', TRUE,  1),
  ('02800000-0000-4000-8000-000000001094', '02800000-0000-4000-8000-000000000524', '@POST', FALSE, 2),
  ('02800000-0000-4000-8000-000000001095', '02800000-0000-4000-8000-000000000524', '@DELETE', FALSE, 3),
  ('02800000-0000-4000-8000-000000001096', '02800000-0000-4000-8000-000000000524', '@PUT', FALSE, 4),
  -- Q9 (525): JVM bytecode
  ('02800000-0000-4000-8000-000000001097', '02800000-0000-4000-8000-000000000525', 'It compiles to JVM bytecode', TRUE,  1),
  ('02800000-0000-4000-8000-000000001098', '02800000-0000-4000-8000-000000000525', 'It is translated into XML', FALSE, 2),
  ('02800000-0000-4000-8000-000000001099', '02800000-0000-4000-8000-000000000525', 'It runs inside a web view', FALSE, 3),
  ('02800000-0000-4000-8000-000000001100', '02800000-0000-4000-8000-000000000525', 'It needs a separate runtime', FALSE, 4),
  -- Q9 (525)q2: ViewModel
  ('02800000-0000-4000-8000-000000001101', '02800000-0000-4000-8000-000000000526', 'A ViewModel', TRUE,  1),
  ('02800000-0000-4000-8000-000000001102', '02800000-0000-4000-8000-000000000526', 'The AndroidManifest', FALSE, 2),
  ('02800000-0000-4000-8000-000000001103', '02800000-0000-4000-8000-000000000526', 'A string resource', FALSE, 3),
  ('02800000-0000-4000-8000-000000001104', '02800000-0000-4000-8000-000000000526', 'An XML drawable', FALSE, 4),
  -- Q9 (525)q3: DAO
  ('02800000-0000-4000-8000-000000001105', '02800000-0000-4000-8000-000000000527', 'The DAO', TRUE,  1),
  ('02800000-0000-4000-8000-000000001106', '02800000-0000-4000-8000-000000000527', 'The manifest file', FALSE, 2),
  ('02800000-0000-4000-8000-000000001107', '02800000-0000-4000-8000-000000000527', 'The launcher icon', FALSE, 3),
  ('02800000-0000-4000-8000-000000001108', '02800000-0000-4000-8000-000000000527', 'The Gradle wrapper', FALSE, 4),
  -- Q9 (525)q4: Dispatchers.IO
  ('02800000-0000-4000-8000-000000001109', '02800000-0000-4000-8000-000000000528', 'Dispatchers.IO', TRUE,  1),
  ('02800000-0000-4000-8000-000000001110', '02800000-0000-4000-8000-000000000528', 'Dispatchers.Main', FALSE, 2),
  ('02800000-0000-4000-8000-000000001111', '02800000-0000-4000-8000-000000000528', 'Dispatchers.Default', FALSE, 3),
  ('02800000-0000-4000-8000-000000001112', '02800000-0000-4000-8000-000000000528', 'Dispatchers.Unconfined', FALSE, 4),
  -- Q9 (525)q5: assembleDebug
  ('02800000-0000-4000-8000-000000001113', '02800000-0000-4000-8000-000000000529', 'assembleDebug', TRUE,  1),
  ('02800000-0000-4000-8000-000000001114', '02800000-0000-4000-8000-000000000529', 'installRelease', FALSE, 2),
  ('02800000-0000-4000-8000-000000001115', '02800000-0000-4000-8000-000000000529', 'lintVital', FALSE, 3),
  ('02800000-0000-4000-8000-000000001116', '02800000-0000-4000-8000-000000000529', 'testProguard', FALSE, 4)
ON CONFLICT (id) DO NOTHING;
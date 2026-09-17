-- ============================================================================
-- SEED 010: Complete course — "React Native Mobile Apps"
-- ----------------------------------------------------------------------------
-- Instructor : Marcus Johnson    (10000000-0000-4000-8000-000000000002)
-- Category   : Mobile Devel.     (20000000-0000-4000-8000-000000000007)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Getting Started with React Native → C1 React Native & Expo Setup · C2 JSX & Core Components
--   M2 Styling & Layout                   → C3 StyleSheet & Layout Basics · C4 ScrollView, FlatList & Touchables
--   M3 State & Interaction                → C5 Props & State with useState · C6 Forms, TextInput & Events
--   M4 Navigation & Data                  → C7 Navigation with React Navigation · C8 Fetch, AsyncStorage & Permissions
--   M5 Capstone: Notes App                → C9 Project Setup & Planning · C10 Building & Polishing
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
  'A0000000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000002',
  '20000000-0000-4000-8000-000000000007',
  'React Native Mobile Apps',
  'react-native-mobile-apps',
  'Build native iOS and Android apps with JavaScript and React. Master Expo setup, JSX, core components, StyleSheet, and Flexbox, then manage state, navigate between screens, work with data and on-device storage, and finish a complete notes app.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  8
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('A0000000-0000-4000-8000-000000000011', 'A0000000-0000-4000-8000-000000000001', 'Set up Expo and build a complete React Native app from scratch.',                1),
  ('A0000000-0000-4000-8000-000000000012', 'A0000000-0000-4000-8000-000000000001', 'Style and lay out screens using StyleSheet, Flexbox, and core components.',      2),
  ('A0000000-0000-4000-8000-000000000013', 'A0000000-0000-4000-8000-000000000001', 'Manage component state and build interactive forms and touch handling.',         3),
  ('A0000000-0000-4000-8000-000000000014', 'A0000000-0000-4000-8000-000000000001', 'Navigate between screens and pass data with React Navigation.',                  4),
  ('A0000000-0000-4000-8000-000000000015', 'A0000000-0000-4000-8000-000000000001', 'Fetch remote data, persist data locally, and handle device permissions.',        5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('A0000000-0000-4000-8000-000000000101', 'A0000000-0000-4000-8000-000000000001', 1, 'Getting Started with React Native',     'Set up your environment and learn the foundations of React Native.',              'PUBLISHED'),
  ('A0000000-0000-4000-8000-000000000102', 'A0000000-0000-4000-8000-000000000001', 2, 'Styling & Layout',                      'Style components and build flexible layouts with StyleSheet and Flexbox.',        'PUBLISHED'),
  ('A0000000-0000-4000-8000-000000000103', 'A0000000-0000-4000-8000-000000000001', 3, 'State & Interaction',                   'Manage data with props and state, and collect user input.',                       'PUBLISHED'),
  ('A0000000-0000-4000-8000-000000000104', 'A0000000-0000-4000-8000-000000000001', 4, 'Navigation & Data',                     'Move between screens and work with remote and on-device data.',                   'PUBLISHED'),
  ('A0000000-0000-4000-8000-000000000105', 'A0000000-0000-4000-8000-000000000001', 5, 'Capstone: Notes App',                   'Plan, build, and polish a complete notes app from scratch.',                      'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('A0000000-0000-4000-8000-000000000201', 'A0000000-0000-4000-8000-000000000101', 1, 'React Native & Expo Setup',          'What React Native is and how to run your first Expo app.',                         'PUBLISHED'),
  ('A0000000-0000-4000-8000-000000000202', 'A0000000-0000-4000-8000-000000000101', 2, 'JSX & Core Components',              'Write JSX and build screens from React Native core components.',                   'PUBLISHED'),
  ('A0000000-0000-4000-8000-000000000203', 'A0000000-0000-4000-8000-000000000102', 1, 'StyleSheet & Layout Basics',         'Style components and arrange them with Flexbox.',                                 'PUBLISHED'),
  ('A0000000-0000-4000-8000-000000000204', 'A0000000-0000-4000-8000-000000000102', 2, 'ScrollView, FlatList & Touchables',  'Render scrolling content, efficient lists, and pressable UI.',                    'PUBLISHED'),
  ('A0000000-0000-4000-8000-000000000205', 'A0000000-0000-4000-8000-000000000103', 1, 'Props & State with useState',        'Pass data down through props and manage changing data with state.',                'PUBLISHED'),
  ('A0000000-0000-4000-8000-000000000206', 'A0000000-0000-4000-8000-000000000103', 2, 'Forms, TextInput & Events',          'Collect and validate user input with TextInput and events.',                       'PUBLISHED'),
  ('A0000000-0000-4000-8000-000000000207', 'A0000000-0000-4000-8000-000000000104', 1, 'Navigation with React Navigation',   'Set up stack and tab navigation and pass data between screens.',                   'PUBLISHED'),
  ('A0000000-0000-4000-8000-000000000208', 'A0000000-0000-4000-8000-000000000104', 2, 'Fetch, AsyncStorage & Permissions',  'Work with APIs, on-device storage, and device permissions.',                       'PUBLISHED'),
  ('A0000000-0000-4000-8000-000000000209', 'A0000000-0000-4000-8000-000000000105', 1, 'Project Setup & Planning',           'Scope the notes app and plan its features, screens, and data model.',              'PUBLISHED'),
  ('A0000000-0000-4000-8000-000000000210', 'A0000000-0000-4000-8000-000000000105', 2, 'Building & Polishing',               'Build the notes app flows and add final polish.',                                  'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: A0000000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('A0000000-0000-4000-8000-000000000301', 'A0000000-0000-4000-8000-000000000201', 1, 'What is React Native?',                'Understand what React Native is, how it renders native views, and why teams choose it.',  'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  6),
  ('A0000000-0000-4000-8000-000000000302', 'A0000000-0000-4000-8000-000000000201', 2, 'Setting Up Expo & Your First App',     'Install Expo, scaffold a project, and run it on a device or simulator.',                 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('A0000000-0000-4000-8000-000000000303', 'A0000000-0000-4000-8000-000000000201', 3, 'React Native & Expo Setup Quiz',       'Check your understanding of React Native and Expo.',                                    'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('A0000000-0000-4000-8000-000000000304', 'A0000000-0000-4000-8000-000000000202', 1, 'Understanding JSX',                    'Learn the JSX syntax that mixes markup and JavaScript.',                                'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('A0000000-0000-4000-8000-000000000305', 'A0000000-0000-4000-8000-000000000202', 2, 'Core Components & Your First Screen',  'Build your first screen from core components like View, Text, and Image.',              'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('A0000000-0000-4000-8000-000000000306', 'A0000000-0000-4000-8000-000000000202', 3, 'JSX & Core Components Quiz',           'Test your grasp of JSX and core components.',                                           'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('A0000000-0000-4000-8000-000000000307', 'A0000000-0000-4000-8000-000000000203', 1, 'Styling with StyleSheet',              'Style components using StyleSheet, inline styles, and style arrays.',                   'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('A0000000-0000-4000-8000-000000000308', 'A0000000-0000-4000-8000-000000000203', 2, 'Flexbox Layout Basics',                'Arrange components with flexDirection, justifyContent, and alignItems.',                'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('A0000000-0000-4000-8000-000000000309', 'A0000000-0000-4000-8000-000000000203', 3, 'Styling & Layout Quiz',                'Verify your styling and Flexbox knowledge.',                                            'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('A0000000-0000-4000-8000-000000000310', 'A0000000-0000-4000-8000-000000000204', 1, 'ScrollView & FlatList',                'Render scrolling content and efficient, large lists.',                                  'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('A0000000-0000-4000-8000-000000000311', 'A0000000-0000-4000-8000-000000000204', 2, 'Touchables & Handling Presses',        'Make your UI respond to taps with Pressable and touchable components.',                 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('A0000000-0000-4000-8000-000000000312', 'A0000000-0000-4000-8000-000000000204', 3, 'Lists & Touchables Quiz',              'Check your skills with lists, scrolling, and presses.',                                 'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('A0000000-0000-4000-8000-000000000313', 'A0000000-0000-4000-8000-000000000205', 1, 'Passing Props to Components',          'Pass data from a parent to child components with props.',                              'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('A0000000-0000-4000-8000-000000000314', 'A0000000-0000-4000-8000-000000000205', 2, 'State with useState',                  'Manage data that changes over time with the useState hook.',                            'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('A0000000-0000-4000-8000-000000000315', 'A0000000-0000-4000-8000-000000000205', 3, 'Props & State Quiz',                   'Test your props and state fundamentals.',                                               'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('A0000000-0000-4000-8000-000000000316', 'A0000000-0000-4000-8000-000000000206', 1, 'TextInput & Controlled Inputs',        'Collect user text with TextInput and keep inputs controlled by state.',                 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('A0000000-0000-4000-8000-000000000317', 'A0000000-0000-4000-8000-000000000206', 2, 'Forms, Events & Validation',           'Handle events, validate input, and build a working form.',                              'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('A0000000-0000-4000-8000-000000000318', 'A0000000-0000-4000-8000-000000000206', 3, 'Forms & Events Quiz',                  'Check your understanding of forms, inputs, and events.',                                'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('A0000000-0000-4000-8000-000000000319', 'A0000000-0000-4000-8000-000000000207', 1, 'Getting Started with React Navigation', 'Set up React Navigation and install a native stack navigator.',                        'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('A0000000-0000-4000-8000-000000000320', 'A0000000-0000-4000-8000-000000000207', 2, 'Stack, Tabs & Navigation Params',      'Move between screens, build tab bars, and pass data with params.',                      'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('A0000000-0000-4000-8000-000000000321', 'A0000000-0000-4000-8000-000000000207', 3, 'Navigation Quiz',                      'Test your navigation setup and params skills.',                                         'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('A0000000-0000-4000-8000-000000000322', 'A0000000-0000-4000-8000-000000000208', 1, 'Fetching Data with fetch',             'Fetch data from an API with loading and error states.',                                 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('A0000000-0000-4000-8000-000000000323', 'A0000000-0000-4000-8000-000000000208', 2, 'AsyncStorage & Device Permissions',    'Persist data locally and request device permissions.',                                  'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('A0000000-0000-4000-8000-000000000324', 'A0000000-0000-4000-8000-000000000208', 3, 'Data & Storage Quiz',                  'Verify your data fetching, storage, and permissions knowledge.',                        'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('A0000000-0000-4000-8000-000000000325', 'A0000000-0000-4000-8000-000000000209', 1, 'Planning the Notes App',               'Plan the capstone notes app: features, screens, and data model.',                       'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('A0000000-0000-4000-8000-000000000326', 'A0000000-0000-4000-8000-000000000210', 1, 'Building the Notes App',               'Build list, add, edit, and delete flows for the notes app.',                            'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('A0000000-0000-4000-8000-000000000327', 'A0000000-0000-4000-8000-000000000210', 2, 'Polishing & Finishing Touches',        'Add empty states, confirmation prompts, and final polish.',                             'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('A0000000-0000-4000-8000-000000000328', 'A0000000-0000-4000-8000-000000000210', 3, 'Final Assessment',                     'Prove what you learned across the whole course.',                                       'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: A0000000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  'A0000000-0000-4000-8000-000000000401',
  'A0000000-0000-4000-8000-000000000301',
  1,
  'What is React Native?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What is React Native?</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>What is React Native?</h1>
  <p>React Native is a <strong>framework for building native mobile apps</strong> for iOS and Android using JavaScript and React. Instead of rendering to web DOM elements, it renders to <em>real native views</em> — a <span class="ic">Text</span> becomes a native text label, a <span class="ic">ScrollView</span> becomes the platform scroll view.</p>
  <p>You write your UI once in JavaScript and it runs on both platforms, which is why React Native powers huge apps like Instagram, Shopify, and Discord.</p>
  <h2>How React Native works</h2>
  <ul>
    <li>Your JavaScript code runs on a <strong>JavaScript engine</strong> inside the app.</li>
    <li>The React Native runtime maps your components to <strong>native iOS and Android views</strong>.</li>
    <li>A "bridge" lets JavaScript talk to native code for camera, maps, push, and more.</li>
    <li>Shared logic, styles, and screens stay in one codebase for both stores.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Key idea</strong>
    <p>React Native is <em>not</em> a web page wrapped in a phone browser (a hybrid app). It uses the real native UI toolkit of each platform, so buttons, scrolling, and gestures feel exactly like a native app.</p>
  </div>
  <h2>How it compares to other approaches</h2>
  <table>
    <thead>
      <tr><th>Approach</th><th>UI Toolkit</th><th>Codebase</th><th>Store review</th></tr>
    </thead>
    <tbody>
      <tr><td>React Native</td><td>Native views</td><td>One JS codebase</td><td>One submission per store</td></tr>
      <tr><td>Native iOS (Swift)</td><td>iOS only</td><td>Swift only</td><td>iOS only</td></tr>
      <tr><td>Native Android (Kotlin)</td><td>Android only</td><td>Kotlin only</td><td>Android only</td></tr>
      <tr><td>Hybrid WebView</td><td>Web page</td><td>HTML + JS</td><td>Can feel less native</td></tr>
    </tbody>
  </table>
  <h2>Why teams choose it</h2>
  <ol>
    <li>Ship to Android and iOS at once, spending less time and money.</li>
    <li>Reuse your React and JavaScript skills instead of learning two native languages.</li>
    <li>Hot reload gives you <strong>instant feedback</strong> while developing.</li>
    <li>A huge ecosystem of libraries, plus an active community.</li>
  </ol>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>React Native today works with Expo, which removes almost all native setup friction. You do not need Xcode or Android Studio to start — your phone and a QR code are enough. You will see exactly that in the next lesson.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'A0000000-0000-4000-8000-000000000402',
  'A0000000-0000-4000-8000-000000000302',
  1,
  'Setting Up Expo & Your First App',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Setting Up Expo & Your First App</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Setting Up Expo & Your First App</h1>
  <p>Expo is the fastest way to start a React Native project. It bundles the tooling you need — the Metro bundler, a development server, and <strong>Expo Go</strong>, an app for your phone that runs your code instantly.</p>
  <p>You only need three things: <strong>Node.js</strong> (LTS), a <strong>code editor</strong> like VS Code, and the <strong>Expo Go</strong> app installed on your phone (scan its QR code later). No Xcode or Android Studio is required for this course.</p>
  <h2>1. Create the project</h2>
  <p>Open your terminal and run:</p>
  <pre class="code-block">npx create-expo-app@latest NotesApp
cd NotesApp</pre>
  <p>This scaffolds a complete Expo project. The file you will edit most is <span class="ic">App.js</span> — the entry point of your app.</p>
  <h2>2. Start the development server</h2>
  <pre class="code-block">npx expo start</pre>
  <p>A terminal UI opens with a QR code. Now:</p>
  <ul>
    <li>On a <strong>physical phone</strong>: open <strong>Expo Go</strong>, scan the QR code, and your app loads.</li>
    <li>On a <strong>simulator</strong>: press <span class="ic">i</span> for the iOS simulator or <span class="ic">a</span> for Android Emulator.</li>
  </ul>
  <h2>3. Make your first edit</h2>
  <p>Replace the contents of <span class="ic">App.js</span>:</p>
  <pre class="code-block">import { View, Text, StyleSheet } from 'react-native';

export default function App() {
  return (
    &lt;View style={styles.container}&gt;
      &lt;Text style={styles.title}&gt;Hello, Expo!&lt;/Text&gt;
    &lt;/View&gt;
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, alignItems: 'center', justifyContent: 'center' },
  title: { fontSize: 24, fontWeight: 'bold', color: '#6366f1' },
});</pre>
  <p>Save the file. Because hot reload is on, the screen updates almost instantly — no rebuild required.</p>
  <h2>Anatomy of an Expo project</h2>
  <table>
    <thead>
      <tr><th>File / folder</th><th>What it is</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">App.js</span></td><td>Root component rendered on launch</td></tr>
      <tr><td><span class="ic">app.json</span></td><td>App config: name, icon, splash screen</td></tr>
      <tr><td><span class="ic">assets/</span></td><td>Images, icons, and fonts used by the app</td></tr>
      <tr><td><span class="ic">package.json</span></td><td>Dependencies and npm scripts</td></tr>
      <tr><td><span class="ic">node_modules/</span></td><td>Installed libraries</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Note</strong>
    <p>Your phone and computer must be on the same Wi-Fi network for Expo Go to connect. If scanning fails, press <span class="ic">c</span> in the Expo terminal to switch to the tunnel option, which works over the internet.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Press <span class="ic">m</span> in the Expo terminal to toggle the developer menu, and <span class="ic">r</span> to reload the app. These shortcuts save a lot of time while you experiment.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'A0000000-0000-4000-8000-000000000403',
  'A0000000-0000-4000-8000-000000000304',
  1,
  'Understanding JSX',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Understanding JSX</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Understanding JSX</h1>
  <p>JSX is a <strong>JavaScript syntax extension</strong> that lets you write UI markup directly inside your JavaScript files. It looks like HTML but behaves like JavaScript — and every component in React Native returns JSX.</p>
  <pre class="code-block">import { View, Text } from 'react-native';

export default function Greeting() {
  return (
    &lt;View&gt;
      &lt;Text&gt;Hi there!&lt;/Text&gt;
    &lt;/View&gt;
  );
}</pre>
  <p>Notice the mix: <span class="ic">&lt;View&gt;</span> and <span class="ic">&lt;Text&gt;</span> look like HTML tags, but they are React Native components turned into native views at runtime.</p>
  <h2>The rules of JSX</h2>
  <ul>
    <li>A component must return a <strong>single root element</strong> — wrap siblings in one <span class="ic">&lt;View&gt;</span> or in a fragment <span class="ic">&lt;&gt;...&lt;/&gt;</span>.</li>
    <li>Attributes are <strong>camelCase</strong>: <span class="ic">backgroundColor</span>, <span class="ic">onPress</span>, not <span class="ic">background-color</span>.</li>
    <li>Every opening tag needs a closing tag, including self-closing ones like <span class="ic">&lt;Image /&gt;</span>.</li>
    <li>You can mix markup and logic because JSX compiles into plain function calls.</li>
  </ul>
  <h2>Embedding expressions with braces</h2>
  <p>The superpower of JSX is <strong>expressions</strong>. Wrap any JavaScript expression in single curly braces and it is evaluated inline:</p>
  <pre class="code-block">const name = 'Ada';
const score = 42;

return (
  &lt;View&gt;
    &lt;Text&gt;Welcome, {name}!&lt;/Text&gt;
    &lt;Text&gt;Score: {score * 2}&lt;/Text&gt;
    &lt;Text&gt;{score &gt; 40 ? 'Pass' : 'Try again'}&lt;/Text&gt;
  &lt;/View&gt;
);</pre>
  <ul>
    <li><span class="ic">{"{"}name{"}"}</span> prints a variable.</li>
    <li><span class="ic">{"{"}score * 2{"}"}</span> runs JavaScript — any expression works.</li>
    <li><span class="ic">{"{"}condition ? a : b{"}"}</span> uses a ternary to render different output.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Note</strong>
    <p>JSX is <em>not</em> a template string. Braces accept expressions, not statements. You cannot put an <span class="ic">if</span> inside braces — use a ternary, functions, or early returns instead.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Any valid JavaScript expression works in braces, including array maps. That is the trick behind rendering lists in React Native, which you will meet in the lists chapter.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'A0000000-0000-4000-8000-000000000404',
  'A0000000-0000-4000-8000-000000000305',
  1,
  'Core Components & Your First Screen',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Core Components & Your First Screen</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Core Components & Your First Screen</h1>
  <p>Every React Native screen is built from a small set of <strong>core components</strong> provided by the framework. Master these and you can build almost any UI.</p>
  <h2>The core building blocks</h2>
  <table>
    <thead>
      <tr><th>Component</th><th>Purpose</th><th>Renders as</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">&lt;View&gt;</span></td><td>Layout container (like a div)</td><td>Native UIView / ViewGroup</td></tr>
      <tr><td><span class="ic">&lt;Text&gt;</span></td><td>Displays styled text</td><td>Native label</td></tr>
      <tr><td><span class="ic">&lt;Image&gt;</span></td><td>Shows images</td><td>Native image view</td></tr>
      <tr><td><span class="ic">&lt;TextInput&gt;</span></td><td>Collects text input</td><td>Native text field</td></tr>
      <tr><td><span class="ic">&lt;ScrollView&gt;</span></td><td>Scrollable content</td><td>Native scroll view</td></tr>
      <tr><td><span class="ic">&lt;FlatList&gt;</span></td><td>Virtualized list of items</td><td>Native list</td></tr>
      <tr><td><span class="ic">&lt;Pressable&gt;</span></td><td>React to taps</td><td>Native touch area</td></tr>
    </tbody>
  </table>
  <h2>Build a welcome screen</h2>
  <p>Here is a complete screen using the core building blocks:</p>
  <pre class="code-block">import { View, Text, Image, StyleSheet } from 'react-native';

export default function WelcomeScreen() {
  return (
    &lt;View style={styles.container}&gt;
      &lt;Image
        source={{ uri: 'https://picsum.photos/200' }}
        style={styles.logo}
      /&gt;
      &lt;Text style={styles.title}&gt;Welcome to React Native&lt;/Text&gt;
      &lt;Text numberOfLines={2} style={styles.subtitle}&gt;
        One codebase. Two platforms. Infinite possibilities.
      &lt;/Text&gt;
    &lt;/View&gt;
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, alignItems: 'center', justifyContent: 'center', padding: 24 },
  logo: { width: 120, height: 120, borderRadius: 60, marginBottom: 16 },
  title: { fontSize: 26, fontWeight: 'bold', color: '#111827' },
  subtitle: { fontSize: 16, color: '#6b7280', textAlign: 'center' },
});</pre>
  <h2>Useful Text and Image props</h2>
  <ul>
    <li><span class="ic">numberOfLines</span> caps how many lines text may take.</li>
    <li><span class="ic">textAlign</span>, <span class="ic">fontWeight</span>, and <span class="ic">fontSize</span> style text content.</li>
    <li><span class="ic">source</span> takes an object — <span class="ic">{"{"} uri: '...' {"}"}</span> for remote URLs or <span class="ic">require(...)</span> for local assets.</li>
    <li><span class="ic">resizeMode</span> — like CSS <span class="ic">object-fit</span> — controls how an image fills its box.</li>
    <li><span class="ic">Accessibility props</span> like <span class="ic">accessibilityLabel</span> make your app screen-reader friendly.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Note</strong>
    <p>Only <span class="ic">&lt;Text&gt;</span> can contain styled text, and text can only live inside <span class="ic">&lt;Text&gt;</span> components — you cannot put plain strings directly inside a <span class="ic">&lt;View&gt;</span>.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Use <span class="ic">r</span> in the Expo terminal to reload and experiment: change the colors, add a border, try <span class="ic">resizeMode="cover"</span>. Fast iteration is the best way to learn.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'A0000000-0000-4000-8000-000000000405',
  'A0000000-0000-4000-8000-000000000307',
  1,
  'Styling with StyleSheet',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Styling with StyleSheet</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Styling with StyleSheet</h1>
  <p>In React Native you style with plain JavaScript objects, not CSS files. The recommended way is <span class="ic">StyleSheet.create</span>, which validates your styles and keeps them fast and reusable.</p>
  <pre class="code-block">import { View, Text, StyleSheet } from 'react-native';

export default function Card() {
  return (
    &lt;View style={styles.card}&gt;
      &lt;Text style={styles.title}&gt;Hello&lt;/Text&gt;
      &lt;Text style={styles.body}&gt;Styled with StyleSheet&lt;/Text&gt;
    &lt;/View&gt;
  );
}

const styles = StyleSheet.create({
  card: {
    backgroundColor: '#ffffff',
    padding: 20,
    borderRadius: 12,
    margin: 16,
    shadowColor: '#000',
    shadowOpacity: 0.1,
    shadowRadius: 6,
    elevation: 3,
  },
  title: { fontSize: 20, fontWeight: 'bold', color: '#111827' },
  body: { fontSize: 15, color: '#6b7280', marginTop: 4 },
});</pre>
  <h2>How styling differs from CSS</h2>
  <table>
    <thead>
      <tr><th>CSS</th><th>React Native</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">background-color</span></td><td><span class="ic">backgroundColor</span></td></tr>
      <tr><td><span class="ic">font-size</span></td><td><span class="ic">fontSize</span></td></tr>
      <tr><td><span class="ic">margin: 10px</span></td><td><span class="ic">margin: 10</span> — no units, numbers are density pixels</td></tr>
      <tr><td><span class="ic">.class { }</span></td><td>Plain object in <span class="ic">StyleSheet.create</span></td></tr>
      <tr><td><span class="ic">:hover</span></td><td>Press state styles (covered in the touchables lesson)</td></tr>
    </tbody>
  </table>
  <ul>
    <li>No CSS selectors or cascade — styles live in one object per component.</li>
    <li>Units are omitted: <span class="ic">padding: 12</span>, <span class="ic">width: 100</span>.</li>
    <li>Shadows need <span class="ic">elevation</span> on Android and <span class="ic">shadow*</span> props on iOS.</li>
  </ul>
  <h2>Inline styles and style arrays</h2>
  <p>Inline styles are fine for one-off tweaks; arrays let you merge base + conditional styles:</p>
  <pre class="code-block">&lt;Text style={[styles.base, isActive &amp;&amp; styles.active]}&gt;
  Tap me
&lt;/Text&gt;

const styles = StyleSheet.create({
  base: { fontSize: 16, color: '#6b7280' },
  active: { color: '#4f46e5', fontWeight: 'bold' },
});</pre>
  <p>If <span class="ic">isActive</span> is true, the second style object is applied on top of the first — a clean pattern for buttons, tab bars, and list items.</p>
  <div class="callout callout-info">
    <strong>Why StyleSheet?</strong>
    <ul>
      <li><strong>Validation</strong> — typo'd props raise errors during development.</li>
      <li><strong>Performance</strong> — IDs are passed to native code once, not on every render.</li>
      <li><strong>Cleaner code</strong> — your JSX stays readable and style objects are reusable.</li>
    </ul>
  </div>
</div>
</body>
</html>
$html$
),
(
  'A0000000-0000-4000-8000-000000000406',
  'A0000000-0000-4000-8000-000000000308',
  1,
  'Flexbox Layout Basics',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Flexbox Layout Basics</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Flexbox Layout Basics</h1>
  <p>Every screen in React Native is laid out with <strong>Flexbox</strong>. Unlike CSS on the web, flexbox is the <em>default</em> — by default children stack in a <strong>column</strong> (top to bottom).</p>
  <h2>The four props you need daily</h2>
  <table>
    <thead>
      <tr><th>Prop</th><th>What it does</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">flexDirection</span></td><td>Main axis: <span class="ic">column</span> (default) or <span class="ic">row</span></td></tr>
      <tr><td><span class="ic">justifyContent</span></td><td>Align children along the <strong>main</strong> axis</td></tr>
      <tr><td><span class="ic">alignItems</span></td><td>Align children along the <strong>cross</strong> axis</td></tr>
      <tr><td><span class="ic">flex</span></td><td>How much free space a child takes; <span class="ic">flex: 1</span> fills available space</td></tr>
    </tbody>
  </table>
  <h2>Center content, the classic pattern</h2>
  <pre class="code-block">import { View, Text, StyleSheet } from 'react-native';

export default function CenteredScreen() {
  return (
    &lt;View style={styles.container}&gt;
      &lt;Text&gt;This is centered&lt;/Text&gt;
    &lt;/View&gt;
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center', // main axis (column) = vertical
    alignItems: 'center',     // cross axis (column)  = horizontal
    backgroundColor: '#f9fafb',
  },
});</pre>
  <p>Set <span class="ic">flexDirection: 'row'</span> and the same two props flip: children line up horizontally and <span class="ic">justifyContent</span> now controls horizontal spacing.</p>
  <h2>Spreading rows with space-between</h2>
  <pre class="code-block">const styles = StyleSheet.create({
  row: {
    flexDirection: 'row',
    justifyContent: 'space-between', // first left, last right
    alignItems: 'center',
    paddingHorizontal: 16,
  },
});</pre>
  <p>This single pattern builds toolbars, headers, and price rows in real apps.</p>
  <h2>Growing children with flex</h2>
  <pre class="code-block">&lt;View style={{ flex: 1, flexDirection: 'row' }}&gt;
  &lt;View style={{ flex: 1, backgroundColor: '#c7d2fe' }} /&gt;
  &lt;View style={{ flex: 2, backgroundColor: '#a5b4fc' }} /&gt;
&lt;/View&gt;</pre>
  <p>The two inner views fill the row in a <strong>1 : 2 ratio</strong>. A parent with <span class="ic">flex: 1</span> fills the whole screen.</p>
  <div class="callout callout-info">
    <strong>Watch out</strong>
    <p><span class="ic">alignItems</span> and <span class="ic">justifyContent</span> depend on <span class="ic">flexDirection</span>. With a row, main = horizontal; with a column, main = vertical. Get this one wrong and your UI flips.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>The <span class="ic">gap</span> style prop (<span class="ic">gap: 12</span>) adds spacing between all flex children without messing with margins. It is well supported in React Native and makes grids much simpler.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'A0000000-0000-4000-8000-000000000407',
  'A0000000-0000-4000-8000-000000000310',
  1,
  'ScrollView & FlatList',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ScrollView & FlatList</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>ScrollView & FlatList</h1>
  <p>Content often outgrows the screen. Use <span class="ic">ScrollView</span> when you have a <strong>fixed, small set</strong> of children, and <span class="ic">FlatList</span> when you have <strong>many rows from data</strong>.</p>
  <h2>ScrollView — for mixed content</h2>
  <pre class="code-block">import { ScrollView, View, Text, StyleSheet } from 'react-native';

export default function Profile() {
  return (
    &lt;ScrollView style={styles.page}&gt;
      &lt;Text style={styles.title}&gt;About me&lt;/Text&gt;
      &lt;View style={styles.card}&gt;...intro card...&lt;/View&gt;
      &lt;View style={styles.card}&gt;...skills card...&lt;/View&gt;
      &lt;View style={styles.card}&gt;...projects card...&lt;/View&gt;
    &lt;/ScrollView&gt;
  );
}</pre>
  <p>ScrollView renders <strong>all children at once</strong>, which is perfect for short pages but slow for thousands of rows.</p>
  <h2>FlatList — for data-driven lists</h2>
  <pre class="code-block">import { FlatList, View, Text, StyleSheet } from 'react-native';

const todos = [
  { id: '1', text: 'Learn JSX' },
  { id: '2', text: 'Style a screen' },
  { id: '3', text: 'Build a list' },
];

export default function TodoList() {
  return (
    &lt;FlatList
      data={todos}
      keyExtractor={(item) =&gt; item.id}
      renderItem={({ item }) =&gt; (
        &lt;View style={styles.row}&gt;
          &lt;Text&gt;{item.text}&lt;/Text&gt;
        &lt;/View&gt;
      )}
    /&gt;
  );
}</pre>
  <p>FlatList only renders the rows visible on screen (a technique called <strong>virtualization</strong>), so it stays fast with hundreds or thousands of items.</p>
  <h2>When to use which</h2>
  <table>
    <thead>
      <tr><th>ScrollView</th><th>FlatList</th></tr>
    </thead>
    <tbody>
      <tr><td>Fixed, mixed content</td><td>Repeated rows from an array</td></tr>
      <tr><td>Few children</td><td>Potentially many items</td></tr>
      <tr><td>Simple nesting</td><td>Built-in separation, headers, and footers</td></tr>
      <tr><td>No keyExtractor needed</td><td>Needs unique <span class="ic">keyExtractor</span></td></tr>
    </tbody>
  </table>
  <h2>Useful FlatList props</h2>
  <ul>
    <li><span class="ic">ListHeaderComponent</span> / <span class="ic">ListFooterComponent</span> — render fixed headers and footers.</li>
    <li><span class="ic">ItemSeparatorComponent</span> — renders a divider between rows.</li>
    <li><span class="ic">contentContainerStyle</span> — styles the scroll wrapper, handy for centering an empty list.</li>
    <li><span class="ic">refreshControl</span> — enables pull-to-refresh.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Keys matter</strong>
    <p>Never index-lists without a stable id if items can change. Use <span class="ic">keyExtractor</span> with a unique field so React can track rows correctly when data updates.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'A0000000-0000-4000-8000-000000000408',
  'A0000000-0000-4000-8000-000000000311',
  1,
  'Touchables & Handling Presses',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Touchables & Handling Presses</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Touchables & Handling Presses</h1>
  <p>Almost everything in a mobile app responds to a tap — buttons, list rows, cards. React Native gives you <span class="ic">Pressable</span>, the modern, flexible primitive, plus the older convenient <span class="ic">TouchableOpacity</span> and <span class="ic">TouchableHighlight</span>.</p>
  <h2>Pressable — full control</h2>
  <pre class="code-block">import { Pressable, Text, StyleSheet } from 'react-native';

export default function Button({ label, onPress }) {
  return (
    &lt;Pressable
      onPress={onPress}
      style={({ pressed }) =&gt; [
        styles.button,
        pressed &amp;&amp; styles.pressed,
      ]}
    &gt;
      &lt;Text style={styles.label}&gt;{label}&lt;/Text&gt;
    &lt;/Pressable&gt;
  );
}

const styles = StyleSheet.create({
  button: { backgroundColor: '#4f46e5', paddingVertical: 14, borderRadius: 10, alignItems: 'center' },
  pressed: { opacity: 0.7, transform: [{ scale: 0.98 }] },
  label: { color: '#ffffff', fontWeight: '600', fontSize: 16 },
});</pre>
  <p>The <span class="ic">style</span> prop accepts a <strong>function</strong> that receives whether the view is currently pressed — perfect for instant visual feedback.</p>
  <h2>What onPress actually receives</h2>
  <pre class="code-block">&lt;Pressable
  onPress={(event) =&gt; console.log('Pressed!', event.nativeEvent)}
  onPressIn={() =&gt; console.log('finger down')}
  onPressOut={() =&gt; console.log('finger up')}
  onLongPress={() =&gt; console.log('held')}
&gt;
  &lt;Text&gt;Hold me&lt;/Text&gt;
&lt;/Pressable&gt;</pre>
  <ul>
    <li><span class="ic">onPress</span> — fires when the press is released inside the view.</li>
    <li><span class="ic">onPressIn</span> / <span class="ic">onPressOut</span> — finger down / up, good for ripple states.</li>
    <li><span class="ic">onLongPress</span> — fires after holding for a moment.</li>
  </ul>
  <h2>The Touchable family — quick wins</h2>
  <table>
    <thead>
      <tr><th>Component</th><th>Feedback</th><th>Good for</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">Pressable</span></td><td>You control everything</td><td>Custom buttons, cards</td></tr>
      <tr><td><span class="ic">TouchableOpacity</span></td><td>Fades the whole view</td><td>Toolbar icons, list actions</td></tr>
      <tr><td><span class="ic">TouchableHighlight</span></td><td>Underlay color flash</td><td>Rows and cells</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Note</strong>
    <p>There is no real <span class="ic">Button</span> with rich styling in React Native. The built-in <span class="ic">Button</span> is plain and hard to theme — teams build their own pressable button component once and reuse it.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Accessibility</strong>
    <p>Add <span class="ic">accessibilityRole="button"</span> and <span class="ic">accessibilityLabel="Close settings"</span> to your Pressables so screen readers announce them correctly.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'A0000000-0000-4000-8000-000000000409',
  'A0000000-0000-4000-8000-000000000313',
  1,
  'Passing Props to Components',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Passing Props to Components</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Passing Props to Components</h1>
  <p><strong>Props</strong> (short for properties) are the inputs to a component. They flow <em>downward</em> from parent to child and are read-only — a component can never change its own props, it only renders them.</p>
  <pre class="code-block">import { View, Text, Image, StyleSheet } from 'react-native';

function Avatar({ uri, size }) {
  return (
    &lt;View style={styles.wrap}&gt;
      &lt;Image source={{ uri }} style={{ width: size, height: size, borderRadius: size / 2 }} /&gt;
    &lt;/View&gt;
  );
}

export default function Profile() {
  return (
    &lt;View style={styles.row}&gt;
      &lt;Avatar uri="https://picsum.photos/120" size={48} /&gt;
      &lt;Text&gt;Ada Lovelace&lt;/Text&gt;
    &lt;/View&gt;
  );
}</pre>
  <h2>Reading props with destructuring</h2>
  <p>Props arrive as a single object. Destructuring makes them easier to read and self-documents them:</p>
  <pre class="code-block">function Card({ title, subtitle, icon }) {
  // Cleaner than: function Card(props) { props.title ...
  return (
    &lt;View style={styles.card}&gt;
      &lt;Text style={styles.icon}&gt;{icon}&lt;/Text&gt;
      &lt;Text style={styles.title}&gt;{title}&lt;/Text&gt;
      &lt;Text&gt;{subtitle}&lt;/Text&gt;
    &lt;/View&gt;
  );
}</pre>
  <h2>Props can be any value</h2>
  <table>
    <thead>
      <tr><th>Prop type</th><th>Example</th></tr>
    </thead>
    <tbody>
      <tr><td>String</td><td><span class="ic">name="Ada"</span></td></tr>
      <tr><td>Number</td><td><span class="ic">size={48}</span></td></tr>
      <tr><td>Boolean</td><td><span class="ic">isPrimary={true}</span></td></tr>
      <tr><td>Array / Object</td><td><span class="ic">items={['a', 'b']}</span></td></tr>
      <tr><td>Function</td><td><span class="ic">onPress={handlePress}</span></td></tr>
      <tr><td>Component</td><td><span class="ic">header={&lt;Header /&gt;}</span></td></tr>
    </tbody>
  </table>
  <h2>The children prop</h2>
  <p>Whatever sits between the opening and closing tags becomes the special <span class="ic">children</span> prop:</p>
  <pre class="code-block">function Card({ children }) {
  return &lt;View style={styles.card}&gt;{children}&lt;/View&gt;;
}

// Usage — arbitrary content nested inside:
&lt;Card&gt;
  &lt;Text&gt;Any JSX can live here&lt;/Text&gt;
&lt;/Card&gt;</pre>
  <div class="callout callout-info">
    <strong>One rule</strong>
    <p>Props flow only downward and are <em>never</em> mutated by the child. If a child needs different data, the parent passes new props — that is one-way data flow, and it keeps your app predictable.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Give props sensible defaults so components work without configuration: <span class="ic">function Avatar({ uri, size = 48 }) {...}</span>. Defaults make shared components painless to reuse.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'A0000000-0000-4000-8000-000000000410',
  'A0000000-0000-4000-8000-000000000314',
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
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>State with useState</h1>
  <p>Props are static inputs; <strong>state</strong> is data that <em>changes over time</em>. The <span class="ic">useState</span> hook lets a component remember values between renders and re-render whenever they change.</p>
  <pre class="code-block">import { View, Text, Pressable, StyleSheet } from 'react-native';
import { useState } from 'react';

export default function Counter() {
  const [count, setCount] = useState(0);

  return (
    &lt;View style={styles.container}&gt;
      &lt;Text style={styles.value}&gt;{count}&lt;/Text&gt;
      &lt;Pressable style={styles.button} onPress={() =&gt; setCount(count + 1)}&gt;
        &lt;Text style={styles.label}&gt;+1&lt;/Text&gt;
      &lt;/Pressable&gt;
    &lt;/View&gt;
  );
}</pre>
  <h2>How it reads</h2>
  <ul>
    <li><span class="ic">useState(0)</span> creates a state slot, initialised to 0.</li>
    <li>It returns an array of two: the <strong>current value</strong> (<span class="ic">count</span>) and a <strong>setter</strong> (<span class="ic">setCount</span>).</li>
    <li>Calling <span class="ic">setCount(next)</span> updates the value and schedules a <strong>re-render</strong>.</li>
    <li>The UI always reflects the newest state — React re-runs the component with the fresh value.</li>
  </ul>
  <h2>Updating based on previous value</h2>
  <p>When the next state depends on the last one (toggles, increments), pass a function to the setter:</p>
  <pre class="code-block">const [liked, setLiked] = useState(false);
const toggleLike = () =&gt; setLiked((prev) =&gt; !prev);

const [cart, setCart] = useState([]);
const addItem = (item) =&gt; setCart((prev) =&gt; [...prev, item]);</pre>
  <p>The function receives the <em>latest</em> state, which avoids stale-value bugs when updates happen in quick succession.</p>
  <h2>Rules of hooks</h2>
  <table>
    <thead>
      <tr><th>Do</th><th>Don't</th></tr>
    </thead>
    <tbody>
      <tr><td>Call hooks at the top level of a component</td><td>Call them inside loops or conditions</td></tr>
      <tr><td>Call hooks only from React components or custom hooks</td><td>Call them from plain functions or callbacks</td></tr>
      <tr><td>Keep the order of hook calls stable</td><td>Reorder hooks between renders</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Note</strong>
    <p>When you update an object or array, build a <em>new</em> value (<span class="ic">[...prev, item]</span>) instead of mutating the old one. React relies on identity to know what changed.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Add state one concern at a time: a text input needs just one <span class="ic">useState</span>, a form needs one per field. Keep components small and it stays easy to reason about.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'A0000000-0000-4000-8000-000000000411',
  'A0000000-0000-4000-8000-000000000316',
  1,
  'TextInput & Controlled Inputs',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TextInput & Controlled Inputs</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>TextInput & Controlled Inputs</h1>
  <p><span class="ic">TextInput</span> is the core component for collecting text — usernames, search boxes, note titles, and more. The idiomatic React Native pattern is the <strong>controlled input</strong>: the value lives in state, and each keystroke updates it.</p>
  <h2>A controlled input</h2>
  <pre class="code-block">import { View, TextInput, Text, StyleSheet, useState } from 'react-native';

export default function LoginField() {
  const [email, setEmail] = useState('');

  return (
    &lt;View&gt;
      &lt;TextInput
        style={styles.input}
        value={email}
        onChangeText={setEmail}
        placeholder="you@example.com"
        keyboardType="email-address"
        autoCapitalize="none"
      /&gt;
      &lt;Text&gt;You typed: {email}&lt;/Text&gt;
    &lt;/View&gt;
  );
}</pre>
  <ul>
    <li><span class="ic">value</span> — the displayed text, read from state.</li>
    <li><span class="ic">onChangeText</span> — called with the new string on every change; here it writes straight into state.</li>
    <li><span class="ic">placeholder</span> — hint text shown when empty.</li>
    <li><span class="ic">keyboardType</span> — <span class="ic">email-address</span>, <span class="ic">numeric</span>, <span class="ic">phone-pad</span>, and more.</li>
  </ul>
  <h2>Relevant TextInput props</h2>
  <table>
    <thead>
      <tr><th>Prop</th><th>What it does</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">secureTextEntry</span></td><td>Masks characters — use for passwords</td></tr>
      <tr><td><span class="ic">multiline</span></td><td>Turns it into a multi-line text area</td></tr>
      <tr><td><span class="ic">maxLength</span></td><td>Limits character count</td></tr>
      <tr><td><span class="ic">editable</span></td><td>Disables editing while keeping the value visible</td></tr>
      <tr><td><span class="ic">returnKeyType</span></td><td>Labels the keyboard key: <span class="ic">done</span>, <span class="ic">next</span>, <span class="ic">search</span></td></tr>
      <tr><td><span class="ic">onSubmitEditing</span></td><td>Fires when the user presses the return key</td></tr>
    </tbody>
  </table>
  <h2>Multiline and password inputs</h2>
  <pre class="code-block">&lt;TextInput
  style={[styles.input, styles.area]}
  value={body}
  onChangeText={setBody}
  multiline
  numberOfLines={4}
/&gt;

&lt;TextInput
  style={styles.input}
  value={password}
  onChangeText={setPassword}
  secureTextEntry
  placeholder="Password"
/&gt;</pre>
  <div class="callout callout-info">
    <strong>Keyboard nested in screens?</strong>
    <p>When a form sits low on the screen, the keyboard can cover it. Wrap scrollable content in <span class="ic">KeyboardAvoidingView</span> (with <span class="ic">behavior={Platform.OS === 'ios' ? 'padding' : 'height'}</span>) so inputs stay visible — you will see this in the forms lesson.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p><span class="ic">autoCapitalize="none"</span> and <span class="ic">autoCorrect={false}</span> prevent keyboards from mangling emails or codes. Small quality-of-life props, big win.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'A0000000-0000-4000-8000-000000000412',
  'A0000000-0000-4000-8000-000000000317',
  1,
  'Forms, Events & Validation',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Forms, Events & Validation</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Forms, Events & Validation</h1>
  <p>A form combines several controlled inputs with handlers that validate the data and act on submit. In React Native there is no native <span class="ic">&lt;form&gt;</span> — you build state, bind inputs, and call a handler.</p>
  <h2>A complete login form</h2>
  <pre class="code-block">import { View, TextInput, Pressable, Text, StyleSheet, Alert } from 'react-native';
import { useState } from 'react';

export default function LoginForm() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');

  const validate = () =&gt; {
    if (!email.includes('@')) return 'Enter a valid email';
    if (password.length &lt; 6) return 'Password must be at least 6 characters';
    return null;
  };

  const handleSubmit = () =&gt; {
    const problem = validate();
    if (problem) {
      setError(problem);
      return;
    }
    Alert.alert('Welcome back', 'Login submitted successfully');
  };

  return (
    &lt;View style={styles.form}&gt;
      &lt;TextInput style={styles.input} value={email} onChangeText={setEmail}
        placeholder="Email" keyboardType="email-address" autoCapitalize="none" /&gt;
      &lt;TextInput style={styles.input} value={password} onChangeText={setPassword}
        placeholder="Password" secureTextEntry /&gt;
      {error !== '' &amp;&amp; &lt;Text style={styles.error}&gt;{error}&lt;/Text&gt;}
      &lt;Pressable style={styles.button} onPress={handleSubmit}&gt;
        &lt;Text style={styles.buttonText}&gt;Log in&lt;/Text&gt;
      &lt;/Pressable&gt;
    &lt;/View&gt;
  );
}</pre>
  <h2>Keyboard choreography</h2>
  <ul>
    <li><span class="ic">onSubmitEditing</span> on the email field — move focus to the next input with a ref, or submit directly.</li>
    <li><span class="ic">returnKeyType="next"</span> on the first field, <span class="ic">returnKeyType="done"</span> on the last.</li>
    <li><span class="ic">blurOnSubmit</span> — dismiss the keyboard after pressing return.</li>
    <li>Wrap the screen in <span class="ic">KeyboardAvoidingView</span> so inputs never hide behind the keyboard.</li>
  </ul>
  <pre class="code-block">import { KeyboardAvoidingView, Platform } from 'react-native';

&lt;KeyboardAvoidingView
  style={{ flex: 1 }}
  behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
&gt;
  ...form...
&lt;/KeyboardAvoidingView&gt;</pre>
  <div class="callout callout-info">
    <strong>Validation strategy</strong>
    <p>Keep validation pure: a function that takes the field values and returns an error string or <span class="ic">null</span>. It is easy to test, easy to reuse, and keeps the submit handler short.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Use <span class="ic">Alert.alert</span> for short confirmations during development. For production-quality apps, render error text under the offending field instead — it is far more accessible.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'A0000000-0000-4000-8000-000000000413',
  'A0000000-0000-4000-8000-000000000319',
  1,
  'Getting Started with React Navigation',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Getting Started with React Navigation</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Getting Started with React Navigation</h1>
  <p>"Navigation" is how a user moves between screens, and <strong>React Navigation</strong> is the de-facto standard library for it. It gives you native-feeling stacks, tab bars, material views, and the ability to pass data between screens.</p>
  <h2>Install it</h2>
  <p>In an Expo project, install the core package and the navigators you need:</p>
  <pre class="code-block">npx expo install @react-navigation/native @react-navigation/native-stack @react-navigation/bottom-tabs react-native-screens react-native-safe-area-context</pre>
  <p>Expo installs compatible versions automatically — do not mix <span class="ic">npm install</span> for these packages with a managed Expo project.</p>
  <h2>The three pieces</h2>
  <table>
    <thead>
      <tr><th>Piece</th><th>Role</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">&lt;NavigationContainer&gt;</span></td><td>Owns the navigation state and theme; wrap the whole app</td></tr>
      <tr><td><span class="ic">Navigator</span></td><td>Defines navigation behaviour — <span class="ic">Stack</span>, <span class="ic">Tabs</span>, <span class="ic">Drawer</span></td></tr>
      <tr><td><span class="ic">&lt;Screen&gt;</span></td><td>Registers a component as a route in the navigator</td></tr>
    </tbody>
  </table>
  <h2>Minimal stack setup</h2>
  <pre class="code-block">import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';

import HomeScreen from './screens/HomeScreen';
import DetailsScreen from './screens/DetailsScreen';

const Stack = createNativeStackNavigator();

export default function App() {
  return (
    &lt;NavigationContainer&gt;
      &lt;Stack.Navigator initialRouteName="Home"&gt;
        &lt;Stack.Screen name="Home" component={HomeScreen} /&gt;
        &lt;Stack.Screen name="Details" component={DetailsScreen} /&gt;
      &lt;/Stack.Navigator&gt;
    &lt;/NavigationContainer&gt;
  );
}</pre>
  <p>Every registered screen receives two special props: <span class="ic">navigation</span> (how to move) and <span class="ic">route</span> (the data it was opened with).</p>
  <div class="callout callout-info">
    <strong>Note</strong>
    <p>Screens created by a navigator get navigation props automatically. Do not pass them manually — the navigator does it for you.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Keep screens in a <span class="ic">screens/</span> folder and components in <span class="ic">components/</span>. A clear folder layout makes a multi-screen app far easier to navigate in the editor.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'A0000000-0000-4000-8000-000000000414',
  'A0000000-0000-4000-8000-000000000320',
  1,
  'Stack, Tabs & Navigation Params',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Stack, Tabs & Navigation Params</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Stack, Tabs & Navigation Params</h1>
  <p>Two navigators cover most apps: a <strong>native stack</strong> for push-and-pop navigation and a <strong>bottom tab bar</strong> for switching between top-level sections. You also frequently need to <em>send data</em> to the screen you open.</p>
  <h2>Stack navigator — back and forth</h2>
  <pre class="code-block">import { createNativeStackNavigator } from '@react-navigation/native-stack';

const Stack = createNativeStackNavigator();

function HomeScreen({ navigation }) {
  return (
    &lt;Pressable onPress={() =&gt; navigation.navigate('Details', { id: 1 })}&gt;
      &lt;Text&gt;Open item 1&lt;/Text&gt;
    &lt;/Pressable&gt;
  );
}

function DetailsScreen({ navigation, route }) {
  const { id } = route.params; // &lt;- data sent from Home
  return &lt;Text&gt;Showing item #{id}&lt;/Text&gt;;
}</pre>
  <ul>
    <li><span class="ic">navigation.navigate('Details', { id: 1 })</span> pushes a new screen and carries params.</li>
    <li><span class="ic">route.params</span> exposes those params to the target screen.</li>
    <li><span class="ic">navigation.goBack()</span> pops back to the previous screen.</li>
  </ul>
  <h2>Bottom tabs — top-level sections</h2>
  <p>Tabs keep multiple sections alive so switching feels instant — perfect for a notes list plus a settings screen:</p>
  <pre class="code-block">import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';

const Tab = createBottomTabNavigator();

export default function AppTabs() {
  return (
    &lt;Tab.Navigator screenOptions={{ headerShown: true }}&gt;
      &lt;Tab.Screen name="Notes" component={NotesScreen} /&gt;
      &lt;Tab.Screen name="Settings" component={SettingsScreen} /&gt;
    &lt;/Tab.Navigator&gt;
  );
}</pre>
  <h2>Combining stack inside tabs</h2>
  <p>Real apps nest them: tabs host the sections, and each tab contains its own stack for detail screens. A tab's <span class="ic">name</span> gives each screen a path to navigate to, and passes data through stack params.</p>
  <div class="callout callout-info">
    <strong>Params are serialisable</strong>
    <p>Navigation params should hold simple data — strings, numbers, small ids. Put heavyweight objects in state or a store, not in navigation params.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Pass full navigation-agnostic props to screens and read only <span class="ic">navigation</span> / <span class="ic">route</span> at the boundary. It keeps your screens reusable and testable.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'A0000000-0000-4000-8000-000000000415',
  'A0000000-0000-4000-8000-000000000322',
  1,
  'Fetching Data with fetch',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Fetching Data with fetch</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Fetching Data with fetch</h1>
  <p><span class="ic">fetch</span> is the standard Web API for HTTP requests, and it works out of the box in React Native. Pair it with <span class="ic">useState</span> and <span class="ic">useEffect</span> to load data when a screen appears.</p>
  <h2>The core pattern</h2>
  <pre class="code-block">import { useEffect, useState } from 'react';

const [data, setData] = useState(null);
const [loading, setLoading] = useState(true);
const [error, setError] = useState(null);

useEffect(() =&gt; {
  async function load() {
    try {
      const res = await fetch('https://jsonplaceholder.typicode.com/todos/1');
      if (!res.ok) throw new Error('Request failed');
      const json = await res.json();
      setData(json);
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  }
  load();
}, []);</pre>
  <ul>
    <li><span class="ic">useEffect(..., [])</span> runs once after the first render.</li>
    <li><span class="ic">await fetch(url)</span> performs the request; <span class="ic">res.ok</span> is false for HTTP errors.</li>
    <li><span class="ic">res.json()</span> parses the response body into a JavaScript object.</li>
    <li>Three pieces of state drive the UI: <span class="ic">data</span>, <span class="ic">loading</span>, <span class="ic">error</span>.</li>
  </ul>
  <h2>Render each state</h2>
  <pre class="code-block">if (loading) return &lt;Text&gt;Loading...&lt;/Text&gt;;
if (error) return &lt;Text&gt;Something went wrong: {error}&lt;/Text&gt;;
if (!data) return null;

return (
  &lt;FlatList
    data={data}
    keyExtractor={(item) =&gt; String(item.id)}
    renderItem={({ item }) =&gt; &lt;Text&gt;{item.title}&lt;/Text&gt;}
  /&gt;
);</pre>
  <h2>POST with a body</h2>
  <pre class="code-block">const res = await fetch('https://api.example.com/notes', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({ title, body }),
});</pre>
  <div class="callout callout-info">
    <strong>Cleanup</strong>
    <p>When a screen unmounts mid-request, ignore the result afterwards to avoid <em>setting state on an unmounted component</em>. Check <span class="ic">cancelled</span> or use an AbortController in production code.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Pull requests into your own functions — <span class="ic">getTodos()</span>, <span class="ic">createNote()</span> — instead of writing <span class="ic">fetch</span> inline everywhere. You get one place to handle errors and re-use across screens.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'A0000000-0000-4000-8000-000000000416',
  'A0000000-0000-4000-8000-000000000323',
  1,
  'AsyncStorage & Device Permissions',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AsyncStorage & Device Permissions</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>AsyncStorage & Device Permissions</h1>
  <p>Two more essentials for real apps: saving data that <strong>survives restarts</strong> (<span class="ic">AsyncStorage</span>) and <strong>asking permission</strong> before using sensitive device features like the camera or location.</p>
  <h2>AsyncStorage — simple key-value persistence</h2>
  <pre class="code-block">npx expo install @react-native-async-storage/async-storage</pre>
  <p>It stores <em>strings</em> by key, so serialise data with JSON:</p>
  <pre class="code-block">import AsyncStorage from '@react-native-async-storage/async-storage';

const NOTES_KEY = 'notes:v1';

const saveNotes = async (notes) =&gt; {
  await AsyncStorage.setItem(NOTES_KEY, JSON.stringify(notes));
};

const loadNotes = async () =&gt; {
  const raw = await AsyncStorage.getItem(NOTES_KEY);
  return raw ? JSON.parse(raw) : [];
};</pre>
  <p>Load stored notes when the app starts, inside <span class="ic">useEffect</span>:</p>
  <pre class="code-block">useEffect(() =&gt; {
  loadNotes().then(setNotes).catch(console.warn);
}, []);</pre>
  <h2>Permissions — ask before you access</h2>
  <p>Android requires <strong>runtime permissions</strong> for the camera, location, and microphone. Use <span class="ic">expo-permissions</span> (or the newer <span class="ic">expo-camera</span> helpers) to request and check them:</p>
  <pre class="code-block">import * as ImagePicker from 'expo-image-picker';

const pickImage = async () =&gt; {
  const { status } = await ImagePicker.requestMediaLibraryPermissionsAsync();
  if (status !== 'granted') return Alert.alert('Permission needed');
  const result = await ImagePicker.launchImageLibraryAsync();
  if (!result.canceled) setPhoto(result.assets[0].uri);
};</pre>
  <ul>
    <li>Always call the permission request <em>in response to a user action</em> — not silently on launch.</li>
    <li>Handle the <span class="ic">denied</span> case with a friendly explanation and a fallback.</li>
    <li>On iOS, doc-based permissions (camera, photos) also need a key in <span class="ic">app.json</span>, e.g. <span class="ic">NSCameraUsageDescription</span>.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Security reminder</strong>
    <p>AsyncStorage is <em>not</em> an encrypted vault. It is fine for notes and preferences; never store passwords or payment data there. Use the platform keychain (via <span class="ic">expo-secure-store</span>) for secrets.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Version your storage keys (<span class="ic">notes:v1</span>). When your data model changes, you can bump the version and migrate old entries instead of crashing on stale JSON.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'A0000000-0000-4000-8000-000000000417',
  'A0000000-0000-4000-8000-000000000325',
  1,
  'Planning the Notes App',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Planning the Notes App</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Planning the Notes App</h1>
  <p>Your capstone brings together everything you have learned: components, styles, lists, state, forms, navigation, and on-device storage. Before writing code, plan what the app does.</p>
  <h2>Core features</h2>
  <ul>
    <li><strong>List notes</strong> — a FlatList of all saved notes with title preview and date.</li>
    <li><strong>Add a note</strong> — a form with a title and a multi-line body.</li>
    <li><strong>Edit a note</strong> — open an existing note and update it.</li>
    <li><strong>Delete a note</strong> — with a confirmation prompt.</li>
    <li><strong>Persist</strong> — notes survive app restarts via AsyncStorage.</li>
    <li><strong>Empty state</strong> — friendly message when there are no notes yet.</li>
  </ul>
  <h2>Screens</h2>
  <table>
    <thead>
      <tr><th>Screen</th><th>Route</th><th>Contents</th></tr>
    </thead>
    <tbody>
      <tr><td>Notes List</td><td><span class="ic">Notes</span></td><td>FlatList, add button, empty state</td></tr>
      <tr><td>Note Editor</td><td><span class="ic">Edit</span></td><td>Title input, body input, save, delete</td></tr>
    </tbody>
  </table>
  <p>The stack navigator is the natural fit: <span class="ic">Notes</span> is the initial screen; tapping or creating a note pushes <span class="ic">Edit</span>.</p>
  <h2>Data model</h2>
  <pre class="code-block">type Note = {
  id: string;        // generated with Date.now().toString()
  title: string;
  body: string;
  updatedAt: number; // Date.now() when last saved
};</pre>
  <p>State lives in <span class="ic">Notes</span> (the parent). It owns the notes array and passed setters down to the editor — props for data, callbacks for changes.</p>
  <h2>Folder plan</h2>
  <pre class="code-block">NotesApp/
  App.js
  components/
    NoteCard.js
    EmptyState.js
    NoteForm.js
  screens/
    NotesScreen.js
    EditScreen.js
  storage.js</pre>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Split storage helpers into a small <span class="ic">storage.js</span> module. Both the list and the editor can import the same <span class="ic">saveNotes</span> / <span class="ic">loadNotes</span> functions without duplication.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'A0000000-0000-4000-8000-000000000418',
  'A0000000-0000-4000-8000-000000000326',
  1,
  'Building the Notes App',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Building the Notes App</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Building the Notes App</h1>
  <p>Time to assemble the parts. You will wire up the navigator, the list screen, the editor, and the storage layer so the app actually works end to end.</p>
  <h2>App.js — the navigator</h2>
  <pre class="code-block">import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import NotesScreen from './screens/NotesScreen';
import EditScreen from './screens/EditScreen';

const Stack = createNativeStackNavigator();

export default function App() {
  return (
    &lt;NavigationContainer&gt;
      &lt;Stack.Navigator&gt;
        &lt;Stack.Screen name="Notes" component={NotesScreen} /&gt;
        &lt;Stack.Screen name="Edit" component={EditScreen} /&gt;
      &lt;/Stack.Navigator&gt;
    &lt;/NavigationContainer&gt;
  );
}</pre>
  <h2>NotesScreen — load, list, add</h2>
  <pre class="code-block">const [notes, setNotes] = useState([]);

useEffect(() =&gt; { loadNotes().then(setNotes); }, []);

const handleSave = (note) =&gt; {
  const updated = [note, ...notes.filter((n) =&gt; n.id !== note.id)];
  setNotes(updated);
  saveNotes(updated);
};

return (
  &lt;View style={styles.screen}&gt;
    &lt;FlatList
      data={notes}
      keyExtractor={(item) =&gt; item.id}
      renderItem={({ item }) =&gt; (
        &lt;NoteCard note={item} onPress={
          () =&gt; navigation.navigate('Edit', { noteId: item.id })
        } /&gt;
      )}
      ListEmptyComponent={&lt;EmptyState /&gt;}
    /&gt;
    &lt;Pressable style={styles.fab} onPress={() =&gt; navigation.navigate('Edit')}&gt;
      &lt;Text style={styles.fabText}&gt;+ New&lt;/Text&gt;
    &lt;/Pressable&gt;
  &lt;/View&gt;
);</pre>
  <h2>EditScreen — create and update</h2>
  <pre class="code-block">const { noteId } = route.params ?? {};
const [title, setTitle] = useState('');
const [body, setBody] = useState('');

// prefill when editing an existing note
useEffect(() =&gt; {
  if (noteId) {
    loadNotes().then((all) =&gt; {
      const found = all.find((n) =&gt; n.id === noteId);
      if (found) { setTitle(found.title); setBody(found.body); }
    });
  }
}, [noteId]);

const handleSave = () =&gt; {
  if (!title.trim() &amp;&amp; !body.trim()) return;
  onSave({
    id: noteId ?? Date.now().toString(),
    title,
    body,
    updatedAt: Date.now(),
  });
  navigation.goBack();
};</pre>
  <h2>Delete with confirmation</h2>
  <pre class="code-block">Alert.alert('Delete note', 'This cannot be undone', [
  { text: 'Cancel', style: 'cancel' },
  {
    text: 'Delete',
    style: 'destructive',
    onPress: () =&gt; { onDelete(id); navigation.goBack(); },
  },
]);</pre>
  <div class="callout callout-info">
    <strong>One source of truth</strong>
    <p>Keep the notes array in <span class="ic">NotesScreen</span>. Pass <span class="ic">onSave</span> and <span class="ic">onDelete</span> callbacks down — the editor never holds its own copy of the list.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Save to AsyncStorage in the same moment you update state (<span class="ic">setNotes(updated); saveNotes(updated);</span>). Doing them together means your state and disk never drift.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'A0000000-0000-4000-8000-000000000419',
  'A0000000-0000-4000-8000-000000000327',
  1,
  'Polishing & Finishing Touches',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Polishing & Finishing Touches</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Polishing & Finishing Touches</h1>
  <p>A working app becomes a <em>polished</em> app with a few deliberate extras: helpful empty states, safe touch targets, clear confirmations, and consistent spacing. Your notes app is dead easy once these are in place.</p>
  <h2>Empty state</h2>
  <p>When the list is empty, show a short message with an icon instead of a blank screen:</p>
  <pre class="code-block">export default function EmptyState() {
  return (
    &lt;View style={styles.wrap}&gt;
      &lt;Text style={styles.icon}&gt;?&lt;/Text&gt;
      &lt;Text style={styles.title}&gt;No notes yet&lt;/Text&gt;
      &lt;Text style={styles.body}&gt;Tap the + button to write your first note.&lt;/Text&gt;
    &lt;/View&gt;
  );
}</pre>
  <h2>Touch targets and feedback</h2>
  <ul>
    <li>Give buttons a height of at least <strong>44 points</strong> — the recommended minimum tap target.</li>
    <li>Use <span class="ic">Pressable</span> style functions so taps give instant visual feedback.</li>
    <li>Confirm destructive actions with <span class="ic">Alert.alert</span> (delete especially).</li>
  </ul>
  <h2>A shared design system</h2>
  <pre class="code-block">export const colors = {
  primary: '#4f46e5',
  background: '#f9fafb',
  card: '#ffffff',
  text: '#111827',
  muted: '#6b7280',
  danger: '#dc2626',
};

export const spacing = { xs: 4, sm: 8, md: 12, lg: 16, xl: 24 };</pre>
  <p>Import these constants everywhere instead of hard-coding hex values. Changing the whole theme becomes a one-file change.</p>
  <h2>Final checklist</h2>
  <table>
    <thead>
      <tr><th>Check</th><th>Why it matters</th></tr>
    </thead>
    <tbody>
      <tr><td>List scrolls smoothly with many notes</td><td>FlatList virtualization is working</td></tr>
      <tr><td>Notes survive a full app restart</td><td>AsyncStorage load/save is wired</td></tr>
      <tr><td>Delete asks for confirmation</td><td>Prevents accidental data loss</td></tr>
      <tr><td>Editor prefills when editing</td><td>route.params lookup works</td></tr>
      <tr><td>Empty state shows a helpful message</td><td>First-run experience is friendly</td></tr>
      <tr><td>Buttons are 44pt+ and give feedback</td><td>Accessible and tactile</td></tr>
    </tbody>
  </table>
  <div class="callout callout-tip">
    <strong>Well done</strong>
    <p>You built a complete React Native app: components, styles, state, forms, navigation, and persistence. Take the final assessment to earn your certificate — then keep tinkering. Every great app started as one screen.</p>
  </div>
</div>
</body>
</html>
$html$
)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 6. QUIZZES (9 quiz lessons, 29 questions)
--    Q1 → lesson L3  (501) · Q2 → L6 (504) · Q3 → L9 (507) · Q4 → L12 (510)
--    Q5 → L15 (513)  · Q6 → L18 (516) · Q7 → L21 (519) · Q8 → L24 (522)
--    Q9 → L28 (525-529, final assessment with 5 questions)
-- ----------------------------------------------------------------------------

INSERT INTO quizzes (id, lesson_id, question, explanation, position) VALUES
  ('A0000000-0000-4000-8000-000000000501', 'A0000000-0000-4000-8000-000000000303',
   'What is React Native?',
   'React Native is a framework for building native iOS and Android apps using JavaScript and React.', 1),
  ('A0000000-0000-4000-8000-000000000502', 'A0000000-0000-4000-8000-000000000303',
   'What does Expo provide for a developer?',
   'Expo is a framework and toolchain that simplifies creating, running, and building React Native apps.', 2),
  ('A0000000-0000-4000-8000-000000000503', 'A0000000-0000-4000-8000-000000000303',
   'Which command starts the Expo development server?',
   'npx expo start boots the Metro dev server and prints the QR code for Expo Go.', 3),
  ('A0000000-0000-4000-8000-000000000504', 'A0000000-0000-4000-8000-000000000306',
   'Which core component displays text on screen?',
   '<Text> renders styled, nestable text in a React Native app.', 1),
  ('A0000000-0000-4000-8000-000000000505', 'A0000000-0000-4000-8000-000000000306',
   'How do you embed a JavaScript expression inside JSX?',
   'Wrap the expression in single curly braces, like {count}.', 2),
  ('A0000000-0000-4000-8000-000000000506', 'A0000000-0000-4000-8000-000000000306',
   'Which component is the default layout container for other components?',
   '<View> is a Flexbox container used for laying out children.', 3),
  ('A0000000-0000-4000-8000-000000000507', 'A0000000-0000-4000-8000-000000000309',
   'How do you define reusable styles in React Native?',
   'StyleSheet.create returns validated, cached style objects to reuse across a component.', 1),
  ('A0000000-0000-4000-8000-000000000508', 'A0000000-0000-4000-8000-000000000309',
   'Which Flexbox property aligns children along the main axis?',
   'justifyContent controls alignment on the main axis; alignItems runs on the cross axis.', 2),
  ('A0000000-0000-4000-8000-000000000509', 'A0000000-0000-4000-8000-000000000309',
   'Which value makes a component fill the remaining space in a flex container?',
   'flex: 1 tells a child to grow and fill all available space along the main axis.', 3),
  ('A0000000-0000-4000-8000-000000000510', 'A0000000-0000-4000-8000-000000000312',
   'Which component renders a long list of items efficiently?',
   'FlatList virtualizes rows so only the visible ones are rendered on screen.', 1),
  ('A0000000-0000-4000-8000-000000000511', 'A0000000-0000-4000-8000-000000000312',
   'Which prop supplies the array that a FlatList displays?',
   'The data prop holds the array; renderItem describes each row.', 2),
  ('A0000000-0000-4000-8000-000000000512', 'A0000000-0000-4000-8000-000000000312',
   'Which component gives you full control over press feedback?',
   'Pressable accepts a style function that reacts to the pressed state.', 3),
  ('A0000000-0000-4000-8000-000000000513', 'A0000000-0000-4000-8000-000000000315',
   'How do you pass data from a parent component to a child component?',
   'Props flow downward from parent to child and are read-only in the child.', 1),
  ('A0000000-0000-4000-8000-000000000514', 'A0000000-0000-4000-8000-000000000315',
   'What does useState return?',
   'It returns the current state value and a setter function to update it.', 2),
  ('A0000000-0000-4000-8000-000000000515', 'A0000000-0000-4000-8000-000000000315',
   'What happens when you call the setter returned by useState?',
   'React re-renders the component with the new state value.', 3),
  ('A0000000-0000-4000-8000-000000000516', 'A0000000-0000-4000-8000-000000000318',
   'Which prop fires whenever the text changes inside a TextInput?',
   'onChangeText is called with the new string on every change.', 1),
  ('A0000000-0000-4000-8000-000000000517', 'A0000000-0000-4000-8000-000000000318',
   'What is a controlled TextInput?',
   'An input whose value comes from state and updates it through onChangeText.', 2),
  ('A0000000-0000-4000-8000-000000000518', 'A0000000-0000-4000-8000-000000000318',
   'Which prop masks the characters a user types, for passwords?',
   'secureTextEntry hides the typed characters on both platforms.', 3),
  ('A0000000-0000-4000-8000-000000000519', 'A0000000-0000-4000-8000-000000000321',
   'Which component wraps the app and owns the navigation state?',
   'NavigationContainer manages navigation state and the navigation theme.', 1),
  ('A0000000-0000-4000-8000-000000000520', 'A0000000-0000-4000-8000-000000000321',
   'Which navigator gives native push-and-pop transitions?',
   'createNativeStackNavigator provides the native stack behaviours.', 2),
  ('A0000000-0000-4000-8000-000000000521', 'A0000000-0000-4000-8000-000000000321',
   'How do you send data to the screen you navigate to?',
   'Pass a params object in navigate; the target reads route.params.', 3),
  ('A0000000-0000-4000-8000-000000000522', 'A0000000-0000-4000-8000-000000000324',
   'Which Web API performs HTTP requests in React Native?',
   'fetch works as a global function coupled with async/await.', 1),
  ('A0000000-0000-4000-8000-000000000523', 'A0000000-0000-4000-8000-000000000324',
   'Which package persists key-value data on the device?',
   '@react-native-async-storage/async-storage stores strings by key.', 2),
  ('A0000000-0000-4000-8000-000000000524', 'A0000000-0000-4000-8000-000000000324',
   'Why do you request permission before using a device feature?',
   'Android (and iOS) require explicit user consent for sensitive features.', 3),
  ('A0000000-0000-4000-8000-000000000525', 'A0000000-0000-4000-8000-000000000328',
   'Which component is best for a feed of hundreds of notes?',
   'FlatList virtualizes visible rows, keeping large lists smooth and fast.', 1),
  ('A0000000-0000-4000-8000-000000000526', 'A0000000-0000-4000-8000-000000000328',
   'Where should the notes array live in a notes app?',
   'In the parent NotesScreen state, passed down as props and callbacks.', 2),
  ('A0000000-0000-4000-8000-000000000527', 'A0000000-0000-4000-8000-000000000328',
   'Which method saves a value in AsyncStorage?',
   'AsyncStorage.setItem(key, value) stores a JSON-serialised string.', 3),
  ('A0000000-0000-4000-8000-000000000528', 'A0000000-0000-4000-8000-000000000328',
   'What should keyExtractor return for a FlatList row?',
   'A stable, unique value per item, such as the note id.', 4),
  ('A0000000-0000-4000-8000-000000000529', 'A0000000-0000-4000-8000-000000000328',
   'Which pattern keeps UI in sync when data changes?',
   'State via useState re-renders the component whenever the value updates.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the correct one is flagged with
--    is_correct = TRUE (listed first at position 1 in every 4-option block).
--    Q1 (501) options 1001-1004 · Q2 (502) 1005-1008 · Q3 (503) 1009-1012
--    Q4 (504) 1013-1016 · Q5 (505) 1017-1020 · ... · Q29 (529) 1113-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): What is React Native?
  ('A0000000-0000-4000-8000-000000001001', 'A0000000-0000-4000-8000-000000000501', 'A framework for native iOS & Android apps using JavaScript', TRUE,  1),
  ('A0000000-0000-4000-8000-000000001002', 'A0000000-0000-4000-8000-000000000501', 'A web browser that runs inside a phone', FALSE, 2),
  ('A0000000-0000-4000-8000-000000001003', 'A0000000-0000-4000-8000-000000000501', 'A CSS framework for mobile websites', FALSE, 3),
  ('A0000000-0000-4000-8000-000000001004', 'A0000000-0000-4000-8000-000000000501', 'A tool for designing app store icons', FALSE, 4),
  -- Q1 (501)q2: Expo role
  ('A0000000-0000-4000-8000-000000001005', 'A0000000-0000-4000-8000-000000000502', 'A framework and toolchain that simplifies building and running apps', TRUE,  1),
  ('A0000000-0000-4000-8000-000000001006', 'A0000000-0000-4000-8000-000000000502', 'A database service that hosts app data', FALSE, 2),
  ('A0000000-0000-4000-8000-000000001007', 'A0000000-0000-4000-8000-000000000502', 'A payment processor for in-app purchases', FALSE, 3),
  ('A0000000-0000-4000-8000-000000001008', 'A0000000-0000-4000-8000-000000000502', 'A code editor for JavaScript only', FALSE, 4),
  -- Q1 (501)q3: expo start
  ('A0000000-0000-4000-8000-000000001009', 'A0000000-0000-4000-8000-000000000503', 'npx expo start', TRUE,  1),
  ('A0000000-0000-4000-8000-000000001010', 'A0000000-0000-4000-8000-000000000503', 'npm run deploy', FALSE, 2),
  ('A0000000-0000-4000-8000-000000001011', 'A0000000-0000-4000-8000-000000000503', 'expo build --release', FALSE, 3),
  ('A0000000-0000-4000-8000-000000001012', 'A0000000-0000-4000-8000-000000000503', 'react-native serve', FALSE, 4),
  -- Q2 (504): text component
  ('A0000000-0000-4000-8000-000000001013', 'A0000000-0000-4000-8000-000000000504', '<Text>', TRUE,  1),
  ('A0000000-0000-4000-8000-000000001014', 'A0000000-0000-4000-8000-000000000504', '<Paragraph>', FALSE, 2),
  ('A0000000-0000-4000-8000-000000001015', 'A0000000-0000-4000-8000-000000000504', '<Label>', FALSE, 3),
  ('A0000000-0000-4000-8000-000000001016', 'A0000000-0000-4000-8000-000000000504', '<String>', FALSE, 4),
  -- Q2 (504)q2: JSX expression
  ('A0000000-0000-4000-8000-000000001017', 'A0000000-0000-4000-8000-000000000505', '{count}', TRUE,  1),
  ('A0000000-0000-4000-8000-000000001018', 'A0000000-0000-4000-8000-000000000505', '${count}', FALSE, 2),
  ('A0000000-0000-4000-8000-000000001019', 'A0000000-0000-4000-8000-000000000505', '(count)', FALSE, 3),
  ('A0000000-0000-4000-8000-000000001020', 'A0000000-0000-4000-8000-000000000505', '[count]', FALSE, 4),
  -- Q2 (504)q3: layout container
  ('A0000000-0000-4000-8000-000000001021', 'A0000000-0000-4000-8000-000000000506', '<View>', TRUE,  1),
  ('A0000000-0000-4000-8000-000000001022', 'A0000000-0000-4000-8000-000000000506', '<Box>', FALSE, 2),
  ('A0000000-0000-4000-8000-000000001023', 'A0000000-0000-4000-8000-000000000506', '<Container>', FALSE, 3),
  ('A0000000-0000-4000-8000-000000001024', 'A0000000-0000-4000-8000-000000000506', '<Layout>', FALSE, 4),
  -- Q3 (507): styles
  ('A0000000-0000-4000-8000-000000001025', 'A0000000-0000-4000-8000-000000000507', 'StyleSheet.create({ ... })', TRUE,  1),
  ('A0000000-0000-4000-8000-000000001026', 'A0000000-0000-4000-8000-000000000507', 'A .css file imported from a folder', FALSE, 2),
  ('A0000000-0000-4000-8000-000000001027', 'A0000000-0000-4000-8000-000000000507', 'className attributes like in the web', FALSE, 3),
  ('A0000000-0000-4000-8000-000000001028', 'A0000000-0000-4000-8000-000000000507', '<style> tags in JSX', FALSE, 4),
  -- Q3 (507)q2: main axis
  ('A0000000-0000-4000-8000-000000001029', 'A0000000-0000-4000-8000-000000000508', 'justifyContent', TRUE,  1),
  ('A0000000-0000-4000-8000-000000001030', 'A0000000-0000-4000-8000-000000000508', 'alignItems', FALSE, 2),
  ('A0000000-0000-4000-8000-000000001031', 'A0000000-0000-4000-8000-000000000508', 'alignSelf', FALSE, 3),
  ('A0000000-0000-4000-8000-000000001032', 'A0000000-0000-4000-8000-000000000508', 'flexShrink', FALSE, 4),
  -- Q3 (507)q3: flex 1
  ('A0000000-0000-4000-8000-000000001033', 'A0000000-0000-4000-8000-000000000509', 'flex: 1', TRUE,  1),
  ('A0000000-0000-4000-8000-000000001034', 'A0000000-0000-4000-8000-000000000509', 'width: 100%', FALSE, 2),
  ('A0000000-0000-4000-8000-000000001035', 'A0000000-0000-4000-8000-000000000509', 'flexGrow: 0', FALSE, 3),
  ('A0000000-0000-4000-8000-000000001036', 'A0000000-0000-4000-8000-000000000509', 'fill: true', FALSE, 4),
  -- Q4 (510): efficient list
  ('A0000000-0000-4000-8000-000000001037', 'A0000000-0000-4000-8000-000000000510', 'FlatList', TRUE,  1),
  ('A0000000-0000-4000-8000-000000001038', 'A0000000-0000-4000-8000-000000000510', 'ScrollView', FALSE, 2),
  ('A0000000-0000-4000-8000-000000001039', 'A0000000-0000-4000-8000-000000000510', 'ListView', FALSE, 3),
  ('A0000000-0000-4000-8000-000000001040', 'A0000000-0000-4000-8000-000000000510', 'DataGrid', FALSE, 4),
  -- Q4 (510)q2: data prop
  ('A0000000-0000-4000-8000-000000001041', 'A0000000-0000-4000-8000-000000000511', 'data', TRUE,  1),
  ('A0000000-0000-4000-8000-000000001042', 'A0000000-0000-4000-8000-000000000511', 'items', FALSE, 2),
  ('A0000000-0000-4000-8000-000000001043', 'A0000000-0000-4000-8000-000000000511', 'source', FALSE, 3),
  ('A0000000-0000-4000-8000-000000001044', 'A0000000-0000-4000-8000-000000000511', 'rows', FALSE, 4),
  -- Q4 (510)q3: press feedback
  ('A0000000-0000-4000-8000-000000001045', 'A0000000-0000-4000-8000-000000000512', 'Pressable', TRUE,  1),
  ('A0000000-0000-4000-8000-000000001046', 'A0000000-0000-4000-8000-000000000512', 'Clickable', FALSE, 2),
  ('A0000000-0000-4000-8000-000000001047', 'A0000000-0000-4000-8000-000000000512', 'TapBar', FALSE, 3),
  ('A0000000-0000-4000-8000-000000001048', 'A0000000-0000-4000-8000-000000000512', 'ActionView', FALSE, 4),
  -- Q5 (513): props
  ('A0000000-0000-4000-8000-000000001049', 'A0000000-0000-4000-8000-000000000513', 'Through props passed as attributes', TRUE,  1),
  ('A0000000-0000-4000-8000-000000001050', 'A0000000-0000-4000-8000-000000000513', 'Through the global window object', FALSE, 2),
  ('A0000000-0000-4000-8000-000000001051', 'A0000000-0000-4000-8000-000000000513', 'Through SQL queries in the component', FALSE, 3),
  ('A0000000-0000-4000-8000-000000001052', 'A0000000-0000-4000-8000-000000000513', 'Through CSS class names', FALSE, 4),
  -- Q5 (513)q2: useState returns
  ('A0000000-0000-4000-8000-000000001053', 'A0000000-0000-4000-8000-000000000514', 'The current value and a setter function', TRUE,  1),
  ('A0000000-0000-4000-8000-000000001054', 'A0000000-0000-4000-8000-000000000514', 'Only the current value', FALSE, 2),
  ('A0000000-0000-4000-8000-000000001055', 'A0000000-0000-4000-8000-000000000514', 'A promise that resolves the next value', FALSE, 3),
  ('A0000000-0000-4000-8000-000000001056', 'A0000000-0000-4000-8000-000000000514', 'A render cell that must be mounted', FALSE, 4),
  -- Q5 (513)q3: setter behaviour
  ('A0000000-0000-4000-8000-000000001057', 'A0000000-0000-4000-8000-000000000515', 'Re-renders the component with the new value', TRUE,  1),
  ('A0000000-0000-4000-8000-000000001058', 'A0000000-0000-4000-8000-000000000515', 'Restarts the whole application', FALSE, 2),
  ('A0000000-0000-4000-8000-000000001059', 'A0000000-0000-4000-8000-000000000515', 'Writes the value straight to disk', FALSE, 3),
  ('A0000000-0000-4000-8000-000000001060', 'A0000000-0000-4000-8000-000000000515', 'Changes props on the parent instead', FALSE, 4),
  -- Q6 (516): input change
  ('A0000000-0000-4000-8000-000000001061', 'A0000000-0000-4000-8000-000000000516', 'onChangeText', TRUE,  1),
  ('A0000000-0000-4000-8000-000000001062', 'A0000000-0000-4000-8000-000000000516', 'onTyping', FALSE, 2),
  ('A0000000-0000-4000-8000-000000001063', 'A0000000-0000-4000-8000-000000000516', 'onInputChange', FALSE, 3),
  ('A0000000-0000-4000-8000-000000001064', 'A0000000-0000-4000-8000-000000000516', 'onUpdated', FALSE, 4),
  -- Q6 (516)q2: controlled input
  ('A0000000-0000-4000-8000-000000001065', 'A0000000-0000-4000-8000-000000000517', 'Its value comes from state and updates via onChangeText', TRUE,  1),
  ('A0000000-0000-4000-8000-000000001066', 'A0000000-0000-4000-8000-000000000517', 'It only accepts numbers and masks text', FALSE, 2),
  ('A0000000-0000-4000-8000-000000001067', 'A0000000-0000-4000-8000-000000000517', 'It cannot be edited by the user at all', FALSE, 3),
  ('A0000000-0000-4000-8000-000000001068', 'A0000000-0000-4000-8000-000000000517', 'It stores its value in the device clipboard', FALSE, 4),
  -- Q6 (516)q3: password mask
  ('A0000000-0000-4000-8000-000000001069', 'A0000000-0000-4000-8000-000000000518', 'secureTextEntry', TRUE,  1),
  ('A0000000-0000-4000-8000-000000001070', 'A0000000-0000-4000-8000-000000000518', 'password', FALSE, 2),
  ('A0000000-0000-4000-8000-000000001071', 'A0000000-0000-4000-8000-000000000518', 'maskText', FALSE, 3),
  ('A0000000-0000-4000-8000-000000001072', 'A0000000-0000-4000-8000-000000000518', 'hidden', FALSE, 4),
  -- Q7 (519): navigation container
  ('A0000000-0000-4000-8000-000000001073', 'A0000000-0000-4000-8000-000000000519', 'NavigationContainer', TRUE,  1),
  ('A0000000-0000-4000-8000-000000001074', 'A0000000-0000-4000-8000-000000000519', 'BrowserRouter', FALSE, 2),
  ('A0000000-0000-4000-8000-000000001075', 'A0000000-0000-4000-8000-000000000519', 'TabHost', FALSE, 3),
  ('A0000000-0000-4000-8000-000000001076', 'A0000000-0000-4000-8000-000000000519', 'RouteFrame', FALSE, 4),
  -- Q7 (519)q2: stack navigator
  ('A0000000-0000-4000-8000-000000001077', 'A0000000-0000-4000-8000-000000000520', 'createNativeStackNavigator', TRUE,  1),
  ('A0000000-0000-4000-8000-000000001078', 'A0000000-0000-4000-8000-000000000520', 'createMeshNavigator', FALSE, 2),
  ('A0000000-0000-4000-8000-000000001079', 'A0000000-0000-4000-8000-000000000520', 'createListView', FALSE, 3),
  ('A0000000-0000-4000-8000-000000001080', 'A0000000-0000-4000-8000-000000000520', 'createRouterOutlet', FALSE, 4),
  -- Q7 (519)q3: navigate params
  ('A0000000-0000-4000-8000-000000001081', 'A0000000-0000-4000-8000-000000000521', '"navigation.navigate(''Details'', { id: 7 })"', TRUE,  1),
  ('A0000000-0000-4000-8000-000000001082', 'A0000000-0000-4000-8000-000000000521', '"navigation.pushParams(7)"', FALSE, 2),
  ('A0000000-0000-4000-8000-000000001083', 'A0000000-0000-4000-8000-000000000521', '"route.send(7)"', FALSE, 3),
  ('A0000000-0000-4000-8000-000000001084', 'A0000000-0000-4000-8000-000000000521', '"screen.params = 7"', FALSE, 4),
  -- Q8 (522): fetch
  ('A0000000-0000-4000-8000-000000001085', 'A0000000-0000-4000-8000-000000000522', 'fetch', TRUE,  1),
  ('A0000000-0000-4000-8000-000000001086', 'A0000000-0000-4000-8000-000000000522', 'readFile', FALSE, 2),
  ('A0000000-0000-4000-8000-000000001087', 'A0000000-0000-4000-8000-000000000522', 'importJson', FALSE, 3),
  ('A0000000-0000-4000-8000-000000001088', 'A0000000-0000-4000-8000-000000000522', 'getElement', FALSE, 4),
  -- Q8 (522)q2: async storage package
  ('A0000000-0000-4000-8000-000000001089', 'A0000000-0000-4000-8000-000000000523', '@react-native-async-storage/async-storage', TRUE,  1),
  ('A0000000-0000-4000-8000-000000001090', 'A0000000-0000-4000-8000-000000000523', 'window.localStorage', FALSE, 2),
  ('A0000000-0000-4000-8000-000000001091', 'A0000000-0000-4000-8000-000000000523', 'node-fs', FALSE, 3),
  ('A0000000-0000-4000-8000-000000001092', 'A0000000-0000-4000-8000-000000000523', 'react-mongo', FALSE, 4),
  -- Q8 (522)q3: permissions
  ('A0000000-0000-4000-8000-000000001093', 'A0000000-0000-4000-8000-000000000524', 'Platforms require explicit user consent for sensitive features', TRUE,  1),
  ('A0000000-0000-4000-8000-000000001094', 'A0000000-0000-4000-8000-000000000524', 'It makes the app bundle smaller', FALSE, 2),
  ('A0000000-0000-4000-8000-000000001095', 'A0000000-0000-4000-8000-000000000524', 'It speeds up the Metro bundler', FALSE, 3),
  ('A0000000-0000-4000-8000-000000001096', 'A0000000-0000-4000-8000-000000000524', 'It removes the need for a backend', FALSE, 4),
  -- Q9 (525): feed of notes
  ('A0000000-0000-4000-8000-000000001097', 'A0000000-0000-4000-8000-000000000525', 'FlatList', TRUE,  1),
  ('A0000000-0000-4000-8000-000000001098', 'A0000000-0000-4000-8000-000000000525', 'ScrollView', FALSE, 2),
  ('A0000000-0000-4000-8000-000000001099', 'A0000000-0000-4000-8000-000000000525', 'Text block', FALSE, 3),
  ('A0000000-0000-4000-8000-000000001100', 'A0000000-0000-4000-8000-000000000525', 'Image carousel', FALSE, 4),
  -- Q9 (525)q2: notes state
  ('A0000000-0000-4000-8000-000000001101', 'A0000000-0000-4000-8000-000000000526', 'In the parent NotesScreen state', TRUE,  1),
  ('A0000000-0000-4000-8000-000000001102', 'A0000000-0000-4000-8000-000000000526', 'In the device clipboard', FALSE, 2),
  ('A0000000-0000-4000-8000-000000001103', 'A0000000-0000-4000-8000-000000000526', 'In a global window variable', FALSE, 3),
  ('A0000000-0000-4000-8000-000000001104', 'A0000000-0000-4000-8000-000000000526', 'In the React Navigation drawer', FALSE, 4),
  -- Q9 (525)q3: async storage set
  ('A0000000-0000-4000-8000-000000001105', 'A0000000-0000-4000-8000-000000000527', 'AsyncStorage.setItem(key, value)', TRUE,  1),
  ('A0000000-0000-4000-8000-000000001106', 'A0000000-0000-4000-8000-000000000527', 'AsyncStorage.push(key)', FALSE, 2),
  ('A0000000-0000-4000-8000-000000001107', 'A0000000-0000-4000-8000-000000000527', 'AsyncStorage.upsert(key, value)', FALSE, 3),
  ('A0000000-0000-4000-8000-000000001108', 'A0000000-0000-4000-8000-000000000527', 'AsyncStorage.write(key)', FALSE, 4),
  -- Q9 (525)q4: keyExtractor
  ('A0000000-0000-4000-8000-000000001109', 'A0000000-0000-4000-8000-000000000528', 'A stable, unique value per item', TRUE,  1),
  ('A0000000-0000-4000-8000-000000001110', 'A0000000-0000-4000-8000-000000000528', 'The screen width', FALSE, 2),
  ('A0000000-0000-4000-8000-000000001111', 'A0000000-0000-4000-8000-000000000528', 'The current timestamp', FALSE, 3),
  ('A0000000-0000-4000-8000-000000001112', 'A0000000-0000-4000-8000-000000000528', 'Nothing; it never matters', FALSE, 4),
  -- Q9 (525)q5: sync UI
  ('A0000000-0000-4000-8000-000000001113', 'A0000000-0000-4000-8000-000000000529', 'State via useState re-renders with the new value', TRUE,  1),
  ('A0000000-0000-4000-8000-000000001114', 'A0000000-0000-4000-8000-000000000529', 'The app stores the value on a server', FALSE, 2),
  ('A0000000-0000-4000-8000-000000001115', 'A0000000-0000-4000-8000-000000000529', 'The user must refresh the screen manually', FALSE, 3),
  ('A0000000-0000-4000-8000-000000001116', 'A0000000-0000-4000-8000-000000000529', 'The favorites list reorders alphabetically', FALSE, 4)
ON CONFLICT (id) DO NOTHING;
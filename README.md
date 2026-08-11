CodeAlpha Task 4: Language Learning App
This project is a fully functional Language Learning App built using Flutter for the CodeAlpha App Development Internship.

Project Structure & Architecture
language_learning_app/
│
├── lib/
│   ├── models/
│   │   └── word.dart       # Data model for vocabulary (original word, translation, category, pronunciation)
│   ├── screens/
│   │   ├── home.dart       # Main screen with daily tips, categories grid, and recent vocabulary list
│   │   └── quiz.dart       # Interactive multiple-choice quiz screen with real-time scoring and feedback
│   └── main.dart           # App entry point, Provider state management, and vocabulary data provider
│
├── pubspec.yaml            # Project dependencies (provider)
└── README.md               # Project documentation

Key Features & Requirements Met
    1. Vocabulary Learning: Helps users learn new words, phrases, and sentences categorized by topics (e.g., Basics, Food, Animals).
    2. Pronunciation & Translation: Each word entry includes phonetic pronunciations and English translations.
    3. Interactive Quizzes: Built-in practice tests with multiple-choice questions, progress indicators, immediate feedback, and final score tracking.
    4. Clean UI: Intuitive, user-friendly interface with consistent color schemes and clean card layouts.

Dependencies (pubspec.yaml)
    • provider: ^6.0.5: For reactive state management across screens.

How to Run Locally
    1. Prerequisites: Ensure you have Flutter SDK installed (flutter doctor).
    2. Install Dependencies:
       flutter pub get
    3. Run the App:
       flutter run

CodeAlpha Internship Submission
    • Repository Name: CodeAlpha_LanguageLearning
    • Instructions: Upload this folder to GitHub, record a video explanation, post on LinkedIn tagging @CodeAlpha, and submit via the official form.

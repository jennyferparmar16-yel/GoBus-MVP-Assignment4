# GoBus MVP - Public Transportation Tracker

## Project Overview
GoBus is a functional mobile application prototype developed for Assignment 4. This project is a direct continuation of Assignment 3, translating high-fidelity UI/UX designs into a working Minimum Viable Product (MVP). The app provides public transportation commuters with a fast, reliable way to track bus schedules and plan journeys.

## Target User Persona
The application is tailored for **Daniel Morris**:
* Age: 24.
* Occupation: College Student.
* Needs: Real-time bus location, trip planning, and reliable arrival times.
* Pain Points: Daniel hates waiting, getting lost, and unreliable timetables.

## Technical Architecture
The project follows the **MVVM (Model-View-ViewModel)** architecture pattern to ensure a clean separation of concerns:

* UI Layer (`lib/screens`): Implements the visual interface using platform-specific components.
* Business Logic Layer (`lib/main.dart` & State Management): Handles core application logic, such as theme toggling and navigation.
* Data Layer (`lib/models` & `lib/data`): Manages the data structures and mock data for bus routes.

## Key Features
* Dynamic Bus List: Automatically displays a list of nearby buses upon app launch.
* Journey Planning: Users can enter a start and destination to receive route options.
* Input Validation: Includes error messages for required fields to ensure data integrity.
* Structured Navigation: Uses a bottom navigation bar to switch between Home, Favorites, and Profile screens.
* System Feedback: Implements loading indicators (spinners) during data fetching and validation feedback.
* Theme Toggle: A functional profile feature allowing users to switch between Light and Dark (Black & White) modes.

## Design Compliance
* Typography: Uses Roboto as the primary font for Android.
* Color Palette: The primary color is Blue (#1565C0), representing trust and security[.
* Grid System: Screens are designed using an 8-point grid system for consistent spacing.
* Material Design: Adheres to Android’s Material Design standards.

## Installation & Setup
1. Ensure Flutter SDK is installed on your machine.
2. Clone this repository: `git clone <your-repo-link>`.
3. Navigate to the project directory: `cd assignment4gobus`.
4. Install dependencies: `flutter pub get`.
5. Launch an emulator (e.g., Pixel 6 API 31)
6. Run the application: `flutter run`.


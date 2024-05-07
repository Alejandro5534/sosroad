# Mobile Login/Registration System

This Flutter project implements a user authentication system using mobile phone numbers with WhatsApp for code verification. It includes a streamlined three-screen workflow.

## Problem Statement

The application facilitates user login and registration via mobile phone. The key features include:
1. **Login/Registration:** Requests the user's mobile number and sends a verification code via WhatsApp.
2. **Confirmation:** Users enter the received code for verification.
3. **Home:** Welcome screen and maintains user session across app restarts if the number has already been confirmed.

## Tech Stack

This project uses Flutter along with several packages to enhance functionality:

- `go_router`: Manages navigation and routing in Flutter apps.
- `flutter_riverpod`: A reactive state-management library that allows the building of complex and reactive applications.
- `riverpod_annotation`: Used for generating boilerplate code for Riverpod, enhancing the development workflow with annotations.
- `shared_preferences`: Provides a persistent store for simple data (like settings).
- `dio`: A powerful HTTP client for Dart, which supports Interceptors, Global configuration, FormData, Request Cancellation, File downloading, Timeout etc.
- `toastification`: Displays toast messages, a common feature for showing alerts or notifications.
- `pin_code_fields`: A customizable widget for entering pin codes, typically used in verification screens.

## Getting Started with Flutter

### Prerequisites

Ensure you have Flutter installed on your system. If not, follow the instructions on the [Flutter official installation guide](https://flutter.dev/docs/get-started/install).

### Installation

Clone the repository:

```
git clone https://github.com/yourusername/mobile-login-system.git
cd mobile-login-system
```

Install the required packages:

```
flutter pub get
```

Generate necessary code for Riverpod annotations (required for riverpod_annotation):

```
dart run build_runner build  # To build
dart run build_runner watch  # To continuously watch the files and build
```

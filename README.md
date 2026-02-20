 # Tupatane

A simple chat application built with **Flutter** and **Firebase**

## Overview
Tupatane is a basic chat application designed to learn Flutter development with Firebase backend services.

## Features

1. **Authentication** - User signup and login with Firebase Authentication

2. **See Other Users** - View list of all other registered users

3. **Send and Receive Messages** - Real-time messaging between users using Cloud Firestore

4. **Get Notifications** - Receive push notifications for new messages using Firebase Cloud Messaging

## Technology Stack

- **Flutter**: Cross-platform development
- **Dart**: Programming language
- **Firebase Authentication**: User login/signup
- **Cloud Firestore**: Store messages and user data
- **Firebase Cloud Messaging (FCM)**: Push notifications

## Quick Start

### 1. Setup Firebase
- Create a project at [firebase.google.com](https://firebase.google.com)
- Enable Firebase Authentication (Email/Password)
- Create a Cloud Firestore database
- Enable Cloud Messaging

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Run the App
```bash
flutter run
```

## Project Structure

```
lib/
├── main.dart
├── models/
|   ├── chat_model.dart
|   ├── message_model.dart  
|   └── user_model.dart
├── pages/
|   ├── auth/
|   |   ├── login.dart
|   |   └── signup.dart
|   ├── chat.dart    
|   └──users.dart
├── services/
|   ├── auth_service.dart
|   ├── chat_service.dart 
|   ├── user_service.dart
|   └── notification_service.dart
├── theme/
|   └── colors_scheme.dart
└── widgets/
|   ├── progress_indicator.dart
|   └── logout_button.dart
|
└── firebase_options.dart
```

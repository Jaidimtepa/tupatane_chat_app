# Tupatane

A simple chat application built with **Flutter** and **Firebase**

## Overview
Tupatane is a basic chat application designed to learn Flutter development with Firebase backend services.

## Features

1. **Authentication** - User signup and login with Firebase Authentication

2. **See Other Users** - View list of all other registered users

3. **Send and Receive Messages** - Real-time messaging between users using Firebase Realtime Database

4. **Get Notifications** - (Planned) Receive push notifications for new messages using Firebase Cloud Messaging

## Technology Stack

- **Flutter**: Cross-platform development
- **Dart**: Programming language
- **Firebase Authentication**: User login/signup
- **Firebase Realtime Database**: Store messages and user data
- **Firebase Cloud Messaging (FCM)**: (Planned) Push notifications

## Quick Start

### 1. Setup Firebase
- Create a project at [firebase.google.com](https://firebase.google.com)
- Enable Firebase Authentication (Email/Password)
- Create a Firebase Realtime Database (test mode for development)
- (Optional) Enable Cloud Messaging for notifications

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
|   └── color_scheme.dart
└── widgets/
|   ├── progress_indicator.dart
|   └── logout_button.dart
|
└── firebase_options.dart
```

# Collaborators details
 
|      Full name    |      Reg number   | GitHub username |
| ------ | -------- | ------- |
|  ALEX A JOSEPH | NIT/BIT/2023/2335 | Alex202669 |
|  MASUMBUKO S MASUNGA | NIT/BIT/2023/2189 | sadick-koyo |
|  HEAVENLIGHT S SANARE | NIT/BIT/2023/2343 | H675305 |
|  VITUS A SUNGWA | NIT/BIT/2023/2321 | Vitus2002 |
|  BRIGHT MLONGANILE | NIT/BIT/2023/2313 | MlonileBrirod |
|  HUSNA H MOHAMEDI | NIT/BIT/2023/2233 | Husna-mohamedi |
|  NOREEN M MBILINYI | NIT/BIT/2023/2314 | noreenmeshack04-design|
|  EDWARD P ROBERT | NIT/BIT/2023/2247 | 7eddi |
|  MICHAEL PIUS | NIT/BIT/2022/1839 | michaelpius |
|  REHEMA E LUGALA | NIT/BIT/2023/2045 | lugalarehema |
|  NICKSON N SHANG'A | NIT/BIT/2023/2246 | Mrnicolaus |
|  DENIS S MAHECHA | NIT/BIT/2023/2057 | Denis Mahecha |
|  JAIDI S MTEPA | NIT/BIT/2023/2317 | Jaidimtepa |
|  RICHARD B CHAKALA | NIT/BIT/2023/2188 | richardbchakala |
|  CATHERINE J SINKALA | NIT/BIT/2023/2096 | catherinesinkala24-alt |

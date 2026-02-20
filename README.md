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
|  NICKSON N SHANG'A | NIT/BIT/2023/2246 | Mrnicholaus |
|  DENIS S MAHECHA | NIT/BIT/2023/2057 | Denis Mahecha |
|  JAIDI S MTEPA | NIT/BIT/2023/2317 | Jaidimtepa |
|  RICHARD B CHAKALA | NIT/BIT/2023/2188 | richardbchakala |
|  CATHERINE J SINKALA | NIT/BIT/2023/2096 | catherinesinkala24-alt |

## App screenshot
<img width="502" height="719" alt="Screenshot 2026-02-20 165316" src="https://github.com/user-attachments/assets/b639e5ff-3494-4c7c-8616-5ec0054e2984" />
<img width="506" height="722" alt="Screenshot 2026-02-20 165455" src="https://github.com/user-attachments/assets/77ac7e98-b38d-4c9c-86fd-4ff45859a6de" />
<img width="503" height="721" alt="Screenshot 2026-02-20 165618" src="https://github.com/user-attachments/assets/8ffb63fe-1f1e-4a4c-b0a2-fa4f7d51ef0b" />
<img width="502" height="721" alt="Screenshot 2026-02-20 171024" src="https://github.com/user-attachments/assets/de6d3d3a-220f-4adb-af09-a18245a4f46e" />
<img width="504" height="721" alt="Screenshot 2026-02-20 171143" src="https://github.com/user-attachments/assets/eba54e4e-efa7-4c66-99ba-a478d6193040" />





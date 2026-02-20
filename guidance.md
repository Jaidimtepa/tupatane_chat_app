# ChatApp - Development Steps

## Phase 1: Project Setup & Infrastructure

- [x] **1.1** Install Flutter and set up development environment
- [x] **1.2** Clone repository and run `flutter pub get`
- [x] **1.3** Set up analysis options and linting

## Phase 2: Firebase Integration

- [x] **2.1** Create Firebase project `we called it 'tupatane'`
- [x] **2.2** Add Android/iOS/web apps in Firebase console
- [x] **2.3** Download and add `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
- [x] **2.4** Add Firebase dependencies to `pubspec.yaml` (firebase_core, firebase_auth, firebase_database)
- [x] **2.5** Initialize Firebase in `main.dart`
- [x] **2.6** Create and configure Firebase Realtime Database (test mode for development)


## Phase 3: Authentication
- [x] **3.1** Defining the color scheme for the project
- [x] **3.2** Implement sign up and login screens
- [x] **3.3** Integrate Firebase Authentication (username/email/password) 
- [x] **3.4** Handle authentication state and user sessions

## Phase 4: User Management

- [x] **4.1** Create user model and Realtime Database user node
- [x] **4.2** Display list of users (excluding current user)

## Phase 5: Chat Functionality
- [x] **5.1** Design chat model and Realtime Database chat/message nodes
- [x] **5.2** Implement real-time messaging (send/receive messages) 
- [x] **5.3** Display chat history and update UI in real time

## Phase 6: Push Notifications
<!-- This phase is not presented yet -->

- [ ] **6.1** Integrate Firebase Cloud Messaging (FCM)
- [ ] **6.2** Request notification permissions and handle tokens
- [ ] **6.3** Show notifications for new messages

## Phase 7: UI/UX Improvements

- [x] **7.1** Add splash screen and loading indicators
- [x] **7.2** Polish chat UI (bubbles, timestamps, avatars)
- [x] **7.3** Add error handling and validation

---

### Firebase Console State Checklist
- [x] **Authentication**: Email/Password enabled
- [x] **Realtime Database**: Created, in test mode, with users and messages nodes
- [x] **Cloud Messaging**: Not enabled (optional, for future notifications)
- [x] **Firestore**: Not required
- [x] **Storage**: Not required (unless supporting file uploads)



import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tupatane_chat_app/models/user_model.dart' as app_user;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  // Get current Firebase user
  User? get currentUser => _auth.currentUser;

  // Register with email, password, and username
  Future<app_user.User?> register({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      // Check if username already exists
      final snapshot = await _database
          .ref('users')
          .orderByChild('username')
          .equalTo(username)
          .get();

      if (snapshot.exists) {
        throw Exception('Username already taken');
      }

      // Create Firebase auth user
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Create user profile in Realtime Database
      final user = app_user.User(
        uid: credential.user!.uid,
        email: email,
        username: username,
        createdAt: DateTime.now(),
      );

      // Save to Firebase Realtime Database
      await _database.ref('users/${credential.user!.uid}').set(user.toJson());

      return user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'Registration failed');
    }
  }

  // Login with email and password
  Future<app_user.User?> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Fetch user profile from database
      final snapshot = await _database
          .ref('users/${credential.user!.uid}')
          .get();

      if (snapshot.exists) {
        return app_user.User.fromJson(
          Map<String, dynamic>.from(snapshot.value as Map),
        );
      }
      return null;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'Login failed');
    }
  }

  // Logout
  Future<void> logout() async {
    await _auth.signOut();
  }

  // Get user by UID
  Future<app_user.User?> getUserById(String uid) async {
    try {
      final snapshot = await _database.ref('users/$uid').get();
      if (snapshot.exists) {
        return app_user.User.fromJson(
          Map<String, dynamic>.from(snapshot.value as Map),
        );
      }
      return null;
    } catch (e) {
      print('Error fetching user: $e');
      return null;
    }
  }
}

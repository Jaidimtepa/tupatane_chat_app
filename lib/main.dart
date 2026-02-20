import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:tupatane_chat_app/theme/color_scheme.dart';
import 'pages/auth/login.dart';
import 'pages/auth/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const Tupatane());
}

class Tupatane extends StatelessWidget {
  const Tupatane({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tupatane Chat',
      theme: getDarkTheme(),
      darkTheme: getLightTheme(),
      debugShowCheckedModeBanner: false,
      home: AuthSwitcher(),
    );
  }
}

class AuthSwitcher extends StatefulWidget {
  @override
  State<AuthSwitcher> createState() => _AuthSwitcherState();
}

class _AuthSwitcherState extends State<AuthSwitcher> {
  bool showLogin = true;

  void toggle() => setState(() => showLogin = !showLogin);

  @override
  Widget build(BuildContext context) {
    return showLogin
        ? LoginPage(onSignupTap: toggle)
        : SignupPage(onLoginTap: toggle);
  }
}

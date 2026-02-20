import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:tupatane_chat_app/theme/color_scheme.dart';

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
      theme: getDarkTheme(), // Use dark theme
      darkTheme: getLightTheme(), // Use light theme
      home: const Scaffold(
        body: Center(
          child: Text('Tupatane Chat App\n\nFirebase configured successfully!'),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

// Import all screens
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/level_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/setting_screen.dart';
import 'screens/feedback_screen.dart';

void main() {
  runApp(const QuizyApp());
}

class QuizyApp extends StatefulWidget {
  const QuizyApp({super.key});

  @override
  State<QuizyApp> createState() => _QuizyAppState();
}

class _QuizyAppState extends State<QuizyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quizy",
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),

      // Initial screen
      home: const LoginScreen(),

      // Named routes
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegistrationScreen(),
        '/levels': (context) => const LevelSelectionScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/feedback': (context) => const FeedbackScreen(),
      },
    );
  }
}

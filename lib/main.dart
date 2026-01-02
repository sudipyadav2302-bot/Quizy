import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


 // All screens 
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/forgotpassword_screen.dart';
import 'screens/home_screen.dart';
import 'screens/level_screen.dart';
import 'screens/questions_screen.dart';
import 'screens/result_screen.dart';
import 'screens/history_screen.dart';
import 'screens/leaderboard_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/setting_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const QuizyApp());
}

class QuizyApp extends StatelessWidget {
  const QuizyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: FirebaseAuth.instance.currentUser == null ? '/login' : '/home',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => RegistrationScreen(),
        '/forgot': (context) => const ForgotPasswordScreen(),
        '/home': (context) => const HomeScreen(),
        '/levels': (context) => const LevelScreen(),
        '/history': (context) => const HistoryScreen(),
        '/leaderboard': (context) => LeaderboardScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/questions') {
          final level = settings.arguments as String;
          return MaterialPageRoute(
            builder: (_) => QuestionsScreen(level: level),
          );
        }
        if (settings.name == '/result') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (_) => ResultScreen(
              score: args['score'],
              total: args['total'],
              level: args['level'],
            ),
          );
        }
        return null;
      },
    );
  }
}

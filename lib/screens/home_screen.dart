import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/category_card.dart';
import '../utils/app_utils.dart';
import '../services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String username = "Player";
  
  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  void loadUserData() {
    final user = FirebaseAuth.instance.currentUser;
    setState(() {
      username = user?.email?.split('@').first ?? "Player";
    });
  }

  void _handleMenuSelection(String value) async {
    if (value == "profile") {
      Navigator.pushNamed(context, '/profile');
    } else if (value == "settings") {
      Navigator.pushNamed(context, '/settings');
    } else if (value == "logout") {
      await AuthService.logout();
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Quizy",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.menu, color: Colors.black),
            onSelected: _handleMenuSelection,
            itemBuilder: (context) => const [
              PopupMenuItem(value: "profile", child: Text("Profile")),
              PopupMenuItem(value: "settings", child: Text("Settings")),
              PopupMenuItem(value: "logout", child: Text("Logout")),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi, $username 👋", style: AppUtils.greetingStyle),
            const SizedBox(height: 6),
            const SizedBox(height: 30),
            const Text("Choose a category", style: AppUtils.sectionTitle),
            const SizedBox(height: 20),
            Column(
              
                children: const [
                  SizedBox(
                    width:double.infinity,
                    height:150,
                  child:CategoryCard(
                    title: "Politics",
                    route: "/levels",
                  
                  ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width:double.infinity,
                    height:150,
                  child:CategoryCard(
                    title: "Defence",
                    route: "/levels",
                  
                  ),
                  ),
                ],
              ),
            const Spacer(),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/leaderboard');
                },
                icon: const Icon(Icons.emoji_events),
                label: const Text("Leaderboard"),
                style: AppUtils.primaryButtonStyle,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/history');
                },
                child: const Text("View History"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

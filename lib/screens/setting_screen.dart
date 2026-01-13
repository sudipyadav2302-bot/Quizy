import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool soundEnabled = true;
  bool notificationsEnabled = true;
  bool darkModeEnabled = false;

  void _showAbout() {
    showAboutDialog(
      context: context,
      applicationName: "Quizy",
      applicationVersion: "1.0.0",
      applicationIcon: const Icon(Icons.quiz, color: Colors.deepPurple),
      children: const [
        Text("Quizy is a simple quiz app built with Flutter and Firebase."),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(Icons.volume_up_outlined),
            title: const Text("Sound"),
            trailing: Switch(
              value: soundEnabled,
              activeThumbColor: Colors.deepPurple,
              onChanged: (value) {
                setState(() {
                  soundEnabled = value;
                });
              },
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: const Text("Notifications"),
            trailing: Switch(
              value: notificationsEnabled,
              activeThumbColor: Colors.deepPurple,
              onChanged: (value) {
                setState(() {
                  notificationsEnabled = value;
                });
              },
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.dark_mode_outlined),
            title: const Text("Dark Mode"),
            trailing: Switch(
              value: darkModeEnabled,
              activeThumbColor: Colors.deepPurple,
              onChanged: (value) {
                setState(() {
                  darkModeEnabled = value;
                  
                });
              },
            ),
          ),
          const Divider(),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("About"),
            subtitle: const Text("Quizy v1.0.0"),
            onTap: _showAbout,
          ),
        ],
      ),
    );
  }
}

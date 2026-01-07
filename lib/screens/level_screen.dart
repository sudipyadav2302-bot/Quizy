import 'package:flutter/material.dart';

class LevelScreen extends StatefulWidget {
  final String category;   

  const LevelScreen({super.key, required this.category});

  @override
  State<LevelScreen> createState() => LevelScreenState();
}

class LevelScreenState extends State<LevelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          "Select Level - ${widget.category}",
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Selection Note Box
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "Please select your desired difficulty level to begin the quiz.",
                style: TextStyle(fontSize: 16),
              ),
            ),

            const SizedBox(height: 30),

            // EASY
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/questions',
                  arguments: {
                    "category": widget.category,
                    "level": "Easy",
                  },
                );
              },
              borderRadius: BorderRadius.circular(16),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "Easy",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // MEDIUM
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/questions',
                  arguments: {
                    "category": widget.category,
                    "level": "Medium",
                  },
                );
              },
              borderRadius: BorderRadius.circular(16),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "Medium",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // HARD
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/questions',
                  arguments: {
                    "category": widget.category,
                    "level": "Hard",
                  },
                );
              },
              borderRadius: BorderRadius.circular(16),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "Hard",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

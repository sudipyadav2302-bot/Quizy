import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget {
  final String level;

  const QuestionsScreen({super.key, required this.level});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  final List<Map<String, dynamic>> questions = [
    {
      "question": "What is the capital of France?",
      "options": ["Berlin", "Madrid", "Paris", "Rome"],
      "correctIndex": 2,
      "explanation": "Paris is the capital city of France.",
    },
    {
      "question": "Which planet is known as the Red Planet?",
      "options": ["Earth", "Mars", "Jupiter", "Venus"],
      "correctIndex": 1,
      "explanation": "Mars appears red due to iron oxide on its surface.",
    },
  ];

  int currentIndex = 0;
  int selectedIndex = -1;
  int score = 0;
  bool showExplanation = false;

  void _onOptionTap(int index) {
    if (selectedIndex != -1) return;

    setState(() {
      selectedIndex = index;
      showExplanation = true;
      if (index == questions[currentIndex]["correctIndex"]) {
        score++;
      }
    });
  }

  void _nextQuestion() {
    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
        selectedIndex = -1;
        showExplanation = false;
      });
    } else {
      Navigator.pushReplacementNamed(
        context,
        '/result',
        arguments: {
          'score': score,
          'total': questions.length,
          'level': widget.level,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          "Quiz - ${widget.level.toUpperCase()}",
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Question ${currentIndex + 1} of ${questions.length}",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              question["question"],
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: question["options"].length,
                itemBuilder: (context, index) {
                  return _buildOptionCard(
                    index: index,
                    text: question["options"][index],
                    correctIndex: question["correctIndex"],
                  );
                },
              ),
            ),
            if (showExplanation) ...[
              const SizedBox(height: 10),
              Text(
                "Explanation:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple.shade700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                question["explanation"],
                style: const TextStyle(fontSize: 14),
              ),
            ],
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text(
                  currentIndex == questions.length - 1 ? "FINISH" : "NEXT",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard({
    required int index,
    required String text,
    required int correctIndex,
  }) {
    Color bgColor = Colors.grey.shade200;

    if (selectedIndex != -1) {
      if (index == correctIndex) {
        bgColor = Colors.green.shade300;
      } else if (index == selectedIndex) {
        bgColor = Colors.red.shade300;
      }
    }

    return InkWell(
      onTap: () => _onOptionTap(index),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

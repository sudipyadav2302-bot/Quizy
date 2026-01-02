import 'package:flutter/material.dart';
import '../screens/level_screen.dart';
import '../screens/questions_screen.dart';
import '../services/score_service.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  final int total;
  final String level;
  final String category;

  const ResultScreen({
    super.key,
    required this.score,
    required this.total,
    required this.level,
    required this.category
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool saving = false;

  @override
  void initState() {
    super.initState();
    _saveScoreToFirebase();
  }

  Future<void> _saveScoreToFirebase() async {
    setState(() => saving = true);
    await ScoreService.saveScore(
      level: widget.level,
      score: widget.score,
      total: widget.total,
    );
    if (mounted) setState(() => saving = false);
  }

  void _playAgain() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LevelScreen(category: widget.category),
      ),
    );
  }

  void _retryLevel() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => QuestionsScreen(category: widget.category, level: widget.level),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double percent = (widget.score / widget.total) * 100;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Result",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Icon(
              Icons.emoji_events_rounded,
              size: 80,
              color: Colors.deepPurple.shade700,
            ),
            const SizedBox(height: 20),
            Text(
              "Level: ${widget.level.toUpperCase()}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              "Your Score",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple.shade700,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "${widget.score} / ${widget.total}",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "${percent.toStringAsFixed(1)}%",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey.shade700,
              ),
            ),
            if (saving) ...[
              const SizedBox(height: 10),
              const Text(
                "Saving your score...",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _retryLevel,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  "RETRY LEVEL",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _playAgain,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  "PLAY AGAIN",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

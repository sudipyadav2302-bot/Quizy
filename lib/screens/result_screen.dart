import 'package:QUIZY/screens/home_screen.dart';
import 'package:flutter/material.dart';
import '../screens/questions_screen.dart';
import '../services/score_service.dart';
import '../services/feedback_service.dart';

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
    required this.category,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool saving = false;
  bool submittingFeedback = false;

  final TextEditingController _feedbackController = TextEditingController();

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

  Future<void> _submitFeedback() async {
    final message = _feedbackController.text.trim();
    if (message.isEmpty) return;

    setState(() => submittingFeedback = true);

    await FeedbackService.submitFeedback(
      message: message,
      category: widget.category,
      level: widget.level,
      score: widget.score,
    );

    setState(() => submittingFeedback = false);
    _feedbackController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Feedback submitted")),
    );
  }

  void _playAgain() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>  const HomeScreen(),
      ),
    );
  }

  void _retryLevel() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => QuestionsScreen(
          category: widget.category,
          level: widget.level,
        ),
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
      body: SingleChildScrollView(
      child: Padding(
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

            const SizedBox(height: 30),

            // FEEDBACK BOX
            TextField(
              controller: _feedbackController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: "Your Feedback",
                hintText: "Write something...",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: submittingFeedback ? null : _submitFeedback,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: submittingFeedback
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        "SUBMIT",
                        style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 229, 166, 166)),
                      ),
              ),
            ),
            const SizedBox(height: 20),

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

            const SizedBox(height: 20),

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
    ),   
     );
  }
}

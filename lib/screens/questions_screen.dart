import 'dart:async';
import 'package:flutter/material.dart';
import '../services/firebase_question_service.dart';
import '../models/question_model.dart';
import '../widgets/option_card.dart';

class QuestionsScreen extends StatefulWidget {
  final String category;   // <-- ADDED
  final String level;

  const QuestionsScreen({
    super.key,
    required this.category,
    required this.level,
  });

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  List<QuestionModel> questions = [];
  bool isLoading = true;

  int currentIndex = 0;
  int selectedIndex = -1;
  int score = 0;
  bool showExplanation = false;

  int timeLeft = 30;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    questions = await FirebaseQuestionService.getQuestions(
      widget.category,
      widget.level,
    );

    setState(() {
      isLoading = false;
    });

    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (timeLeft == 0) {
        t.cancel();
        setState(() => showExplanation = true);
      } else {
        setState(() => timeLeft--);
      }
    });
  }

  void _onOptionTap(int index) {
    if (selectedIndex != -1) return;

    setState(() {
      selectedIndex = index;
      showExplanation = true;
      timer?.cancel();

      if (index == questions[currentIndex].correctIndex) {
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
        timeLeft = 30;
      });
      startTimer();
    } else {
      Navigator.pushReplacementNamed(
        context,
        '/result',
        arguments: {
          'score': score,
          'total': questions.length,
          'level': widget.level,
          'category': widget.category,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: Colors.deepPurple),
        ),
      );
    }

    final question = questions[currentIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          "${widget.category.toUpperCase()} - ${widget.level.toUpperCase()}",
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TOP ROW: Question tracking + Timer
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Question ${currentIndex + 1} of ${questions.length}",
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                ),
                Text(
                  "$timeLeft s",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // QUESTION BOX
            Text(
              question.question,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            // OPTIONS
            Expanded(
              child: ListView.builder(
                itemCount: question.options.length,
                itemBuilder: (context, index) {
                  return OptionCard(
                    text: question.options[index],
                    isSelected: selectedIndex == index,
                    isCorrect: showExplanation &&
                        index == question.correctIndex,
                    isWrong: showExplanation &&
                        selectedIndex == index &&
                        selectedIndex != question.correctIndex,
                    onTap: () => _onOptionTap(index),
                  );
                },
              ),
            ),

            // ANSWER FIELD + EXPLANATION BOX
            if (showExplanation) ...[
              const SizedBox(height: 10),

              const Text(
                "The Answer is:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  question.explanation,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ],

            const SizedBox(height: 20),

            // NEXT BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: showExplanation ? _nextQuestion : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text(
                  currentIndex == questions.length - 1 ? "FINISH" : "NEXT",
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

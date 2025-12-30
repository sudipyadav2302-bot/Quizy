import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final TextEditingController feedbackController = TextEditingController();

  void _submitFeedback() {
    final text = feedbackController.text.trim();
    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter some feedback")),
      );
      return;
    }

    // TODO: Send to backend / Firebase later
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Thank you for your feedback!")),
    );

    setState(() {
      feedbackController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Feedback",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            const Text(
              "We value your feedback",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              "Tell us what you like or what we can improve in Quizy.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: TextField(
                controller: feedbackController,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  hintText: "Type your feedback here...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            PrimaryButton(
              label: "SUBMIT",
              onPressed: _submitFeedback,
            ),
          ],
        ),
      ),
    );
  }
}

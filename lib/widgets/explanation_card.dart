import 'package:flutter/material.dart';

class ExplanationPanel extends StatefulWidget {
  final String explanation;

  const ExplanationPanel({
    super.key,
    required this.explanation,
  });

  @override
  State<ExplanationPanel> createState() => _ExplanationPanelState();
}

class _ExplanationPanelState extends State<ExplanationPanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        widget.explanation,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}

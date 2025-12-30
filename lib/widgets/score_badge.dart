import 'package:flutter/material.dart';

class ScoreBadge extends StatefulWidget {
  final int score;
  final int total;

  const ScoreBadge({
    super.key,
    required this.score,
    required this.total,
  });

  @override
  State<ScoreBadge> createState() => _ScoreBadgeState();
}

class _ScoreBadgeState extends State<ScoreBadge> {
  @override
  Widget build(BuildContext context) {
    double percent = (widget.score / widget.total) * 100;

    return Column(
      children: [
        Text(
          "${widget.score} / ${widget.total}",
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          "${percent.toStringAsFixed(1)}%",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }
}


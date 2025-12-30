import 'package:flutter/material.dart';

class OptionCard extends StatefulWidget {
  final String text;
  final bool isSelected;
  final bool isCorrect;
  final bool isWrong;
  final VoidCallback onTap;

  const OptionCard({
    super.key,
    required this.text,
    required this.isSelected,
    required this.isCorrect,
    required this.isWrong,
    required this.onTap,
  });

  @override
  State<OptionCard> createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  @override
  Widget build(BuildContext context) {
    Color bgColor = Colors.grey.shade200;

    if (widget.isCorrect) {
      bgColor = Colors.green.shade300;
    } else if (widget.isWrong) bgColor = Colors.red.shade300;
    else if (widget.isSelected) bgColor = Colors.deepPurple.shade100;

    return InkWell(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          widget.text,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

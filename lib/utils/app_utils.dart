import 'package:flutter/material.dart';

class AppUtils {
  static const greetingStyle = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 48, 4, 181),
  );

  static const subTextStyle = TextStyle(
    fontSize: 16,
    color: Colors.black54,
  );

  static const sectionTitle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );

  static final primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 31, 130, 216),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );
}

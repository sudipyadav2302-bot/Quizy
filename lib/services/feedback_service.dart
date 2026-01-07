import 'package:cloud_firestore/cloud_firestore.dart';

class FeedbackService {
  static final _db = FirebaseFirestore.instance;

  static Future<void> submitFeedback({
    required String message,
    required String category,
    required String level,
    required int score,
  }) async {
    await _db.collection('Feedback').add({
      'message': message,
      'category': category,
      'level': level,
      'score': score,
      'timestamp': DateTime.now(),
    });
  }
}

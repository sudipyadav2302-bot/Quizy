import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ScoreService {
  static final _scores = FirebaseFirestore.instance.collection('scores');

  static Future<void> saveScore({
    required String level,
    required int score,
    required int total,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    await _scores.add({
      'userId': user.uid,
      'email': user.email,
      'level': level,
      'score': score,
      'total': total,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> userScoresStream() {
    final user = FirebaseAuth.instance.currentUser;
    return _scores
        .where('userId', isEqualTo: user?.uid)
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> leaderboardStream() {
    return _scores
        .orderBy('score', descending: true)
        .orderBy('timestamp', descending: true)
        .limit(20)
        .snapshots();
  }
}

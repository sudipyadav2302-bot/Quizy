import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/question_model.dart';

class FirebaseQuestionService {
  static Future<List<QuestionModel>> getQuestions(
      String category, String level) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('Questions')
        .doc(category)
        .collection(level)
        .get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      return QuestionModel(
        question: data['Question'],
        options: List<String>.from(data['option']),
        correctIndex: data['correctIndex'],
        explanation: data['Explanation'],
      );
    }).toList();
  }
}

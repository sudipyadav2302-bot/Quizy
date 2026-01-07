import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/question_model.dart';

class FirebaseQuestionService {
  static Future<List<QuestionModel>> getQuestions(
      String category, String level) async {
    try {
      // Correct Firestore path based on your screenshots:
      // Questions → Defence → Easy/Medium/Hard → Question 1, Question 2...
      final snapshot = await FirebaseFirestore.instance
          .collection('Questions')
          .doc(category)
          .collection(level)   // Easy / Medium / Hard
          .get();

      if (snapshot.docs.isEmpty) {
        print("⚠️ No questions found for $category → $level");
        return [];
      }

      return snapshot.docs.map((doc) {
        final data = doc.data();

        return QuestionModel(
          question: data['Question'] ?? '',
          options: List<String>.from(data['option'] ?? []),
          correctIndex: data['correct Index'] ?? 0,
          explanation: data['Explanation'] ?? '',
        );
      }).toList();
    } catch (e) {
      print("🔥 Error fetching questions: $e");
      return [];
    }
  }
}

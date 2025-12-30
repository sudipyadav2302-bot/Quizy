import '../models/question_model.dart';

class QuestionService {
  static List<QuestionModel> getQuestions(String level) {
    switch (level.toUpperCase()) {
      case "SIMPLE":
        return _simpleQuestions;
      case "EASY":
        return _easyQuestions;
      case "HARD":
        return _hardQuestions;
      default:
        return _simpleQuestions;
    }
  }

  static final List<QuestionModel> _simpleQuestions = [
    QuestionModel(
      question: "What is 2 + 2?",
      options: ["3", "4", "5", "6"],
      correctIndex: 1,
      explanation: "2 + 2 = 4.",
    ),
  ];

  static final List<QuestionModel> _easyQuestions = [
    QuestionModel(
      question: "What is the capital of France?",
      options: ["Berlin", "Madrid", "Paris", "Rome"],
      correctIndex: 2,
      explanation: "Paris is the capital of France.",
    ),
  ];

  static final List<QuestionModel> _hardQuestions = [
    QuestionModel(
      question: "Who developed the theory of relativity?",
      options: ["Newton", "Einstein", "Tesla", "Bohr"],
      correctIndex: 1,
      explanation: "Albert Einstein developed the theory of relativity.",
    ),
  ];
}

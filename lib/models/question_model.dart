class QuestionModel {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  QuestionModel({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      question: map['Question'],
      options: List<String>.from(map['option']),
      correctIndex: map['correct Index'],
      explanation: map['Explanation'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Question': question,
      'option': options,
      'correct Index': correctIndex,
      'Explanation': explanation,
    };
  }
}

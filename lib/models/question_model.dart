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
      question: map['question'],
      options: List<String>.from(map['options']),
      correctIndex: map['correctIndex'],
      explanation: map['explanation'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'options': options,
      'correctIndex': correctIndex,
      'explanation': explanation,
    };
  }
}

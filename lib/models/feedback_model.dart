class FeedbackModel {
  final String message;
  final DateTime timestamp;

  FeedbackModel({
    required this.message,
    required this.timestamp,
  });

  factory FeedbackModel.fromMap(Map<String, dynamic> map) {
    return FeedbackModel(
      message: map['message'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

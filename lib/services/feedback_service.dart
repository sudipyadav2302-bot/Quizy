import '../models/feedback_model.dart';

class FeedbackService {
  static final List<FeedbackModel> _feedbackList = [];

  static void submitFeedback(String message) {
    _feedbackList.add(
      FeedbackModel(
        message: message,
        timestamp: DateTime.now(),
      ),
    );
  }

  static List<FeedbackModel> getAllFeedback() {
    return _feedbackList;
  }
}

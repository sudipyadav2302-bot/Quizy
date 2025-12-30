class Helpers {
  static String formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  static String formatTime(DateTime date) {
    return "${date.hour}:${date.minute.toString().padLeft(2, '0')}";
  }

  static String formatDateTime(DateTime date) {
    return "${formatDate(date)} at ${formatTime(date)}";
  }

  static String percentage(int score, int total) {
    if (total == 0) return "0%";
    double percent = (score / total) * 100;
    return "${percent.toStringAsFixed(1)}%";
  }
}

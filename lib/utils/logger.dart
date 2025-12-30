class Logger {
  static void log(String message) {
    final time = DateTime.now().toIso8601String();
    // ignore: avoid_print
    print("[QUIZY LOG - $time] $message");
  }
}

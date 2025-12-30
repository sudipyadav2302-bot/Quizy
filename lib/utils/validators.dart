class Validators {
  static String? validateEmail(String value) {
    if (value.isEmpty) return "Email cannot be empty";
    if (!value.contains("@") || !value.contains(".")) {
      return "Enter a valid email";
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) return "Password cannot be empty";
    if (value.length < 6) return "Password must be at least 6 characters";
    return null;
  }

  static String? validateName(String value) {
    if (value.isEmpty) return "Name cannot be empty";
    if (value.length < 3) return "Name too short";
    return null;
  }
}

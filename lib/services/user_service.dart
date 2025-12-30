import '../models/user_model.dart';

class UserService {
  static UserModel currentUser = UserModel(
    name: "Sudip",
    email: "sudip@example.com",
    level: "EASY",
  );

  static UserModel getUser() {
    return currentUser;
  }

  static void updateName(String name) {
    currentUser = UserModel(
      name: name,
      email: currentUser.email,
      level: currentUser.level,
    );
  }

  static void updateEmail(String email) {
    currentUser = UserModel(
      name: currentUser.name,
      email: email,
      level: currentUser.level,
    );
  }

  static void updateLevel(String level) {
    currentUser = UserModel(
      name: currentUser.name,
      email: currentUser.email,
      level: level,
    );
  }
}

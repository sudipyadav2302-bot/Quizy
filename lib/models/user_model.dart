class UserModel {
  final String name;
  final String email;
  final String level;

  UserModel({
    required this.name,
    required this.email,
    required this.level,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      email: map['email'],
      level: map['level'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'level': level,
    };
  }
}

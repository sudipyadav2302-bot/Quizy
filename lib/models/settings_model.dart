class SettingsModel {
  bool soundEnabled;
  bool notificationsEnabled;
  bool darkModeEnabled;

  SettingsModel({
    required this.soundEnabled,
    required this.notificationsEnabled,
    required this.darkModeEnabled,
  });

  factory SettingsModel.fromMap(Map<String, dynamic> map) {
    return SettingsModel(
      soundEnabled: map['soundEnabled'],
      notificationsEnabled: map['notificationsEnabled'],
      darkModeEnabled: map['darkModeEnabled'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'soundEnabled': soundEnabled,
      'notificationsEnabled': notificationsEnabled,
      'darkModeEnabled': darkModeEnabled,
    };
  }
}

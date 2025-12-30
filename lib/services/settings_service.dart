import '../models/settings_model.dart';

class SettingsService {
  static SettingsModel settings = SettingsModel(
    soundEnabled: true,
    notificationsEnabled: true,
    darkModeEnabled: false,
  );

  static SettingsModel getSettings() {
    return settings;
  }

  static void updateSound(bool value) {
    settings.soundEnabled = value;
  }

  static void updateNotifications(bool value) {
    settings.notificationsEnabled = value;
  }

  static void updateDarkMode(bool value) {
    settings.darkModeEnabled = value;
  }
}

import 'package:checkar_app/features/settings/data/settings_data.dart';

class EditProfileData {
  EditProfileData._();

  static String get fullName => SettingsData.fullName;
  static String get email => SettingsData.email;
  static String get phone => '+1 (555) 012-3456';
  static String get initials => SettingsData.initials;
}

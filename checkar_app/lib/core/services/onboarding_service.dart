import 'package:shared_preferences/shared_preferences.dart';

/// Tracks whether the user has already been through the onboarding flow,
/// so it only ever shows on the first app launch.
class OnboardingService {
  OnboardingService._();

  static const String _seenOnboardingKey = 'has_seen_onboarding';

  static Future<bool> hasSeenOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_seenOnboardingKey) ?? false;
  }

  static Future<void> markOnboardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_seenOnboardingKey, true);
  }
}

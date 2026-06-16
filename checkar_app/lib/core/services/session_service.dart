import 'package:shared_preferences/shared_preferences.dart';

/// Tracks whether a user session is currently active, so the app can
/// stay logged in across restarts until the user explicitly signs out.
class SessionService {
  SessionService._();

  static const String _isLoggedInKey = 'is_logged_in';

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  static Future<void> markLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, true);
  }

  static Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_isLoggedInKey);
  }
}

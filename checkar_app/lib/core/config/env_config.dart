import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  EnvConfig._();

  static Future<void> load() => dotenv.load(fileName: '.env');

  static String get geminiApiKey => dotenv.env['GEMINI_API_KEY'] ?? '';

  static String get geminiModel =>
      dotenv.env['GEMINI_MODEL'] ?? 'gemini-2.5-flash';
}

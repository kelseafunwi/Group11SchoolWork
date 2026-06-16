import 'dart:typed_data';

import 'package:google_generative_ai/google_generative_ai.dart';

import 'package:checkar_app/core/config/env_config.dart';

/// Thin wrapper around the Gemini generative model used across the app's
/// diagnosis features (engine sound analysis, camera-based scans, etc).
class GeminiService {
  GeminiService._();

  static final GeminiService instance = GeminiService._();

  GenerativeModel? _model;

  GenerativeModel get _generativeModel {
    return _model ??= GenerativeModel(
      model: EnvConfig.geminiModel,
      apiKey: EnvConfig.geminiApiKey,
    );
  }

  Future<String> generateText(String prompt) async {
    final response = await _generativeModel.generateContent([
      Content.text(prompt),
    ]);
    return response.text ?? '';
  }

  Future<String> analyzeImage({
    required String prompt,
    required Uint8List imageBytes,
    String mimeType = 'image/jpeg',
  }) async {
    final content = Content.multi([
      TextPart(prompt),
      DataPart(mimeType, imageBytes),
    ]);
    final response = await _generativeModel.generateContent([content]);
    return response.text ?? '';
  }

  Future<String> analyzeAudio({
    required String prompt,
    required Uint8List audioBytes,
    String mimeType = 'audio/mp4',
  }) async {
    final content = Content.multi([
      TextPart(prompt),
      DataPart(mimeType, audioBytes),
    ]);
    final response = await _generativeModel.generateContent([content]);
    return response.text ?? '';
  }
}

import 'dart:convert';
import 'dart:typed_data';

import 'package:checkar_app/core/services/gemini_service.dart';
import 'package:checkar_app/features/results/models/diagnosis_issue.dart';

/// Sends captured scans (photos or engine-sound recordings) to Gemini and
/// turns the response into a structured [DiagnosisReport].
class VehicleDiagnosisService {
  VehicleDiagnosisService._();

  static final VehicleDiagnosisService instance = VehicleDiagnosisService._();

  static const String _schemaInstructions =
      'Respond with strict JSON only, no markdown fences or commentary, '
      'matching exactly this shape: {"summary": string, "issues": '
      '[{"title": string, "description": string, '
      '"severity": "urgent" | "warning" | "healthy", '
      '"badge": string or null, "recommendation": string or null}]}. '
      'List every notable finding, and include at least one "healthy" '
      'entry for systems that look fine.';

  Future<DiagnosisReport> diagnoseImage(Uint8List imageBytes) async {
    const prompt =
        'You are an automotive diagnostic assistant. Examine this photo of '
        'a vehicle dashboard, engine bay, or exterior and identify any '
        'visible warning lights, dashboard alerts, leaks, or visible '
        'mechanical issues. $_schemaInstructions';

    final response = await GeminiService.instance.analyzeImage(
      prompt: prompt,
      imageBytes: imageBytes,
    );
    return _parseReport(response);
  }

  Future<DiagnosisReport> diagnoseAudio(Uint8List audioBytes) async {
    const prompt =
        'You are an automotive diagnostic assistant. Listen to this engine '
        'sound recording and identify any abnormal noises (knocking, '
        'squealing, misfires, rattling, etc.) that suggest mechanical '
        'issues. $_schemaInstructions';

    final response = await GeminiService.instance.analyzeAudio(
      prompt: prompt,
      audioBytes: audioBytes,
    );
    return _parseReport(response);
  }

  DiagnosisReport _parseReport(String rawResponse) {
    final jsonString = _extractJson(rawResponse);
    final decoded = jsonDecode(jsonString) as Map<String, dynamic>;
    return DiagnosisReport.fromJson(decoded);
  }

  String _extractJson(String text) {
    final start = text.indexOf('{');
    final end = text.lastIndexOf('}');
    if (start == -1 || end == -1 || end < start) {
      throw const FormatException('No JSON object found in Gemini response.');
    }
    return text.substring(start, end + 1);
  }
}

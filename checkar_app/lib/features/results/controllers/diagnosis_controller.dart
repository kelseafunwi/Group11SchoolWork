import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:checkar_app/core/services/vehicle_diagnosis_service.dart';
import 'package:checkar_app/features/results/models/diagnosis_issue.dart';

enum DiagnosisStatus { idle, loading, success, error }

/// Holds the state of the current scan-to-Gemini round trip so the
/// Scan, Analysing, and Results screens can share it.
class DiagnosisController extends GetxController {
  final Rx<DiagnosisStatus> status = DiagnosisStatus.idle.obs;
  final Rxn<DiagnosisReport> report = Rxn<DiagnosisReport>();
  final RxString errorMessage = ''.obs;

  Future<void> analyzeImage(Uint8List imageBytes) => _run(
        () => VehicleDiagnosisService.instance.diagnoseImage(imageBytes),
      );

  Future<void> analyzeAudio(Uint8List audioBytes) => _run(
        () => VehicleDiagnosisService.instance.diagnoseAudio(audioBytes),
      );

  Future<void> _run(Future<DiagnosisReport> Function() task) async {
    status.value = DiagnosisStatus.loading;
    errorMessage.value = '';
    try {
      report.value = await task();
      status.value = DiagnosisStatus.success;
    } catch (_) {
      errorMessage.value = "We couldn't analyze that scan. Please try again.";
      status.value = DiagnosisStatus.error;
    }
  }
}

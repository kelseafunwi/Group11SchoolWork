import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:checkar_app/core/routes/app_routes.dart';
import 'package:checkar_app/core/theme/app_colors.dart';
import 'package:checkar_app/features/analysing/widgets/analysis_status_card.dart';
import 'package:checkar_app/features/analysing/widgets/analysis_step_indicator.dart';
import 'package:checkar_app/features/analysing/widgets/analysing_icon.dart';
import 'package:checkar_app/features/auth/widgets/auth_app_bar.dart';
import 'package:checkar_app/features/results/controllers/diagnosis_controller.dart';

class AnalysingView extends StatefulWidget {
  const AnalysingView({super.key});

  @override
  State<AnalysingView> createState() => _AnalysingViewState();
}

class _AnalysingViewState extends State<AnalysingView>
    with SingleTickerProviderStateMixin {
  static const Duration _minimumDisplayDuration = Duration(milliseconds: 1200);

  late final AnimationController _rotationController;
  late final DiagnosisController _diagnosisController;
  late final DateTime _startedAt;
  Timer? _stepTimer;
  Worker? _statusWorker;
  bool _hasNavigated = false;

  int _activeStep = 0;
  bool _obdComplete = false;
  bool _sensorComplete = false;

  @override
  void initState() {
    super.initState();
    _startedAt = DateTime.now();

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _stepTimer = Timer.periodic(const Duration(milliseconds: 700), (timer) {
      if (!mounted) return;
      setState(() {
        if (_activeStep < 2) {
          _activeStep++;
          _obdComplete = _activeStep >= 1;
          _sensorComplete = _activeStep >= 2;
        }
      });
      if (_activeStep >= 2) timer.cancel();
    });

    _diagnosisController = Get.find<DiagnosisController>();
    _statusWorker = ever<DiagnosisStatus>(
      _diagnosisController.status,
      _handleStatusChange,
    );
    _handleStatusChange(_diagnosisController.status.value);
  }

  void _handleStatusChange(DiagnosisStatus status) {
    if (status != DiagnosisStatus.success && status != DiagnosisStatus.error) {
      return;
    }

    final elapsed = DateTime.now().difference(_startedAt);
    final remaining = _minimumDisplayDuration - elapsed;

    if (remaining > Duration.zero) {
      Future.delayed(remaining, () => _finishAnalysis(status));
    } else {
      _finishAnalysis(status);
    }
  }

  void _finishAnalysis(DiagnosisStatus status) {
    if (!mounted || _hasNavigated) return;
    _hasNavigated = true;

    if (status == DiagnosisStatus.success) {
      Get.offNamed(AppRoutes.results);
    } else {
      Get.offNamed(AppRoutes.home);
      Get.snackbar('Scan failed', _diagnosisController.errorMessage.value);
    }
  }

  @override
  void dispose() {
    _stepTimer?.cancel();
    _statusWorker?.dispose();
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.navy,
        appBar: AuthAppBar(
          title: 'Analysing...',
          variant: AppHeaderVariant.dark,
          onBack: () => Get.back(),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
                  child: Column(
                    children: [
                      AnalysisStepIndicator(activeStep: _activeStep),
                      const Spacer(),
                      AnalysingIcon(rotation: _rotationController),
                      const SizedBox(height: 28),
                      const Text(
                        'Analysing your car...',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.navy,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Gemini is reviewing your scan.',
                        style: TextStyle(
                          color: AppColors.greyDark,
                          fontSize: 13,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          AnalysisStatusCard(
                            icon: Icons.memory_outlined,
                            label: 'OBD-II Scan',
                            isComplete: _obdComplete,
                          ),
                          const SizedBox(width: 12),
                          AnalysisStatusCard(
                            icon: Icons.sensors,
                            label: 'Sensor Check',
                            isComplete: _sensorComplete,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 4,
              width: double.infinity,
              color: AppColors.teal,
            ),
          ],
        ),
      ),
    );
  }
}

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

class AnalysingView extends StatefulWidget {
  const AnalysingView({super.key});

  @override
  State<AnalysingView> createState() => _AnalysingViewState();
}

class _AnalysingViewState extends State<AnalysingView>
    with SingleTickerProviderStateMixin {
  static const Duration _analysisDuration = Duration(seconds: 3);

  late final AnimationController _rotationController;
  Timer? _stepTimer;
  Timer? _completionTimer;

  int _activeStep = 0;
  bool _obdComplete = false;
  bool _sensorComplete = false;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _stepTimer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      if (!mounted) return;
      setState(() {
        if (_activeStep < 2) {
          _activeStep++;
        }
      });
    });

    Future.delayed(const Duration(milliseconds: 1200), () {
      if (mounted) setState(() => _obdComplete = true);
    });
    Future.delayed(const Duration(milliseconds: 2200), () {
      if (mounted) setState(() => _sensorComplete = true);
    });

    _completionTimer = Timer(_analysisDuration, _finishAnalysis);
  }

  void _finishAnalysis() {
    if (!mounted) return;
    Get.offNamed(AppRoutes.results);
  }

  @override
  void dispose() {
    _stepTimer?.cancel();
    _completionTimer?.cancel();
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
                        'This takes about 3 seconds.',
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

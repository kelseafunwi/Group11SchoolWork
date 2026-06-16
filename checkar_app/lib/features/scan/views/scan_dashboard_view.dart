import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:checkar_app/core/routes/app_routes.dart';
import 'package:checkar_app/core/theme/app_colors.dart';
import 'package:checkar_app/features/auth/widgets/auth_app_bar.dart';
import 'package:checkar_app/features/results/controllers/diagnosis_controller.dart';
import 'package:checkar_app/features/scan/widgets/camera_controls_panel.dart';
import 'package:checkar_app/features/scan/widgets/dashboard_camera_preview.dart';

class ScanDashboardView extends StatefulWidget {
  const ScanDashboardView({super.key});

  @override
  State<ScanDashboardView> createState() => _ScanDashboardViewState();
}

class _ScanDashboardViewState extends State<ScanDashboardView> {
  CameraController? _cameraController;
  bool _isCapturing = false;

  Future<void> _onCapture() async {
    final controller = _cameraController;
    if (_isCapturing ||
        controller == null ||
        !controller.value.isInitialized) {
      return;
    }

    setState(() => _isCapturing = true);

    try {
      final photo = await controller.takePicture();
      final imageBytes = await File(photo.path).readAsBytes();

      unawaited(Get.find<DiagnosisController>().analyzeImage(imageBytes));

      if (mounted) Get.offNamed(AppRoutes.analysing);
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Unable to capture photo. Please try again.'),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isCapturing = false);
    }
  }

  Future<void> _onPickFromGallery() async {
    if (_isCapturing) return;

    setState(() => _isCapturing = true);

    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageBytes = await image.readAsBytes();

      unawaited(Get.find<DiagnosisController>().analyzeImage(imageBytes));

      if (mounted) Get.offNamed(AppRoutes.analysing);
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Unable to load that photo. Please try again.'),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isCapturing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.navy,
        appBar: AuthAppBar(
          title: 'Scan dashboard',
          variant: AppHeaderVariant.dark,
          onBack: () => Get.back(),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 11,
              child: DashboardCameraPreview(
                onCameraReady: (controller) => _cameraController = controller,
              ),
            ),
            Expanded(
              flex: 9,
              child: CameraControlsPanel(
                onCapture: _isCapturing ? null : _onCapture,
                onPickFromGallery: _isCapturing ? null : _onPickFromGallery,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

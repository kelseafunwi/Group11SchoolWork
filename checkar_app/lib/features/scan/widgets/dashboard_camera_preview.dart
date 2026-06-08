import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:checkar_app/core/theme/app_colors.dart';
import 'package:checkar_app/features/scan/widgets/scan_frame_overlay.dart';

class DashboardCameraPreview extends StatefulWidget {
  const DashboardCameraPreview({super.key});

  @override
  State<DashboardCameraPreview> createState() => _DashboardCameraPreviewState();
}

class _DashboardCameraPreviewState extends State<DashboardCameraPreview> {
  CameraController? _controller;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        setState(() => _errorMessage = 'No camera found on this device.');
        return;
      }

      final camera = cameras.firstWhere(
        (device) => device.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );

      final controller = CameraController(
        camera,
        ResolutionPreset.high,
        enableAudio: false,
      );

      await controller.initialize();

      if (!mounted) {
        await controller.dispose();
        return;
      }

      setState(() => _controller = controller);
    } catch (_) {
      if (mounted) {
        setState(() => _errorMessage = 'Unable to access the camera.');
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_errorMessage != null) {
      return ColoredBox(
        color: const Color(0xFF1A2836),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              _errorMessage!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 13,
              ),
            ),
          ),
        ),
      );
    }

    if (_controller == null || !_controller!.value.isInitialized) {
      return const ColoredBox(
        color: Color(0xFF1A2836),
        child: Center(
          child: CircularProgressIndicator(color: AppColors.teal),
        ),
      );
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        CameraPreview(_controller!),
        Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.center,
              radius: 1.1,
              colors: [
                Colors.transparent,
                Colors.black.withValues(alpha: 0.35),
              ],
            ),
          ),
        ),
        const ScanFrameOverlay(),
      ],
    );
  }
}

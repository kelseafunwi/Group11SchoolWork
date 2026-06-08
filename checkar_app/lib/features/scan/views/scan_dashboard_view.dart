import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:checkar_app/core/routes/app_routes.dart';
import 'package:checkar_app/core/theme/app_colors.dart';
import 'package:checkar_app/features/auth/widgets/auth_app_bar.dart';
import 'package:checkar_app/features/scan/widgets/camera_controls_panel.dart';
import 'package:checkar_app/features/scan/widgets/dashboard_camera_preview.dart';

class ScanDashboardView extends StatelessWidget {
  const ScanDashboardView({super.key});

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
            const Expanded(
              flex: 11,
              child: DashboardCameraPreview(),
            ),
            Expanded(
              flex: 9,
              child: CameraControlsPanel(
                onCapture: () => Get.offNamed(AppRoutes.analysing),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

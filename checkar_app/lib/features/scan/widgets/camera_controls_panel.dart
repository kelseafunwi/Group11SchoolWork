import 'package:flutter/material.dart';
import 'package:checkar_app/core/theme/app_colors.dart';

class CameraControlsPanel extends StatelessWidget {
  const CameraControlsPanel({
    super.key,
    this.onCapture,
  });

  final VoidCallback? onCapture;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
      child: Column(
        children: [
          const Text(
            'Ensure good lighting and keep the device steady for accurate scanning.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.greyDark,
              fontSize: 12,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 28),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ControlIconButton(
                icon: Icons.flash_off_outlined,
                onPressed: () {},
              ),
              const SizedBox(width: 40),
              _CaptureButton(onPressed: onCapture ?? () {}),
              const SizedBox(width: 40),
              _ControlIconButton(
                icon: Icons.cameraswitch_outlined,
                onPressed: () {},
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.teal.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.teal.withValues(alpha: 0.35),
              ),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: AppColors.teal,
                  size: 20,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Tip: engine off, ignition on for best results.',
                    style: TextStyle(
                      color: AppColors.teal,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ControlIconButton extends StatelessWidget {
  const _ControlIconButton({
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, color: AppColors.greyDark, size: 28),
    );
  }
}

class _CaptureButton extends StatelessWidget {
  const _CaptureButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.navy,
      borderRadius: BorderRadius.circular(16),
      elevation: 4,
      shadowColor: AppColors.navy.withValues(alpha: 0.35),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(16),
        child: const SizedBox(
          width: 72,
          height: 72,
          child: Icon(
            Icons.photo_camera_outlined,
            color: AppColors.white,
            size: 32,
          ),
        ),
      ),
    );
  }
}

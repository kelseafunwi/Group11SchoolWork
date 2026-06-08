import 'package:flutter/material.dart';
import 'package:checkar_app/core/theme/app_colors.dart';

class AnalysingIcon extends StatelessWidget {
  const AnalysingIcon({
    super.key,
    required this.rotation,
  });

  final Animation<double> rotation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 104,
            height: 104,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.teal, width: 3),
            ),
            child: RotationTransition(
              turns: rotation,
              child: const Icon(
                Icons.settings,
                color: AppColors.teal,
                size: 52,
              ),
            ),
          ),
          const Positioned(
            top: 18,
            right: 14,
            child: Icon(
              Icons.auto_awesome,
              color: AppColors.teal,
              size: 16,
            ),
          ),
          const Positioned(
            top: 28,
            right: 6,
            child: Icon(
              Icons.auto_awesome,
              color: AppColors.teal,
              size: 12,
            ),
          ),
          const Positioned(
            top: 12,
            right: 28,
            child: Icon(
              Icons.auto_awesome,
              color: AppColors.teal,
              size: 10,
            ),
          ),
        ],
      ),
    );
  }
}

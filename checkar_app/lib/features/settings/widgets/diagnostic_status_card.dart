import 'package:flutter/material.dart';
import 'package:checkar_app/core/theme/app_colors.dart';

class DiagnosticStatusCard extends StatelessWidget {
  const DiagnosticStatusCard({
    super.key,
    required this.lastChecked,
  });

  final String lastChecked;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.paleGrey,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.paleGrey),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            right: -20,
            bottom: -20,
            child: Icon(
              Icons.memory_outlined,
              size: 140,
              color: AppColors.greyLight.withValues(alpha: 0.45),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'DIAGNOSTIC STATUS',
                  style: TextStyle(
                    color: AppColors.teal,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.8,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Last checked: $lastChecked',
                  style: const TextStyle(
                    color: AppColors.greyDark,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
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

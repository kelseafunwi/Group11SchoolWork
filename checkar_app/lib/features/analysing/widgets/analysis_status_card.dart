import 'package:flutter/material.dart';
import 'package:checkar_app/core/theme/app_colors.dart';

class AnalysisStatusCard extends StatelessWidget {
  const AnalysisStatusCard({
    super.key,
    required this.icon,
    required this.label,
    this.isComplete = false,
  });

  final IconData icon;
  final String label;
  final bool isComplete;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.paleGrey.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.paleGrey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isComplete ? Icons.check_circle : icon,
              color: AppColors.teal,
              size: 20,
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                label,
                style: const TextStyle(
                  color: AppColors.greyDark,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

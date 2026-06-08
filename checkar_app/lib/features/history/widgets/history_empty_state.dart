import 'package:flutter/material.dart';
import 'package:checkar_app/core/theme/app_colors.dart';

class HistoryEmptyState extends StatelessWidget {
  const HistoryEmptyState({
    super.key,
    required this.onStartDiagnosis,
  });

  final VoidCallback onStartDiagnosis;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 48),
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.paleGrey,
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Icon(
              Icons.directions_car_outlined,
              size: 56,
              color: AppColors.teal,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'No diagnoses yet.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.navy,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Run your first scan or recording to see results here.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.greyDark,
              fontSize: 12,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: onStartDiagnosis,
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.navy,
                foregroundColor: AppColors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Start a diagnosis',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

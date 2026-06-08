import 'package:flutter/material.dart';
import 'package:checkar_app/core/theme/app_colors.dart';

class RecordInstructionBanner extends StatelessWidget {
  const RecordInstructionBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.paleGrey,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.greyLight.withValues(alpha: 0.5)),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.mic_external_on_outlined,
            color: AppColors.greyDark,
            size: 22,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Hold phone 30 cm from engine.',
              style: TextStyle(
                color: AppColors.greyDark,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

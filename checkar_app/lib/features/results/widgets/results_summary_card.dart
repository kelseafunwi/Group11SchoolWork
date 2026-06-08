import 'package:flutter/material.dart';
import 'package:checkar_app/core/theme/app_colors.dart';

class ResultsSummaryCard extends StatelessWidget {
  const ResultsSummaryCard({
    super.key,
    required this.vehicleName,
    required this.scanDate,
    required this.issueCount,
  });

  final String vehicleName;
  final String scanDate;
  final int issueCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.paleGrey),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  vehicleName,
                  style: const TextStyle(
                    color: AppColors.teal,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                scanDate,
                style: const TextStyle(
                  color: AppColors.greyDark,
                  fontSize: 11,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            '$issueCount issues found',
            style: const TextStyle(
              color: AppColors.greyDark,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

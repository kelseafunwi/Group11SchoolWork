import 'package:flutter/material.dart';
import 'package:checkar_app/core/theme/app_colors.dart';
import 'package:checkar_app/features/home/models/diagnosis_item.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
    required this.item,
    this.onTap,
  });

  final DiagnosisItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.paleGrey),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      item.title,
                      style: const TextStyle(
                        color: AppColors.navy,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  _StatusBadge(status: item.status),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today_outlined,
                    size: 14,
                    color: AppColors.greyDark,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    item.date,
                    style: const TextStyle(
                      color: AppColors.greyDark,
                      fontSize: 11,
                    ),
                  ),
                  if (item.vehicleName != null) ...[
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        '•',
                        style: TextStyle(
                          color: AppColors.greyLight,
                          fontSize: 11,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.directions_car_outlined,
                      size: 14,
                      color: AppColors.greyDark,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        item.vehicleName!,
                        style: const TextStyle(
                          color: AppColors.greyDark,
                          fontSize: 11,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});

  final DiagnosisStatus status;

  Color get _backgroundColor => switch (status) {
        DiagnosisStatus.urgent => AppColors.urgent,
        DiagnosisStatus.warning => AppColors.warning,
        DiagnosisStatus.healthy => AppColors.success,
      };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        status.historyLabel,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 10,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

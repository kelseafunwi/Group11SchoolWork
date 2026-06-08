import 'package:flutter/material.dart';
import 'package:checkar_app/core/theme/app_colors.dart';
import 'package:checkar_app/features/about/data/about_data.dart';

class AboutFeatureTile extends StatelessWidget {
  const AboutFeatureTile({
    super.key,
    required this.feature,
    this.showDivider = true,
  });

  final AboutFeature feature;
  final bool showDivider;

  IconData get _icon => switch (feature.icon) {
        'dashboard' => Icons.dashboard_outlined,
        'mic' => Icons.mic_outlined,
        'insights' => Icons.insights_outlined,
        'build' => Icons.build_outlined,
        _ => Icons.check_circle_outline,
      };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.lightBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  _icon,
                  color: AppColors.teal,
                  size: 22,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      feature.title,
                      style: const TextStyle(
                        color: AppColors.navy,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      feature.description,
                      style: const TextStyle(
                        color: AppColors.greyDark,
                        fontSize: 11,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (showDivider)
          const Divider(
            height: 1,
            thickness: 1,
            color: AppColors.paleGrey,
            indent: 70,
          ),
      ],
    );
  }
}

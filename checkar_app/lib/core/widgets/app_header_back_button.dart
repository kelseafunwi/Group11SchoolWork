import 'package:flutter/material.dart';
import 'package:checkar_app/core/theme/app_colors.dart';

enum AppHeaderBackButtonStyle { light, dark }

class AppHeaderBackButton extends StatelessWidget {
  const AppHeaderBackButton({
    super.key,
    required this.onPressed,
    this.style = AppHeaderBackButtonStyle.light,
  });

  final VoidCallback onPressed;
  final AppHeaderBackButtonStyle style;

  @override
  Widget build(BuildContext context) {
    final isDark = style == AppHeaderBackButtonStyle.dark;

    return Material(
      color: isDark
          ? AppColors.white.withValues(alpha: 0.12)
          : AppColors.offWhite,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          width: 40,
          height: 40,
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 18,
            color: isDark ? AppColors.white : AppColors.navy,
          ),
        ),
      ),
    );
  }
}

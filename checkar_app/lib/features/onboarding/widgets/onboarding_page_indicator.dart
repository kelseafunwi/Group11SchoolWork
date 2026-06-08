import 'package:flutter/material.dart';
import 'package:checkar_app/core/theme/app_colors.dart';

class OnboardingPageIndicator extends StatelessWidget {
  const OnboardingPageIndicator({
    super.key,
    required this.pageCount,
    required this.currentPage,
  });

  final int pageCount;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) {
        final isActive = index == currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 8 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive ? AppColors.navy : AppColors.greyLight,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}

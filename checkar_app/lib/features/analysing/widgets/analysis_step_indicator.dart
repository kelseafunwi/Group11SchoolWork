import 'package:flutter/material.dart';
import 'package:checkar_app/core/theme/app_colors.dart';

class AnalysisStepIndicator extends StatelessWidget {
  const AnalysisStepIndicator({
    super.key,
    required this.activeStep,
  });

  final int activeStep;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (index) {
          final isComplete = index < activeStep;
          final isCurrent = index == activeStep;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                if (isComplete)
                  const Positioned(
                    top: -14,
                    child: _StepCheckBadge(),
                  ),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCurrent || isComplete
                        ? AppColors.teal
                        : Colors.transparent,
                    border: Border.all(
                      color: isCurrent || isComplete
                          ? AppColors.teal
                          : AppColors.greyLight,
                      width: 2,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _StepCheckBadge extends StatelessWidget {
  const _StepCheckBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: const BoxDecoration(
        color: AppColors.success,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.check,
        color: AppColors.white,
        size: 12,
      ),
    );
  }
}

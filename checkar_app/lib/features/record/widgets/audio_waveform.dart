import 'package:flutter/material.dart';
import 'package:checkar_app/core/theme/app_colors.dart';

class AudioWaveform extends StatelessWidget {
  const AudioWaveform({
    super.key,
    required this.barHeights,
  });

  final List<double> barHeights;

  static const List<double> idleHeights = [
    0.28,
    0.42,
    0.58,
    0.72,
    0.88,
    0.76,
    0.88,
    0.72,
    0.58,
    0.42,
    0.28,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(barHeights.length, (index) {
          final height = barHeights[index].clamp(0.15, 1.0);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 120),
              curve: Curves.easeOut,
              width: 8,
              height: 72 * height,
              decoration: BoxDecoration(
                color: AppColors.teal,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          );
        }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:checkar_app/core/theme/app_colors.dart';

class EngineReferenceImage extends StatelessWidget {
  const EngineReferenceImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: 140,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF6B7280),
                    Color(0xFF374151),
                  ],
                ),
              ),
              child: Icon(
                Icons.directions_car_filled_outlined,
                size: 64,
                color: AppColors.white.withValues(alpha: 0.2),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppColors.offWhite.withValues(alpha: 0.95),
                  ],
                  stops: const [0.55, 1.0],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

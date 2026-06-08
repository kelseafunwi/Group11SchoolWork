import 'package:flutter/material.dart';
import 'package:checkar_app/core/theme/app_colors.dart';

class MechanicMapPreview extends StatelessWidget {
  const MechanicMapPreview({
    super.key,
    required this.mechanicLabel,
  });

  final String mechanicLabel;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: 160,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              color: AppColors.paleGrey,
              child: CustomPaint(
                painter: _MapGridPainter(),
                child: const SizedBox.expand(),
              ),
            ),
            ...List.generate(4, (index) {
              final offsets = [
                const Offset(0.25, 0.35),
                const Offset(0.55, 0.25),
                const Offset(0.7, 0.55),
                const Offset(0.4, 0.65),
              ];
              return Positioned(
                left: MediaQuery.sizeOf(context).width * offsets[index].dx * 0.7,
                top: 160 * offsets[index].dy,
                child: Icon(
                  Icons.location_on_outlined,
                  color: AppColors.greyLight,
                  size: 22,
                ),
              );
            }),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Text(
                      mechanicLabel,
                      style: const TextStyle(
                        color: AppColors.navy,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.location_on,
                    color: AppColors.teal,
                    size: 36,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.greyLight.withValues(alpha: 0.35)
      ..strokeWidth = 1;

    const spacing = 28.0;
    for (var x = 0.0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (var y = 0.0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

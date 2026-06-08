import 'package:flutter/material.dart';
import 'package:checkar_app/core/theme/app_colors.dart';

class ScanFrameOverlay extends StatelessWidget {
  const ScanFrameOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 280,
        height: 200,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const _ScanCorners(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.55),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Align dashboard here',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScanCorners extends StatelessWidget {
  const _ScanCorners();

  @override
  Widget build(BuildContext context) {
    const cornerSize = 28.0;
    const strokeWidth = 3.0;
    const color = AppColors.teal;

    Widget corner({
      required Alignment alignment,
      required Border border,
    }) {
      return Align(
        alignment: alignment,
        child: Container(
          width: cornerSize,
          height: cornerSize,
          decoration: BoxDecoration(border: border),
        ),
      );
    }

    return Stack(
      children: [
        corner(
          alignment: Alignment.topLeft,
          border: const Border(
            top: BorderSide(color: color, width: strokeWidth),
            left: BorderSide(color: color, width: strokeWidth),
          ),
        ),
        corner(
          alignment: Alignment.topRight,
          border: const Border(
            top: BorderSide(color: color, width: strokeWidth),
            right: BorderSide(color: color, width: strokeWidth),
          ),
        ),
        corner(
          alignment: Alignment.bottomLeft,
          border: const Border(
            bottom: BorderSide(color: color, width: strokeWidth),
            left: BorderSide(color: color, width: strokeWidth),
          ),
        ),
        corner(
          alignment: Alignment.bottomRight,
          border: const Border(
            bottom: BorderSide(color: color, width: strokeWidth),
            right: BorderSide(color: color, width: strokeWidth),
          ),
        ),
      ],
    );
  }
}

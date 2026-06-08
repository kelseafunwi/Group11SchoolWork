import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:checkar_app/core/theme/app_colors.dart';

/// Shared Inter type scale for CheckAR (compact sizing).
class AppTypography {
  AppTypography._();

  static TextStyle _base({
    required double size,
    required FontWeight weight,
    Color color = AppColors.navy,
    double? height,
    double? letterSpacing,
  }) {
    return GoogleFonts.inter(
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle get display => _base(size: 20, weight: FontWeight.w700);

  static TextStyle get headline => _base(size: 17, weight: FontWeight.w700);

  static TextStyle get title => _base(size: 15, weight: FontWeight.w700);

  static TextStyle get titleMedium => _base(size: 14, weight: FontWeight.w600);

  static TextStyle get body => _base(size: 13, weight: FontWeight.w400, height: 1.4);

  static TextStyle get bodyLarge =>
      _base(size: 14, weight: FontWeight.w400, height: 1.4);

  static TextStyle get bodyEmphasis =>
      _base(size: 13, weight: FontWeight.w500, color: AppColors.greyDark);

  static TextStyle get label => _base(
        size: 12,
        weight: FontWeight.w500,
        color: AppColors.greyDark,
      );

  static TextStyle get caption => _base(
        size: 11,
        weight: FontWeight.w400,
        color: AppColors.greyDark,
      );

  static TextStyle get micro => _base(
        size: 10,
        weight: FontWeight.w700,
        letterSpacing: 0.4,
      );

  static TextStyle get hint => _base(
        size: 14,
        weight: FontWeight.w400,
        color: AppColors.hint,
      );

  static TextStyle get button => _base(size: 14, weight: FontWeight.w600);

  static TextStyle get navLabel => _base(size: 11, weight: FontWeight.w500);

  static TextTheme get textTheme => TextTheme(
        displayLarge: display,
        displayMedium: headline,
        displaySmall: title,
        headlineMedium: title,
        headlineSmall: titleMedium,
        titleLarge: title,
        titleMedium: titleMedium,
        titleSmall: titleMedium,
        bodyLarge: bodyLarge,
        bodyMedium: body,
        bodySmall: bodyEmphasis,
        labelLarge: button,
        labelMedium: label,
        labelSmall: caption,
      );
}

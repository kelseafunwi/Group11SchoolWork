import 'package:flutter/material.dart';
import 'package:checkar_app/core/theme/app_colors.dart';
import 'package:checkar_app/core/theme/app_typography.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.label,
    required this.controller,
    this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.prefixIcon,
    this.suffixIcon,
    this.autocorrect = true,
    this.enableSuggestions = true,
  });

  final String label;
  final TextEditingController controller;
  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool autocorrect;
  final bool enableSuggestions;

  static const _borderRadius = BorderRadius.all(Radius.circular(12));

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTypography.label),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          autocorrect: autocorrect,
          enableSuggestions: enableSuggestions,
          cursorColor: AppColors.navy,
          style: AppTypography.body,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTypography.hint,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            suffixIconConstraints: const BoxConstraints(
              minWidth: 48,
              minHeight: 48,
            ),
            filled: true,
            fillColor: AppColors.white,
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              horizontal: prefixIcon != null ? 12 : 16,
              vertical: 16,
            ),
            border: const OutlineInputBorder(
              borderRadius: _borderRadius,
              borderSide: BorderSide(color: AppColors.paleGrey),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: _borderRadius,
              borderSide: BorderSide(color: AppColors.paleGrey),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: _borderRadius,
              borderSide: BorderSide(color: AppColors.navy, width: 1.5),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: _borderRadius,
              borderSide: BorderSide(color: AppColors.urgent),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: _borderRadius,
              borderSide: BorderSide(color: AppColors.urgent, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}

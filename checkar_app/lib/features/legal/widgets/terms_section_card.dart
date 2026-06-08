import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:checkar_app/core/theme/app_colors.dart';
import 'package:checkar_app/features/legal/data/terms_of_service_data.dart';

class TermsSectionCard extends StatelessWidget {
  const TermsSectionCard({
    super.key,
    required this.section,
  });

  final TermsSection section;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.paleGrey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section.title,
            style: GoogleFonts.inter(
              color: AppColors.navy,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            section.body,
            style: GoogleFonts.inter(
              color: AppColors.greyDark,
              fontSize: 12,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

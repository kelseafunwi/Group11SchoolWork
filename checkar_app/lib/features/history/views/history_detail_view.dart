import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:checkar_app/core/navigation/app_navigator.dart';
import 'package:checkar_app/core/theme/app_colors.dart';
import 'package:checkar_app/features/auth/widgets/app_bottom_nav_bar.dart';
import 'package:checkar_app/features/auth/widgets/auth_app_bar.dart';
import 'package:checkar_app/features/history/data/history_detail_data.dart';
import 'package:checkar_app/features/history/models/history_detail.dart';
import 'package:checkar_app/features/history/widgets/history_detail_section.dart';
import 'package:checkar_app/features/home/models/diagnosis_item.dart';

class HistoryDetailView extends StatelessWidget {
  const HistoryDetailView({super.key});

  HistoryDetail? get _detail {
    final args = Get.arguments;
    if (args is HistoryDetail) return args;
    if (args is DiagnosisItem) return HistoryDetailData.forItem(args);
    return null;
  }

  Color _statusColor(DiagnosisStatus status) => switch (status) {
        DiagnosisStatus.urgent => AppColors.urgent,
        DiagnosisStatus.warning => AppColors.warning,
        DiagnosisStatus.healthy => AppColors.success,
      };

  @override
  Widget build(BuildContext context) {
    final detail = _detail;

    if (detail == null) {
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          backgroundColor: AppColors.offWhite,
          appBar: AuthAppBar(
            title: 'History details',
            showProfileAction: false,
            onBack: () => Get.back(),
          ),
          body: const Center(
            child: Text('History record not found.'),
          ),
        ),
      );
    }

    final item = detail.item;
    final statusColor = _statusColor(item.status);
    final showMechanicAction = item.status != DiagnosisStatus.healthy;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        appBar: AuthAppBar(
          title: 'History details',
          showProfileAction: false,
          onBack: () => Get.back(),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.paleGrey),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            item.title,
                            style: GoogleFonts.inter(
                              color: AppColors.navy,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: statusColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            item.status.historyLabel,
                            style: GoogleFonts.inter(
                              color: AppColors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      detail.summary,
                      style: GoogleFonts.inter(
                        color: AppColors.greyDark,
                        fontSize: 12,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _MetaRow(
                      icon: Icons.calendar_today_outlined,
                      label: detail.recordedAt,
                    ),
                    if (item.vehicleName != null) ...[
                      const SizedBox(height: 8),
                      _MetaRow(
                        icon: Icons.directions_car_outlined,
                        label: item.vehicleName!,
                      ),
                    ],
                    const SizedBox(height: 8),
                    _MetaRow(
                      icon: Icons.sensors_outlined,
                      label: detail.diagnosticType,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              HistoryDetailSection(
                title: 'What we found',
                body: detail.description,
              ),
              const SizedBox(height: 12),
              HistoryDetailSection(
                title: 'Recommendation',
                body: detail.recommendation,
              ),
              if (showMechanicAction) ...[
                const SizedBox(height: 24),
                OutlinedButton.icon(
                  onPressed: () => AppNavigator.selectTab(AppNavItem.explore),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.teal,
                    side: const BorderSide(color: AppColors.teal),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.map_outlined, size: 20),
                  label: Text(
                    'Find a mechanic nearby',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _MetaRow extends StatelessWidget {
  const _MetaRow({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.greyDark),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            label,
            style: GoogleFonts.inter(
              color: AppColors.greyDark,
              fontSize: 11,
            ),
          ),
        ),
      ],
    );
  }
}

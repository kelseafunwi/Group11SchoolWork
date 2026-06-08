import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:checkar_app/core/navigation/app_navigator.dart';
import 'package:checkar_app/features/auth/widgets/app_bottom_nav_bar.dart';
import 'package:checkar_app/core/theme/app_colors.dart';
import 'package:checkar_app/features/auth/widgets/auth_app_bar.dart';
import 'package:checkar_app/features/results/data/results_data.dart';
import 'package:checkar_app/features/results/widgets/mechanic_map_preview.dart';
import 'package:checkar_app/features/results/widgets/result_issue_card.dart';
import 'package:checkar_app/features/results/widgets/results_summary_card.dart';

class ResultsView extends StatelessWidget {
  const ResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        appBar: AuthAppBar(
          title: 'Results',
          onBack: () => Get.back(),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ResultsSummaryCard(
                      vehicleName: ResultsData.vehicleName,
                      scanDate: ResultsData.scanDate,
                      issueCount: ResultsData.issueCount,
                    ),
                    const SizedBox(height: 16),
                    ...ResultsData.issues.map(
                      (issue) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: ResultIssueCard(issue: issue),
                      ),
                    ),
                    const SizedBox(height: 8),
                    FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.navy,
                        foregroundColor: AppColors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Save report',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton.icon(
                      onPressed: () => AppNavigator.selectTab(
                        AppNavItem.explore,
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.teal,
                        side: const BorderSide(color: AppColors.teal),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: const Icon(Icons.map_outlined, size: 20),
                      label: const Text(
                        'Find a mechanic nearby',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    MechanicMapPreview(
                      mechanicLabel: ResultsData.nearbyMechanic,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

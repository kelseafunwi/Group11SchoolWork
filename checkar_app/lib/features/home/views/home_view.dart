import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:checkar_app/core/navigation/app_navigator.dart';
import 'package:checkar_app/core/routes/app_routes.dart';
import 'package:checkar_app/features/auth/widgets/app_bottom_nav_bar.dart';
import 'package:checkar_app/core/theme/app_colors.dart';
import 'package:checkar_app/features/home/data/home_data.dart';
import 'package:checkar_app/features/home/widgets/action_card.dart';
import 'package:checkar_app/features/home/widgets/diagnosis_card.dart';
import 'package:checkar_app/features/home/widgets/health_report_banner.dart';
import 'package:checkar_app/core/widgets/main_tab_header.dart';
import 'package:checkar_app/features/home/widgets/vehicle_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.offWhite,
      child: Column(
        children: [
          MainTabHeader(
            subtitle: 'CHECKAR',
            title: 'Hi, ${HomeData.userName}',
          ),
          Expanded(
            child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    VehicleCard(
                      vehicleName: HomeData.vehicleName,
                      vehicleLabel: HomeData.vehicleLabel,
                      onChangeTap: () => Get.toNamed(AppRoutes.vehicleProfile),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'What do you want to do?',
                      style: TextStyle(
                        color: AppColors.navy,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        ActionCard(
                          icon: Icons.photo_camera_outlined,
                          title: 'Scan dashboard',
                          subtitle: 'Detect warning lights',
                          onTap: () => Get.toNamed(AppRoutes.scanDashboard),
                        ),
                        const SizedBox(width: 12),
                        ActionCard(
                          icon: Icons.mic_outlined,
                          title: 'Record sound',
                          subtitle: 'Engine noise analysis',
                          onTap: () => Get.toNamed(AppRoutes.recordEngineSound),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Recent diagnosis',
                            style: TextStyle(
                              color: AppColors.navy,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () => AppNavigator.selectTab(
                            AppNavItem.history,
                            currentItem: AppNavItem.home,
                          ),
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.teal,
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: const Text(
                            'View All',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ...HomeData.recentDiagnoses.map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: DiagnosisCard(item: item),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const HealthReportBanner(),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

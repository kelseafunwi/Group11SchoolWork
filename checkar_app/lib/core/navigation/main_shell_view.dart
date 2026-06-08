import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:checkar_app/core/navigation/main_nav_controller.dart';
import 'package:checkar_app/core/theme/app_colors.dart';
import 'package:checkar_app/features/auth/widgets/app_bottom_nav_bar.dart';
import 'package:checkar_app/features/explore/views/explore_view.dart';
import 'package:checkar_app/features/history/views/history_view.dart';
import 'package:checkar_app/features/home/views/home_view.dart';
import 'package:checkar_app/features/settings/views/settings_view.dart';

class MainShellView extends GetView<MainNavController> {
  const MainShellView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: Obx(
        () => Scaffold(
          backgroundColor: AppColors.offWhite,
          body: IndexedStack(
            index: controller.currentIndex,
            children: const [
              HomeView(),
              ExploreView(),
              HistoryView(),
              SettingsView(),
            ],
          ),
          bottomNavigationBar: AppBottomNavBar(
            currentItem: controller.currentItem.value,
            onItemSelected: controller.selectTab,
          ),
        ),
      ),
    );
  }
}

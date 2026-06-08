import 'package:get/get.dart';
import 'package:checkar_app/core/navigation/main_nav_controller.dart';
import 'package:checkar_app/core/routes/app_routes.dart';
import 'package:checkar_app/features/auth/widgets/app_bottom_nav_bar.dart';

class AppNavigator {
  AppNavigator._();

  static void onNavItemSelected(
    AppNavItem item, {
    required AppNavItem currentItem,
  }) {
    selectTab(item, currentItem: currentItem);
  }

  static void selectTab(
    AppNavItem item, {
    AppNavItem? currentItem,
  }) {
    if (currentItem != null && item == currentItem) return;

    if (Get.currentRoute == AppRoutes.home &&
        Get.isRegistered<MainNavController>()) {
      Get.find<MainNavController>().selectTab(item);
      return;
    }

    if (Get.isRegistered<MainNavController>()) {
      Get.delete<MainNavController>();
    }
    Get.offNamed(AppRoutes.home, arguments: item);
  }
}

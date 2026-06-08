import 'package:get/get.dart';
import 'package:checkar_app/features/auth/widgets/app_bottom_nav_bar.dart';

class MainNavController extends GetxController {
  MainNavController() : currentItem = _readInitialTab().obs;

  final Rx<AppNavItem> currentItem;

  static AppNavItem _readInitialTab() {
    final args = Get.arguments;
    if (args is AppNavItem) return args;
    return AppNavItem.home;
  }

  int get currentIndex => currentItem.value.index;

  void selectTab(AppNavItem item) {
    if (currentItem.value == item) return;
    currentItem.value = item;
  }
}

import 'package:get/get.dart';
import 'package:checkar_app/core/navigation/main_nav_controller.dart';

class MainNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainNavController());
  }
}

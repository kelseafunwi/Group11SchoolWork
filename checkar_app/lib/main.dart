import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:checkar_app/core/config/env_config.dart';
import 'package:checkar_app/core/routes/app_pages.dart';
import 'package:checkar_app/core/theme/app_theme.dart';
import 'package:checkar_app/features/results/controllers/diagnosis_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvConfig.load();
  Get.put(DiagnosisController(), permanent: true);
  runApp(const CheckarApp());
}

class CheckarApp extends StatelessWidget {
  const CheckarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CheckAR',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppPages.initial,
      getPages: AppPages.pages,
    );
  }
}

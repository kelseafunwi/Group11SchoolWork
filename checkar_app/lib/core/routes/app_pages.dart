import 'package:get/get.dart';
import 'package:checkar_app/core/routes/app_routes.dart';
import 'package:checkar_app/features/analysing/views/analysing_view.dart';
import 'package:checkar_app/features/auth/views/login_view.dart';
import 'package:checkar_app/features/auth/views/register_view.dart';
import 'package:checkar_app/features/auth/views/reset_password_view.dart';
import 'package:checkar_app/core/navigation/main_nav_binding.dart';
import 'package:checkar_app/core/navigation/main_shell_view.dart';
import 'package:checkar_app/features/record/views/record_engine_sound_view.dart';
import 'package:checkar_app/features/results/views/results_view.dart';
import 'package:checkar_app/features/scan/views/scan_dashboard_view.dart';
import 'package:checkar_app/features/about/views/about_view.dart';
import 'package:checkar_app/features/profile/views/edit_profile_view.dart';
import 'package:checkar_app/features/vehicle/views/vehicle_profile_view.dart';
import 'package:checkar_app/features/history/views/history_detail_view.dart';
import 'package:checkar_app/features/legal/views/terms_of_service_view.dart';
import 'package:checkar_app/features/notifications/views/notifications_view.dart';
import 'package:checkar_app/features/onboarding/views/onboarding_view.dart';
import 'package:checkar_app/features/splash/views/splash_view.dart';

class AppPages {
  AppPages._();

  static const String initial = AppRoutes.splash;

  static final List<GetPage<dynamic>> pages = [
    GetPage(name: AppRoutes.splash, page: () => const SplashView()),
    GetPage(name: AppRoutes.onboarding, page: () => const OnboardingView()),
    GetPage(name: AppRoutes.login, page: () => const LoginView()),
    GetPage(name: AppRoutes.register, page: () => const RegisterView()),
    GetPage(
      name: AppRoutes.resetPassword,
      page: () => const ResetPasswordView(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const MainShellView(),
      binding: MainNavBinding(),
    ),
    GetPage(
      name: AppRoutes.scanDashboard,
      page: () => const ScanDashboardView(),
    ),
    GetPage(
      name: AppRoutes.recordEngineSound,
      page: () => const RecordEngineSoundView(),
    ),
    GetPage(name: AppRoutes.analysing, page: () => const AnalysingView()),
    GetPage(name: AppRoutes.results, page: () => const ResultsView()),
    GetPage(
      name: AppRoutes.notifications,
      page: () => const NotificationsView(),
    ),
    GetPage(name: AppRoutes.about, page: () => const AboutView()),
    GetPage(name: AppRoutes.editProfile, page: () => const EditProfileView()),
    GetPage(
      name: AppRoutes.vehicleProfile,
      page: () => const VehicleProfileView(),
    ),
    GetPage(
      name: AppRoutes.termsOfService,
      page: () => const TermsOfServiceView(),
    ),
    GetPage(
      name: AppRoutes.historyDetail,
      page: () => const HistoryDetailView(),
    ),
  ];
}

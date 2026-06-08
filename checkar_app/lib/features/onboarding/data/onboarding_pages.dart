import 'package:checkar_app/core/constants/app_assets.dart';
import 'package:checkar_app/features/onboarding/models/onboarding_page_data.dart';

class OnboardingPages {
  OnboardingPages._();

  static const List<OnboardingPageData> pages = [
    OnboardingPageData(
      image: AppAssets.onboarding1,
      title: 'Scan your dashboard',
      description:
          'Point your camera at your warning lights to identify issues instantly.',
      buttonLabel: 'Next',
    ),
    OnboardingPageData(
      image: AppAssets.onboarding2,
      title: 'Record engine sounds',
      description:
          'Hold your phone near the engine. Our AI will analyze acoustic patterns to detect early mechanical wear.',
      buttonLabel: 'Next',
      showTrailingArrow: true,
      skipLabel: 'SKIP',
    ),
    OnboardingPageData(
      image: AppAssets.onboarding3,
      title: 'Get your diagnosis.',
      description: 'Receive instant results and repair tips.',
      buttonLabel: 'Get started',
      skipLabel: 'SKIP',
    ),
  ];
}

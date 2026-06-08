class OnboardingPageData {
  const OnboardingPageData({
    required this.image,
    required this.title,
    required this.description,
    required this.buttonLabel,
    this.showTrailingArrow = false,
    this.skipLabel = 'Skip',
  });

  final String image;
  final String title;
  final String description;
  final String buttonLabel;
  final bool showTrailingArrow;
  final String skipLabel;
}

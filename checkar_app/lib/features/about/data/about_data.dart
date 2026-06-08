class AboutData {
  AboutData._();

  static const String appName = 'CheckAR';
  static const String tagline = 'SMART CAR DIAGNOSTICS';
  static const String version = '1.0.0';
  static const String buildNumber = '1';

  static const String description =
      'CheckAR helps you understand your vehicle with instant dashboard scans, '
      'engine sound analysis, and clear diagnostic results — so you can act before small issues become costly repairs.';

  static const List<AboutFeature> features = [
    AboutFeature(
      icon: 'dashboard',
      title: 'Dashboard scanning',
      description: 'Identify warning lights and dashboard alerts with your camera.',
    ),
    AboutFeature(
      icon: 'mic',
      title: 'Engine sound analysis',
      description: 'Record engine audio and detect early signs of mechanical wear.',
    ),
    AboutFeature(
      icon: 'insights',
      title: 'Instant diagnosis',
      description: 'Get clear results with urgency levels and repair guidance.',
    ),
    AboutFeature(
      icon: 'build',
      title: 'Find nearby mechanics',
      description: 'Connect with trusted shops when your car needs professional help.',
    ),
  ];

  static const List<AboutLink> links = [
    AboutLink(title: 'Terms of Service'),
    AboutLink(title: 'Privacy Policy'),
    AboutLink(title: 'Contact support'),
  ];

  static const String copyright = '© 2026 CheckAR. All rights reserved.';
}

class AboutFeature {
  const AboutFeature({
    required this.icon,
    required this.title,
    required this.description,
  });

  final String icon;
  final String title;
  final String description;
}

class AboutLink {
  const AboutLink({required this.title});

  final String title;
}

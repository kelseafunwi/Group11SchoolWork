class TermsSection {
  const TermsSection({
    required this.title,
    required this.body,
  });

  final String title;
  final String body;
}

class TermsOfServiceData {
  TermsOfServiceData._();

  static const String lastUpdated = 'June 8, 2026';
  static const String effectiveDate = 'June 8, 2026';

  static const String introduction =
      'These Terms of Service govern your use of the CheckAR mobile application '
      'and related diagnostic services. By creating an account or using CheckAR, '
      'you agree to these terms.';

  static const List<TermsSection> sections = [
    TermsSection(
      title: '1. Service overview',
      body:
          'CheckAR provides vehicle diagnostic tools including dashboard scanning, '
          'engine sound analysis, maintenance history, and mechanic discovery features. '
          'Results are informational and do not replace professional inspection by a '
          'qualified mechanic.',
    ),
    TermsSection(
      title: '2. Account responsibilities',
      body:
          'You are responsible for maintaining the confidentiality of your login '
          'credentials and for all activity under your account. You agree to provide '
          'accurate registration information and to update it when it changes.',
    ),
    TermsSection(
      title: '3. Acceptable use',
      body:
          'You may use CheckAR only for lawful purposes related to vehicle health '
          'monitoring. You may not misuse the app, attempt to reverse engineer its '
          'systems, interfere with service availability, or upload harmful or misleading '
          'content.',
    ),
    TermsSection(
      title: '4. Diagnostic disclaimer',
      body:
          'CheckAR uses automated analysis to generate diagnostic insights. While we '
          'work to provide helpful guidance, results may be incomplete or inaccurate. '
          'Always verify critical issues with a certified technician before operating '
          'your vehicle or performing repairs.',
    ),
    TermsSection(
      title: '5. Data and privacy',
      body:
          'We collect and process account, vehicle, and diagnostic data to deliver '
          'app functionality and improve service quality. Our handling of personal '
          'information is described in the CheckAR Privacy Policy.',
    ),
    TermsSection(
      title: '6. Intellectual property',
      body:
          'CheckAR, including its branding, software, and content, is owned by CheckAR '
          'and its licensors. You receive a limited, non-exclusive license to use the app '
          'for personal, non-commercial purposes in accordance with these terms.',
    ),
    TermsSection(
      title: '7. Limitation of liability',
      body:
          'To the fullest extent permitted by law, CheckAR is not liable for indirect, '
          'incidental, or consequential damages arising from your use of the service, '
          'including vehicle damage, downtime, or repair costs based on diagnostic output.',
    ),
    TermsSection(
      title: '8. Changes and contact',
      body:
          'We may update these terms from time to time. Continued use after updates '
          'means you accept the revised terms. For questions, contact CheckAR support '
          'at support@checkar.com.',
    ),
  ];
}

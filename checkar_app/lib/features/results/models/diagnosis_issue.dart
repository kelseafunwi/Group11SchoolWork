enum DiagnosisSeverity { urgent, warning, healthy }

class DiagnosisIssue {
  const DiagnosisIssue({
    required this.title,
    required this.description,
    required this.severity,
    this.badge,
    this.recommendation,
  });

  final String title;
  final String description;
  final DiagnosisSeverity severity;
  final String? badge;
  final String? recommendation;

  factory DiagnosisIssue.fromJson(Map<String, dynamic> json) {
    return DiagnosisIssue(
      title: json['title'] as String? ?? 'Unnamed issue',
      description: json['description'] as String? ?? '',
      severity: _parseSeverity(json['severity'] as String?),
      badge: json['badge'] as String?,
      recommendation: json['recommendation'] as String?,
    );
  }

  static DiagnosisSeverity _parseSeverity(String? value) {
    switch (value?.toLowerCase()) {
      case 'urgent':
        return DiagnosisSeverity.urgent;
      case 'healthy':
      case 'ok':
      case 'good':
        return DiagnosisSeverity.healthy;
      default:
        return DiagnosisSeverity.warning;
    }
  }
}

class DiagnosisReport {
  const DiagnosisReport({required this.summary, required this.issues});

  final String summary;
  final List<DiagnosisIssue> issues;

  factory DiagnosisReport.fromJson(Map<String, dynamic> json) {
    final rawIssues = json['issues'] as List<dynamic>? ?? [];
    return DiagnosisReport(
      summary: json['summary'] as String? ?? '',
      issues: rawIssues
          .whereType<Map<String, dynamic>>()
          .map(DiagnosisIssue.fromJson)
          .toList(),
    );
  }
}

import 'package:checkar_app/features/home/models/diagnosis_item.dart';

class HistoryDetail {
  const HistoryDetail({
    required this.item,
    required this.summary,
    required this.description,
    required this.recommendation,
    required this.diagnosticType,
    required this.recordedAt,
  });

  final DiagnosisItem item;
  final String summary;
  final String description;
  final String recommendation;
  final String diagnosticType;
  final String recordedAt;
}

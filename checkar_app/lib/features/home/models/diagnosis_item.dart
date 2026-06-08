enum DiagnosisStatus { urgent, warning, healthy }

enum HistoryFilter { all, immediate, soon, monitor }

extension DiagnosisStatusX on DiagnosisStatus {
  HistoryFilter get historyFilter => switch (this) {
        DiagnosisStatus.urgent => HistoryFilter.immediate,
        DiagnosisStatus.warning => HistoryFilter.soon,
        DiagnosisStatus.healthy => HistoryFilter.monitor,
      };

  String get historyLabel => switch (this) {
        DiagnosisStatus.urgent => 'IMMEDIATE',
        DiagnosisStatus.warning => 'SOON',
        DiagnosisStatus.healthy => 'MONITOR',
      };
}

class DiagnosisItem {
  const DiagnosisItem({
    required this.title,
    required this.date,
    required this.status,
    this.vehicleName,
  });

  final String title;
  final String date;
  final DiagnosisStatus status;
  final String? vehicleName;
}

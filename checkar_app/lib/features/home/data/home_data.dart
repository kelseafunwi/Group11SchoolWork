import 'package:checkar_app/features/home/models/diagnosis_item.dart';

class HomeData {
  HomeData._();

  static const String userName = 'Alex';
  static const String vehicleName = 'Toyota Corolla 2019';
  static const String vehicleLabel = 'Primary Vehicle';

  static const List<DiagnosisItem> recentDiagnoses = [
    DiagnosisItem(
      title: 'Check Engine Light (P0300)',
      date: 'Oct 12, 2023 • 10:45 AM',
      status: DiagnosisStatus.urgent,
    ),
    DiagnosisItem(
      title: 'Tire Pressure Low',
      date: 'Oct 05, 2023 • 03:12 PM',
      status: DiagnosisStatus.warning,
    ),
    DiagnosisItem(
      title: 'Brake System Healthy',
      date: 'Sep 28, 2023 • 09:20 AM',
      status: DiagnosisStatus.healthy,
    ),
  ];
}

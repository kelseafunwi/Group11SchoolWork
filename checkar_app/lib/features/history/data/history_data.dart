import 'package:checkar_app/features/home/models/diagnosis_item.dart';

class HistoryData {
  HistoryData._();

  static const String defaultVehicle = 'Audi A4 (B9)';

  static const List<DiagnosisItem> maintenanceHistory = [
    DiagnosisItem(
      title: 'Brake Pad Wear - Front Left',
      date: 'Oct 24, 2023',
      status: DiagnosisStatus.urgent,
      vehicleName: defaultVehicle,
    ),
    DiagnosisItem(
      title: 'Oil Change Due',
      date: 'Oct 18, 2023',
      status: DiagnosisStatus.warning,
      vehicleName: defaultVehicle,
    ),
    DiagnosisItem(
      title: 'Tire Pressure System',
      date: 'Oct 15, 2023',
      status: DiagnosisStatus.healthy,
      vehicleName: defaultVehicle,
    ),
  ];
}

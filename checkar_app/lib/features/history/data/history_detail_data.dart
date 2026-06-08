import 'package:checkar_app/features/history/models/history_detail.dart';
import 'package:checkar_app/features/home/models/diagnosis_item.dart';

class HistoryDetailData {
  HistoryDetailData._();

  static const Map<String, HistoryDetail> _detailsByTitle = {
    'Brake Pad Wear - Front Left': HistoryDetail(
      item: DiagnosisItem(
        title: 'Brake Pad Wear - Front Left',
        date: 'Oct 24, 2023',
        status: DiagnosisStatus.urgent,
        vehicleName: 'Audi A4 (B9)',
      ),
      summary: 'Front left brake pad thickness is below safe limits.',
      description:
          'Wear sensors detected reduced pad material on the front left wheel. '
          'Stopping distance may increase if the issue is not addressed soon.',
      recommendation:
          'Schedule brake pad replacement within the next 500 miles. Avoid hard '
          'braking until inspected by a certified technician.',
      diagnosticType: 'Dashboard scan',
      recordedAt: 'Oct 24, 2023 • 2:15 PM',
    ),
    'Oil Change Due': HistoryDetail(
      item: DiagnosisItem(
        title: 'Oil Change Due',
        date: 'Oct 18, 2023',
        status: DiagnosisStatus.warning,
        vehicleName: 'Audi A4 (B9)',
      ),
      summary: 'Engine oil life is nearing the recommended service interval.',
      description:
          'Oil quality indicators show the current oil is approaching the end of '
          'its effective lubrication period based on mileage and driving patterns.',
      recommendation:
          'Book an oil and filter change within the next two weeks to maintain '
          'engine performance and prevent long-term wear.',
      diagnosticType: 'Engine sound analysis',
      recordedAt: 'Oct 18, 2023 • 9:40 AM',
    ),
    'Tire Pressure System': HistoryDetail(
      item: DiagnosisItem(
        title: 'Tire Pressure System',
        date: 'Oct 15, 2023',
        status: DiagnosisStatus.healthy,
        vehicleName: 'Audi A4 (B9)',
      ),
      summary: 'Tire pressure monitoring system is operating normally.',
      description:
          'All tire pressure readings are within manufacturer specifications. '
          'No active leaks or sensor faults were detected during the scan.',
      recommendation:
          'Continue routine monthly pressure checks and monitor for seasonal '
          'temperature changes that may affect tire pressure.',
      diagnosticType: 'Dashboard scan',
      recordedAt: 'Oct 15, 2023 • 4:05 PM',
    ),
  };

  static HistoryDetail? forItem(DiagnosisItem item) {
    return _detailsByTitle[item.title];
  }
}

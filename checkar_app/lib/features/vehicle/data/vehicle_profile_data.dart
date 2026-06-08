import 'package:checkar_app/features/home/data/home_data.dart';

class VehicleProfileData {
  VehicleProfileData._();

  static const String make = 'Toyota';
  static const String model = 'Corolla';
  static const String year = '2019';
  static const String nickname = 'Primary Vehicle';
  static const String vin = '2T1BURHE0KC123456';
  static const String mileage = '42,500';
  static const String fuelType = 'Gasoline';
  static const String licensePlate = 'ABC-1234';
  static const String lastService = 'Sep 12, 2023';
  static const String healthScore = '82%';

  static String get displayName => HomeData.vehicleName;
}

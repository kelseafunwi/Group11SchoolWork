import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:checkar_app/core/theme/app_colors.dart';
import 'package:checkar_app/features/auth/widgets/auth_app_bar.dart';
import 'package:checkar_app/features/auth/widgets/auth_text_field.dart';
import 'package:checkar_app/features/vehicle/data/vehicle_profile_data.dart';
import 'package:checkar_app/features/vehicle/widgets/vehicle_summary_card.dart';

class VehicleProfileView extends StatefulWidget {
  const VehicleProfileView({super.key});

  @override
  State<VehicleProfileView> createState() => _VehicleProfileViewState();
}

class _VehicleProfileViewState extends State<VehicleProfileView> {
  late final TextEditingController _nicknameController;
  late final TextEditingController _makeController;
  late final TextEditingController _modelController;
  late final TextEditingController _yearController;
  late final TextEditingController _vinController;
  late final TextEditingController _mileageController;
  late final TextEditingController _fuelTypeController;
  late final TextEditingController _licensePlateController;

  @override
  void initState() {
    super.initState();
    _nicknameController =
        TextEditingController(text: VehicleProfileData.nickname);
    _makeController = TextEditingController(text: VehicleProfileData.make);
    _modelController = TextEditingController(text: VehicleProfileData.model);
    _yearController = TextEditingController(text: VehicleProfileData.year);
    _vinController = TextEditingController(text: VehicleProfileData.vin);
    _mileageController =
        TextEditingController(text: VehicleProfileData.mileage);
    _fuelTypeController =
        TextEditingController(text: VehicleProfileData.fuelType);
    _licensePlateController =
        TextEditingController(text: VehicleProfileData.licensePlate);

    _makeController.addListener(() => setState(() {}));
    _modelController.addListener(() => setState(() {}));
    _yearController.addListener(() => setState(() {}));
    _nicknameController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _nicknameController.dispose();
    _makeController.dispose();
    _modelController.dispose();
    _yearController.dispose();
    _vinController.dispose();
    _mileageController.dispose();
    _fuelTypeController.dispose();
    _licensePlateController.dispose();
    super.dispose();
  }

  String get _displayName {
    final make = _makeController.text.trim();
    final model = _modelController.text.trim();
    final year = _yearController.text.trim();

    if (make.isEmpty && model.isEmpty && year.isEmpty) {
      return VehicleProfileData.displayName;
    }

    return [make, model, year].where((part) => part.isNotEmpty).join(' ');
  }

  void _onSave() {
    Get.back();
    Get.snackbar(
      'Vehicle updated',
      'Your vehicle details have been saved.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.navy,
      colorText: AppColors.white,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        appBar: AuthAppBar(
          title: 'Vehicle profile',
          showProfileAction: false,
          onBack: () => Get.back(),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              VehicleSummaryCard(
                displayName: _displayName,
                nickname: _nicknameController.text.trim().isEmpty
                    ? VehicleProfileData.nickname
                    : _nicknameController.text.trim(),
                healthScore: VehicleProfileData.healthScore,
                lastService: VehicleProfileData.lastService,
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.paleGrey),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Vehicle details',
                      style: TextStyle(
                        color: AppColors.navy,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 20),
                    AuthTextField(
                      label: 'Nickname',
                      controller: _nicknameController,
                      hintText: 'Primary Vehicle',
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: AuthTextField(
                            label: 'Make',
                            controller: _makeController,
                            hintText: 'Toyota',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: AuthTextField(
                            label: 'Model',
                            controller: _modelController,
                            hintText: 'Corolla',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: AuthTextField(
                            label: 'Year',
                            controller: _yearController,
                            hintText: '2019',
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: AuthTextField(
                            label: 'Mileage',
                            controller: _mileageController,
                            hintText: '42,500',
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    AuthTextField(
                      label: 'VIN',
                      controller: _vinController,
                      hintText: 'Vehicle identification number',
                    ),
                    const SizedBox(height: 20),
                    AuthTextField(
                      label: 'Fuel type',
                      controller: _fuelTypeController,
                      hintText: 'Gasoline',
                    ),
                    const SizedBox(height: 20),
                    AuthTextField(
                      label: 'License plate',
                      controller: _licensePlateController,
                      hintText: 'ABC-1234',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: _onSave,
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.navy,
                  foregroundColor: AppColors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Save changes',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

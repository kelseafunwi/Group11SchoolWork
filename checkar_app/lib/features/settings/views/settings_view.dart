import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:checkar_app/core/routes/app_routes.dart';
import 'package:checkar_app/core/theme/app_colors.dart';
import 'package:checkar_app/features/settings/data/settings_data.dart';
import 'package:checkar_app/features/settings/widgets/diagnostic_status_card.dart';
import 'package:checkar_app/features/settings/widgets/profile_card.dart';
import 'package:checkar_app/core/widgets/main_tab_header.dart';
import 'package:checkar_app/features/settings/widgets/settings_tile.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool _notificationsEnabled = true;
  bool _criticalAlertsEnabled = true;
  bool _wifiOnlyDownloads = false;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.offWhite,
      child: Column(
        children: [
          const MainTabHeader(title: 'Settings'),
          Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ProfileCard(
                      name: SettingsData.fullName,
                      email: SettingsData.email,
                      initials: SettingsData.initials,
                      onEditTap: () => Get.toNamed(AppRoutes.editProfile),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.paleGrey),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          SettingsTile(
                            icon: Icons.directions_car_outlined,
                            title: 'Vehicle profile',
                            trailing: const Icon(
                              Icons.chevron_right,
                              color: AppColors.greyLight,
                            ),
                            onTap: () => Get.toNamed(AppRoutes.vehicleProfile),
                          ),
                          SettingsTile(
                            icon: Icons.notifications_outlined,
                            title: 'Notifications',
                            trailing: _SettingsSwitch(
                              value: _notificationsEnabled,
                              onChanged: (value) {
                                setState(() => _notificationsEnabled = value);
                              },
                            ),
                          ),
                          SettingsTile(
                            icon: Icons.warning_amber_outlined,
                            title: 'Critical alerts',
                            trailing: _SettingsSwitch(
                              value: _criticalAlertsEnabled,
                              onChanged: (value) {
                                setState(() => _criticalAlertsEnabled = value);
                              },
                            ),
                          ),
                          SettingsTile(
                            icon: Icons.wifi,
                            title: 'Wi-Fi only downloads',
                            trailing: _SettingsSwitch(
                              value: _wifiOnlyDownloads,
                              onChanged: (value) {
                                setState(() => _wifiOnlyDownloads = value);
                              },
                            ),
                          ),
                          SettingsTile(
                            icon: Icons.lock_outline,
                            title: 'Change password',
                            trailing: const Icon(
                              Icons.chevron_right,
                              color: AppColors.greyLight,
                            ),
                            onTap: () {},
                          ),
                          SettingsTile(
                            icon: Icons.info_outline,
                            title: 'About CheckAR',
                            trailing: const Icon(
                              Icons.chevron_right,
                              color: AppColors.greyLight,
                            ),
                            onTap: () => Get.toNamed(AppRoutes.about),
                          ),
                          SettingsTile(
                            icon: Icons.logout,
                            title: 'Sign out',
                            titleColor: AppColors.urgent,
                            iconColor: AppColors.urgent,
                            showDivider: false,
                            onTap: () => Get.offAllNamed(AppRoutes.login),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    DiagnosticStatusCard(
                      lastChecked: SettingsData.lastDiagnosticCheck,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _SettingsSwitch extends StatelessWidget {
  const _SettingsSwitch({
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: onChanged,
      activeTrackColor: AppColors.teal,
      inactiveTrackColor: AppColors.greyLight.withValues(alpha: 0.5),
      inactiveThumbColor: AppColors.white,
      trackOutlineColor: WidgetStateProperty.resolveWith((states) {
        return Colors.transparent;
      }),
    );
  }
}

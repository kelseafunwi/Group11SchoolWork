import 'package:flutter/material.dart';
import 'package:checkar_app/core/theme/app_colors.dart';
import 'package:checkar_app/features/home/data/home_data.dart';
import 'package:checkar_app/features/results/models/result_issue.dart';

class ResultsData {
  ResultsData._();

  static const String scanDate = 'Oct 24, 2023';
  static const int issueCount = 2;
  static const String nearbyMechanic = 'AutoCare Hub (0.4mi)';

  static String get vehicleName => HomeData.vehicleName;

  static const List<ResultIssue> issues = [
    ResultIssue(
      title: 'Battery warning',
      description: 'Voltage drop detected in start cycle.',
      severity: ResultSeverity.urgent,
      badgeLabel: 'IMMEDIATE',
      actionLabel: 'Watch tutorial',
      icon: Icons.battery_alert_outlined,
      accentColor: AppColors.urgent,
    ),
    ResultIssue(
      title: 'Low oil pressure',
      description: 'Oil level is at the lower boundary.',
      severity: ResultSeverity.warning,
      badgeLabel: 'SOON',
      icon: Icons.oil_barrel_outlined,
      accentColor: AppColors.warning,
    ),
    ResultIssue(
      title: 'Engine Systems',
      description: 'Timing, intake, and exhaust are within specs.',
      severity: ResultSeverity.healthy,
      icon: Icons.check,
    ),
  ];
}

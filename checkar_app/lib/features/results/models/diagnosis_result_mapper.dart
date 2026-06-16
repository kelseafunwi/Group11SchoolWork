import 'package:flutter/material.dart';
import 'package:checkar_app/core/theme/app_colors.dart';
import 'package:checkar_app/features/results/models/diagnosis_issue.dart';
import 'package:checkar_app/features/results/models/result_issue.dart';

extension DiagnosisIssueMapping on DiagnosisIssue {
  ResultIssue toResultIssue() {
    switch (severity) {
      case DiagnosisSeverity.urgent:
        return ResultIssue(
          title: title,
          description: description,
          severity: ResultSeverity.urgent,
          badgeLabel: badge ?? 'IMMEDIATE',
          actionLabel: recommendation,
          icon: Icons.error_outline,
          accentColor: AppColors.urgent,
        );
      case DiagnosisSeverity.warning:
        return ResultIssue(
          title: title,
          description: description,
          severity: ResultSeverity.warning,
          badgeLabel: badge ?? 'SOON',
          actionLabel: recommendation,
          icon: Icons.warning_amber_outlined,
          accentColor: AppColors.warning,
        );
      case DiagnosisSeverity.healthy:
        return ResultIssue(
          title: title,
          description: description,
          severity: ResultSeverity.healthy,
          icon: Icons.check,
        );
    }
  }
}

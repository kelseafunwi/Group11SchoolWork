import 'package:flutter/material.dart';

enum ResultSeverity { urgent, warning, healthy }

class ResultIssue {
  const ResultIssue({
    required this.title,
    required this.description,
    required this.severity,
    this.badgeLabel,
    this.actionLabel,
    this.icon,
    this.accentColor,
  });

  final String title;
  final String description;
  final ResultSeverity severity;
  final String? badgeLabel;
  final String? actionLabel;
  final IconData? icon;
  final Color? accentColor;
}

import 'package:flutter/material.dart';
import 'package:checkar_app/core/theme/app_colors.dart';

enum VideoCategory { all, battery, engine, brakes, maintenance }

enum VideoUrgency { immediate, soon, monitor, general }

class DiagnosisVideo {
  const DiagnosisVideo({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
    required this.category,
    required this.urgency,
    required this.thumbnailColors,
    this.steps = const [],
    this.isFeatured = false,
  });

  final String id;
  final String title;
  final String description;
  final String duration;
  final VideoCategory category;
  final VideoUrgency urgency;
  final List<Color> thumbnailColors;
  final List<String> steps;
  final bool isFeatured;
}

extension VideoCategoryLabel on VideoCategory {
  String get label => switch (this) {
        VideoCategory.all => 'All',
        VideoCategory.battery => 'Battery',
        VideoCategory.engine => 'Engine',
        VideoCategory.brakes => 'Brakes',
        VideoCategory.maintenance => 'Maintenance',
      };
}

extension VideoUrgencyStyle on VideoUrgency {
  String? get badgeLabel => switch (this) {
        VideoUrgency.immediate => 'IMMEDIATE',
        VideoUrgency.soon => 'SOON',
        VideoUrgency.monitor => 'MONITOR',
        VideoUrgency.general => null,
      };

  Color get badgeColor => switch (this) {
        VideoUrgency.immediate => AppColors.urgent,
        VideoUrgency.soon => AppColors.warning,
        VideoUrgency.monitor => AppColors.success,
        VideoUrgency.general => AppColors.teal,
      };
}

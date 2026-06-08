import 'package:flutter/material.dart';
import 'package:checkar_app/core/theme/app_colors.dart';
import 'package:checkar_app/features/home/data/home_data.dart';
import 'package:checkar_app/features/video_diagnosis/models/diagnosis_video.dart';

class VideoDiagnosisData {
  VideoDiagnosisData._();

  static String get vehicleName => HomeData.vehicleName;

  static const List<VideoCategory> categories = [
    VideoCategory.all,
    VideoCategory.battery,
    VideoCategory.engine,
    VideoCategory.brakes,
    VideoCategory.maintenance,
  ];

  static const List<DiagnosisVideo> videos = [
    DiagnosisVideo(
      id: 'battery-warning',
      title: 'Fixing a battery warning light',
      description:
          'Learn how to test your battery voltage, inspect terminals, and decide when to replace or recharge.',
      duration: '4:32',
      category: VideoCategory.battery,
      urgency: VideoUrgency.immediate,
      isFeatured: true,
      thumbnailColors: [Color(0xFFBA1A1A), Color(0xFF5C1010)],
      steps: [
        'Turn off accessories and check dashboard voltage reading.',
        'Inspect battery terminals for corrosion or loose connections.',
        'Use a multimeter to confirm resting voltage above 12.4V.',
        'Schedule replacement if voltage drops during engine start.',
      ],
    ),
    DiagnosisVideo(
      id: 'check-engine-p0300',
      title: 'Understanding check engine light (P0300)',
      description:
          'A walkthrough of misfire codes, common causes, and safe next steps for your engine.',
      duration: '5:48',
      category: VideoCategory.engine,
      urgency: VideoUrgency.immediate,
      thumbnailColors: [Color(0xFF021934), Color(0xFF00696D)],
      steps: [
        'Read the stored OBD-II code from your scanner or app.',
        'Check spark plugs, coils, and vacuum lines for obvious faults.',
        'Note when the misfire occurs — idle, acceleration, or cold start.',
        'Avoid heavy driving until the root cause is confirmed.',
      ],
    ),
    DiagnosisVideo(
      id: 'oil-pressure-low',
      title: 'Checking low oil pressure at home',
      description:
          'How to verify oil level, spot leaks, and know when low pressure needs urgent service.',
      duration: '3:15',
      category: VideoCategory.engine,
      urgency: VideoUrgency.soon,
      thumbnailColors: [Color(0xFFE67E22), Color(0xFF8B4513)],
      steps: [
        'Park on level ground and wait five minutes before checking the dipstick.',
        'Look under the vehicle for fresh oil spots or drips.',
        'Confirm you are using the correct oil grade for your engine.',
        'Book service if the warning light stays on after topping up.',
      ],
    ),
    DiagnosisVideo(
      id: 'tire-pressure',
      title: 'Tire pressure monitoring explained',
      description:
          'Reset your TPMS light, inflate tires correctly, and monitor pressure through seasonal changes.',
      duration: '2:40',
      category: VideoCategory.maintenance,
      urgency: VideoUrgency.monitor,
      thumbnailColors: [AppColors.teal, AppColors.navy],
      steps: [
        'Check cold tire pressure against the door-jamb sticker.',
        'Inflate all four tires evenly, including the spare if applicable.',
        'Drive for a few minutes to let the TPMS sensors recalibrate.',
        'Recheck pressure monthly and before long trips.',
      ],
    ),
    DiagnosisVideo(
      id: 'brake-pad-wear',
      title: 'Front brake pad inspection guide',
      description:
          'Visually inspect pad thickness, listen for wear indicators, and plan replacement timing.',
      duration: '6:12',
      category: VideoCategory.brakes,
      urgency: VideoUrgency.soon,
      thumbnailColors: [Color(0xFF44474D), Color(0xFF1E2A32)],
      steps: [
        'Remove the wheel or use a flashlight through the caliper opening.',
        'Measure remaining pad material — replace below 3mm.',
        'Listen for squealing or grinding under light braking.',
        'Replace pads in axle sets for balanced stopping power.',
      ],
    ),
    DiagnosisVideo(
      id: 'engine-sound-analysis',
      title: 'How engine sound diagnostics work',
      description:
          'See how CheckAR analyzes acoustic patterns to catch early mechanical wear.',
      duration: '4:05',
      category: VideoCategory.engine,
      urgency: VideoUrgency.general,
      thumbnailColors: [AppColors.lightBlue, AppColors.teal],
      steps: [
        'Record near the engine bay with the hood open in a quiet area.',
        'Capture at least eight seconds at a steady idle.',
        'Compare results after repairs to track improvement over time.',
      ],
    ),
  ];

  static DiagnosisVideo? findById(String id) {
    for (final video in videos) {
      if (video.id == id) return video;
    }
    return null;
  }

  static DiagnosisVideo? get featuredVideo {
    for (final video in videos) {
      if (video.isFeatured) return video;
    }
    return videos.isNotEmpty ? videos.first : null;
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:checkar_app/core/routes/app_routes.dart';
import 'package:checkar_app/core/theme/app_colors.dart';
import 'package:checkar_app/features/auth/widgets/auth_app_bar.dart';
import 'package:checkar_app/features/record/widgets/audio_waveform.dart';
import 'package:checkar_app/features/record/widgets/engine_reference_image.dart';
import 'package:checkar_app/features/record/widgets/record_instruction_banner.dart';

class RecordEngineSoundView extends StatefulWidget {
  const RecordEngineSoundView({super.key});

  @override
  State<RecordEngineSoundView> createState() => _RecordEngineSoundViewState();
}

class _RecordEngineSoundViewState extends State<RecordEngineSoundView> {
  static const int _maxRecordingSeconds = 10;

  final AudioRecorder _recorder = AudioRecorder();

  Timer? _timer;
  StreamSubscription<Amplitude>? _amplitudeSubscription;

  bool _isRecording = false;
  int _elapsedSeconds = 0;
  List<double> _barHeights = List<double>.from(AudioWaveform.idleHeights);
  String? _recordingPath;

  @override
  void dispose() {
    _timer?.cancel();
    _amplitudeSubscription?.cancel();
    _recorder.stop();
    _recorder.dispose();
    super.dispose();
  }

  String get _timerText {
    final minutes = (_elapsedSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_elapsedSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  double _normalizeAmplitude(double decibels) {
    return ((decibels + 50) / 50).clamp(0.15, 1.0);
  }

  void _shiftWaveform(double value) {
    setState(() {
      _barHeights = [
        value,
        ..._barHeights.sublist(0, _barHeights.length - 1),
      ];
    });
  }

  Future<void> _onRecordPressed() async {
    if (_isRecording) {
      await _stopRecording();
      return;
    }
    await _startRecording();
  }

  Future<void> _startRecording() async {
    final hasPermission = await _recorder.hasPermission();
    if (!hasPermission) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Microphone permission is required to record.'),
          ),
        );
      }
      return;
    }

    final directory = await getTemporaryDirectory();
    final path =
        '${directory.path}/engine_sound_${DateTime.now().millisecondsSinceEpoch}.m4a';

    await _recorder.start(
      const RecordConfig(
        encoder: AudioEncoder.aacLc,
        sampleRate: 44100,
        bitRate: 128000,
      ),
      path: path,
    );

    _amplitudeSubscription?.cancel();
    _amplitudeSubscription = _recorder
        .onAmplitudeChanged(const Duration(milliseconds: 100))
        .listen((amplitude) {
      _shiftWaveform(_normalizeAmplitude(amplitude.current));
    });

    setState(() {
      _isRecording = true;
      _elapsedSeconds = 0;
      _recordingPath = path;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_elapsedSeconds >= _maxRecordingSeconds) {
        _stopRecording();
        return;
      }
      setState(() => _elapsedSeconds++);
    });
  }

  Future<void> _stopRecording({bool navigateToAnalysis = true}) async {
    final wasRecording = _isRecording;

    _timer?.cancel();
    _amplitudeSubscription?.cancel();
    _amplitudeSubscription = null;

    if (await _recorder.isRecording()) {
      await _recorder.stop();
    }

    if (!mounted) return;

    setState(() {
      _isRecording = false;
      _barHeights = List<double>.from(AudioWaveform.idleHeights);
    });

    if (wasRecording && navigateToAnalysis && _elapsedSeconds > 0) {
      Get.offNamed(AppRoutes.analysing);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        appBar: AuthAppBar(
          title: 'Record engine sound',
          onBack: () => Get.back(),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
                child: Column(
                  children: [
                    const RecordInstructionBanner(),
                    const SizedBox(height: 32),
                    AudioWaveform(barHeights: _barHeights),
                    const SizedBox(height: 24),
                    Text(
                      _timerText,
                      style: const TextStyle(
                        color: AppColors.navy,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Recording will stop automatically at 10 seconds.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.greyDark,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Material(
                      color: AppColors.navy,
                      borderRadius: BorderRadius.circular(16),
                      elevation: 4,
                      shadowColor: AppColors.navy.withValues(alpha: 0.35),
                      child: InkWell(
                        onTap: _onRecordPressed,
                        borderRadius: BorderRadius.circular(16),
                        child: SizedBox(
                          width: 72,
                          height: 72,
                          child: Icon(
                            _isRecording ? Icons.stop_rounded : Icons.mic,
                            color: AppColors.white,
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.open_in_new,
                        size: 16,
                        color: AppColors.teal,
                      ),
                      label: const Text(
                        'How to position your phone',
                        style: TextStyle(
                          color: AppColors.teal,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const EngineReferenceImage(),
                    if (_recordingPath != null && !_isRecording) ...[
                      const SizedBox(height: 12),
                      Text(
                        'Recording saved',
                        style: TextStyle(
                          color: AppColors.teal.withValues(alpha: 0.9),
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

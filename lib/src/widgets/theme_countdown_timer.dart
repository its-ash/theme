import 'dart:async';

import 'package:flutter/material.dart';

import 'package:theme/src/typography/app_typography.dart';

class ThemeCountdownTimer extends StatefulWidget {
  const ThemeCountdownTimer({
    super.key,
    required this.duration,
    this.onFinished,
    this.style,
  });

  final Duration duration;
  final VoidCallback? onFinished;
  final TextStyle? style;

  @override
  State<ThemeCountdownTimer> createState() => _ThemeCountdownTimerState();
}

class _ThemeCountdownTimerState extends State<ThemeCountdownTimer> {
  late Duration _remaining = widget.duration;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), _tick);
  }

  void _tick(Timer timer) {
    if (_remaining.inSeconds <= 0) {
      timer.cancel();
      widget.onFinished?.call();
      return;
    }
    setState(() => _remaining -= const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _format(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes.remainder(60);
    final s = d.inSeconds.remainder(60);
    final mm = m.toString().padLeft(2, '0');
    final ss = s.toString().padLeft(2, '0');
    return h > 0 ? '${h.toString().padLeft(2, '0')}:$mm:$ss' : '$mm:$ss';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _format(_remaining),
      style: widget.style ?? AppTypography.titleMedium,
    );
  }
}

import 'dart:math' as math;
import 'package:flutter/material.dart';

enum ThemeSpinnerType { ripple, wave, dots, pulse, bars, dualRing }

class ThemeSpinner extends StatefulWidget {
  const ThemeSpinner({
    super.key,
    this.type = ThemeSpinnerType.ripple,
    this.size = 36,
    this.color,
    this.strokeWidth = 3,
    this.duration = const Duration(milliseconds: 1000),
  });

  final ThemeSpinnerType type;
  final double size;
  final Color? color;
  final double strokeWidth;
  final Duration duration;

  @override
  State<ThemeSpinner> createState() => _ThemeSpinnerState();
}

class _ThemeSpinnerState extends State<ThemeSpinner>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: widget.duration,
  )..repeat();

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? Theme.of(context).colorScheme.primary;
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _c,
        builder: (context, _) {
          switch (widget.type) {
            case ThemeSpinnerType.ripple:
              return CustomPaint(painter: _RipplePainter(_c.value, color, widget.strokeWidth));
            case ThemeSpinnerType.wave:
              return CustomPaint(painter: _WavePainter(_c.value, color, widget.strokeWidth));
            case ThemeSpinnerType.dots:
              return CustomPaint(painter: _DotsPainter(_c.value, color));
            case ThemeSpinnerType.pulse:
              return CustomPaint(painter: _PulsePainter(_c.value, color, widget.strokeWidth));
            case ThemeSpinnerType.bars:
              return CustomPaint(painter: _BarsPainter(_c.value, color));
            case ThemeSpinnerType.dualRing:
              return CustomPaint(painter: _DualRingPainter(_c.value, color, widget.strokeWidth));
          }
        },
      ),
    );
  }
}

class _RipplePainter extends CustomPainter {
  final double t;
  final Color color;
  final double stroke;
  _RipplePainter(this.t, this.color, this.stroke);
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final r = size.width / 2;
    for (var i = 0; i < 3; i++) {
      final p = (t + i / 3) % 1;
      canvas.drawCircle(center, r * p, Paint()..color = color.withValues(alpha: 1 - p)..style = PaintingStyle.stroke..strokeWidth = stroke);
    }
  }
  @override
  bool shouldRepaint(covariant _RipplePainter o) => o.t != t;
}

class _WavePainter extends CustomPainter {
  final double t;
  final Color color;
  final double stroke;
  _WavePainter(this.t, this.color, this.stroke);
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width / 5;
    final h = size.height;
    final paint = Paint()..color = color..strokeCap = StrokeCap.round..strokeWidth = stroke;
    for (var i = 0; i < 5; i++) {
      final phase = (t + i / 5) * 2 * math.pi;
      final barH = (h / 2) * (0.3 + 0.7 * ((1 + math.sin(phase)) / 2));
      canvas.drawLine(Offset(w * i + w / 2, (h - barH) / 2), Offset(w * i + w / 2, (h + barH) / 2), paint);
    }
  }
  @override
  bool shouldRepaint(covariant _WavePainter o) => o.t != t;
}

class _DotsPainter extends CustomPainter {
  final double t;
  final Color color;
  _DotsPainter(this.t, this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final r = size.width / 2 - 4;
    for (var i = 0; i < 8; i++) {
      final angle = (t * 2 * math.pi) + (i * 2 * math.pi / 8);
      final dotOffset = Offset(center.dx + r * math.cos(angle), center.dy + r * math.sin(angle));
      canvas.drawCircle(dotOffset, 2.5, Paint()..color = color.withValues(alpha: i / 8));
    }
  }
  @override
  bool shouldRepaint(covariant _DotsPainter o) => o.t != t;
}

class _PulsePainter extends CustomPainter {
  final double t;
  final Color color;
  final double stroke;
  _PulsePainter(this.t, this.color, this.stroke);
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, 3, Paint()..color = color);
  }
  @override
  bool shouldRepaint(covariant _PulsePainter o) => o.t != t;
}

class _BarsPainter extends CustomPainter {
  final double t;
  final Color color;
  _BarsPainter(this.t, this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width / 5;
    final h = size.height;
    for (var i = 0; i < 5; i++) {
      final phase = (t + i / 5) % 1;
      final alpha = phase.abs();
      canvas.drawRect(Rect.fromLTWH(w * i, h * 0.1, w * 0.7, h * 0.8), Paint()..color = color.withValues(alpha: alpha));
    }
  }
  @override
  bool shouldRepaint(covariant _BarsPainter o) => o.t != t;
}

class _DualRingPainter extends CustomPainter {
  final double t;
  final Color color;
  final double stroke;
  _DualRingPainter(this.t, this.color, this.stroke);
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2 - stroke);
    canvas.drawArc(rect, t * 2 * math.pi, math.pi * 1.2, false, Paint()..color = color.withValues(alpha: 0.3)..style = PaintingStyle.stroke..strokeWidth = stroke);
    canvas.drawArc(rect, t * 2 * math.pi + math.pi, math.pi * 1.2, false, Paint()..color = color..style = PaintingStyle.stroke..strokeWidth = stroke);
  }
  @override
  bool shouldRepaint(covariant _DualRingPainter o) => o.t != t;
}
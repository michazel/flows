import 'package:flutter/material.dart';
import 'dart:math';

class CircularProgress extends StatelessWidget {
  final double progress;

  const CircularProgress({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: progress),
      duration: const Duration(seconds: 1),
      builder: (context, value, child) {
        return CustomPaint(
          painter: CircularProgressPainter(value),
          child: const SizedBox(
            width: 200,
            height: 200,
          ),
        );
      },
    );
  }
}

class CircularProgressPainter extends CustomPainter {
  final double progress;

  CircularProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);
    const startAngle = -pi / 2;

    final bluePaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 40;

    final blueSweepAngle = min(2 * pi * progress, 2 * pi);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      blueSweepAngle,
      false,
      bluePaint,
    );

    if (progress > 1.0) {
      final redPaint = Paint()
        ..color = Colors.green
        ..style = PaintingStyle.stroke
        ..strokeWidth = 40;

      final redSweepAngle = 2 * pi * (progress - 1.0);
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle + blueSweepAngle,
        redSweepAngle,
        false,
        redPaint,
      );
    } if (progress > 2.0) {
      final greenPaint = Paint()
        ..color = Colors.amber
        ..style = PaintingStyle.stroke
        ..strokeWidth = 40;

      final purpleSweepAngle = 2 * pi * (progress - 2.0);
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle + blueSweepAngle + min(2 * pi, 2 * pi * (progress - 1.0)),
        purpleSweepAngle,
        false,
        greenPaint,
      );
    } if (progress > 3.0) {
      final purplePaint = Paint()
        ..color = Colors.red
        ..style = PaintingStyle.stroke
        ..strokeWidth = 40;

      final purpleSweepAngle = 2 * pi * (progress - 3.0);
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle + blueSweepAngle + min(2 * pi, 2 * pi * (progress - 1.0)) + min(2 * pi, 2 * pi * (progress - 2.0)),
        purpleSweepAngle,
        false,
        purplePaint,
      );
    }
  }

  @override
  bool shouldRepaint(CircularProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
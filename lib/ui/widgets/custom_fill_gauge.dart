import 'dart:math' as math;
import 'package:flutter/material.dart';

class HalfCircularFillGauge extends StatelessWidget {
  final double value; // Nilai dari fill gauge (0.0 - 1.0)
  final Color fillColor; // Warna fill gauge
  final Color backgroundColor; // Warna fill gauge kosong
  final double strokeWidth; // Ketebalan garis

  const HalfCircularFillGauge({
    Key? key,
    required this.value,
    required this.fillColor,
    required this.backgroundColor,
    this.strokeWidth = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(150, 100), // Sesuaikan dengan ukuran yang diinginkan
      painter: HalfCircularFillGaugePainter(
        value: value,
        fillColor: fillColor,
        backgroundColor: backgroundColor,
        strokeWidth: strokeWidth,
      ),
    );
  }
}

class HalfCircularFillGaugePainter extends CustomPainter {
  final double value;
  final Color fillColor;
  final Color backgroundColor;
  final double strokeWidth;

  HalfCircularFillGaugePainter({
    required this.value,
    required this.fillColor,
    required this.backgroundColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint fillPaint = Paint()
      ..color = fillColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double radius = math.min(size.width, size.height) / 2;
    Offset center = Offset(size.width / 2, size.height);

    // Gambar lingkaran setengah dengan fill gauge kosong
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi,
      math.pi,
      false,
      backgroundPaint,
    );

    // Gambar fill gauge berdasarkan nilai yang diberikan
    double sweepAngle = math.pi * value;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi,
      sweepAngle,
      false,
      fillPaint,
    );
  }

  @override
  bool shouldRepaint(HalfCircularFillGaugePainter oldDelegate) {
    return oldDelegate.value != value ||
        oldDelegate.fillColor != fillColor ||
        oldDelegate.backgroundColor != backgroundColor;
  }
}

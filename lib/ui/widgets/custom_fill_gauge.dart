import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:nutrimotion/shared/theme.dart';
class HalfCircularFillGauge extends StatefulWidget {
  final double value; // Nilai dari fill gauge (0.0 - 1.0)
  final Color color;
  final double strokeWidth; // Ketebalan garis
  final String? text;

  const HalfCircularFillGauge({
    Key? key,
    required this.value,
    required this.color,
    this.text,
    this.strokeWidth = 8.0,
  }) : super(key: key);

  @override
  State<HalfCircularFillGauge> createState() => _HalfCircularFillGaugeState();
}

class _HalfCircularFillGaugeState extends State<HalfCircularFillGauge> with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          CustomPaint(
          size: const Size(150, 150), // Sesuaikan dengan ukuran yang diinginkan
          painter: HalfCircularFillGaugePainter(
              value: widget.value, 
              color: widget.color, 
              strokeWidth: widget.strokeWidth
            ),
          ),
          (widget.text != null) ? 
          Positioned(
            top: 30,
            left: 55,
            child: Column(
              children: [
              Text(
                '${widget.text}',
                style: whitePoppinsTextStyle.copyWith(
                  fontSize: 24, fontWeight: regular
                )
              ),
              Text(
                'KCAL',
                style: secondaryGreenPoppinsTextStyle.copyWith(
                  fontSize: 16, fontWeight: semiBold
                )
              ),
            ],
            )
          ): Container()
        ],
      ),
    );
  }
}

class HalfCircularFillGaugePainter extends CustomPainter {
  final double value;
  final Color color;
  final double strokeWidth;

  HalfCircularFillGaugePainter({
    required this.value,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const rect = Rect.fromLTRB(0,0,150,150);
    Paint gaugeColor = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double startAngle = -math.pi;
    double sweepAngle =  value != null ? value : math.pi;

    // Gambar lingkaran setengah dengan fill gauge kosong
    canvas.drawArc(rect,startAngle,sweepAngle, false, gaugeColor,);

  }

  @override
  bool shouldRepaint(HalfCircularFillGaugePainter oldDelegate) {
    return true;
       
  }
}

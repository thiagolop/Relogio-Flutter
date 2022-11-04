import 'dart:math';

import 'package:flutter/material.dart';
import 'package:relogio/src/app_style.dart';
import 'package:relogio/src/relogio/date_time_model.dart';

class ClockWidget extends StatefulWidget {
   const ClockWidget(this .time,{Key? key}) : super(key: key);
  final TimeModel time;

  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [BoxShadow(color: AppStyle.primaryColor.withAlpha(150), blurRadius: 38.0)]),
      height: 300,
      width: 300,
      child: CustomPaint(
        painter: ClockPaiter(),
      ),
    );
  }
}

class ClockPaiter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Points Coordinates
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    // setting the Brush
    var fillBrush = Paint()
      ..color = AppStyle.primaryColor
      ..strokeCap = StrokeCap.round;

    var centerDotBrush = Paint()..color = const Color(0xFFEAECFF);
    // drawing the body
    canvas.drawCircle(center, radius - 40, fillBrush);

    // drawing ther center dot
    canvas.drawCircle(center, 16, centerDotBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

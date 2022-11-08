import 'dart:math';

import 'package:flutter/material.dart';
import 'package:relogio/src/app_style.dart';
import 'package:relogio/src/relogio/date_time_model.dart';

class ClockWidget extends StatefulWidget {
  const ClockWidget(this.time, {Key? key}) : super(key: key);
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
        painter: ClockPaiter(widget.time),
      ),
    );
  }
}

class ClockPaiter extends CustomPainter {
  // lets's set the time parameter
  TimeModel? time;
  ClockPaiter(this.time);

  @override
  void paint(Canvas canvas, Size size) {
    // lets's calculate the time possition
    double secRad = ((pi / 2) - (pi / 30) * time!.sec) % (2 * pi);
    double minRad = ((pi / 2) - (pi / 30) * time!.min) % (2 * pi);
    double hourRad = ((pi / 2) - (pi / 6) * time!.hour) % (2 * pi);

    // Points Coordinates
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    //setting the clock coordinate
    var secHeight = radius / 2;
    var minHeight = radius / 2 - 10;
    var hourHeight = radius / 2 - 25;

    var seconds = Offset(centerX + secHeight * cos(secRad), centerY - secHeight * sin(secRad));
    var minutes = Offset(centerX + minHeight * cos(minRad), centerY - minHeight * sin(minRad));
    var hours = Offset(centerX + hourHeight * cos(hourRad), centerY - hourHeight * sin(hourRad));
    // setting the Brush
    var fillBrush = Paint()
      ..color = AppStyle.primaryColor
      ..strokeCap = StrokeCap.round;

    var centerDotBrush = Paint()..color = const Color(0xFFEAECFF);
    // setting the hnad brush
    var secBrush = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2
      ..strokeJoin = StrokeJoin.round;
    var minBrush = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3
      ..strokeJoin = StrokeJoin.round;
    var hoursBrush = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4
      ..strokeJoin = StrokeJoin.round;
    // drawing the body
    canvas.drawCircle(center, radius - 40, fillBrush);
    // drawing the clock hands
    canvas.drawLine(center, seconds, secBrush);
    canvas.drawLine(center, minutes, minBrush);
    canvas.drawLine(center, hours, hoursBrush);
    // drawing ther center dot
    canvas.drawCircle(center, 16, centerDotBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

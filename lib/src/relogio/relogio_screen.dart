import 'package:flutter/material.dart';
import 'package:relogio/src/app_style.dart';
import 'package:relogio/src/relogio/clock_widget.dart';
import 'package:timer_builder/timer_builder.dart';

class RelogioScreen extends StatefulWidget {
  const RelogioScreen({Key? key}) : super(key: key);

  @override
  State<RelogioScreen> createState() => _RelogioScreenState();
}

class _RelogioScreenState extends State<RelogioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: TimerBuilder.periodic(
        const Duration(seconds: 1),
        builder: (context) {
          var currentTime = DateTime.now();
          String seconds = currentTime.second < 10 ? "0${currentTime.second}" : "${currentTime.second}";
          String minute = currentTime.minute < 10 ? "0${currentTime.minute}" : "${currentTime.minute}";
          String hour = currentTime.hour < 10 ? "0${currentTime.hour}" : "${currentTime.hour}";
          return Column(
            children: [
              Center(
                  child: CustomPaint(
                painter: ShapesPainter(),
                child: Container(height: 500),
              )),
              Center(child: Text("$hour:$minute:$seconds", style: AppStyle.mainText))
            ],
          );
        },
      ),
    );
  }
}

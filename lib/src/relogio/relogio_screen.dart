import 'package:flutter/material.dart';
import 'package:relogio/src/relogio/date_time_model.dart';
import 'package:relogio/widgets/clock_widget.dart';

class RelogioScreen extends StatefulWidget {
  const RelogioScreen({Key? key}) : super(key: key);

  @override
  State<RelogioScreen> createState() => _RelogioScreenState();
}

class _RelogioScreenState extends State<RelogioScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ClockWidget(TimeModel(12, 38, 56))],
        )
      ],
    );
  }
}

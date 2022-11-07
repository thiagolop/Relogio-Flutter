import 'package:flutter/material.dart';
import 'package:relogio/src/cronometro/controller_cronometro.dart';

class CronometroTimer extends StatefulWidget {
  const CronometroTimer({Key? key, required this.controllerCronometro})
      : super(key: key);

  final ControllerCronometro controllerCronometro;

  @override
  State<CronometroTimer> createState() => _CronometroTimerState();
}

class _CronometroTimerState extends State<CronometroTimer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: widget.controllerCronometro,
        builder: (context, child) => Text(
          widget.controllerCronometro.formaterTempo(),
          style: const TextStyle(fontSize: 60),
        ),
      ),
    );
  }
}

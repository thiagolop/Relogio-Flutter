import 'package:flutter/material.dart';
import 'package:relogio/src/cronometro/controller_cronometro.dart';

class CronometroTimer extends StatelessWidget {
  const CronometroTimer({Key? key, required this.controllerCronometro})
      : super(key: key);

  final ControllerCronometro controllerCronometro;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: controllerCronometro,
        builder: (context, child) => Text(
          controllerCronometro.formaterTempo(),
          style: const TextStyle(fontSize: 60),
        ),
      ),
    );
  }
}

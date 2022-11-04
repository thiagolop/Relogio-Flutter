import 'package:flutter/material.dart';
import 'package:relogio/src/cronometro/controller_cronometro.dart';
import 'package:relogio/src/cronometro/cronometro_buttons.dart';
import 'package:relogio/src/cronometro/cronometro_timer.dart';

class CronometroScreen extends StatelessWidget {
  const CronometroScreen({Key? key, required this.controllerCronometro}) : super(key: key);
  final ControllerCronometro controllerCronometro;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CronometroTimer(controllerCronometro: controllerCronometro),
          SizedBox(height: MediaQuery.of(context).size.height * 0.3),
          CronometroButtons(controllerCronometro: controllerCronometro),
        ],
      ),
    );
  }
}

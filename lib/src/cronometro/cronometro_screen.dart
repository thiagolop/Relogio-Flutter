import 'package:flutter/material.dart';
import 'package:relogio/src/cronometro/controller_cronometro.dart';
import 'package:relogio/src/cronometro/cronometro_buttons.dart';
import 'package:relogio/src/cronometro/cronometro_timer.dart';

class CronometroScreen extends StatefulWidget {
  const CronometroScreen({Key? key, required this.controllerCronometro}) : super(key: key);
  final ControllerCronometro controllerCronometro;

  @override
  State<CronometroScreen> createState() => _CronometroScreenState();
}

class _CronometroScreenState extends State<CronometroScreen> {
  // @override
  // void initState() {
  //   super.initState();

  // }

  // @override
  // void dispose() {
  //   widget.controllerCronometro.pararCronometro();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CronometroTimer(controllerCronometro: widget.controllerCronometro),
          SizedBox(height: MediaQuery.of(context).size.height * 0.3),
          CronometroButtons(controllerCronometro: widget.controllerCronometro),
        ],
      ),
    );
  }
}

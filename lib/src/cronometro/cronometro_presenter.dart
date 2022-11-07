import 'package:flutter/material.dart';
import 'package:relogio/src/cronometro/controller_cronometro.dart';
import 'package:relogio/src/cronometro/cronometro_screen.dart';

class CronometroPresenter extends StatefulWidget {
  final ControllerCronometro controllerCronometro;

  const CronometroPresenter({Key? key, required this.controllerCronometro}) : super(key: key);

  @override
  State<CronometroPresenter> createState() => _CronometroPresenterState();
}

class _CronometroPresenterState extends State<CronometroPresenter> {
  @override
  Widget build(BuildContext context) {
    return CronometroScreen(controllerCronometro: widget.controllerCronometro);
  }
}

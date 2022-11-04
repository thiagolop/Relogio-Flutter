import 'package:flutter/material.dart';
import 'package:relogio/src/cronometro/controller_cronometro.dart';
import 'package:relogio/src/cronometro/cronometro_screen.dart';

class CronometroPresenter extends StatefulWidget {
  const CronometroPresenter({Key? key}) : super(key: key);

  @override
  State<CronometroPresenter> createState() => _CronometroPresenterState();
}

class _CronometroPresenterState extends State<CronometroPresenter> {
  late ControllerCronometro controllerCronometro;

  @override
  void initState() {
    super.initState();
    controllerCronometro = ControllerCronometro();
  }

  @override
  Widget build(BuildContext context) {
    return CronometroScreen(controllerCronometro: controllerCronometro);
  }
}

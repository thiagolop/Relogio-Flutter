import 'package:flutter/material.dart';
import 'package:relogio/src/cronometro/controller_cronometro.dart';

class CronometroButtons extends StatelessWidget {
  const CronometroButtons({Key? key, required this.controllerCronometro}) : super(key: key);
  final ControllerCronometro controllerCronometro;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CronometroButton(iconData: Icons.pause, onPressed: controllerCronometro.pararCronometro),
        CronometroButton(iconData: Icons.play_arrow, onPressed: controllerCronometro.iniciarCronometro),
        CronometroButton(iconData: Icons.stop, onPressed: controllerCronometro.zerarCronometro),
      ],
    );
  }
}

class CronometroButton extends StatelessWidget {
  const CronometroButton({super.key, required this.iconData, required this.onPressed});
  final IconData iconData;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: IconButton(
        icon: Icon(iconData, size: 36),
        onPressed: onPressed,
      ),
    );
  }
}

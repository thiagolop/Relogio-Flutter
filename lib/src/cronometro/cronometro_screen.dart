import 'package:flutter/material.dart';
import 'package:relogio/src/cronometro/controller_cronometro.dart';

class CronometroScreen extends StatefulWidget {
  CronometroScreen({Key? key}) : super(key: key);
  final ControllerCronometro start = ControllerCronometro();
  @override
  State<CronometroScreen> createState() => _CronometroScreenState();
}

class _CronometroScreenState extends State<CronometroScreen> {
  int milisegundos = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: AnimatedBuilder(
              animation: widget.start,
              builder: (context, child) => Text(
                widget.start.formaterTempo(),
                style: const TextStyle(fontSize: 60),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                   widget.start.pararCronometro();
                },
                icon: const Icon(
                  Icons.pause,
                  size: 35,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              IconButton(
                onPressed: () {
                  widget.start.iniciarCronometro();
                },
                icon: const Icon(
                  Icons.play_arrow,
                  size: 35,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              IconButton(
                onPressed: () {
                  widget.start.zerarCronometro();
                },
                icon: const Icon(
                  Icons.stop,
                  size: 35,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

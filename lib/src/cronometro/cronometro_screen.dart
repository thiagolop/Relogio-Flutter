import 'dart:async';
import 'package:flutter/material.dart';

class CronometroScreen extends StatefulWidget {
  const CronometroScreen({Key? key}) : super(key: key);
  @override
  State<CronometroScreen> createState() => _CronometroScreenState();
}

class _CronometroScreenState extends State<CronometroScreen> {
  int milisegundos = 0;
  bool estacorrendo = false;
  late Timer timer;
  

  void iniciarCronometro() {
    if (!estacorrendo) {
      timer = Timer.periodic(const Duration(microseconds: 100), (timer) {
        milisegundos += 100;
        setState(() {});
      });
      estacorrendo = true;
    }
  }

  void pararCronometro() {
    timer.cancel();
    estacorrendo = false;
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  String formaterTempo() {
    Duration duration = Duration(microseconds: this.milisegundos);
    String valores(int valor) {
      return valor >= 10 ? "$valor" : "0$valor";
    }
    String horas = valores(duration.inHours.remainder(24));
    String minutos = valores(duration.inMinutes.remainder(60));
    String segundos = valores(duration.inSeconds.remainder(60));
    String milisegundos = valores(duration.inMilliseconds.remainder(1000));
    return '$horas:$minutos:$segundos:$milisegundos';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              formaterTempo(),
              style: const TextStyle(fontSize: 60),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: pararCronometro,
                icon: const Icon(
                  Icons.pause,
                  size: 35,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              IconButton(
                onPressed: iniciarCronometro,
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
                  milisegundos = 0;
                  setState(() {});
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

import 'dart:async';

import 'package:flutter/cupertino.dart';

class ControllerCronometro extends ChangeNotifier{
  int milisegundos = 0;
  bool estacorrendo = false;
  late Timer timer;

  void iniciarCronometro() {
    if (!estacorrendo) {
      timer = Timer.periodic(const Duration(microseconds: 100), (timer) {
        milisegundos += 100;
        notifyListeners();
      });
      estacorrendo = true;
    }
  }

  void pararCronometro() {
    timer.cancel();
    estacorrendo = false;
  }

  void zerarCronometro(){
    milisegundos = 0;
    notifyListeners();
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
}

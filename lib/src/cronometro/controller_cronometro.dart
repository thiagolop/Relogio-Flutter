import 'dart:async';

import 'package:flutter/cupertino.dart';

class ControllerCronometro extends ChangeNotifier {
  DateTime dateTimeStart = DateTime(1);
  DateTime dateTimeCurrent = DateTime(1);
  bool estacorrendo = false;
  late Timer timer;

  void iniciarCronometro() {
    dateTimeStart = DateTime.now();
    if (!estacorrendo) {
      timer = Timer.periodic(const Duration(microseconds: 100), (timer) {
        dateTimeCurrent = DateTime.now();
        notifyListeners();
      });
      estacorrendo = true;
    } else {
      resume();
      notifyListeners();
    }
  }

  resume() {}

  void pararCronometro() {
    timer.cancel();
    estacorrendo = false;
  }

  void zerarCronometro() {
    dateTimeStart = DateTime.now();
    dateTimeCurrent = dateTimeStart;
    notifyListeners();
  }

  String formaterTempo() {
    Duration duration = dateTimeCurrent.difference(dateTimeStart);
    String horas = duration.inHours.remainder(24).toString().padLeft(2, '0');
    String minutos = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    String segundos = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    String milisegundos = duration.inMilliseconds.remainder(1000).toString().padLeft(3, '0');
    return '$horas:$minutos:$segundos:$milisegundos';
  }
}

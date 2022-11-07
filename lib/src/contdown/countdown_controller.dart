import 'dart:async';
import 'package:flutter/material.dart';

class CountdownController extends ChangeNotifier {
  DateTime dateTimeStop = DateTime(1);
  DateTime dateTimeCurrent = DateTime(1);
  bool estacorrendo = false;
  late Timer timer;

  Duration _durationTotal = const Duration();
  Duration get durationTotal => _durationTotal;
  set durationTotal(Duration value) {
    _durationTotal = value;
    notifyListeners();
  }

  int get totalMilliseconds => durationTotal.inMilliseconds;
  int get elapsedMilliseconds => dateTimeStop.difference(dateTimeCurrent).inMilliseconds;
  Duration get remainingDuration => dateTimeCurrent.difference(dateTimeStop);
  double get circularProgress => totalMilliseconds == 0 ? 0 : elapsedMilliseconds / totalMilliseconds;
  String get timerText {
    Duration duration = remainingDuration;
    return '${(duration.inHours).toString().padLeft(2, '0')} : ${(duration.inMinutes % 60).toString().padLeft(2, '0')} : ${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  play() {
    estacorrendo = true;
    timer = Timer.periodic(const Duration(microseconds: 100), (timer) {
      if (estacorrendo) {
      } else {}
    });
  }

  pause() {
    timer.cancel();
    estacorrendo = false;
    notifyListeners();
  }

  resume() {}

  reset() {
    dateTimeStop = DateTime.now().add(durationTotal);
    timer = Timer.periodic(const Duration(microseconds: 100), (timer) {
      dateTimeCurrent = DateTime.now();
      notifyListeners();
    });
    estacorrendo = true;
    notifyListeners();
  }

  stop() {
    timer.cancel();
    estacorrendo = false;
    notifyListeners();
  }

  togglePause() {
    if (estacorrendo) {
      pause();
    } else {
      resume();
    }
  }
  // bool estaCorrendo = false;
  // int minutes = 2;
  // int seconds = 0;
  // double linearProgress = 1;
  // Timer? timer;
  // double each = 0;
  // Duration duration = const Duration();

  // void startTimer() {
  //   estaCorrendo = true;
  //   timer = Timer.periodic(const Duration(seconds: 1), (timer) {
  //     if (minutes == 0 && seconds == 0) {
  //       estaCorrendo = false;
  //       linearProgress = 0;
  //       stopTimer();
  //     } else if (seconds == 0) {
  //       seconds = 59;
  //       minutes--;
  //     } else {
  //       linearProgress -= each;
  //       seconds--;
  //     }
  //   });
  // }

  // void restartTimer(int minutes, int seconds) {
  //   stopTimer();
  //   this.minutes = minutes;
  //   this.seconds = seconds;
  //   linearProgress = 1;
  //   startTimer();
  //   calculateToLinearProgress();
  // }

  // void stopTimer() {
  //   timer?.cancel();
  //   estaCorrendo = false;
  // }

  // void calculateToLinearProgress() {
  //   if (minutes > 0) {
  //     each = (100 / (minutes * 60 + seconds) / 100);
  //   } else {
  //     each = (100 / (seconds) / 100);
  //   }

  // }
}

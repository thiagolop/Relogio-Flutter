import 'dart:async';
import 'package:flutter/material.dart';

class CountdownController extends ChangeNotifier {
  bool isStarted = false;
  int hours = 0;
  int minutes = 0;
  int seconds = 0;
  int miliseconds = 0;
  double linearProgress = 1;
  Timer? timer;
  double each = 0;
  Duration duration = const Duration();

  void setTimer(Duration duration) {
    this.duration = duration;
    hours = duration.inHours;
    minutes = duration.inMinutes % 60;
    seconds = duration.inSeconds % 60;
    // miliseconds = duration.inMilliseconds % 1000;
    each = 1 / duration.inSeconds;
    linearProgress = 1;
    notifyListeners();
  }

  void startTimer() {
    isStarted = true;
    notifyListeners();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (minutes == 0 && seconds == 0 && hours == 0) {
        isStarted = false;
        linearProgress = 0;
        stopTimer();
        notifyListeners();
      } else if (seconds == 0) {
        seconds = 59;
        _decreaseMinute();
      } else if (minutes == 0 && hours != 0) {
        minutes = 59;
        _decreaseHour();
      } else {
        linearProgress -= each;
        _decreaseSecond();
      }
    });
  }

  void restartTimer() {
    stopTimer();
    minutes = 0;
    seconds = 0;
    hours = 0;
    linearProgress = 1;
    calculateToLinearProgress();
    notifyListeners();
  }

  void stopTimer() {
    timer?.cancel();
    isStarted = false;
    notifyListeners();
  }

  _decreaseSecond() {
    seconds--;
    notifyListeners();
  }

  _decreaseMinute() {
    minutes--;
    notifyListeners();
  }

  _decreaseHour() {
    hours--;
    notifyListeners();
  }

  void calculateToLinearProgress() {
    if (minutes > 0) {
      each = (100 / (minutes * 60 + seconds) / 100);
    } else {
      each = (100 / (seconds) / 100);
    }
  }
}

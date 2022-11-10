import 'package:flutter/animation.dart';

class AlarmInfo {
  DateTime alarmDateTime = DateTime.now();
  String description = '';
  bool isActive = false;
  List<Color> gradientColors = [];

  AlarmInfo(alarmDateTime, {description,gradientColors }){
    this.alarmDateTime;
    this.description;
    this.gradientColors;
  }
}

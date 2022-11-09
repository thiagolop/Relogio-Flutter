import 'package:flutter/material.dart';
import 'package:relogio/src/data.dart';
import 'despertador_alarm.dart';

class DespertadorScreen extends StatefulWidget {
  const DespertadorScreen({Key? key}) : super(key: key);

  @override
  State<DespertadorScreen> createState() => _DespertadorScreenState();
}

class _DespertadorScreenState extends State<DespertadorScreen> {
  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: <Widget>[
          const Text('Alarm', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
          Expanded(
            child: ListView(
              children: alarms.map((alarm) {
                return const DespertadorAlarm();
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

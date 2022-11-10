import 'package:flutter/material.dart';
import 'button_create_alarm.dart';
import 'data_alarm.dart';
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
                return const Padding(
                  padding: EdgeInsets.only(left: 12, right: 12),
                  child: DespertadorAlarm(),
                );
              }).followedBy([
                const Padding(
                  padding: EdgeInsets.only(left: 12, right: 12),
                  child: ButtonCreateAlarm(),
                ),
              ]).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

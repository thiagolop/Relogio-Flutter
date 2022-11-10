import 'package:flutter/material.dart';

class ButtonCreateAlarm extends StatelessWidget {
  const ButtonCreateAlarm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey.shade800),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0), side: const BorderSide(color: Color(0xFF1D0799))))),
        onPressed: () {},
        child: Column(
          children: const [
            SizedBox(height: 6),
            Icon(Icons.add_alarm, size: 60, color: Colors.white),
            SizedBox(height: 8),
            Text(
              'Add Alarm',
              style: TextStyle(color: Colors.white, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}

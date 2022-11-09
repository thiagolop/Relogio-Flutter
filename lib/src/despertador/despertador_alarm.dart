import 'package:flutter/material.dart';

class DespertadorAlarm extends StatelessWidget {
  const DespertadorAlarm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Colors.purple, Colors.red], begin: Alignment.centerLeft, end: Alignment.centerRight),
        boxShadow: [
          BoxShadow(color: Colors.red.withOpacity(0.4), blurRadius: 8, spreadRadius: 2, offset: const Offset(4, 4)),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.label, color: Colors.white, size: 24),
                  SizedBox(width: 8),
                  Text(
                    'Trabalho',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              Switch(
                value: true,
                onChanged: (bool value) {},
                activeColor: Colors.white,
              )
            ],
          ),
          const Text(
            'Segunda-Feira',
            style: TextStyle(color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '07:00 AM',
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
              ),
              Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 30)
            ],
          ),
        ],
      ),
    );
  }
}

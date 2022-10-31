import 'package:flutter/material.dart';

class RelogioScreen extends StatefulWidget {
  const RelogioScreen({Key? key}) : super(key: key);

  @override
  State<RelogioScreen> createState() => _RelogioScreenState();
}

class _RelogioScreenState extends State<RelogioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(
        color: Colors.green,
      ),
    );
  }
}

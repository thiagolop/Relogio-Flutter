import 'package:flutter/material.dart';
import 'package:relogio/src/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Relogio',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen()
    );
  }
}

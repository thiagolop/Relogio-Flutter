import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relogio/src/contdown/countdown_controller.dart';
import 'package:relogio/src/splash_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => CountdownController()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Relogio',
        theme: ThemeData(primaryColor: Colors.blue),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen());
  }
}

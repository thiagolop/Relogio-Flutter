import 'package:flutter/material.dart';
import 'package:relogio/src/contdown/countdown_controller.dart';
import 'package:relogio/src/contdown/countdown_screen.dart';

class ContdownPresenter extends StatefulWidget {
  const ContdownPresenter({Key? key}) : super(key: key);

  @override
  State<ContdownPresenter> createState() => _ContdownPresenterState();
}

class _ContdownPresenterState extends State<ContdownPresenter> {
  late CountdownController controllerContdown;

  @override
  void initState() {
    super.initState();
    controllerContdown = CountdownController();
  }

  @override
  Widget build(BuildContext context) {
    return CountdownScreen(countdownController: controllerContdown);
  }
}

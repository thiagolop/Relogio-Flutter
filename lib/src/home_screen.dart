import 'package:flutter/material.dart';
import 'package:relogio/src/cronometro/cronometro_presenter.dart';
import 'package:relogio/src/despertador/despertador_screen.dart';
import 'package:relogio/src/relogio/relogio_screen.dart';
import 'package:relogio/widgets/button_bar/button_bar_itens.dart';
import '../widgets/button_bar/button_navigator_bar.dart';
import 'contdown/contdown_presenter.dart';
import 'cronometro/controller_cronometro.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pagecontroller = PageController();
  late ControllerCronometro controllerCronometro;

  @override
  void initState() {
    super.initState();
    controllerCronometro = ControllerCronometro();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pagecontroller,
        children: [
          const RelogioScreen(),
          const DespertadorScreen(),
          CronometroPresenter(controllerCronometro: controllerCronometro),
          const ContdownPresenter(),
        ],
      ),
      bottomNavigationBar: ButtonNavigatorBar(
        onIndexSelected: (index) => pagecontroller.animateToPage(
          index,
          duration: const Duration(milliseconds: 50),
          curve: Curves.ease,
        ),
        itens: [
          ButtonBarItens(label: 'Relogio', icon: Icons.watch_later_outlined),
          ButtonBarItens(label: 'Despertador', icon: Icons.alarm),
          ButtonBarItens(label: 'Cronometro', icon: Icons.timer_outlined),
          ButtonBarItens(label: 'Countdown', icon: Icons.hourglass_empty),
        ],
      ),
    );
  }
}

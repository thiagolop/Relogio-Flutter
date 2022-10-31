import 'package:flutter/material.dart';
import 'package:relogio/src/contdown/countdown_screem.dart';
import 'package:relogio/src/cronometro/cronometro_screen.dart';
import 'package:relogio/src/despertador/despertador_screen.dart';
import 'package:relogio/src/relogio/relogio_screen.dart';
import 'package:relogio/widgets/button_bar/button_bar_itens.dart';
import '../widgets/button_bar/button_navigator_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pagecontroller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pagecontroller,
        children:  [
          const DespertadorScreen(),
          const RelogioScreen(),
          CronometroScreen(),
          const CountdownScreem(),
        ],
      ),
      bottomNavigationBar: ButtonNavigatorBar(
        
        onIndexSelected: (index) => pagecontroller.animateToPage(
          index,
          duration: const Duration(milliseconds: 50),
          curve: Curves.ease,
        ),

        itens: [
          ButtonBarItens(label: 'Despertador', icon: Icons.alarm),
          ButtonBarItens(label: 'Relogio', icon: Icons.watch_later_outlined),
          ButtonBarItens(label: 'Cronometro', icon: Icons.timer_outlined),
          ButtonBarItens(label: 'Countdown', icon: Icons.hourglass_empty),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:relogio/widgets/button_bar/button_bar_itens.dart';

class ButtonNavigatorBar extends StatefulWidget {
  final List<ButtonBarItens> itens;
  final void Function(int index) onIndexSelected;
  const ButtonNavigatorBar({
    Key? key,
    required this.itens,
    required this.onIndexSelected,
  }) : super(key: key);

  @override
  State<ButtonNavigatorBar> createState() => _ButtonNavigatorBarState();
}

class _ButtonNavigatorBarState extends State<ButtonNavigatorBar> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: List.from(
        widget.itens.map(
          (itens) => BottomNavigationBarItem(
              icon: Icon(itens.icon), label: itens.label),
        ),
      ),
      unselectedItemColor: Colors.black54,
      selectedItemColor: Colors.blue,
      showUnselectedLabels: true,
      currentIndex: selected,
      onTap: (index) {
        widget.onIndexSelected(index);
        setState(() {
          selected = index;
        });
      },
    );
  }
}

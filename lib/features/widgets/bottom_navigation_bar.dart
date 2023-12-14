import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
   int selectedIndex;
   final List<FlashyTabBarItem> items;

  final Function(int) onItemTapped;

   CustomBottomNavigationBar({super.key, required this.onItemTapped,required this.selectedIndex, required this.items});

  @override
  Widget build(BuildContext context) {
    return FlashyTabBar(
      iconSize: 30,
      items: items,
      // selectedItemColor: Theme.of(context).primaryColor,

      selectedIndex: selectedIndex,
      onItemSelected: onItemTapped,
    );
  }
}

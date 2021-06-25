import 'package:flutter/material.dart';
import 'package:boldfood/utils/palette.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import 'custom_appbar.dart';

class BottomNaviBar extends StatelessWidget {
  final ValueChanged<int> currentIndex;
  final index;
  BottomNaviBar({required this.currentIndex, this.index});
  @override
  Widget build(BuildContext context) {
    return BottomNavyBar(
      selectedIndex: index,
      onItemSelected: (index) {
        currentIndex(index);
        CustomAppBar.pageController.jumpToPage(index);
      },
      showElevation: false,
      backgroundColor: Color(0xFFF6F7FB),
      itemCornerRadius: 20,
      curve: Curves.easeIn,
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Color(0xff11ac6a),
            textAlign: TextAlign.center,
            inactiveColor: Color(0xFFBABABA)),
        BottomNavyBarItem(
            icon: Icon(Icons.notifications),
            title: Text('Notifications'),
            activeColor: Palette.theme,
            textAlign: TextAlign.center,
            inactiveColor: Color(0xFFBABABA)),
        BottomNavyBarItem(
            icon: Icon(Icons.favorite),
            title: Text(
              'Favorite',
            ),
            activeColor: Palette.theme,
            textAlign: TextAlign.center,
            inactiveColor: Color(0xFFBABABA)),
        BottomNavyBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Account'),
            activeColor: Palette.theme,
            textAlign: TextAlign.center,
            inactiveColor: Color(0xFFBABABA)),
      ],
    );
  }
}

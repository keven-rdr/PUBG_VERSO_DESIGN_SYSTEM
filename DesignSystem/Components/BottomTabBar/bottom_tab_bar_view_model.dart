import 'package:flutter/material.dart';

enum BottomTabTheme { light, dark }

class BottomTabBarViewModel {
  final List<BottomNavigationBarItem> bottomTabs;
  final BottomTabTheme theme;

  BottomTabBarViewModel({
    required this.bottomTabs,
    this.theme = BottomTabTheme.light,
  });
}

import 'package:flutter/material.dart';
import '../../shared/app_constants.dart';
import '../../shared/colors.dart';
import 'bottom_tab_bar_view_model.dart';

abstract class BottomTabBarDelegate {
  void onIndexChange(int currentIndex);
}

class BottomTabBar extends StatelessWidget {
  final BottomTabBarViewModel viewModel;
  final int currentIndex;
  final BottomTabBarDelegate delegate;
  final Color? backgroundColor;
  final double? elevation;
  final double iconSize;

  const BottomTabBar._({
    super.key,
    required this.viewModel,
    required this.currentIndex,
    required this.delegate,
    this.backgroundColor,
    this.elevation,
    this.iconSize = AppIconSizes.navBar,
  });

  static Widget instantiate({
    required BottomTabBarViewModel viewModel,
    required int currentIndex,
    required BottomTabBarDelegate delegate,
    Color? backgroundColor,
    double? elevation,
    double iconSize = AppIconSizes.navBar,
  }) {
    return BottomTabBar._(
      viewModel: viewModel,
      currentIndex: currentIndex,
      delegate: delegate,
      backgroundColor: backgroundColor,
      elevation: elevation,
      iconSize: iconSize,
    );
  }

  @override
  Widget build(BuildContext context) {
    const double navBarHeight = 65.0;
    final processedTabs = viewModel.bottomTabs.map((item) {
      return BottomNavigationBarItem(
        icon: item.icon,
        label: item.label,
      );
    }).toList();

    return SizedBox(
      height: navBarHeight,
      child: BottomNavigationBar(
        items: processedTabs,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: darkSecondaryBrandColor,
        unselectedItemColor: lightPrimaryBaseColorLight,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: delegate.onIndexChange,
        backgroundColor: backgroundColor,
        elevation: elevation,
        iconSize: iconSize,
      ),
    );
  }}
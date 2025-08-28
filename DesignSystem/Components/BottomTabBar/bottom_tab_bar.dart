import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../shared/colors.dart';
import 'bottom_tab_bar_view_model.dart';

abstract class BottomTabBarDelegate{
  void onIndexChange(int currentIndex);
}

class BottomTabBar extends StatelessWidget {
  final BottomTabBarViewModel viewModel;
  final int currentIndex;
  final BottomTabBarDelegate? delegate;

  const BottomTabBar._({super.key, required this.viewModel, required this.currentIndex, this.delegate});

  static Widget instantiate({
    required BottomTabBarViewModel viewModel,
    required int currentIndex,
    required BottomTabBarDelegate delegate,
  }) {
    return BottomTabBar._(
      viewModel: viewModel,
      currentIndex: currentIndex,
      delegate: delegate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: viewModel.bottomTabs,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: darkPrimaryBrandColor,
      unselectedItemColor: lightPrimaryBaseColorLight,
      showUnselectedLabels: true,
      currentIndex: currentIndex,
      onTap: delegate?.onIndexChange,
    );
  }
}
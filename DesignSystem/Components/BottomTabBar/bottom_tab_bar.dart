import 'package:flutter/material.dart';
import '../../shared/colors.dart';
import 'bottom_tab_bar_view_model.dart';

abstract class BottomTabBarDelegate {
  void onIndexChange(int currentIndex);
}

class BottomTabBar extends StatelessWidget {
  final BottomTabBarViewModel viewModel;
  final int currentIndex;
  final BottomTabBarDelegate delegate;
  final double iconSize;

  const BottomTabBar._({
    required this.viewModel,
    required this.currentIndex,
    required this.delegate,
    this.iconSize = 26.0,
  });

  static Widget instantiate({
    required BottomTabBarViewModel viewModel,
    required int currentIndex,
    required BottomTabBarDelegate delegate,
    double iconSize = 26.0,
  }) {
    return BottomTabBar._(
      viewModel: viewModel,
      currentIndex: currentIndex,
      delegate: delegate,
      iconSize: iconSize,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color barBackgroundColor =
    viewModel.theme == BottomTabTheme.light ? neutralLight : brandSecondary;

    const Color itemColor = brandPrimary;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Material(
        color: barBackgroundColor,
        elevation: 8.0,
        shadowColor: Colors.black.withOpacity(0.3),
        shape: const StadiumBorder(),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          child: SizedBox(
            height: 65.0,
            child: BottomNavigationBar(
              items: viewModel.bottomTabs,
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              onTap: delegate.onIndexChange,

              backgroundColor: Colors.transparent,
              selectedItemColor: itemColor,
              unselectedItemColor: itemColor,

              elevation: 0,
              iconSize: iconSize,
              showSelectedLabels: false,
              showUnselectedLabels: false,
            ),
          ),
        ),
      ),
    );
  }
}

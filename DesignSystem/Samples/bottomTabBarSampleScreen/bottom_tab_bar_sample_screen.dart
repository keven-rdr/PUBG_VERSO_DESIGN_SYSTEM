import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../Components/BottomTabBar/bottom_tab_bar.dart';
import '../../Components/BottomTabBar/bottom_tab_bar_view_model.dart';
import '../../shared/app_constants.dart';
import '../../shared/colors.dart';

class BottomTabBarPage extends StatefulWidget {
  const BottomTabBarPage({super.key});

  @override
  State<BottomTabBarPage> createState() => _BottomTabBarPageState();
}

class _BottomTabBarPageState extends State<BottomTabBarPage>
    implements BottomTabBarDelegate {
  int actualIndex = 0;

  @override
  void onIndexChange(int currentIndex) {
    setState(() {
      actualIndex = currentIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const Center(child: Text('Home Page', style: TextStyle(fontSize: 22))),
      const Center(child: Text('Messages Page', style: TextStyle(fontSize: 22))),
      const Center(child: Text('Label Page', style: TextStyle(fontSize: 22))),
      const Center(child: Text('Profile Page', style: TextStyle(fontSize: 22))),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Tab Bar Page'),
        backgroundColor: Colors.grey[100],
      ),
      backgroundColor: Colors.grey[100],

      body: Stack(
        children: [
          pages[actualIndex],

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildFloatingBottomTabBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingBottomTabBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Material(
        elevation: 8.0,
        borderRadius: BorderRadius.circular(25.0),
        color: normalTertiaryBaseColorLight,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: BottomTabBar.instantiate(
            viewModel: BottomTabBarViewModel(
              bottomTabs: [
                const BottomNavigationBarItem(icon: Icon(LucideIcons.home), label: ""),
                const BottomNavigationBarItem(icon: Icon(LucideIcons.messageCircle), label: ""),
                const BottomNavigationBarItem(icon: Icon(LucideIcons.bell), label: ""),
                const BottomNavigationBarItem(icon: Icon(LucideIcons.user), label: ""),
              ],
            ),
            currentIndex: actualIndex,
            delegate: this,
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconSize: AppIconSizes.navBar,
          ),
        ),
      ),
    );
  }
}
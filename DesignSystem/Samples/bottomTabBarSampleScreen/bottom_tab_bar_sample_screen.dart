import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../Components/BottomTabBar/bottom_tab_bar.dart';
import '../../Components/BottomTabBar/bottom_tab_bar_view_model.dart';
import '../../shared/colors.dart';


class BottomTabBarPage extends StatefulWidget {
  const BottomTabBarPage({super.key});

  @override
  State<BottomTabBarPage> createState() => _BottomTabBarPageState();
}

class _BottomTabBarPageState extends State<BottomTabBarPage>
    implements BottomTabBarDelegate {
  int _actualIndex = 0;
  BottomTabTheme _currentTheme = BottomTabTheme.light;

  @override
  void onIndexChange(int currentIndex) {
    setState(() {
      _actualIndex = currentIndex;
    });
  }

  void _toggleTheme() {
    setState(() {
      _currentTheme = _currentTheme == BottomTabTheme.light
          ? BottomTabTheme.dark
          : BottomTabTheme.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      _buildPageContent('Home', LucideIcons.home),
      _buildPageContent('Partidas', LucideIcons.swords),
      _buildPageContent('Favoritos', LucideIcons.heart),
      _buildPageContent('Perfil', LucideIcons.user),
    ];

    final isDark = _currentTheme == BottomTabTheme.dark;
    final pageBackgroundColor = isDark ? brandSecondary.withOpacity(0.9) : const Color(0xFFF0F0F0);
    final pageForegroundColor = isDark ? neutralLight : brandSecondary;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Tab Bar'),
        actions: [
          IconButton(
            icon: Icon(isDark ? LucideIcons.sun : LucideIcons.moon),
            onPressed: _toggleTheme,
            tooltip: 'Mudar Tema',
          )
        ],
      ),
      backgroundColor: pageBackgroundColor,
      body: Stack(
        children: [
          Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: pages[_actualIndex],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BottomTabBar.instantiate(
              viewModel: BottomTabBarViewModel(
                theme: _currentTheme,
                bottomTabs: [
                  const BottomNavigationBarItem(icon: Icon(LucideIcons.home), label: ""),
                  const BottomNavigationBarItem(icon: Icon(LucideIcons.swords), label: ""),
                  const BottomNavigationBarItem(icon: Icon(LucideIcons.heart), label: ""),
                  const BottomNavigationBarItem(icon: Icon(LucideIcons.user), label: ""),
                ],
              ),
              currentIndex: _actualIndex,
              delegate: this,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageContent(String title, IconData icon) {
    final isDark = _currentTheme == BottomTabTheme.dark;
    final foregroundColor = isDark ? neutralLight : brandSecondary;

    return Column(
      key: ValueKey(title),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80, color: foregroundColor.withOpacity(0.8)),
        const SizedBox(height: 20),
        Text(title, style: TextStyle(fontSize: 28, color: foregroundColor, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../Components/ValueComparisonCard/value_comparison_card_page.dart';
import '../../Components/ValueComparisonCard/value_comparison_card_view_model.dart';

class ValueCardPage extends StatefulWidget {
  const ValueCardPage({super.key});

  @override
  State<ValueCardPage> createState() => _ValueCardPageState();
}

class _ValueCardPageState extends State<ValueCardPage> {
  ValueCardTheme _currentTheme = ValueCardTheme.dark;

  void _toggleTheme() {
    setState(() {
      _currentTheme = _currentTheme == ValueCardTheme.dark
          ? ValueCardTheme.light
          : ValueCardTheme.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = _currentTheme == ValueCardTheme.dark;

    final viewModel1 = ValueComparisonViewModel(
      theme: _currentTheme,
      entry1: ValueEntry(value: '92', label: 'Pontos', color: Colors.greenAccent),
      entry2: ValueEntry(value: '30', label: 'Pontos', color: Colors.redAccent),
      details: [
        'A velocidade de disparo é mais rápida',
        'Dano final e mais forte',
        'Maior chance de eliminar o inimigo',
      ],
    );

    final viewModel2 = ValueComparisonViewModel(
      theme: _currentTheme,
      entry1: ValueEntry(value: '92', label: 'Pontos', color: Colors.blueAccent),
      entry2: ValueEntry(value: '30', label: 'Pontos', color: Colors.redAccent),
      details: [
        'A velocidade de disparo é mais rápida',
        'Dano final e mais forte',
        'Maior chance de eliminar o inimigo',
      ],
    );

    return Scaffold(
      backgroundColor: isDark ? Colors.grey[850] : const Color(0xFFF0F0F0),
      appBar: AppBar(
        title: const Text('Value Card Component'),
        actions: [
          IconButton(
            icon: Icon(isDark ? LucideIcons.sun : LucideIcons.moon),
            onPressed: _toggleTheme,
            tooltip: 'Mudar Tema',
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ValueComparisonCard(viewModel: viewModel1),
            const SizedBox(height: 20),
            ValueComparisonCard(viewModel: viewModel2),
          ],
        ),
      ),
    );
  }
}


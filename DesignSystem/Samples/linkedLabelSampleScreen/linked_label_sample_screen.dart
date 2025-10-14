import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../Components/LinkedLabel/linked_label.dart';
import '../../Components/LinkedLabel/linked_label_view_model.dart';
import '../../shared/colors.dart';


class LinkedLabelPage extends StatefulWidget {
  const LinkedLabelPage({super.key});

  @override
  State<LinkedLabelPage> createState() => _LinkedLabelPageState();
}

class _LinkedLabelPageState extends State<LinkedLabelPage> {
  LinkedLabelTheme _currentTheme = LinkedLabelTheme.dark;

  void _toggleTheme() {
    setState(() {
      _currentTheme = _currentTheme == LinkedLabelTheme.dark
          ? LinkedLabelTheme.light
          : LinkedLabelTheme.dark;
    });
  }

  void _showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Link foi clicado!'),
        duration: Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = _currentTheme == LinkedLabelTheme.dark;
    final pageBackgroundColor = isDark ? brandSecondary.withOpacity(0.9) : const Color(0xFFF0F0F0);
    final textColor = isDark ? neutralLight : brandSecondary;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Linked Label Demo"),
        actions: [
          IconButton(
            icon: Icon(isDark ? LucideIcons.sun : LucideIcons.moon),
            onPressed: _toggleTheme,
            tooltip: 'Mudar Tema',
          )
        ],
      ),
      backgroundColor: pageBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Exemplo de LinkedLabel',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 32),
            LinkedLabel.instantiate(
              viewModel: LinkedLabelViewModel(
                theme: _currentTheme,
                fullText: "Ao continuar, você concorda com nossos Termos de Serviço.",
                linkedText: "Termos de Serviço",
                onLinkTap: _showSnackBar,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
            LinkedLabel.instantiate(
              viewModel: LinkedLabelViewModel(
                theme: _currentTheme,
                fullText: "Não tem uma conta? Cadastre-se agora.",
                linkedText: "Cadastre-se",
                onLinkTap: _showSnackBar,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart' hide CardTheme;
import 'package:lucide_icons/lucide_icons.dart';
import '../../Components/Card/app_card.dart';
import '../../Components/Card/card_view_model.dart';
import '../../shared/colors.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  CardTheme _currentTheme = CardTheme.dark;

  void _toggleTheme() {
    setState(() {
      _currentTheme =
      _currentTheme == CardTheme.dark ? CardTheme.light : CardTheme.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = _currentTheme == CardTheme.dark;


    final infoCardViewModel = InfoCardViewModel(
      theme: _currentTheme,
      imagePath: 'assets/images/ace32.png',
      title: 'ACE32 - AR',
      details: {
        'Estatísticas': '17.1',
        'Dano de Acerto': '4.5',
      },
      actions: [
        CardAction(icon: LucideIcons.chevronDown, onTap: () => _showSnackBar('Expandir')),
        CardAction(icon: LucideIcons.plus, onTap: () => _showSnackBar('Adicionar')),
      ],
    );

    final infoCardDeletableViewModel = InfoCardViewModel(
      theme: _currentTheme,
      imagePath: 'assets/images/ace32.png',
      title: 'ACE32 - AR (Favorito)',
      details: {
        'Modo de disparo': 'Único, Automático',
        'Tipo': 'Rifle de Assalto',
      },
      actions: [
        CardAction(icon: LucideIcons.chevronDown, onTap: () => _showSnackBar('Expandir')),
        CardAction(icon: LucideIcons.trash2, iconColor: destructive, onTap: () => _showSnackBar('Remover')),
      ],
    );

    final formCardViewModel = FormCardViewModel(
      theme: _currentTheme,
      title: 'Meus Dados',
      fields: [
        FormFieldModel(label: 'Nome', value: 'Fulano Pereira Rodrigues'),
        FormFieldModel(label: 'E-mail', value: 'fulano.rodrigues@email.com'),
      ],
    );

    final containerCardViewModel = ContainerCardViewModel(
      theme: _currentTheme,
      title: 'Meus Favoritos',
      child: Text(
        'Aqui você pode adicionar qualquer outro widget.\nPerfeito para seções personalizadas.',
        style: TextStyle(
          color: isDark ? neutralGrey : brandSecondary.withOpacity(0.8),
          height: 1.5,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: isDark ? brandSecondary.withOpacity(0.95) : const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Cards Component'),
        actions: [
          IconButton(
            icon: Icon(isDark ? LucideIcons.sun : LucideIcons.moon),
            onPressed: _toggleTheme,
            tooltip: 'Mudar Tema',
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          const _SectionTitle('Card de Informação'),
          AppCard(viewModel: infoCardViewModel),
          const SizedBox(height: 16),
          AppCard(viewModel: infoCardDeletableViewModel),
          const SizedBox(height: 32),

          const _SectionTitle('Card de Formulário'),
          AppCard(viewModel: formCardViewModel),
          const SizedBox(height: 32),

          const _SectionTitle('Card Container'),
          AppCard(viewModel: containerCardViewModel),
        ],
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: isDark ? neutralLight.withOpacity(0.9) : brandSecondary.withOpacity(0.9),
        ),
      ),
    );
  }
}

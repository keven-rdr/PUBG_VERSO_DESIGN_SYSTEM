import 'package:flutter/material.dart' hide CardTheme;
import 'package:lucide_icons/lucide_icons.dart';
import '../../Components/Card/app_card.dart';
import '../../Components/Card/card_view_model.dart';
import '../../Components/Buttons/ActionButton/action_button_view_model.dart';
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

    final infoCard = InfoCardViewModel(
      theme: _currentTheme,
      imagePath: 'assets/images/ace32.png',
      title: 'ACE32 - AR',
      details: {'Estatísticas': '17.1', 'Dano de Acerto': '4.5'},
      actions: [
        CardAction(viewModel: ActionButtonViewModel(size: ActionButtonSize.small, style: ActionButtonStyle.primary, icon: LucideIcons.chevronDown, onPressed: () {})),
        CardAction(viewModel: ActionButtonViewModel(size: ActionButtonSize.small, style: ActionButtonStyle.primary, icon: LucideIcons.plus, onPressed: () {})),
      ],
    );

    final infoCardDeletable = InfoCardViewModel(
      theme: _currentTheme,
      imagePath: 'assets/images/ace32.png',
      title: 'ACE32 - AR (Favorito)',
      details: {'Visão Geral': 'Rifle de Assalto', 'Tipo': 'Automático'},
      actions: [
        CardAction(viewModel: ActionButtonViewModel(size: ActionButtonSize.small, style: ActionButtonStyle.primary, icon: LucideIcons.chevronDown, onPressed: () {})),
        CardAction(viewModel: ActionButtonViewModel(size: ActionButtonSize.small, style: ActionButtonStyle.trash, icon: LucideIcons.trash2, onPressed: () {})),
      ],
    );

    final formCard = FormCardViewModel(
      theme: _currentTheme,
      title: 'Meus Dados',
      fields: [
        FormFieldModel(label: 'Nome', value: 'Fulano Pereira'),
        FormFieldModel(label: 'E-mail', value: 'fulano.pereira@email.com'),
      ],
    );

    final containerCard = ContainerCardViewModel(
      theme: _currentTheme,
      title: 'Meus Favoritos',
      child: Text(
        'Conteúdo personalizado para o container card.',
        style: TextStyle(color: isDark ? neutralGrey : brandSecondary),
      ),
    );

    return Scaffold(
      backgroundColor: isDark ? brandSecondary.withOpacity(0.95) : const Color(0xFFEFEFEF),
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
          AppCard(viewModel: infoCard),
          const SizedBox(height: 16),
          AppCard(viewModel: infoCardDeletable),
          const SizedBox(height: 16),
          AppCard(viewModel: formCard),
          const SizedBox(height: 16),
          AppCard(viewModel: containerCard),
        ],
      ),
    );
  }
}


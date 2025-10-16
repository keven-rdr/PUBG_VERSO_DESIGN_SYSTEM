import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../Components/Buttons/ActionButton/action_button.dart';
import '../../Components/Buttons/ActionButton/action_button_view_model.dart';

class ActionButtonPage extends StatelessWidget {
  const ActionButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Demonstração de Botões'),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          _buildSectionTitle('Primary Buttons'),
          _buildButtonRow([
            ActionButtonViewModel(
                size: ActionButtonSize.large, style: ActionButtonStyle.primary, text: 'Entrar', onPressed: () {}),
            ActionButtonViewModel(
                size: ActionButtonSize.large, style: ActionButtonStyle.primary, text: 'Entrar', onPressed: null),
          ]),
          const SizedBox(height: 30),

          _buildSectionTitle('Secondary Buttons'),
          _buildButtonRow([
            ActionButtonViewModel(
                size: ActionButtonSize.medium, style: ActionButtonStyle.secondary, text: 'Button', icon: LucideIcons.check, onPressed: () {}),
            ActionButtonViewModel(
                size: ActionButtonSize.medium, style: ActionButtonStyle.secondary, icon: LucideIcons.plus, onPressed: () {}),
          ]),
          const SizedBox(height: 30),

          _buildSectionTitle('Botões de Ícone'),
          _buildButtonRow([
            ActionButtonViewModel(
                size: ActionButtonSize.large, style: ActionButtonStyle.primary, icon: LucideIcons.plus, onPressed: () {}),
            ActionButtonViewModel(
                size: ActionButtonSize.large, style: ActionButtonStyle.secondary, icon: LucideIcons.plus, onPressed: () {}),
            ActionButtonViewModel(
                size: ActionButtonSize.large, style: ActionButtonStyle.primary, icon: LucideIcons.plus, onPressed: null), // Disabled
          ]),
          const SizedBox(height: 5),
          _buildButtonRow([
            ActionButtonViewModel(
                size: ActionButtonSize.large, style: ActionButtonStyle.primary, icon: LucideIcons.chevronLeft, onPressed: () {}),
            ActionButtonViewModel(
                size: ActionButtonSize.large, style: ActionButtonStyle.secondary, icon: LucideIcons.chevronLeft, onPressed: () {}),
            ActionButtonViewModel(
                size: ActionButtonSize.large, style: ActionButtonStyle.secondary, icon: LucideIcons.chevronLeft, onPressed: null), // Disabled
          ]),
          const SizedBox(height: 5),
          _buildButtonRow([
            ActionButtonViewModel(
                size: ActionButtonSize.large, style: ActionButtonStyle.primary, icon: LucideIcons.chevronDown, onPressed: () {}),
            ActionButtonViewModel(
                size: ActionButtonSize.large, style: ActionButtonStyle.secondary, icon: LucideIcons.chevronDown, onPressed: () {}),
            ActionButtonViewModel(
                size: ActionButtonSize.large, style: ActionButtonStyle.secondary, icon: LucideIcons.chevronDown, onPressed: null), // Disabled
          ]),
          const SizedBox(height: 30),

          _buildSectionTitle('Destructive Buttons'),
          _buildButtonRow([
            ActionButtonViewModel(
                size: ActionButtonSize.medium, style: ActionButtonStyle.destructive, text: 'Sair', icon: LucideIcons.logOut, onPressed: () {}),
            ActionButtonViewModel(
                size: ActionButtonSize.medium, style: ActionButtonStyle.destructive, text: 'Sair', icon: LucideIcons.logOut, onPressed: null),
          ]),
          const SizedBox(height: 30),

          _buildSectionTitle('Trash Button'),
          _buildButtonRow([
            ActionButtonViewModel(
                size: ActionButtonSize.large, style: ActionButtonStyle.trash, icon: LucideIcons.trash2, onPressed: () {}),
            ActionButtonViewModel(
                size: ActionButtonSize.large, style: ActionButtonStyle.trash, icon: LucideIcons.trash2, onPressed: null),
          ]),
          const SizedBox(height: 30),

          _buildSectionTitle('Outline Buttons'),
          _buildButtonRow([
            ActionButtonViewModel(
                size: ActionButtonSize.small, style: ActionButtonStyle.outline, text: 'Ver Detalhes', onPressed: () {}),
            ActionButtonViewModel(
                size: ActionButtonSize.small, style: ActionButtonStyle.outline, icon: LucideIcons.share2, onPressed: () {}),
          ]),
          const SizedBox(height: 30),

          _buildSectionTitle('Ghost & Tertiary Buttons'),
          _buildButtonRow([
            ActionButtonViewModel(
                size: ActionButtonSize.small, style: ActionButtonStyle.ghost, text: 'Cancelar', onPressed: () {}),
            ActionButtonViewModel(
                size: ActionButtonSize.small, style: ActionButtonStyle.tertiary, text: 'Refazer', icon: LucideIcons.rotateCw, onPressed: () {}),
          ]),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
      ),
    );
  }

  Widget _buildButtonRow(List<ActionButtonViewModel> viewModels) {
    return Wrap(
      spacing: 16.0,
      runSpacing: 16.0,
      alignment: WrapAlignment.start,
      children: viewModels
          .map((viewModel) => ActionButton.instantiate(viewModel: viewModel))
          .toList(),
    );
  }
}


import 'package:flutter/material.dart';
import '../../Components/Buttons/ActionButton/action_button.dart';
import '../../Components/Buttons/ActionButton/action_button_view_model.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ActionButtonPage extends StatelessWidget {
  const ActionButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Action Button Demo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Primary Buttons'),
            _buildButtonRow(ActionButtonStyle.primary),
            const SizedBox(height: 20),

            _buildSectionTitle('Secondary Buttons'),
            _buildButtonRow(ActionButtonStyle.secondary),
            const SizedBox(height: 20),

            _buildSectionTitle('Tertiary Buttons'),
            _buildButtonRow(ActionButtonStyle.tertiary),
            const SizedBox(height: 20),

            _buildSectionTitle('Outline Buttons'),
            _buildButtonRow(ActionButtonStyle.outline),
            const SizedBox(height: 20),

            _buildSectionTitle('Ghost Buttons'),
            _buildButtonRow(ActionButtonStyle.ghost),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildButtonRow(ActionButtonStyle style) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Botão sem ícone
        ActionButton.instantiate(
          viewModel: ActionButtonViewModel(
            size: ActionButtonSize.large,
            style: style,
            text: 'Button',
            onPressed: () {},
          ),
        ),
        // Botão com ícone (seta para a esquerda)
        ActionButton.instantiate(
          viewModel: ActionButtonViewModel(
            size: ActionButtonSize.large,
            style: style,
            text: 'Button',
            icon: LucideIcons.arrowLeft,
            onPressed: () {},
          ),
        ),
        // Apenas ícone (seta para cima)
        ActionButton.instantiate(
          viewModel: ActionButtonViewModel(
            size: ActionButtonSize.large,
            style: style,
            text: '',
            icon: LucideIcons.arrowUp,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
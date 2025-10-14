import 'package:flutter/material.dart' hide CardTheme;
import '../../shared/colors.dart';
import 'card_view_model.dart';

class AppCard extends StatelessWidget {
  final AppCardViewModel viewModel;

  const AppCard({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    // Define as cores com base no tema do card
    final bool isDark = viewModel.theme == CardTheme.dark;
    final Color cardColor = isDark ? brandSecondary : neutralLight;
    final Color textColor = isDark ? neutralLight : brandSecondary;
    final Color faintTextColor = isDark ? neutralGrey : brandSecondary.withOpacity(0.7);

    // Corpo do card, que muda de acordo com o ViewModel
    Widget cardContent;

    if (viewModel is InfoCardViewModel) {
      cardContent = _buildInfoCardContent(viewModel as InfoCardViewModel, textColor, faintTextColor);
    } else if (viewModel is FormCardViewModel) {
      cardContent = _buildFormCardContent(viewModel as FormCardViewModel, textColor);
    } else if (viewModel is ContainerCardViewModel) {
      cardContent = _buildContainerCardContent(viewModel as ContainerCardViewModel, textColor);
    } else {
      cardContent = const Center(child: Text('Tipo de Card Inválido'));
    }

    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.3 : 0.08),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: cardContent,
    );
  }

  // Constrói o layout para o Card de Informação (com imagem e detalhes)
  Widget _buildInfoCardContent(InfoCardViewModel vm, Color textColor, Color faintTextColor) {
    return Row(
      children: [
        // Imagem da Arma
        Container(
          width: 120,
          height: 80,
          decoration: BoxDecoration(
            color: vm.theme == CardTheme.dark ? Colors.black.withOpacity(0.2) : neutralGrey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            // Lembre-se de adicionar a imagem nos seus assets!
            child: Image.asset(vm.imagePath, fit: BoxFit.contain),
          ),
        ),
        const SizedBox(width: 16),
        // Detalhes e Título
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(vm.title, style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              // Mapeia os detalhes para widgets de texto
              ...vm.details.entries.map(
                    (entry) => Text(
                  '${entry.key}: ${entry.value}',
                  style: TextStyle(color: faintTextColor, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        // Botões de Ação
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: vm.actions.map((action) => _CardActionButton(action: action, theme: vm.theme)).toList(),
        ),
      ],
    );
  }

  // Constrói o layout para o Card de Formulário
  Widget _buildFormCardContent(FormCardViewModel vm, Color textColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(vm.title, style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        ...vm.fields.map((field) => _buildFormField(field, vm.theme)),
      ],
    );
  }

  // Widget auxiliar para os campos de texto do formulário
  Widget _buildFormField(FormFieldModel field, CardTheme theme) {
    final bool isDark = theme == CardTheme.dark;
    final Color fieldColor = isDark ? Colors.black.withOpacity(0.2) : neutralGrey.withOpacity(0.2);
    final Color textColor = isDark ? neutralLight : brandSecondary;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(field.label, style: TextStyle(color: textColor.withOpacity(0.8), fontSize: 12)),
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: fieldColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(field.value, style: TextStyle(color: textColor, fontSize: 14)),
          ),
        ],
      ),
    );
  }


  // Constrói o layout para o Card Container
  Widget _buildContainerCardContent(ContainerCardViewModel vm, Color textColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(vm.title, style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        vm.child,
      ],
    );
  }
}

/// Widget interno para os botões de ação dos cards.
class _CardActionButton extends StatelessWidget {
  final CardAction action;
  final CardTheme theme;

  const _CardActionButton({required this.action, required this.theme});

  @override
  Widget build(BuildContext context) {
    final bool isDark = theme == CardTheme.dark;
    final Color defaultIconColor = isDark ? neutralGrey : brandSecondary.withOpacity(0.7);
    final Color backgroundColor = isDark ? Colors.black.withOpacity(0.2) : neutralGrey.withOpacity(0.2);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: action.onTap,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Icon(
              action.icon,
              size: 20,
              color: action.iconColor ?? defaultIconColor,
            ),
          ),
        ),
      ),
    );
  }
}

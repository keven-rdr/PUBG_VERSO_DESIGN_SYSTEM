import 'package:flutter/material.dart' hide CardTheme;
import '../../shared/colors.dart';
import '../Buttons/ActionButton/action_button.dart';
import 'card_view_model.dart';

class AppCard extends StatelessWidget {
  final AppCardViewModel viewModel;

  const AppCard({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final bool isDark = viewModel.theme == CardTheme.dark;
    final Color cardColor = isDark ? brandSecondary : neutralLight;
    final Color titleColor = isDark ? neutralLight : brandPrimary;
    final Color primaryTextColor = isDark ? neutralLight : brandSecondary;
    final Color secondaryTextColor = isDark ? neutralGrey : brandSecondary.withOpacity(0.7);

    Widget cardContent;

    if (viewModel is InfoCardViewModel) {
      cardContent = _buildInfoCardContent(viewModel as InfoCardViewModel, titleColor, primaryTextColor, secondaryTextColor);
    } else if (viewModel is FormCardViewModel) {
      cardContent = _buildFormCardContent(viewModel as FormCardViewModel, titleColor, primaryTextColor);
    } else if (viewModel is ContainerCardViewModel) {
      cardContent = _buildContainerCardContent(viewModel as ContainerCardViewModel, titleColor);
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

  Widget _buildInfoCardContent(InfoCardViewModel vm, Color titleColor, Color textColor, Color faintTextColor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 120,
          height: 80,
          decoration: BoxDecoration(
            // CORREÇÃO: Usando a cor 'neutralGray200' que existe no seu Design System
            color: vm.theme == CardTheme.dark ? Colors.black.withOpacity(0.2) : neutralGray200,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(vm.imagePath, fit: BoxFit.contain),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(vm.title, style: TextStyle(color: titleColor, fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ...vm.details.entries.map(
                    (entry) => Text(
                  '${entry.key}: ${entry.value}',
                  style: TextStyle(color: faintTextColor, fontSize: 12, height: 1.5),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Column(
          children: vm.actions.map((action) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: ActionButton.instantiate(viewModel: action.viewModel),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildFormCardContent(FormCardViewModel vm, Color titleColor, Color textColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(vm.title, style: TextStyle(color: titleColor, fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        ...vm.fields.map((field) => _buildFormField(field, vm.theme)),
      ],
    );
  }

  Widget _buildFormField(FormFieldModel field, CardTheme theme) {
    final bool isDark = theme == CardTheme.dark;
    final Color fieldBackgroundColor = isDark ? Colors.black.withOpacity(0.2) : Colors.transparent;
    final Color textColor = isDark ? neutralLight : brandSecondary;
    final Color labelColor = isDark ? neutralGrey : brandSecondary.withOpacity(0.7);
    final Border? border = isDark ? null : Border.all(color: neutralGrey.withOpacity(0.5));

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(field.label, style: TextStyle(color: labelColor, fontSize: 12)),
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: fieldBackgroundColor,
              borderRadius: BorderRadius.circular(12),
              border: border,
            ),
            child: Text(field.value, style: TextStyle(color: textColor, fontSize: 14)),
          ),
        ],
      ),
    );
  }

  Widget _buildContainerCardContent(ContainerCardViewModel vm, Color titleColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(vm.title, style: TextStyle(color: titleColor, fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        vm.child,
      ],
    );
  }
}


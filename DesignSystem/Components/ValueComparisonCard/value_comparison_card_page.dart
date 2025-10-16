import 'package:asdasd/DesignSystem/Components/ValueComparisonCard/value_comparison_card_view_model.dart';
import 'package:flutter/material.dart';
import '../../shared/colors.dart';

class ValueComparisonCard extends StatelessWidget {
  final ValueComparisonViewModel viewModel;

  const ValueComparisonCard({super.key, required this.viewModel});

  Widget _buildValueColumn(ValueEntry entry, Color labelColor) {
    return Column(
      children: [
        Text(
          entry.value,
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: entry.color,
          ),
        ),
        Text(
          entry.label,
          style: TextStyle(
            fontSize: 14,
            color: labelColor,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = viewModel.theme == ValueCardTheme.dark;
    final Color cardColor = isDark ? brandSecondary.withOpacity(0.8) : neutralLight;
    final Color textColor = isDark ? neutralLight.withOpacity(0.9) : brandSecondary.withOpacity(0.8);
    final Color labelColor = isDark ? neutralLight.withOpacity(0.8) : brandSecondary.withOpacity(0.7);
    final Color separatorColor = brandPrimary;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.2 : 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildValueColumn(viewModel.entry1, labelColor),
              Container(
                height: 60,
                width: 2,
                color: separatorColor,
              ),
              _buildValueColumn(viewModel.entry2, labelColor),
            ],
          ),
          const SizedBox(height: 24),
          ...viewModel.details.map(
                (detail) => Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                '• $detail',
                style: TextStyle(
                  color: textColor,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

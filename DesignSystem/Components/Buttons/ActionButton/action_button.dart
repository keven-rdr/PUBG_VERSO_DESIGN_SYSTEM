import 'package:flutter/material.dart';
import 'action_button_view_model.dart';
import '../../../shared/colors.dart';
import '../../../shared/styles.dart';

class ActionButton extends StatelessWidget {
  final ActionButtonViewModel viewModel;

  const ActionButton._({super.key, required this.viewModel});

  static Widget instantiate({required ActionButtonViewModel viewModel}) {
    return ActionButton._(viewModel: viewModel);
  }

  @override
  Widget build(BuildContext context) {
    double horizontalPadding = 32;
    double verticalPadding = 12;
    double iconSize = 24;
    TextStyle buttonTextStyle = button3Semibold;
    Color backgroundColor = lightPrimaryBrandColor;
    Color foregroundColor = Colors.white;

    switch (viewModel.size) {
      case ActionButtonSize.large:
        buttonTextStyle = button1Bold;
        iconSize = 24;
        verticalPadding = 16;
        horizontalPadding = 32;
        break;
      case ActionButtonSize.medium:
        buttonTextStyle = button2Semibold;
        iconSize = 24;
        verticalPadding = 12;
        horizontalPadding = 24;
        break;
      case ActionButtonSize.small:
        buttonTextStyle = button3Semibold;
        iconSize = 16;
        verticalPadding = 8;
        horizontalPadding = 16;
        break;
    }

    switch (viewModel.style) {
      case ActionButtonStyle.primary:
        backgroundColor = primaryButtonBackground;
        foregroundColor = primaryButtonForeground;
        break;
      case ActionButtonStyle.secondary:
        backgroundColor = secondaryButtonBackground;
        foregroundColor = secondaryButtonForeground;
        break;
      case ActionButtonStyle.tertiary:
        backgroundColor = Colors.transparent;
        foregroundColor = Colors.grey[700]!;
        break;
      case ActionButtonStyle.outline:
        backgroundColor = Colors.transparent;
        foregroundColor = lightPrimaryBrandColor;
        break;
      case ActionButtonStyle.ghost:
        backgroundColor = Colors.transparent;
        foregroundColor = Colors.grey[700]!;
        break;
    }

    if (viewModel.style == ActionButtonStyle.outline) {
      return OutlinedButton(
        onPressed: viewModel.onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          side: BorderSide(color: lightPrimaryBrandColor, width: 1.0), // Cor da borda
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
          textStyle: buttonTextStyle,
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding,
            horizontal: horizontalPadding,
          ),
          elevation: 0,
        ),
        child: _buildButtonChild(iconSize, buttonTextStyle),
      );
    } else if (viewModel.style == ActionButtonStyle.ghost) {
      return TextButton(
        onPressed: viewModel.onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
          textStyle: buttonTextStyle,
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding,
            horizontal: horizontalPadding,
          ),
        ),
        child: _buildButtonChild(iconSize, buttonTextStyle),
      );
    } else {
      return ElevatedButton(
        onPressed: viewModel.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
          textStyle: buttonTextStyle,
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding,
            horizontal: horizontalPadding,
          ),
          elevation: 0,
        ),
        child: _buildButtonChild(iconSize, buttonTextStyle),
      );
    }
  }

  Widget _buildButtonChild(double iconSize, TextStyle textStyle) {
    if (viewModel.icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            viewModel.icon,
            size: iconSize,
          ),
          const SizedBox(width: 8),
          Text(
            viewModel.text,
            style: textStyle,
          ),
        ],
      );
    } else {
      return Text(
        viewModel.text,
        style: textStyle,
      );
    }
  }
}
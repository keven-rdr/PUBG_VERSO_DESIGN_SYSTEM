import 'package:flutter/material.dart';
import '../../Shared/colors.dart';
import '../../Shared/styles.dart';
import 'action_button_view_model.dart';

abstract class ActionButtonDelegate {
  void onClick(ActionButton sender, ActionButtonViewModel viewModel);
}

class ActionButton extends StatelessWidget {
  final ActionButtonViewModel viewModel;
  final ActionButtonDelegate? delegate;

  const ActionButton({
    super.key,
    required this.viewModel,
    this.delegate,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor;
    switch (viewModel.style) {
      case ActionButtonStyle.primary:
        backgroundColor = primaryBaseColor;
        break;
      case ActionButtonStyle.secondary:
        backgroundColor = secondaryBaseColor;
        break;
      case ActionButtonStyle.tertiary:
        backgroundColor = tertiaryBaseColor;
        break;
    }

    final double verticalPadding;
    final double horizontalPadding;
    final double fontSize;
    final double iconSize;

    switch (viewModel.size) {
      case ActionButtonSize.small:
        verticalPadding = 8;
        horizontalPadding = 16;
        fontSize = 14;
        iconSize = 16;
        break;
      case ActionButtonSize.medium:
        verticalPadding = 12;
        horizontalPadding = 24;
        fontSize = 16;
        iconSize = 20;
        break;
      case ActionButtonSize.large:
        verticalPadding = 16;
        horizontalPadding = 32;
        fontSize = 18;
        iconSize = 24;
        break;
    }

    List<Widget> children = [];
    final iconWidget = viewModel.icon != null
        ? Icon(viewModel.icon, color: Colors.black, size: iconSize)
        : const SizedBox.shrink();
    final textWidget = Text(
      viewModel.text,
      style: regular.copyWith(fontSize: fontSize, color: Colors.white),
    );

    if (viewModel.icon != null) {
      if (viewModel.iconPosition == IconPosition.left) {
        children.add(iconWidget);
        children.add(const SizedBox(width: 8));
        children.add(textWidget);
      } else {
        children.add(textWidget);
        children.add(const SizedBox(width: 8));
        children.add(iconWidget);
      }
    } else {
      children.add(textWidget);
    }

    return ElevatedButton(
      onPressed: () {
        delegate?.onClick(this, viewModel);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
        shape: const StadiumBorder(),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}
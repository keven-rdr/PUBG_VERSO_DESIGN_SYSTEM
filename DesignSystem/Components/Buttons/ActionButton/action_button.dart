import 'package:flutter/material.dart';

import '../../../shared/colors.dart';
import '../../../shared/styles.dart';
import 'action_button_view_model.dart';

class ActionButton extends StatelessWidget {
  final ActionButtonViewModel viewModel;

  const ActionButton._({required this.viewModel});

  static Widget instantiate({required ActionButtonViewModel viewModel}) {
    return ActionButton._(viewModel: viewModel);
  }

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = viewModel.onPressed != null;
    final bool isIconOnly = viewModel.text.isEmpty && viewModel.icon != null;

    double verticalPadding;
    double horizontalPadding;
    double iconSize;
    TextStyle textStyle;

    switch (viewModel.size) {
      case ActionButtonSize.large:
        verticalPadding = 16;
        horizontalPadding = 32;
        iconSize = 24;
        textStyle = button1Bold;
        break;
      case ActionButtonSize.medium:
        verticalPadding = 12;
        horizontalPadding = 24;
        iconSize = 24;
        textStyle = button2Semibold;
        break;
      case ActionButtonSize.small:
        verticalPadding = 8;
        horizontalPadding = 16;
        iconSize = 16;
        textStyle = button3Semibold;
        break;
    }

    final double iconOnlyPadding = (verticalPadding + horizontalPadding) / 3;

    Color backgroundColor;
    Color foregroundColor;
    Color disabledBackgroundColor;
    Color disabledForegroundColor;
    BorderSide? border;

    switch (viewModel.style) {
      case ActionButtonStyle.primary:
        backgroundColor = brandPrimary;
        foregroundColor = neutralDark;
        break;
      case ActionButtonStyle.secondary:
        backgroundColor = brandSecondary;
        foregroundColor = neutralLight;
        break;
      case ActionButtonStyle.destructive:
        backgroundColor = destructive;
        foregroundColor = neutralLight;
        break;
      case ActionButtonStyle.tertiary:
        backgroundColor = neutralGrey.withOpacity(0.2);
        foregroundColor = neutralDark;
        break;
      case ActionButtonStyle.outline:
        backgroundColor = Colors.transparent;
        foregroundColor = brandPrimary;
        border = const BorderSide(color: brandPrimary, width: 1.5);
        break;
      case ActionButtonStyle.ghost:
        backgroundColor = Colors.transparent;
        foregroundColor = brandSecondary;
        break;
    }

    disabledBackgroundColor = neutralGrey.withOpacity(0.5);
    disabledForegroundColor = neutralDark.withOpacity(0.4);

    Widget buildButtonChild() {
      if (isIconOnly) {
        return Icon(viewModel.icon, size: iconSize);
      }
      if (viewModel.icon != null) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(viewModel.icon, size: iconSize),
            const SizedBox(width: 8),
            Text(viewModel.text),
          ],
        );
      }
      return Text(viewModel.text);
    }

    final buttonStyle = ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.disabled)) {
          return disabledBackgroundColor;
        }
        return backgroundColor;
      }),
      foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.disabled)) {
          return disabledForegroundColor;
        }
        return foregroundColor;
      }),
      textStyle: MaterialStateProperty.all(textStyle),
      padding: MaterialStateProperty.all(
        isIconOnly
            ? EdgeInsets.all(iconOnlyPadding)
            : EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
      ),
      shape: MaterialStateProperty.all(
        isIconOnly
            ? const CircleBorder()
            : const StadiumBorder(),
      ),
      side: MaterialStateProperty.all(border),
      overlayColor: MaterialStateProperty.all(foregroundColor.withOpacity(0.1)),
    );

    if (viewModel.style == ActionButtonStyle.outline) {
      return OutlinedButton(
        onPressed: viewModel.onPressed,
        style: buttonStyle,
        child: buildButtonChild(),
      );
    }

    if (viewModel.style == ActionButtonStyle.ghost || viewModel.style == ActionButtonStyle.tertiary) {
      return TextButton(
        onPressed: viewModel.onPressed,
        style: buttonStyle,
        child: buildButtonChild(),
      );
    }

    return ElevatedButton(
      onPressed: viewModel.onPressed,
      style: buttonStyle,
      child: buildButtonChild(),
    );
  }
}

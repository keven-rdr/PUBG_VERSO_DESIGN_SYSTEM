import 'package:flutter/material.dart';

enum IconPosition {
  left,
  right
}

enum ActionButtonSize {
  small,
  medium,
  large
}

enum ActionButtonStyle {
  primary,
  secondary,
  tertiary
}

class ActionButtonViewModel {
  final ActionButtonStyle style;
  final ActionButtonSize size;
  final String text;
  final IconData? icon;
  final IconPosition iconPosition;

  ActionButtonViewModel({
    required this.size,
    required this.style,
    required this.text,
    this.icon,
    this.iconPosition = IconPosition.left,
  });
}
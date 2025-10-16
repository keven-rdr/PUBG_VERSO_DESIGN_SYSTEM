import 'package:flutter/material.dart';

enum ActionButtonSize { small, medium, large }

enum ActionButtonStyle {
  primary,
  secondary,
  destructive,
  outline,
  ghost,
  tertiary,
  trash,
  primaryDarkIcon,
}

class ActionButtonViewModel {
  final ActionButtonSize size;
  final ActionButtonStyle style;
  final String text;
  final IconData? icon;
  final VoidCallback? onPressed;

  ActionButtonViewModel({
    required this.size,
    required this.style,
    this.text = '',
    this.icon,
    this.onPressed,
  });
}


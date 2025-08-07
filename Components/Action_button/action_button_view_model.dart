import 'package:flutter/material.dart';

enum ActionButtonSize{
  small,
  medium,
  large
}

enum ActionButtonStyle {
  primary,
  secundary,
  tertiary
}

class ActionButtonViewModel {
  final ActionButtonStyle style;
  final ActionButtonSize size;
  final String text;
  final IconData? icon;
  final Function()  onPressed;

  ActionButtonViewModel ({
    required this.size,
    required this.style,
    required this.text,
    required this.onPressed,
    this.icon});

}
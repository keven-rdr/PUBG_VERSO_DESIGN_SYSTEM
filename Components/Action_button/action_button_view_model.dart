import 'package:flutter/material.dart';

enum ActionButtonSize{
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


  ActionButtonViewModel ({
    required this.size,
    required this.style,
    required this.text,
    this.icon});

}
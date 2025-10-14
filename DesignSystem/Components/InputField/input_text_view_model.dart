import 'package:flutter/material.dart';

enum InputFieldTheme { light, dark }

class InputTextViewModel {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final InputFieldTheme theme;
  final bool isPassword;
  final bool isEnabled;
  final String? Function(String?)? validator;

  InputTextViewModel({
    required this.controller,
    required this.label,
    this.hintText = '',
    this.theme = InputFieldTheme.dark,
    this.isPassword = false,
    this.isEnabled = true,
    this.validator,
  });
}

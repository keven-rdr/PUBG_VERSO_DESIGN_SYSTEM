import 'package:flutter/material.dart';

class InputTextViewModel {
  final TextEditingController controller;
  final String placeholder;
  final bool password;
  final Widget? customSuffixIcon;
  final bool isEnabled;
  final bool clearable;
  final String? Function(String?)? validator;

  InputTextViewModel({
    required this.controller,
    this.placeholder = '',
    this.password = false,
    this.customSuffixIcon,
    this.isEnabled = true,
    this.clearable = false,
    this.validator,
  });
}
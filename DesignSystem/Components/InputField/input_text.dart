import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../shared/colors.dart';
import 'input_text_view_model.dart';

class StyledInputField extends StatefulWidget {
  final InputTextViewModel viewModel;

  const StyledInputField._({super.key, required this.viewModel});

  static Widget instantiate({required InputTextViewModel viewModel}) {
    return StyledInputField._(viewModel: viewModel);
  }

  @override
  StyledInputFieldState createState() => StyledInputFieldState();
}

class StyledInputFieldState extends State<StyledInputField> {
  late bool _obscureText;
  String? _errorMsg;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.viewModel.isPassword;
    widget.viewModel.controller.addListener(_validate);
  }

  void _validate() {
    final error = widget.viewModel.validator?.call(widget.viewModel.controller.text);
    if (mounted && error != _errorMsg) {
      setState(() {
        _errorMsg = error;
      });
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    widget.viewModel.controller.removeListener(_validate);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = widget.viewModel.theme == InputFieldTheme.dark;
    final backgroundColor = isDark ? brandSecondary : neutralLight;
    final textColor = isDark ? neutralLight : brandSecondary;
    final hintColor = isDark ? neutralGrey.withOpacity(0.6) : neutralGrey;
    final labelColor = brandPrimary;
    final iconColor = brandPrimary;

    const inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50.0)),
      borderSide: BorderSide.none,
    );

    final errorBorder = inputBorder.copyWith(
      borderSide: const BorderSide(color: destructive, width: 2),
    );

    final textFormField = TextFormField(
      controller: widget.viewModel.controller,
      obscureText: _obscureText,
      enabled: widget.viewModel.isEnabled,
      style: TextStyle(color: textColor, fontSize: 16),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        filled: true,
        fillColor: backgroundColor.withOpacity(widget.viewModel.isEnabled ? 1.0 : 0.5),
        hintText: widget.viewModel.hintText,
        hintStyle: TextStyle(color: hintColor),
        prefixIcon: widget.viewModel.prefixIcon != null
            ? Icon(widget.viewModel.prefixIcon, color: iconColor)
            : null,
        suffixIcon: widget.viewModel.isPassword
            ? IconButton(
          icon: Icon(_obscureText ? LucideIcons.eyeOff : LucideIcons.eye, color: hintColor),
          onPressed: _togglePasswordVisibility,
        )
            : null,
        border: inputBorder,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        disabledBorder: inputBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder,
        errorText: _errorMsg,
        errorStyle: const TextStyle(height: 0, fontSize: 0),
      ),
    );

    // Se não houver label, retorna apenas o campo de texto.
    if (widget.viewModel.label == null || widget.viewModel.label!.isEmpty) {
      return textFormField;
    }

    // Se houver label, retorna o campo com o texto acima.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, bottom: 8.0),
          child: Text(
            widget.viewModel.label!,
            style: TextStyle(
              color: labelColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        textFormField,
      ],
    );
  }
}

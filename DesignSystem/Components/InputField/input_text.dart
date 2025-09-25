import 'package:flutter/material.dart';
import '../../shared/colors.dart';
import 'input_text_view_model.dart';


class StyledInputField extends StatefulWidget {
  final InputTextViewModel viewModel;

  const StyledInputField._({Key? key, required this.viewModel}) : super(key: key);

  @override
  StyledInputFieldState createState() => StyledInputFieldState();

  static Widget instantiate({required InputTextViewModel viewModel}) {
    return StyledInputField._(viewModel: viewModel);
  }
}

class StyledInputFieldState extends State<StyledInputField> {
  late bool _obscureText;
  String? _errorMsg;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.viewModel.password;
    _hasText = widget.viewModel.controller.text.isNotEmpty;
    widget.viewModel.controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    final errorText = widget.viewModel.validator?.call(widget.viewModel.controller.text);

    final newHasText = widget.viewModel.controller.text.isNotEmpty;

    if (mounted && (errorText != _errorMsg || newHasText != _hasText)) {
      setState(() {
        _errorMsg = errorText;
        _hasText = newHasText;
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
    widget.viewModel.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  Widget? _buildSuffixIcon() {
    if (_errorMsg != null) {
      return const Icon(Icons.error_outline, color: errorColor);
    }
    if (widget.viewModel.password) {
      return IconButton(
        icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility, color: neutralGray700),
        onPressed: _togglePasswordVisibility,
      );
    }
    if (widget.viewModel.clearable && _hasText) {
      return IconButton(
        icon: const Icon(Icons.cancel, color: neutralGray700),
        onPressed: () => widget.viewModel.controller.clear(),
      );
    }
    if (widget.viewModel.customSuffixIcon != null) {
      return widget.viewModel.customSuffixIcon;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final baseBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(color: neutralGray200, width: 1.5),
    );

    final errorBorder = baseBorder.copyWith(
      borderSide: const BorderSide(color: errorColor, width: 1.5),
    );

    final focusedBorder = baseBorder.copyWith(
      borderSide: const BorderSide(color: brandBlue, width: 1.5),
    );

    return TextFormField(
      controller: widget.viewModel.controller,
      obscureText: _obscureText,
      enabled: widget.viewModel.isEnabled,
      style: const TextStyle(color: primaryTextColorLight, fontSize: 16),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        filled: true,
        fillColor: widget.viewModel.isEnabled ? neutralWhite : neutralGray200,
        hintText: widget.viewModel.placeholder,
        hintStyle: const TextStyle(color: secondaryTextColorLight, fontSize: 16),
        suffixIcon: _buildSuffixIcon(),

        border: baseBorder,
        enabledBorder: baseBorder,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder,
        disabledBorder: baseBorder.copyWith(
            borderSide: BorderSide(color: neutralGray200.withOpacity(0.7))
        ),

        errorText: null,
        errorStyle: const TextStyle(height: 0),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../Components/InputField/input_text.dart';
import '../../Components/InputField/input_text_view_model.dart';
import '../../shared/colors.dart';

class InputFieldPage extends StatefulWidget {
  const InputFieldPage({super.key});

  @override
  State<InputFieldPage> createState() => _InputFieldPageState();
}

class _InputFieldPageState extends State<InputFieldPage> {
  InputFieldTheme _currentTheme = InputFieldTheme.dark;

  void _toggleTheme() {
    setState(() {
      _currentTheme = _currentTheme == InputFieldTheme.dark
          ? InputFieldTheme.light
          : InputFieldTheme.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = _currentTheme == InputFieldTheme.dark;
    final pageBackgroundColor = isDark ? brandSecondary.withOpacity(0.9) : const Color(0xFFF0F0F0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Field Demo'),
        actions: [
          IconButton(
            icon: Icon(isDark ? LucideIcons.sun : LucideIcons.moon),
            onPressed: _toggleTheme,
            tooltip: 'Mudar Tema',
          )
        ],
      ),
      backgroundColor: pageBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StyledInputField.instantiate(
              viewModel: InputTextViewModel(
                theme: _currentTheme,
                controller: TextEditingController(),
                label: 'Login',
                hintText: '@username',
              ),
            ),
            const SizedBox(height: 24),
            StyledInputField.instantiate(
              viewModel: InputTextViewModel(
                theme: _currentTheme,
                controller: TextEditingController(),
                label: 'Senha',
                hintText: 'Sua senha',
                isPassword: true,
              ),
            ),
            const SizedBox(height: 24),
            StyledInputField.instantiate(
              viewModel: InputTextViewModel(
                theme: _currentTheme,
                controller: TextEditingController(),
                label: 'Campo com Erro',
                hintText: 'Digite algo inválido',
                validator: (value) {
                  if (value == null || value.length < 5) {
                    return 'O valor é muito curto';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 24),
            StyledInputField.instantiate(
              viewModel: InputTextViewModel(
                theme: _currentTheme,
                controller: TextEditingController(text: "Não editável"),
                label: 'Desabilitado',
                isEnabled: false,
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'Campo de Busca',
              style: TextStyle(
                color: brandPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            StyledInputField.instantiate(
              viewModel: InputTextViewModel(
                theme: _currentTheme,
                controller: TextEditingController(),
                hintText: 'Buscar pelo nome da arma',
                prefixIcon: LucideIcons.search,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../../Components/InputField/input_text.dart';
import '../../Components/InputField/input_text_view_model.dart';
import '../../shared/colors.dart';

class InputFieldPage extends StatelessWidget {
  InputFieldPage({super.key});

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryTextColorLight),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Field Demo'),
        backgroundColor: screenBackgroundColorLight,
      ),
      backgroundColor: screenBackgroundColorLight,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Seção de Estados Normais ---
            _buildSectionTitle('Enabled States'),
            StyledInputField.instantiate(
              viewModel: InputTextViewModel(
                controller: TextEditingController(),
                placeholder: 'Placeholder',
              ),
            ),
            const SizedBox(height: 16),
            StyledInputField.instantiate(
              viewModel: InputTextViewModel(
                controller: TextEditingController(text: 'Value'),
                placeholder: 'Label',
                clearable: true, // Adicionado para mostrar o 'x'
              ),
            ),
            const SizedBox(height: 16),
            StyledInputField.instantiate(
              viewModel: InputTextViewModel(
                controller: TextEditingController(),
                placeholder: 'Input with custom icon',
                customSuffixIcon: const Icon(Icons.calendar_today, color: neutralGray700),
              ),
            ),

            // --- Seção de Senha ---
            _buildSectionTitle('Password Field'),
            StyledInputField.instantiate(
              viewModel: InputTextViewModel(
                controller: TextEditingController(text: 'password123'),
                placeholder: 'Password',
                password: true,
              ),
            ),

            // --- Seção de Erro ---
            _buildSectionTitle('Error State'),
            StyledInputField.instantiate(
              viewModel: InputTextViewModel(
                controller: TextEditingController(text: 'Invalid value!'),
                placeholder: 'Label',
                validator: (value) => 'Este campo tem um erro.',
              ),
            ),

            _buildSectionTitle('Disabled States'),
            StyledInputField.instantiate(
              viewModel: InputTextViewModel(
                controller: TextEditingController(),
                placeholder: 'Disabled',
                isEnabled: false,
              ),
            ),
            const SizedBox(height: 16),
            StyledInputField.instantiate(
              viewModel: InputTextViewModel(
                controller: TextEditingController(text: 'Disabled with value'),
                placeholder: 'Label',
                isEnabled: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../../Components/ComparasionPlatform/compararion_plarform_page.dart';
import '../../Components/ComparasionPlatform/comparasion_platform_view_model.dart';


class PlatformPage extends StatelessWidget {
  const PlatformPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: const Text('Platform Component'),
      ),
      body: Center(
        child: ComparisonPlatform(
          viewModel: ComparisonPlatformViewModel(
            imagePath: 'assets/images/ace32.png',
            size: 250,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../shared/colors.dart';
import 'comparasion_platform_view_model.dart';

class ComparisonPlatform extends StatelessWidget {
  final ComparisonPlatformViewModel viewModel;

  const ComparisonPlatform({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: viewModel.size,
      height: viewModel.size,
      decoration: BoxDecoration(
        color: brandSecondary,
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            Colors.transparent,
            brandPrimary.withOpacity(0.8),
          ],
          stops: const [0.0, 0.6, 1.0],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Image.asset(
          viewModel.imagePath,
          width: viewModel.size * 0.8,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

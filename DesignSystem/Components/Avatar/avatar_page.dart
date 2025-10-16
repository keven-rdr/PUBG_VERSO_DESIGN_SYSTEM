import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../shared/colors.dart';
import 'avatar_view_model.dart';

class UserAvatar extends StatelessWidget {
  final UserAvatarViewModel viewModel;

  const UserAvatar({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: viewModel.radius,
      backgroundColor: neutralGrey.withOpacity(0.3),
      backgroundImage: viewModel.imagePath != null
          ? AssetImage(viewModel.imagePath!)
          : null,
      child: viewModel.imagePath == null
          ? Icon(
        LucideIcons.user,
        size: viewModel.radius,
        color: brandSecondary.withOpacity(0.8),
      )
          : null,
    );
  }
}

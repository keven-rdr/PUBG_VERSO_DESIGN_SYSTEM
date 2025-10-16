import 'package:flutter/material.dart';
import '../../Components/Avatar/avatar_page.dart';
import '../../Components/Avatar/avatar_view_model.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar Component'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            UserAvatar(
              viewModel: UserAvatarViewModel(
                imagePath: 'assets/img/avatar/user_photo.jpg',
                radius: 50,
              ),
            ),
            UserAvatar(
              viewModel: UserAvatarViewModel(
                radius: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

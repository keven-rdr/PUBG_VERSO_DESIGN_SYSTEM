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
            // Avatar com Imagem
            UserAvatar(
              viewModel: UserAvatarViewModel(
                // Certifique-se de que esta imagem existe nos seus assets
                imagePath: 'assets/img/avatar/user_photo.jpg',
                radius: 50,
              ),
            ),
            // Avatar Vazio
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

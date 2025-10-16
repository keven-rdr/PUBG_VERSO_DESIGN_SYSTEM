import 'package:flutter/material.dart';

class UserAvatarViewModel {
  final String? imagePath;
  final double radius;

  UserAvatarViewModel({
    this.imagePath,
    this.radius = 40.0,
  });
}

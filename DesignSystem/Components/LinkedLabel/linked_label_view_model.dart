import 'package:flutter/material.dart';

enum LinkedLabelTheme { light, dark }

class LinkedLabelViewModel {
  final String fullText;
  final String linkedText;
  final VoidCallback? onLinkTap;
  final LinkedLabelTheme theme;
  final TextAlign textAlign;

  LinkedLabelViewModel({
    required this.fullText,
    required this.linkedText,
    this.onLinkTap,
    this.theme = LinkedLabelTheme.dark,
    this.textAlign = TextAlign.start,
  });
}

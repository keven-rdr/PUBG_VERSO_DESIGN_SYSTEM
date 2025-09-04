import 'package:flutter/material.dart';

class CardItem {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  CardItem({
    required this.icon,
    required this.label,
    this.onTap,
  });
}

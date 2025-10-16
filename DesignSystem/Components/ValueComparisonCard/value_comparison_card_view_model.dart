import 'package:flutter/material.dart';

enum ValueCardTheme { light, dark }

class ValueEntry {
  final String value;
  final String label;
  final Color color;

  ValueEntry({
    required this.value,
    required this.label,
    required this.color,
  });
}

class ValueComparisonViewModel {
  final ValueEntry entry1;
  final ValueEntry entry2;
  final List<String> details;
  final ValueCardTheme theme;

  ValueComparisonViewModel({
    required this.entry1,
    required this.entry2,
    required this.details,
    this.theme = ValueCardTheme.dark,
  });
}


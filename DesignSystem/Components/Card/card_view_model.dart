import 'package:flutter/material.dart';

import '../Buttons/ActionButton/action_button_view_model.dart';

enum CardTheme { light, dark }

class CardAction {
  final ActionButtonViewModel viewModel;
  CardAction({ required this.viewModel });
}

class FormFieldModel {
  final String label;
  final String value;

  FormFieldModel({required this.label, required this.value});
}


abstract class AppCardViewModel {
  final CardTheme theme;
  AppCardViewModel({this.theme = CardTheme.dark});
}

class InfoCardViewModel extends AppCardViewModel {
  final String imagePath;
  final String title;
  final Map<String, String> details;
  final List<CardAction> actions;

  InfoCardViewModel({
    required this.imagePath,
    required this.title,
    required this.details,
    required this.actions,
    super.theme,
  });
}

class FormCardViewModel extends AppCardViewModel {
  final String title;
  final List<FormFieldModel> fields;

  FormCardViewModel({
    required this.title,
    required this.fields,
    super.theme,
  });
}


class ContainerCardViewModel extends AppCardViewModel {
  final String title;
  final Widget child;

  ContainerCardViewModel({
    required this.title,
    required this.child,
    super.theme,
  });
}


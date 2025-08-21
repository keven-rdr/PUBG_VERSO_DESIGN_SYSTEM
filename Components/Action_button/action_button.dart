import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Shared/colors.dart';
import '../../Shared/styles.dart';
import 'action_button_view_model.dart';

abstract class ActionButtonDelegate{
  //alterar a assinatura do delegate para identificar qual ação foi disparada
  void onClick(ActionButton sender, ActionButtonViewModel viewModel);
}

class ActionButton extends StatelessWidget {

  //view model vai determinar o visual do botão
  final ActionButtonViewModel viewModel;
  Color backgroundColor;
  int size;
  ActionButtonDelegate? delegate;

  ActionButton._({
    super.key,
    required this.viewModel,
    this.backgroundColor = primaryBaseColor,
    this.size = 16
  });

  static ActionButton instantiate({required ActionButtonViewModel viewModel, backgroundColor = primaryBaseColor}) {
    return ActionButton._(viewModel: viewModel);
  }

  void setStyle(ActionButtonStyle style) {
    switch(viewModel.style) {
      case ActionButtonStyle.primary:
        backgroundColor = primaryBaseColor;
        break;
      case ActionButtonStyle.secondary:
        backgroundColor = secondaryBaseColor;
        break;
      case ActionButtonStyle.tertiary:
        backgroundColor = tertiaryBaseColor;
        break;
    }
  }

  void setSize(ActionButtonSize size) {
    switch(viewModel.size) {
      case ActionButtonSize.small:
        this.size = 16;
        break;
      case ActionButtonSize.medium:
        this.size = 24;
        break;
      case ActionButtonSize.large:
        this.size = 32;
        break;
    }
  }

  Widget createElevatedButton() {
    double verticalPadding = 12;
    double horizontalPadding = 32;
    //pasei o this, falando que eu mesmo to me chamando
    return ElevatedButton(onPressed: () { delegate?.onClick(this, viewModel); },
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            textStyle: regular,
            padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: horizontalPadding)),
        child: Text(viewModel.text));
  }

  @override
  Widget build(BuildContext context) {
    setStyle(viewModel.style);
    setSize(viewModel.size);
    return createElevatedButton();
  }
}
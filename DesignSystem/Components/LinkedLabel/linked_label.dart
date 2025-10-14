import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import 'linked_label_view_model.dart';

class LinkedLabel extends StatelessWidget {
  final LinkedLabelViewModel viewModel;

  const LinkedLabel._({super.key, required this.viewModel});

  static Widget instantiate({required LinkedLabelViewModel viewModel}) {
    return LinkedLabel._(viewModel: viewModel);
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = viewModel.theme == LinkedLabelTheme.dark;
    final Color textColor = isDark ? neutralGrey : brandSecondary.withOpacity(0.8);
    const Color linkColor = brandPrimary;

    final int startIndex = viewModel.fullText.toLowerCase().indexOf(viewModel.linkedText.toLowerCase());

    if (startIndex == -1) {
      return Text(
        viewModel.fullText,
        textAlign: viewModel.textAlign,
        style: bodyText2.copyWith(color: textColor),
      );
    }

    final int endIndex = startIndex + viewModel.linkedText.length;

    return RichText(
      textAlign: viewModel.textAlign,
      text: TextSpan(
        style: bodyText2.copyWith(color: textColor),
        children: [
          TextSpan(text: viewModel.fullText.substring(0, startIndex)),

          TextSpan(
            text: viewModel.fullText.substring(startIndex, endIndex),
            style: bodyText1.copyWith(
              color: linkColor,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()..onTap = viewModel.onLinkTap,
          ),

          TextSpan(text: viewModel.fullText.substring(endIndex)),
        ],
      ),
    );
  }
}

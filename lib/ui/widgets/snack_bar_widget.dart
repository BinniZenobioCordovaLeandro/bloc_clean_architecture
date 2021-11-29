import 'package:flutter/material.dart';

class SnackBarHelper {
  final BuildContext? context;
  final String? title;
  final String? buttonText;
  final Function? onPressed;

  SnackBarHelper({
    required this.context,
    this.title,
    this.buttonText,
    this.onPressed,
  }) {
    ScaffoldMessenger.of(context!).showSnackBar(
      SnackBar(
        content: Text('$title'),
        action: (buttonText != null)
            ? SnackBarAction(
                label: buttonText!,
                onPressed: () {
                  if (onPressed != null) onPressed!();
                },
              )
            : null,
      ),
    );
  }
}

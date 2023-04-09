import 'package:flutter/material.dart';
import 'package:whoami/utils/custom_Colors.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color textColor;

  const CustomTextButton(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      this.textColor = CustomColors.textButtonColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(color: textColor),
          ),
        ));
  }
}

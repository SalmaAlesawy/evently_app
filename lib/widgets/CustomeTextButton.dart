import 'package:flutter/material.dart';

import '../core/theme/ColorPalette.dart';

class Custometextbutton extends StatelessWidget {
  final String textButton;
  final void Function() onpressed;
  const Custometextbutton({super.key, required this.textButton, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor:
        const WidgetStatePropertyAll(Colors.transparent),
        shadowColor:
        const WidgetStatePropertyAll(Colors.transparent),
        foregroundColor:
        WidgetStatePropertyAll(ColorPalette.lightMainColor),
        alignment: Alignment.centerRight,
      ),
      onPressed: onpressed,
      child: Text(
        style: TextStyle(
            decoration: TextDecoration.underline,
            decorationThickness: 2,
            decorationColor: ColorPalette.lightMainColor),
        textButton,
      ),
    );
  }
}

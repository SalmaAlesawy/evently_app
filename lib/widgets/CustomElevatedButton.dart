import 'package:eventapp/core/theme/ColorPalette.dart';
import 'package:flutter/material.dart';

class Customelevatedbutton extends StatelessWidget {
  const Customelevatedbutton(
      {super.key,
      required this.buttonText,
      this.onPressed,
      this.backGroundColor,
      this.forGroundColor,
      this.image});
  final String buttonText;
  final void Function()? onPressed;
  final WidgetStateProperty<Color?>? backGroundColor;
  final WidgetStateProperty<Color?>? forGroundColor;
  final String? image;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return ElevatedButton(
        style: ButtonStyle(
            shadowColor: const WidgetStatePropertyAll(Colors.transparent),
            overlayColor: const WidgetStatePropertyAll(Colors.transparent),
            backgroundColor: backGroundColor ??
                WidgetStatePropertyAll(ColorPalette.lightMainColor),
            foregroundColor:
                forGroundColor ?? WidgetStatePropertyAll(ColorPalette.white),
            textStyle: WidgetStatePropertyAll(textTheme.titleLarge),
            padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(vertical: 16)),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)))),
        onPressed: onPressed,
        child: image == null
            ? Text(buttonText)
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    image!,
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(buttonText),
                ],
              ));
  }
}

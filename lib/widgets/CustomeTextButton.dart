import 'package:eventapp/app_setting_provider/app_setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/theme/ColorPalette.dart';

class Custometextbutton extends StatelessWidget {
  final String textButton;
  final void Function() onpressed;
  const Custometextbutton({super.key, required this.textButton, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<AppSettingProvider>(context);
    return TextButton(
      style: ButtonStyle(
        overlayColor:
        const WidgetStatePropertyAll(Colors.transparent),
        shadowColor:
        const WidgetStatePropertyAll(Colors.transparent),
        foregroundColor:
        WidgetStatePropertyAll(provider.themeMode==ThemeMode.light?LightColorPalette.lightMainColor:DarkColorPalette.darkMainColor),
        alignment: Alignment.centerRight,
      ),
      onPressed: onpressed,
      child: Text(
        style: TextStyle(
            decoration: TextDecoration.underline,
            decorationThickness: 2,
            decorationColor: LightColorPalette.lightMainColor),
        textButton,
      ),
    );
  }
}

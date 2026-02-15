import 'package:eventapp/app_setting_provider/app_setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/theme/ColorPalette.dart';

class Custominkwell extends StatelessWidget {
  const Custominkwell({super.key, required this.icon, required this.onTap});
  final Widget icon;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppSettingProvider>(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
            color: provider.themeMode == ThemeMode.light
                ? LightColorPalette.white
                : DarkColorPalette.darkInputs,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: provider.themeMode == ThemeMode.light
                    ? LightColorPalette.lightStroke
                    : DarkColorPalette.darkStroke)),
        padding: const EdgeInsets.all(5),
        child: icon,
      ),
    );
  }
}

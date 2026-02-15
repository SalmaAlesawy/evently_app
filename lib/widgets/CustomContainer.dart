import 'package:eventapp/app_setting_provider/app_setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/theme/ColorPalette.dart';

class Customcontainer extends StatelessWidget {
  const Customcontainer(
      {super.key,
      required this.text,
      required this.icon,
      required this.onPressed});
  final String text;
  final Widget icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppSettingProvider>(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: provider.themeMode == ThemeMode.light
              ? LightColorPalette.white
              : DarkColorPalette.darkInputs,
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: textTheme.titleMedium?.copyWith(
                color: provider.themeMode == ThemeMode.light
                    ? LightColorPalette.lightMainText
                    : DarkColorPalette.darkMainColor,
                fontWeight: FontWeight.bold),
          ),
          IconButton(
            onPressed: onPressed,
            icon: icon,
          )
        ],
      ),
    );
  }
}

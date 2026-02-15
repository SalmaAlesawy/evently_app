import 'package:eventapp/app_setting_provider/app_setting_provider.dart';
import 'package:eventapp/core/theme/ColorPalette.dart';
import 'package:eventapp/widgets/CustomeTextButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Customlisttile extends StatelessWidget {
  const Customlisttile(
      {super.key,
      required this.leading,
      required this.titleText,
      required this.trailingText,
      required this.onPressed,
      this.subtitleText});
  final Widget leading;
  final String titleText;
  final String trailingText;
  final String? subtitleText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final provider = Provider.of<AppSettingProvider>(context);
    return ListTile(
      leading: leading,
      title: Text(
        titleText,
        style: provider.themeMode == ThemeMode.light
            ? textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)
            : textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: DarkColorPalette.darkMainColor),
      ),
      trailing: Custometextbutton(
        textButton: trailingText,
        onpressed: onPressed,
      ),
      subtitle: subtitleText != null
          ? Text(
              subtitleText!,
              style: provider.themeMode == ThemeMode.light
                  ? textTheme.titleMedium
                      ?.copyWith(color: LightColorPalette.lightDarkDisable)
                  : textTheme.titleMedium
                      ?.copyWith(color: DarkColorPalette.darkSecText),
            )
          : null,
    );
  }
}

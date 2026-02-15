import 'package:eventapp/app_setting_provider/app_setting_provider.dart';
import 'package:eventapp/models/eventCategoryData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/theme/ColorPalette.dart';

class Customelistview extends StatelessWidget {
  final bool isSelected;
  const Customelistview({
    super.key,
    required this.eventCategoryData,
    required this.isSelected,
  });
  final EventCategoryData eventCategoryData;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final provider = Provider.of<AppSettingProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isSelected
            ? provider.themeMode == ThemeMode.light
                ? LightColorPalette.lightMainColor
                : DarkColorPalette.darkMainColor
            : provider.themeMode == ThemeMode.light
                ? LightColorPalette.white
                : DarkColorPalette.darkInputs,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 5,
        children: [
          Icon(
            eventCategoryData.icn,
            color: isSelected
                ? LightColorPalette.white
                : provider.themeMode == ThemeMode.light
                    ? LightColorPalette.lightMainColor
                    : DarkColorPalette.darkMainColor,
          ),
          Text(
            eventCategoryData.title,
            style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: isSelected
                    ? provider.themeMode == ThemeMode.light
                    ? LightColorPalette.white
                    : DarkColorPalette.white
                    : provider.themeMode == ThemeMode.light
                    ? LightColorPalette.lightMainText
                    : DarkColorPalette.white,),
          ),
        ],
      ),
    );
  }
}

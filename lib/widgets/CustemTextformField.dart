import 'package:eventapp/app_setting_provider/app_setting_provider.dart';
import 'package:eventapp/core/theme/ColorPalette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Custemtextformfield extends StatelessWidget {
  Custemtextformfield({
    super.key,
     this.prefixIcon,
    required this.hintText,
    this.suffixIcon,
    this.keyboardType,
    required this.obscureText,
    this.validator,
    this.controller,
     this.maxLines=1,
  });
  final Widget? prefixIcon;
  final String hintText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  bool obscureText = false;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
   int maxLines;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final provider=Provider.of<AppSettingProvider>(context);
    return SizedBox(
      child: TextFormField(
        maxLines: maxLines,
        controller: controller,
        validator: validator,
        style:  TextStyle(color:provider.themeMode==ThemeMode.light?LightColorPalette.lightSecText:DarkColorPalette.darkSecText ),
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: textTheme.bodyMedium?.copyWith(
              color:provider.themeMode==ThemeMode.light? LightColorPalette.lightSecText:DarkColorPalette.darkSecText,
            ),
            prefixIcon:prefixIcon==null?null: Padding(
              padding: const EdgeInsets.all(8.0),
              child: prefixIcon,
            ),
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none),
            fillColor:provider.themeMode==ThemeMode.light? LightColorPalette.white:DarkColorPalette.darkInputs,
            filled: true),
      ),
    );
  }
}

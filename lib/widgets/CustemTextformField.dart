import 'package:eventapp/core/theme/ColorPalette.dart';
import 'package:flutter/material.dart';


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
    return SizedBox(
      child: TextFormField(
        maxLines: maxLines,
        controller: controller,
        validator: validator,
        style: const TextStyle(color: Colors.black),
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: textTheme.bodyMedium?.copyWith(
              color: ColorPalette.lightSecText,
            ),
            prefixIcon:prefixIcon==null?null: Padding(
              padding: const EdgeInsets.all(8.0),
              child: prefixIcon,
            ),
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none),
            fillColor: ColorPalette.white,
            filled: true),
      ),
    );
  }
}

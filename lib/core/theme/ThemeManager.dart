import 'package:eventapp/core/theme/ColorPalette.dart';
import 'package:flutter/material.dart';

abstract class ThemeManager{
  static ThemeData getLightTheme(){
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: ColorPalette.lightBackGround,
      primaryColor: ColorPalette.lightMainColor,
      textTheme: TextTheme(
          titleLarge:TextStyle(
            fontFamily: "Poppins",
            fontSize: 20,
            color: ColorPalette.lightMainText,
            fontWeight: FontWeight.w600
          ),
          titleMedium:TextStyle(
              fontFamily: "Poppins",
            fontWeight:FontWeight.w400,
            fontSize: 16,
            color: ColorPalette.lightSecText
          ),
          bodyLarge: TextStyle(
              fontFamily: "Poppins",
        color: ColorPalette.lightMainColor,
        fontSize: 18,
        fontWeight: FontWeight.w500
      ),
          bodyMedium:TextStyle(
              fontFamily: "Poppins",
            color: ColorPalette.white,
            fontSize: 14,
            fontWeight: FontWeight.w600
          ),
          headlineSmall:TextStyle(
            fontFamily: "Poppins",
            color: ColorPalette.lightMainColor,
            fontSize: 24,
            fontWeight: FontWeight.w600
          )


      )

    );

  }
  static ThemeData getDarkTheme(){
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: ColorPalette.darkBackGround,
      primaryColor: ColorPalette.darkMainColor
    );
  }
}
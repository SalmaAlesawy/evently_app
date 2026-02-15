import 'package:eventapp/core/theme/ColorPalette.dart';
import 'package:flutter/material.dart';

abstract class ThemeManager{
  static ThemeData getLightTheme(){
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: LightColorPalette.lightBackGround,
      primaryColor: LightColorPalette.lightMainColor,
      textTheme: TextTheme(
          titleLarge:TextStyle(
            fontFamily: "Poppins",
            fontSize: 20,
            color: LightColorPalette.lightMainText,
            fontWeight: FontWeight.w600
          ),
          titleMedium:TextStyle(
              fontFamily: "Poppins",
            fontWeight:FontWeight.w400,
            fontSize: 16,
            color: LightColorPalette.lightSecText
          ),
          bodyLarge: TextStyle(
              fontFamily: "Poppins",
        color: LightColorPalette.lightMainColor,
        fontSize: 18,
        fontWeight: FontWeight.w500
      ),
          bodyMedium:TextStyle(
              fontFamily: "Poppins",
            color: LightColorPalette.white,
            fontSize: 14,
            fontWeight: FontWeight.w600
          ),
          headlineSmall:TextStyle(
            fontFamily: "Poppins",
            color: LightColorPalette.lightMainColor,
            fontSize: 24,
            fontWeight: FontWeight.w600
          ),
          bodySmall: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: LightColorPalette.lightDarkDisable
          )
      )
    );
  }
  static ThemeData getDarkTheme(){
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: DarkColorPalette.darkBackGround,
      primaryColor: DarkColorPalette.darkMainColor,
        textTheme: TextTheme(
    titleLarge:TextStyle(
    fontFamily: "Poppins",
        fontSize: 20,
        color: DarkColorPalette.white,
        fontWeight: FontWeight.w600
    ),
    titleMedium:TextStyle(
    fontFamily: "Poppins",
    fontWeight:FontWeight.w400,
    fontSize: 16,
    color: DarkColorPalette.darkSecText
    ),
    bodyLarge: TextStyle(
    fontFamily: "Poppins",
    color: DarkColorPalette.darkMainColor,
    fontSize: 18,
    fontWeight: FontWeight.w500
    ),
    bodyMedium:TextStyle(
    fontFamily: "Poppins",
    color: DarkColorPalette.white,
    fontSize: 14,
    fontWeight: FontWeight.w600
    ),
    headlineSmall:TextStyle(
    fontFamily: "Poppins",
    color: DarkColorPalette.darkMainColor,
    fontSize: 24,
    fontWeight: FontWeight.w600
    ),
    bodySmall: TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: DarkColorPalette.lightDarkDisable
    )



    )
    );
  }
}
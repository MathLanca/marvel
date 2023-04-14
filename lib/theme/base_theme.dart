import 'package:flutter/material.dart';
import 'package:marvel/theme/color_pallete.dart';

class BaseTheme {
  static ThemeData build() {
    const ColorScheme colorScheme = ColorScheme(
      primary: kPrimaryColor, // vermelho
      secondary: kSecondaryColor, // azul
      tertiary: kTertiaryColor,
      surface: kSurfaceColor, // branco
      background: kBackgroundColor, // verde
      error: kErrorColor, // vermelho para erros
      onPrimary: kWhiteTextColor, // branco para textos em cima de primary
      onSecondary: kWhiteTextColor, // branco para textos em cima de secondary
      onSurface: kBlackTextColor, // preto para textos em cima de surface
      onBackground: kWhiteTextColor, // branco para textos em cim a de background
      onError: kWhiteTextColor, // branco para textos em cima de error
      brightness: Brightness.light, // brilho da paleta
    );

    final ButtonThemeData buttonTheme = ButtonThemeData(
      buttonColor: colorScheme.primary,
      textTheme: ButtonTextTheme.primary,
    );

    return ThemeData(
      colorScheme: colorScheme,
      primaryColor: kPrimaryColor,
      buttonTheme: buttonTheme,
    );
  }
}

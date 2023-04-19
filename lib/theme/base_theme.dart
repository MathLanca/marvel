import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel/constants/ui_constants.dart';
import 'package:marvel/theme/color_pallete.dart';

class BaseTheme {
  static ThemeData build() {
    const ColorScheme colorScheme = ColorScheme(
      primary: kPrimaryColor, // red
      secondary: kSecondaryColor, // blue
      tertiary: kTertiaryColor, // yellow
      surface: kSurfaceColor, // white
      background: kBackgroundColor, // green
      error: kErrorColor, // red for errors
      onPrimary: kWhiteTextColor, // white for texts in primary
      onSecondary: kWhiteTextColor, // white for texts in secondary
      onTertiary: kWhiteTextColor, // white for texts in tertiary
      onSurface: kBlackTextColor, // preto for texts in surface
      onBackground: kWhiteTextColor, // white para textos em cim a de background
      onError: kWhiteTextColor, // white for texts in error
      brightness: Brightness.light,
    );

    final TextTheme textTheme = TextTheme(
      headlineLarge: TextStyle(
        fontSize: kTitleSize,
        fontWeight: FontWeight.w700,
        color: colorScheme.surface,
      ),
      headlineMedium: TextStyle(
        fontSize: kLargeSize,
        fontWeight: FontWeight.w500,
        color: colorScheme.primary,
      ),
      headlineSmall: TextStyle(
        fontSize: kRegularSize,
        fontWeight: FontWeight.w400,
        color: colorScheme.primary,
      ),
      bodyLarge: TextStyle(
        fontSize: kLargeSize,
        fontWeight: FontWeight.w500,
        color: colorScheme.onSurface,
      ),
      bodyMedium: TextStyle(
        fontSize: kRegularSize,
        fontWeight: FontWeight.w400,
        color: colorScheme.onSurface,
      ),
      bodySmall: TextStyle(
        fontSize: kRegularSize,
        fontWeight: FontWeight.w400,
        color: colorScheme.onBackground,
      ),
    );

    final ButtonThemeData buttonTheme = ButtonThemeData(
      buttonColor: colorScheme.primary,
      textTheme: ButtonTextTheme.primary,
    );

    return ThemeData(
      fontFamily: GoogleFonts.montserrat().fontFamily,
      textTheme: textTheme,
      colorScheme: colorScheme,
      primaryColor: kPrimaryColor,
      buttonTheme: buttonTheme,
    );
  }
}

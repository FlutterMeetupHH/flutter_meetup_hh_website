import 'package:flutter/material.dart';

const String kFontFamilyMontserrat = 'Montserrat';

class FMHTheme {
  final ThemeData lightTheme = ThemeData.light();

  static final Color primaryColor = Color.fromRGBO(24, 15, 67, 1);
  static final Color accentColor = Color.fromRGBO(24, 15, 67, 1);
  static final Color secondaryColor = Color.fromRGBO(104, 114, 202, 1);

  static ThemeData get themeData {
    final ColorScheme colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: primaryColor,
      primaryVariant: primaryColor,
      secondary: accentColor,
      secondaryVariant: accentColor,
      background: accentColor,
      surface: accentColor,
      onError: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      error: Colors.red.shade400,
      onBackground: Colors.white,
      onSurface: Colors.white,
    );

    final ThemeData themeData = ThemeData.from(
      colorScheme: colorScheme,
      textTheme:
          ThemeData.dark().textTheme.apply(fontFamily: kFontFamilyMontserrat),
    ).copyWith(
      cardTheme: CardTheme(
        color: secondaryColor.withOpacity(0.4),
      ),
      buttonTheme: ButtonThemeData(
        splashColor: Colors.transparent,
      ),
    );

    return themeData;
  }
}

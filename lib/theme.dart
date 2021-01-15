import 'package:flutter/material.dart';

const String kFontFamilyAntipasto = 'Antipasto';
const String kFontFamilyFiraSans = 'FiraSans';

class FMHTheme {
  final ThemeData lightTheme = ThemeData.light();

  static final Color primaryColor = Color.fromRGBO(0, 144, 234, 1);
  static final Color accentColor = Color.fromRGBO(0, 87, 139, 1);

  static ThemeData get themeData {
    ColorScheme colorScheme = ColorScheme(
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

    ThemeData themeData = ThemeData.from(
      colorScheme: colorScheme,
      textTheme:
          ThemeData.dark().textTheme.apply(fontFamily: kFontFamilyFiraSans),
    ).copyWith(
      cardTheme: CardTheme(
        color: accentColor.withOpacity(0.1),
      ),
      buttonTheme: ButtonThemeData(
        splashColor: Colors.transparent,
      ),
    );

    return themeData;
  }
}

import 'package:flutter/material.dart';
import 'package:houzeo_app/utils/constants/colors.dart';

class HouzeoAppTheme {
  static ThemeData getThemeData(Color seedColor) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          background: seedColor == blackColor
              ? lightThemeBackgroundColor
              : darkThemeBackgroundColor,
          primary: seedColor,
          surfaceTint: seedColor == blackColor
              ? lightThemeBackgroundColor
              : darkThemeBackgroundColor,
          secondary: seedColor == blackColor
              ? lighThemeSecondaryColor
              : darkThemeSecondaryColor,
          primaryContainer: seedColor == blackColor
              ? lighThemeSecondaryColor
              : darkThemeSecondaryColor,
          brightness:
              seedColor == blackColor ? Brightness.light : Brightness.dark,
          onPrimaryContainer: seedColor == blackColor
              ? lighThemeSecondaryColor
              : darkThemeSecondaryColor),
      appBarTheme: AppBarTheme(
        backgroundColor: seedColor == blackColor
            ? lightThemeBackgroundColor
            : darkThemeBackgroundColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: seedColor,
              foregroundColor: seedColor == blackColor
                  ? lightThmePrimaryColor
                  : darkThmePrimaryColor)),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: seedColor == blackColor
              ? lightThmePrimaryColor
              : darkThmePrimaryColor),
      useMaterial3: true,
      textTheme: const TextTheme(),
    );
  }

  static final lightTheme = getThemeData(blackColor);
  static final darkTheme = getThemeData(whiteColor);
}

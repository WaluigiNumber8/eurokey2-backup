import 'package:euk2_project/themes/theme_utils.dart';
import 'package:flutter/material.dart';

ThemeData defaultLightTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.light,
    primarySwatch: createMaterialColor(Colors.deepOrangeAccent),
  ).copyWith(
    secondary: const Color(0xFFE95473),
  ),
  appBarTheme: const AppBarTheme(
    foregroundColor: Colors.white,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.deepOrangeAccent,
  ),
);

ThemeData defaultDarkTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch(
  brightness: Brightness.dark,
    primarySwatch: createMaterialColor(Colors.deepOrangeAccent),
  ).copyWith(
    secondary: const Color(0xFFD6568B),
  ),
  appBarTheme: const AppBarTheme(
    foregroundColor: Colors.white,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.deepOrangeAccent,
  ),
);

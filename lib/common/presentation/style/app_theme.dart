import 'package:flutter/material.dart';
import 'package:flutter_case/common/presentation/style/app_colours.dart';

class ThemeManger extends ChangeNotifier {
  // default mode for theme
  ThemeMode themeMode = ThemeMode.dark;
  // to check current theme is whether dark or light
  bool get isDarkTheme => themeMode == ThemeMode.dark;
  //
  void toggleTheme(bool isOn){
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: LightThemeColour.primaryColour,
        colorScheme: ColorScheme.light(),
        backgroundColor: LightThemeColour.backgroundColour,
        scaffoldBackgroundColor: LightThemeColour.scaffoldBackgroundColour);
  }

  static ThemeData get darkTheme {
    return ThemeData(
        primaryColor: DarkThemeColour.primaryColour,
        colorScheme: ColorScheme.dark(),
        backgroundColor: DarkThemeColour.backgroundColour,
        scaffoldBackgroundColor: DarkThemeColour.scaffoldBackgroundColour);
  }
}

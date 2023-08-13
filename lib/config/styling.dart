import 'package:flutter/material.dart';

class TextStyles {
  TextStyle headingStyle = const TextStyle(
      fontFamily: 'poppins',
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: Colors.black);
  TextStyle headingStyleWhite = const TextStyle(
      fontFamily: 'poppins', fontWeight: FontWeight.w700, color: Colors.white);
  TextStyle paraStyle = const TextStyle(
      fontFamily: 'poppins',
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.black);
  TextStyle paraStyleWhite = const TextStyle(
      fontFamily: 'poppins',
      fontWeight: FontWeight.normal,
      color: Colors.white);
  TextStyle introStyle = const TextStyle(
      fontFamily: 'poppins',
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.italic,
      color: Colors.black);
  TextStyle introStyleWhite = const TextStyle(
      fontFamily: 'poppins',
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.italic,
      color: Colors.white);
}

class ColorSchemes {
  static Color ForestGreen = const Color(0xff2f6545);
  static Color backgroundWhite = const Color(0xffefeeee);
  static Color DarkForestGreen = const Color(0xff253b26);
  static Color BackgroundBlack = const Color(0xff101010);
  static Color GreyWhite = const Color(0xffa6aba1);
  static Color LeafGreen = const Color(0xff7c9467);
}

class ThemeNotifier with ChangeNotifier {
  final darkTheme = ThemeData(
    primaryColor: ColorSchemes.BackgroundBlack,
    brightness: Brightness.dark,
    dividerColor: ColorSchemes.DarkForestGreen,
  );

  final lightTheme = ThemeData(
    primaryColor: Colors.white,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: ColorSchemes.backgroundWhite,
    ),
    dividerColor: Colors.white54,
  );

  ThemeData? _themeData;
  ThemeData getTheme() => _themeData!;

  void setDarkMode() async {
    _themeData = darkTheme;
  }

  void setLightMode() async {
    _themeData = lightTheme;
  }
}

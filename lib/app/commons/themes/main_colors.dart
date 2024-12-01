import 'package:flutter/material.dart';

class MainColors {
  static Color primaryColor = const Color.fromARGB(255, 87, 96, 179);
  static Color primaryDarkColor = const Color.fromARGB(255, 23, 26, 51);
  static Color secondaryColor = const Color.fromARGB(255, 130, 230, 255);
  static Color secondaryDarkColor = const Color.fromARGB(255, 36, 113, 133);
  static Color textColor = const Color.fromARGB(255, 27, 29, 28);
  static Color textDarkColor = const Color.fromARGB(255, 255, 255, 255);
  static Color darkColor = const Color.fromARGB(255, 27, 29, 28);
  static Color canvasDarkColor = const Color.fromARGB(255, 32, 32, 41);
  static Color canvasColor = const Color.fromARGB(255, 255, 255, 255);
  static Color whiteColor = const Color.fromARGB(255, 253, 253, 253);
  static Color errorColor = const Color.fromARGB(255, 231, 91, 81);
  static Color dangerColor = const Color.fromARGB(255, 190, 88, 88);
  static Color successColor = const Color.fromARGB(255, 99, 172, 144);
  static Color warningColor = const Color.fromARGB(255, 196, 188, 124);
  static Color infoColor = const Color.fromARGB(255, 49, 126, 189);
  static Color dividerColor = Colors.grey.shade200;
  static Color borderColor = Colors.grey.shade200;
  static Color scaffoldBackgroundColor =
      const Color.fromARGB(255, 240, 242, 255);
  static Color scaffoldDarkBackgroundColor =
      const Color.fromARGB(255, 19, 22, 21);

  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}

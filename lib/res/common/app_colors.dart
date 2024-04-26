
import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors{
  const AppColors();
  static const black = Color(0xFF011627);
  static const base = Color(0xFFFDFFFC);
  static const  positive = Color(0xFF2EC4B6);
  static const  red = Color(0xFFE71D36);
  static const  neutral = Color(0xFFFF9F1C);
}
MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:passmanager/constant/config.dart';

const blue = Color(0xFF0056D8);
const red = Color(0xFFD80000);
const orange = Color(0xFFD86800);
const black = Color(0xFF000000);
const white = Color(0xFFFFFFFF);
const green = Color(0xFF329A4B);
const grey = Colors.grey;

/// Список цветов которые будут выдаваться пользователю
const List<Color> colorAvatar = [
  Color(0xFF7965C1),
  Color(0xFFDD4554),
  Color(0xFFA46EB9),
  Color(0xFFCB4F87),
  Color(0xFF155DBF),
  Color(0xFF8EEAEA),
  Color(0xFFDB863B),
  Color(0xFF7087EF),
  Color(0xFF0D90E0),
  Color(0xFF329A4B),
];

/// Функция выдачи цвета в зависимости от id пользователя
Color GenerateColor(userId) {
  int colorIndex = userId - ((userId / 10).ceil() * 10);
  print(colorIndex);
  return colorAvatar[colorIndex.abs()];
}

/*
  Класс отвечающий за перевод цвета из Colors в MaterialColor
 */
class ColorGenerateMaterial {
  MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(color.value, {
      50: tintColor(color, 0.9),
      100: tintColor(color, 0.8),
      200: tintColor(color, 0.6),
      300: tintColor(color, 0.4),
      400: tintColor(color, 0.2),
      500: color,
      600: shadeColor(color, 0.1),
      700: shadeColor(color, 0.2),
      800: shadeColor(color, 0.3),
      900: shadeColor(color, 0.4),
    });
  }

  int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  Color tintColor(Color color, double factor) => Color.fromRGBO(
      tintValue(color.red, factor),
      tintValue(color.green, factor),
      tintValue(color.blue, factor),
      1);

  int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  Color shadeColor(Color color, double factor) => Color.fromRGBO(
      shadeValue(color.red, factor),
      shadeValue(color.green, factor),
      shadeValue(color.blue, factor),
      1);
}

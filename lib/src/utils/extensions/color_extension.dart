import 'package:flutter/material.dart';

extension HexColor on Color {
  static Color fromHex(String hexColorCode) {
    hexColorCode = hexColorCode.replaceAll('#', '');
    if (hexColorCode.length == 6 || hexColorCode.length == 7) {
      hexColorCode = 'FF$hexColorCode';
    }
    return Color(int.parse(hexColorCode, radix: 16));
  }
}
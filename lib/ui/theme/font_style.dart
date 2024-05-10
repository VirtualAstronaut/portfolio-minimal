import 'package:flutter/material.dart';

class Fonts {
  static const body = 'ChakraPetch';
  static const all = 'ChakraPetch';
}

class FontSizes {
  static double scale = 1;
  static double get displayLarge => 60 * scale;
  static double get displayMedium => 40 * scale;
  static double get displaySmall => 20 * scale;
  static double get header => 24 * scale;
  static double get body => 15 * scale;
}

class TextStyles {
  static TextStyle get allFont => const TextStyle(fontFamily: Fonts.all);
  static TextStyle get bodyFont => const TextStyle(fontFamily: Fonts.body);
  static const initialColor = Colors.white;
  static TextStyle get displayLarge => allFont.copyWith(
        fontSize: FontSizes.displayLarge,
        color: initialColor,
        fontFamily: Fonts.all,
      );
  static TextStyle get displayMedium => allFont.copyWith(
        fontSize: FontSizes.displayMedium,
        color: initialColor,
        fontFamily: Fonts.all,
      );
  static TextStyle get displaySmall => allFont.copyWith(
        fontSize: FontSizes.displaySmall,
        color: initialColor,
        fontFamily: Fonts.all,
      );
  static TextStyle get body => allFont.copyWith(
        color: initialColor,
        fontSize: FontSizes.body,
        fontFamily: Fonts.all,
      );
  static TextStyle get header => allFont.copyWith(
        color: initialColor,
        fontSize: FontSizes.header,
        fontFamily: Fonts.all,
      );
}

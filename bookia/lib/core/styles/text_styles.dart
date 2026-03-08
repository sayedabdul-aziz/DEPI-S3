import 'package:bookia/core/styles/colors.dart';
import 'package:flutter/material.dart';

abstract class TextStyles {
  static const TextStyle headline = TextStyle(fontSize: 30);
  static const TextStyle title = TextStyle(fontSize: 24);
  static const TextStyle subtitle1 = TextStyle(fontSize: 20);
  static const TextStyle subtitle2 = TextStyle(fontSize: 18);
  static const TextStyle body = TextStyle(fontSize: 16);
  static const TextStyle caption1 = TextStyle(fontSize: 14);
  static const TextStyle caption2 = TextStyle(
    fontSize: 12,
    color: AppColors.greyColor,
  );
}

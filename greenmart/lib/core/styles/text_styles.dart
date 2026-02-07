import 'package:flutter/material.dart';
import 'package:greenmart/core/styles/app_colors.dart';

class TextStyles {
  static TextStyle headline = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w600,
  );

  static TextStyle title = TextStyle(fontSize: 22, fontWeight: FontWeight.w600);

  static TextStyle subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static TextStyle body = TextStyle(fontSize: 16);

  static TextStyle caption1 = TextStyle(fontSize: 14);

  static TextStyle caption2 = TextStyle(
    fontSize: 12,
    color: AppColors.greyColor,
  );
}

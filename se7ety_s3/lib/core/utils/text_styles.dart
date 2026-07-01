import 'package:flutter/material.dart';
import 'package:se7ety/core/utils/colors.dart';

class TextStyles {
  static TextStyle headline = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static TextStyle title = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );
  static TextStyle body = const TextStyle(fontSize: 16);
  static TextStyle small = const TextStyle(fontSize: 14);
  static TextStyle caption = const TextStyle(fontSize: 12);
}

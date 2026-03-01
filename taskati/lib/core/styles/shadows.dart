import 'package:flutter/material.dart';
import 'package:taskati/core/styles/app_colors.dart';

class AppShadows {
  static List<BoxShadow> defaultShadow = [
    BoxShadow(
      color: AppColors.primaryColor.withValues(alpha: .1),
      blurRadius: 5,
      offset: const Offset(0, 3),
    ),
  ];
}

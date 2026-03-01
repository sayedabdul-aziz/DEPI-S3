import 'package:flutter/material.dart';
import 'package:taskati/core/services/hive_helper.dart';

extension ThemeExtension on BuildContext {
  bool get isDark => HiveHelper.getCachedThemeMode();
  ThemeData get theme => Theme.of(this);
  Color get cardColor => theme.cardColor;
  Color? get iconColor => theme.iconTheme.color;
}

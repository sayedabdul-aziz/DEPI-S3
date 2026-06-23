import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

bool isArabic(BuildContext context) {
  return context.locale.languageCode == 'ar';
}

extension Localization on BuildContext {
  bool get isArabic => locale.languageCode == 'ar';
}

extension SpacingValue on num {
  Widget get h => SizedBox(height: toDouble());
  Widget get w => SizedBox(width: toDouble());
}




// isArabic(context) => Function
// context.isArabic => Extension

// 4.isArabic

// 4.h // SizedBox()
// 5.w